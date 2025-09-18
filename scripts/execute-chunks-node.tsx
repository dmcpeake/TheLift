import { createClient } from '@supabase/supabase-js'
import * as fs from 'fs'
import * as path from 'path'

// Supabase configuration
const supabaseUrl = 'https://xssxgnqkqfkcxtcbddgn.supabase.co'
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'YOUR_SERVICE_ROLE_KEY_HERE'

// IMPORTANT: You need to set the service role key for this to work
// Get it from: Supabase Dashboard > Settings > API > service_role (secret)

const supabase = createClient(supabaseUrl, supabaseServiceKey)

const CHUNKS_DIR = '/Users/tombrady/Documents/GitHub/TheLift/sql-chunks'
const DELAY_BETWEEN_CHUNKS = 1000 // 1 second delay between chunks

async function executeChunk(filepath: string, chunkNumber: number, total: number): Promise<boolean> {
  try {
    console.log(`\n📦 Executing chunk ${chunkNumber}/${total}: ${path.basename(filepath)}`)

    const sql = fs.readFileSync(filepath, 'utf-8')

    // Split into individual statements
    const statements = sql
      .split(';')
      .map(s => s.trim())
      .filter(s => s && !s.startsWith('--'))

    console.log(`   Statements to execute: ${statements.length}`)

    let successCount = 0
    let errorCount = 0

    for (let i = 0; i < statements.length; i++) {
      const statement = statements[i]

      if (!statement || statement.length < 10) continue

      try {
        // Use Supabase RPC to execute raw SQL
        // Note: This requires a custom RPC function in Supabase
        // Alternative: Parse and convert to Supabase client operations

        // For now, we'll parse INSERT statements and convert them
        if (statement.includes('INSERT INTO')) {
          // This is a simplified approach - in production, use a proper SQL parser
          console.log(`   ⚠️  Direct SQL execution not available via Supabase client`)
          console.log(`   📝  Please execute chunks manually via Supabase SQL Editor`)
          return false
        }

        successCount++
      } catch (error) {
        errorCount++
        console.error(`   ❌ Error in statement ${i + 1}:`, error)
      }
    }

    console.log(`   ✅ Completed: ${successCount} successful, ${errorCount} errors`)
    return errorCount === 0

  } catch (error) {
    console.error(`❌ Error executing chunk ${chunkNumber}:`, error)
    return false
  }
}

async function main() {
  console.log('🚀 SQL Chunk Executor (Node.js Version)\n')

  // Check for service role key
  if (supabaseServiceKey === 'YOUR_SERVICE_ROLE_KEY_HERE') {
    console.log('⚠️  IMPORTANT: Service role key not set!')
    console.log('\nTo execute SQL directly, you need to:')
    console.log('1. Get your service_role key from Supabase Dashboard > Settings > API')
    console.log('2. Set it as environment variable: export SUPABASE_SERVICE_ROLE_KEY="your-key"')
    console.log('3. Re-run this script\n')
    console.log('Alternative: Use the manual method below ⬇️\n')
  }

  // Get all chunk files
  const chunkFiles = fs.readdirSync(CHUNKS_DIR)
    .filter(f => f.startsWith('chunk_') && f.endsWith('.sql'))
    .sort()

  console.log(`📂 Found ${chunkFiles.length} SQL chunks\n`)

  // Show manual execution instructions
  console.log('📝 MANUAL EXECUTION INSTRUCTIONS:')
  console.log('====================================')
  console.log('Since direct SQL execution requires special setup, here\'s how to do it manually:\n')
  console.log('1. Open Supabase SQL Editor: https://supabase.com/dashboard/project/xssxgnqkqfkcxtcbddgn/sql')
  console.log('2. Execute chunks in batches of 5-10 at a time:')
  console.log('\n   BATCH 1 (chunks 1-10):')

  for (let i = 0; i < Math.min(10, chunkFiles.length); i++) {
    console.log(`   - Open sql-chunks/${chunkFiles[i]} and paste into SQL editor`)
  }

  console.log('\n3. Click "Run" and wait for completion')
  console.log('4. Repeat with next batch (chunks 11-20, 21-30, etc.)')
  console.log('\n💡 TIP: You can paste multiple chunks at once, just ensure total size < 100KB')

  // Create combined chunks for easier execution
  console.log('\n🔧 Creating combined chunks for easier manual execution...')

  const COMBINED_DIR = path.join(path.dirname(CHUNKS_DIR), 'sql-combined')
  if (!fs.existsSync(COMBINED_DIR)) {
    fs.mkdirSync(COMBINED_DIR, { recursive: true })
  }

  // Combine chunks into larger files (10 chunks each)
  const CHUNKS_PER_FILE = 10
  let combinedNumber = 1

  for (let i = 0; i < chunkFiles.length; i += CHUNKS_PER_FILE) {
    const batch = chunkFiles.slice(i, i + CHUNKS_PER_FILE)
    let combinedContent = `-- Combined SQL Batch ${combinedNumber}\n`
    combinedContent += `-- Contains chunks ${i + 1} to ${Math.min(i + CHUNKS_PER_FILE, chunkFiles.length)}\n\n`

    for (const file of batch) {
      const content = fs.readFileSync(path.join(CHUNKS_DIR, file), 'utf-8')
      combinedContent += `\n-- From ${file}\n${content}\n`
    }

    const combinedFile = path.join(COMBINED_DIR, `combined_${String(combinedNumber).padStart(2, '0')}.sql`)
    fs.writeFileSync(combinedFile, combinedContent)
    console.log(`  ✅ Created ${path.basename(combinedFile)} (${batch.length} chunks)`)
    combinedNumber++
  }

  console.log(`\n📂 Combined files saved to: ${COMBINED_DIR}`)
  console.log('   These are easier to paste into Supabase SQL Editor (fewer files)')

  // Verify current data status
  console.log('\n📊 Checking current database status...')

  const { count: sessionCount } = await supabase
    .from('checkin_sessions')
    .select('*', { count: 'exact', head: true })
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')

  const { count: emotionCount } = await supabase
    .from('emotion_grid_usage')
    .select('*', { count: 'exact', head: true })

  console.log(`   Current sessions (Jan-Mar 2025): ${sessionCount || 0}`)
  console.log(`   Current emotion grid entries: ${emotionCount || 0}`)

  if (sessionCount && sessionCount > 900) {
    console.log('\n⚠️  WARNING: Database already has significant data.')
    console.log('   Running these chunks may create duplicates.')
    console.log('   Consider clearing existing data first if you want a clean import.')
  }
}

main()
  .then(() => {
    console.log('\n✅ Preparation complete!')
    process.exit(0)
  })
  .catch((error) => {
    console.error('Fatal error:', error)
    process.exit(1)
  })