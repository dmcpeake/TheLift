import { useMemo, useState } from 'react'
import {
  ScatterChart,
  Scatter,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Cell,
  Label
} from 'recharts'

interface ChildData {
  id: string
  name: string
  averageMood?: number
  checkInCount?: number
  initials?: string
}

interface ChildScatterComparisonProps {
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

type MetricOption = 'friends' | 'work' | 'health' | 'family' | 'fun' | 'safety' | 'emotions'

const CATEGORY_LABELS: Record<MetricOption, string> = {
  friends: 'Friends',
  work: 'Work/School',
  health: 'Health',
  family: 'Family',
  fun: 'Fun & Play',
  safety: 'Safety',
  emotions: 'Emotions'
}

const CATEGORY_KEYS: Record<MetricOption, string> = {
  friends: 'my_friends',
  work: 'my_work',
  health: 'my_health',
  family: 'my_family',
  fun: 'my_fun_play',
  safety: 'my_safety',
  emotions: 'my_emotions'
}

export function ChildScatterComparison({ children, moodHistory, wellbeingData }: ChildScatterComparisonProps) {
  const [selectedMetric, setSelectedMetric] = useState<MetricOption>('emotions')

  // Transform data for scatter plot
  const scatterData = useMemo(() => {
    return children.map((child, index) => {
      const childWellbeing = wellbeingData?.[child.id] || []

      // Calculate overall average wellbeing score
      let overallAvg = 50
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

        overallAvg = sectionCount > 0 ? Math.round(((totalScore / sectionCount) / 4) * 100) : 50
      }

      // Calculate category-specific average
      const categoryKey = CATEGORY_KEYS[selectedMetric]
      let categoryAvg = 50

      if (childWellbeing.length > 0) {
        const categoryScores: number[] = []

        childWellbeing.forEach(checkIn => {
          if (checkIn.wellbeing_sections) {
            const section = checkIn.wellbeing_sections.find((s: any) => s.section_name === categoryKey)
            if (section) {
              categoryScores.push(section.mood_numeric)
            }
          }
        })

        if (categoryScores.length > 0) {
          const avg = categoryScores.reduce((sum, val) => sum + val, 0) / categoryScores.length
          categoryAvg = Math.round((avg / 4) * 100) // Convert 1-4 scale to 0-100
        }
      }

      return {
        x: overallAvg,
        y: categoryAvg,
        name: child.name,
        childId: child.id,
        color: CHILD_COLORS[index % CHILD_COLORS.length],
        totalCheckIns: child.checkInCount || 0,
        metricValue: categoryAvg,
        metricLabel: CATEGORY_LABELS[selectedMetric]
      }
    })
  }, [children, selectedMetric, wellbeingData])

  const CustomTooltip = ({ active, payload }: any) => {
    if (active && payload && payload.length) {
      const data = payload[0].payload
      return (
        <div className="bg-white border border-gray-200 rounded-lg p-3 shadow-lg">
          <p className="font-semibold text-gray-900">{data.name}</p>
          <p className="text-sm text-gray-700">
            Wellbeing Score: {Math.round(data.x)}%
          </p>
          <p className="text-sm text-gray-700">
            {data.metricLabel}: {data.metricValue}%
          </p>
          <p className="text-xs text-gray-600">
            Check-ins: {data.totalCheckIns}
          </p>
        </div>
      )
    }
    return null
  }

  const metricOptions: { value: MetricOption; label: string; description: string }[] = [
    { value: 'friends', label: 'Friends', description: 'Social connections and peer relationships' },
    { value: 'work', label: 'Work/School', description: 'Learning, achievement, and school experience' },
    { value: 'health', label: 'Health', description: 'Physical wellbeing and health concerns' },
    { value: 'family', label: 'Family', description: 'Family relationships and home life' },
    { value: 'fun', label: 'Fun & Play', description: 'Enjoyment, activities, and recreation' },
    { value: 'safety', label: 'Safety', description: 'Feeling secure and protected' },
    { value: 'emotions', label: 'Emotions', description: 'Emotional processing and regulation' }
  ]

