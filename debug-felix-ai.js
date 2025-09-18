const { createClient } = require('@supabase/supabase-js')

// Replace with your actual Supabase credentials
const SUPABASE_URL = 'https://hyjbsgrxgayakvezgdha.supabase.co'
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5amJzZ3J4Z2F5YWt2ZXpnZGhhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUzNzM3NDMsImV4cCI6MjA0MDk0OTc0M30.4HUKoT3TQUCLxqMCQSXb0MHxr0LCj7XaZmJJuuLFUo0'
const CHILD_ID = '0804f356-4551-4b5d-83a2-c3c787bdac02' // Felix Baker

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)

async function debugFelixData() {
  console.log('='.repeat(80))
  console.log('DEBUGGING FELIX BAKER DATA')
  console.log('Child ID:', CHILD_ID)
  console.log('='.repeat(80))

  // 1. Fetch emotion grid data
  console.log('\n1. FETCHING EMOTION GRID USAGE DATA...')
  const { data: emotionData, error: emotionError } = await supabase
    .from('emotion_grid_usage')
    .select('created_at, explanation_text, child_id')
    .eq('child_id', CHILD_ID)
    .order('created_at', { ascending: false })
    .limit(30)

  if (emotionError) {
    console.error('Error fetching emotion data:', emotionError)
  } else {
    console.log(`Found ${emotionData.length} emotion entries`)
    if (emotionData.length > 0) {
      console.log('\nSample emotion entries:')
      emotionData.slice(0, 5).forEach((e, i) => {
        console.log(`\n  Entry ${i + 1}:`)
        console.log(`    Date: ${new Date(e.created_at).toLocaleDateString()}`)
        console.log(`    Explanation: ${e.explanation_text || 'No explanation provided'}`)
      })
    }
  }

  // 2. Fetch mood meter data
  console.log('\n\n2. FETCHING MOOD METER USAGE DATA...')
  const { data: moodData, error: moodError } = await supabase
    .from('mood_meter_usage')
    .select('created_at, mood_numeric, notes, child_id')
    .eq('child_id', CHILD_ID)
    .order('created_at', { ascending: false })
    .limit(30)

  if (moodError) {
    console.error('Error fetching mood data:', moodError)
  } else {
    console.log(`Found ${moodData.length} mood entries`)
    if (moodData.length > 0) {
      console.log('\nMood statistics:')
      const avgMood = moodData.reduce((acc, m) => acc + m.mood_numeric, 0) / moodData.length
      console.log(`  Average mood: ${avgMood.toFixed(2)}`)
      console.log(`  Lowest mood: ${Math.min(...moodData.map(m => m.mood_numeric))}`)
      console.log(`  Highest mood: ${Math.max(...moodData.map(m => m.mood_numeric))}`)

      console.log('\nSample mood entries:')
      moodData.slice(0, 5).forEach((m, i) => {
        console.log(`\n  Entry ${i + 1}:`)
        console.log(`    Date: ${new Date(m.created_at).toLocaleDateString()}`)
        console.log(`    Mood: ${m.mood_numeric}/5`)
        console.log(`    Notes: ${m.notes || 'No notes'}`)
      })
    }
  }

  // 3. Calculate aggregated data (as done in the edge function)
  console.log('\n\n3. AGGREGATED DATA (sent to AI):')
  console.log('='.repeat(80))

  const aggregatedData = {
    summary: {
      totalCheckIns: moodData?.length || 0,
      dateRange: 'all',
      avgMood: moodData?.length
        ? (moodData.reduce((acc, m) => acc + m.mood_numeric, 0) / moodData.length).toFixed(1)
        : 'N/A'
    },
    moodTrend: calculateMoodTrend(moodData || []),
    keyThemes: extractKeyThemes(emotionData || [], moodData || []),
    sampleExplanations: (emotionData || [])
      .filter(e => e.explanation_text)
      .slice(0, 5)
      .map(e => e.explanation_text),
    concerningPatterns: identifyConcerns(moodData || [])
  }

  console.log(JSON.stringify(aggregatedData, null, 2))

  // 4. Show what prompt would be sent to Claude
  console.log('\n\n4. AI PROMPT THAT WOULD BE SENT:')
  console.log('='.repeat(80))
  console.log(`
Analyze this aggregated wellbeing data:

${JSON.stringify(aggregatedData, null, 2)}

Summary for [PARENT/PRACTITIONER/TEACHER]. Focus on identifying patterns that indicate how this child is "turning up" emotionally and any early mental health indicators requiring attention.

**EXECUTIVE SUMMARY**
Provide a 2-3 sentence overview: Is this child thriving, stable, struggling, or in crisis? What's the single most important thing to know about their emotional state?

**EMOTIONAL TRAJECTORY**
- Overall mood pattern over time (improving/declining/stable/volatile)
- Frequency and intensity of concerning emotions (anger, sadness, anxiety, frustration)
- Any significant mood swings or emotional volatility
- Context-specific patterns (worse at certain times/settings)

**RED FLAGS & EARLY WARNING SIGNS**
Highlight any patterns suggesting developing mental health concerns:
- Persistent negative emotions lasting 2+ weeks
- Increasing emotional volatility or intensity
- Social withdrawal indicators ("worried friends will avoid me")
- Health anxiety or somatic concerns
- Anger/frustration escalation patterns
- Sleep, appetite, or energy references
- Self-worth or confidence issues

**STRENGTHS & PROTECTIVE FACTORS**
- Positive emotional patterns and coping strategies
- Effective tool usage and engagement
- Self-awareness and emotional vocabulary development
- Social connections and support systems
- Resilience indicators

**IMMEDIATE ACTION REQUIRED**
- HIGH PRIORITY: Issues needing immediate attention
- MODERATE: Patterns to monitor closely
- LOW: General support recommendations

**SUPPORT RECOMMENDATIONS**
Specific, actionable suggestions:
- Which tools are most/least effective for this child
- Environmental modifications needed
- When to seek additional professional support
- Family/school communication points
- Specific intervention strategies

**TREND MONITORING**
Key metrics to track going forward:
- Early warning indicators to watch
- Success indicators to celebrate
- Optimal check-in frequency

**CONTEXT CONSIDERATIONS**
- How institutional setting (hospital/school/clinic) influences patterns
- Age-appropriate emotional development expectations
- External factors affecting wellbeing

**CONFIDENCE LEVEL**
Based on data quality and quantity, how confident is this assessment? What additional information would improve accuracy?
`)
}

