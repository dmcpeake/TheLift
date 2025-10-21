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
  onGuideClick?: () => void
}

const progressSegments = [
  { name: 'Mood', icon: Heart },
  { name: 'Wellbeing', icon: Compass },
  { name: 'Emotions', icon: Smile }
]

const steps = [
  { id: 'mood', name: 'Mood meter', number: 1 },
  { id: 'wellbeing', name: 'Wellbeing wheel', number: 2 },
  { id: 'emotions', name: 'My emotions', number: 3 }
]

export function ProgressHeader({
  currentStep,
  completedData,
  currentStepHasSelection,
  emotionGridStep,
  onNavigateToStep,
  onGuideClick
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
    if (onGuideClick) {
      onGuideClick()
    } else {
      setIsGuideModalOpen(true)
    }
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
              backgroundColor: 'rgba(232, 126, 103, 0.1)',
              borderRadius: '50%',
              border: 'none',
              padding: '0',
              boxSizing: 'border-box'
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

            // Simple logic: blue if we've reached this section or beyond
            const isActive = (() => {
              if (currentStep === 'mood') return index === 0
              if (currentStep === 'wellbeing') return index <= 1
              if (currentStep === 'emotions' || currentStep === 'chart' || currentStep === 'talk' || currentStep === 'lift' || currentStep === 'garden' || currentStep === 'complete') return true
              return false
            })()

            // Can navigate if section is active OR if it's the next section and current has selection
            const canNavigate = isActive || (() => {
              // Allow navigation to next section if current section has a selection
              if (currentStepHasSelection) {
                if (currentStep === 'mood' && index === 1) return true // Can go to wellbeing
                if (currentStep === 'wellbeing' && index === 2) return true // Can go to emotions
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
                    <Icon className="h-6 w-6 mx-auto" style={{ color: isActive ? '#3a7ddc' : '#9ca3af' }} />
                  </button>
                ) : (
                  <Icon
                    className="h-6 w-6 mx-auto"
                    style={{
                      color: isActive ? '#3a7ddc' : '#9ca3af',
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
            // Simple logic: blue if we've reached this section or beyond
            const isActive = (() => {
              if (currentStep === 'mood') return index === 0
              if (currentStep === 'wellbeing') return index <= 1
              if (currentStep === 'emotions' || currentStep === 'chart' || currentStep === 'talk' || currentStep === 'lift' || currentStep === 'garden' || currentStep === 'complete') return true
              return false
            })()

            return (
              <div
                key={index}
                className="h-2 transition-all duration-300"
                style={{
                  backgroundColor: isActive ? '#3a7ddc' : '#e5e7eb',
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

            // Simple logic: blue if we've reached this section or beyond
            const isActive = (() => {
              if (currentStep === 'mood') return index === 0
              if (currentStep === 'wellbeing') return index <= 1
              if (currentStep === 'emotions' || currentStep === 'chart' || currentStep === 'talk' || currentStep === 'lift' || currentStep === 'garden' || currentStep === 'complete') return true
              return false
            })()

            // Can navigate if section is active OR if it's the next section and current has selection
            const canNavigate = isActive || (() => {
              // Allow navigation to next section if current section has a selection
              if (currentStepHasSelection) {
                if (currentStep === 'mood' && index === 1) return true // Can go to wellbeing
                if (currentStep === 'wellbeing' && index === 2) return true // Can go to emotions
              }
              return false
            })()

            return (
              <div key={segment.name} className="text-center" style={{ width: 'calc((100% - 2px) / 3 - 20px)' }}>
                {canNavigate && onNavigateToStep ? (
                  <button
                    onClick={() => stepId && handleNavigateToStep(stepId)}
                    className="transition-all cursor-pointer relative"
                    style={{ background: 'none', border: 'none', padding: '12px 16px', margin: '-12px -16px' }}
                    aria-label={`Navigate to ${segment.name}`}
                  >
                    <span className={`text-xs`} style={{ color: isActive ? '#3a7ddc' : '#9ca3af' }}>
                      {segment.name}
                    </span>
                  </button>
                ) : (
                  <span className={`text-xs`} style={{ color: isActive ? '#3a7ddc' : '#9ca3af' }}>
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