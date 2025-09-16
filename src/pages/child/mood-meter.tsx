import { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'

const moodOptions = [
  { value: 'very_sad', label: 'Very Sad', emoji: '😢', color: 'bg-red-500' },
  { value: 'sad', label: 'Sad', emoji: '😔', color: 'bg-orange-500' },
  { value: 'ok', label: 'Okay', emoji: '😐', color: 'bg-yellow-500' },
  { value: 'happy', label: 'Happy', emoji: '😊', color: 'bg-green-500' },
  { value: 'very_happy', label: 'Very Happy', emoji: '😄', color: 'bg-blue-500' }
]

export default function MoodMeterPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [selectedMood, setSelectedMood] = useState<string | null>(null)
  const [saved, setSaved] = useState(false)
  
  const childId = user?.id || 'demo_child'

  const handleSave = () => {
    if (!selectedMood) return
    
    // Mock save - in real version this would save to database
    console.log('Saving mood:', selectedMood, 'for child:', childId)
    setSaved(true)
    
    setTimeout(() => {
      navigate('/child/check-in')
    }, 2000)
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 p-4 sm:p-8">
      <div className="max-w-2xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          <div className="text-center mb-8">
            <h1 className="text-3xl font-bold text-gray-800 mb-2">How are you feeling today?</h1>
            <p className="text-gray-600">Select the mood that best describes how you feel right now</p>
          </div>

          <div className="grid grid-cols-5 gap-4 mb-8">
            {moodOptions.map((option) => (
              <button
                key={option.value}
                onClick={() => setSelectedMood(option.value)}
                className={`flex flex-col items-center justify-center p-4 rounded-lg transition-all hover:scale-110 ${
                  selectedMood === option.value 
                    ? `${option.color} text-white ring-4 ring-offset-2 ring-blue-400 scale-110`
                    : "bg-gray-100 hover:bg-gray-200"
                }`}
              >
                <span className="text-4xl mb-2">{option.emoji}</span>
                <span className={`text-sm font-medium ${
                  selectedMood === option.value ? "text-white" : "text-gray-700"
                }`}>
                  {option.label}
                </span>
              </button>
            ))}
          </div>

          {selectedMood && !saved && (
            <div className="text-center space-y-4">
              <div className="p-4 bg-blue-50 rounded-lg">
                <p className="text-lg font-medium">
                  You selected: <span className="font-bold">
                    {moodOptions.find(m => m.value === selectedMood)?.label}
                  </span>
                </p>
              </div>
              
              <div className="flex gap-3 justify-center">
                <button
                  onClick={handleSave}
                  className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Save Mood
                </button>
                <button
                  onClick={() => setSelectedMood(null)}
                  className="bg-gray-300 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-400 transition-colors"
                >
                  Change Selection
                </button>
              </div>
            </div>
          )}

          {saved && (
            <div className="text-center space-y-4">
              <div className="p-4 bg-green-50 rounded-lg">
                <p className="text-lg font-medium text-green-700">
                  ✓ Mood saved successfully!
                </p>
                <p className="text-sm text-green-600 mt-2">
                  Taking you back to check-in...
                </p>
              </div>
            </div>
          )}

          <div className="text-center mt-8">
            <button 
              onClick={() => navigate('/child/check-in')}
              className="text-gray-600 hover:text-gray-800 transition-colors"
            >
              ← Back to Check-in
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}