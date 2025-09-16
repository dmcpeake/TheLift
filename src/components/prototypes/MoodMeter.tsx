import React, { useState, useEffect } from 'react'

interface MoodData {
  mood_level: string
  mood_numeric: number
  selected_at: string
  time_to_select_seconds: number
}

interface MoodMeterProps {
  onComplete?: (data: MoodData) => void
  showNextButton?: boolean
  onSelectionMade?: () => void
  hideDebugInfo?: boolean
  triggerCompletion?: boolean
  initialData?: any
}

export function MoodMeter({ onComplete, showNextButton = false, onSelectionMade, hideDebugInfo = false, triggerCompletion = false, initialData }: MoodMeterProps = {}) {
  const [selectedMood, setSelectedMood] = useState<MoodData | null>(null)
  const [startTime] = useState(Date.now())

  // Initialize with existing data if available
  useEffect(() => {
    if (initialData && !selectedMood) {
      setSelectedMood(initialData)
      onSelectionMade?.()
    }
  }, [initialData, onSelectionMade])

  // Handle external trigger for completion
  useEffect(() => {
    if (triggerCompletion && selectedMood) {
      onComplete?.(selectedMood)
    }
  }, [triggerCompletion, selectedMood, onComplete])

  const moods = [
    { emoji: '😢', level: 'very_sad', numeric: 1, color: 'bg-red-500' },
    { emoji: '😞', level: 'sad', numeric: 2, color: 'bg-orange-500' },
    { emoji: '😐', level: 'ok', numeric: 3, color: 'bg-yellow-500' },
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
    onSelectionMade?.()
  }

  return (
    <>
      {/* Centered title like breathing exercise */}
      <div className="text-center" style={{ marginTop: '40px', marginBottom: '2rem' }}>
        <h1 className="text-gray-900 mb-2" style={{ fontSize: '40px', fontWeight: 600, letterSpacing: '0.02em' }}>How do you feel today?</h1>
      </div>

      <div className="flex flex-col items-center">
        <div className="mb-6 w-full max-w-2xl">
          <div className="flex gap-4 justify-center">
            {moods.map((mood) => (
              <button
                key={mood.level}
                onClick={() => handleMoodSelect(mood)}
                className={`
                  p-4 rounded-lg transition-all transform hover:scale-110
                  ${selectedMood?.mood_level === mood.level
                    ? 'ring-4 ring-offset-2'
                    : 'bg-gray-100 hover:bg-gray-200'}
                `}
                style={{
                  backgroundColor: selectedMood?.mood_level === mood.level ? '#3a7ddc' : undefined,
                  color: selectedMood?.mood_level === mood.level ? 'white' : undefined,
                  boxShadow: selectedMood?.mood_level === mood.level ? `0 0 0 4px rgba(58, 125, 220, 0.3)` : undefined
                }}
              >
                <span className="text-4xl">{mood.emoji}</span>
                <p className="text-xs mt-2 font-medium">
                  {mood.level.replace('_', ' ')}
                </p>
              </button>
            ))}
          </div>
        </div>

        {selectedMood && !hideDebugInfo && (
          <div className="mt-6 max-w-2xl">
            <h3 className="text-lg font-semibold mb-2">📊 Data Captured:</h3>
            <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-sm">
              {JSON.stringify(selectedMood, null, 2)}
            </pre>
            <p className="text-xs text-gray-500 mt-2">
              ✅ This data would be sent to: /api/mood-meter
            </p>
          </div>
        )}
      </div>

      {selectedMood && showNextButton && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center z-1000">
          <button
            onClick={() => onComplete?.(selectedMood)}
            style={{
              width: '56px',
              height: '56px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              borderRadius: '50%',
              backgroundColor: '#3a7ddc',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
              border: 'none',
              cursor: 'pointer',
              transition: 'all 0.3s ease',
              color: 'white'
            }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
            aria-label="Next"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <polyline points="9,18 15,12 9,6"></polyline>
            </svg>
          </button>
        </div>
      )}
    </>
  )
}