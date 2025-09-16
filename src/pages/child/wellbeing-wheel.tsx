import { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'

const sections = [
  { id: 'friends', name: 'My Friends', emoji: '👥' },
  { id: 'work', name: 'My Work', emoji: '📚' },
  { id: 'health', name: 'My Health', emoji: '💪' },
  { id: 'family', name: 'My Family', emoji: '👨‍👩‍👧‍👦' },
  { id: 'fun', name: 'My Fun & Play', emoji: '🎮' },
  { id: 'safety', name: 'My Safety', emoji: '🛡️' },
  { id: 'emotions', name: 'My Emotions', emoji: '❤️' }
]

const scoreOptions = [
  { value: 1, emoji: '😢', label: 'Very Bad' },
  { value: 2, emoji: '😔', label: 'Bad' },
  { value: 3, emoji: '😐', label: 'Okay' },
  { value: 4, emoji: '😊', label: 'Good' },
  { value: 5, emoji: '😄', label: 'Great' }
]

export default function WellbeingWheelPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [currentSection, setCurrentSection] = useState(0)
  const [scores, setScores] = useState<Record<string, number>>({})
  const [completed, setCompleted] = useState(false)
  
  const childId = user?.id || 'demo_child'

  const handleScore = (score: number) => {
    const sectionId = sections[currentSection].id
    setScores(prev => ({ ...prev, [sectionId]: score }))
    
    if (currentSection < sections.length - 1) {
      setCurrentSection(prev => prev + 1)
    } else {
      setCompleted(true)
    }
  }

  const handleComplete = () => {
    const avgScore = Object.values(scores).reduce((sum, score) => sum + score, 0) / sections.length
    console.log('Wellbeing wheel completed:', { scores, avgScore, childId })
    navigate('/child/check-in')
  }

  if (completed) {
    const avgScore = Object.values(scores).reduce((sum, score) => sum + score, 0) / sections.length
    
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 p-4 sm:p-8">
        <div className="max-w-2xl mx-auto">
          <div className="bg-white rounded-lg shadow-lg p-8">
            <div className="text-center mb-8">
              <h1 className="text-3xl font-bold text-gray-800 mb-2">Your Wellbeing Wheel</h1>
              <p className="text-gray-600">Overall Score: {avgScore.toFixed(1)}/5</p>
            </div>

            <div className="space-y-3 mb-8">
              {sections.map(section => (
                <div key={section.id} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div className="flex items-center gap-3">
                    <span className="text-2xl">{section.emoji}</span>
                    <span className="font-medium">{section.name}</span>
                  </div>
                  <span className="text-2xl">
                    {scoreOptions.find(opt => opt.value === scores[section.id])?.emoji}
                  </span>
                </div>
              ))}
            </div>

            <div className="text-center">
              <button
                onClick={handleComplete}
                className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors"
              >
                Complete Wellbeing Check
              </button>
            </div>
          </div>
        </div>
      </div>
    )
  }

  const section = sections[currentSection]

  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 p-4 sm:p-8">
      <div className="max-w-2xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          <div className="text-center mb-8">
            <h1 className="text-3xl font-bold text-gray-800 mb-2">Wellbeing Wheel</h1>
            <p className="text-gray-600">Section {currentSection + 1} of {sections.length}</p>
          </div>

          <div className="text-center mb-8">
            <div className="text-6xl mb-4">{section.emoji}</div>
            <h2 className="text-2xl font-bold mb-2">{section.name}</h2>
            <p className="text-gray-600">How is this area of your life going?</p>
          </div>

          <div className="grid grid-cols-5 gap-3 mb-8">
            {scoreOptions.map((option) => (
              <button
                key={option.value}
                onClick={() => handleScore(option.value)}
                className="flex flex-col items-center justify-center p-4 rounded-lg bg-gray-100 hover:bg-gray-200 transition-all hover:scale-105"
              >
                <span className="text-3xl mb-2">{option.emoji}</span>
                <span className="text-xs font-medium text-gray-700">{option.label}</span>
              </button>
            ))}
          </div>

          <div className="text-center">
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