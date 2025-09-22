import React, { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ChevronLeft, ChevronRight, TreePine, X } from 'lucide-react'
import { BreathingCircles } from '../breathing/BreathingCircles'
import { MoodMeter } from '../prototypes/MoodMeter'
import { EmotionGrid } from '../prototypes/EmotionGrid'
import { WellbeingWheel } from '../prototypes/WellbeingWheel'
import { ProgressHeader } from '../shared/ProgressHeader'

type FlowStep = 'checkin' | 'mood' | 'emotions' | 'wellbeing' | 'garden' | 'complete'

const steps = [
  { id: 'mood', name: 'My emotions', number: 1 },
  { id: 'emotions', name: 'My emotions', number: 2 },
  { id: 'wellbeing', name: 'Wellbeing wheel', number: 3 }
]

// Progress segments are now defined in the shared ProgressHeader component

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
        <ProgressHeader
          currentStep={currentStep}
          completedData={completedData}
          currentStepHasSelection={currentStepHasSelection}
          emotionGridStep={emotionGridStep}
          onNavigateToStep={handleNavigateToStep}
        />

        {/* Close button positioned at vertical center right */}
        <div className="fixed top-0 right-4 z-50 flex items-center" style={{ height: '80px' }}>
          <button
            onClick={() => navigate('/checkin/home')}
            className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors shadow-lg"
            style={{ backgroundColor: '#147fe3' }}
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