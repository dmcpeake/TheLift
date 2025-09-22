import { useMemo } from 'react'
import {
  RadarChart,
  PolarGrid,
  PolarAngleAxis,
  PolarRadiusAxis,
  Radar,
  Legend,
  ResponsiveContainer,
  Tooltip
} from 'recharts'

interface ChildData {
  id: string
  name: string
  averageMood?: number
  checkInCount?: number
  moodConsistency?: number
  engagementLevel?: number
  emotionalRange?: number
  positivityRate?: number
  supportNeeds?: number
  resilienceScore?: number
}

interface ChildRadarComparisonProps {
  children: ChildData[]
  moodHistory: Record<string, any[]>
}

// SEND-appropriate color palette
const CHILD_COLORS = [
  '#3B82F6', // Blue
  '#10B981', // Green
  '#8B5CF6', // Purple
  '#F59E0B', // Orange
  '#EC4899', // Pink
  '#14B8A6', // Teal
]

export function ChildRadarComparison({ children, moodHistory }: ChildRadarComparisonProps) {
  // Calculate wellbeing dimensions for each child
  const radarData = useMemo(() => {
    // Define dimensions with SEND-sensitive naming
    const dimensions = [
      'Emotional Wellbeing',
      'Engagement',
      'Consistency',
      'Emotional Expression',
      'Positive Experiences',
      'Resilience'
    ]

    // Calculate scores for each dimension
    const calculateScores = (child: ChildData) => {
      const childMoods = moodHistory[child.id] || []

      // Emotional Wellbeing (based on average mood)
      const emotionalWellbeing = child.averageMood
        ? Math.round(child.averageMood * 20) // Convert 1-5 to 0-100
        : 50

      // Engagement (based on check-in frequency)
      const maxCheckIns = Math.max(...children.map(c => c.checkInCount || 0))
      const engagement = child.checkInCount && maxCheckIns > 0
        ? Math.round((child.checkInCount / maxCheckIns) * 100)
        : 50

      // Consistency (mood stability - lower variance is higher score)
      let consistency = 50
      if (childMoods.length > 1) {
        const moodValues = childMoods.map(m => m.mood_numeric)
        const mean = moodValues.reduce((a, b) => a + b, 0) / moodValues.length
        const variance = moodValues.reduce((sum, val) => sum + Math.pow(val - mean, 2), 0) / moodValues.length
        // Convert variance (0-4 scale) to consistency score (0-100)
        consistency = Math.round(Math.max(0, 100 - (variance * 25)))
      }

      // Emotional Expression (range of emotions experienced)
      const uniqueMoods = new Set(childMoods.map(m => m.mood_numeric)).size
      const emotionalExpression = Math.round((uniqueMoods / 5) * 100)

      // Positive Experiences (percentage of moods 4 or 5)
      const positiveMoods = childMoods.filter(m => m.mood_numeric >= 4).length
      const positiveExperiences = childMoods.length > 0
        ? Math.round((positiveMoods / childMoods.length) * 100)
        : 50

      // Resilience (recovery from low moods)
      let resilience = 50
      if (childMoods.length > 2) {
        let recoveries = 0
        let lowMoods = 0
        for (let i = 0; i < childMoods.length - 1; i++) {
          if (childMoods[i].mood_numeric <= 2) {
            lowMoods++
            if (childMoods[i + 1].mood_numeric > childMoods[i].mood_numeric) {
              recoveries++
            }
          }
        }
        resilience = lowMoods > 0
          ? Math.round((recoveries / lowMoods) * 100)
          : 75 // Default high if no low moods
      }

      return {
        emotionalWellbeing,
        engagement,
        consistency,
        emotionalExpression,
        positiveExperiences,
        resilience
      }
    }

    // Transform data for radar chart
    return dimensions.map(dimension => {
      const dataPoint: any = {
        dimension,
        fullMark: 100,
      }

      children.forEach((child, index) => {
        const scores = calculateScores(child)
        let value = 50 // default

        switch(dimension) {
          case 'Emotional Wellbeing':
            value = scores.emotionalWellbeing
            break
          case 'Engagement':
            value = scores.engagement
            break
          case 'Consistency':
            value = scores.consistency
            break
          case 'Emotional Expression':
            value = scores.emotionalExpression
            break
          case 'Positive Experiences':
            value = scores.positiveExperiences
            break
          case 'Resilience':
            value = scores.resilience
            break
        }

        dataPoint[`child_${index}`] = value
      })

      return dataPoint
    })
  }, [children, moodHistory])

  const CustomTooltip = ({ active, payload, label }: any) => {
    if (active && payload && payload.length) {
      return (
        <div className="bg-white p-3 rounded-lg shadow-lg border border-gray-200">
          <p className="font-semibold text-gray-900 mb-2">{label}</p>
          {payload.map((entry: any, index: number) => (
            <div key={index} className="flex items-center space-x-2 text-sm">
              <div
                className="w-3 h-3 rounded-full"
                style={{ backgroundColor: entry.color }}
              />
              <span className="text-gray-700">{entry.name}:</span>
              <span className="font-medium">{entry.value}%</span>
            </div>
          ))}
        </div>
      )
    }
    return null
  }

  if (children.length === 0) {
    return (
      <div className="flex items-center justify-center h-[400px] text-gray-500">
        <p>Select children to compare their wellbeing profiles</p>
      </div>
    )
  }

  return (
    <div className="w-full">
      <div className="mb-4">
        <h3 className="text-base font-semibold text-gray-900 mb-1">
          Wellbeing Profile Comparison
        </h3>
        <p className="text-xs text-gray-600">
          Comparing {children.length} {children.length === 1 ? 'child' : 'children'} across six wellbeing dimensions
        </p>
      </div>

      <div className="grid grid-cols-[auto_1fr] gap-4">
        {/* Legend on the left side */}
        <div className="flex-shrink-0 min-w-[140px]">
          <div className="bg-gray-50 rounded-lg p-3">
            <p className="text-xs font-medium text-gray-700 mb-2">Children:</p>
            <div className="space-y-1.5">
              {children.map((child, index) => (
                <div key={child.id} className="flex items-center gap-2">
                  <div
                    className="w-3 h-3 rounded-full flex-shrink-0"
                    style={{ backgroundColor: CHILD_COLORS[index] }}
                  />
                  <span className="text-xs text-gray-700">{child.name}</span>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Chart on the right */}
        <div className="w-full min-w-0">
          <ResponsiveContainer width="100%" height={350}>
            <RadarChart data={radarData} margin={{ top: 20, right: 40, bottom: 10, left: 40 }}>
              <PolarGrid stroke="#E5E7EB" />
              <PolarAngleAxis
                dataKey="dimension"
                tick={{ fill: '#6B7280', fontSize: 10 }}
                className="text-xs"
              />
              <PolarRadiusAxis
                angle={90}
                domain={[0, 100]}
                tick={{ fill: '#9CA3AF', fontSize: 9 }}
                tickCount={5}
              />

              {children.map((child, index) => (
                <Radar
                  key={`child_${index}`}
                  name={child.name}
                  dataKey={`child_${index}`}
                  stroke={CHILD_COLORS[index]}
                  fill={CHILD_COLORS[index]}
                  fillOpacity={0.15}
                  strokeWidth={2}
                />
              ))}

              <Tooltip content={<CustomTooltip />} />
            </RadarChart>
          </ResponsiveContainer>
        </div>
      </div>

      {/* Dimension Explanations */}
      <div className="mt-4 grid grid-cols-2 lg:grid-cols-3 gap-2 text-xs">
        <div className="bg-blue-50 rounded-lg p-2">
          <div className="font-medium text-blue-900">Emotional Wellbeing</div>
          <div className="text-blue-700 text-[10px]">Overall mood levels</div>
        </div>
        <div className="bg-green-50 rounded-lg p-2">
          <div className="font-medium text-green-900">Engagement</div>
          <div className="text-green-700 text-[10px]">Check-in frequency</div>
        </div>
        <div className="bg-purple-50 rounded-lg p-2">
          <div className="font-medium text-purple-900">Consistency</div>
          <div className="text-purple-700 text-[10px]">Mood stability</div>
        </div>
        <div className="bg-orange-50 rounded-lg p-2">
          <div className="font-medium text-orange-900">Emotional Expression</div>
          <div className="text-orange-700 text-[10px]">Range of feelings</div>
        </div>
        <div className="bg-pink-50 rounded-lg p-2">
          <div className="font-medium text-pink-900">Positive Experiences</div>
          <div className="text-pink-700 text-[10px]">Frequency of positive moods</div>
        </div>
        <div className="bg-teal-50 rounded-lg p-2">
          <div className="font-medium text-teal-900">Resilience</div>
          <div className="text-teal-700 text-[10px]">Recovery from challenges</div>
        </div>
      </div>
    </div>
  )
}