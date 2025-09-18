import { getSupabaseClient } from '../src/utils/supabase/client.tsx'
import * as fs from 'fs'
import * as path from 'path'
import * as readline from 'readline'

const supabase = getSupabaseClient()

// Configuration
const SQL_FILE_PATH = '/Users/tombrady/Documents/GitHub/TheLift/all_children_complete_journeys_20250916_193517.sql'
const BATCH_SIZE = 50 // Number of INSERT statements per batch
const DELAY_BETWEEN_BATCHES = 500 // milliseconds

interface SQLBatch {
  statements: string[]
  childName?: string
  sessionNumber?: number
}

async function parseSQLFile(): Promise<SQLBatch[]> {
  console.log('📖 Reading SQL file...')

  const fileStream = fs.createReadStream(SQL_FILE_PATH)
  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  })

  const batches: SQLBatch[] = []
  let currentBatch: SQLBatch = { statements: [] }
  let currentStatement = ''
  let inStatement = false
  let statementCount = 0
  let currentChildName = ''

  for await (const line of rl) {
    // Track which child we're processing
    if (line.includes("-- Emma's Complete Journey") ||
        line.includes("-- Session") ||
        line.includes("Journey") && line.includes("sessions")) {
      const nameMatch = line.match(/-- (\w+)'s|-- (\w+) Session/)
      if (nameMatch) {
        currentChildName = nameMatch[1] || nameMatch[2] || currentChildName
      }
    }

    // Skip comments and empty lines (unless inside a statement)
    if (!inStatement && (line.trim().startsWith('--') || line.trim() === '')) {
      continue
    }

    // Check if this line starts an INSERT statement
    if (line.trim().startsWith('INSERT INTO')) {
      inStatement = true
      currentStatement = line
    } else if (inStatement) {
      currentStatement += '\n' + line

      // Check if statement is complete (ends with semicolon)
      if (line.trim().endsWith(';')) {
        inStatement = false
        currentBatch.statements.push(currentStatement)
        currentBatch.childName = currentChildName
        statementCount++

        // Create new batch if current one is full
        if (currentBatch.statements.length >= BATCH_SIZE) {
          batches.push(currentBatch)
          currentBatch = { statements: [], childName: currentChildName }
          console.log(`  Created batch ${batches.length} (${BATCH_SIZE} statements)`)
        }

        currentStatement = ''
      }
    }
  }

  // Add any remaining statements
  if (currentBatch.statements.length > 0) {
    batches.push(currentBatch)
  }

  console.log(`✅ Parsed ${statementCount} SQL statements into ${batches.length} batches`)
  return batches
}

async function executeBatch(batch: SQLBatch, batchNumber: number, totalBatches: number): Promise<boolean> {
  try {
    console.log(`\n📦 Executing batch ${batchNumber}/${totalBatches}`)
    if (batch.childName) {
      console.log(`   Processing: ${batch.childName}`)
    }
    console.log(`   Statements: ${batch.statements.length}`)

    // Execute each statement in the batch
    for (let i = 0; i < batch.statements.length; i++) {
      const statement = batch.statements[i]

      try {
        // Parse the SQL to extract the table name for proper execution
        const tableMatch = statement.match(/INSERT INTO public\.(\w+)/)
        if (!tableMatch) {
          console.error(`   ❌ Could not parse table from statement ${i + 1}`)
          continue
        }

        const tableName = tableMatch[1]

        // Extract the VALUES part and convert to object
        // This is a simplified approach - for production, use a proper SQL parser
        const valuesMatch = statement.match(/VALUES\s*\(([\s\S]+)\)/i)
        if (!valuesMatch) {
          console.error(`   ❌ Could not parse VALUES from statement ${i + 1}`)
          continue
        }

        // For now, we'll execute the raw SQL using a different approach
        // Since Supabase client doesn't support raw SQL directly, we need to use RPC

        // Alternative: Save to file and execute manually
        // For this implementation, we'll save chunks to files

      } catch (error) {
        console.error(`   ❌ Error executing statement ${i + 1}:`, error)
      }
    }

    console.log(`   ✅ Batch ${batchNumber} processed`)
    return true
  } catch (error) {
    console.error(`❌ Error executing batch ${batchNumber}:`, error)
    return false
  }
}

