import React, { createContext, useState, useEffect, useContext, ReactNode } from 'react'

interface GamificationState {
  totalPoints: number
  currentLevel: number
  pointsHistory: PointsEntry[]
}

interface PointsEntry {
  action: string
  points: number
  timestamp: number
}

interface GamificationContextType extends GamificationState {
  awardPoints: (action: string, points: number) => void
  getProgressToNextLevel: () => { current: number; required: number; percentage: number }
  getPointsForLevel: (level: number) => number
  resetProgress: () => void
}

const GamificationContext = createContext<GamificationContextType | undefined>(undefined)

// Level progression formula: 250, 500, 1000, 2000, 4000, etc. (doubling after level 1)
const getPointsForLevel = (level: number): number => {
  if (level <= 0) return 0
  if (level === 1) return 250
  if (level === 2) return 500
  // For level 3+: exponential growth (doubling each level)
  return 1000 * Math.pow(2, level - 3)
}

// Calculate current level based on total points
const calculateLevel = (totalPoints: number): number => {
  let level = 0
  let cumulativePoints = 0

  for (let i = 1; i <= 50; i++) {
    const pointsNeeded = getPointsForLevel(i)
    if (totalPoints >= cumulativePoints + pointsNeeded) {
      cumulativePoints += pointsNeeded
      level = i
    } else {
      break
    }
  }

  return level
}

// Calculate cumulative points needed to reach a specific level
const getCumulativePointsForLevel = (level: number): number => {
  let cumulative = 0
  for (let i = 1; i <= level; i++) {
    cumulative += getPointsForLevel(i)
  }
  return cumulative
}

export const GamificationProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [state, setState] = useState<GamificationState>(() => {
    // Load from localStorage on mount
    const saved = localStorage.getItem('gamificationState')
    if (saved) {
      try {
        return JSON.parse(saved)
      } catch (e) {
        console.error('Failed to parse gamification state:', e)
      }
    }
    return {
      totalPoints: 0,
      currentLevel: 0,
      pointsHistory: []
    }
  })

  // Save to localStorage whenever state changes
  useEffect(() => {
    localStorage.setItem('gamificationState', JSON.stringify(state))
  }, [state])

  const awardPoints = (action: string, points: number) => {
    setState(prev => {
      const newTotalPoints = prev.totalPoints + points
      const newLevel = calculateLevel(newTotalPoints)

      return {
        totalPoints: newTotalPoints,
        currentLevel: newLevel,
        pointsHistory: [
          ...prev.pointsHistory,
          {
            action,
            points,
            timestamp: Date.now()
          }
        ]
      }
    })
  }

  const getProgressToNextLevel = () => {
    const nextLevel = state.currentLevel + 1
    const pointsForNextLevel = getPointsForLevel(nextLevel)
    const cumulativePointsForCurrentLevel = getCumulativePointsForLevel(state.currentLevel)
    const pointsIntoCurrentLevel = state.totalPoints - cumulativePointsForCurrentLevel

    return {
      current: pointsIntoCurrentLevel,
      required: pointsForNextLevel,
      percentage: (pointsIntoCurrentLevel / pointsForNextLevel) * 100
    }
  }

  const resetProgress = () => {
    setState({
      totalPoints: 0,
      currentLevel: 0,
      pointsHistory: []
    })
  }

  return (
    <GamificationContext.Provider
      value={{
        ...state,
        awardPoints,
        getProgressToNextLevel,
        getPointsForLevel,
        resetProgress
      }}
    >
      {children}
    </GamificationContext.Provider>
  )
}

export const useGamification = () => {
  const context = useContext(GamificationContext)
  if (context === undefined) {
    throw new Error('useGamification must be used within a GamificationProvider')
  }
  return context
}
