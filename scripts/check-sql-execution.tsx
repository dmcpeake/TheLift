import { getSupabaseClient } from '../src/utils/supabase/client.tsx'

const supabase = getSupabaseClient()

async function checkSQLExecution() {
  console.log('Checking if SQL file has been executed...\n')

  // Check for Aisha Patel's data (first child in the SQL)
  const aishaId = '1d0d16ae-2aa0-4d72-9abc-fd641147291f'

  // Check checkin_sessions
  const { data: sessions, error: sessionsError } = await supabase
    .from('checkin_sessions')
    .select('*')
    .eq('child_id', aishaId)
    .order('started_at', { ascending: true })

  console.log(`Aisha Patel (${aishaId}):`)
  console.log(`- Check-in sessions: ${sessions?.length || 0}`)

  if (sessions && sessions.length > 0) {
    console.log(`  First session: ${sessions[0].started_at}`)
    console.log(`  Last session: ${sessions[sessions.length - 1].started_at}`)
  }

  // Check mood_meter_usage
  const { data: moods, error: moodsError } = await supabase
    .from('mood_meter_usage')
    .select('*')
    .eq('child_id', aishaId)

  console.log(`- Mood meter entries: ${moods?.length || 0}`)

  // Check breathing_tool_usage
  const { data: breathing, error: breathingError } = await supabase
    .from('breathing_tool_usage')
    .select('*')
    .eq('child_id', aishaId)

  console.log(`- Breathing tool entries: ${breathing?.length || 0}`)

  // Check overall data for all children
  console.log('\nOverall database stats:')

  const { count: sessionCount } = await supabase
    .from('checkin_sessions')
    .select('*', { count: 'exact', head: true })
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')

  console.log(`- Total sessions (Jan-Mar 2025): ${sessionCount || 0}`)

  const { count: moodCount } = await supabase
    .from('mood_meter_usage')
    .select('*', { count: 'exact', head: true })
    .gte('selected_at', '2025-01-01')
    .lte('selected_at', '2025-03-31')

  console.log(`- Total mood meter entries (Jan-Mar 2025): ${moodCount || 0}`)

  const { count: breathingCount } = await supabase
    .from('breathing_tool_usage')
    .select('*', { count: 'exact', head: true })
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')

  console.log(`- Total breathing tool entries (Jan-Mar 2025): ${breathingCount || 0}`)

  // Check if we have data for the expected 30 children
  const { data: childrenWithSessions } = await supabase
    .from('checkin_sessions')
    .select('child_id')
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')

  const uniqueChildren = new Set(childrenWithSessions?.map(s => s.child_id))
  console.log(`- Unique children with sessions (Jan-Mar 2025): ${uniqueChildren.size}`)

  // Diagnosis
  console.log('\n📊 DIAGNOSIS:')
  if (sessions && sessions.length >= 12) {
    console.log('✅ SQL file appears to be EXECUTED - Aisha has the expected 12 sessions')
  } else if (sessions && sessions.length > 0) {
    console.log('⚠️  SQL file PARTIALLY executed - Aisha has some sessions but not all 12')
  } else {
    console.log('❌ SQL file NOT executed - No sessions found for Aisha Patel')
  }

  if (uniqueChildren.size >= 30) {
    console.log('✅ All 30 children have data')
  } else if (uniqueChildren.size > 0) {
    console.log(`⚠️  Only ${uniqueChildren.size} children have data (expected 30)`)
  } else {
    console.log('❌ No children have sessions in Jan-Mar 2025')
  }
}

checkSQLExecution()
  .then(() => process.exit(0))
  .catch(err => {
    console.error('Error:', err)
    process.exit(1)
  })