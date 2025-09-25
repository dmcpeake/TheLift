import React, { useState, useEffect } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ChevronLeft, ChevronRight, TreePine, X } from 'lucide-react'
import { BreathingCircles } from '../breathing/BreathingCircles'
import { MoodMeter } from '../prototypes/MoodMeter'
import { EmotionGrid } from '../prototypes/EmotionGrid'
import { WellbeingWheel } from '../prototypes/WellbeingWheel'
import { ProgressHeader } from '../shared/ProgressHeader'
import { WellbeingRadialGraph } from '../shared/WellbeingRadialGraph'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import Lottie from 'lottie-react'
import BlushingShaded from '../../assets/animations/Blushing_Shaded.json'
import HappyShaded from '../../assets/animations/Happy_Shaded.json'
import MehShaded from '../../assets/animations/Meh_Shaded.json'
import SadTearShaded from '../../assets/animations/Sad_Tear_Shaded.json'
import CryingShaded from '../../assets/animations/Crying_Shaded.json'

type FlowStep = 'checkin' | 'mood' | 'emotions' | 'wellbeing' | 'chart' | 'talk' | 'garden' | 'complete'

const steps = [
  { id: 'mood', name: 'My emotions', number: 1 },
  { id: 'emotions', name: 'My emotions', number: 2 },
  { id: 'wellbeing', name: 'Wellbeing wheel', number: 3 },
  { id: 'chart', name: 'Wellbeing chart', number: 4 },
  { id: 'talk', name: 'Talk to someone', number: 5 }
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
  const [theoAnimation, setTheoAnimation] = useState<any>(null)
  const [showSupportLightbox, setShowSupportLightbox] = useState(false)
  const [theoDocumentAnimation, setTheoDocumentAnimation] = useState<any>(null)

  const currentStep = (step || 'mood') as FlowStep
  const currentStepIndex = steps.findIndex(s => s.id === currentStep)

  // Load Theo animations
  useEffect(() => {
    fetch('/theo-waving.json')
      .then(response => response.json())
      .then(data => setTheoAnimation(data))
      .catch(error => console.error('Error loading Theo animation:', error))

    fetch('/theo-document.json')
      .then(response => response.json())
      .then(data => setTheoDocumentAnimation(data))
      .catch(error => console.error('Error loading Theo document animation:', error))
  }, [])

  // Reset selection state when step changes
  React.useEffect(() => {
    // Scroll to top when step changes
    window.scrollTo(0, 0)

    // Check if current step has completed data
    const hasCompletedData = completedData[currentStep] && !completedData[currentStep].skipped
    setCurrentStepHasSelection(hasCompletedData)

    // Reset emotion grid step to 1 when navigating back to emotions
    if (currentStep === 'emotions') {
      setEmotionGridStep(1)
    }

    // Reset all trigger states when step changes
    setTriggerEmotionCompletion(false)
    setTriggerMoodCompletion(false)
    setTriggerWellbeingCompletion(false)
  }, [currentStep, completedData])

  // No auto-redirect - user must click DONE button

  const handleStepComplete = (stepId: string, data: any) => {
    // Store the completed data
    setCompletedData(prev => ({ ...prev, [stepId]: data }))

    // Special handling for wellbeing completion
    if (stepId === 'wellbeing') {
      // Check if user has any wellbeing data or just skipped everything
      const hasWellbeingData = data.sections && data.sections.some(section => section.mood_numeric > 0)

      if (hasWellbeingData) {
        // User has wellbeing data - go to chart page
        navigate('/checkin/flow/chart')
      } else {
        // User skipped everything or has no data - go directly to talk page
        navigate('/checkin/flow/talk')
      }
      return
    }

    // Special handling for chart completion - go to talk page
    if (stepId === 'chart') {
      // Navigate to talk page
      navigate('/checkin/flow/talk')
      return
    }

    // Special handling for talk completion
    if (stepId === 'talk') {
      // Navigate to complete step
      navigate('/checkin/flow/complete')
      return
    }

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
    // Check if the step we're navigating to has completed data
    const hasCompletedData = completedData[stepId] && !completedData[stepId].skipped
    setCurrentStepHasSelection(hasCompletedData) // Set selection state based on completed data
    navigate(`/checkin/flow/${stepId}`)
  }

  const handleStepSelectionMade = () => {
    setCurrentStepHasSelection(true)
  }

  const handleStepSelectionRemoved = () => {
    setCurrentStepHasSelection(false)
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
            style={{ backgroundColor: '#3a7ddc' }}
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
            {/* Theo Document Animation */}
            {theoDocumentAnimation && (
              <div className="flex justify-center mb-6">
                <div style={{ width: '120px', height: '120px' }}>
                  <Lottie
                    animationData={theoDocumentAnimation}
                    loop={true}
                    autoplay={true}
                    style={{ width: '100%', height: '100%' }}
                  />
                </div>
              </div>
            )}

            <h1 className="text-4xl font-bold text-gray-900 mb-4">
              Great job!
            </h1>
            <p className="text-lg text-gray-600 mb-8">
              Thanks for sharing your feelings today
            </p>

            {/* Conditional message card based on talk choice */}
            <div className="bg-white rounded-lg shadow-lg border border-gray-200 p-6 mb-8 max-w-md mx-auto">
              {(() => {
                const talkChoice = completedData.talk?.choice
                if (talkChoice === 'parent') {
                  return (
                    <p className="text-gray-700">
                      Your parent will check in with you soon
                    </p>
                  )
                } else if (talkChoice === 'teacher') {
                  return (
                    <p className="text-gray-700">
                      Your teacher will check in with you soon
                    </p>
                  )
                } else {
                  return (
                    <div className="text-gray-700">
                      <p className="mb-2">Your feelings are safe with us</p>
                      <p className="text-sm text-gray-600">
                        You can always share with someone later if you want to
                      </p>
                    </div>
                  )
                }
              })()}
            </div>

            {/* DONE Button */}
            <div className="flex justify-center">
              <button
                onClick={() => navigate('/checkin/home')}
                className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                style={{
                  backgroundColor: '#e87e67',
                  color: 'white',
                  width: '140px',
                  height: '56px',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  borderRadius: '28px'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.backgroundColor = '#d86b4f'
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.backgroundColor = '#e87e67'
                }}
              >
                DONE
              </button>
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
              onPartialSave={(data) => {
                // Save emotion data without triggering navigation
                setCompletedData(prev => ({ ...prev, emotions: data }))
              }}
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
                onPartialSave={(data) => {
                  // Save wellbeing data without triggering navigation
                  setCompletedData(prev => ({ ...prev, wellbeing: data }))
                }}
              />
          </div>
        )}

        {currentStep === 'chart' && (
          <>
            <div className="bg-white min-h-screen relative" style={{ paddingTop: '140px', paddingBottom: '120px' }}>
              {/* Title - matching wellbeing page styling */}
              <div className="text-center" style={{ marginBottom: '2rem' }}>
                <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                  You've completed your wheel!
                </h1>
              </div>

              <div className="flex flex-col items-center p-8"
                   style={{ paddingTop: '0' }}>

                {/* Radial Graph */}
                <div>
                  <WellbeingRadialGraph
                    sections={completedData.wellbeing?.sections || []}
                    size={500}
                    theoAnimation={theoAnimation}
                    onCenterButtonClick={() => setShowSupportLightbox(true)}
                  />
                </div>

                {/* Support Lightbox */}
                {showSupportLightbox && (
                  <div
                    style={{
                      position: 'fixed',
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      backgroundColor: 'rgba(0, 0, 0, 0.8)',
                      zIndex: 9999
                    }}
                    onClick={() => setShowSupportLightbox(false)}
                  >
                    <div
                      style={{
                        position: 'absolute',
                        top: '50%',
                        left: '50%',
                        transform: 'translate(-50%, -50%)',
                        backgroundColor: 'white',
                        borderRadius: '8px',
                        padding: '20px',
                        display: 'flex',
                        flexDirection: 'column',
                        overflow: 'hidden',
                        maxWidth: '500px',
                        width: 'calc(100vw - 40px)'
                      }}
                      onClick={(e) => e.stopPropagation()}
                    >
                      {/* Header with Theo and title */}
                      <div style={{ textAlign: 'center', marginBottom: '20px' }}>
                        {theoAnimation && (
                          <div style={{ marginBottom: '16px' }}>
                            <div
                              style={{
                                width: '80px',
                                height: '80px',
                                margin: '0 auto'
                              }}
                            >
                              <Lottie
                                animationData={theoAnimation}
                                loop={true}
                                autoplay={true}
                                style={{ width: '100%', height: '100%' }}
                              />
                            </div>
                          </div>
                        )}

                        <h2 style={{ fontSize: '24px', fontWeight: '600', color: '#111827', marginBottom: '16px' }}>
                          Low score? To feel better you could try...
                        </h2>

                        {/* Dashed line separator */}
                        <div style={{
                          width: '100%',
                          height: '1px',
                          borderTop: '1px dashed #d1d5db',
                          marginBottom: '0'
                        }} />
                      </div>

                      {/* Content area */}
                      <div style={{ marginBottom: '20px' }}>
                        <div style={{ textAlign: 'left' }}>
                          <div style={{ display: 'flex', alignItems: 'flex-start', gap: '12px', marginBottom: '16px' }}>
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" style={{ marginTop: '2px', flexShrink: 0 }}>
                              <path d="M9 12l2 2 4-4" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                              <circle cx="12" cy="12" r="10" stroke="#e38d3b" strokeWidth="2"/>
                            </svg>
                            <p style={{
                              margin: '0',
                              color: '#374151',
                              lineHeight: '1.6'
                            }}>
                              List out the things that make you feel good
                            </p>
                          </div>
                          <div style={{
                            width: '100%',
                            height: '1px',
                            borderTop: '1px dotted #d1d5db',
                            marginBottom: '16px'
                          }} />
                          <div style={{ display: 'flex', alignItems: 'flex-start', gap: '12px', marginBottom: '16px' }}>
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" style={{ marginTop: '2px', flexShrink: 0 }}>
                              <path d="M9 12l2 2 4-4" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                              <circle cx="12" cy="12" r="10" stroke="#e38d3b" strokeWidth="2"/>
                            </svg>
                            <p style={{
                              margin: '0',
                              color: '#374151',
                              lineHeight: '1.6'
                            }}>
                              Talk to a friend
                            </p>
                          </div>
                          <div style={{
                            width: '100%',
                            height: '1px',
                            borderTop: '1px dotted #d1d5db',
                            marginBottom: '16px'
                          }} />
                          <div style={{ display: 'flex', alignItems: 'flex-start', gap: '12px' }}>
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" style={{ marginTop: '2px', flexShrink: 0 }}>
                              <path d="M9 12l2 2 4-4" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                              <circle cx="12" cy="12" r="10" stroke="#e38d3b" strokeWidth="2"/>
                            </svg>
                            <p style={{
                              margin: '0',
                              color: '#374151',
                              lineHeight: '1.6'
                            }}>
                              Talk to your adults or teachers for a bit more support
                            </p>
                          </div>
                        </div>
                      </div>

                      {/* Footer with close button */}
                      <div style={{
                        borderTop: '1px solid #e5e7eb',
                        paddingTop: '20px',
                        marginTop: '0px'
                      }}>
                        <button
                          onClick={() => setShowSupportLightbox(false)}
                          style={{
                            width: '100%',
                            padding: '12px',
                            textAlign: 'center',
                            color: '#3a7ddc',
                            fontWeight: '500',
                            backgroundColor: 'transparent',
                            border: 'none',
                            cursor: 'pointer',
                            fontSize: '16px'
                          }}
                        >
                          CLOSE
                        </button>
                      </div>
                    </div>
                  </div>
                )}
              </div>

              {/* Yellow swoosh footer - hidden on mobile */}
              <div className="hidden md:block absolute bottom-0 left-0 right-0">
                <YellowSwoosh />
              </div>

              {/* NEXT Button - positioned above yellow swoosh on desktop, at bottom on mobile */}
              <div className="fixed left-1/2 transform -translate-x-1/2 text-center"
                   style={{ zIndex: 1100, bottom: '32px' }}>
                <button
                  onClick={() => handleStepComplete('chart', {})}
                  className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                  style={{
                    backgroundColor: '#3a7ddc',
                    color: 'white',
                    width: '140px',
                    height: '56px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    borderRadius: '28px'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.backgroundColor = '#2e6bc7'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.backgroundColor = '#3a7ddc'
                  }}
                >
                  NEXT
                </button>
              </div>
            </div>
          </>
        )}

        {currentStep === 'talk' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px', paddingBottom: '120px' }}>
            <div className="max-w-2xl mx-auto px-6">
              {/* Title - matching other page styling */}
              <div className="text-center" style={{ marginBottom: '3rem' }}>
                <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                  Do you want to talk to someone?
                </h1>
              </div>

              {/* Summary Content - not in cards */}
              <div className="space-y-10">
                {/* Mood Section */}
                {completedData.mood && (
                  <div>
                    <hr className="border-t border-gray-200 mb-6" />
                    <h2 className="text-center text-gray-700 mb-4" style={{ fontSize: '18px', fontWeight: 600 }}>
                      Your mood
                    </h2>
                    <div className="flex flex-col items-center justify-center gap-2">
                      {(() => {
                        // Get the mood animation based on mood level
                        const getMoodAnimation = () => {
                          switch (completedData.mood.mood_level) {
                            case 'very_happy': return BlushingShaded
                            case 'happy': return HappyShaded
                            case 'ok': return MehShaded
                            case 'sad': return SadTearShaded
                            case 'very_sad': return CryingShaded
                            default: return null
                          }
                        }
                        const animation = getMoodAnimation()
                        if (animation) {
                          return (
                            <div style={{ width: '60px', height: '60px' }}>
                              <Lottie
                                animationData={animation}
                                loop={true}
                                autoplay={true}
                                style={{ width: '100%', height: '100%' }}
                              />
                            </div>
                          )
                        }
                        return null
                      })()}
                      <p className="text-lg capitalize">
                        {completedData.mood.mood_level.replace('_', ' ')}
                      </p>
                    </div>
                    {completedData.mood.notes && (
                      <p className="text-center text-gray-600 mt-3 italic" style={{ maxWidth: '500px', margin: '1rem auto' }}>
                        "{completedData.mood.notes}"
                      </p>
                    )}
                    <div className="mt-6"></div>
                  </div>
                )}

                {/* Emotions Section */}
                {completedData.emotions?.selected_emotions && completedData.emotions.selected_emotions.length > 0 && (
                  <div>
                    <hr className="border-t border-gray-200 mb-6" />
                    <h2 className="text-center text-gray-700 mb-4" style={{ fontSize: '18px', fontWeight: 600 }}>
                      Your emotions
                    </h2>
                    <div className="flex flex-wrap justify-center gap-3">
                      {completedData.emotions.selected_emotions.map((emotion: string, index: number) => {
                        // Find the emoji for this emotion
                        const emotionsData = {
                          'red': [
                            ['🤬 Enraged', '😣 Stressed', '😲 Shocked'],
                            ['😤 Fuming', '😠 Angry', '😰 Restless'],
                            ['🤢 Repulsed', '😟 Worried', '😬 Uneasy']
                          ],
                          'yellow': [
                            ['😮 Surprised', '🥳 Festive', '🤩 Ecstatic'],
                            ['⚡ Energized', '😊 Optimistic', '😃 Excited'],
                            ['🙂 Pleasant', '🤞 Hopeful', '🥰 Blissful']
                          ],
                          'blue': [
                            ['🤮 Disgusted', '😞 Down', '😐 Apathetic'],
                            ['😩 Miserable', '🥺 Lonely', '😪 Tired'],
                            ['😭 Despair', '😔 Desolate', '🪫 Drained']
                          ],
                          'green': [
                            ['😮‍💨 At ease', '🙂 Content', '🫶 Fulfilled'],
                            ['😌 Relaxed', '💤 Restful', '⚖️ Balanced'],
                            ['🥱 Sleepy', '🕊️ Tranquil', '🧘 Serene']
                          ]
                        }

                        let emotionWithEmoji = emotion
                        let quadrantColor = 'gray'

                        // Find which quadrant this emotion belongs to
                        Object.entries(emotionsData).forEach(([quadrant, quadrantEmotions]) => {
                          quadrantEmotions.forEach(row => {
                            row.forEach(emotionStr => {
                              const label = emotionStr.split(' ').slice(1).join(' ')
                              if (label === emotion) {
                                emotionWithEmoji = emotionStr
                                quadrantColor = quadrant
                              }
                            })
                          })
                        })

                        const [emoji, ...labelParts] = emotionWithEmoji.split(' ')

                        // Get background color based on quadrant
                        const getQuadrantColors = (quadrant: string) => {
                          switch (quadrant) {
                            case 'red':
                              return { bg: '#f7e9ee', border: '#d78fab' }
                            case 'yellow':
                              return { bg: '#f7e9db', border: '#d7914c' }
                            case 'blue':
                              return { bg: '#ecf3f4', border: '#9fc4c7' }
                            case 'green':
                              return { bg: '#f5f8f6', border: '#ceddd1' }
                            default:
                              return { bg: '#f9f9f9', border: '#e5e7eb' }
                          }
                        }

                        const colors = getQuadrantColors(quadrantColor)

                        return (
                          <div
                            key={index}
                            className="flex flex-col items-center justify-center gap-1"
                            style={{
                              width: '80px',
                              height: '80px',
                              padding: '8px',
                              backgroundColor: colors.bg,
                              border: `2px solid ${colors.border}`,
                              color: '#374151',
                              borderRadius: '4px',
                              boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                            }}
                          >
                            <span className="text-xl">{emoji}</span>
                            <span className="text-xs font-medium text-center" style={{ lineHeight: '1.1' }}>
                              {labelParts.join(' ')}
                            </span>
                          </div>
                        )
                      })}
                    </div>
                    {completedData.emotions?.emotion_story && (
                      <p className="text-center text-gray-600 mt-3 italic" style={{ maxWidth: '500px', margin: '1rem auto' }}>
                        "{completedData.emotions.emotion_story}"
                      </p>
                    )}
                    <hr className="border-t border-gray-200 mt-6 mb-6" />
                  </div>
                )}

                {/* Wellbeing Section */}
                {completedData.wellbeing?.sections && completedData.wellbeing.sections.length > 0 && (
                  <div>
                    <h2 className="text-center text-gray-700 mb-4" style={{ fontSize: '18px', fontWeight: 600 }}>
                      How you're feeling about
                    </h2>
                    <div className="space-y-3">
                      {completedData.wellbeing.sections.map((section: any, index: number) => {
                        // Get the mood animation based on mood level
                        const getMoodAnimation = () => {
                          switch (section.mood_level) {
                            case 'very_happy': return BlushingShaded
                            case 'happy': return HappyShaded
                            case 'ok': return MehShaded
                            case 'sad': return SadTearShaded
                            case 'very_sad': return CryingShaded
                            default: return null
                          }
                        }
                        const animation = getMoodAnimation()

                        return (
                          <div key={index}>
                            <div className="flex justify-between items-center">
                              <span className="text-base font-semibold">{section.name}</span>
                              <div className="flex items-center gap-2">
                                <span className="text-base capitalize">
                                  {section.mood_level.replace('_', ' ')}
                                </span>
                                {animation && (
                                  <div style={{ width: '30px', height: '30px' }}>
                                    <Lottie
                                      animationData={animation}
                                      loop={true}
                                      autoplay={true}
                                      style={{ width: '100%', height: '100%' }}
                                    />
                                  </div>
                                )}
                              </div>
                            </div>
                            {section.notes && (
                              <p className="text-left text-gray-600 mt-2 italic" style={{ fontSize: '14px' }}>
                                "{section.notes}"
                              </p>
                            )}
                            {/* Add dashed divider between sections (except for the last one) */}
                            {index < completedData.wellbeing.sections.length - 1 && (
                              <div style={{
                                width: '100%',
                                height: '1px',
                                borderTop: '1px dashed #d1d5db',
                                borderImageSource: 'repeating-linear-gradient(90deg, #d1d5db 0px, #d1d5db 4px, transparent 4px, transparent 8px)',
                                borderImageSlice: 1,
                                marginTop: '12px'
                              }} />
                            )}
                          </div>
                        )
                      })}
                    </div>
                    <hr className="border-t border-gray-200 mt-6" />
                  </div>
                )}
              </div>

              {/* Action Buttons - horizontal row with consistent site styling */}
              <div className="flex flex-wrap justify-center gap-4 mt-8">
                <button
                  onClick={() => handleStepComplete('talk', { choice: 'parent' })}
                  className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                  style={{
                    backgroundColor: '#3a7ddc',
                    color: 'white',
                    width: '100px',
                    height: '56px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    borderRadius: '28px'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.backgroundColor = '#2e6bc7'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.backgroundColor = '#3a7ddc'
                  }}
                >
                  A parent
                </button>

                <button
                  onClick={() => handleStepComplete('talk', { choice: 'teacher' })}
                  className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                  style={{
                    backgroundColor: '#3a7ddc',
                    color: 'white',
                    width: '100px',
                    height: '56px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    borderRadius: '28px'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.backgroundColor = '#2e6bc7'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.backgroundColor = '#3a7ddc'
                  }}
                >
                  A teacher
                </button>

                <button
                  onClick={() => handleStepComplete('talk', { choice: 'none' })}
                  className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                  style={{
                    backgroundColor: '#3a7ddc',
                    color: 'white',
                    width: '100px',
                    height: '56px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    borderRadius: '28px'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.backgroundColor = '#2e6bc7'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.backgroundColor = '#3a7ddc'
                  }}
                >
                  No one
                </button>
              </div>
            </div>
          </div>
        )}

      </div>
    </>
  )
}