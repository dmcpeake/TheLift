import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import Anthropic from 'https://esm.sh/@anthropic-ai/sdk@0.20.1'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
}

interface WordCloudRequest {
  orgId?: string
  childId?: string
  dateRange?: 'week' | 'month' | 'all'
  maxWords?: number
}

interface WordCloudWord {
  text: string
  value: number
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

    const requestData: WordCloudRequest = await req.json()
    const { orgId, childId, dateRange = 'all', maxWords = 50 } = requestData

    console.log('🔍 Word cloud request:', { orgId, childId, dateRange, maxWords })

    // Get organization type if we have an orgId or childId
    let orgType = 'school' // default
    let orgIdToUse = orgId

    if (childId && !orgId) {
      // Get org from child profile
      const { data: childData } = await supabaseClient
        .from('profiles')
        .select('org_id')
        .eq('id', childId)
        .single()

      if (childData?.org_id) {
        orgIdToUse = childData.org_id
      }
    }

    if (orgIdToUse) {
      const { data: orgData } = await supabaseClient
        .from('organisations')
        .select('type')
        .eq('id', orgIdToUse)
        .single()

      if (orgData?.type) {
        if (orgData.type.includes('school')) {
          orgType = 'school'
        } else if (orgData.type.includes('clinic')) {
          orgType = 'clinic'
        } else if (orgData.type === 'hospital' || orgData.type === 'nhs-trust') {
          orgType = 'hospital'
        }
      }
    }

    // Calculate date filter
    const now = new Date()
    let startDate: Date | null = null
    if (dateRange === 'week') {
      startDate = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
    } else if (dateRange === 'month') {
      startDate = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
    }

    // Fetch wellbeing wheel text responses
    let wellbeingQuery = supabaseClient
      .from('wellbeing_wheel_sections')
      .select('text_response, section_name, mood_numeric, completed_at, child_id')
      .not('text_response', 'is', null)
      .order('completed_at', { ascending: false })
      .limit(200) // Get more data for better word cloud

    if (childId) {
      wellbeingQuery = wellbeingQuery.eq('child_id', childId)
    } else if (orgIdToUse) {
      // Get all children in org first
      const { data: childrenData } = await supabaseClient
        .from('profiles')
        .select('id')
        .eq('org_id', orgIdToUse)
        .eq('role', 'child')

      if (childrenData && childrenData.length > 0) {
        const childIds = childrenData.map(c => c.id)
        wellbeingQuery = wellbeingQuery.in('child_id', childIds)
      }
    }

    if (startDate) {
      wellbeingQuery = wellbeingQuery.gte('completed_at', startDate.toISOString())
    }

    const { data: wellbeingData, error: wellbeingError } = await wellbeingQuery
    if (wellbeingError) throw wellbeingError

    console.log(`📊 Found ${wellbeingData?.length || 0} wellbeing text responses`)

    // Fetch mood meter notes
    let moodQuery = supabaseClient
      .from('mood_meter_usage')
      .select('notes, mood_numeric, selected_at, child_id')
      .not('notes', 'is', null)
      .order('selected_at', { ascending: false })
      .limit(200)

    if (childId) {
      moodQuery = moodQuery.eq('child_id', childId)
    } else if (orgIdToUse) {
      // Get all children in org
      const { data: childrenData } = await supabaseClient
        .from('profiles')
        .select('id')
        .eq('org_id', orgIdToUse)
        .eq('role', 'child')

      if (childrenData && childrenData.length > 0) {
        const childIds = childrenData.map(c => c.id)
        moodQuery = moodQuery.in('child_id', childIds)
      }
    }

    if (startDate) {
      moodQuery = moodQuery.gte('selected_at', startDate.toISOString())
    }

    const { data: moodData, error: moodError } = await moodQuery
    if (moodError) throw moodError

    console.log(`📊 Found ${moodData?.length || 0} mood notes`)

    // Combine all text data
    const allText: string[] = []

    // Add wellbeing responses
    wellbeingData?.forEach(item => {
      if (item.text_response) {
        allText.push(item.text_response)
      }
    })

