// Test script for the analyze-qualitative-data edge function

import { getSupabaseClient } from './src/utils/supabase/client.tsx'

async function testEdgeFunction() {
  console.log('🧪 Testing Edge Function Deployment...\n')

  const supabase = getSupabaseClient()

  // First, check if user is authenticated
  const { data: { user }, error: authError } = await supabase.auth.getUser()

  if (authError || !user) {
    console.log('❌ Not authenticated. Please log in first.')
    console.log('You need to be logged in to test the edge function.')
    return
  }

  console.log('✅ Authenticated as:', user.email)
  console.log('\n📡 Calling edge function...')

  try {
    // Call the edge function with a test request
    const { data, error } = await supabase.functions.invoke('analyze-qualitative-data', {
      body: {
        dateRange: 'week',
        analysisType: 'trends'
      }
    })

    if (error) {
      console.log('\n❌ Edge Function Error:')
      console.log('Error details:', error.message)

      if (error.message.includes('not found')) {
        console.log('\n🔧 Solution: The function may not be deployed.')
        console.log('Deploy it using:')
        console.log('  npx supabase functions deploy analyze-qualitative-data')
      } else if (error.message.includes('Anthropic API key')) {
        console.log('\n🔧 Solution: Anthropic API key not set.')
        console.log('Set it using:')
        console.log('  npx supabase secrets set ANTHROPIC_API_KEY=your-key')
      } else if (error.message.includes('Unauthorized')) {
        console.log('\n🔧 Solution: Authentication issue.')
        console.log('Make sure you are logged in with proper permissions.')
      }

      return
    }

    console.log('\n✅ Edge Function Response:')
    console.log('Success:', data?.success)

    if (data?.metadata) {
      console.log('\n📊 Metadata:')
      console.log('  Data points analyzed:', data.metadata.dataPoints)
      console.log('  Unique children:', data.metadata.uniqueChildren)
      console.log('  Date range:', data.metadata.dateRange)
      console.log('  Analysis type:', data.metadata.analysisType)
    }

    if (data?.analysis) {
      console.log('\n🤖 AI Analysis Preview:')
      console.log(data.analysis.substring(0, 200) + '...')
    }

    console.log('\n✨ Edge function is working correctly!')

  } catch (err) {
    console.log('\n❌ Unexpected Error:', err.message)
    console.log('\nPossible issues:')
    console.log('1. Edge function not deployed')
    console.log('2. CORS configuration issue')
    console.log('3. Network connectivity problem')
  }
}

// Run the test
testEdgeFunction()