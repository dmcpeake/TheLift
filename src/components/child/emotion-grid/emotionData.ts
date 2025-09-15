import { EmotionCategory } from '../../../types/database'

export interface Emotion {
  name: string
  category: EmotionCategory
  color: string
  bgColor: string
  borderColor: string
  definition?: string
  emoji?: string
}

export const emotionCategories = {
  'high-energy-uncomfortable': {
    label: 'High Energy - Uncomfortable',
    color: 'text-red-700',
    bgColor: 'bg-red-50',
    borderColor: 'border-red-200',
    emotions: [
      { name: 'Angry', emoji: '😠' },
      { name: 'Disgusted', emoji: '🤢' },
      { name: 'Embarrassed', emoji: '😳' },
      { name: 'Hurt', emoji: '😢' },
      { name: 'Jealous', emoji: '😒' },
      { name: 'Overwhelmed', emoji: '😵' },
      { name: 'Terrified', emoji: '😱' },
      { name: 'Shocked', emoji: '😲' },
      { name: 'Worried', emoji: '😟' }
    ]
  },
  'low-energy-uncomfortable': {
    label: 'Low Energy - Uncomfortable',
    color: 'text-gray-700',
    bgColor: 'bg-gray-50',
    borderColor: 'border-gray-200',
    emotions: [
      { name: 'Bored', emoji: '😑' },
      { name: 'Confused', emoji: '😕' },
      { name: 'Disappointed', emoji: '😞' },
      { name: 'Guilty', emoji: '😔' },
      { name: 'Hopeless', emoji: '😩' },
      { name: 'Lonely', emoji: '😔' },
      { name: 'Lost', emoji: '🫤' },
      { name: 'Resentful', emoji: '😤' },
      { name: 'Sad', emoji: '😢' }
    ]
  },
  'high-energy-comfortable': {
    label: 'High Energy - Comfortable',
    color: 'text-green-700',
    bgColor: 'bg-green-50',
    borderColor: 'border-green-200',
    emotions: [
      { name: 'Amazed', emoji: '🤩' },
      { name: 'Amused', emoji: '😄' },
      { name: 'Confident', emoji: '😎' },
      { name: 'Courageous', emoji: '💪' },
      { name: 'Excited', emoji: '🤗' },
      { name: 'Happy', emoji: '😊' },
      { name: 'Pleased', emoji: '😌' },
      { name: 'Motivated', emoji: '🔥' },
      { name: 'Proud', emoji: '😊' }
    ]
  },
  'low-energy-comfortable': {
    label: 'Low Energy - Comfortable',
    color: 'text-blue-700',
    bgColor: 'bg-blue-50',
    borderColor: 'border-blue-200',
    emotions: [
      { name: 'Accepted', emoji: '🤗' },
      { name: 'Calm', emoji: '😌' },
      { name: 'Content', emoji: '😊' },
      { name: 'Curious', emoji: '🤔' },
      { name: 'Hopeful', emoji: '🙂' },
      { name: 'Loved', emoji: '🥰' },
      { name: 'Relieved', emoji: '😮‍💨' },
      { name: 'Safe', emoji: '🛡️' },
      { name: 'Thankful', emoji: '🙏' }
    ]
  }
} as const

export const getAllEmotions = (): Emotion[] => {
  const emotions: Emotion[] = []

  Object.entries(emotionCategories).forEach(([category, data]) => {
    data.emotions.forEach(emotion => {
      emotions.push({
        name: emotion.name,
        category: category as EmotionCategory,
        color: data.color,
        bgColor: data.bgColor,
        borderColor: data.borderColor,
        emoji: emotion.emoji
      })
    })
  })

  return emotions
}