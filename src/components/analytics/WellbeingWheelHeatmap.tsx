import React, { useState } from 'react'

interface WellbeingSection {
  section_name: string
  mood_numeric: number
  text_response: string
}

interface WellbeingCheckIn {
  id: string
  created_at: string
  wellbeing_score?: number
  wellbeing_sections?: WellbeingSection[]
}

interface WellbeingWheelHeatmapProps {
  checkIns: WellbeingCheckIn[]
  selectedCheckInId?: string
  onCheckInSelect?: (checkInId: string) => void
}

const SECTION_LABELS = {
  my_friends: 'Friends',
  my_work: 'Work/School',
  my_health: 'Health',
  my_family: 'Family',
  my_fun_play: 'Fun & Play',
  my_safety: 'Safety',
  my_emotions: 'Emotions'
}

const SECTION_ORDER = ['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions']

const MOOD_COLORS = {
  1: '#EF4444', // Red
  2: '#F97316', // Orange
  3: '#FCD34D', // Yellow
  4: '#10B981'  // Green
}

const MOOD_EMOJIS = {
  1: '😢',
  2: '😕',
  3: '😐',
  4: '😊'
}

export function WellbeingWheelHeatmap({ checkIns, selectedCheckInId, onCheckInSelect }: WellbeingWheelHeatmapProps) {
  // Sort check-ins by date (most recent first)
  const sortedCheckIns = [...checkIns]
    .filter(c => c.wellbeing_sections && c.wellbeing_sections.length > 0)
    .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
    .slice(0, 15) // Increased from 10 to 15 to show all 12 weeks of demo data
    .reverse() // Display oldest to newest (left to right)

  const handleColumnClick = (checkInId: string) => {
    if (onCheckInSelect) {
      onCheckInSelect(checkInId)
    }
  }

  if (sortedCheckIns.length === 0) {
    return (
      <div className="text-sm text-gray-500 text-center py-8">
        No wellbeing wheel check-ins available
      </div>
    )
  }

  // Create a map of section scores by date
  const heatmapData = SECTION_ORDER.map(sectionName => {
    const sectionScores = sortedCheckIns.map(checkIn => {
      const section = checkIn.wellbeing_sections?.find(s => s.section_name === sectionName)
      return {
        date: checkIn.created_at,
        score: section?.mood_numeric || 0,
        response: section?.text_response || ''
      }
    })
    return {
      sectionName,
      label: SECTION_LABELS[sectionName as keyof typeof SECTION_LABELS],
      scores: sectionScores
    }
  })

  return (
    <div className="w-full">
      <div className="w-full">
        {/* Header with dates */}
        <div className="flex mb-2">
          <div className="w-24 flex-shrink-0" /> {/* Spacer for category labels */}
          <div className="flex-1 flex gap-1 items-end">
            {sortedCheckIns.map((checkIn, idx) => {
              const date = new Date(checkIn.created_at)
              const month = date.toLocaleDateString('en-US', { month: 'short' })
              const day = date.getDate()

              return (
                <div
                  key={idx}
                  className="flex-1 text-xs text-gray-500 text-center"
                  title={date.toLocaleDateString('en-US', {
                    month: 'long',
                    day: 'numeric',
                    year: 'numeric'
                  })}
                >
                  <div>{month}</div>
                  <div>{day}</div>
                </div>
              )
            })}
          </div>
        </div>

        {/* Heatmap rows */}
        {heatmapData.map((row, rowIdx) => (
          <div key={rowIdx} className="flex items-center mb-1">
            {/* Category label */}
            <div className="w-24 flex-shrink-0 text-xs font-medium text-gray-700 pr-2">
              {row.label}
            </div>

            {/* Score cells */}
            <div className="flex-1 flex gap-1">
              {row.scores.map((cell, cellIdx) => {
                const checkIn = sortedCheckIns[cellIdx]
                const isSelected = checkIn && selectedCheckInId === checkIn.id

                return (
                  <div
                    key={cellIdx}
                    onClick={() => checkIn && handleColumnClick(checkIn.id)}
                    className="flex-1 h-10 rounded flex items-center justify-center cursor-pointer transition-all hover:scale-105 relative"
                    style={{
                      background: isSelected
                        ? `linear-gradient(135deg,
                            ${cell.score > 0 ? MOOD_COLORS[cell.score as keyof typeof MOOD_COLORS] : '#E5E7EB'} 0%,
                            ${cell.score > 0 ? MOOD_COLORS[cell.score as keyof typeof MOOD_COLORS] : '#E5E7EB'}dd 60%,
                            #3B82F699 100%)`
                        : cell.score > 0 ? MOOD_COLORS[cell.score as keyof typeof MOOD_COLORS] : '#E5E7EB',
                      opacity: isSelected ? 1 : (cell.score > 0 ? 0.9 : 0.3),
                      boxShadow: isSelected ? '0 4px 12px rgba(59, 130, 246, 0.3), inset 0 0 0 1px rgba(59, 130, 246, 0.4)' : 'none'
                    }}
                    title={cell.score > 0 ? `${row.label}: ${cell.score}/4 - "${cell.response}"` : 'No data'}
                  >
                    <span className="text-sm relative z-10">
                      {cell.score > 0 ? MOOD_EMOJIS[cell.score as keyof typeof MOOD_EMOJIS] : ''}
                    </span>
                  </div>
                )
              })}
            </div>
          </div>
        ))}

        {/* Legend */}
        <div className="flex items-center justify-center gap-4 mt-4 text-xs text-gray-600">
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded" style={{ backgroundColor: MOOD_COLORS[1] }} />
            <span>1 😢</span>
          </div>
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded" style={{ backgroundColor: MOOD_COLORS[2] }} />
            <span>2 😕</span>
          </div>
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded" style={{ backgroundColor: MOOD_COLORS[3] }} />
            <span>3 😐</span>
          </div>
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded" style={{ backgroundColor: MOOD_COLORS[4] }} />
            <span>4 😊</span>
          </div>
        </div>
      </div>
    </div>
  )
}
