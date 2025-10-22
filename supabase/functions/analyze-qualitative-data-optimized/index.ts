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
  checkInId?: string  // Specific wellbeing wheel check-in ID for week-specific analysis
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
    const { orgId, childId, checkInId, dateRange = 'week', analysisType = 'comprehensive' } = requestData

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

    // If checkInId is provided, fetch wellbeing wheel data for that specific check-in
    let wellbeingWheelData: any = null
    if (checkInId) {
      const { data: wheelSections, error: wheelError } = await supabaseClient
        .from('wellbeing_wheel_sections')
        .select('section_name, mood_numeric, text_response, completed_at')
        .eq('wellbeing_wheel_id', checkInId)
        .order('section_name', { ascending: true })

      if (!wheelError && wheelSections) {
        wellbeingWheelData = {
          checkInId,
          sections: wheelSections,
          overallScore: wheelSections.length > 0
            ? (wheelSections.reduce((acc: number, s: any) => acc + s.mood_numeric, 0) / wheelSections.length).toFixed(1)
            : 'N/A'
        }
      }
    }

    // OPTIMIZATION 2: Aggregate data before sending to Claude
    const aggregatedData: any = {
      summary: {
        totalCheckIns: wellbeingWheelData ? 1 : (moodData?.length || 0),
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

    // Add wellbeing wheel data if analyzing a specific check-in
    if (wellbeingWheelData) {
      aggregatedData.wellbeingWheel = wellbeingWheelData
      aggregatedData.isWeeklyAnalysis = true
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

    // Inlined prompts (no external file dependencies)
    const TEACHER_PROMPT = `You're {child_name}'s teacher looking at their Wellbeing Wheel check-ins from The Lift platform. You see them every day in class and want to understand their wellbeing journey across 7 key categories: Friends, Work/School, Health, Family, Fun & Play, Safety, and Emotions.

Each check-in shows {child_name}'s self-reported scores (1-4 scale) and their own words about how they're experiencing each category over time.

Looking at {child_name}'s wellbeing wheel data, help me understand:

**How is {child_name} experiencing their wellbeing across different areas of life?**
What patterns do you notice across the 7 categories (Friends, Work/School, Health, Family, Fun & Play, Safety, Emotions)? Which areas are consistently strong? Which areas show challenges or declining trends? How do these different areas connect and influence each other?

**How can I best support {child_name}'s learning needs based on their wellbeing categories?**
Looking at their Work/School category scores and comments, what patterns emerge? How do other categories (Family, Friends, Health, Emotions) impact their ability to engage with learning? What adjustments or approaches might help them based on what they're telling us across all 7 areas?

**What person-centered support does {child_name} need?**
- Based on their Safety and Emotions categories, what classroom environment adjustments might help them feel more secure?
- What do their Friends category responses tell us about social support needs?
- How can their Family and Health categories inform our whole-child approach?
- Which positive patterns in their Fun & Play responses show us what brings them joy and engagement?
- What classroom modifications or reasonable adjustments might benefit them (in line with the Equality Act 2010)?
- How can I collaborate with parents/carers and our SENCO, using insights from all 7 categories?
- If {child_name} has an EHCP or is receiving SEN Support, how do their wellbeing wheel patterns align with their outcomes?

**What are {child_name}'s strengths and successful strategies?**
Which wellbeing categories consistently score well? What does {child_name} say in their own words about what's working? What natural abilities, interests, or coping strategies emerge from their responses? How can I build on these strengths to support areas showing lower scores?

Please focus on strengths-based, person-centered approaches that respect {child_name}'s individual needs. Reference specific wellbeing categories (Friends, Work/School, Health, Family, Fun & Play, Safety, Emotions) in your analysis to show how different areas of their life connect and inform support strategies.`

    const CLINIC_PROMPT = `Review {child_name}'s Wellbeing Wheel check-ins to understand their emotional and psychological wellbeing from a therapeutic perspective. The Wellbeing Wheel tracks 7 key life areas (Friends, Work/School, Health, Family, Fun & Play, Safety, Emotions) with both quantitative scores (1-4 scale) and {child_name}'s own words about their experiences over time.

This between-session data provides valuable insights into their daily experiences, therapeutic progress, and how different areas of their life interconnect.

**Person-Centered Clinical Focus:**
1. Patterns across all 7 wellbeing categories and how they interact
2. Emotional regulation as reflected in the Emotions category and its relationship to other areas
3. Social-emotional development visible in Friends, Family, and Safety categories
4. Areas showing consistent strength or declining patterns
5. {child_name}'s own narrative through their text responses
6. Protective factors and natural support systems emerging from their responses
7. Collaborative treatment approaches that build on their strengths across all categories

**Strengths-Based Assessment Across Wellbeing Categories:**
- **Emotions**: What emotional regulation skills is {child_name} developing? How are they expressing their inner experience?
- **Friends**: What social connection patterns emerge? Which relationships support their wellbeing?
- **Family**: How do family dynamics influence their overall wellbeing? What family strengths can we build on?
- **Safety**: How secure does {child_name} feel? What environmental factors support their sense of safety?
- **Work/School**: How is their engagement with learning and achievement? How do other categories impact this?
- **Health**: What physical wellbeing patterns appear? How does health interconnect with emotional wellbeing?
- **Fun & Play**: What brings {child_name} joy? How are they maintaining activities that support resilience?
- **Cross-Category Patterns**: How do scores and responses in one area predict or influence others? What holistic patterns emerge?

Please use person-first language, focus on {child_name}'s individual strengths and needs, and consider how their unique neurodiversity or personal characteristics can be supported rather than changed. Frame recommendations in terms of additional support and skill-building rather than deficit correction. Consider alignment with UK SEND frameworks, CAMHS pathways, and the SEND Code of Practice where relevant to {child_name}'s support needs.`

    const HOSPITAL_PROMPT = `Review {child_name}'s Wellbeing Wheel check-ins within the context of their medical care and treatment. The Wellbeing Wheel tracks 7 key life areas (Friends, Work/School, Health, Family, Fun & Play, Safety, Emotions) with both quantitative scores (1-4 scale) and {child_name}'s own words about their experiences over time.

Understanding how medical experiences impact all areas of their wellbeing supports holistic, child-centered healthcare.

**Integrated Care Approach Across Wellbeing Categories:**
1. How {child_name}'s Health category scores and comments reflect their medical journey
2. How medical experiences influence their Emotions and Safety categories
3. Social impact visible in Friends and Family categories during treatment
4. Maintaining normalcy through Work/School and Fun & Play despite medical challenges
5. Emotional resilience and coping strengths developing across all categories
6. Family support patterns emerging from their responses
7. Cross-category connections (e.g., how Health impacts Friends, or Safety influences Emotions)

**Child-Centered Medical Considerations by Category:**
- **Health**: How is {child_name} experiencing and describing their physical wellbeing? What language do they use?
- **Emotions**: How are they processing the emotional aspects of medical treatment? What coping strategies emerge?
- **Safety**: Do they feel secure in the medical environment? What would help them feel safer?
- **Family**: How is family support showing up in their responses? What family strengths can we build on?
- **Friends**: How is medical care impacting their social connections? How can we support peer relationships?
- **Work/School**: Are they maintaining engagement with learning? What educational support do they need?
- **Fun & Play**: What activities bring joy despite medical challenges? How can we protect this vital area?
- **Holistic Patterns**: How do medical procedures or hospitalization impact scores across multiple categories? What strengths in one area support challenges in another?

Please use person-first language, recognize {child_name} as a whole person beyond their medical needs, and focus on their strengths, preferences, and individual ways of coping. Consider how their unique characteristics (including any neurodivergent traits) can be accommodated in their medical care. Where relevant, consider alignment with NHS England's SEND standards, the Children and Young People's Mental Health Green Paper recommendations, and local integrated care pathways.

**SPECIAL CLINICAL MONITORING - Nephrotic Syndrome:**
For children with nephrotic syndrome (relapsing-remitting kidney condition where kidneys leak protein, causing swelling, fatigue, and infection risk), monitor for early warning signs of potential episodes. Many behavioral and emotional indicators appear BEFORE obvious physical symptoms:

**Behavioral & Emotional Red Flags (may precede physical symptoms):**
- **Fatigue/low energy**: References to being "tired", "need more sleep", "no energy", "feeling flat", "just want to rest"
- **Irritability/mood swings**: Sudden emotional changes, increased frustration, more crying than usual
- **Withdrawal patterns**: Avoiding friends, becoming quieter, not wanting to play, less social interaction
- **Somatic complaints**: Tummy aches, headaches, general "feeling unwell" without specific symptoms
- **Anticipatory anxiety**: Worry about testing (especially urine/protein tests), medical appointments, missing school/friends
- **Difficulty concentrating**: Daydreaming, disengagement from usual activities, trouble focusing

**Physical Symptom Indicators (in child's own language):**
- **Swelling/edema references**: "puffy eyes", "tummy feels big", "ankles swollen", "face looks puffy"
- **Urination concerns**: Frequent toilet visits, worry about "protein in wee", mentions of urine testing
- **Pain/discomfort**: Abdominal pain, tummy hurts, general malaise

**Pattern Recognition for Episode Detection:**
- **Cluster detection**: Two or more behavioral indicators appearing across different wellbeing categories simultaneously
- **Score patterns**: Declining scores in Health category PLUS declines in (Emotions OR Fun/Play OR Work/School)
- **Relapse language**: Child mentions "flare up", "episode", "happening again", "feeling sick again"
- **Activity impact**: Missing school, unable to play, withdrawal from previously enjoyed activities

**CRITICAL INSTRUCTION - Nephrotic Syndrome Monitoring (ONLY for actual warning signs):**

**STEP 1: Review {child_name}'s actual text responses**
Carefully read through ALL of {child_name}'s text responses in the wellbeing wheel data. Look for actual mentions of:
- Fatigue/tiredness ("tired", "no energy", "need rest")
- Physical symptoms ("puffy tummy", "puffy eyes", "tummy hurts", "swollen")
- Relapse language ("flare up", "episode", "happening again")
- Medical concerns ("wee test", "protein", "worried about testing")

**STEP 2: Decision point**
- **IF you found 2+ actual warning signs in {child_name}'s text responses**: Include the nephrotic monitoring section (format below)
- **IF you found 0-1 warning signs OR no concerning symptoms**: SKIP TO STEP 3 - Do NOT include any nephrotic section

**STEP 3: Section format (ONLY if warning signs found in Step 1)**

**⚠️ NEPHROTIC SYNDROME MONITORING**
- **FIRST BULLET MUST START WITH**: "Warning signs detected: [quote what {child_name} actually said]"
- List 2-3 specific quotes from {child_name}'s responses showing warning signs
- Note which wellbeing categories show concerning patterns (with specific scores)
- Assessment: Is this early warning signs or active episode?
- Recommend prompt urine protein testing and nephrology team contact
- Note {child_name}'s awareness and coping strategies
- List protective factors (family support, medical team trust)

**CRITICAL**: If you did NOT find actual warning signs in {child_name}'s text responses, you MUST COMPLETELY SKIP the nephrotic monitoring section. Do not write "[NO WARNING SIGNS DETECTED]" or any placeholder text. Simply move on to the next section of your analysis. The absence of the nephrotic section indicates no concerns detected.

This early detection approach helps catch episodes 24-48 hours before major physical symptoms appear, reducing emergency presentations and supporting {child_name}'s ability to recognize and manage their condition.`

    // Check if this is Aisha Patel BEFORE building prompt (need to do this earlier)
    const isAishaPatel = childFirstName === 'Aisha'

    const promptMap: Record<string, string> = {
      'school': TEACHER_PROMPT,
      'clinic': CLINIC_PROMPT,
      'hospital': isAishaPatel ? HOSPITAL_PROMPT : HOSPITAL_PROMPT.split('**SPECIAL CLINICAL MONITORING')[0] // Only include nephrotic monitoring for Aisha
    }

    let promptTemplate = promptMap[orgType] || TEACHER_PROMPT
    console.log(`Using ${orgType} prompt template, isAishaPatel: ${isAishaPatel}`)

    // Replace placeholders with actual child name
    promptTemplate = promptTemplate
      .replace(/\{child_name\}/g, childFirstName)
      .replace(/\[CHILD'S FIRST NAME\]/g, childFirstName)
      .replace(/\[CHILD'S NAME\]/g, childFirstName)

    // OPTIMIZATION 4: Role-specific system prompt
    const systemPromptMap: Record<string, string> = {
      'school': `You are an experienced primary school teacher analyzing ${childFirstName}'s emotional wellbeing data. Always refer to the student by name (${childFirstName}) rather than "the student" or "this child". Focus on classroom-relevant insights, learning impacts, and practical teaching strategies. Use teacher-appropriate language, not clinical terminology.`,
      'clinic': `You are a child mental health practitioner reviewing ${childFirstName}'s inter-session wellbeing data. Always refer to the child by name (${childFirstName}). Provide clinical insights about emotional regulation, therapeutic progress, and treatment recommendations.`,
      'hospital': `You are a pediatric physician reviewing ${childFirstName}'s emotional wellbeing during medical treatment. Always refer to your patient by name (${childFirstName}). Focus on the medical-psychological connection and how to support emotional healing alongside physical recovery.${isAishaPatel ? `

CRITICAL - Nephrotic Syndrome Monitoring: ${childFirstName} has nephrotic syndrome (relapsing-remitting kidney condition). If you detect relapsing-remitting patterns with fatigue, mood changes, withdrawal, or physical complaints (swelling, puffy eyes/tummy, tummy aches, anxiety about testing), assess for potential nephrotic syndrome episode and flag immediately for clinical review using the dedicated monitoring section format.` : ''}`
    }

    let systemPrompt = systemPromptMap[orgType] || systemPromptMap['school']
    systemPrompt += ' You MUST structure your response with clear section headers using **SECTION NAME** format. Each section should contain bullet points.'

    // Add structured format instructions to the prompt
    let userPrompt = `${promptTemplate}

Here is the wellbeing data to analyze:

${JSON.stringify(aggregatedData, null, 2)}

IMPORTANT INSTRUCTIONS:
1. Always refer to the child by their name (${childFirstName}) throughout your response
2. Structure your response with these exact section headers:
   **EXECUTIVE SUMMARY**
   **RED FLAGS & EARLY WARNING SIGNS**
   **STRENGTHS & PROTECTIVE FACTORS**
   **SUPPORT RECOMMENDATIONS**
   ${isAishaPatel ? '**⚠️ NEPHROTIC SYNDROME MONITORING** (ONLY include if you found 2+ warning signs in her text responses)' : ''}
3. Use bullet points (- ) for lists within each section
4. Write as if you're speaking directly about ${childFirstName}, not "the student" or "this child"
5. ${isAishaPatel ? `CRITICAL INSTRUCTION for ${childFirstName}: She has nephrotic syndrome.

DECISION PROCESS:
- FIRST: Read ALL of ${childFirstName}'s text responses in the wellbeing data
- CHECK: Did she actually mention symptoms? (puffy tummy/eyes, tired/fatigue, flare up, wee test worry, feeling unwell)
- COUNT: How many warning signs did you find in her actual words?

IF you found 2+ actual warning signs in her text responses:
  ✓ Include the **⚠️ NEPHROTIC SYNDROME MONITORING** section
  ✓ First bullet MUST start with: "Warning signs detected: [quote what she said]"
  ✓ Include 2-3 specific quotes from her responses

IF you found 0-1 warning signs OR she sounds healthy:
  ✗ DO NOT include the **⚠️ NEPHROTIC SYNDROME MONITORING** section at all
  ✗ DO NOT write "[NO WARNING SIGNS DETECTED]" or any placeholder
  ✗ Simply skip this section and move to SUPPORT RECOMMENDATIONS

The section should either contain real warning signs with quotes, or not exist at all.` : ''}`

    // Call Claude API with sufficient tokens for structured response
    const message = await anthropic.messages.create({
      model: 'claude-3-haiku-20240307', // Use Haiku for cost efficiency
      max_tokens: 2500, // Sufficient for complete structured response with all sections including nephrotic monitoring
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
          promptType: orgType === 'hospital' ? 'HOSPITAL_PROMPT' : orgType === 'clinic-private' ? 'CLINIC_PROMPT' : 'TEACHER_PROMPT',
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