  if (children.length === 0) {
    return (
      <div className="flex items-center justify-center h-[400px] text-gray-500">
        <p>Select children to see their wellbeing scatter plot</p>
      </div>
    )
  }

  return (
    <div className="w-full">
      <div className="mb-4">
        <div className="flex items-start justify-between mb-2">
          <div>
            <h3 className="text-base font-semibold text-gray-900 mb-1">
              Category Correlation Analysis
            </h3>
            <p className="text-xs text-gray-600">
              Exploring relationship between overall wellbeing and {CATEGORY_LABELS[selectedMetric]}
            </p>
          </div>

          {/* Metric Selector */}
          <select
            value={selectedMetric}
            onChange={(e) => setSelectedMetric(e.target.value as MetricOption)}
            className="px-3 py-1 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            {metricOptions.map(option => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        </div>
      </div>

      {/* Scatter Chart */}
      <ResponsiveContainer width="100%" height={350}>
        <ScatterChart margin={{ top: 20, right: 20, bottom: 60, left: 60 }}>
          <CartesianGrid strokeDasharray="3 3" stroke="#E5E7EB" />
          <XAxis
            type="number"
            dataKey="x"
            name="Wellbeing"
            domain={[0, 100]}
            tick={{ fontSize: 11, fill: '#6B7280' }}
          >
            <Label
              value="Overall Wellbeing Score"
              position="insideBottom"
              offset={-5}
              style={{ fontSize: 12, fill: '#4B5563' }}
            />
          </XAxis>
          <YAxis
            type="number"
            dataKey="y"
            name={selectedMetric}
            domain={[0, 100]}
            tick={{ fontSize: 11, fill: '#6B7280' }}
          >
            <Label
              value={metricOptions.find(m => m.value === selectedMetric)?.label || ''}
              angle={-90}
              position="insideLeft"
              style={{ fontSize: 12, fill: '#4B5563' }}
            />
          </YAxis>
          <Tooltip content={<CustomTooltip />} />
          <Scatter
            name="Children"
            data={scatterData}
            fill="#8884d8"
          >
            {scatterData.map((entry, index) => (
              <Cell key={`cell-${index}`} fill={entry.color} />
            ))}
          </Scatter>
        </ScatterChart>
      </ResponsiveContainer>

      {/* Data Points Legend */}
      <div className="mt-4 flex flex-wrap gap-3 justify-center">
        {scatterData.map((child, index) => (
          <div key={child.childId} className="flex items-center space-x-2">
            <div
              className="w-3 h-3 rounded-full"
              style={{ backgroundColor: child.color }}
            />
            <span className="text-xs text-gray-700">{child.name}</span>
          </div>
        ))}
      </div>

      {/* Metric Description */}
      <div className="mt-4 p-3 bg-gray-50 rounded-lg">
        <p className="text-xs text-gray-600">
          <span className="font-medium">Current metric:</span>{' '}
          {metricOptions.find(m => m.value === selectedMetric)?.description}
        </p>
      </div>

      {/* Quadrant Analysis */}
      <div className="mt-4 grid grid-cols-2 gap-2 text-xs">
        <div className="p-2 bg-green-50 rounded-lg">
          <span className="font-medium text-green-900">High Overall + High {CATEGORY_LABELS[selectedMetric]}:</span>
          <span className="text-green-700 ml-1">Thriving in this area</span>
        </div>
        <div className="p-2 bg-blue-50 rounded-lg">
          <span className="font-medium text-blue-900">High Overall + Low {CATEGORY_LABELS[selectedMetric]}:</span>
          <span className="text-blue-700 ml-1">Specific area needs support</span>
        </div>
        <div className="p-2 bg-orange-50 rounded-lg">
          <span className="font-medium text-orange-900">Low Overall + High {CATEGORY_LABELS[selectedMetric]}:</span>
          <span className="text-orange-700 ml-1">Strength to build on</span>
        </div>
        <div className="p-2 bg-red-50 rounded-lg">
          <span className="font-medium text-red-900">Low Overall + Low {CATEGORY_LABELS[selectedMetric]}:</span>
          <span className="text-red-700 ml-1">Priority support needed</span>
        </div>
      </div>
    </div>
  )
}