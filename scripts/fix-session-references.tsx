import * as fs from 'fs'
import * as path from 'path'

const SQL_COMBINED_DIR = '/Users/tombrady/Documents/GitHub/TheLift/sql-combined'

function fixSessionReferences(content: string): string {
  console.log('Fixing session references to maintain foreign key relationships...')

  // Split content into lines for processing
  const lines = content.split('\n')
  const processedLines: string[] = []

  let lastSessionChildId = ''
  let lastSessionStartTime = ''

  for (let i = 0; i < lines.length; i++) {
    let line = lines[i]

    // Track session inserts to know the child_id and time for reference
    if (line.includes('INSERT INTO public.checkin_sessions')) {
      // Find the child_id and started_at in the next few lines
      for (let j = i + 1; j < Math.min(i + 20, lines.length); j++) {
        // Extract child_id
        const childMatch = lines[j].match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
        if (childMatch && !lastSessionChildId) {
          lastSessionChildId = childMatch[1]
        }

        // Extract started_at timestamp
        const timeMatch = lines[j].match(/'(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\+\d{2})'/)
        if (timeMatch && !lastSessionStartTime) {
          lastSessionStartTime = timeMatch[1]
        }

        // Stop if we've found both
        if (lastSessionChildId && lastSessionStartTime) {
          break
        }
      }
    }

    // Fix session_id references in tool usage tables
    if (line.includes('INSERT INTO public.mood_meter_usage') ||
        line.includes('INSERT INTO public.breathing_tool_usage') ||
        line.includes('INSERT INTO public.emotion_grid_usage') ||
        line.includes('INSERT INTO public.wellbeing_wheel_usage')) {

      // Process the VALUES clause
      let inValues = false
      for (let j = i; j < Math.min(i + 50, lines.length); j++) {
        if (lines[j].includes('VALUES')) {
          inValues = true
        }

        if (inValues && lines[j].includes('gen_random_uuid()') && j > i + 2) {
          // This is likely the session_id field (usually second gen_random_uuid())
          // Check if previous line has gen_random_uuid() for the id field
          if (lines[j-1].includes('gen_random_uuid()')) {
            // Replace with a subquery to get the most recent session for this child
            lines[j] = lines[j].replace(
              'gen_random_uuid()',
              `(SELECT id FROM public.checkin_sessions WHERE child_id = '${lastSessionChildId}' AND started_at = '${lastSessionStartTime}')`
            )
            console.log(`  Fixed session reference for ${lastSessionChildId.substring(0, 8)}... at ${lastSessionStartTime}`)
            break
          }
        }

        if (lines[j].includes(');')) {
          break
        }
      }
    }

    processedLines.push(line)
  }

  return processedLines.join('\n')
}