async function saveChunksToFiles(batches: SQLBatch[]) {
  console.log('\n💾 Saving SQL chunks to files for manual execution...')

  const outputDir = '/Users/tombrady/Documents/GitHub/TheLift/sql-chunks'

  // Create output directory if it doesn't exist
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true })
  }

  // Group batches into larger chunks for Supabase SQL editor (around 1000 lines each)
  const LINES_PER_FILE = 1000
  let fileNumber = 1
  let currentFileContent = ''
  let currentLineCount = 0

  for (let i = 0; i < batches.length; i++) {
    const batch = batches[i]
    const batchContent = batch.statements.join('\n\n')
    const batchLines = batchContent.split('\n').length

    // Add batch header
    const header = `-- Batch ${i + 1}/${batches.length}${batch.childName ? ` - ${batch.childName}` : ''}\n`

    if (currentLineCount + batchLines > LINES_PER_FILE && currentFileContent) {
      // Save current file
      const filename = `chunk_${String(fileNumber).padStart(3, '0')}.sql`
      const filepath = path.join(outputDir, filename)

      // Add header to file
      const fileHeader = `-- SQL Chunk ${fileNumber}\n-- Lines: ~${currentLineCount}\n-- Generated from: all_children_complete_journeys_20250916_193517.sql\n\n`

      fs.writeFileSync(filepath, fileHeader + currentFileContent)
      console.log(`  ✅ Created ${filename} (~${currentLineCount} lines)`)

      // Start new file
      fileNumber++
      currentFileContent = header + batchContent
      currentLineCount = batchLines
    } else {
      currentFileContent += '\n' + header + batchContent
      currentLineCount += batchLines
    }
  }

  // Save last file
  if (currentFileContent) {
    const filename = `chunk_${String(fileNumber).padStart(3, '0')}.sql`
    const filepath = path.join(outputDir, filename)

    const fileHeader = `-- SQL Chunk ${fileNumber}\n-- Lines: ~${currentLineCount}\n-- Generated from: all_children_complete_journeys_20250916_193517.sql\n\n`

    fs.writeFileSync(filepath, fileHeader + currentFileContent)
    console.log(`  ✅ Created ${filename} (~${currentLineCount} lines)`)
  }

  console.log(`\n📂 Created ${fileNumber} SQL chunk files in: ${outputDir}`)
  console.log('\n📝 NEXT STEPS:')
  console.log('1. Go to Supabase SQL Editor')
  console.log('2. Execute each chunk file in order (chunk_001.sql, chunk_002.sql, etc.)')
  console.log('3. Wait a few seconds between each chunk to avoid rate limits')
  console.log('\nAlternatively, use the execute-chunks script to run them programmatically')
}

async function main() {
  console.log('🚀 Starting SQL file processing...\n')

  try {
    // Parse the SQL file into batches
    const batches = await parseSQLFile()

    // Save chunks to files for manual execution
    await saveChunksToFiles(batches)

    // Show summary
    console.log('\n📊 Summary:')
    console.log(`  Total statements: ${batches.reduce((sum, b) => sum + b.statements.length, 0)}`)
    console.log(`  Total batches: ${batches.length}`)

    // Count unique children
    const uniqueChildren = new Set(batches.map(b => b.childName).filter(Boolean))
    console.log(`  Unique children: ${uniqueChildren.size}`)

  } catch (error) {
    console.error('❌ Error:', error)
    process.exit(1)
  }
}

main()
  .then(() => {
    console.log('\n✅ SQL splitting complete!')
    process.exit(0)
  })
  .catch((error) => {
    console.error('Fatal error:', error)
    process.exit(1)
  })