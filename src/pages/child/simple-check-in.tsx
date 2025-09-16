import { useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'

export default function SimpleCheckInPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  
  const childId = user?.id || 'demo_child'

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 p-4 sm:p-8">
      <div className="max-w-4xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          <h1 className="text-3xl font-bold text-center mb-8 text-gray-800">
            Wellbeing Check-In
          </h1>
          
          <div className="text-center mb-8">
            <p className="text-gray-600 mb-4">Child ID: {childId}</p>
            <p className="text-lg">Choose a wellbeing tool to get started!</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Mood Meter Card */}
            <div 
              onClick={() => navigate('/child/tools/mood-meter')}
              className="bg-blue-50 rounded-lg p-6 border-2 border-blue-200 hover:border-blue-400 cursor-pointer transition-all hover:scale-105"
            >
              <div className="text-center">
                <div className="text-4xl mb-3">😊</div>
                <h3 className="text-xl font-semibold mb-2">Mood Meter</h3>
                <p className="text-gray-600">How are you feeling today?</p>
              </div>
            </div>

            {/* Emotion Grid Card */}
            <div 
              onClick={() => navigate('/child/tools/emotion-grid')}
              className="bg-purple-50 rounded-lg p-6 border-2 border-purple-200 hover:border-purple-400 cursor-pointer transition-all hover:scale-105"
            >
              <div className="text-center">
                <div className="text-4xl mb-3">💭</div>
                <h3 className="text-xl font-semibold mb-2">Emotion Grid</h3>
                <p className="text-gray-600">Explore your emotions</p>
              </div>
            </div>

            {/* Wellbeing Wheel Card */}
            <div 
              onClick={() => navigate('/child/tools/wellbeing-wheel')}
              className="bg-green-50 rounded-lg p-6 border-2 border-green-200 hover:border-green-400 cursor-pointer transition-all hover:scale-105"
            >
              <div className="text-center">
                <div className="text-4xl mb-3">☸️</div>
                <h3 className="text-xl font-semibold mb-2">Wellbeing Wheel</h3>
                <p className="text-gray-600">Check all life areas</p>
              </div>
            </div>

            {/* Breathing Tool Card */}
            <div 
              onClick={() => navigate('/child/tools/breathing')}
              className="bg-cyan-50 rounded-lg p-6 border-2 border-cyan-200 hover:border-cyan-400 cursor-pointer transition-all hover:scale-105"
            >
              <div className="text-center">
                <div className="text-4xl mb-3">🌬️</div>
                <h3 className="text-xl font-semibold mb-2">Breathing Exercise</h3>
                <p className="text-gray-600">Calm your mind</p>
              </div>
            </div>
          </div>

          <div className="text-center mt-8">
            <button 
              onClick={() => navigate('/child/home')}
              className="bg-gray-600 text-white px-6 py-3 rounded-lg hover:bg-gray-700 transition-colors"
            >
              ← Back to Home
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}