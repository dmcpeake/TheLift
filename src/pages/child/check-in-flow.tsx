import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
// Navigate to separate pages and handle flow through query params

// Correct order: breathing (skippable) → mood meter → emotion grid → wellbeing wheel
const steps = [
  { id: 'breathing', name: 'Breathing Exercise', skippable: true },
  { id: 'mood', name: 'Mood Meter', skippable: false },
  { id: 'emotions', name: 'Emotion Grid', skippable: false },
  { id: 'wellbeing', name: 'Wellbeing Wheel', skippable: false }
]

export default function CheckInFlowPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [currentStep, setCurrentStep] = useState(0)
  const [completedSteps, setCompletedSteps] = useState<string[]>([])
  
  const childId = user?.id || 'demo_child'
  const currentStepData = steps[currentStep]

  // Check if returning from any tool and advance to next step
  React.useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search)
    const fromTool = urlParams.get('from')
    const completed = urlParams.get('completed')
    
    if (completed === 'true' && fromTool) {
      // Find the step we're returning from and advance if it matches current step
      const fromStepIndex = steps.findIndex(step => {
        if (fromTool === 'breathing') return step.id === 'breathing'
        if (fromTool === 'mood-meter') return step.id === 'mood'
        if (fromTool === 'emotion-grid') return step.id === 'emotions'
        if (fromTool === 'wellbeing-wheel') return step.id === 'wellbeing'
        return false
      })
      
      if (fromStepIndex === currentStep) {
        handleStepComplete() // This will advance to next step
      }
    }
  }, [])

  const handleStepComplete = () => {
    setCompletedSteps(prev => [...prev, currentStepData.id])
    
    if (currentStep < steps.length - 1) {
      setCurrentStep(prev => prev + 1)
    } else {
      // All steps complete - navigate to completion
      navigate('/child/home')
    }
  }

  const handleSkip = () => {
    if (currentStepData.skippable) {
      if (currentStep < steps.length - 1) {
        setCurrentStep(prev => prev + 1)
      } else {
        navigate('/child/home')
      }
    }
  }

  const renderProgressBar = () => (
    <div className="mb-8">
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-2xl font-bold text-gray-800">Check-In</h1>
        <span className="text-sm text-gray-600">
          Step {currentStep + 1} of {steps.length}
        </span>
      </div>
      
      <div className="w-full bg-gray-200 rounded-full h-3">
        <div 
          className="bg-blue-600 h-3 rounded-full transition-all duration-300"
          style={{ width: `${((currentStep + 1) / steps.length) * 100}%` }}
        />
      </div>
      
      <div className="flex justify-between mt-2">
        {steps.map((step, index) => (
          <div key={step.id} className="flex flex-col items-center">
            <div className={`w-4 h-4 rounded-full ${
              index <= currentStep ? 'bg-blue-600' : 'bg-gray-300'
            } ${completedSteps.includes(step.id) ? 'bg-green-600' : ''}`} />
            <span className="text-xs text-gray-600 mt-1">{step.name}</span>
          </div>
        ))}
      </div>
    </div>
  )

  const renderCurrentStep = () => {
    switch (currentStepData.id) {
      case 'breathing':
        return (
          <div className="space-y-6">
            <div className="text-center">
              <h2 className="text-3xl font-bold mb-4">🌬️ Breathing Exercise</h2>
              <p className="text-gray-600 mb-6">
                Let's start with some calming breaths to center yourself
              </p>
              <p className="text-sm text-gray-500 mb-8">
                This step is optional - you can skip if you prefer
              </p>
            </div>
            
            <div className="flex flex-col items-center gap-4">
              <button
                onClick={() => {
                  // Navigate to breathing using React Router
                  navigate('/child/tools/breathing')
                }}
                className="bg-blue-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:bg-blue-700 transition-colors"
              >
                Start Breathing Exercise
              </button>
              
              <button
                onClick={handleSkip}
                className="text-gray-600 hover:text-gray-800 underline transition-colors"
              >
                Skip this step
              </button>
            </div>
          </div>
        )

      case 'mood':
        // Automatically redirect to mood meter tool
        React.useEffect(() => {
          navigate('/child/tools/mood-meter')
        }, [])
        
        return (
          <div className="space-y-6">
            <div className="text-center mb-8">
              <h2 className="text-3xl font-bold mb-4">😊 Mood Meter</h2>
              <p className="text-gray-600">Redirecting to mood meter...</p>
            </div>
          </div>
        )

      case 'emotions':
        return (
          <div className="space-y-6">
            <div className="text-center mb-8">
              <h2 className="text-3xl font-bold mb-4">💭 Emotion Grid</h2>
              <p className="text-gray-600">Let's explore your emotions deeper</p>
            </div>
            
            <div className="flex flex-col items-center gap-4">
              <button
                onClick={() => {
                  navigate('/child/tools/emotion-grid')
                }}
                className="bg-blue-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:bg-blue-700 transition-colors"
              >
                Start Emotion Grid
              </button>
            </div>
          </div>
        )

      case 'wellbeing':
        return (
          <div className="space-y-6">
            <div className="text-center mb-8">
              <h2 className="text-3xl font-bold mb-4">☸️ Wellbeing Wheel</h2>
              <p className="text-gray-600">Check in on different areas of your life</p>
            </div>
            
            <div className="flex flex-col items-center gap-4">
              <button
                onClick={() => {
                  navigate('/child/tools/wellbeing-wheel')
                }}
                className="bg-blue-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:bg-blue-700 transition-colors"
              >
                Start Wellbeing Wheel
              </button>
            </div>
          </div>
        )

      default:
        return <div>Unknown step</div>
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 p-4 sm:p-8">
      <div className="max-w-4xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          {renderProgressBar()}
          {renderCurrentStep()}
          
          {/* Back to home option */}
          <div className="text-center mt-8 pt-6 border-t">
            <button 
              onClick={() => navigate('/child/home')}
              className="text-gray-500 hover:text-gray-700 transition-colors"
            >
              ← Back to Home
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}