import { BreathingTechnique } from './types'

export const BREATHING_TECHNIQUES: BreathingTechnique[] = [
  {
    id: 'belly',
    name: 'Belly Breathing',
    description: '2s in 2s out',
    pace: { in: 2, hold: 0, out: 2.167, holdAfter: 0.833, label: 'Belly' },
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
  },
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
    id: 'test',
    name: 'Test',
    description: '2s in 6s hold 2s out',
    pace: { in: 1.933, hold: 5.634, out: 1.833, label: 'Test' },
    cycles: 3,
    theme: {
      primaryColor: '#8b5cf6', // Purple
      secondaryColor: '#a78bfa', // Light purple
      icon: '🧪'
    }
  }
]

export const getBreathingTechnique = (id: string): BreathingTechnique | undefined => {
  return BREATHING_TECHNIQUES.find(t => t.id === id)
}