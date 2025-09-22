import { useMemo } from 'react'
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer
} from 'recharts'

interface ChildData {
  id: string
  name: string
  averageMood?: number
  checkInCount?: number
  initials?: string
}

interface ChildLineComparisonProps {
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

// Mood emoticons mapping
const MOOD_EMOJIS: Record<number, string> = {
  1: '😢',
  2: '😟',
  3: '😐',
  4: '😊',
  5: '😄'
}

const MOOD_LABELS: Record<number, string> = {
  1: 'Very Sad',
  2: 'Sad',
  3: 'Okay',
  4: 'Happy',
  5: 'Very Happy'
}

// Custom Y-axis tick component to show number and emoticon
const CustomYAxisTick = ({ x, y, payload }: any) => {
  const emoji = MOOD_EMOJIS[payload.value] || ''
  return (
    <g transform={`translate(${x},${y})`}>
      <text
        x={-5}
        y={0}
        dy={4}
        textAnchor="end"
        fill="#6B7280"
        fontSize={13}
      >
        {payload.value} {emoji}
      </text>
    </g>
  )
}

export function ChildLineComparison({ children, moodHistory }: ChildLineComparisonProps) {
  // Prepare time series data
  const lineData = useMemo(() => {
    // Get all unique dates from all children
    const allDates = new Set<string>()
    children.forEach(child => {
      const childMoods = moodHistory[child.id] || []
      childMoods.forEach(mood => {
        const date = new Date(mood.selected_at)
        const dateStr = date.toISOString().split('T')[0]
        allDates.add(dateStr)
      })
    })

    // Sort dates
    const sortedDates = Array.from(allDates).sort()

    // Get last 30 days of data
    const last30Days = sortedDates.slice(-30)

    // Create data points for each date
    return last30Days.map(dateStr => {
      const dataPoint: any = {
        date: new Date(dateStr).toLocaleDateString('en-GB', {
          day: 'numeric',
          month: 'short'
        })
      }

      // Add each child's mood for this date
      children.forEach(child => {
        const childMoods = moodHistory[child.id] || []
        const moodForDate = childMoods.find(mood => {
          const moodDate = new Date(mood.selected_at).toISOString().split('T')[0]
          return moodDate === dateStr
        })

        // Use the mood value or null if no data
        dataPoint[child.id] = moodForDate ? moodForDate.mood_numeric : null
      })

      return dataPoint
    })
  }, [children, moodHistory])

  // Calculate statistics for each child
  const childStats = useMemo(() => {
    return children.map(child => {
      const childMoods = moodHistory[child.id] || []
      const recentMoods = childMoods.slice(0, 10) // Last 10 check-ins
      const olderMoods = childMoods.slice(10, 20) // Previous 10 check-ins

      const recentAvg = recentMoods.length > 0
        ? recentMoods.reduce((sum, m) => sum + m.mood_numeric, 0) / recentMoods.length
        : 0

      const olderAvg = olderMoods.length > 0
        ? olderMoods.reduce((sum, m) => sum + m.mood_numeric, 0) / olderMoods.length
        : 0

      const trend = recentAvg > olderAvg + 0.3 ? 'improving'
        : recentAvg < olderAvg - 0.3 ? 'developing'
        : 'stable'

      return {
        id: child.id,
        name: child.name,
        trend,
        recentAvg: Math.round(recentAvg * 10) / 10,
        totalCheckIns: child.checkInCount || 0
      }
    })
  }, [children, moodHistory])

  const CustomTooltip = ({ active, payload, label }: any) => {
    if (active && payload && payload.length) {
      return (
        <div className="bg-white border border-gray-200 rounded-lg p-3 shadow-lg">
          <p className="font-semibold text-gray-900 mb-2">{label}</p>
          {payload.map((entry: any) => {
            if (!entry.value) return null
            const emoji = MOOD_EMOJIS[Math.round(entry.value)] || ''
            const moodLabel = MOOD_LABELS[Math.round(entry.value)] || ''
            return (
              <div key={entry.name} className="flex items-center justify-between space-x-3">
                <div className="flex items-center space-x-2">
                  <div
                    className="w-3 h-3 rounded-full"
                    style={{ backgroundColor: entry.color }}
                  />
                  <span className="text-gray-700">{entry.name}:</span>
                </div>
                <span className="font-medium flex items-center gap-1">
                  <span className="text-base">{emoji}</span>
                  <span className="text-sm">{entry.value.toFixed(1)}</span>
                  <span className="text-xs text-gray-500">({moodLabel})</span>
                </span>
              </div>
            )
          })}
        </div>
      )
    }
    return null
  }

  if (children.length === 0) {
    return (
      <div className="flex items-center justify-center h-[400px] text-gray-500">
        <p>Select children to see their wellbeing timeline</p>
      </div>
    )
  }

  return (
    <div className="w-full">
      <div className="mb-4">
        <h3 className="text-base font-semibold text-gray-900 mb-1">
          Wellbeing Timeline
        </h3>
        <p className="text-xs text-gray-600">
          Daily mood trends over the last 30 days
        </p>
      </div>

      {/* Line Chart */}
      <ResponsiveContainer width="100%" height={350}>
        <LineChart
          data={lineData}
          margin={{ top: 20, right: 30, left: 20, bottom: 5 }}
        >
          <CartesianGrid strokeDasharray="3 3" stroke="#E5E7EB" />
          <XAxis
            dataKey="date"
            tick={{ fontSize: 10, fill: '#6B7280' }}
            angle={-45}
            textAnchor="end"
            height={60}
          />
          <YAxis
            domain={[1, 5]}
            ticks={[1, 2, 3, 4, 5]}
            tick={<CustomYAxisTick />}
            width={50}
          />
          <Tooltip content={<CustomTooltip />} />
          <Legend
            wrapperStyle={{
              paddingTop: '10px',
              fontSize: '12px'
            }}
          />
          {children.map((child, index) => (
            <Line
              key={child.id}
              type="monotone"
              dataKey={child.id}
              name={child.name}
              stroke={CHILD_COLORS[index % CHILD_COLORS.length]}
              strokeWidth={2}
              dot={{ r: 3 }}
              connectNulls={true}
              activeDot={{ r: 5 }}
            />
          ))}
        </LineChart>
      </ResponsiveContainer>

      {/* Statistics Table */}
      <div className="mt-4 bg-gray-50 rounded-lg p-4">
        <h4 className="text-sm font-medium text-gray-900 mb-3">Recent Trends</h4>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
          {childStats.map((stat, index) => (
            <div
              key={stat.id}
              className="bg-white rounded-lg p-3 border border-gray-200 flex items-center justify-between"
            >
              <div className="flex items-center space-x-2">
                <div
                  className="w-3 h-3 rounded-full"
                  style={{ backgroundColor: CHILD_COLORS[index % CHILD_COLORS.length] }}
                />
                <span className="text-sm font-medium text-gray-900">{stat.name}</span>
              </div>
              <div className="flex items-center space-x-3">
                <span className="text-xs text-gray-600">
                  Avg: {stat.recentAvg}
                </span>
                <span className={`text-xs font-medium px-2 py-1 rounded ${
                  stat.trend === 'improving'
                    ? 'bg-green-100 text-green-700'
                    : stat.trend === 'developing'
                    ? 'bg-amber-100 text-amber-700'
                    : 'bg-gray-100 text-gray-700'
                }`}>
                  {stat.trend === 'improving' ? '↑ Improving'
                    : stat.trend === 'developing' ? '↓ Developing'
                    : '→ Stable'}
                </span>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Key Insights */}
      <div className="mt-4 grid grid-cols-1 md:grid-cols-2 gap-3 text-xs">
        <div className="p-3 bg-blue-50 rounded-lg">
          <span className="font-medium text-blue-900">Patterns to Notice:</span>
          <p className="text-blue-700 mt-1">
            Look for consistent upward trends and stable patterns as signs of wellbeing strength
          </p>
        </div>
        <div className="p-3 bg-purple-50 rounded-lg">
          <span className="font-medium text-purple-900">Support Indicators:</span>
          <p className="text-purple-700 mt-1">
            Declining trends or high variability may indicate need for additional support
          </p>
        </div>
      </div>
    </div>
  )
}