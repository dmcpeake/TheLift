import { EMOTION_DATA, WELLBEING_SECTIONS } from '@/types/database'
import type { MoodType, EmotionCategory, WellbeingSectionName } from '@/types/database'

export function generateMockChildId() {
  return `child_${Math.random().toString(36).substr(2, 9)}`
}

export function generateMockSessionId() {
  return `session_${Math.random().toString(36).substr(2, 9)}`
}

export function getRandomMood(): MoodType {
  const moods: MoodType[] = ['very_sad', 'sad', 'ok', 'happy', 'very_happy']
  return moods[Math.floor(Math.random() * moods.length)]
}

export function getRandomEmotions(count: number = 3) {
  const allEmotions: Array<{ name: string; emoji: string; category: EmotionCategory }> = []
  
  Object.entries(EMOTION_DATA).forEach(([category, emotions]) => {
    emotions.forEach(emotion => {
      allEmotions.push({
        ...emotion,
        category: category as EmotionCategory
      })
    })
  })
  
  const shuffled = allEmotions.sort(() => 0.5 - Math.random())
  return shuffled.slice(0, Math.min(count, 3))
}

export function generateMockStory() {
  const stories = [
    "Today was challenging when my friend didn't want to play with me at recess. I felt left out and sad.",
    "I'm excited about the school play tomorrow! I've been practicing my lines all week.",
    "Math class was really hard today and I couldn't understand the problems. I felt frustrated.",
    "My team won the soccer game! I scored two goals and everyone cheered.",
    "I miss my grandparents. They live far away and I haven't seen them in months.",
    "I helped my little sister with her homework today and she gave me a big hug.",
    "Someone said something mean about my drawing in art class. It hurt my feelings.",
    "I'm nervous about the test tomorrow but I've studied hard.",
    "My best friend and I had an argument at lunch. We're not talking now.",
    "I got picked to be the line leader today! It made me feel special."
  ]
  return stories[Math.floor(Math.random() * stories.length)]
}

export function getRandomWellbeingScores() {
  const scores: Record<WellbeingSectionName, number> = {} as any
  WELLBEING_SECTIONS.forEach(section => {
    scores[section.id] = Math.floor(Math.random() * 5) + 1
  })
  return scores
}

export function getRandomWellbeingNotes() {
  const notes = [
    "I have good friends who care about me",
    "School is going well this week",
    "I've been eating healthy foods",
    "Family time has been fun lately",
    "I love playing video games with my brother",
    "I feel safe at home and school",
    "I'm learning to manage my feelings better",
    ""
  ]
  return notes[Math.floor(Math.random() * notes.length)]
}

export function generateMockBreathingSession() {
  const patterns = ['4-7-8', 'Box Breathing', 'Belly Breathing', '5-5-5']
  return {
    duration: Math.floor(Math.random() * 180) + 60,
    cycles: Math.floor(Math.random() * 10) + 3,
    pattern: patterns[Math.floor(Math.random() * patterns.length)]
  }
}

export function generateMockCheckInData() {
  const childId = generateMockChildId()
  const sessionId = generateMockSessionId()
  
  return {
    childId,
    sessionId,
    mood: getRandomMood(),
    emotions: getRandomEmotions(),
    story: generateMockStory(),
    wellbeingScores: getRandomWellbeingScores(),
    breathing: generateMockBreathingSession()
  }
}

export async function clearAllMockData(childId: string) {
  const { createClient } = await import('@/utils/supabase/client')
  const supabase = createClient()
  
  const tables = [
    'emotion_grid_feelings',
    'wellbeing_wheel_sections',
    'emotion_grid_usage',
    'mood_meter_usage',
    'breathing_tool_usage',
    'wellbeing_wheel_usage',
    'checkin_sessions',
    'child_profile_scores'
  ]
  
  for (const table of tables) {
    if (table === 'emotion_grid_feelings' || table === 'wellbeing_wheel_sections') {
      continue
    }
    
    await supabase
      .from(table)
      .delete()
      .eq('child_id', childId)
  }
  
  return { success: true, message: `Cleared all data for child: ${childId}` }
}