    // Add mood notes
    moodData?.forEach(item => {
      if (item.notes) {
        allText.push(item.notes)
      }
    })

    if (allText.length === 0) {
      return new Response(
        JSON.stringify({
          success: true,
          words: [],
          metadata: {
            dataPoints: 0,
            dateRange,
            message: 'No qualitative data available for word cloud'
          }
        }),
        { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    console.log(`💬 Total text entries: ${allText.length}`)

    // Initialize Claude
    const anthropicApiKey = Deno.env.get('ANTHROPIC_API_KEY')
    if (!anthropicApiKey) {
      throw new Error('Anthropic API key not configured')
    }

    const anthropic = new Anthropic({
      apiKey: anthropicApiKey,
    })

    // Create prompt for Claude to analyze and extract meaningful words
    const systemPrompt = `You are an expert at analyzing children's emotional wellbeing text and extracting meaningful themes, emotions, and concepts. Your task is to generate a word cloud by identifying the most significant and meaningful words and phrases from children's wellbeing responses.

IMPORTANT INSTRUCTIONS:
1. Focus on emotionally significant words and themes (feelings, relationships, activities, concerns)
2. Combine similar concepts (e.g., "happy" and "happiness" should be one entry)
3. Use child-friendly language, preserve children's authentic voice
4. Include both positive and challenging emotions/themes
5. Assign weights (1-100) based on:
   - Frequency of the concept appearing
   - Emotional significance
   - Relevance to wellbeing assessment
6. Return EXACTLY ${maxWords} words maximum
7. Avoid generic filler words like "just", "really", "very"
8. Include multi-word phrases when they represent a single concept (e.g., "feeling sad", "my friends")

Return ONLY valid JSON in this exact format:
{
  "words": [
    {"text": "word or phrase", "value": 85},
    {"text": "another word", "value": 72}
  ]
}

No explanation, no markdown, only the JSON object.`

    const userPrompt = `Analyze these ${allText.length} text entries from children's wellbeing check-ins and generate a meaningful word cloud with up to ${maxWords} words:

${allText.slice(0, 100).join('\n---\n')}

${allText.length > 100 ? `\n[Note: Showing first 100 of ${allText.length} entries]` : ''}

Organization context: ${orgType}
Date range: ${dateRange}

Generate the word cloud JSON now.`

    console.log('🤖 Calling Claude API for word extraction...')

    // Call Claude API
    const message = await anthropic.messages.create({
      model: 'claude-3-haiku-20240307',
      max_tokens: 2000,
      temperature: 0.5,
      system: systemPrompt,
      messages: [
        {
          role: 'user',
          content: userPrompt
        }
      ]
    })

    const responseText = message.content[0].type === 'text' ? message.content[0].text : ''
    console.log('📝 Claude response:', responseText.substring(0, 200))

    // Parse JSON response
    let words: WordCloudWord[] = []
    try {
      // Try to extract JSON from response (in case Claude adds markdown)
      const jsonMatch = responseText.match(/\{[\s\S]*\}/)
      const jsonText = jsonMatch ? jsonMatch[0] : responseText
      const parsed = JSON.parse(jsonText)
      words = parsed.words || []
    } catch (parseError) {
      console.error('❌ Failed to parse Claude response as JSON:', parseError)
      throw new Error('Failed to parse word cloud data from AI response')
    }

    console.log(`✅ Generated ${words.length} words for word cloud`)

    // Store the word cloud data (optional)
    const insertData = {
      org_id: orgIdToUse,
      child_id: childId,
      date_range: dateRange,
      word_data: words,
      data_points_analyzed: allText.length,
      created_at: new Date().toISOString()
    }

    await supabaseClient
      .from('word_cloud_cache')
      .insert(insertData)
      .select()
      .single()
      .catch(err => {
        // Ignore cache errors
        console.warn('⚠️ Failed to cache word cloud (table may not exist):', err.message)
      })

    return new Response(
      JSON.stringify({
        success: true,
        words,
        metadata: {
          dataPoints: allText.length,
          dateRange,
          orgType,
          timestamp: new Date().toISOString()
        }
      }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )

  } catch (error: any) {
    console.error('❌ Error in generate-word-cloud:', error)

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
