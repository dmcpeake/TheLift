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
    // Use service role key if available, otherwise fall back to anon key
    const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') || Deno.env.get('SUPABASE_ANON_KEY') || ''

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      supabaseKey,
      {
        auth: {
          persistSession: false,
          autoRefreshToken: false,
        },
      }
    )

    const requestData: AnalysisRequest = await req.json()
    const { orgId, childId, dateRange = 'week', analysisType = 'comprehensive' } = requestData

    // Get organization type if we have an orgId
    let orgType = 'school' // default
    if (orgId) {
      const { data: orgData } = await supabaseClient
        .from('organisations')
        .select('type')
        .eq('id', orgId)
        .single()

      if (orgData?.type) {
        // Map specific types to general categories
        if (orgData.type.includes('school')) {
          orgType = 'school'
        } else if (orgData.type.includes('clinic')) {
          orgType = 'clinic'
        } else if (orgData.type === 'hospital' || orgData.type === 'nhs-trust') {
          orgType = 'hospital'
        } else {
          orgType = 'school' // default
        }
      }
    } else if (childId) {
      // If only childId is provided, get org type from child's org
      const { data: childData } = await supabaseClient
        .from('profiles')
        .select('org_id')
        .eq('id', childId)
        .single()

      if (childData?.org_id) {
        const { data: orgData } = await supabaseClient
          .from('organisations')
          .select('type')
          .eq('id', childData.org_id)
          .single()

        if (orgData?.type) {
          // Map specific types to general categories
          if (orgData.type.includes('school')) {
            orgType = 'school'
          } else if (orgData.type.includes('clinic')) {
            orgType = 'clinic'
          } else if (orgData.type === 'hospital' || orgData.type === 'nhs-trust') {
            orgType = 'hospital'
          } else {
            orgType = 'school' // default
          }
        }
      }
    }

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
      .select('selected_at, created_at, mood_numeric, notes, child_id')
      .order('selected_at', { ascending: false })
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
          ? (moodData.reduce((acc: number, m: any) => acc + m.mood_numeric, 0) / moodData.length).toFixed(1)
          : 'N/A'
      },
      moodTrend: calculateMoodTrend(moodData || []),
      keyThemes: extractKeyThemes(emotionData || [], moodData || []),
      sampleExplanations: (emotionData || [])
        .filter((e: any) => e.explanation_text)
        .slice(0, 5) // Only top 5 explanations
        .map((e: any) => e.explanation_text),
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
    if (!anthropicApiKey) {
      throw new Error('Anthropic API key not configured')
    }

    const anthropic = new Anthropic({
      apiKey: anthropicApiKey,
    })

    // Get child's first name if available
    let childFirstName = 'this child'
    if (childId) {
      const { data: childProfile } = await supabaseClient
        .from('profiles')
        .select('name')
        .eq('id', childId)
        .single()

      if (childProfile?.name) {
        childFirstName = childProfile.name.split(' ')[0]
      }
    }

    // Load org-specific prompt based on orgType
    console.log(`Organization type: ${orgType}`)
    console.log(`Child name: ${childFirstName}`)

    let promptTemplate = ''
    const promptMap: Record<string, string> = {
      'school': 'teacher',
      'clinic': 'clinic',
      'hospital': 'hospital'
    }

    const promptFileName = promptMap[orgType] || 'teacher'
    console.log(`Using prompt file: ${promptFileName}.md`)

    try {
      // Read the appropriate prompt file
      const decoder = new TextDecoder('utf-8')
      const promptPath = new URL(`./prompts/${promptFileName}.md`, import.meta.url)
      const promptFile = await Deno.readFile(promptPath)
      promptTemplate = decoder.decode(promptFile)

      // Replace placeholders with actual child name
      promptTemplate = promptTemplate
        .replace(/\{child_name\}/g, childFirstName)
        .replace(/\[CHILD'S FIRST NAME\]/g, childFirstName)
        .replace(/\[CHILD'S NAME\]/g, childFirstName)
    } catch (error) {
      console.error('Error loading prompt template:', error)
      // Fallback to generic prompt
      promptTemplate = `Analyze this child's wellbeing data and provide insights about their emotional state and support needs.`
    }

    // OPTIMIZATION 4: Role-specific system prompt
    const systemPromptMap: Record<string, string> = {
      'school': 'You are an experienced primary school teacher analyzing a student\'s emotional wellbeing data. Focus on classroom-relevant insights, learning impacts, and practical teaching strategies. Use teacher-appropriate language, not clinical terminology.',
      'clinic': 'You are a child mental health practitioner reviewing inter-session wellbeing data. Provide clinical insights about emotional regulation, therapeutic progress, and treatment recommendations.',
      'hospital': 'You are a pediatric physician reviewing a young patient\'s emotional wellbeing during medical treatment. Focus on the medical-psychological connection and how to support emotional healing alongside physical recovery.'
    }

    let systemPrompt = systemPromptMap[orgType] || systemPromptMap['school']
    systemPrompt += ' You MUST structure your response with clear section headers using **SECTION NAME** format. Each section should contain bullet points.'

    // Add structured format instructions to the prompt
    let userPrompt = `${promptTemplate}

Here is the wellbeing data to analyze:

${JSON.stringify(aggregatedData, null, 2)}

IMPORTANT: Structure your response with these exact section headers:
**EXECUTIVE SUMMARY**
**RED FLAGS & EARLY WARNING SIGNS**
**STRENGTHS & PROTECTIVE FACTORS**
**SUPPORT RECOMMENDATIONS**

Use bullet points (- ) for lists within each section.`

    // Call Claude API with sufficient tokens for structured response
    const message = await anthropic.messages.create({
      model: 'claude-3-haiku-20240307', // Use Haiku for cost efficiency
      max_tokens: 1000, // Increased for complete structured response
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

    // Store the analysis (optional)
    const insertData: any = {
      org_id: orgId,
      child_id: childId,
      analysis_type: analysisType,
      date_range: dateRange,
      analysis_result: analysis,
      data_points_analyzed: aggregatedData.summary.totalCheckIns
    }

    await supabaseClient
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
        },
        debug: {
          orgType,
          promptFile: promptFileName,
          childName: childFirstName,
          systemPromptType: orgType,
          timestamp: new Date().toISOString()
        }
      }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error: any) {
    console.error('Error in analyze-qualitative-data:', error)

    return new Response(
      JSON.stringify({
        success: false,
        error: error.message
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 400
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