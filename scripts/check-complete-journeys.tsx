import { getSupabaseClient } from '../src/utils/supabase/client.tsx'

const supabase = getSupabaseClient()

async function checkCompleteJourneys() {
  console.log('Checking if complete journeys SQL has been executed...\n')

  // Check Emma's data specifically (she has 36 sessions in the SQL)
  const emmaId = 'ce864083-bdf5-4ead-b56a-3c36208d3b69'

  console.log(`Emma (${emmaId}):`)

  // Check checkin_sessions
  const { data: sessions } = await supabase
    .from('checkin_sessions')
    .select('*')
    .eq('child_id', emmaId)
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')
    .order('started_at')

  console.log(`- Check-in sessions (Jan-Mar 2025): ${sessions?.length || 0} (expected 36)`)

  // Check for specific session IDs from the SQL
  const testSessionId = '12345678-1234-5678-abcd-emma0001'
  const { data: specificSession } = await supabase
    .from('checkin_sessions')
    .select('*')
    .eq('id', testSessionId)
    .single()

  if (specificSession) {
    console.log(`  ✅ Found session with ID: ${testSessionId}`)
    console.log(`     Started at: ${specificSession.started_at}`)
  } else {
    console.log(`  ❌ Session ID ${testSessionId} NOT found`)
  }

  // Check emotion_grid_usage
  const { data: emotionGridData } = await supabase
    .from('emotion_grid_usage')
    .select('*')
    .eq('child_id', emmaId)
    .order('started_at', { ascending: false })

  console.log(`- Emotion grid entries: ${emotionGridData?.length || 0}`)

  if (emotionGridData && emotionGridData.length > 0) {
    console.log(`  Latest entry: ${emotionGridData[0].started_at}`)
    console.log(`  Sample text: "${emotionGridData[0].explanation_text?.substring(0, 50)}..."`)
  }

  // Check emotion_grid_feelings
  const { data: feelings } = await supabase
    .from('emotion_grid_feelings')
    .select('*')
    .eq('child_id', emmaId)

  console.log(`- Emotion grid feelings: ${feelings?.length || 0}`)

  // Check wellbeing_wheel_usage
  const { data: wellbeingData } = await supabase
    .from('wellbeing_wheel_usage')
    .select('*')
    .eq('child_id', emmaId)

  console.log(`- Wellbeing wheel entries: ${wellbeingData?.length || 0}`)

  // Check overall stats
  console.log('\n📊 Overall Database Stats (Jan-Mar 2025):')

  const { count: totalSessions } = await supabase
    .from('checkin_sessions')
    .select('*', { count: 'exact', head: true })
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')

  const { count: totalEmotionGrid } = await supabase
    .from('emotion_grid_usage')
    .select('*', { count: 'exact', head: true })
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')

  const { count: totalWellbeing } = await supabase
    .from('wellbeing_wheel_usage')
    .select('*', { count: 'exact', head: true })
    .gte('started_at', '2025-01-01')
    .lte('started_at', '2025-03-31')

  console.log(`- Total sessions: ${totalSessions || 0}`)
  console.log(`- Total emotion grid entries: ${totalEmotionGrid || 0}`)
  console.log(`- Total wellbeing wheel entries: ${totalWellbeing || 0}`)

  // DIAGNOSIS
  console.log('\n🔍 DIAGNOSIS:')

  if (specificSession) {
    console.log('✅ COMPLETE JOURNEYS SQL has been EXECUTED')
    console.log('   Emma has the hardcoded session IDs from the file')
  } else if (emotionGridData && emotionGridData.length > 0) {
    console.log('⚠️  DIFFERENT emotion grid data exists')
    console.log('   But not from the complete journeys SQL file')
    console.log('   (Session IDs don\'t match)')
  } else {
    console.log('❌ COMPLETE JOURNEYS SQL has NOT been executed')
    console.log('   No emotion grid data found for Emma')
  }

  // Compare with the other SQL file
  if (sessions && sessions.length === 12 && !specificSession) {
    console.log('\n📝 NOTE: The OTHER SQL file (all_30_children_sessions) WAS executed instead')
    console.log('   That file has 12 sessions per child, no emotion grid data')
  }
}

checkCompleteJourneys()
  .then(() => process.exit(0))
  .catch(err => {
    console.error('Error:', err)
    process.exit(1)
  })