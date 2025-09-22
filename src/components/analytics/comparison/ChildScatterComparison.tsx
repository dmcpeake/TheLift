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

type MetricOption = 'consistency' | 'positivity' | 'engagement' | 'resilience'

export function ChildScatterComparison({ children, moodHistory }: ChildScatterComparisonProps) {
  const [selectedMetric, setSelectedMetric] = useState<MetricOption>('consistency')

  // Transform data for scatter plot
  const scatterData = useMemo(() => {
    return children.map((child, index) => {
      const childMoods = moodHistory[child.id] || []

      let yValue: number = 0
      let metricLabel: string = ''

      switch(selectedMetric) {
        case 'consistency':
          // Calculate mood consistency (lower variance = higher consistency)
          if (childMoods.length > 1) {
            const values = childMoods.map(m => m.mood_numeric)
            const mean = values.reduce((a, b) => a + b, 0) / values.length
            const variance = values.reduce((sum, val) => sum + Math.pow(val - mean, 2), 0) / values.length
            yValue = Math.round((100 - (variance * 25)) * 10) / 10 // Convert to 0-100 scale
          } else {
            yValue = 50
          }
          metricLabel = 'Mood Consistency'
          break

        case 'positivity':
          // Calculate percentage of positive moods (4 or 5)
          const positiveMoods = childMoods.filter(m => m.mood_numeric >= 4).length
          yValue = childMoods.length > 0
            ? Math.round((positiveMoods / childMoods.length) * 100)
            : 0
          metricLabel = 'Positive Experiences'
          break

        case 'engagement':
          // Engagement based on check-in frequency
          const maxCheckIns = Math.max(...children.map(c => c.checkInCount || 0))
          yValue = child.checkInCount && maxCheckIns > 0
            ? Math.round((child.checkInCount / maxCheckIns) * 100)
            : 0
          metricLabel = 'Engagement Level'
          break

        case 'resilience':
          // Recovery rate from low moods
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
          yValue = lowMoods > 0
            ? Math.round((recoveries / lowMoods) * 100)
            : 75 // Default if no low moods
          metricLabel = 'Resilience Score'
          break
      }

      return {
        x: (child.averageMood || 2.5) * 20, // Convert 1-5 scale to 20-100
        y: yValue,
        name: child.name,
        childId: child.id,
        color: CHILD_COLORS[index % CHILD_COLORS.length],
        totalCheckIns: child.checkInCount || 0,
        metricValue: yValue,
        metricLabel
      }
    })
  }, [children, selectedMetric, moodHistory])

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
    { value: 'consistency', label: 'Consistency', description: 'How stable mood patterns are' },
    { value: 'positivity', label: 'Positivity', description: 'Frequency of positive moods' },
    { value: 'engagement', label: 'Engagement', description: 'Check-in participation rate' },
    { value: 'resilience', label: 'Resilience', description: 'Recovery from challenges' }
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
              Wellbeing Correlation Analysis
            </h3>
            <p className="text-xs text-gray-600">
              Exploring relationships between wellbeing score and {selectedMetric}
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
          <span className="font-medium text-green-900">High Wellbeing + High {selectedMetric}:</span>
          <span className="text-green-700 ml-1">Thriving children</span>
        </div>
        <div className="p-2 bg-blue-50 rounded-lg">
          <span className="font-medium text-blue-900">High Wellbeing + Low {selectedMetric}:</span>
          <span className="text-blue-700 ml-1">Monitor for support</span>
        </div>
        <div className="p-2 bg-orange-50 rounded-lg">
          <span className="font-medium text-orange-900">Low Wellbeing + High {selectedMetric}:</span>
          <span className="text-orange-700 ml-1">Hidden struggles</span>
        </div>
        <div className="p-2 bg-red-50 rounded-lg">
          <span className="font-medium text-red-900">Low Wellbeing + Low {selectedMetric}:</span>
          <span className="text-red-700 ml-1">Priority support needed</span>
        </div>
      </div>
    </div>
  )
}