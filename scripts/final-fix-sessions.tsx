import * as fs from 'fs'
import * as path from 'path'

const SQL_COMBINED_DIR = '/Users/tombrady/Documents/GitHub/TheLift/sql-combined'

function fixSessionReferences(content: string): string {
  console.log('Applying final fix to session references...')

  // Fix the UNKNOWN child_id issue by using the actual child_id from the same INSERT
  content = content.replace(
    /WHERE child_id = 'UNKNOWN'/g,
    (match, offset) => {
      // Look for the actual child_id in the same INSERT statement
      const before = content.substring(Math.max(0, offset - 200), offset + 200)

      // Extract the real child_id from the VALUES clause
      const childIdMatch = before.match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
      if (childIdMatch) {
        return `WHERE child_id = '${childIdMatch[1]}'`
      }

      return match
    }
  )

  return content
}

async function main() {
  console.log('🔧 Final fix for session references in SQL files\n')

  const files = fs.readdirSync(SQL_COMBINED_DIR)
    .filter(f => f.startsWith('combined_') && f.endsWith('.sql'))
    .sort()

  for (const file of files) {
    const filepath = path.join(SQL_COMBINED_DIR, file)
    console.log(`📝 Fixing ${file}...`)

    let content = fs.readFileSync(filepath, 'utf-8')

    // Count UNKNOWN references before
    const unknownBefore = (content.match(/WHERE child_id = 'UNKNOWN'/g) || []).length

    // Apply fix
    content = fixSessionReferences(content)

    // Count after
    const unknownAfter = (content.match(/WHERE child_id = 'UNKNOWN'/g) || []).length

    fs.writeFileSync(filepath, content)

    console.log(`  ✅ Fixed ${unknownBefore - unknownAfter} UNKNOWN references`)
    console.log(`  📊 Remaining UNKNOWN: ${unknownAfter}\n`)
  }

  console.log('✅ Final fixes complete!')
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Error:', error)
    process.exit(1)
  })