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
    const { orgId, childId, dateRange = 'month', analysisType = 'comprehensive' } = requestData

    // Build query for qualitative data
    let emotionQuery = supabaseClient
      .from('emotion_grid_usage')
      .select(`
        *,
        emotion_grid_feelings (*)
      `)
      .order('created_at', { ascending: false })

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
      .select('*')
      .order('created_at', { ascending: false })

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

    // Fetch children profiles for context
    let childrenQuery = supabaseClient
      .from('profiles')
      .select('id, name')
      .eq('role', 'Child')

    if (childId) {
      childrenQuery = childrenQuery.eq('id', childId)
    } else if (orgId) {
      childrenQuery = childrenQuery.eq('org_id', orgId)
    }

    const { data: children } = await childrenQuery

    // Create a map of child names
    const childNames = new Map(children?.map(c => [c.id, c.name]) || [])

    // Prepare data for Claude analysis
    const qualitativeData = {
      emotionExplanations: emotionData?.filter(e => e.explanation_text).map(e => ({
        childName: childNames.get(e.child_id) || 'Anonymous',
        date: e.created_at,
        explanation: e.explanation_text,
        feelings: e.emotion_grid_feelings?.map(f => f.feeling_name) || [],
        feelingCategories: e.emotion_grid_feelings?.map(f => f.feeling_category) || []
      })) || [],
      moodData: moodData?.map(m => ({
        childName: childNames.get(m.child_id) || 'Anonymous',
        date: m.created_at,
        mood: m.mood_level,
        moodScore: m.mood_numeric,
        notes: m.notes
      })) || [],
      summary: {
        totalEntries: (emotionData?.length || 0) + (moodData?.length || 0),
        uniqueChildren: new Set([
          ...(emotionData?.map(e => e.child_id) || []),
          ...(moodData?.map(m => m.child_id) || [])
        ]).size,
        dateRange,
        avgMood: moodData?.length
          ? moodData.reduce((acc, m) => acc + m.mood_numeric, 0) / moodData.length
          : null
      }
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

    // Prepare the prompt based on analysis type
    let systemPrompt = `You are an expert child psychologist and wellbeing analyst specializing in analyzing children's emotional data from check-in sessions. Your role is to identify patterns, trends, and insights that can help practitioners support children's wellbeing.`

    let userPrompt = ''

    switch (analysisType) {
      case 'trends':
        userPrompt = `Analyze the following emotional data and identify key trends over time. Focus on:
1. Patterns in emotional states
2. Changes in mood over the ${dateRange}
3. Recurring themes in explanations
4. Notable shifts in wellbeing

Data: ${JSON.stringify(qualitativeData, null, 2)}

Provide a structured analysis with clear trends and actionable insights.`
        break

      case 'sentiment':
        userPrompt = `Analyze the sentiment and emotional tone of the following data. Focus on:
1. Overall emotional climate
2. Positive vs negative sentiment distribution
3. Emotional vocabulary being used
4. Signs of emotional growth or regression

Data: ${JSON.stringify(qualitativeData, null, 2)}

Provide a sentiment analysis with specific examples and recommendations.`
        break

      case 'concerns':
        userPrompt = `Review the following emotional data for any concerning patterns or red flags. Focus on:
1. Signs of persistent negative emotions
2. Concerning language or themes
3. Children who may need additional support
4. Urgent matters requiring attention

Data: ${JSON.stringify(qualitativeData, null, 2)}

Highlight any concerns with appropriate sensitivity and suggest support strategies. Use child names when identifying specific concerns.`
        break

      case 'comprehensive':
      default:
        userPrompt = `Provide a comprehensive analysis of the following children's wellbeing data. Include:

1. **Overview**: Summary of the data and key statistics
2. **Emotional Trends**: Patterns in emotions and mood over time
3. **Individual Insights**: Notable observations about specific children (use names)
4. **Themes**: Common themes in children's explanations and feelings
5. **Positive Indicators**: Signs of wellbeing and resilience
6. **Areas of Concern**: Any patterns requiring attention
7. **Recommendations**: Actionable steps for practitioners

Data: ${JSON.stringify(qualitativeData, null, 2)}

Format your response in clear sections with specific examples and actionable insights.`
    }

    // Call Claude API
    const message = await anthropic.messages.create({
      model: 'claude-3-5-sonnet-20240620',  // Updated to latest available model
      max_tokens: 2000,
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
      data_points_analyzed: qualitativeData.summary.totalEntries
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
          dataPoints: qualitativeData.summary.totalEntries,
          uniqueChildren: qualitativeData.summary.uniqueChildren,
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
    } else if (error.message?.includes('rate limit')) {
      errorMessage = 'API rate limit exceeded. Please try again later.'
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