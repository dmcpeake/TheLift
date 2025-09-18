// Test script to verify Felix's data using service role key
const fetch = require('node-fetch')

const SUPABASE_URL = 'https://hyjbsgrxgayakvezgdha.supabase.co'
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5amJzZ3J4Z2F5YWt2ZXpnZGhhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUzNzM3NDMsImV4cCI6MjA0MDk0OTc0M30.4HUKoT3TQUCLxqMCQSXb0MHxr0LCj7XaZmJJuuLFUo0'
const FELIX_ID = '0804f356-4551-4b5d-83a2-c3c787bdac02'

async function testEdgeFunction() {
  console.log('=' .repeat(80))
  console.log('TESTING EDGE FUNCTION WITH FELIX BAKER DATA')
  console.log('=' .repeat(80))

  try {
    console.log('\nCalling edge function for Felix Baker...')
    const response = await fetch(
      `${SUPABASE_URL}/functions/v1/analyze-qualitative-data-optimized`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`
        },
        body: JSON.stringify({
          childId: FELIX_ID,
          dateRange: 'all',
          analysisType: 'comprehensive'
        })
      }
    )

    console.log('Response status:', response.status)
    console.log('Response ok:', response.ok)

    if (response.ok) {
      const data = await response.json()

      if (data.success && data.analysis) {
        console.log('\n✅ EDGE FUNCTION RETURNED AI ANALYSIS')
        console.log('=' .repeat(80))
        console.log('\nMetadata:')
        console.log(`  Data points analyzed: ${data.metadata?.dataPoints || 0}`)
        console.log(`  Date range: ${data.metadata?.dateRange}`)
        console.log(`  Analysis type: ${data.metadata?.analysisType}`)

        console.log('\n' + '=' .repeat(80))
        console.log('AI ANALYSIS:')
        console.log('=' .repeat(80))
        console.log(data.analysis)

        // Parse and display key sections
        console.log('\n' + '=' .repeat(80))
        console.log('PARSED SECTIONS:')
        console.log('=' .repeat(80))

        const sections = [
          'EXECUTIVE SUMMARY',
          'EMOTIONAL TRAJECTORY',
          'RED FLAGS & EARLY WARNING SIGNS',
          'STRENGTHS & PROTECTIVE FACTORS',
          'IMMEDIATE ACTION REQUIRED',
          'SUPPORT RECOMMENDATIONS',
          'CONFIDENCE LEVEL'
        ]

        sections.forEach(section => {
          const regex = new RegExp(`\\*\\*${section}\\*\\*([\\s\\S]*?)(?=\\*\\*|$)`, 'i')
          const match = data.analysis.match(regex)
          if (match && match[1]) {
            console.log(`\n${section}:`)
            console.log(match[1].trim().substring(0, 200) + '...')
          }
        })

      } else {
        console.log('❌ No analysis returned')
        console.log('Response data:', data)
      }
    } else {
      const error = await response.text()
      console.error('❌ Edge function error:', error)
    }

  } catch (error) {
    console.error('❌ Error calling edge function:', error.message)
  }
}

// Run the test
testEdgeFunction().catch(console.error)