import { createClient } from '@supabase/supabase-js'

// Replace with your actual Supabase URL and anon key
const supabaseUrl = process.env.SUPABASE_URL || 'https://xssxgnqkqfkcxtcbddgn.supabase.co'
const supabaseKey = process.env.SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS9hdXRoL3YxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM3OTA4NjAsImV4cCI6MzMxMTA4MjY4NjB9.Wd6N48PDqJGnA-0AWGDxkF0lKwkRNcDJCoajQPh6vsc'

const supabase = createClient(supabaseUrl, supabaseKey)

async function checkEmotionGridData() {
  console.log('Checking emotion_grid_usage table...\n')

  // Check if the table exists and has any data
  const { data, error, count } = await supabase
    .from('emotion_grid_usage')
    .select('*', { count: 'exact' })
    .limit(5)

  if (error) {
    console.error('Error querying emotion_grid_usage:', error)
    return
  }

  console.log(`Total records in emotion_grid_usage: ${count}`)

  if (data && data.length > 0) {
    console.log('\nSample records:')
    data.forEach(record => {
      console.log({
        id: record.id,
        child_id: record.child_id,
        created_at: record.created_at,
        has_explanation: !!record.explanation_text
      })
    })
  } else {
    console.log('No data found in emotion_grid_usage table')
  }

  // Check specifically for Chloe King's data
  const chloeId = '28e7a649-8677-4476-b88c-b5b923a9a4e2'

  const { data: chloeData, error: chloeError } = await supabase
    .from('emotion_grid_usage')
    .select('*')
    .eq('child_id', chloeId)
    .order('created_at', { ascending: false })
    .limit(10)

  console.log(`\nCheck-ins for Chloe King (${chloeId}):`)

  if (chloeError) {
    console.error('Error:', chloeError)
  } else if (chloeData && chloeData.length > 0) {
    console.log(`Found ${chloeData.length} check-ins`)
    chloeData.forEach(record => {
      console.log({
        created_at: record.created_at,
        explanation: record.explanation_text?.substring(0, 50) + '...'
      })
    })
  } else {
    console.log('No emotion grid check-ins found for Chloe King')
  }
}

checkEmotionGridData()