import { BreathingTechnique } from './types'

export const BREATHING_TECHNIQUES: BreathingTechnique[] = [
  {
    id: 'balloon',
    name: 'Balloon Breathing',
    description: 'Imagine your belly is a balloon that inflates and deflates',
    pace: { in: 4, hold: 2, out: 2, label: 'Balloon' },
    cycles: 3,
    theme: {
      primaryColor: '#60a5fa', // Sky blue
      secondaryColor: '#fbbf24', // Warm yellow
      icon: '🎈'
    }
  },
  {
    id: 'belly',
    name: 'Belly Breathing',
    description: '2s in 2s out',
    pace: { in: 2, hold: 0, out: 2, label: 'Belly' },
    cycles: 4,
    theme: {
      primaryColor: '#34d399', // Green
      secondaryColor: '#6ee7b7', // Light green
      icon: '🫁'
    }
  },
  {
    id: 'box',
    name: 'Box Breathing',
    description: '2s in 2s hold 2s out 2s hold',
    pace: { in: 2, hold: 2, out: 2, holdAfter: 2, label: 'Box' },
    cycles: 4,
    theme: {
      primaryColor: '#3b82f6', // Blue
      secondaryColor: '#60a5fa', // Light blue
      icon: '📦'
    }
  }
]

export const getBreathingTechnique = (id: string): BreathingTechnique | undefined => {
  return BREATHING_TECHNIQUES.find(t => t.id === id)
}