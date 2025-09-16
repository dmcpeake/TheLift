import { createClient } from '../supabase/client'
import type { 
  CheckinSession, 
  MoodMeterUsage, 
  EmotionGridUsage,
  EmotionGridFeeling,
  BreathingToolUsage,
  WellbeingWheelUsage,
  WellbeingWheelSection,
  Database 
} from '../../types/database'

const supabase = createClient()

export async function createCheckinSession(childId: string, sessionType: CheckinSession['session_type'] = 'as_needed') {
  const { data, error } = await supabase
    .from('checkin_sessions')
    .insert({
      child_id: childId,
      session_type: sessionType,
      tools_completed: [],
      is_complete: false
    })
    .select()
    .single()

  if (error) throw error
  return data
}

export async function updateCheckinSession(sessionId: string, toolName: string) {
  const { data: session } = await supabase
    .from('checkin_sessions')
    .select('tools_completed')
    .eq('id', sessionId)
    .single()

  const updatedTools = [...(session?.tools_completed || []), toolName]
  
  const { data, error } = await supabase
    .from('checkin_sessions')
    .update({
      tools_completed: updatedTools
    })
    .eq('id', sessionId)
    .select()
    .single()

  if (error) throw error
  return data
}

export async function completeCheckinSession(sessionId: string) {
  const { data, error } = await supabase
    .from('checkin_sessions')
    .update({
      completed_at: new Date().toISOString(),
      is_complete: true
    })
    .eq('id', sessionId)
    .select()
    .single()

  if (error) throw error
  return data
}

export async function saveMoodMeter(
  childId: string,
  mood: MoodMeterUsage['mood'],
  selectionTimeMs: number,
  sessionId?: string
) {
  const moodScores = {
    very_sad: 1,
    sad: 2,
    ok: 3,
    happy: 4,
    very_happy: 5
  }

  const { data, error } = await supabase
    .from('mood_meter_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null,
      mood,
      mood_score: moodScores[mood],
      selection_time_ms: selectionTimeMs
    })
    .select()
    .single()

  if (error) throw error
  
  if (sessionId) {
    await updateCheckinSession(sessionId, 'mood_meter')
  }
  
  return data
}

export async function createEmotionGridUsage(childId: string, sessionId?: string) {
  const { data, error } = await supabase
    .from('emotion_grid_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null
    })
    .select()
    .single()

  if (error) throw error
  return data
}

export async function saveEmotionGridFeelings(
  usageId: string,
  feelings: Array<{ id: string; name: string; category: EmotionGridFeeling['category'] }>
) {
  const { data, error } = await supabase
    .from('emotion_grid_feelings')
    .insert(
      feelings.map(f => ({
        usage_id: usageId,
        feeling_id: f.id,
        feeling_name: f.name,
        category: f.category
      }))
    )
    .select()

  if (error) throw error
  return data
}

export async function updateEmotionGridStory(
  usageId: string,
  storyText: string,
  sessionId?: string
) {
  const { data, error } = await supabase
    .from('emotion_grid_usage')
    .update({
      story_text: storyText,
      completed_at: new Date().toISOString()
    })
    .eq('id', usageId)
    .select()
    .single()

  if (error) throw error
  
  if (sessionId) {
    await updateCheckinSession(sessionId, 'emotion_grid')
  }
  
  return data
}

export async function saveBreathingTool(
  childId: string,
  durationSeconds: number,
  cyclesCompleted: number,
  breathingPattern: string,
  sessionId?: string
) {
  const { data, error } = await supabase
    .from('breathing_tool_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null,
      duration_seconds: durationSeconds,
      cycles_completed: cyclesCompleted,
      breathing_pattern: breathingPattern,
      completed_successfully: true
    })
    .select()
    .single()

  if (error) throw error
  
  if (sessionId) {
    await updateCheckinSession(sessionId, 'breathing_tool')
  }
  
  return data
}

export async function createWellbeingWheelUsage(childId: string, sessionId?: string) {
  const { data, error } = await supabase
    .from('wellbeing_wheel_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null
    })
    .select()
    .single()

  if (error) throw error
  return data
}

export async function saveWellbeingWheelSection(
  usageId: string,
  sectionName: WellbeingWheelSection['section_name'],
  score: number,
  notes?: string
) {
  const { data, error } = await supabase
    .from('wellbeing_wheel_sections')
    .insert({
      usage_id: usageId,
      section_name: sectionName,
      score,
      notes: notes || null
    })
    .select()
    .single()

  if (error) throw error
  return data
}

export async function completeWellbeingWheel(usageId: string, sessionId?: string) {
  const { data: sections } = await supabase
    .from('wellbeing_wheel_sections')
    .select('score')
    .eq('usage_id', usageId)

  const overallScore = sections 
    ? sections.reduce((sum, s) => sum + s.score, 0) / sections.length 
    : null

  const { data, error } = await supabase
    .from('wellbeing_wheel_usage')
    .update({
      completed_at: new Date().toISOString(),
      overall_score: overallScore
    })
    .eq('id', usageId)
    .select()
    .single()

  if (error) throw error
  
  if (sessionId) {
    await updateCheckinSession(sessionId, 'wellbeing_wheel')
  }
  
  return data
}

export async function getRecentSessions(childId: string, limit = 10) {
  const { data, error } = await supabase
    .from('checkin_sessions')
    .select('*')
    .eq('child_id', childId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data
}

export async function getChildProfileScores(childId: string) {
  const { data, error } = await supabase
    .from('child_profile_scores')
    .select('*')
    .eq('child_id', childId)
    .single()

  if (error && error.code !== 'PGRST116') throw error
  return data
}

export async function updateChildProfileScores(childId: string) {
  const [moodData, wellbeingData, sessionsData] = await Promise.all([
    supabase
      .from('mood_meter_usage')
      .select('mood_score')
      .eq('child_id', childId),
    supabase
      .from('wellbeing_wheel_usage')
      .select('overall_score')
      .eq('child_id', childId)
      .not('overall_score', 'is', null),
    supabase
      .from('checkin_sessions')
      .select('*')
      .eq('child_id', childId)
      .order('created_at', { ascending: false })
  ])

  const moodAvg = moodData.data?.length 
    ? moodData.data.reduce((sum, m) => sum + m.mood_score, 0) / moodData.data.length
    : null

  const wellbeingAvg = wellbeingData.data?.length
    ? wellbeingData.data.reduce((sum, w) => sum + (w.overall_score || 0), 0) / wellbeingData.data.length
    : null

  const toolsUsed = [...new Set(sessionsData.data?.flatMap(s => s.tools_completed) || [])]
  const lastCheckin = sessionsData.data?.[0]?.created_at || null
  const totalSessions = sessionsData.data?.length || 0

  const { data: existing } = await supabase
    .from('child_profile_scores')
    .select('id')
    .eq('child_id', childId)
    .single()

  if (existing) {
    const { data, error } = await supabase
      .from('child_profile_scores')
      .update({
        mood_avg: moodAvg,
        wellbeing_avg: wellbeingAvg,
        last_checkin: lastCheckin,
        total_sessions: totalSessions,
        tools_used: toolsUsed
      })
      .eq('child_id', childId)
      .select()
      .single()

    if (error) throw error
    return data
  } else {
    const { data, error } = await supabase
      .from('child_profile_scores')
      .insert({
        child_id: childId,
        mood_avg: moodAvg,
        wellbeing_avg: wellbeingAvg,
        last_checkin: lastCheckin,
        total_sessions: totalSessions,
        tools_used: toolsUsed
      })
      .select()
      .single()

    if (error) throw error
    return data
  }
}