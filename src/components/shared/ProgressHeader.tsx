import React from 'react'
import { Heart, Smile, Compass } from 'lucide-react'

interface ProgressHeaderProps {
  currentStep: string
  completedData: Record<string, any>
  currentStepHasSelection: boolean
  emotionGridStep: number
  onNavigateToStep?: (stepId: string) => void
}

const progressSegments = [
  { name: 'Mood', icon: Heart },
  { name: 'Emotions', icon: Smile },
  { name: 'Wellbeing', icon: Compass }
]

const steps = [
  { id: 'mood', name: 'Mood meter', number: 1 },
  { id: 'emotions', name: 'My emotions', number: 2 },
  { id: 'wellbeing', name: 'Wellbeing wheel', number: 3 }
]

export function ProgressHeader({
  currentStep,
  completedData,
  currentStepHasSelection,
  emotionGridStep,
  onNavigateToStep
}: ProgressHeaderProps) {
  const handleNavigateToStep = (stepId: string) => {
    if (onNavigateToStep) {
      onNavigateToStep(stepId)
    }
  }

  return (
    <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'white', boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)', height: '80px', borderRadius: '0' }}>
      <div className="mx-auto px-6" style={{ maxWidth: '300px', height: '80px', position: 'relative' }}>

        {/* Icons row - positioned at top */}
        <div className="flex w-full justify-center" style={{ paddingTop: '10px', gap: '1px' }}>
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
                {canNavigate && onNavigateToStep ? (
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
        <div className="relative w-full h-2 flex justify-center" style={{ gap: '1px' }}>
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
        <div className="flex w-full justify-center" style={{ marginTop: '5px', gap: '1px' }}>
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
              // Check if it's the next available step
              if (currentStep === 'emotions' && emotionGridStep === 2) {
                isNextAvailable = true
              }
            }

            return (
              <div key={segment.name} className="text-center" style={{ width: 'calc((100% - 2px) / 3 - 20px)' }}>
                {canNavigate && onNavigateToStep ? (
                  <button
                    onClick={() => stepId && handleNavigateToStep(stepId)}
                    className="transition-all cursor-pointer relative"
                    style={{ background: 'none', border: 'none', padding: '12px 16px', margin: '-12px -16px' }}
                    aria-label={`Navigate to ${segment.name}`}
                  >
                    <span className={`text-xs ${isHighlighted ? '' : 'text-gray-600'}`} style={{ color: isHighlighted ? '#3a7ddc' : (isNextAvailable ? '#3a7ddc' : undefined) }}>
                      {segment.name}
                    </span>
                  </button>
                ) : (
                  <span className={`text-xs ${isHighlighted ? '' : 'text-gray-600'}`} style={{ color: isHighlighted ? '#3a7ddc' : '#9ca3af' }}>
                    {segment.name}
                  </span>
                )}
              </div>
            )
          })}
        </div>
      </div>
    </div>
  )
}