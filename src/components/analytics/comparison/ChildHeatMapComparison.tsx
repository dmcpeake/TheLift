import { useMemo } from 'react'

interface ChildData {
  id: string
  name: string
  averageMood?: number
  checkInCount?: number
  initials?: string
}

interface ChildHeatMapComparisonProps {
  children: ChildData[]
  moodHistory: Record<string, any[]>
  wellbeingData?: Record<string, any[]>
}

// Color functions for heat map cells - SEND appropriate colors (1-4 scale for wellbeing wheel)
const getHeatMapColor = (score: number): string => {
  if (score >= 3.5) return '#10B981' // Green - Thriving
  if (score >= 2.5) return '#3B82F6' // Blue - Doing well
  if (score >= 1.5) return '#F59E0B' // Orange - Variable
  if (score >= 1.0) return '#EF4444' // Red - Needs support
  return '#9CA3AF' // Gray - No data
}

const getTextColor = (score: number): string => {
  return score >= 3 ? 'white' : 'white'
}

// Helper functions defined outside component
const calculateConsistency = (moods: any[]): number => {
  const values = moods.map(m => m.mood_numeric)
  const mean = values.reduce((a, b) => a + b, 0) / values.length
  const variance = values.reduce((sum, val) => sum + Math.pow(val - mean, 2), 0) / values.length
  // Convert to 1-5 scale (lower variance = higher consistency)
  return Math.max(1, Math.min(5, 5 - variance))
}

const calculateTrend = (moods: any[]): number => {
  if (moods.length < 2) return 3 // neutral
  const recent = moods.slice(0, Math.floor(moods.length / 2))
  const older = moods.slice(Math.floor(moods.length / 2))
  const recentAvg = recent.reduce((sum, m) => sum + m.mood_numeric, 0) / recent.length
  const olderAvg = older.reduce((sum, m) => sum + m.mood_numeric, 0) / older.length
  const diff = recentAvg - olderAvg
  if (diff > 0.5) return 5 // improving
  if (diff < -0.5) return 1 // needs support
  return 3 // stable
}

