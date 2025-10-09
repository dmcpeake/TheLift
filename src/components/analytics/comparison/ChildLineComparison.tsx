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

// Wellbeing emoticons mapping (1-4 scale)
const WELLBEING_EMOJIS: Record<number, string> = {
  1: '😢',
  2: '😟',
  3: '😊',
  4: '😄'
}

const WELLBEING_LABELS: Record<number, string> = {
  1: 'Struggling',
  2: 'Okay',
  3: 'Good',
  4: 'Thriving'
}

// Custom Y-axis tick component to show number and emoticon
const CustomYAxisTick = ({ x, y, payload }: any) => {
  const emoji = WELLBEING_EMOJIS[payload.value] || ''
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

export function ChildLineComparison({ children, moodHistory, wellbeingData }: ChildLineComparisonProps) {
  // Prepare time series data
  const lineData = useMemo(() => {
    // Get all unique dates from all children's wellbeing check-ins
    const allDates = new Set<string>()
    children.forEach(child => {
      const childWellbeing = wellbeingData?.[child.id] || []
      childWellbeing.forEach(checkIn => {
        const date = new Date(checkIn.completed_at || checkIn.created_at)
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

      // Add each child's average wellbeing score for this date
      children.forEach(child => {
        const childWellbeing = wellbeingData?.[child.id] || []
        const checkInForDate = childWellbeing.find(checkIn => {
          const checkInDate = new Date(checkIn.completed_at || checkIn.created_at).toISOString().split('T')[0]
          return checkInDate === dateStr
        })

        // Calculate average score from all sections
        if (checkInForDate && checkInForDate.wellbeing_sections) {
          let totalScore = 0
          let sectionCount = 0

          checkInForDate.wellbeing_sections.forEach((section: any) => {
            totalScore += section.mood_numeric
            sectionCount++
          })

          dataPoint[child.id] = sectionCount > 0 ? totalScore / sectionCount : null
        } else {
          dataPoint[child.id] = null
        }
      })

      return dataPoint
    })
  }, [children, wellbeingData])

  // Calculate statistics for each child
  const childStats = useMemo(() => {
    return children.map(child => {
      const childWellbeing = wellbeingData?.[child.id] || []
      const recentCheckIns = childWellbeing.slice(0, 5) // Last 5 check-ins
      const olderCheckIns = childWellbeing.slice(5, 10) // Previous 5 check-ins

      // Calculate recent average
      let recentAvg = 0
      if (recentCheckIns.length > 0) {
        let totalScore = 0
        let sectionCount = 0

        recentCheckIns.forEach(checkIn => {
          if (checkIn.wellbeing_sections) {
            checkIn.wellbeing_sections.forEach((section: any) => {
              totalScore += section.mood_numeric
              sectionCount++
            })
          }
        })

        recentAvg = sectionCount > 0 ? totalScore / sectionCount : 0
      }

      // Calculate older average
      let olderAvg = 0
      if (olderCheckIns.length > 0) {
        let totalScore = 0
        let sectionCount = 0

        olderCheckIns.forEach(checkIn => {
          if (checkIn.wellbeing_sections) {
            checkIn.wellbeing_sections.forEach((section: any) => {
              totalScore += section.mood_numeric
              sectionCount++
            })
          }
        })

        olderAvg = sectionCount > 0 ? totalScore / sectionCount : 0
      }

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
  }, [children, wellbeingData])

  const CustomTooltip = ({ active, payload, label }: any) => {
    if (active && payload && payload.length) {
      return (
        <div className="bg-white border border-gray-200 rounded-lg p-3 shadow-lg">
          <p className="font-semibold text-gray-900 mb-2">{label}</p>
          {payload.map((entry: any) => {
            if (!entry.value) return null
            const emoji = WELLBEING_EMOJIS[Math.round(entry.value)] || ''
            const wellbeingLabel = WELLBEING_LABELS[Math.round(entry.value)] || ''
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
                  <span className="text-xs text-gray-500">({wellbeingLabel})</span>
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
          Average wellbeing scores over the last 30 check-in dates
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
            domain={[1, 4]}
            ticks={[1, 2, 3, 4]}
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