// Helper functions (same as in edge function)
function calculateMoodTrend(moodData) {
  if (moodData.length < 2) return 'insufficient_data'

  const recent = moodData.slice(0, Math.floor(moodData.length / 2))
  const older = moodData.slice(Math.floor(moodData.length / 2))

  const recentAvg = recent.reduce((acc, m) => acc + m.mood_numeric, 0) / recent.length
  const olderAvg = older.reduce((acc, m) => acc + m.mood_numeric, 0) / older.length

  if (recentAvg > olderAvg + 0.3) return 'improving'
  if (recentAvg < olderAvg - 0.3) return 'declining'
  return 'stable'
}

function extractKeyThemes(emotionData, moodData) {
  const themes = []

  const lowMoods = moodData.filter(m => m.mood_numeric <= 2).length
  if (lowMoods > moodData.length * 0.3) {
    themes.push('frequent_low_moods')
  }

  const hasNotes = moodData.filter(m => m.notes).length
  if (hasNotes > moodData.length * 0.5) {
    themes.push('high_engagement')
  }

  return themes
}

function identifyConcerns(moodData) {
  const concerns = []

  const avgMood = moodData.reduce((acc, m) => acc + m.mood_numeric, 0) / moodData.length
  if (avgMood < 2.5) {
    concerns.push('consistently_low_mood')
  }

  if (moodData.length >= 3) {
    const last3 = moodData.slice(0, 3)
    if (last3.every((m, i) => i === 0 || m.mood_numeric <= last3[i - 1].mood_numeric)) {
      concerns.push('declining_pattern')
    }
  }

  return concerns
}

// Run the debug
debugFelixData().catch(console.error)