// Alternative approach: Use a more reliable pattern matching
function fixWithPatternMatching(content: string): string {
  console.log('Using pattern-based approach to fix session references...')

  // Pattern to match session_id field in VALUES clause
  // This matches: (gen_random_uuid(), gen_random_uuid(), 'child_id', ...)
  // Where the second gen_random_uuid() is the session_id

  // For mood_meter_usage
  content = content.replace(
    /INSERT INTO public\.mood_meter_usage[\s\S]*?VALUES[\s\S]*?\(\s*gen_random_uuid\(\),\s*gen_random_uuid\(\)/g,
    (match) => {
      // Extract child_id from the same INSERT statement
      const childIdMatch = match.match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
      const childId = childIdMatch ? childIdMatch[1] : 'UNKNOWN'

      // Replace the second gen_random_uuid() with a subquery
      return match.replace(
        /gen_random_uuid\(\),\s*gen_random_uuid\(\)/,
        `gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = '${childId}' ORDER BY created_at DESC LIMIT 1)`
      )
    }
  )

  // For breathing_tool_usage
  content = content.replace(
    /INSERT INTO public\.breathing_tool_usage[\s\S]*?VALUES[\s\S]*?\(\s*gen_random_uuid\(\),\s*gen_random_uuid\(\)/g,
    (match) => {
      const childIdMatch = match.match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
      const childId = childIdMatch ? childIdMatch[1] : 'UNKNOWN'

      return match.replace(
        /gen_random_uuid\(\),\s*gen_random_uuid\(\)/,
        `gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = '${childId}' ORDER BY created_at DESC LIMIT 1)`
      )
    }
  )

  // For emotion_grid_usage
  content = content.replace(
    /INSERT INTO public\.emotion_grid_usage[\s\S]*?VALUES[\s\S]*?\(\s*gen_random_uuid\(\),\s*gen_random_uuid\(\)/g,
    (match) => {
      const childIdMatch = match.match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
      const childId = childIdMatch ? childIdMatch[1] : 'UNKNOWN'

      return match.replace(
        /gen_random_uuid\(\),\s*gen_random_uuid\(\)/,
        `gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = '${childId}' ORDER BY created_at DESC LIMIT 1)`
      )
    }
  )

  // For wellbeing_wheel_usage
  content = content.replace(
    /INSERT INTO public\.wellbeing_wheel_usage[\s\S]*?VALUES[\s\S]*?\(\s*gen_random_uuid\(\),\s*gen_random_uuid\(\)/g,
    (match) => {
      const childIdMatch = match.match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
      const childId = childIdMatch ? childIdMatch[1] : 'UNKNOWN'

      return match.replace(
        /gen_random_uuid\(\),\s*gen_random_uuid\(\)/,
        `gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = '${childId}' ORDER BY created_at DESC LIMIT 1)`
      )
    }
  )

  // Fix emotion_grid_feelings references to emotion_grid_usage
  content = content.replace(
    /INSERT INTO public\.emotion_grid_feelings[\s\S]*?VALUES[\s\S]*?\(\s*gen_random_uuid\(\),\s*\(SELECT id FROM public\.emotion_grid_usage WHERE session_id = gen_random_uuid\(\)\)/g,
    (match) => {
      const childIdMatch = match.match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
      const childId = childIdMatch ? childIdMatch[1] : 'UNKNOWN'

      return match.replace(
        /\(SELECT id FROM public\.emotion_grid_usage WHERE session_id = gen_random_uuid\(\)\)/,
        `(SELECT id FROM public.emotion_grid_usage WHERE child_id = '${childId}' ORDER BY created_at DESC LIMIT 1)`
      )
    }
  )

  // Fix wellbeing_wheel_sections references
  content = content.replace(
    /\(SELECT id FROM public\.wellbeing_wheel_usage WHERE session_id = gen_random_uuid\(\)\)/g,
    (match, offset) => {
      // Find the child_id in context
      const before = content.substring(Math.max(0, offset - 500), offset)
      const childIdMatch = before.match(/'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'/)
      const childId = childIdMatch ? childIdMatch[1] : 'UNKNOWN'

      return `(SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = '${childId}' ORDER BY created_at DESC LIMIT 1)`
    }
  )

  return content
}

async function main() {
  console.log('🔧 Fixing session references in combined SQL files\n')

  // Get all combined SQL files
  const files = fs.readdirSync(SQL_COMBINED_DIR)
    .filter(f => f.startsWith('combined_') && f.endsWith('.sql'))
    .sort()

  console.log(`Found ${files.length} combined SQL files to fix\n`)

  for (const file of files) {
    const filepath = path.join(SQL_COMBINED_DIR, file)
    console.log(`📝 Processing ${file}...`)

    // Read file
    const content = fs.readFileSync(filepath, 'utf-8')

    // Fix the references
    const fixedContent = fixWithPatternMatching(content)

    // Count the fixes
    const subqueryCount = (fixedContent.match(/SELECT id FROM public\./g) || []).length

    // Write back
    fs.writeFileSync(filepath, fixedContent)

    console.log(`  ✅ Added ${subqueryCount} proper session references\n`)
  }

  console.log('✅ Session reference fixes complete!')
  console.log('\n📝 The SQL files now properly reference sessions using subqueries.')
  console.log('This maintains foreign key integrity while still using gen_random_uuid().')
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Error:', error)
    process.exit(1)
  })