import React, { useState, useEffect } from 'react'
import { Heart, Smile, Compass } from 'lucide-react'
import Lottie from 'lottie-react'
import { GuideModal } from './GuideModal'

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
  const [theoAnimation, setTheoAnimation] = useState(null)
  const [isGuideModalOpen, setIsGuideModalOpen] = useState(false)

  useEffect(() => {
    fetch('/theo-waving.json')
      .then(response => response.json())
      .then(data => setTheoAnimation(data))
      .catch(error => console.error('Error loading Theo animation:', error))
  }, [])

  const handleNavigateToStep = (stepId: string) => {
    if (onNavigateToStep) {
      onNavigateToStep(stepId)
    }
  }

  const getCurrentSection = () => {
    // Map current step to section for guide modal
    const sectionMapping = {
      'breathing': 'breathing',
      'mood': 'mood',
      'emotions': 'emotions',
      'wellbeing': 'wellbeing'
    }
    return sectionMapping[currentStep] || 'breathing'
  }

  const handleGuideClick = () => {
    setIsGuideModalOpen(true)
  }

  return (
    <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'white', boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)', height: '80px', borderRadius: '0' }}>
      {/* Theo Avatar in top left */}
      {theoAnimation && (
        <>
          <button
            onClick={handleGuideClick}
            className="cursor-pointer transition-all hover:opacity-80"
            style={{
              position: 'absolute',
              left: '16px',
              top: '10px',
              width: '60px',
              height: '60px',
              zIndex: 51,
              border: '2px dashed #3a7ddc',
              borderRadius: '50%',
              padding: '1px',
              boxSizing: 'border-box',
              background: 'none'
            }}
            aria-label="Open guide"
          >
            <Lottie
              animationData={theoAnimation}
              loop={true}
              autoplay={true}
              style={{ width: '100%', height: '100%', pointerEvents: 'none' }}
            />
          </button>

          {/* "My guide" text - hidden on mobile */}
          <button
            onClick={handleGuideClick}
            className="hidden md:block cursor-pointer transition-all hover:opacity-80"
            style={{
              position: 'absolute',
              left: '86px', // 16px (circle left) + 60px (circle width) + 10px (gap)
              top: '50%',
              transform: 'translateY(-50%)',
              zIndex: 51,
              fontSize: '14px',
              color: '#3a7ddc',
              fontWeight: '500',
              background: 'none',
              border: 'none',
              padding: '8px'
            }}
            aria-label="Open guide"
          >
            My guide
          </button>
        </>
      )}

      <div className="mx-auto px-6" style={{ maxWidth: '300px', height: '80px', position: 'relative' }}>

        {/* Icons row - positioned at top */}
        <div className="flex w-full justify-center" style={{ paddingTop: '10px', gap: '1px' }}>
          {progressSegments.map((segment, index) => {
            const Icon = segment.icon
            const stepId = steps[index]?.id
            const isCompleted = completedData[stepId] && !completedData[stepId].skipped
            const isCurrentStep = (() => {
              // Very explicit mapping to avoid any confusion
              const stepMapping = {
                0: 'mood',     // Heart icon
                1: 'emotions', // Smile icon
                2: 'wellbeing' // Compass icon
              }
              return currentStep === stepMapping[index]
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
                    <Icon className="h-6 w-6 mx-auto" style={{ color: (isCompleted || isCurrentStep) ? '#3a7ddc' : '#9ca3af' }} />
                  </button>
                ) : (
                  <Icon
                    className="h-6 w-6 mx-auto"
                    style={{
                      color: isCompleted ? '#3a7ddc' : '#9ca3af',
                      marginBottom: currentStep === 'breathing' ? '6px' : '0'
                    }}
                  />
                )}
              </div>
            )
          })}
        </div>

        {/* Progress bar with discrete segments - positioned 10px below icons */}
        <div className="relative w-full h-2 flex justify-center" style={{ gap: '1px' }}>
          {progressSegments.map((_, index) => {
            const stepId = steps[index]?.id
            // Check if this step has been completed based on completedData
            const isCompleted = completedData[stepId] && !completedData[stepId].skipped
            // Check if this is the current step
            const isCurrent = stepId === currentStep

            return (
              <div
                key={index}
                className="h-2 transition-all duration-300"
                style={{
                  backgroundColor: (isCompleted || isCurrent) ? '#3a7ddc' : '#e5e7eb',
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
              // Very explicit mapping to avoid any confusion
              const stepMapping = {
                0: 'mood',     // Heart icon
                1: 'emotions', // Smile icon
                2: 'wellbeing' // Compass icon
              }
              return currentStep === stepMapping[index]
            })()
            // Can navigate if it's completed OR if we're past this step
            const canNavigate = isCompleted || isCurrentStep || (() => {
              if (index === 0) return currentStep === 'emotions' || currentStep === 'wellbeing'
              if (index === 1) return currentStep === 'wellbeing'
              return false
            })()

            // Highlight if completed OR current
            const isHighlighted = isCompleted || isCurrentStep

            return (
              <div key={segment.name} className="text-center" style={{ width: 'calc((100% - 2px) / 3 - 20px)' }}>
                {canNavigate && onNavigateToStep ? (
                  <button
                    onClick={() => stepId && handleNavigateToStep(stepId)}
                    className="transition-all cursor-pointer relative"
                    style={{ background: 'none', border: 'none', padding: '12px 16px', margin: '-12px -16px' }}
                    aria-label={`Navigate to ${segment.name}`}
                  >
                    <span className={`text-xs ${isHighlighted ? '' : 'text-gray-600'}`} style={{ color: isHighlighted ? '#3a7ddc' : undefined }}>
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

      {/* Guide Modal */}
      <GuideModal
        isOpen={isGuideModalOpen}
        onClose={() => setIsGuideModalOpen(false)}
        section={getCurrentSection()}
      />
    </div>
  )
}