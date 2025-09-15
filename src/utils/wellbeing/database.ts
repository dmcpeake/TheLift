import { getSupabaseClient } from '../supabase/client'
import {
  CheckinSession,
  MoodMeterUsage,
  EmotionGridUsage,
  WellbeingWheelUsage,
  BreathingToolUsage,
  MoodType,
  EmotionCategory,
  WellbeingSectionType
} from '../../types/database'

const supabase = getSupabaseClient()

// Session Management
export async function createCheckinSession(childId: string, orgId?: string) {
  // Get org_id if not provided
  let finalOrgId = orgId
  if (!finalOrgId) {
    const { getChildOrgId, TEST_ORG_ID } = await import('./helpers')
    finalOrgId = await getChildOrgId(childId) || TEST_ORG_ID
  }

  const { data, error } = await supabase
    .from('checkin_sessions')
    .insert({
      child_id: childId,
      org_id: finalOrgId,
      status: 'in_progress',
      tools_completed: []
    })
    .select()
    .single()

  if (error) throw error
  return data
}

export async function updateCheckinSession(
  sessionId: string,
  toolName: 'mood_meter' | 'emotion_grid' | 'wellbeing_wheel' | 'breathing_tool'
) {
  const fieldName = `${toolName}_completed` as keyof CheckinSession

  const { data: session } = await supabase
    .from('checkin_sessions')
    .select('tools_completed')
    .eq('id', sessionId)
    .single()

  const updatedTools = session?.tools_completed || []
  if (!updatedTools.includes(toolName)) {
    updatedTools.push(toolName)
  }

  const { data, error } = await supabase
    .from('checkin_sessions')
    .update({
      [fieldName]: true,
      tools_completed: updatedTools,
      updated_at: new Date().toISOString()
    })
    .eq('id', sessionId)
    .select()
    .single()

  if (error) throw error
  return data
}

// Data Fetching
export async function getChildSessions(childId: string, limit = 10) {
  const { data, error } = await supabase
    .from('checkin_sessions')
    .select('*')
    .eq('child_id', childId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data
}

export async function getMoodHistory(childId: string, limit = 30) {
  const { data, error } = await supabase
    .from('mood_meter_usage')
    .select('*')
    .eq('child_id', childId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data
}

export async function getEmotionGridHistory(childId: string, limit = 10) {
  const { data, error } = await supabase
    .from('emotion_grid_usage')
    .select(`
      *,
      emotion_grid_feelings (*)
    `)
    .eq('child_id', childId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data
}

export async function getWellbeingWheelHistory(childId: string, limit = 10) {
  const { data, error } = await supabase
    .from('wellbeing_wheel_usage')
    .select(`
      *,
      wellbeing_wheel_sections (*)
    `)
    .eq('child_id', childId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data
}

export async function getBreathingToolHistory(childId: string, limit = 20) {
  const { data, error } = await supabase
    .from('breathing_tool_usage')
    .select('*')
    .eq('child_id', childId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data
}

// Score Calculations
export function calculateAverageMood(moodData: MoodMeterUsage[]): number {
  if (moodData.length === 0) return 0
  const sum = moodData.reduce((acc, curr) => acc + curr.mood_numeric, 0)
  return sum / moodData.length
}

export function calculateWellbeingTrends(wheelData: any[]): Record<WellbeingSectionType, number[]> {
  const trends: any = {}
  const sections: WellbeingSectionType[] = [
    'my_friends', 'my_work', 'my_health', 'my_family',
    'my_fun_play', 'my_safety', 'my_emotions'
  ]

  sections.forEach(section => {
    trends[section] = []
  })

  wheelData.forEach(wheel => {
    if (wheel.wellbeing_wheel_sections) {
      wheel.wellbeing_wheel_sections.forEach((section: any) => {
        if (trends[section.section_name]) {
          trends[section.section_name].push(section.score_value)
        }
      })
    }
  })

  return trends
}

export function getEmotionFrequency(emotionData: any[]): Record<string, number> {
  const frequency: Record<string, number> = {}

  emotionData.forEach(grid => {
    if (grid.emotion_grid_feelings) {
      grid.emotion_grid_feelings.forEach((feeling: any) => {
        frequency[feeling.feeling_name] = (frequency[feeling.feeling_name] || 0) + 1
      })
    }
  })

  return frequency
}

// Data Aggregation
export async function getChildWellbeingSnapshot(childId: string) {
  const [
    sessions,
    moodData,
    emotionData,
    wheelData,
    breathingData
  ] = await Promise.all([
    getChildSessions(childId, 5),
    getMoodHistory(childId, 7),
    getEmotionGridHistory(childId, 5),
    getWellbeingWheelHistory(childId, 5),
    getBreathingToolHistory(childId, 10)
  ])

  return {
    recentSessions: sessions,
    averageMood: calculateAverageMood(moodData),
    moodTrend: moodData.map(m => m.mood_numeric),
    emotionFrequency: getEmotionFrequency(emotionData),
    wellbeingTrends: calculateWellbeingTrends(wheelData),
    breathingMinutes: breathingData.reduce((acc, b) => acc + (b.duration_seconds / 60), 0),
    lastCheckIn: sessions[0]?.created_at || null
  }
}

// Data Deletion (for testing)
export async function clearChildData(childId: string) {
  const tables = [
    'mood_meter_usage',
    'emotion_grid_usage',
    'wellbeing_wheel_usage',
    'breathing_tool_usage',
    'checkin_sessions'
  ]

  for (const table of tables) {
    const { error } = await supabase
      .from(table)
      .delete()
      .eq('child_id', childId)

    if (error) {
      console.error(`Error clearing ${table}:`, error)
    }
  }
}