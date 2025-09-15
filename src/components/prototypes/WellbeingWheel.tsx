import React, { useState } from 'react'

interface SectionData {
  name: string
  mood_level: string
  mood_numeric: number
  notes: string
}

interface WheelData {
  sections: SectionData[]
  overall_score: number
  completed_sections: number
  completed_at: string
  time_to_complete_seconds: number
}

export function WellbeingWheel() {
  const [sections, setSections] = useState<Record<string, SectionData>>({})
  const [currentSection, setCurrentSection] = useState<string | null>(null)
  const [tempNotes, setTempNotes] = useState('')
  const [finalData, setFinalData] = useState<WheelData | null>(null)
  const [startTime] = useState(Date.now())

  const wheelSections = [
    { id: 'family', name: 'Family & Friends', icon: '👨‍👩‍👧‍👦' },
    { id: 'school', name: 'School & Learning', icon: '📚' },
    { id: 'health', name: 'Health & Body', icon: '💪' },
    { id: 'emotions', name: 'Emotions & Feelings', icon: '❤️' },
    { id: 'fun', name: 'Fun & Hobbies', icon: '🎮' },
    { id: 'safety', name: 'Safety & Security', icon: '🛡️' },
    { id: 'growth', name: 'Growth & Goals', icon: '🌱' }
  ]

  const moods = [
    { emoji: '😢', level: 'very_sad', numeric: 1, color: 'bg-red-500' },
    { emoji: '😞', level: 'sad', numeric: 2, color: 'bg-orange-500' },
    { emoji: '😐', level: 'neutral', numeric: 3, color: 'bg-yellow-500' },
    { emoji: '😊', level: 'happy', numeric: 4, color: 'bg-green-500' },
    { emoji: '😄', level: 'very_happy', numeric: 5, color: 'bg-blue-500' }
  ]

  const selectMood = (sectionId: string, mood: typeof moods[0]) => {
    const section = wheelSections.find(s => s.id === sectionId)!
    const data: SectionData = {
      name: section.name,
      mood_level: mood.level,
      mood_numeric: mood.numeric,
      notes: tempNotes
    }

    setSections(prev => ({ ...prev, [sectionId]: data }))
    setCurrentSection(null)
    setTempNotes('')

    console.log(`🎯 WELLBEING WHEEL SECTION DATA - ${section.name}:`, data)
  }

  const completeWheel = () => {
    const timeToComplete = Math.round((Date.now() - startTime) / 1000)
    const sectionArray = Object.values(sections)
    const overallScore = sectionArray.length > 0
      ? sectionArray.reduce((sum, s) => sum + s.mood_numeric, 0) / sectionArray.length
      : 0

    const data: WheelData = {
      sections: sectionArray,
      overall_score: Number(overallScore.toFixed(1)),
      completed_sections: sectionArray.length,
      completed_at: new Date().toISOString(),
      time_to_complete_seconds: timeToComplete
    }

    console.log('🎯 WELLBEING WHEEL COMPLETE DATA:', data)
    setFinalData(data)
  }

  const reset = () => {
    setSections({})
    setCurrentSection(null)
    setTempNotes('')
    setFinalData(null)
  }

  const completedCount = Object.keys(sections).length

  return (
    <div className="p-6 bg-white rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-4">Wellbeing Wheel Prototype</h2>

      {!finalData ? (
        <>
          <p className="text-gray-600 mb-4">
            Rate each area of your life ({completedCount}/7 completed)
          </p>

          {/* Progress bar */}
          <div className="w-full bg-gray-200 rounded-full h-2 mb-6">
            <div
              className="bg-green-500 h-2 rounded-full transition-all"
              style={{ width: `${(completedCount / 7) * 100}%` }}
            />
          </div>

          {/* Wheel Sections */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
            {wheelSections.map((section) => (
              <div
                key={section.id}
                className={`border rounded-lg p-4 ${
                  sections[section.id] ? 'bg-green-50 border-green-300' : 'border-gray-200'
                }`}
              >
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center gap-2">
                    <span className="text-2xl">{section.icon}</span>
                    <h3 className="font-semibold">{section.name}</h3>
                  </div>
                  {sections[section.id] && (
                    <span className="text-2xl">
                      {moods.find(m => m.level === sections[section.id].mood_level)?.emoji}
                    </span>
                  )}
                </div>

                {currentSection === section.id ? (
                  <div className="space-y-3">
                    <p className="text-sm text-gray-600 text-center">How do you feel about this area?</p>
                    <div className="flex gap-2 justify-center">
                      {moods.map((mood) => (
                        <button
                          key={mood.level}
                          onClick={() => selectMood(section.id, mood)}
                          className="p-2 rounded-lg bg-gray-100 hover:bg-gray-200 transition-all hover:scale-110"
                        >
                          <span className="text-xl">{mood.emoji}</span>
                        </button>
                      ))}
                    </div>
                    <textarea
                      value={tempNotes}
                      onChange={(e) => setTempNotes(e.target.value.slice(0, 200))}
                      placeholder="Why are you feeling like this?"
                      className="w-full p-2 border rounded text-sm h-20 resize-none"
                      maxLength={200}
                    />
                    <button
                      onClick={() => {
                        setCurrentSection(null)
                        setTempNotes('')
                      }}
                      className="text-sm text-gray-500 hover:text-gray-700"
                    >
                      Cancel
                    </button>
                  </div>
                ) : (
                  <button
                    onClick={() => {
                      setCurrentSection(section.id)
                      setTempNotes(sections[section.id]?.notes || '')
                    }}
                    className="w-full py-2 text-sm bg-blue-500 text-white rounded hover:bg-blue-600 transition-all"
                  >
                    {sections[section.id] ? 'Edit' : 'Rate this area'}
                  </button>
                )}

                {/* Show data captured for this section if completed */}
                {sections[section.id] && (
                  <div className="mt-3 pt-3 border-t">
                    <p className="text-xs font-semibold mb-1">Data Captured:</p>
                    <pre className="bg-gray-900 text-white p-2 rounded text-xs overflow-x-auto">
                      {JSON.stringify(sections[section.id], null, 2)}
                    </pre>
                  </div>
                )}
              </div>
            ))}
          </div>

          {completedCount === 7 && (
            <button
              onClick={completeWheel}
              className="w-full py-3 bg-green-500 text-white rounded-lg hover:bg-green-600 font-semibold"
            >
              Complete Wheel Assessment ✓
            </button>
          )}
        </>
      ) : (
        <div>
          <h3 className="text-lg font-semibold mb-2">✅ Complete!</h3>
          <div className="mb-4 p-4 bg-blue-50 rounded-lg">
            <p className="text-2xl font-bold text-center">
              Overall Score: {finalData.overall_score}/5.0
            </p>
          </div>
          <h4 className="font-medium mb-2">📊 Data Captured:</h4>
          <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-sm mb-4">
            {JSON.stringify(finalData, null, 2)}
          </pre>
          <p className="text-xs text-gray-500 mb-4">
            ✅ This data would be sent to: /api/wellbeing-wheel
          </p>
          <button
            onClick={reset}
            className="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600"
          >
            Start Over
          </button>
        </div>
      )}
    </div>
  )
}