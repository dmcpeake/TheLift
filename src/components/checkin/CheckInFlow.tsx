import React, { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ChevronLeft, ChevronRight, Heart, Smile, Compass, TreePine } from 'lucide-react'
import { BreathingCircles } from '../breathing/BreathingCircles'
import { MoodMeter } from '../prototypes/MoodMeter'
import { EmotionGrid } from '../prototypes/EmotionGrid'
import { WellbeingWheel } from '../prototypes/WellbeingWheel'

type FlowStep = 'checkin' | 'mood' | 'emotions' | 'wellbeing' | 'garden' | 'complete'

const steps = [
  { id: 'mood', name: 'My emotions', number: 1 },
  { id: 'emotions', name: 'My emotions', number: 2 },
  { id: 'wellbeing', name: 'Wellbeing wheel', number: 3 }
]

// Progress header segments (only 3 segments now)
const progressSegments = [
  { name: 'Mood meter', icon: Heart },
  { name: 'My emotions', icon: Smile },
  { name: 'Wellbeing wheel', icon: Compass }
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

  const currentStep = (step || 'mood') as FlowStep
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
      if (currentStep === 'mood') {
        navigate('/checkin/home')
      } else {
        handleNavigateToStep(steps[currentStepIndex - 1].id)
      }
    }

    const handleForwardClick = () => {
      console.log('Forward click - currentStep:', currentStep, 'hasSelection:', currentStepHasSelection)
      if (currentStepHasSelection) {
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
    const canGoForward = currentStepHasSelection || (currentStepIndex < steps.length - 1 && canNavigateToStep(steps[currentStepIndex + 1].id, currentStepIndex + 1))

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
        <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'white', boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)', padding: '16px 0', borderRadius: '0' }}>
          <div className="mx-auto px-6" style={{ maxWidth: '600px' }}>
            {/* Icons row */}
            <div className="grid grid-cols-3 gap-2 mb-4">
              {progressSegments.map((segment, index) => {
                const Icon = segment.icon
                return (
                  <div key={segment.name} className="text-center">
                    <Icon className="h-6 w-6 mx-auto" style={{ color: '#3a7ddc' }} />
                  </div>
                )
              })}
            </div>
            {/* Progress bar with separators */}
            <div className="relative w-full bg-gray-200 rounded-full h-2 mb-3">
              <div
                className="h-2 rounded-full transition-all duration-300"
                style={{
                  width: `${(() => {
                    // Calculate progress including current step
                    let activeSegments = 0

                    // Mood meter is active/completed when on mood or beyond
                    if (currentStep === 'mood' || currentStep === 'emotions' || currentStep === 'wellbeing' || currentStep === 'garden') {
                      activeSegments += 1
                    }
                    // My emotions is active/completed when on emotions or beyond
                    if (currentStep === 'emotions' || currentStep === 'wellbeing' || currentStep === 'garden') {
                      activeSegments += 1
                    }
                    // Wellbeing wheel is active/completed when on wellbeing or beyond
                    if (currentStep === 'wellbeing' || currentStep === 'garden') {
                      activeSegments += 1
                    }

                    return (activeSegments / progressSegments.length) * 100
                  })()}%`,
                  backgroundColor: '#3a7ddc'
                }}
              />
              {/* Section separators */}
              {progressSegments.slice(0, -1).map((_, index) => (
                <div
                  key={index}
                  className="absolute top-0 bottom-0 w-px bg-white"
                  style={{ left: `${((index + 1) / progressSegments.length) * 100}%` }}
                />
              ))}
            </div>

            {/* Step labels - all centered */}
            <div className="grid grid-cols-3 gap-2">
              {progressSegments.map((segment, index) => {
                // Highlight both completed and currently active segments
                let isHighlighted = false

                if (index === 0) {
                  // Mood meter - highlight if current or completed
                  if (currentStep === 'mood' || currentStep === 'emotions' || currentStep === 'wellbeing' || currentStep === 'garden') {
                    isHighlighted = true
                  }
                } else if (index === 1) {
                  // My emotions - highlight if current or completed
                  if (currentStep === 'emotions' || currentStep === 'wellbeing' || currentStep === 'garden') {
                    isHighlighted = true
                  }
                } else if (index === 2) {
                  // Wellbeing wheel - highlight if current or completed
                  if (currentStep === 'wellbeing' || currentStep === 'garden') {
                    isHighlighted = true
                  }
                }

                return (
                  <div key={segment.name} className="text-center">
                    <span className={`text-xs ${isHighlighted ? 'font-bold' : 'text-gray-600'}`} style={{ color: isHighlighted ? '#3a7ddc' : undefined }}>
                      {segment.name}
                    </span>
                  </div>
                )
              })}
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
      {/* Progress bar shows on all steps except garden */}
      {currentStep !== 'garden' && <ProgressBar />}
      
      <div className="min-h-screen">
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