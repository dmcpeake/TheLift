const { createClient } = require('@supabase/supabase-js')

// Using the exact same credentials from your app
const SUPABASE_URL = 'https://hyjbsgrxgayakvezgdha.supabase.co'
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5amJzZ3J4Z2F5YWt2ZXpnZGhhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUzNzM3NDMsImV4cCI6MjA0MDk0OTc0M30.4HUKoT3TQUCLxqMCQSXb0MHxr0LCj7XaZmJJuuLFUo0'
const FELIX_ID = '0804f356-4551-4b5d-83a2-c3c787bdac02'

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)

async function testFelixAccess() {
  console.log('=' .repeat(80))
  console.log('TESTING DATABASE ACCESS FOR FELIX BAKER')
  console.log('=' .repeat(80))

  // 1. Test if Felix exists in profiles
  console.log('\n1. CHECKING PROFILES TABLE:')
  const { data: profile, error: profileError } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', FELIX_ID)
    .single()

  if (profileError) {
    console.error('❌ Error accessing profiles:', profileError.message)
  } else if (profile) {
    console.log('✅ Felix found in profiles table:')
    console.log('   Name:', profile.full_name)
    console.log('   Role:', profile.role)
    console.log('   Org ID:', profile.org_id)
  } else {
    console.log('⚠️  Felix not found in profiles table')
  }

  // 2. Check emotion_grid_usage WITHOUT child_id filter first
  console.log('\n2. CHECKING EMOTION_GRID_USAGE TABLE (all records):')
  const { data: allEmotions, error: allEmotionsError } = await supabase
    .from('emotion_grid_usage')
    .select('child_id, created_at')
    .limit(5)

  if (allEmotionsError) {
    console.error('❌ Error accessing emotion_grid_usage:', allEmotionsError.message)
  } else {
    console.log(`✅ Can access emotion_grid_usage table. Found ${allEmotions?.length || 0} sample records`)
    if (allEmotions && allEmotions.length > 0) {
      console.log('   Sample child IDs:', allEmotions.map(e => e.child_id.substring(0, 8)).join(', '))
    }
  }

  // 3. Check emotion_grid_usage WITH Felix's child_id
  console.log('\n3. CHECKING EMOTION_GRID_USAGE FOR FELIX:')
  const { data: felixEmotions, error: felixEmotionsError } = await supabase
    .from('emotion_grid_usage')
    .select('*')
    .eq('child_id', FELIX_ID)
    .limit(5)

  if (felixEmotionsError) {
    console.error('❌ Error accessing Felix emotions:', felixEmotionsError.message)
  } else {
    console.log(`Found ${felixEmotions?.length || 0} emotion records for Felix`)
    if (felixEmotions && felixEmotions.length > 0) {
      felixEmotions.forEach((e, i) => {
        console.log(`   Record ${i + 1}: ${new Date(e.created_at).toLocaleDateString()} - ${e.explanation_text?.substring(0, 50)}...`)
      })
    }
  }

  // 4. Check mood_meter_usage
  console.log('\n4. CHECKING MOOD_METER_USAGE FOR FELIX:')
  const { data: felixMoods, error: felixMoodsError } = await supabase
    .from('mood_meter_usage')
    .select('*')
    .eq('child_id', FELIX_ID)
    .limit(5)

  if (felixMoodsError) {
    console.error('❌ Error accessing Felix moods:', felixMoodsError.message)
  } else {
    console.log(`Found ${felixMoods?.length || 0} mood records for Felix`)
    if (felixMoods && felixMoods.length > 0) {
      felixMoods.forEach((m, i) => {
        console.log(`   Record ${i + 1}: ${new Date(m.created_at).toLocaleDateString()} - Mood: ${m.mood_numeric}/5`)
      })
    }
  }

  // 5. Try a raw SQL query through RPC (if you have a function)
  console.log('\n5. CHECKING IF THIS IS AN RLS ISSUE:')
  console.log('   Note: RLS policies might be blocking anonymous access')
  console.log('   The anon key has role="anon" which may not have read permissions')

  // 6. Check what org Felix belongs to
  if (profile?.org_id) {
    console.log('\n6. CHECKING ORGANIZATION ACCESS:')
    const { data: org, error: orgError } = await supabase
      .from('organizations')
      .select('*')
      .eq('id', profile.org_id)
      .single()

    if (orgError) {
      console.error('❌ Error accessing organization:', orgError.message)
    } else if (org) {
      console.log('✅ Organization found:', org.name)
    }
  }

  console.log('\n' + '=' .repeat(80))
  console.log('DIAGNOSIS:')
  console.log('=' .repeat(80))

  if (!profile) {
    console.log('🔴 Felix does not exist in the profiles table')
    console.log('   → The UUID might be wrong or the data was never inserted')
  } else if (!felixEmotions || felixEmotions.length === 0) {
    console.log('🟡 Felix exists but has no emotion_grid_usage data')
    console.log('   → The test data was never inserted for emotion_grid_usage')
    console.log('   → Only mood_meter_usage data exists')
  } else {
    console.log('🟢 Felix has data but there might be an access issue')
  }

  console.log('\nPOSSIBLE SOLUTIONS:')
  console.log('1. Check if the test data SQL files were actually executed in Supabase')
  console.log('2. Verify RLS policies allow anonymous read access to these tables')
  console.log('3. Use service role key instead of anon key for testing')
  console.log('4. Check if data exists in test/data-hierarchy but not in actual database')
}

// Run the test
testFelixAccess().catch(console.error)