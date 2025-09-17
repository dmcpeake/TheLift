import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import Anthropic from 'https://esm.sh/@anthropic-ai/sdk@0.20.1'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
}

interface AnalysisRequest {
  orgId?: string
  childId?: string
  dateRange?: 'week' | 'month' | 'all'
  analysisType: 'trends' | 'sentiment' | 'concerns' | 'comprehensive'
}

serve(async (req) => {
  // Handle CORS preflight requests
  if (req.method === 'OPTIONS') {
    return new Response(null, {
      status: 200,
      headers: corsHeaders
    })
  }

  try {
    console.log('Edge function invoked:', req.method, req.url)

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: req.headers.get('Authorization')! },
        },
      }
    )

    // Check for authenticated user (optional for demo mode)
    const { data: userData } = await supabaseClient.auth.getUser()
    const userId = userData?.user?.id || null // Use null for demo mode

    const requestData: AnalysisRequest = await req.json()
    const { orgId, childId, dateRange = 'week', analysisType = 'comprehensive' } = requestData

    // OPTIMIZATION 1: Limit data to most recent entries
    const RECORD_LIMIT = childId ? 30 : 10 // More records for single child, fewer for org

    // Build query for qualitative data
    let emotionQuery = supabaseClient
      .from('emotion_grid_usage')
      .select(`
        created_at,
        explanation_text,
        child_id
      `)
      .order('created_at', { ascending: false })
      .limit(RECORD_LIMIT)

    // Apply filters
    if (childId) {
      emotionQuery = emotionQuery.eq('child_id', childId)
    } else if (orgId) {
      emotionQuery = emotionQuery.eq('org_id', orgId)
    }

    // Apply date filter
    const now = new Date()
    if (dateRange === 'week') {
      const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
      emotionQuery = emotionQuery.gte('created_at', weekAgo.toISOString())
    } else if (dateRange === 'month') {
      const monthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
      emotionQuery = emotionQuery.gte('created_at', monthAgo.toISOString())
    }

    const { data: emotionData, error: emotionError } = await emotionQuery
    if (emotionError) throw emotionError

    // Fetch mood data
    let moodQuery = supabaseClient
      .from('mood_meter_usage')
      .select('created_at, mood_numeric, notes, child_id')
      .order('created_at', { ascending: false })
      .limit(RECORD_LIMIT)

    if (childId) {
      moodQuery = moodQuery.eq('child_id', childId)
    } else if (orgId) {
      moodQuery = moodQuery.eq('org_id', orgId)
    }

    if (dateRange === 'week') {
      const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
      moodQuery = moodQuery.gte('created_at', weekAgo.toISOString())
    } else if (dateRange === 'month') {
      const monthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
      moodQuery = moodQuery.gte('created_at', monthAgo.toISOString())
    }

    const { data: moodData, error: moodError } = await moodQuery
    if (moodError) throw moodError

    // OPTIMIZATION 2: Aggregate data before sending to Claude
    const aggregatedData: any = {
      summary: {
        totalCheckIns: moodData?.length || 0,
        dateRange,
        avgMood: moodData?.length
          ? (moodData.reduce((acc, m) => acc + m.mood_numeric, 0) / moodData.length).toFixed(1)
          : 'N/A'
      },
      moodTrend: calculateMoodTrend(moodData || []),
      keyThemes: extractKeyThemes(emotionData || [], moodData || []),
      sampleExplanations: (emotionData || [])
        .filter(e => e.explanation_text)
        .slice(0, 5) // Only top 5 explanations
        .map(e => e.explanation_text),
      concerningPatterns: identifyConcerns(moodData || [])
    }

    // OPTIMIZATION 3: For organization-wide analysis, group by child
    if (orgId && !childId) {
      const childStats = new Map<string, any>()

      moodData?.forEach(m => {
        if (!childStats.has(m.child_id)) {
          childStats.set(m.child_id, {
            checkIns: 0,
            totalMood: 0,
            lowestMood: 5,
            notes: []
          })
        }
        const stats = childStats.get(m.child_id)
        stats.checkIns++
        stats.totalMood += m.mood_numeric
        stats.lowestMood = Math.min(stats.lowestMood, m.mood_numeric)
        if (m.notes) stats.notes.push(m.notes)
      })

      aggregatedData.childrenRequiringAttention = Array.from(childStats.entries())
        .map(([childId, stats]) => ({
          childId,
          avgMood: (stats.totalMood / stats.checkIns).toFixed(1),
          lowestMood: stats.lowestMood,
          checkInCount: stats.checkIns
        }))
        .filter(child => parseFloat(child.avgMood) < 3 || child.lowestMood <= 2)
        .slice(0, 5) // Only top 5 children needing attention
    }

    // Initialize Claude
    const anthropicApiKey = Deno.env.get('ANTHROPIC_API_KEY')
    console.log('Anthropic API key configured:', !!anthropicApiKey)

    if (!anthropicApiKey) {
      throw new Error('Anthropic API key not configured. Please set ANTHROPIC_API_KEY in Supabase secrets.')
    }

    const anthropic = new Anthropic({
      apiKey: anthropicApiKey,
    })

    // OPTIMIZATION 4: Shorter, more focused prompts
    let systemPrompt = `You are a child wellbeing analyst. Analyze the aggregated data and provide concise, actionable insights.`

    let userPrompt = ''

    switch (analysisType) {
      case 'trends':
        userPrompt = `Analyze the following aggregated wellbeing data for trends:

${JSON.stringify(aggregatedData, null, 2)}

Focus on: mood trends, patterns over time, and notable changes.
Provide bullet points. Keep response under 200 words.`
        break

      case 'sentiment':
        userPrompt = `Analyze the sentiment of this aggregated wellbeing data:

${JSON.stringify(aggregatedData, null, 2)}

Focus on: overall emotional climate and sentiment distribution.
Provide bullet points. Keep response under 200 words.`
        break

      case 'concerns':
        userPrompt = `Review this aggregated data for concerns:

${JSON.stringify(aggregatedData, null, 2)}

Identify: concerning patterns, children needing support (if any).
Provide bullet points. Keep response under 200 words.`
        break

      case 'comprehensive':
      default:
        userPrompt = `Analyze this aggregated wellbeing data:

${JSON.stringify(aggregatedData, null, 2)}

Provide:
1. Executive Summary (2-3 sentences)
2. Key Concerns (if any, bullet points)
3. Positive Trends (bullet points)
4. Top 3 Recommendations

Keep response under 300 words.`
    }

    // Call Claude API with reduced token usage
    const message = await anthropic.messages.create({
      model: 'claude-3-haiku-20240307', // Use Haiku for cost efficiency
      max_tokens: 500, // Limit response length
      temperature: 0.7,
      system: systemPrompt,
      messages: [
        {
          role: 'user',
          content: userPrompt
        }
      ]
    })

    const analysis = message.content[0].type === 'text' ? message.content[0].text : ''

    // Store the analysis in the database for caching
    const insertData: any = {
      org_id: orgId,
      child_id: childId,
      analysis_type: analysisType,
      date_range: dateRange,
      analysis_result: analysis,
      data_points_analyzed: aggregatedData.summary.totalCheckIns
    }

    // Only add created_by if we have a user ID
    if (userId) {
      insertData.created_by = userId
    }

    const { data: analysisRecord } = await supabaseClient
      .from('ai_analyses')
      .insert(insertData)
      .select()
      .single()

    return new Response(
      JSON.stringify({
        success: true,
        analysis,
        metadata: {
          dataPoints: aggregatedData.summary.totalCheckIns,
          dateRange,
          analysisType,
          timestamp: new Date().toISOString()
        }
      }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error: any) {
    console.error('Error in analyze-qualitative-data:', error)

    // Provide more detailed error messages
    let errorMessage = 'An error occurred during analysis'
    let statusCode = 400

    if (error.message?.includes('Anthropic API key')) {
      errorMessage = 'Anthropic API key not configured. Please set ANTHROPIC_API_KEY in Supabase secrets.'
      statusCode = 500
    } else if (error.message?.includes('rate limit') || error.status === 429) {
      errorMessage = 'API rate limit exceeded. Please wait 10-15 seconds before trying again.'
      statusCode = 429
    } else if (error.message) {
      errorMessage = error.message
    }

    return new Response(
      JSON.stringify({
        success: false,
        error: errorMessage,
        details: error.toString()
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: statusCode
      }
    )
  }
})

