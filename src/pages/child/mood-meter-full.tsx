import { useState, useEffect, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'

const moodOptions = [
  { value: 'very_sad', label: 'Very Sad', emoji: '😢', color: 'bg-red-500 hover:bg-red-600', score: 1 },
  { value: 'sad', label: 'Sad', emoji: '😔', color: 'bg-orange-500 hover:bg-orange-600', score: 2 },
  { value: 'ok', label: 'Okay', emoji: '😐', color: 'bg-yellow-500 hover:bg-yellow-600', score: 3 },
  { value: 'happy', label: 'Happy', emoji: '😊', color: 'bg-green-500 hover:bg-green-600', score: 4 },
  { value: 'very_happy', label: 'Very Happy', emoji: '😄', color: 'bg-blue-500 hover:bg-blue-600', score: 5 }
]

export default function MoodMeterFullPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  
  const [selectedMood, setSelectedMood] = useState<string | null>(null)
  const [startTime, setStartTime] = useState<number>(Date.now())
  const [selectionTime, setSelectionTime] = useState<number>(0)
  const [isSaving, setIsSaving] = useState(false)
  const [saved, setSaved] = useState(false)
  const [error, setError] = useState<string | null>(null)
  
  const childId = user?.id || 'demo_child'

  useEffect(() => {
    setStartTime(Date.now())
  }, [])

  const handleMoodSelect = (mood: string) => {
    const timeElapsed = Date.now() - startTime
    setSelectionTime(timeElapsed)
    setSelectedMood(mood)
  }

  const handleSave = async () => {
    if (!selectedMood) return
    
    setIsSaving(true)
    setError(null)
    
    try {
      const selectedOption = moodOptions.find(m => m.value === selectedMood)!
      const supabase = getSupabaseClient()
      
      // Real Supabase call to mood_meter_usage table
      const { data, error } = await supabase
        .from('mood_meter_usage')
        .insert({
          child_id: childId,
          session_id: null, // Would be actual session ID in real implementation
          mood: selectedMood,
          mood_score: selectedOption.score,
          selection_time_ms: selectionTime
        })
        .select()
        .single()
      
      if (error) throw error
      
      console.log('Successfully saved mood to database:', data)
      setSaved(true)
      
      // Auto-navigate to next step after showing success
      setTimeout(() => {
        navigate('/child/tools/emotion-grid')
      }, 2000)
      
    } catch (err) {
      console.error('Database error:', err)
      setError(err instanceof Error ? err.message : 'Failed to save mood')
    } finally {
      setIsSaving(false)
    }
  }

  const handleReset = () => {
    setSelectedMood(null)
    setSelectionTime(0)
    setStartTime(Date.now())
    setSaved(false)
    setError(null)
  }

  // Progress bar component matching the check-in flow
  const ProgressBar = () => {
    const steps = [
      { id: 'breathing', name: 'Breathing Exercise' },
      { id: 'mood', name: 'Mood Meter' },
      { id: 'emotions', name: 'Emotion Grid' },
      { id: 'wellbeing', name: 'Wellbeing Wheel' }
    ]
    
    const currentStep = 1 // Mood Meter is step 1
    
    return (
      <div className="fixed top-0 left-0 right-0 bg-white shadow-sm z-50 p-4">
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center justify-between mb-2">
            <h1 className="text-xl font-bold text-gray-800">Check-In</h1>
            <span className="text-sm text-gray-600">
              Step {currentStep + 1} of {steps.length}
            </span>
          </div>
          
          <div className="w-full bg-gray-200 rounded-full h-2">
            <div 
              className="bg-blue-600 h-2 rounded-full transition-all duration-300"
              style={{ width: `${((currentStep + 1) / steps.length) * 100}%` }}
            />
          </div>
          
          <div className="flex justify-between mt-2">
            {steps.map((step, index) => (
              <div key={step.id} className="flex flex-col items-center">
                <div className={`w-3 h-3 rounded-full ${
                  index === currentStep ? 'bg-blue-600 ring-2 ring-blue-400' : 
                  index < currentStep ? 'bg-green-600' : 'bg-gray-300'
                }`} />
                <span className="text-xs text-gray-600 mt-1 hidden sm:block">{step.name}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    )
  }

  return (
    <>
      <ProgressBar />
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 pt-24 p-4 sm:p-8">
        <div className="max-w-3xl mx-auto">
          <div className="bg-white rounded-lg shadow-lg p-8">
          {/* Header */}
          <div className="text-center mb-8">
            <h1 className="text-4xl font-bold text-gray-800 mb-4">How are you feeling today?</h1>
            <p className="text-lg text-gray-600 mb-2">
              Choose the mood that best describes how you feel right now
            </p>
            <p className="text-sm text-gray-500">
              Take your time - we're tracking how long it takes you to decide
            </p>
          </div>

          {/* Mood Options Grid */}
          <div className="grid grid-cols-5 gap-4 sm:gap-6 mb-8">
            {moodOptions.map((option) => (
              <button
                key={option.value}
                onClick={() => handleMoodSelect(option.value)}
                disabled={saved || isSaving}
                className={`flex flex-col items-center justify-center p-4 sm:p-6 rounded-xl transition-all duration-200 ${
                  selectedMood === option.value 
                    ? `${option.color} text-white ring-4 ring-offset-2 ring-blue-400 scale-110 shadow-lg`
                    : "bg-gray-100 hover:bg-gray-200 hover:scale-105"
                } ${saved ? "opacity-50 cursor-not-allowed" : "cursor-pointer"}`}
              >
                <span className="text-4xl sm:text-6xl mb-3">{option.emoji}</span>
                <span className={`text-sm sm:text-base font-semibold text-center ${
                  selectedMood === option.value ? "text-white" : "text-gray-700"
                }`}>
                  {option.label}
                </span>
              </button>
            ))}
          </div>

          {/* Selection Feedback */}
          {selectedMood && !saved && (
            <div className="space-y-6">
              <div className="text-center p-6 bg-blue-50 rounded-xl">
                <div className="text-6xl mb-4">
                  {moodOptions.find(m => m.value === selectedMood)?.emoji}
                </div>
                <p className="text-xl font-semibold text-gray-800 mb-2">
                  You selected: <span className="text-blue-600">
                    {moodOptions.find(m => m.value === selectedMood)?.label}
                  </span>
                </p>
                <p className="text-sm text-gray-600">
                  Selection time: {(selectionTime / 1000).toFixed(1)} seconds
                </p>
              </div>
              
              <div className="flex gap-4 justify-center">
                <button
                  onClick={handleSave}
                  disabled={isSaving}
                  className="bg-blue-600 text-white px-8 py-3 rounded-lg text-lg font-semibold hover:bg-blue-700 disabled:bg-blue-400 transition-colors"
                >
                  {isSaving ? 'Saving...' : 'Save My Mood'}
                </button>
              </div>
            </div>
          )}

          {/* Success State */}
          {saved && (
            <div className="text-center space-y-6">
              <div className="p-8 bg-green-50 rounded-xl">
                <div className="text-6xl mb-4">✨</div>
                <h3 className="text-2xl font-bold text-green-700 mb-2">
                  Mood saved successfully!
                </h3>
                <p className="text-green-600 mb-4">
                  Your {moodOptions.find(m => m.value === selectedMood)?.label.toLowerCase()} mood has been recorded
                </p>
                <div className="text-sm text-green-600 bg-green-100 inline-block px-4 py-2 rounded-lg">
                  Selection took {(selectionTime / 1000).toFixed(1)} seconds
                </div>
              </div>
              
              <p className="text-gray-600">Taking you back to check-in...</p>
              
              <button 
                onClick={handleReset} 
                className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors"
              >
                Record Another Mood
              </button>
            </div>
          )}

          {/* Error State */}
          {error && (
            <div className="p-4 bg-red-50 rounded-lg border border-red-200">
              <p className="text-red-600 text-center">
                <strong>Error:</strong> {error}
              </p>
            </div>
          )}

        </div>
      </div>
    </div>
    </>
  )
}