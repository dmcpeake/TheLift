import React from 'react'

// Force Tailwind to include these classes
const FORCE_COLORS = (
  <div className="hidden bg-green-500 bg-green-400 bg-yellow-400 bg-orange-400 bg-red-500 bg-gray-100" />
)

interface MoodData {
  created_at: string
  mood_numeric: number
  mood_level?: string
  notes?: string
}

interface MoodHeatmapProps {
  moodData: MoodData[]
  MOOD_EMOJIS: Record<number, string>
}

export function MoodHeatmap({ moodData, MOOD_EMOJIS }: MoodHeatmapProps) {
  // Group moods by date
  const moodByDate: Record<string, number> = {}

  moodData.forEach(mood => {
    const date = new Date(mood.created_at)
    const dateKey = date.toISOString().split('T')[0]
    moodByDate[dateKey] = mood.mood_numeric
  })

  // Debug: Log the mood dates
  console.log('Mood dates in heatmap:', Object.keys(moodByDate))

  // Generate calendar grid for Jan-Apr 2025
  const months = [
    { name: 'January', year: 2025, days: 31, startDay: 3 }, // Jan 1, 2025 is Wednesday
    { name: 'February', year: 2025, days: 28, startDay: 6 }, // Feb 1, 2025 is Saturday
    { name: 'March', year: 2025, days: 31, startDay: 6 }, // Mar 1, 2025 is Saturday
    { name: 'April', year: 2025, days: 30, startDay: 2 }, // Apr 1, 2025 is Tuesday
  ]

  const getMoodColor = (mood: number | undefined) => {
    if (!mood) return 'bg-gray-100'
    switch(mood) {
      case 5: return 'bg-green-500'
      case 4: return 'bg-green-400'
      case 3: return 'bg-yellow-400'
      case 2: return 'bg-orange-400'
      case 1: return 'bg-red-500'
      default: return 'bg-gray-100'
    }
  }

  const getMoodEmoji = (mood: number | undefined) => {
    if (!mood || !MOOD_EMOJIS[mood]) return ''
    return MOOD_EMOJIS[mood]
  }

  return (
    <>
      {FORCE_COLORS}
      <div className="space-y-4">
        {/* Legend */}
      <div className="flex items-center justify-between text-xs">
        <div className="flex items-center space-x-3">
          <span className="text-gray-600">Mood Scale:</span>
          <div className="flex items-center space-x-1">
            <div className="w-4 h-4 bg-red-500 rounded"></div>
            <span>1 (😢)</span>
          </div>
          <div className="flex items-center space-x-1">
            <div className="w-4 h-4 bg-orange-400 rounded"></div>
            <span>2 (😕)</span>
          </div>
          <div className="flex items-center space-x-1">
            <div className="w-4 h-4 bg-yellow-400 rounded"></div>
            <span>3 (😐)</span>
          </div>
          <div className="flex items-center space-x-1">
            <div className="w-4 h-4 bg-green-400 rounded"></div>
            <span>4 (🙂)</span>
          </div>
          <div className="flex items-center space-x-1">
            <div className="w-4 h-4 bg-green-500 rounded"></div>
            <span>5 (😊)</span>
          </div>
        </div>
      </div>

      {/* Calendar Grid */}
      <div className="grid grid-cols-2 gap-4">
        {months.map((month, monthIdx) => (
          <div key={monthIdx} className="bg-white p-3 rounded-lg border border-gray-200">
            <h5 className="font-medium text-sm mb-2 text-gray-700">{month.name} {month.year}</h5>

            {/* Day headers */}
            <div className="grid grid-cols-7 gap-1 text-xs text-gray-500 mb-1">
              <div>S</div>
              <div>M</div>
              <div>T</div>
              <div>W</div>
              <div>T</div>
              <div>F</div>
              <div>S</div>
            </div>

            {/* Days grid */}
            <div className="grid grid-cols-7 gap-1">
              {/* Empty cells for days before month starts */}
              {Array.from({ length: month.startDay }).map((_, i) => (
                <div key={`empty-${i}`} className="aspect-square"></div>
              ))}

              {/* Days of the month */}
              {Array.from({ length: month.days }).map((_, dayIdx) => {
                const day = dayIdx + 1
                // Fix: monthIdx starts at 0, so January = 0, we need to add 1
                const monthNum = months.indexOf(month) + 1
                const dateStr = `${month.year}-${String(monthNum).padStart(2, '0')}-${String(day).padStart(2, '0')}`
                const mood = moodByDate[dateStr]

                return (
                  <div
                    key={day}
                    className={`aspect-square rounded-sm flex items-center justify-center text-xs ${getMoodColor(mood)} ${mood ? 'cursor-pointer hover:opacity-80' : ''}`}
                    title={mood ? `${month.name} ${day}: Mood ${mood}/5 ${getMoodEmoji(mood)}` : `${month.name} ${day}: No data`}
                  >
                    {mood ? getMoodEmoji(mood) : day}
                  </div>
                )
              })}
            </div>
          </div>
        ))}
      </div>

      {/* Summary Stats */}
      <div className="flex justify-between text-xs text-gray-600 pt-2 border-t">
        <span>Total check-ins: {moodData.length}</span>
        <span>
          Average mood: {moodData.length > 0 ?
            (moodData.reduce((sum, m) => sum + (m.mood_numeric || 0), 0) / moodData.length).toFixed(1)
            : 'N/A'}/5
        </span>
        <span>
          Period: {moodData.length > 0 ?
            (() => {
              const dates = moodData.map(m => new Date(m.created_at)).sort((a, b) => a.getTime() - b.getTime())
              const firstDate = dates[0]
              const lastDate = dates[dates.length - 1]
              return `${firstDate.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })} -
                      ${lastDate.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}`
            })()
            : 'No data'}
        </span>
      </div>
    </div>
    </>
  )
}