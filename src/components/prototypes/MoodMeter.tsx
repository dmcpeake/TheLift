import React, { useState } from 'react'

interface MoodData {
  mood_level: string
  mood_numeric: number
  selected_at: string
  time_to_select_seconds: number
}

export function MoodMeter() {
  const [selectedMood, setSelectedMood] = useState<MoodData | null>(null)
  const [startTime] = useState(Date.now())

  const moods = [
    { emoji: '😢', level: 'very_sad', numeric: 1, color: 'bg-red-500' },
    { emoji: '😞', level: 'sad', numeric: 2, color: 'bg-orange-500' },
    { emoji: '😐', level: 'neutral', numeric: 3, color: 'bg-yellow-500' },
    { emoji: '😊', level: 'happy', numeric: 4, color: 'bg-green-500' },
    { emoji: '😄', level: 'very_happy', numeric: 5, color: 'bg-blue-500' }
  ]

  const handleMoodSelect = (mood: typeof moods[0]) => {
    const timeToSelect = Math.round((Date.now() - startTime) / 1000)

    const data: MoodData = {
      mood_level: mood.level,
      mood_numeric: mood.numeric,
      selected_at: new Date().toISOString(),
      time_to_select_seconds: timeToSelect
    }

    console.log('🎯 MOOD METER DATA:', data)
    setSelectedMood(data)
  }

  return (
    <div className="p-6 bg-white rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-4">Mood Meter Prototype</h2>

      <div className="mb-6">
        <p className="text-gray-600 mb-4">How are you feeling today?</p>
        <div className="flex gap-4 justify-center">
          {moods.map((mood) => (
            <button
              key={mood.level}
              onClick={() => handleMoodSelect(mood)}
              className={`
                p-4 rounded-lg transition-all transform hover:scale-110
                ${selectedMood?.mood_level === mood.level
                  ? `${mood.color} ring-4 ring-offset-2 ring-gray-400`
                  : 'bg-gray-100 hover:bg-gray-200'}
              `}
            >
              <span className="text-4xl">{mood.emoji}</span>
              <p className="text-xs mt-2 font-medium">
                {mood.level.replace('_', ' ')}
              </p>
            </button>
          ))}
        </div>
      </div>

      {selectedMood && (
        <div className="mt-6">
          <h3 className="text-lg font-semibold mb-2">📊 Data Captured:</h3>
          <pre className="bg-gray-900 text-green-400 p-4 rounded-lg overflow-x-auto text-sm">
            {JSON.stringify(selectedMood, null, 2)}
          </pre>
          <p className="text-xs text-gray-500 mt-2">
            ✅ This data would be sent to: /api/mood-meter
          </p>
        </div>
      )}
    </div>
  )
}