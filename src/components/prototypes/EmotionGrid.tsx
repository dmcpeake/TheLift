import React, { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import Lottie from 'lottie-react'
import sadTearAnimation from '../../assets/animations/Sad_Tear_Shaded.json'
import blushingAnimation from '../../assets/animations/Blushing_Shaded.json'

interface EmotionData {
  selected_emotions: string[]
  emotion_story: string
  discussion_preference: string
  step_completed: number
  completed_at: string
  time_to_complete_seconds: number
  skipped?: boolean
}

interface EmotionGridProps {
  onComplete?: (data: EmotionData) => void
  showNextButton?: boolean
  onSelectionMade?: () => void
  hideDebugInfo?: boolean
  triggerCompletion?: boolean
  initialData?: any
  onStepChange?: (step: number) => void
  onPartialSave?: (data: any) => void
}

export function EmotionGrid({ onComplete, showNextButton = false, onSelectionMade, hideDebugInfo = false, triggerCompletion = false, initialData, onStepChange, onPartialSave }: EmotionGridProps = {}) {
  const navigate = useNavigate()
  const [currentStep, setCurrentStep] = useState(1)
  const [selectedEmotions, setSelectedEmotions] = useState<string[]>([])
  const [emotionStory, setEmotionStory] = useState('')
  const [discussionPreference, setDiscussionPreference] = useState('')
  const [finalData, setFinalData] = useState<EmotionData | null>(null)
  const [stepData, setStepData] = useState<any>(null)
  const [startTime] = useState(Date.now())
  const [isListening, setIsListening] = useState(false)
  const [currentSlide, setCurrentSlide] = useState(0)
  const scrollContainerRef = useRef<HTMLDivElement>(null)
  const [selectedQuadrant, setSelectedQuadrant] = useState<string | null>(null)
  const [voiceText, setVoiceText] = useState('')
  const [talkPreference, setTalkPreference] = useState<string | null>(null)
  const [isRecording, setIsRecording] = useState(false)
  const [angryAnimation, setAngryAnimation] = useState<any>(null)
  const [laughingAnimation, setLaughingAnimation] = useState<any>(null)
  const [hasCompletedWhy, setHasCompletedWhy] = useState(false)
  const [buttonAnimationKey, setButtonAnimationKey] = useState(0)

  // Trigger button animation when save/next conditions change
  useEffect(() => {
    setButtonAnimationKey(prev => prev + 1)
  }, [currentStep, hasCompletedWhy])

  // Reset to step 1 when component mounts (navigation occurs)
  // Only reset if we don't have initial data to restore
  useEffect(() => {
    setCurrentStep(1)
    if (!initialData) {
      setSelectedEmotions([])
      setEmotionStory('')
      setDiscussionPreference('')
      setFinalData(null)
      setStepData(null)
      setSelectedQuadrant(null)
      setVoiceText('')
      setTalkPreference(null)
    }
  }, []) // Empty dependency array - runs only on mount (when navigating to this component)

  // Load animations from public directory
  useEffect(() => {
    const loadAnimations = async () => {
      try {
        const [angryResponse, laughingResponse] = await Promise.all([
          fetch('/Angry_Shaded.json'),
          fetch('/Laughing_Shaded.json')
        ])

        const angryData = await angryResponse.json()
        const laughingData = await laughingResponse.json()

        setAngryAnimation(angryData)
        setLaughingAnimation(laughingData)
      } catch (error) {
        console.error('Failed to load animations:', error)
      }
    }

    loadAnimations()
  }, [])

  // Initialize with existing data if available, but only restore to step 2 if we have complete data
  // Only run this once on mount to avoid interfering with navigation
  useEffect(() => {
    if (initialData) {
      if (initialData.selected_emotions && initialData.selected_emotions.length > 0) {
        setSelectedEmotions(initialData.selected_emotions)
        // Don't automatically navigate to step 2 - let user control navigation
        onSelectionMade?.()
      }
      if (initialData.emotion_story) {
        setEmotionStory(initialData.emotion_story)
      }
    }
  }, []) // Empty dependency array - only run once on mount

  // Handle external trigger for completion
  useEffect(() => {
    if (triggerCompletion && selectedEmotions.length > 0) {
      handleComplete()
    }
  }, [triggerCompletion])

  // 2D Mood Meter: 4 Quadrants with 9 emotions each (3x3 grid)
  const emotions = {
    'red': {
      title: 'High Energy + Unpleasant',
      hint: 'Big buzzy feelings',
      bg: '#F7D8D6',
      text: '#7E1B1B',
      emotions: [
        ['🤬 Enraged', '😣 Stressed', '😲 Shocked'],
        ['😤 Fuming', '😠 Angry', '😰 Restless'],
        ['🤢 Repulsed', '😟 Worried', '😬 Uneasy']
      ]
    },
    'yellow': {
      title: 'High Energy + Pleasant',
      hint: 'Bright happy feelings',
      bg: '#FFF1CC',
      text: '#6A4B00',
      emotions: [
        ['😮 Surprised', '🥳 Festive', '🤩 Ecstatic'],
        ['⚡ Energized', '😊 Optimistic', '😃 Excited'],
        ['🙂 Pleasant', '🤞 Hopeful', '🥰 Blissful']
      ]
    },
    'blue': {
      title: 'Low Energy + Unpleasant',
      hint: 'Heavy tired feelings',
      bg: '#E0F0FA',
      text: '#0F4A67',
      emotions: [
        ['🤮 Disgusted', '😞 Down', '😐 Apathetic'],
        ['😩 Miserable', '🥺 Lonely', '😪 Tired'],
        ['😭 Despair', '😔 Desolate', '🪫 Drained']
      ]
    },
    'green': {
      title: 'Low Energy + Pleasant',
      hint: 'Calm comfy feelings',
      bg: '#E5F5E3',
      text: '#1E5B2A',
      emotions: [
        ['😮‍💨 At ease', '🙂 Content', '🫶 Fulfilled'],
        ['😌 Relaxed', '💤 Restful', '⚖️ Balanced'],
        ['🥱 Sleepy', '🕊️ Tranquil', '🧘 Serene']
      ]
    }
  }

  const categorySubtexts = {
    'High Energy, Uncomfortable': 'These feelings can feel intense and challenging',
    'Low Energy, Uncomfortable': 'These feelings can feel heavy and draining',
    'High Energy, Comfortable': 'These feelings can feel energizing and uplifting',
    'Low Energy, Comfortable': 'These feelings can feel peaceful and restful'
  }

  const allEmotions = Object.values(emotions).flat()
  const emotionCategories = Object.entries(emotions)
  const totalSlides = emotionCategories.length

  const scrollToSlide = (slideIndex: number) => {
    if (scrollContainerRef.current) {
      const slideWidth = 350 // 290px category + 60px gap (20px margins on each side of divider + 20px divider)
      const scrollPosition = slideIndex * slideWidth
      scrollContainerRef.current.scrollTo({
        left: scrollPosition,
        behavior: 'smooth'
      })
      setCurrentSlide(slideIndex)
    }
  }

  const handlePrevSlide = () => {
    const newIndex = Math.max(0, currentSlide - 1)
    scrollToSlide(newIndex)
  }

  const handleNextSlide = () => {
    const newIndex = Math.min(totalSlides - 1, currentSlide + 1)
    scrollToSlide(newIndex)
  }

  const toggleEmotion = (emotion: string) => {
    let newEmotions: string[]
    if (selectedEmotions.includes(emotion)) {
      newEmotions = selectedEmotions.filter(e => e !== emotion)
    } else {
      // Only allow selection if less than 3 are selected from current quadrant
      const currentQuadrantEmotions = emotions[selectedQuadrant as keyof typeof emotions].emotions.flat()
      const currentQuadrantLabels = currentQuadrantEmotions.map(emotionString =>
        emotionString.split(' ').slice(1).join(' ')
      )
      const selectedFromCurrentQuadrant = selectedEmotions.filter(emotion =>
        currentQuadrantLabels.includes(emotion)
      )

      if (selectedFromCurrentQuadrant.length < 3) {
        newEmotions = [...selectedEmotions, emotion]
      } else {
        return // Don't allow more than 3 selections from current quadrant
      }
    }
    setSelectedEmotions(newEmotions)
    // Reset hasCompletedWhy when emotions are changed
    setHasCompletedWhy(false)

    // Notify parent of selection (any selection makes chevron active)
    if (newEmotions.length > 0) {
      onSelectionMade?.()
    }


    // Update step data for display
    const data = {
      step: 1,
      selected_emotions: newEmotions,
      timestamp: new Date().toISOString()
    }
    setStepData(data)
    console.log('🎯 EMOTION GRID STEP 1 DATA:', data)
  }

  const handleNext = () => {
    if (currentStep === 1) {
      // Move to step 2 to show selected emotions + form
      setCurrentStep(2)
      onStepChange?.(2)
    } else {
      // Complete the grid
      handleComplete()
    }
  }

  const updateStory = (story: string) => {
    setEmotionStory(story)
  }

  const handleMicrophoneClick = () => {
    if (!('webkitSpeechRecognition' in window) && !('SpeechRecognition' in window)) {
      alert('Speech recognition is not supported in your browser')
      return
    }

    const SpeechRecognition = (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition
    const recognition = new SpeechRecognition()

    recognition.continuous = false
    recognition.interimResults = false
    recognition.lang = 'en-US'

    recognition.onstart = () => {
      setIsListening(true)
    }

    recognition.onresult = (event: any) => {
      const transcript = event.results[0][0].transcript
      const newStory = emotionStory + (emotionStory ? ' ' : '') + transcript
      updateStory(newStory.slice(0, 500))
    }

    recognition.onerror = () => {
      setIsListening(false)
      alert('Speech recognition error. Please try again.')
    }

    recognition.onend = () => {
      setIsListening(false)
    }

    recognition.start()
  }

  const handleComplete = () => {
    const timeToComplete = Math.round((Date.now() - startTime) / 1000)

    const data: EmotionData = {
      selected_emotions: selectedEmotions,
      emotion_story: emotionStory,
      discussion_preference: discussionPreference,
      step_completed: 2,
      completed_at: new Date().toISOString(),
      time_to_complete_seconds: timeToComplete
    }

    console.log('🎯 EMOTION GRID COMPLETE DATA:', data)

    if (showNextButton && onComplete) {
      onComplete(data)
    } else {
      setFinalData(data)
      setStepData(null) // Clear step data to show final data
      setCurrentStep(4)
    }
  }

  const reset = () => {
    setCurrentStep(1)
    setSelectedEmotions([])
    setEmotionStory('')
    setFinalData(null)
    setStepData(null)
  }

  return (
    <>
      <style jsx>{`
        @keyframes emotionCircleExpand {
          0% {
            width: 56px;
            border-radius: 28px;
          }
          100% {
            width: 140px;
            border-radius: 28px;
          }
        }
        @keyframes emotionTextFadeIn {
          0% {
            opacity: 0;
          }
          60% {
            opacity: 0;
          }
          100% {
            opacity: 1;
          }
        }
        @media (max-width: 768px) {
          .emotion-title-mobile {
            font-size: 28px !important;
            line-height: 1.2 !important;
            margin-top: -55px !important;
          }
          .yellow-swoosh-mobile-hide {
            display: none !important;
          }
        }
        /* SEND Accessibility - Large touch targets */
        .touch-target {
          min-width: 44px !important;
          min-height: 44px !important;
        }
        /* High contrast mode support */
        @media (prefers-contrast: high) {
          .touch-target {
            border-width: 2px !important;
          }
        }
        /* Mobile title spacing and input zoom prevention */
        @media (max-width: 768px) {
          .emotion-main-title-container,
          .emotion-dynamic-title-container {
            margin-top: 20px;
          }
          /* Prevent zoom on input focus - set font-size to 16px minimum */
          .emotion-textarea {
            font-size: 16px !important;
          }
        }
      `}</style>

      {/* Dynamic title for each step */}
      {currentStep !== 1 && (
        <div className="text-center emotion-dynamic-title-container">
          <h1 className="emotion-title-mobile text-gray-900" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
            {currentStep === 2 && (
              selectedQuadrant === 'red' ? 'Big buzzy feelings' :
              selectedQuadrant === 'yellow' ? 'Bright happy feelings' :
              selectedQuadrant === 'blue' ? 'Heavy tired feelings' :
              selectedQuadrant === 'green' ? 'Calm comfy feelings' :
              'Choose your emotions'
            )}
            {currentStep === 3 && 'Why do you feel this way?'}
            {currentStep === 4 && 'Talk to someone?'}
            {currentStep === 5 && 'Thank you!'}
          </h1>
        </div>
      )}

      {/* Step 1: Select Quadrant (2x2 Grid) */}
      {currentStep === 1 && (
        <>
          <div className="text-center mb-4 emotion-main-title-container">
            <h1 className="emotion-title-mobile text-gray-900 mb-1" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
              How are you feeling?
            </h1>
          </div>
          <div className="flex flex-col items-center p-4">
          {/* Grid container - horizontally centered */}
          <div className="flex items-center justify-center">
            {/* ENERGY label - 20px LEFT of grid */}
            <div className="flex flex-col items-center mr-5">
              <div className="text-sm font-semibold text-gray-600 mb-6">↑</div>
              <div className="text-sm font-semibold text-gray-600 -rotate-90 whitespace-nowrap">ENERGY</div>
              <div className="text-sm font-semibold text-gray-600 mt-6">↓</div>
            </div>

            {/* 2x2 Grid - perfectly centered */}
            <div className="relative" style={{ display: 'grid', gridTemplateColumns: '150px 150px', gap: '20px' }}>
              <button
                onClick={() => {
                  setSelectedQuadrant('red')
                  setCurrentStep(2)
                }}
                className="flex flex-col justify-between items-center transition-all hover:scale-105 touch-target"
                style={{
                  width: '150px',
                  height: '150px',
                  padding: '20px',
                  backgroundColor: '#f7e9ee',
                  border: '2px solid #d78fab',
                  color: '#374151',
                  borderRadius: '4px',
                  fontSize: '14px',
                  boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                  transition: 'all 0.3s ease'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06)'
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                }}
              >
                <div className="flex-grow flex items-center" style={{ marginTop: '10px' }}>
                  {(() => {
                    const redEmotions = emotions.red.emotions.flat().filter(emotionString => {
                      const label = emotionString.split(' ').slice(1).join(' ')
                      return selectedEmotions.includes(label)
                    })
                    return redEmotions.length > 0 ? (
                      <div className="flex justify-center items-center gap-1" style={{ maxWidth: '60px' }}>
                        {redEmotions.slice(0, 3).map((emotionString, idx) => (
                          <span key={idx} style={{ fontSize: '32px' }}>
                            {emotionString.split(' ')[0]}
                          </span>
                        ))}
                      </div>
                    ) : angryAnimation && (
                      <Lottie
                        animationData={angryAnimation}
                        style={{
                          width: '50px',
                          height: '50px',
                          filter: 'drop-shadow(0 4px 8px rgba(0, 0, 0, 0.15))'
                        }}
                        loop={true}
                        autoplay={true}
                      />
                    )
                  })()}
                </div>
                <div style={{ marginBottom: '10px' }}>
                  <p className="text-center font-semibold" style={{ margin: '0', lineHeight: '1.2', fontSize: '13px', whiteSpace: 'nowrap' }}>
                    Big buzzy feelings
                  </p>
                  <div style={{ minHeight: '24px', display: 'flex', alignItems: 'flex-start', justifyContent: 'center', marginTop: '9px' }}>
                    {(() => {
                      const redEmotions = emotions.red.emotions.flat().filter(emotionString => {
                        const label = emotionString.split(' ').slice(1).join(' ')
                        return selectedEmotions.includes(label)
                      })
                      return redEmotions.length > 0 ? (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', fontSize: '10px', lineHeight: '1.4', margin: '0', padding: '0 4px' }}>
                          {redEmotions.map(emotionString => emotionString.split(' ').slice(1).join(' ')).join(', ')}
                        </p>
                      ) : (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', whiteSpace: 'nowrap', margin: '0' }}>
                          High energy · Unpleasant
                        </p>
                      )
                    })()}
                  </div>
                </div>
              </button>

              <button
                onClick={() => {
                  setSelectedQuadrant('yellow')
                  setCurrentStep(2)
                }}
                className="flex flex-col justify-between items-center transition-all hover:scale-105 touch-target"
                style={{
                  width: '150px',
                  height: '150px',
                  padding: '20px',
                  backgroundColor: '#f7e9db',
                  border: '2px solid #d7914c',
                  color: '#374151',
                  borderRadius: '4px',
                  fontSize: '14px',
                  boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                  transition: 'all 0.3s ease'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06)'
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                }}
              >
                <div className="flex-grow flex items-center" style={{ marginTop: '10px' }}>
                  {(() => {
                    const yellowEmotions = emotions.yellow.emotions.flat().filter(emotionString => {
                      const label = emotionString.split(' ').slice(1).join(' ')
                      return selectedEmotions.includes(label)
                    })
                    return yellowEmotions.length > 0 ? (
                      <div className="flex justify-center items-center gap-1" style={{ maxWidth: '60px' }}>
                        {yellowEmotions.slice(0, 3).map((emotionString, idx) => (
                          <span key={idx} style={{ fontSize: '32px' }}>
                            {emotionString.split(' ')[0]}
                          </span>
                        ))}
                      </div>
                    ) : laughingAnimation && (
                      <Lottie
                        animationData={laughingAnimation}
                        style={{
                          width: '50px',
                          height: '50px',
                          filter: 'drop-shadow(0 4px 8px rgba(0, 0, 0, 0.15))'
                        }}
                        loop={true}
                        autoplay={true}
                      />
                    )
                  })()}
                </div>
                <div style={{ marginBottom: '10px' }}>
                  <p className="text-center font-semibold" style={{ margin: '0', lineHeight: '1.2', fontSize: '13px', whiteSpace: 'nowrap' }}>
                    Bright happy feelings
                  </p>
                  <div style={{ minHeight: '24px', display: 'flex', alignItems: 'flex-start', justifyContent: 'center', marginTop: '9px' }}>
                    {(() => {
                      const yellowEmotions = emotions.yellow.emotions.flat().filter(emotionString => {
                        const label = emotionString.split(' ').slice(1).join(' ')
                        return selectedEmotions.includes(label)
                      })
                      return yellowEmotions.length > 0 ? (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', fontSize: '10px', lineHeight: '1.4', margin: '0', padding: '0 4px' }}>
                          {yellowEmotions.map(emotionString => emotionString.split(' ').slice(1).join(' ')).join(', ')}
                        </p>
                      ) : (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', whiteSpace: 'nowrap', margin: '0' }}>
                          High energy · Pleasant
                        </p>
                      )
                    })()}
                  </div>
                </div>
              </button>

              <button
                onClick={() => {
                  setSelectedQuadrant('blue')
                  setCurrentStep(2)
                }}
                className="flex flex-col justify-between items-center transition-all hover:scale-105 touch-target"
                style={{
                  width: '150px',
                  height: '150px',
                  padding: '20px',
                  backgroundColor: '#ecf3f4',
                  border: '2px solid #9fc4c7',
                  color: '#374151',
                  borderRadius: '4px',
                  fontSize: '14px',
                  boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                  transition: 'all 0.3s ease'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06)'
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                }}
              >
                <div className="flex-grow flex items-center" style={{ marginTop: '10px' }}>
                  {(() => {
                    const blueEmotions = emotions.blue.emotions.flat().filter(emotionString => {
                      const label = emotionString.split(' ').slice(1).join(' ')
                      return selectedEmotions.includes(label)
                    })
                    return blueEmotions.length > 0 ? (
                      <div className="flex justify-center items-center gap-1" style={{ maxWidth: '60px' }}>
                        {blueEmotions.slice(0, 3).map((emotionString, idx) => (
                          <span key={idx} style={{ fontSize: '32px' }}>
                            {emotionString.split(' ')[0]}
                          </span>
                        ))}
                      </div>
                    ) : (
                      <Lottie
                        animationData={sadTearAnimation}
                        style={{
                          width: '50px',
                          height: '50px',
                          filter: 'drop-shadow(0 4px 8px rgba(0, 0, 0, 0.15))'
                        }}
                        loop={true}
                        autoplay={true}
                      />
                    )
                  })()}
                </div>
                <div style={{ marginBottom: '10px' }}>
                  <p className="text-center font-semibold" style={{ margin: '0', lineHeight: '1.2', fontSize: '13px', whiteSpace: 'nowrap' }}>
                    Heavy tired feelings
                  </p>
                  <div style={{ minHeight: '24px', display: 'flex', alignItems: 'flex-start', justifyContent: 'center', marginTop: '9px' }}>
                    {(() => {
                      const blueEmotions = emotions.blue.emotions.flat().filter(emotionString => {
                        const label = emotionString.split(' ').slice(1).join(' ')
                        return selectedEmotions.includes(label)
                      })
                      return blueEmotions.length > 0 ? (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', fontSize: '10px', lineHeight: '1.4', margin: '0', padding: '0 4px' }}>
                          {blueEmotions.map(emotionString => emotionString.split(' ').slice(1).join(' ')).join(', ')}
                        </p>
                      ) : (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', whiteSpace: 'nowrap', margin: '0' }}>
                          Low energy · Unpleasant
                        </p>
                      )
                    })()}
                  </div>
                </div>
              </button>

              <button
                onClick={() => {
                  setSelectedQuadrant('green')
                  setCurrentStep(2)
                }}
                className="flex flex-col justify-between items-center transition-all hover:scale-105 touch-target"
                style={{
                  width: '150px',
                  height: '150px',
                  padding: '20px',
                  backgroundColor: '#f5f8f6',
                  border: '2px solid #ceddd1',
                  color: '#374151',
                  borderRadius: '4px',
                  fontSize: '14px',
                  boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                  transition: 'all 0.3s ease'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06)'
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                }}
              >
                <div className="flex-grow flex items-center" style={{ marginTop: '10px' }}>
                  {(() => {
                    const greenEmotions = emotions.green.emotions.flat().filter(emotionString => {
                      const label = emotionString.split(' ').slice(1).join(' ')
                      return selectedEmotions.includes(label)
                    })
                    return greenEmotions.length > 0 ? (
                      <div className="flex justify-center items-center gap-1" style={{ maxWidth: '60px' }}>
                        {greenEmotions.slice(0, 3).map((emotionString, idx) => (
                          <span key={idx} style={{ fontSize: '32px' }}>
                            {emotionString.split(' ')[0]}
                          </span>
                        ))}
                      </div>
                    ) : (
                      <Lottie
                        animationData={blushingAnimation}
                        style={{
                          width: '50px',
                          height: '50px',
                          filter: 'drop-shadow(0 4px 8px rgba(0, 0, 0, 0.15))'
                        }}
                        loop={true}
                        autoplay={true}
                      />
                    )
                  })()}
                </div>
                <div style={{ marginBottom: '10px' }}>
                  <p className="text-center font-semibold" style={{ margin: '0', lineHeight: '1.2', fontSize: '13px', whiteSpace: 'nowrap' }}>
                    Calm comfy feelings
                  </p>
                  <div style={{ minHeight: '24px', display: 'flex', alignItems: 'flex-start', justifyContent: 'center', marginTop: '9px' }}>
                    {(() => {
                      const greenEmotions = emotions.green.emotions.flat().filter(emotionString => {
                        const label = emotionString.split(' ').slice(1).join(' ')
                        return selectedEmotions.includes(label)
                      })
                      return greenEmotions.length > 0 ? (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', fontSize: '10px', lineHeight: '1.4', margin: '0', padding: '0 4px' }}>
                          {greenEmotions.map(emotionString => emotionString.split(' ').slice(1).join(' ')).join(', ')}
                        </p>
                      ) : (
                        <p className="text-center text-xs" style={{ color: '#6b7280', marginTop: '4px', whiteSpace: 'nowrap', margin: '0' }}>
                          Low energy · Pleasant
                        </p>
                      )
                    })()}
                  </div>
                </div>
              </button>
              {/* COMFORT label - 20px below grid, horizontal with left/right arrows */}
              <div className="absolute left-1/2 transform -translate-x-1/2 flex items-center" style={{ top: '100%', marginTop: '16px' }}>
                <div className="text-sm font-semibold text-gray-600 mr-2">←</div>
                <div className="text-sm font-semibold text-gray-600">COMFORT</div>
                <div className="text-sm font-semibold text-gray-600 ml-2">→</div>
              </div>
            </div>

            {/* Invisible spacer to balance the ENERGY column */}
            <div className="flex flex-col items-center ml-5 invisible">
              <div className="text-sm font-semibold text-gray-600 mb-6">↑</div>
              <div className="text-sm font-semibold text-gray-600 -rotate-90 whitespace-nowrap">SPACER</div>
              <div className="text-sm font-semibold text-gray-600 mt-6">↓</div>
            </div>
          </div>

          {/* Navigation Button - 32px from bottom */}
          <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center items-center" style={{ zIndex: 1000, gap: '20px' }}>
            {/* Back Button */}
            <button
              onClick={() => navigate('/checkin/flow/mood')}
              style={{
                backgroundColor: 'white',
                border: '2px solid #3a7ddc',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#f8fafc'
                e.currentTarget.style.borderColor = '#2e6bc7'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'white'
                e.currentTarget.style.borderColor = '#3a7ddc'
              }}
              aria-label="Go back to mood"
            >
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
                <polyline points="15,18 9,12 15,6"></polyline>
              </svg>
            </button>

            {/* Next Button - only show if emotions are selected */}
            {selectedEmotions.length > 0 && (
              <button
                key={`why-next-${buttonAnimationKey}`}
                onClick={() => {
                  if (hasCompletedWhy) {
                    // If user has completed "why", go to wellbeing page
                    navigate('/checkin/flow/wellbeing')
                  } else {
                    // First time or after changes, go to "why" step
                    if (onPartialSave) {
                      const data = {
                        selected_emotions: selectedEmotions,
                        emotion_story: emotionStory,
                        step_completed: 1,
                        completed_at: new Date().toISOString(),
                        time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000)
                      }
                      onPartialSave(data)
                    }
                    setCurrentStep(3)
                  }
                }}
                style={{
                  width: '140px',
                  height: '56px',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  borderRadius: '28px',
                  backgroundColor: '#3a7ddc',
                  boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                  border: 'none',
                  cursor: 'pointer',
                  transition: 'background-color 0.3s ease',
                  color: 'white',
                  fontSize: '16px',
                  fontWeight: '600',
                  animation: 'emotionCircleExpand 0.4s ease-out'
                }}
                onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
                onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
                aria-label={hasCompletedWhy ? "Continue to wellbeing" : "Continue to why"}
              >
                <span style={{ animation: 'emotionTextFadeIn 0.4s ease-out' }}>
                  {hasCompletedWhy ? 'NEXT' : 'WHY?'}
                </span>
              </button>
            )}

            {/* Skip Button */}
            <button
              onClick={() => {
                // Skip emotions - but preserve any existing selections
                if (onComplete) {
                  const data: EmotionData = {
                    selected_emotions: selectedEmotions, // Keep existing selections
                    emotion_story: emotionStory,
                    discussion_preference: discussionPreference,
                    step_completed: 1,
                    completed_at: new Date().toISOString(),
                    time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000),
                    skipped: true // Mark as skipped
                  }
                  onComplete(data)
                }
              }}
              style={{
                backgroundColor: 'white',
                border: '2px solid #3a7ddc',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#f8fafc'
                e.currentTarget.style.borderColor = '#2e6bc7'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'white'
                e.currentTarget.style.borderColor = '#3a7ddc'
              }}
              aria-label="Skip emotions"
            >
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
                <polyline points="9,18 15,12 9,6"></polyline>
              </svg>
            </button>
          </div>
        </div>
        </>
      )}

      {/* Step 2: Select Emotions (3x3 Grid) */}
      {currentStep === 2 && selectedQuadrant && (
        <div className="flex flex-col items-center pb-32" style={{ paddingTop: '0', paddingLeft: '16px', paddingRight: '16px' }}>
          <p className="text-center text-gray-600" style={{ marginTop: '0px', marginBottom: '40px' }}>Choose up to 3 emotions that match how you feel</p>

          {/* 3x3 Grid of Emotions */}
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 100px)', gap: '10px', justifyContent: 'center' }}>
            {emotions[selectedQuadrant as keyof typeof emotions].emotions.flat().map((emotionString, index) => {
              const [emoji, ...labelParts] = emotionString.split(' ')
              const label = labelParts.join(' ')
              const isSelected = selectedEmotions.includes(label)

              // Check how many are selected from current quadrant
              const currentQuadrantEmotions = emotions[selectedQuadrant as keyof typeof emotions].emotions.flat()
              const currentQuadrantLabels = currentQuadrantEmotions.map(emotionString =>
                emotionString.split(' ').slice(1).join(' ')
              )
              const selectedFromCurrentQuadrant = selectedEmotions.filter(emotion =>
                currentQuadrantLabels.includes(emotion)
              )
              const isDisabled = !isSelected && selectedFromCurrentQuadrant.length >= 3

              return (
                <button
                  key={emotionString}
                  onClick={() => toggleEmotion(label)}
                  disabled={isDisabled}
                  className={`relative flex flex-col items-center justify-center gap-1 transition-all touch-target ${
                    isDisabled ? 'cursor-not-allowed' : 'hover:scale-105'
                  }`}
                  style={{
                    width: '100px',
                    height: '100px',
                    padding: '8px',
                    backgroundColor: isSelected ? '#ffffff' :
                                    selectedQuadrant === 'red' ? (
                                      index % 3 === 0 ? '#e7bccd' :
                                      index % 3 === 1 ? '#efd2dd' :
                                      '#f7e9ee'
                                    ) :
                                    selectedQuadrant === 'yellow' ? (
                                      index % 3 === 0 ? '#e7bd94' :
                                      index % 3 === 1 ? '#efd3b7' :
                                      '#f7e9db'
                                    ) :
                                    selectedQuadrant === 'blue' ? (
                                      index % 3 === 0 ? '#c5dcdd' :
                                      index % 3 === 1 ? '#d9e7e9' :
                                      '#ecf3f4'
                                    ) :
                                    selectedQuadrant === 'green' ? (
                                      index % 3 === 0 ? '#e2ebe3' :
                                      index % 3 === 1 ? '#ebf1ed' :
                                      '#f5f8f6'
                                    ) : '#f9f9f9',
                    border: `2px solid ${selectedQuadrant === 'red' ? '#d78fab' :
                                    selectedQuadrant === 'yellow' ? '#d7914c' :
                                    selectedQuadrant === 'blue' ? '#9fc4c7' :
                                    selectedQuadrant === 'green' ? '#ceddd1' : '#ccc'}`,
                    color: '#374151',
                    borderRadius: '4px',
                    boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                    transition: 'all 0.3s ease',
                    opacity: isDisabled ? 0.3 : 1
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06)'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                  }}
                >
                  <span className="text-3xl">{emoji}</span>
                  <span className="text-sm font-medium text-center">{label}</span>
                  {isSelected && (
                    <div
                      className="absolute w-6 h-6 rounded-full flex items-center justify-center cursor-pointer transition-colors"
                      style={{
                        top: '4px',
                        right: '4px',
                        backgroundColor: selectedQuadrant === 'red' ? '#d78fab' :
                                        selectedQuadrant === 'yellow' ? '#d7914c' :
                                        selectedQuadrant === 'blue' ? '#9fc4c7' :
                                        selectedQuadrant === 'green' ? '#ceddd1' : '#ccc'
                      }}
                      onClick={(e) => {
                        e.preventDefault()
                        e.stopPropagation()
                        toggleEmotion(label)
                      }}
                    >
                      <span className="text-white text-sm font-bold" style={{ lineHeight: '1', display: 'flex', alignItems: 'center', justifyContent: 'center', marginTop: '-2px' }}>×</span>
                    </div>
                  )}
                </button>
              )
            })}
          </div>


          {/* Navigation Buttons - Fixed at bottom */}
          <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center items-center" style={{ zIndex: 1000 }}>
            {(() => {
              const currentQuadrantEmotions = emotions[selectedQuadrant as keyof typeof emotions].emotions.flat()
              const currentQuadrantLabels = currentQuadrantEmotions.map(emotionString =>
                emotionString.split(' ').slice(1).join(' ')
              )
              const selectedFromCurrentQuadrant = selectedEmotions.filter(emotion =>
                currentQuadrantLabels.includes(emotion)
              )

              if (selectedFromCurrentQuadrant.length > 0) {
                // Show only SELECT button when emotions are selected
                return (
                  <button
                    key={`select-${buttonAnimationKey}`}
                    onClick={() => {
                      // Save partial data without triggering navigation
                      if (onPartialSave) {
                        const data = {
                          selected_emotions: selectedEmotions,
                          emotion_story: emotionStory,
                          step_completed: 1,
                          completed_at: new Date().toISOString(),
                          time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000)
                        }
                        onPartialSave(data)
                      }
                      // Go back to quadrant view
                      setCurrentStep(1)
                    }}
                    style={{
                      width: '140px',
                      height: '56px',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      borderRadius: '28px',
                      backgroundColor: 'white',
                      boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                      border: '2px solid #3a7ddc',
                      cursor: 'pointer',
                      transition: 'background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease',
                      color: '#3a7ddc',
                      fontSize: '16px',
                      fontWeight: '600',
                      animation: 'emotionCircleExpand 0.4s ease-out'
                    }}
                    onMouseEnter={(e) => {
                      e.currentTarget.style.backgroundColor = '#f8fafc'
                      e.currentTarget.style.borderColor = '#2e6bc7'
                      e.currentTarget.style.color = '#2e6bc7'
                    }}
                    onMouseLeave={(e) => {
                      e.currentTarget.style.backgroundColor = 'white'
                      e.currentTarget.style.borderColor = '#3a7ddc'
                      e.currentTarget.style.color = '#3a7ddc'
                    }}
                    aria-label="Continue to next step"
                  >
                    <span style={{ animation: 'emotionTextFadeIn 0.4s ease-out' }}>
                      SELECT {selectedFromCurrentQuadrant.length}
                    </span>
                  </button>
                )
              } else {
                // Show back and skip buttons when no emotions are selected
                return (
                  <div style={{ display: 'flex', gap: '20px', alignItems: 'center' }}>
                    {/* Back Button */}
                    <button
                      onClick={() => setCurrentStep(1)}
                      style={{
                        backgroundColor: 'white',
                        border: '2px solid #3a7ddc',
                        borderRadius: '50%',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        width: '56px',
                        height: '56px',
                        boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                        transition: 'all 0.3s ease'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.backgroundColor = '#f8fafc'
                        e.currentTarget.style.borderColor = '#2e6bc7'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.backgroundColor = 'white'
                        e.currentTarget.style.borderColor = '#3a7ddc'
                      }}
                      aria-label="Go back to quadrants"
                    >
                      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
                        <polyline points="15,18 9,12 15,6"></polyline>
                      </svg>
                    </button>

                    {/* Skip Button */}
                    <button
                      onClick={() => navigate('/checkin/flow/wellbeing')}
                      style={{
                        backgroundColor: 'white',
                        border: '2px solid #3a7ddc',
                        borderRadius: '50%',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        width: '56px',
                        height: '56px',
                        boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                        transition: 'all 0.3s ease'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.backgroundColor = '#f8fafc'
                        e.currentTarget.style.borderColor = '#2e6bc7'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.backgroundColor = 'white'
                        e.currentTarget.style.borderColor = '#3a7ddc'
                      }}
                      aria-label="Skip to wellbeing"
                    >
                      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
                        <polyline points="9,18 15,12 9,6"></polyline>
                      </svg>
                    </button>
                  </div>
                )
              }
            })()}
          </div>
        </div>
      )}

      {/* Step 3: Voice/Text Input (Optional) */}
      {currentStep === 3 && (
        <div className="flex flex-col items-center p-4 justify-center min-h-[400px] pb-32">
          {/* Selected Emotions Display */}
          {selectedEmotions.length > 0 && (
            <div className="mb-8">
              <div className="flex flex-wrap justify-center gap-2" style={{ maxWidth: '400px' }}>
                {selectedEmotions.map((emotion, index) => {
                  // Find the emotion string and quadrant for styling
                  let emotionString = ''
                  let quadrant = ''

                  Object.entries(emotions).forEach(([key, data]) => {
                    const found = data.emotions.flat().find(e => {
                      const label = e.split(' ').slice(1).join(' ')
                      return label === emotion
                    })
                    if (found) {
                      emotionString = found
                      quadrant = key
                    }
                  })

                  const [emoji] = emotionString.split(' ')
                  const backgroundColor = quadrant === 'red' ? '#f7e9ee' :
                                        quadrant === 'yellow' ? '#f7e9db' :
                                        quadrant === 'blue' ? '#ecf3f4' :
                                        quadrant === 'green' ? '#f5f8f6' : '#f9f9f9'
                  const borderColor = quadrant === 'red' ? '#d78fab' :
                                    quadrant === 'yellow' ? '#d7914c' :
                                    quadrant === 'blue' ? '#9fc4c7' :
                                    quadrant === 'green' ? '#ceddd1' : '#ccc'

                  return (
                    <div
                      key={index}
                      className="flex flex-col items-center justify-center gap-1"
                      style={{
                        width: '80px',
                        height: '80px',
                        padding: '8px',
                        backgroundColor,
                        border: `2px solid ${borderColor}`,
                        borderRadius: '4px',
                        boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                      }}
                    >
                      <span className="text-2xl">{emoji}</span>
                      <span className="text-xs font-medium text-center" style={{ lineHeight: '1.1' }}>{emotion}</span>
                    </div>
                  )
                })}
              </div>
            </div>
          )}

          <div style={{ width: '100%', maxWidth: '384px', margin: '0 auto' }}>
            <div className="relative">
              <textarea
                value={emotionStory}
                onChange={(e) => updateStory(e.target.value.slice(0, 500))}
                placeholder="Note down your thoughts (optional)"
                className="w-full pr-14 border rounded-lg h-32 resize-none emotion-textarea"
                style={{ paddingTop: '3rem', paddingBottom: '3rem', paddingLeft: '0.75rem', paddingRight: '3.5rem', lineHeight: '1.5' }}
                maxLength={500}
                onFocus={(e) => {
                  if (window.innerWidth <= 768) {
                    setTimeout(() => {
                      e.target.scrollIntoView({ behavior: 'smooth', block: 'center' })
                    }, 300)
                  }
                }}
              />
              <button
                onClick={handleMicrophoneClick}
                disabled={isListening}
                className={`absolute right-3 top-1/2 -translate-y-1/2 p-2 rounded-full transition-colors flex items-center justify-center ${
                  isListening ? 'bg-red-100 text-red-600' : 'bg-gray-100 hover:bg-gray-200 text-gray-600'
                }`}
                style={{ minWidth: '40px', minHeight: '40px' }}
              >
                {isListening ? (
                  <div className="w-4 h-4 bg-red-600 rounded-full animate-pulse" />
                ) : (
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M7 4a3 3 0 016 0v4a3 3 0 11-6 0V4zm4 10.93A7.001 7.001 0 0017 8a1 1 0 10-2 0A5 5 0 015 8a1 1 0 00-2 0 7.001 7.001 0 006 6.93V17H6a1 1 0 100 2h8a1 1 0 100-2h-3v-2.07z" clipRule="evenodd" />
                  </svg>
                )}
              </button>
            </div>
            <p className="text-xs text-gray-500 text-center mt-2">
              {emotionStory.length}/500 characters
            </p>
          </div>

          {/* Navigation Buttons - Fixed at bottom */}
          <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center items-center" style={{ zIndex: 1000, gap: '20px' }}>
            {/* Back Button */}
            <button
              onClick={() => setCurrentStep(1)}
              style={{
                backgroundColor: 'white',
                border: '2px solid #3a7ddc',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#f8fafc'
                e.currentTarget.style.borderColor = '#2e6bc7'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'white'
                e.currentTarget.style.borderColor = '#3a7ddc'
              }}
              aria-label="Go back to quadrants"
            >
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
                <polyline points="15,18 9,12 15,6"></polyline>
              </svg>
            </button>

            {/* Save Button */}
            <button
              key={`save-${buttonAnimationKey}`}
              onClick={() => {
                // Save the emotion story and return to quadrant page
                if (onPartialSave) {
                  const data = {
                    selected_emotions: selectedEmotions,
                    emotion_story: emotionStory,
                    step_completed: 3,
                    completed_at: new Date().toISOString(),
                    time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000)
                  }
                  onPartialSave(data)
                }
                setHasCompletedWhy(true) // Mark that "why" step is completed
                setCurrentStep(1) // Return to quadrant selection
              }}
              style={{
                width: '140px',
                height: '56px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                borderRadius: '28px',
                backgroundColor: 'white',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                border: '2px solid #3a7ddc',
                cursor: 'pointer',
                transition: 'background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease',
                color: '#3a7ddc',
                fontSize: '16px',
                fontWeight: '600',
                animation: 'emotionCircleExpand 0.4s ease-out'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#f8fafc'
                e.currentTarget.style.borderColor = '#2e6bc7'
                e.currentTarget.style.color = '#2e6bc7'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'white'
                e.currentTarget.style.borderColor = '#3a7ddc'
                e.currentTarget.style.color = '#3a7ddc'
              }}
              aria-label="Save and continue to wellbeing"
            >
              <span style={{ animation: 'emotionTextFadeIn 0.4s ease-out' }}>
                SAVE
              </span>
            </button>

            {/* Skip Button */}
            <button
              onClick={() => navigate('/checkin/flow/wellbeing')}
              style={{
                backgroundColor: 'white',
                border: '2px solid #3a7ddc',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#f8fafc'
                e.currentTarget.style.borderColor = '#2e6bc7'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'white'
                e.currentTarget.style.borderColor = '#3a7ddc'
              }}
              aria-label="Skip to wellbeing"
            >
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
                <polyline points="9,18 15,12 9,6"></polyline>
              </svg>
            </button>
          </div>
        </div>
      )}

      {/* Step 4: Talk to Someone? */}
      {currentStep === 4 && (
        <div className="flex flex-col items-center p-4 justify-center min-h-[400px]">
          <h2 className="text-2xl font-bold text-center mb-8 text-gray-800">
            Do you want to talk to someone?
          </h2>

          <div className="max-w-md mx-auto w-full space-y-4">
            <button
              onClick={() => {
                setTalkPreference('parent')
                setCurrentStep(5)
              }}
              className="w-full p-6 rounded-2xl bg-blue-100 hover:bg-blue-200 flex items-center justify-center gap-3 transition-colors touch-target"
              style={{
                minHeight: '80px', // SEND accessibility
                fontSize: '18px'
              }}
            >
              <span className="text-3xl">👨‍👩‍👧</span>
              <span className="text-lg font-medium">Talk to a Parent</span>
            </button>

            <button
              onClick={() => {
                setTalkPreference('teacher')
                setCurrentStep(5)
              }}
              className="w-full p-6 rounded-2xl bg-green-100 hover:bg-green-200 flex items-center justify-center gap-3 transition-colors touch-target"
              style={{
                minHeight: '80px', // SEND accessibility
                fontSize: '18px'
              }}
            >
              <span className="text-3xl">👩‍🏫</span>
              <span className="text-lg font-medium">Talk to a Teacher</span>
            </button>

            <button
              onClick={() => {
                setTalkPreference('none')
                setCurrentStep(5)
              }}
              className="w-full p-6 rounded-2xl bg-gray-100 hover:bg-gray-200 flex items-center justify-center gap-3 transition-colors touch-target"
              style={{
                minHeight: '80px', // SEND accessibility
                fontSize: '18px'
              }}
            >
              <span className="text-3xl">💭</span>
              <span className="text-lg font-medium">Not right now</span>
            </button>
          </div>

          {/* Navigation Buttons */}
          <div className="mt-8 pb-8 flex justify-center items-center gap-4 px-4">
            <button
              onClick={() => setCurrentStep(3)}
              className="px-6 py-3 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-xl font-medium transition-colors touch-target"
            >
              Back
            </button>
          </div>
        </div>
      )}

      {/* Step 5: Done */}
      {currentStep === 5 && (
        <div className="flex flex-col items-center justify-center p-4 min-h-[400px]">
          <div className="text-6xl mb-6">🌟</div>
          <h2 className="text-3xl font-bold text-gray-800 mb-4">Thank you!</h2>
          <p className="text-lg text-gray-600 text-center mb-8">
            You did a great job sharing your feelings
          </p>


          <button
            onClick={() => {
              if (onComplete) {
                const data: EmotionData = {
                  selected_emotions: selectedEmotions,
                  emotion_story: voiceText,
                  discussion_preference: talkPreference || '',
                  step_completed: 5,
                  completed_at: new Date().toISOString(),
                  time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000)
                }
                onComplete(data)
              }
            }}
            className="px-8 py-4 bg-green-500 hover:bg-green-600 text-white rounded-2xl font-semibold transition-colors"
          >
            DONE
          </button>
        </div>
      )}



      {/* Yellow swoosh section at bottom */}
      <div className="yellow-swoosh-mobile-hide">
        <YellowSwoosh />
      </div>
    </>
  )
}