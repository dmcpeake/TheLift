import { useState, useContext, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'

export default function BreathingPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [isActive, setIsActive] = useState(false)
  const [phase, setPhase] = useState<'inhale' | 'hold' | 'exhale'>('inhale')
  const [countdown, setCountdown] = useState(4)
  const [cycles, setCycles] = useState(0)
  const [completed, setCompleted] = useState(false)
  
  const childId = user?.id || 'demo_child'

  useEffect(() => {
    let interval: NodeJS.Timeout
    
    if (isActive && !completed) {
      interval = setInterval(() => {
        setCountdown((prev) => {
          if (prev <= 1) {
            // Move to next phase
            if (phase === 'inhale') {
              setPhase('hold')
              return 4
            } else if (phase === 'hold') {
              setPhase('exhale')
              return 4
            } else {
              setPhase('inhale')
              setCycles(c => {
                const newCycles = c + 1
                if (newCycles >= 5) {
                  setCompleted(true)
                  setIsActive(false)
                }
                return newCycles
              })
              return 4
            }
          }
          return prev - 1
        })
      }, 1000)
    }
    
    return () => clearInterval(interval)
  }, [isActive, phase, completed])

  const handleStart = () => {
    setIsActive(true)
    setCycles(0)
    setCompleted(false)
    setPhase('inhale')
    setCountdown(4)
  }

  const handleComplete = () => {
    console.log('Breathing session completed for child:', childId)
    navigate('/child/check-in')
  }

  const getPhaseColor = () => {
    switch (phase) {
      case 'inhale': return 'bg-blue-500'
      case 'hold': return 'bg-purple-500'
      case 'exhale': return 'bg-green-500'
    }
  }

  const getInstruction = () => {
    switch (phase) {
      case 'inhale': return 'Breathe In'
      case 'hold': return 'Hold'
      case 'exhale': return 'Breathe Out'
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-cyan-50 to-blue-50 p-4 sm:p-8">
      <div className="max-w-2xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          <div className="text-center mb-8">
            <h1 className="text-3xl font-bold text-gray-800 mb-2">Breathing Exercise</h1>
            <p className="text-gray-600">Take 5 deep breaths to calm your mind</p>
          </div>

          <div className="flex flex-col items-center justify-center py-8">
            <div className={`w-48 h-48 rounded-full flex items-center justify-center transition-all duration-1000 ${getPhaseColor()} ${isActive ? 'animate-pulse' : ''}`}>
              <div className="text-white text-center">
                <div className="text-6xl font-bold mb-2">{countdown}</div>
                {isActive && <div className="text-lg">{getInstruction()}</div>}
              </div>
            </div>
            
            {isActive && (
              <div className="mt-8 text-center">
                <p className="text-xl font-medium">{getInstruction()}</p>
                <p className="text-gray-600 mt-2">Cycle {cycles + 1} of 5</p>
              </div>
            )}
          </div>

          {!isActive && !completed && (
            <div className="text-center">
              <button
                onClick={handleStart}
                className="bg-blue-600 text-white px-8 py-4 rounded-lg text-xl hover:bg-blue-700 transition-colors"
              >
                Start Breathing
              </button>
            </div>
          )}

          {completed && (
            <div className="text-center space-y-4">
              <div className="p-6 bg-green-50 rounded-lg">
                <h3 className="text-2xl font-bold text-green-700 mb-2">Great Job! 🌟</h3>
                <p className="text-green-600">You completed 5 breathing cycles</p>
              </div>
              <button
                onClick={handleComplete}
                className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors"
              >
                Complete Session
              </button>
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