export function ChildHeatMapComparison({ children, moodHistory, wellbeingData }: ChildHeatMapComparisonProps) {
  // Prepare heat map data with weekly breakdowns
  const heatMapData = useMemo(() => {
    // First, find the date range across all children using wellbeing data
    let earliestDate: Date | null = null
    let latestDate: Date | null = null

    children.forEach(child => {
      const childWellbeing = wellbeingData?.[child.id] || []
      childWellbeing.forEach(checkIn => {
        const checkInDate = new Date(checkIn.completed_at || checkIn.created_at)
        if (!earliestDate || checkInDate < earliestDate) earliestDate = checkInDate
        if (!latestDate || checkInDate > latestDate) latestDate = checkInDate
      })
    })

    // If no data, use current date as reference
    if (!latestDate) latestDate = new Date()
    if (!earliestDate) earliestDate = new Date()

    return children.map(child => {
      const childWellbeing = wellbeingData?.[child.id] || []

      // Group wellbeing scores by week for the last 12 weeks with data
      const weeklyScores: { [key: string]: number } = {}

      // Start from the latest date with data
      for (let i = 0; i < 12; i++) {
        const weekStart = new Date(latestDate)
        weekStart.setDate(latestDate.getDate() - (i * 7))
        const weekEnd = new Date(weekStart)
        weekEnd.setDate(weekStart.getDate() - 7)

        const weekCheckIns = childWellbeing.filter(checkIn => {
          const checkInDate = new Date(checkIn.completed_at || checkIn.created_at)
          return checkInDate >= weekEnd && checkInDate < weekStart
        })

        // Calculate average wellbeing score for the week
        let weekAvg = 0
        if (weekCheckIns.length > 0) {
          let totalScore = 0
          let sectionCount = 0

          weekCheckIns.forEach(checkIn => {
            if (checkIn.wellbeing_sections) {
              checkIn.wellbeing_sections.forEach((section: any) => {
                totalScore += section.mood_numeric
                sectionCount++
              })
            }
          })

          weekAvg = sectionCount > 0 ? totalScore / sectionCount : 0
        }

        weeklyScores[`W${12-i}`] = Math.round(weekAvg * 10) / 10
      }

      // Calculate average wellbeing score (1-4 scale)
      let avgScore = 0
      if (childWellbeing.length > 0) {
        let totalScore = 0
        let sectionCount = 0

        childWellbeing.forEach(checkIn => {
          if (checkIn.wellbeing_sections) {
            checkIn.wellbeing_sections.forEach((section: any) => {
              totalScore += section.mood_numeric
              sectionCount++
            })
          }
        })

        avgScore = sectionCount > 0 ? totalScore / sectionCount : 0
      }

      // Calculate trend using recent vs older check-ins
      const recentCheckIns = childWellbeing.slice(0, Math.floor(childWellbeing.length / 2))
      const olderCheckIns = childWellbeing.slice(Math.floor(childWellbeing.length / 2))

      let recentAvg = 0
      let olderAvg = 0

      if (recentCheckIns.length > 0) {
        let total = 0
        let count = 0
        recentCheckIns.forEach(ci => {
          ci.wellbeing_sections?.forEach((s: any) => {
            total += s.mood_numeric
            count++
          })
        })
        recentAvg = count > 0 ? total / count : 0
      }

      if (olderCheckIns.length > 0) {
        let total = 0
        let count = 0
        olderCheckIns.forEach(ci => {
          ci.wellbeing_sections?.forEach((s: any) => {
            total += s.mood_numeric
            count++
          })
        })
        olderAvg = count > 0 ? total / count : 0
      }

      const diff = recentAvg - olderAvg
      const trend = diff > 0.5 ? 5 : diff < -0.5 ? 1 : 3

      return {
        childId: child.id,
        name: child.name,
        initials: child.initials,
        scores: weeklyScores,
        averageMood: avgScore,
        consistency: 0,
        engagement: child.checkInCount || 0,
        trend,
        totalCheckIns: child.checkInCount || 0
      }
    })
  }, [children, wellbeingData])

  // Sort by average mood descending
  const sortedData = useMemo(() => {
    return [...heatMapData].sort((a, b) => b.averageMood - a.averageMood)
  }, [heatMapData])

  if (children.length === 0) {
    return (
      <div className="flex items-center justify-center h-[400px] text-gray-500">
        <p>Select children to see their wellbeing heat map</p>
      </div>
    )
  }

  return (
    <div className="w-full">
      <div className="mb-4">
        <h3 className="text-base font-semibold text-gray-900 mb-1">
          Wellbeing Heat Map
        </h3>
        <p className="text-xs text-gray-600">
          Weekly wellbeing patterns over 12 weeks (ranked by average score across all categories)
        </p>
      </div>

      {/* Heat Map Table */}
      <div className="overflow-x-auto bg-white rounded-lg border border-gray-200 shadow-sm">
        <table className="w-full">
          <thead>
            <tr className="border-b border-gray-200">
              <th className="text-left p-3 text-xs font-medium text-gray-700 sticky left-0 bg-gray-50 z-10 min-w-[120px]">
                Child
              </th>
              {['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7', 'W8', 'W9', 'W10', 'W11', 'W12'].map((week) => (
                <th key={week} className="p-2 text-center text-xs font-medium text-gray-600 min-w-[40px] bg-gray-50">
                  {week}
                </th>
              ))}
              <th className="p-2 text-center text-xs font-medium text-gray-700 min-w-[50px] bg-blue-50">
                Avg
              </th>
              <th className="p-2 text-center text-xs font-medium text-gray-700 min-w-[50px] bg-gray-50">
                Trend
              </th>
              <th className="p-2 text-center text-xs font-medium text-gray-700 min-w-[60px] bg-gray-50">
                Check-ins
              </th>
            </tr>
          </thead>
          <tbody>
            {sortedData.map((child, rankIndex) => (
              <tr key={child.childId} className="border-b border-gray-100 hover:bg-gray-50">
                <td className="p-3 text-xs font-medium text-gray-900 sticky left-0 bg-white z-10 border-r border-gray-200">
                  <div className="flex items-center space-x-2">
                    <span className="text-gray-400 text-[10px]">#{rankIndex + 1}</span>
                    <div className="truncate max-w-[100px]" title={child.name}>
                      {child.name}
                    </div>
                  </div>
                </td>
                {['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7', 'W8', 'W9', 'W10', 'W11', 'W12'].map((week) => {
                  const score = child.scores[week]
                  return (
                    <td key={week} className="p-1 text-center">
                      {score > 0 ? (
                        <div
                          className="w-8 h-8 mx-auto rounded flex items-center justify-center text-xs font-medium transition-transform hover:scale-110"
                          style={{
                            backgroundColor: getHeatMapColor(score),
                            color: getTextColor(score)
                          }}
                          title={`Week ${week}: ${score}/4`}
                        >
                          {score}
                        </div>
                      ) : (
                        <div className="w-8 h-8 mx-auto rounded bg-gray-100 flex items-center justify-center">
                          <span className="text-gray-400 text-[10px]">—</span>
                        </div>
                      )}
                    </td>
                  )
                })}
                <td className="p-2 text-center bg-blue-50">
                  <div className="font-medium text-sm text-blue-900">
                    {child.averageMood ? child.averageMood.toFixed(1) : '—'}
                  </div>
                </td>
                <td className="p-2 text-center">
                  <div
                    className="w-8 h-8 mx-auto rounded flex items-center justify-center text-xs font-medium"
                    style={{
                      backgroundColor: getHeatMapColor(child.trend),
                      color: 'white'
                    }}
                  >
                    {child.trend > 3 ? '↑' : child.trend < 3 ? '↓' : '→'}
                  </div>
                </td>
                <td className="p-2 text-center">
                  <span className="text-xs font-medium text-gray-700">
                    {child.totalCheckIns}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Legend */}
      <div className="mt-4 flex items-center justify-center space-x-4 text-xs">
        <div className="flex items-center space-x-1">
          <div className="w-4 h-4 rounded" style={{ backgroundColor: '#10B981' }}></div>
          <span className="text-gray-600">Thriving (3.5-4)</span>
        </div>
        <div className="flex items-center space-x-1">
          <div className="w-4 h-4 rounded" style={{ backgroundColor: '#3B82F6' }}></div>
          <span className="text-gray-600">Doing well (2.5-3.5)</span>
        </div>
        <div className="flex items-center space-x-1">
          <div className="w-4 h-4 rounded" style={{ backgroundColor: '#F59E0B' }}></div>
          <span className="text-gray-600">Variable (1.5-2.5)</span>
        </div>
        <div className="flex items-center space-x-1">
          <div className="w-4 h-4 rounded" style={{ backgroundColor: '#EF4444' }}></div>
          <span className="text-gray-600">Needs support (1-1.5)</span>
        </div>
      </div>
    </div>
  )
}