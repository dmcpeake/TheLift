import { getSupabaseClient } from '../supabase/client'
import { MoodType, EmotionCategory, WellbeingSectionType } from '../../types/database'

const supabase = getSupabaseClient()

// Mock data generators
export function generateRandomMood(): { value: number; label: MoodType } {
  const moods: { value: number; label: MoodType }[] = [
    { value: 1, label: 'very_sad' },
    { value: 2, label: 'sad' },
    { value: 3, label: 'ok' },
    { value: 4, label: 'happy' },
    { value: 5, label: 'very_happy' }
  ]
  return moods[Math.floor(Math.random() * moods.length)]
}

export function generateRandomEmotions(count: number = 3): Array<{
  name: string;
  category: EmotionCategory;
}> {
  const emotions = [
    { name: 'Happy', category: 'high-energy-comfortable' as EmotionCategory },
    { name: 'Excited', category: 'high-energy-comfortable' as EmotionCategory },
    { name: 'Calm', category: 'low-energy-comfortable' as EmotionCategory },
    { name: 'Content', category: 'low-energy-comfortable' as EmotionCategory },
    { name: 'Worried', category: 'high-energy-uncomfortable' as EmotionCategory },
    { name: 'Angry', category: 'high-energy-uncomfortable' as EmotionCategory },
    { name: 'Sad', category: 'low-energy-uncomfortable' as EmotionCategory },
    { name: 'Bored', category: 'low-energy-uncomfortable' as EmotionCategory }
  ]

  const shuffled = [...emotions].sort(() => 0.5 - Math.random())
  return shuffled.slice(0, count)
}

export function generateWellbeingScores(): Record<WellbeingSectionType, number> {
  const sections: WellbeingSectionType[] = [
    'my_friends', 'my_work', 'my_health', 'my_family',
    'my_fun_play', 'my_safety', 'my_emotions'
  ]

  const scores: any = {}
  sections.forEach(section => {
    scores[section] = Math.floor(Math.random() * 5) + 1
  })
  return scores
}

// Insert mock data for a child
export async function insertMockMoodData(childId: string, sessionId?: string) {
  const mood = generateRandomMood()
  const selectionTime = Math.floor(Math.random() * 10000) + 2000 // 2-12 seconds

  const { data, error } = await supabase
    .from('mood_meter_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null,
      mood_value: mood.value,
      mood_label: mood.label,
      selection_time_ms: selectionTime
    })
    .select()
    .single()

  if (error) throw error
  return data
}

export async function insertMockEmotionGridData(childId: string, sessionId?: string) {
  const emotions = generateRandomEmotions()
  const stories = [
    "I felt this way because we had a fun day at school today!",
    "My friend helped me with something difficult and it made me feel better.",
    "I'm a bit tired today but looking forward to the weekend.",
    "Had a great time playing with my family.",
    "School was challenging but I learned something new."
  ]

  const { data: gridData, error: gridError } = await supabase
    .from('emotion_grid_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null,
      story_text: stories[Math.floor(Math.random() * stories.length)],
      completion_time_ms: Math.floor(Math.random() * 60000) + 30000 // 30-90 seconds
    })
    .select()
    .single()

  if (gridError) throw gridError

  // Insert emotions
  const emotionInserts = emotions.map((emotion, index) => ({
    emotion_grid_id: gridData.id,
    feeling_name: emotion.name,
    category: emotion.category,
    selection_order: index + 1
  }))

  await supabase
    .from('emotion_grid_feelings')
    .insert(emotionInserts)

  return gridData
}

export async function insertMockWellbeingWheelData(childId: string, sessionId?: string) {
  const scores = generateWellbeingScores()
  const overallScore = Object.values(scores).reduce((a, b) => a + b, 0) / Object.keys(scores).length

  const { data: wheelData, error: wheelError } = await supabase
    .from('wellbeing_wheel_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null,
      overall_score: overallScore,
      completion_time_ms: Math.floor(Math.random() * 180000) + 120000 // 2-5 minutes
    })
    .select()
    .single()

  if (wheelError) throw wheelError

  // Insert section scores
  const sectionInserts = Object.entries(scores).map(([section, score]) => ({
    wellbeing_wheel_id: wheelData.id,
    section_name: section as WellbeingSectionType,
    score_value: score,
    score_label: ['very_sad', 'sad', 'ok', 'happy', 'very_happy'][score - 1] as MoodType,
    text_note: Math.random() > 0.7 ? 'Feeling good about this area' : null
  }))

  await supabase
    .from('wellbeing_wheel_sections')
    .insert(sectionInserts)

  return wheelData
}

export async function insertMockBreathingData(childId: string, sessionId?: string) {
  const patterns = ['4-7-8', 'box', 'belly', 'star']
  const duration = Math.floor(Math.random() * 300) + 60 // 1-6 minutes
  const cycles = Math.floor(duration / 15) // Approximate cycles

  const { data, error } = await supabase
    .from('breathing_tool_usage')
    .insert({
      child_id: childId,
      session_id: sessionId || null,
      duration_seconds: duration,
      cycles_completed: cycles,
      breathing_pattern: patterns[Math.floor(Math.random() * patterns.length)],
      start_time: new Date(Date.now() - duration * 1000).toISOString(),
      end_time: new Date().toISOString()
    })
    .select()
    .single()

  if (error) throw error
  return data
}

// Generate complete mock session
export async function generateMockSession(childId: string) {
  // Create session
  const { data: session, error: sessionError } = await supabase
    .from('checkin_sessions')
    .insert({
      child_id: childId,
      session_date: new Date().toISOString().split('T')[0],
      session_time: new Date().toTimeString().split(' ')[0],
      tools_completed: ['mood_meter', 'emotion_grid', 'wellbeing_wheel', 'breathing_tool'],
      mood_meter_completed: true,
      emotion_grid_completed: true,
      wellbeing_wheel_completed: true,
      breathing_tool_completed: true
    })
    .select()
    .single()

  if (sessionError) throw sessionError

  // Generate data for each tool
  await Promise.all([
    insertMockMoodData(childId, session.id),
    insertMockEmotionGridData(childId, session.id),
    insertMockWellbeingWheelData(childId, session.id),
    insertMockBreathingData(childId, session.id)
  ])

  return session
}

// Generate historical data
export async function generateHistoricalData(childId: string, days: number = 7) {
  const sessions = []

  for (let i = 0; i < days; i++) {
    const date = new Date()
    date.setDate(date.getDate() - i)

    const { data: session } = await supabase
      .from('checkin_sessions')
      .insert({
        child_id: childId,
        session_date: date.toISOString().split('T')[0],
        session_time: '09:00:00',
        tools_completed: ['mood_meter', 'wellbeing_wheel'],
        mood_meter_completed: true,
        wellbeing_wheel_completed: true,
        created_at: date.toISOString()
      })
      .select()
      .single()

    if (session) {
      await insertMockMoodData(childId, session.id)
      await insertMockWellbeingWheelData(childId, session.id)
      sessions.push(session)
    }
  }

  return sessions
}