import React, { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ChevronLeft, ChevronRight, Heart, Smile, Compass, TreePine, X } from 'lucide-react'
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
  { name: 'Mood', icon: Heart },
  { name: 'Emotions', icon: Smile },
  { name: 'Wellbeing', icon: Compass }
]

export function CheckInFlow() {
  const { step } = useParams<{ step: string }>()
  const navigate = useNavigate()
  const [completedData, setCompletedData] = useState<Record<string, any>>({})
  const [currentStepHasSelection, setCurrentStepHasSelection] = useState(false)
  const [emotionGridStep, setEmotionGridStep] = useState(1)

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

  const handleStepSelectionRemoved = () => {
    setCurrentStepHasSelection(false)
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
        {/* Progress header */}
        <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'white', boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)', height: '80px', borderRadius: '0' }}>
          <div className="mx-auto px-6" style={{ maxWidth: '300px', height: '80px', position: 'relative' }}>

            {/* Icons row - positioned at top */}
            <div className="flex w-full" style={{ paddingTop: '10px', gap: '1px' }}>
              {progressSegments.map((segment, index) => {
                const Icon = segment.icon
                const stepId = steps[index]?.id
                const isCompleted = completedData[stepId] && !completedData[stepId].skipped
                const isCurrentStep = (() => {
                  if (index === 0) return currentStep === 'mood'
                  if (index === 1) return currentStep === 'emotions'
                  if (index === 2) return currentStep === 'wellbeing'
                  return false
                })()
                // Can navigate if it's completed OR if we're past this step OR if it's the next available step
                const canNavigate = isCompleted || isCurrentStep || (() => {
                  if (index === 0) return currentStep === 'emotions' || currentStep === 'wellbeing'
                  if (index === 1) return currentStep === 'wellbeing'
                  return false
                })() || (() => {
                  // Make next step tappable if current step has selection
                  if (currentStepHasSelection) {
                    if (currentStep === 'mood' && index === 1) return true // emotions step
                  }
                  // For wellbeing step, only tappable on emotion step 2
                  if (currentStep === 'emotions' && emotionGridStep === 2 && index === 2) {
                    return true // wellbeing step
                  }
                  return false
                })()

                return (
                  <div key={segment.name} className="text-center" style={{ width: 'calc((100% - 2px) / 3 - 20px)' }}>
                    {canNavigate ? (
                      <button
                        onClick={() => stepId && handleNavigateToStep(stepId)}
                        className="transition-all cursor-pointer relative"
                        style={{ background: 'none', border: 'none', padding: '10px', margin: '-10px' }}
                        aria-label={`Navigate to ${segment.name}`}
                      >
                        <Icon className="h-6 w-6 mx-auto" style={{ color: '#3a7ddc' }} />
                      </button>
                    ) : (
                      <Icon className="h-6 w-6 mx-auto" style={{ color: isCompleted ? '#3a7ddc' : '#9ca3af' }} />
                    )}
                  </div>
                )
              })}
            </div>

            {/* Progress bar with discrete segments - positioned 10px below icons */}
            <div className="relative w-full h-2 flex" style={{ gap: '1px' }}>
              {progressSegments.map((_, index) => {
                // Calculate segment states
                let isCompleted = false
                let isNext = false

                // Mood meter is completed when on emotions or beyond
                if (index === 0 && (currentStep === 'emotions' || currentStep === 'wellbeing' || currentStep === 'garden')) {
                  isCompleted = true
                }
                // Emotions is completed when on wellbeing or beyond
                if (index === 1 && (currentStep === 'wellbeing' || currentStep === 'garden')) {
                  isCompleted = true
                }
                // Wellbeing is completed when on garden
                if (index === 2 && currentStep === 'garden') {
                  isCompleted = true
                }

                // Next available segment logic
                if (index === 1 && currentStep === 'mood' && currentStepHasSelection) {
                  isNext = true
                }
                if (index === 2 && currentStep === 'emotions' && emotionGridStep === 2) {
                  isNext = true
                }

                return (
                  <div
                    key={index}
                    className="h-2 transition-all duration-300"
                    style={{
                      backgroundColor: isCompleted ? '#3a7ddc' : isNext ? 'rgba(58, 125, 220, 0.5)' : '#e5e7eb',
                      borderRadius: index === 0 ? '4px 0 0 4px' :
                                   index === progressSegments.length - 1 ? '0 4px 4px 0' : '0',
                      width: 'calc((100% - 2px) / 3 - 20px)'
                    }}
                  />
                )
              })}
            </div>

            {/* Step labels - positioned 10px below progress bar */}
            <div className="flex w-full" style={{ marginTop: '5px', gap: '1px' }}>
              {progressSegments.map((segment, index) => {
                const stepId = steps[index]?.id
                const isCompleted = completedData[stepId] && !completedData[stepId].skipped
                const isCurrentStep = (() => {
                  if (index === 0) return currentStep === 'mood'
                  if (index === 1) return currentStep === 'emotions'
                  if (index === 2) return currentStep === 'wellbeing'
                  return false
                })()
                // Can navigate if it's completed OR if we're past this step OR if it's the next available step
                const canNavigate = isCompleted || isCurrentStep || (() => {
                  if (index === 0) return currentStep === 'emotions' || currentStep === 'wellbeing'
                  if (index === 1) return currentStep === 'wellbeing'
                  return false
                })() || (() => {
                  // Make next step tappable if current step has selection
                  if (currentStepHasSelection) {
                    if (currentStep === 'mood' && index === 1) return true // emotions step
                  }
                  // For wellbeing step, only tappable on emotion step 2
                  if (currentStep === 'emotions' && emotionGridStep === 2 && index === 2) {
                    return true // wellbeing step
                  }
                  return false
                })()

                // Highlight both completed and currently active segments
                let isHighlighted = false
                let isNextAvailable = false

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
                  // Check if it's the next available step
                  if (currentStep === 'mood' && currentStepHasSelection) {
                    isNextAvailable = true
                  }
                } else if (index === 2) {
                  // Wellbeing wheel - highlight if current or completed
                  if (currentStep === 'wellbeing' || currentStep === 'garden') {
                    isHighlighted = true
                  }
                  // Check if it's the next available step (only on emotion step 2)
                  if (currentStep === 'emotions' && emotionGridStep === 2) {
                    isNextAvailable = true
                  }
                }

                return (
                  <div key={segment.name} className="text-center" style={{ width: 'calc((100% - 2px) / 3 - 20px)' }}>
                    {canNavigate ? (
                      <button
                        onClick={() => stepId && handleNavigateToStep(stepId)}
                        className="transition-all cursor-pointer relative"
                        style={{ background: 'none', border: 'none', padding: '12px 16px', margin: '-12px -16px' }}
                        aria-label={`Navigate to ${segment.name}`}
                      >
                        <span className={`text-xs ${isHighlighted ? 'font-bold' : 'text-gray-600'}`} style={{ color: isHighlighted ? '#3a7ddc' : (isNextAvailable ? '#3a7ddc' : undefined) }}>
                          {segment.name}
                        </span>
                      </button>
                    ) : (
                      <span className={`text-xs ${isHighlighted ? 'font-bold' : 'text-gray-600'}`} style={{ color: isHighlighted ? '#3a7ddc' : '#9ca3af' }}>
                        {segment.name}
                      </span>
                    )}
                  </div>
                )
              })}
            </div>
          </div>

          {/* Close button positioned at vertical center right */}
          <button
            onClick={() => navigate('/checkin/home')}
            className="absolute top-1/2 right-4 w-10 h-10 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors shadow-lg"
            style={{ backgroundColor: '#147fe3', transform: 'translateY(-50%)' }}
          >
            <X className="h-5 w-5 text-white" />
          </button>
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
                onSelectionRemoved={handleStepSelectionRemoved}
                hideDebugInfo={true}
                triggerCompletion={triggerMoodCompletion}
                initialData={completedData['mood']}
              />
            </div>
          </div>
        )}
        
        {currentStep === 'emotions' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <EmotionGrid
              onComplete={(data) => handleStepComplete('emotions', data)}
              showNextButton={true}
              onSelectionMade={handleStepSelectionMade}
              hideDebugInfo={true}
              triggerCompletion={triggerEmotionCompletion}
              initialData={completedData['emotions']}
              onStepChange={setEmotionGridStep}
            />
          </div>
        )}
        
        {currentStep === 'wellbeing' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <WellbeingWheel
                onComplete={(data) => handleStepComplete('wellbeing', data)}
                showNextButton={true}
                onSelectionMade={handleStepSelectionMade}
                hideDebugInfo={true}
                triggerCompletion={triggerWellbeingCompletion}
                initialData={completedData['wellbeing']}
              />
          </div>
        )}

      </div>
    </>
  )
}