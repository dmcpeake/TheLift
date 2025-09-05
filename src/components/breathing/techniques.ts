import { BreathingTechnique } from './types'

export const BREATHING_TECHNIQUES: BreathingTechnique[] = [
  {
    id: 'balloon',
    name: 'Balloon Breathing',
    description: 'Imagine your belly is a balloon that inflates and deflates',
    pace: { in: 4, hold: 2, out: 2, label: 'Balloon' },
    cycles: 5,
    theme: {
      primaryColor: '#60a5fa', // Sky blue
      secondaryColor: '#fbbf24', // Warm yellow
      icon: '🎈'
    }
  },
  {
    id: 'square',
    name: 'Square Breathing',
    description: 'Breathe along the sides of a square - in, hold, out, hold',
    pace: { in: 4, hold: 4, out: 4, holdAfter: 4, label: 'Square' },
    cycles: 4,
    theme: {
      primaryColor: '#a78bfa', // Purple
      secondaryColor: '#c084fc', // Light purple
      icon: '◻️'
    }
  },
  {
    id: 'rainbow',
    name: 'Rainbow Breathing',
    description: 'Breathe in colors of the rainbow',
    pace: { in: 5, hold: 2, out: 5, label: 'Rainbow' },
    cycles: 7, // One for each color
    theme: {
      primaryColor: '#f472b6', // Pink
      secondaryColor: '#fbbf24', // Yellow
      icon: '🌈'
    }
  },
  {
    id: 'flower',
    name: 'Flower Breathing',
    description: 'Smell the flower, blow the petals',
    pace: { in: 4, hold: 1, out: 4, label: 'Flower' },
    cycles: 5,
    theme: {
      primaryColor: '#f472b6', // Pink
      secondaryColor: '#86efac', // Light green
      icon: '🌸'
    }
  }
]

export const getBreathingTechnique = (id: string): BreathingTechnique | undefined => {
  return BREATHING_TECHNIQUES.find(t => t.id === id)
}