// Helper functions
function calculateMoodTrend(moodData: any[]): string {
  if (moodData.length < 2) return 'insufficient_data'

  const recent = moodData.slice(0, Math.floor(moodData.length / 2))
  const older = moodData.slice(Math.floor(moodData.length / 2))

  const recentAvg = recent.reduce((acc, m) => acc + m.mood_numeric, 0) / recent.length
  const olderAvg = older.reduce((acc, m) => acc + m.mood_numeric, 0) / older.length

  if (recentAvg > olderAvg + 0.3) return 'improving'
  if (recentAvg < olderAvg - 0.3) return 'declining'
  return 'stable'
}

function extractKeyThemes(emotionData: any[], moodData: any[]): string[] {
  const themes: string[] = []

  // Count low moods
  const lowMoods = moodData.filter(m => m.mood_numeric <= 2).length
  if (lowMoods > moodData.length * 0.3) {
    themes.push('frequent_low_moods')
  }

  // Check for consistent patterns
  const hasNotes = moodData.filter(m => m.notes).length
  if (hasNotes > moodData.length * 0.5) {
    themes.push('high_engagement')
  }

  return themes
}

function identifyConcerns(moodData: any[]): string[] {
  const concerns: string[] = []

  // Check for consistently low moods
  const avgMood = moodData.reduce((acc, m) => acc + m.mood_numeric, 0) / moodData.length
  if (avgMood < 2.5) {
    concerns.push('consistently_low_mood')
  }

  // Check for declining trend
  if (moodData.length >= 3) {
    const last3 = moodData.slice(0, 3)
    if (last3.every((m, i) => i === 0 || m.mood_numeric <= last3[i - 1].mood_numeric)) {
      concerns.push('declining_pattern')
    }
  }

  return concerns
}