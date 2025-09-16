import React, { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import { BreathingCircles } from '../breathing/BreathingCircles'
import { MoodMeter } from '../prototypes/MoodMeter'
import { EmotionGrid } from '../prototypes/EmotionGrid'
import { WellbeingWheel } from '../prototypes/WellbeingWheel'

type FlowStep = 'breathing' | 'mood' | 'emotions' | 'wellbeing' | 'complete'

const steps = [
  { id: 'breathing', name: 'Let\'s breathe', number: 1 },
  { id: 'mood', name: 'How do you feel today?', number: 2 },
  { id: 'emotions', name: 'What emotions are you feeling?', number: 3 },
  { id: 'wellbeing', name: 'Wellbeing Wheel', number: 4 }
]

export function CheckInFlow() {
  const { step } = useParams<{ step: string }>()
  const navigate = useNavigate()
  const [completedData, setCompletedData] = useState<Record<string, any>>({})
  const [currentStepHasSelection, setCurrentStepHasSelection] = useState(false)

  // State to trigger completion in child components
  const [triggerEmotionCompletion, setTriggerEmotionCompletion] = useState(false)
  const [triggerMoodCompletion, setTriggerMoodCompletion] = useState(false)
  const [triggerWellbeingCompletion, setTriggerWellbeingCompletion] = useState(false)

  const currentStep = (step || 'breathing') as FlowStep
  const currentStepIndex = steps.findIndex(s => s.id === currentStep)

  // Reset selection state when step changes
  React.useEffect(() => {
    setCurrentStepHasSelection(false)
    // Reset all trigger states when step changes
    setTriggerEmotionCompletion(false)
    setTriggerMoodCompletion(false)
    setTriggerWellbeingCompletion(false)
  }, [currentStep])

  // Auto-redirect after 4 seconds on completion
  React.useEffect(() => {
    if (currentStep === 'complete') {
      const timer = setTimeout(() => {
        navigate('/checkin/home')
      }, 4000)

      return () => clearTimeout(timer)
    }
  }, [currentStep, navigate])

  const handleStepComplete = (stepId: string, data: any) => {
    // Store the completed data
    setCompletedData(prev => ({ ...prev, [stepId]: data }))

    // Navigate to next step
    const nextStepIndex = currentStepIndex + 1
    if (nextStepIndex < steps.length) {
      const nextStep = steps[nextStepIndex]
      navigate(`/checkin/flow/${nextStep.id}`)
    } else {
      // All steps complete
      navigate('/checkin/flow/complete')
    }
  }

  const handleNavigateToStep = (stepId: string) => {
    setCurrentStepHasSelection(false) // Reset selection state when navigating
    navigate(`/checkin/flow/${stepId}`)
  }

  const handleStepSelectionMade = () => {
    setCurrentStepHasSelection(true)
  }

  const canNavigateToStep = (stepId: string, index: number) => {
    // Can always go back to completed steps
    if (completedData[stepId]) {
      return true
    }

    // Can always navigate to breathing (first step)
    if (stepId === 'breathing') {
      return true
    }

    // For mood step, can navigate if breathing was completed or skipped
    if (stepId === 'mood') {
      return completedData['breathing']
    }

    // For other steps, must have completed previous step (not skipped)
    if (index > 0) {
      const previousStep = steps[index - 1]
      return completedData[previousStep.id] && !completedData[previousStep.id].skipped
    }

    return false
  }

  const handleSkip = (stepId: string) => {
    // Mark as skipped and move to next step
    setCompletedData(prev => ({ ...prev, [stepId]: { skipped: true } }))
    
    const nextStepIndex = currentStepIndex + 1
    if (nextStepIndex < steps.length) {
      const nextStep = steps[nextStepIndex]
      navigate(`/checkin/flow/${nextStep.id}`)
    } else {
      navigate('/checkin/flow/complete')
    }
  }

  // Progress bar component
  const ProgressBar = () => {
    const handleBackClick = () => {
      if (currentStep === 'breathing') {
        navigate('/checkin/home')
      } else {
        handleNavigateToStep(steps[currentStepIndex - 1].id)
      }
    }

    const handleForwardClick = () => {
      console.log('Forward click - currentStep:', currentStep, 'hasSelection:', currentStepHasSelection)
      if (currentStep === 'breathing') {
        // Always allow skipping breathing
        handleSkip('breathing')
      } else if (currentStepHasSelection) {
        // Trigger completion for the current step instead of just navigating
        if (currentStep === 'mood') {
          console.log('Triggering mood completion')
          setTriggerMoodCompletion(true)
          // Reset trigger after a brief delay to allow component to process it
          setTimeout(() => setTriggerMoodCompletion(false), 100)
        } else if (currentStep === 'emotions') {
          console.log('Triggering emotion completion')
          setTriggerEmotionCompletion(true)
          // Reset trigger after a brief delay to allow component to process it
          setTimeout(() => setTriggerEmotionCompletion(false), 100)
        } else if (currentStep === 'wellbeing') {
          console.log('Triggering wellbeing completion')
          setTriggerWellbeingCompletion(true)
          // Reset trigger after a brief delay to allow component to process it
          setTimeout(() => setTriggerWellbeingCompletion(false), 100)
        }
      }
    }

    const canGoBack = true // Always can go back
    const canGoForward = currentStep === 'breathing' || currentStepHasSelection || (currentStepIndex < steps.length - 1 && canNavigateToStep(steps[currentStepIndex + 1].id, currentStepIndex + 1))

    return (
      <>
        {/* Left chevron tab */}
        <button
          onClick={handleBackClick}
          className="fixed left-0 top-1/2 -translate-y-1/2 shadow-lg z-50 transition-colors"
          style={{
            width: '56px',
            height: '56px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            borderTopRightRadius: '4px',
            borderBottomRightRadius: '4px',
            backgroundColor: '#3a7ddc'
          }}
          onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
          onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
          aria-label="Previous step"
        >
          <ChevronLeft
            className="h-8 w-8"
            style={{ color: 'white' }}
          />
        </button>

        {/* Right chevron tab */}
        <button
          onClick={handleForwardClick}
          disabled={!canGoForward}
          className="fixed right-0 top-1/2 -translate-y-1/2 z-50 transition-colors"
          style={{
            width: '56px',
            height: '56px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            borderTopLeftRadius: '4px',
            borderBottomLeftRadius: '4px',
            backgroundColor: canGoForward ? '#3a7ddc' : 'rgba(58, 125, 220, 0.2)',
            cursor: canGoForward ? 'pointer' : 'not-allowed',
            boxShadow: canGoForward ? '0 4px 20px rgba(0,0,0,0.1)' : 'none'
          }}
          onMouseEnter={(e) => {
            if (canGoForward) {
              e.currentTarget.style.backgroundColor = '#2e6bc7'
            }
          }}
          onMouseLeave={(e) => {
            if (canGoForward) {
              e.currentTarget.style.backgroundColor = '#3a7ddc'
            }
          }}
          aria-label="Next step"
        >
          <ChevronRight
            className="h-8 w-8 transition-colors"
            style={{
              color: 'white'
            }}
          />
        </button>

        {/* Progress header */}
        <div className="fixed top-0 left-0 right-0 bg-white shadow-sm z-50 p-4">
          <div className="max-w-7xl mx-auto px-6 w-full">
            <div className="text-center mb-4">
              <h1 className="text-xl font-bold text-gray-800">Check-In</h1>
            </div>

            {/* Progress bar with separators */}
            <div className="relative w-full bg-gray-200 rounded-full h-2 mb-3">
              <div
                className="h-2 rounded-full transition-all duration-300"
                style={{
                  width: `${((currentStepIndex + 1) / steps.length) * 100}%`,
                  backgroundColor: '#3a7ddc'
                }}
              />
              {/* Section separators */}
              {steps.slice(0, -1).map((_, index) => (
                <div
                  key={index}
                  className="absolute top-0 bottom-0 w-px bg-white"
                  style={{ left: `${((index + 1) / steps.length) * 100}%` }}
                />
              ))}
            </div>

            {/* Step labels - all centered */}
            <div className="grid grid-cols-4 gap-2">
              {steps.map((s, index) => (
                <div key={s.id} className="text-center">
                  <span className={`text-xs ${index === currentStepIndex ? 'font-bold' : 'text-gray-600'}`} style={{ color: index === currentStepIndex ? '#3a7ddc' : undefined }}>
                    {s.name}
                  </span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </>
    )
  }

  // Completion page
  if (currentStep === 'complete') {
    return (
      <>
        <style>{`
          @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
          }
        `}</style>
        <div className="min-h-screen bg-white flex items-center justify-center p-4">
          <div className="max-w-2xl mx-auto text-center">
            <h1 className="text-4xl font-bold text-gray-900 mb-4">
              Success!
            </h1>
            <p className="text-lg text-gray-600 mb-8">
              Your Check in is complete.
            </p>

            {/* Spinning circle loader */}
            <div className="flex justify-center">
              <div
                className="rounded-full"
                style={{
                  width: '48px',
                  height: '48px',
                  border: '4px solid #f3f4f6',
                  borderTop: '4px solid #e87e67',
                  animation: 'spin 1s linear infinite'
                }}
              />
            </div>
          </div>
        </div>
      </>
    )
  }

  return (
    <>
      {/* Progress bar shows on ALL steps */}
      <ProgressBar />
      
      <div className="min-h-screen">
        {currentStep === 'breathing' && (
          <BreathingCircles
            cycles={5}
            muted={false}
            captions={true}
            onComplete={() => handleStepComplete('breathing', { completed: true, pattern: 'balloon' })}
            onExit={(reason) => {
              if (reason === 'skip') {
                handleSkip('breathing')
              }
            }}
          />
        )}
        
        {currentStep === 'mood' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <div className="max-w-7xl mx-auto px-6 w-full">
              <MoodMeter
                onComplete={(data) => handleStepComplete('mood', data)}
                showNextButton={true}
                onSelectionMade={handleStepSelectionMade}
                hideDebugInfo={true}
                triggerCompletion={triggerMoodCompletion}
                initialData={completedData['mood']}
              />
            </div>
          </div>
        )}
        
        {currentStep === 'emotions' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <div className="max-w-7xl mx-auto px-6 w-full">
              <EmotionGrid
                onComplete={(data) => handleStepComplete('emotions', data)}
                showNextButton={true}
                onSelectionMade={handleStepSelectionMade}
                hideDebugInfo={true}
                triggerCompletion={triggerEmotionCompletion}
                initialData={completedData['emotions']}
              />
            </div>
          </div>
        )}
        
        {currentStep === 'wellbeing' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <div className="max-w-7xl mx-auto px-6 w-full">
              <WellbeingWheel
                onComplete={(data) => handleStepComplete('wellbeing', data)}
                showNextButton={true}
                onSelectionMade={handleStepSelectionMade}
                hideDebugInfo={true}
                triggerCompletion={triggerWellbeingCompletion}
                initialData={completedData['wellbeing']}
              />
            </div>
          </div>
        )}
      </div>
    </>
  )
}