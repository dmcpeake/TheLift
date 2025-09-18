import { getSupabaseClient } from '../src/utils/supabase/client.tsx'

const supabase = getSupabaseClient()

async function checkExistingData() {
  console.log('Checking existing emotion_grid_usage data...\n')

  // Get all emotion grid data grouped by child_id
  const { data: emotionData, error } = await supabase
    .from('emotion_grid_usage')
    .select('child_id, explanation_text, created_at, started_at')
    .order('created_at', { ascending: false })

  if (error) {
    console.error('Error fetching data:', error)
    return
  }

  // Group by child_id
  const childDataMap = new Map()
  emotionData?.forEach(record => {
    if (!childDataMap.has(record.child_id)) {
      childDataMap.set(record.child_id, [])
    }
    childDataMap.get(record.child_id).push(record)
  })

  console.log(`Found emotion data for ${childDataMap.size} children:\n`)

  // Get child names
  const childIds = Array.from(childDataMap.keys())
  const { data: profiles } = await supabase
    .from('profiles')
    .select('id, name')
    .in('id', childIds)

  const profileMap = new Map(profiles?.map(p => [p.id, p.name]) || [])

  // Display data for each child
  childDataMap.forEach((records, childId) => {
    const childName = profileMap.get(childId) || 'Unknown'
    console.log(`${childName} (${childId}):`)
    console.log(`  - ${records.length} emotion check-ins`)
    console.log(`  - Latest: ${records[0]?.started_at || records[0]?.created_at}`)
    console.log(`  - Sample text: "${records[0]?.explanation_text?.substring(0, 60)}..."`)
    console.log()
  })

  // Specifically check for Chloe King
  console.log('\nChecking specifically for Chloe King (28e7a649-8677-4476-b88c-b5b923a9a4e2):')
  const { data: chloeData } = await supabase
    .from('emotion_grid_usage')
    .select('*')
    .eq('child_id', '28e7a649-8677-4476-b88c-b5b923a9a4e2')

  if (chloeData && chloeData.length > 0) {
    console.log(`Found ${chloeData.length} records for Chloe King`)
  } else {
    console.log('No emotion_grid_usage records found for Chloe King')
    console.log('She only has mood_meter_usage data, not emotion grid data.')
  }
}

checkExistingData()
  .then(() => process.exit(0))
  .catch(err => {
    console.error('Error:', err)
    process.exit(1)
  })