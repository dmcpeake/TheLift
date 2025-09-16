import React from 'react'
import { useNavigate } from 'react-router-dom'
import { BreathingCircles } from './BreathingCircles'

// Progress bar component matching the check-in flow
const ProgressBar = () => {
  const steps = [
    { id: 'breathing', name: 'Breathing Exercise' },
    { id: 'mood', name: 'Mood Meter' },
    { id: 'emotions', name: 'Emotion Grid' },
    { id: 'wellbeing', name: 'Wellbeing Wheel' }
  ]
  
  const currentStep = 0 // Breathing is step 0
  
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
        
        {/* Skip button positioned at top right */}
        <button
          onClick={() => handleExit('skip')}
          className="absolute top-4 right-4 bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-semibold hover:bg-blue-700 transition-colors flex items-center gap-1"
        >
          <span>→</span>
          Skip
        </button>
      </div>
    </div>
  )
}

export function BreathingRouteWithProgress() {
  const navigate = useNavigate()

  const handleComplete = () => {
    // Navigate back to check-in flow after breathing exercise, marking it complete
    navigate('/child/check-in?from=breathing&completed=true')
  }

  const handleExit = (reason: 'skip' | 'close') => {
    if (reason === 'skip') {
      // If skipped, advance directly to mood meter
      navigate('/child/tools/mood-meter')
    } else {
      // If closed, go back to home
      navigate('/child/home')
    }
  }

  return (
    <>
      <ProgressBar />
      <div className="pt-24"> {/* Add padding to account for fixed progress bar */}
        <BreathingCircles
          cycles={5}
          muted={false} // Default to sound on for child experience
          captions={true}
          hideHeader={true}
          onComplete={handleComplete}
          onExit={handleExit}
        />
      </div>
    </>
  )
}