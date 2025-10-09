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
  wellbeingData?: Record<string, any[]>
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

const CATEGORY_LABELS = {
  my_friends: 'Friends',
  my_work: 'Work/School',
  my_health: 'Health',
  my_family: 'Family',
  my_fun_play: 'Fun & Play',
  my_safety: 'Safety',
  my_emotions: 'Emotions'
}

export function ChildRadarComparison({ children, moodHistory, wellbeingData }: ChildRadarComparisonProps) {
  // Calculate wellbeing dimensions for each child
  const radarData = useMemo(() => {
    // Debug logging
    console.log('ChildRadarComparison - wellbeingData:', wellbeingData)
    console.log('ChildRadarComparison - children:', children)

    // Use the 7 wellbeing wheel categories
    const dimensions = [
      'Friends',
      'Work/School',
      'Health',
      'Family',
      'Fun & Play',
      'Safety',
      'Emotions'
    ]

    // Calculate average scores for each wellbeing category
    const calculateScores = (child: ChildData) => {
      const childWellbeing = wellbeingData?.[child.id] || []

      console.log(`Processing ${child.name} (${child.id}):`, {
        checkInCount: childWellbeing.length,
        hasWellbeingSections: childWellbeing.some(c => c.wellbeing_sections && c.wellbeing_sections.length > 0),
        firstCheckIn: childWellbeing[0],
        sectionNames: childWellbeing[0]?.wellbeing_sections?.map((s: any) => s.section_name)
      })

      // Calculate average score for each category
      const categoryScores: Record<string, number> = {
        my_friends: 50,
        my_work: 50,
        my_health: 50,
        my_family: 50,
        my_fun_play: 50,
        my_safety: 50,
        my_emotions: 50
      }

      if (childWellbeing.length > 0) {
        // Collect all scores for each category
        const categoryValues: Record<string, number[]> = {
          my_friends: [],
          my_work: [],
          my_health: [],
          my_family: [],
          my_fun_play: [],
          my_safety: [],
          my_emotions: []
        }

        childWellbeing.forEach(checkIn => {
          if (checkIn.wellbeing_sections) {
            checkIn.wellbeing_sections.forEach((section: any) => {
              if (categoryValues[section.section_name]) {
                categoryValues[section.section_name].push(section.mood_numeric)
              }
            })
          }
        })

        // Calculate averages and convert to 0-100 scale
        Object.keys(categoryValues).forEach(category => {
          const values = categoryValues[category]
          if (values.length > 0) {
            const avg = values.reduce((sum, val) => sum + val, 0) / values.length
            categoryScores[category] = Math.round((avg / 4) * 100) // Convert 1-4 scale to 0-100
          }
        })
      }

      return categoryScores
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

        // Map dimension labels to category keys
        const categoryKey = Object.entries(CATEGORY_LABELS).find(
          ([_, label]) => label === dimension
        )?.[0]

        if (categoryKey && scores[categoryKey] !== undefined) {
          value = scores[categoryKey]
        }

        dataPoint[`child_${index}`] = value
      })

      return dataPoint
    })
  }, [children, wellbeingData])

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
          Comparing {children.length} {children.length === 1 ? 'child' : 'children'} across seven wellbeing dimensions
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
      <div className="mt-4 grid grid-cols-2 lg:grid-cols-4 gap-2 text-xs">
        <div className="bg-blue-50 rounded-lg p-2">
          <div className="font-medium text-blue-900">Friends</div>
          <div className="text-blue-700 text-[10px]">Social connections</div>
        </div>
        <div className="bg-purple-50 rounded-lg p-2">
          <div className="font-medium text-purple-900">Work/School</div>
          <div className="text-purple-700 text-[10px]">Learning & achievement</div>
        </div>
        <div className="bg-red-50 rounded-lg p-2">
          <div className="font-medium text-red-900">Health</div>
          <div className="text-red-700 text-[10px]">Physical wellbeing</div>
        </div>
        <div className="bg-orange-50 rounded-lg p-2">
          <div className="font-medium text-orange-900">Family</div>
          <div className="text-orange-700 text-[10px]">Family relationships</div>
        </div>
        <div className="bg-green-50 rounded-lg p-2">
          <div className="font-medium text-green-900">Fun & Play</div>
          <div className="text-green-700 text-[10px]">Enjoyment & activities</div>
        </div>
        <div className="bg-indigo-50 rounded-lg p-2">
          <div className="font-medium text-indigo-900">Safety</div>
          <div className="text-indigo-700 text-[10px]">Feeling secure</div>
        </div>
        <div className="bg-pink-50 rounded-lg p-2">
          <div className="font-medium text-pink-900">Emotions</div>
          <div className="text-pink-700 text-[10px]">Emotional processing</div>
        </div>
      </div>
    </div>
  )
}