import React, { useState, useEffect, useRef } from 'react'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import { ChevronLeft, ChevronRight } from 'lucide-react'

interface EmotionData {
  selected_emotions: string[]
  emotion_story: string
  discussion_preference: string
  step_completed: number
  completed_at: string
  time_to_complete_seconds: number
}

interface EmotionGridProps {
  onComplete?: (data: EmotionData) => void
  showNextButton?: boolean
  onSelectionMade?: () => void
  hideDebugInfo?: boolean
  triggerCompletion?: boolean
  initialData?: any
  onStepChange?: (step: number) => void
}

export function EmotionGrid({ onComplete, showNextButton = false, onSelectionMade, hideDebugInfo = false, triggerCompletion = false, initialData, onStepChange }: EmotionGridProps = {}) {
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

  // Initialize with existing data if available
  useEffect(() => {
    if (initialData && selectedEmotions.length === 0) {
      if (initialData.selected_emotions) {
        setSelectedEmotions(initialData.selected_emotions)
        setCurrentStep(2)
        onSelectionMade?.()
      }
      if (initialData.emotion_story) {
        setEmotionStory(initialData.emotion_story)
      }
    }
  }, [initialData, onSelectionMade])

  // Handle external trigger for completion
  useEffect(() => {
    if (triggerCompletion && selectedEmotions.length > 0) {
      handleComplete()
    }
  }, [triggerCompletion])

  const emotions = {
    'Upset': ['😠 Angry', '😤 Frustrated', '😰 Worried', '😬 Anxious', '🤯 Overwhelmed', '😱 Panicked', '😣 Stressed', '😒 Irritated', '😫 Restless'],
    'Down': ['😢 Sad', '😴 Tired', '😔 Lonely', '😑 Bored', '😞 Disappointed', '😕 Confused', '😪 Hurt', '😟 Discouraged', '😰 Hopeless'],
    'Joyful': ['😄 Happy', '🤩 Excited', '😊 Proud', '😎 Confident', '🤸 Energetic', '😜 Playful', '🧐 Curious', '😯 Amazed', '🥰 Grateful'],
    'Cool': ['😌 Calm', '😊 Content', '😎 Relaxed', '🕊️ Peaceful', '🤗 Cozy', '🥰 Loved', '😌 Safe', '😴 Sleepy', '🤔 Thoughtful']
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
    } else if (selectedEmotions.length < 3) {
      newEmotions = [...selectedEmotions, emotion]
    } else {
      return
    }
    setSelectedEmotions(newEmotions)

    // Notify parent of selection (any selection makes chevron active)
    if (newEmotions.length > 0) {
      onSelectionMade?.()
    }

    // Stay on step 1 until user clicks next
    if (newEmotions.length === 0) {
      setCurrentStep(1)
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
    const data = {
      step: 2,
      selected_emotions: selectedEmotions,
      emotion_story: story,
      timestamp: new Date().toISOString()
    }
    setStepData(data)
    console.log('🎯 EMOTION GRID STEP 2 DATA:', data)
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
        @media (max-width: 768px) {
          .emotion-title-mobile {
            font-size: 28px !important;
            line-height: 1.2 !important;
            margin-top: -20px !important;
          }
        }
      `}</style>

      {/* Centered title like breathing exercise */}
      <div className="text-center" style={{ marginBottom: '0.5rem' }}>
        <h1 className="emotion-title-mobile text-gray-900 mb-1" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>What emotions are you feeling?</h1>
        {currentStep === 1 && (
          <p className="text-gray-600 mb-4" style={{ fontSize: '14px', fontWeight: 'normal' }}>Select up to 3</p>
        )}
      </div>

      {/* Step 1: Select Emotions */}
      {currentStep === 1 && (
        <div style={{ paddingBottom: '150px' }}>

          <div className="relative">
            <style>{`
              @media (min-width: 1280px) {
                .emotion-categories {
                  justify-content: center !important;
                  min-width: auto !important;
                }
                .slider-nav {
                  display: none !important;
                }
              }
            `}</style>

            {/* Left chevron */}
            <button
              onClick={handlePrevSlide}
              className="slider-nav absolute left-2 top-1/2 -translate-y-1/2 z-10 w-10 h-10 bg-white rounded-full shadow-lg flex items-center justify-center hover:bg-gray-50"
              disabled={currentSlide === 0}
              style={{ opacity: currentSlide === 0 ? 0.5 : 1 }}
            >
              <ChevronLeft className="w-6 h-6 text-gray-600" />
            </button>

            {/* Right chevron */}
            <button
              onClick={handleNextSlide}
              className="slider-nav absolute right-2 top-1/2 -translate-y-1/2 z-10 w-10 h-10 bg-white rounded-full shadow-lg flex items-center justify-center hover:bg-gray-50"
              disabled={currentSlide === totalSlides - 1}
              style={{ opacity: currentSlide === totalSlides - 1 ? 0.5 : 1 }}
            >
              <ChevronRight className="w-6 h-6 text-gray-600" />
            </button>

            <div
              ref={scrollContainerRef}
              className="overflow-x-auto pb-4"
              style={{
                scrollbarWidth: 'thin',
                scrollbarColor: '#cbd5e1 #f1f5f9'
              }}
            >
              <div className="flex emotion-categories" style={{
                paddingLeft: '20px',
                paddingRight: '20px',
                minWidth: '1360px'
              }}>
              {Object.entries(emotions).flatMap(([category, categoryEmotions], index) => {
              // Define category colors
              const getCategoryColor = (category: string) => {
                switch (category) {
                  case 'Upset': return { bg: 'rgba(254, 243, 226, 1.0)', border: 'rgba(251, 191, 36, 0.4)' } // Orange - stronger border
                  case 'Down': return { bg: 'rgba(230, 242, 255, 1.0)', border: 'rgba(59, 130, 246, 0.4)' } // Blue - stronger border
                  case 'Joyful': return { bg: 'rgba(255, 251, 235, 1.0)', border: 'rgba(245, 158, 11, 0.4)' } // Yellow - stronger border
                  case 'Cool': return { bg: 'rgba(240, 253, 244, 1.0)', border: 'rgba(34, 197, 94, 0.4)' } // Green - stronger border
                  default: return { bg: '#f3f4f6', border: 'rgba(156, 163, 175, 0.4)' }
                }
              }

              const categoryColors = getCategoryColor(category)
              const isLast = index === Object.entries(emotions).length - 1

              const elements = []

              // Group div
              elements.push(
                <div key={`group-${index}`} className="flex-none space-y-3" style={{
                  width: '290px',
                  minWidth: '290px'
                }}>
                  <div className="text-center">
                    <h4 className="text-lg font-semibold text-gray-800">
                      {category}
                    </h4>
                  </div>
                  <div style={{
                    display: 'grid',
                    gridTemplateColumns: 'repeat(3, 90px)',
                    gap: '10px',
                    width: '290px'
                  }}>
                    {categoryEmotions.map((emotion) => (
                      <button
                        key={emotion}
                        onClick={() => toggleEmotion(emotion)}
                        disabled={!selectedEmotions.includes(emotion) && selectedEmotions.length >= 3}
                        className="flex flex-col items-center gap-2 p-3 text-xs transition-all disabled:opacity-50 disabled:cursor-not-allowed"
                        style={{
                          borderRadius: '4px',
                          backgroundColor: selectedEmotions.includes(emotion) ? 'white' : categoryColors.bg,
                          border: selectedEmotions.includes(emotion) ? 'none' : `1px solid ${categoryColors.border}`,
                          boxShadow: selectedEmotions.includes(emotion)
                            ? 'inset 0 0 0 2px #3a7ddc, 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                            : 'none',
                          color: selectedEmotions.includes(emotion) ? '#3a7ddc' : '#1f2937',
                          fontWeight: '600',
                          boxSizing: 'border-box'
                        }}
                      >
                        {/* Emoticon */}
                        <div style={{
                          width: '40px',
                          height: '40px',
                          backgroundColor: selectedEmotions.includes(emotion) ? 'rgba(58, 125, 220, 0.1)' : 'white',
                          borderRadius: '50%',
                          border: selectedEmotions.includes(emotion) ? 'none' : `1px solid ${categoryColors.border}`,
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center',
                          fontSize: '20px',
                          boxSizing: 'border-box'
                        }}>
                          {emotion.split(' ')[0]}
                        </div>

                        {/* Text */}
                        <div className="text-center">
                          <span style={{ fontSize: '10px', fontWeight: 'inherit' }}>
                            {emotion.split(' ').slice(1).join(' ')}
                          </span>
                        </div>
                      </button>
                    ))}
                  </div>
                </div>
              )

              // Add separators if not last group
              if (!isLast) {
                // 1px dashed line div with 20px margins on both sides
                elements.push(
                  <div key={`line-${index}`} style={{
                    width: '1px',
                    height: '270px',
                    borderLeft: '1px dashed #d1d5db',
                    flexShrink: 0,
                    marginTop: '37px',
                    marginLeft: '20px',
                    marginRight: '20px'
                  }} />
                )
              }

              return elements
            })}
              </div>
            </div>

            {/* Slider dots */}
            <div className="slider-nav flex justify-center mt-4 gap-2">
              {Array.from({ length: totalSlides }).map((_, index) => (
                <button
                  key={index}
                  onClick={() => scrollToSlide(index)}
                  className="w-2 h-2 rounded-full transition-colors"
                  style={{
                    backgroundColor: index === currentSlide ? '#3a7ddc' : '#cbd5e1'
                  }}
                />
              ))}
            </div>
          </div>

          {/* Data Captured for Step 1 */}
          {!hideDebugInfo && stepData && stepData.step === 1 && (
            <div className="mt-6 max-w-4xl mx-auto px-4">
              <h3 className="text-sm font-semibold mb-2">📊 Data Captured:</h3>
              <pre className="bg-gray-900 text-white p-3 rounded-lg overflow-x-auto text-xs">
                {JSON.stringify(stepData, null, 2)}
              </pre>
            </div>
          )}
        </div>
      )}

      {/* Step 2: Selected Emotions Review + Form */}
      {currentStep === 2 && selectedEmotions.length > 0 && (
        <div className="max-w-4xl mx-auto px-4" style={{ paddingBottom: '150px' }}>
          {/* Show selected emotions - tappable to edit */}
          <div className="text-center mb-8">
            <div className="flex flex-wrap justify-center gap-2 mb-8">
              {selectedEmotions.map((emotion) => (
                <button
                  key={emotion}
                  onClick={() => {
                    setCurrentStep(1)
                    onStepChange?.(1)
                  }}
                  className="flex flex-col items-center gap-2 p-3 text-xs transition-all cursor-pointer"
                  style={{
                    borderRadius: '4px',
                    backgroundColor: 'white',
                    border: '2px solid #3a7ddc',
                    boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                    color: '#3a7ddc',
                    fontWeight: '600',
                    minWidth: '90px',
                    width: '90px'
                  }}
                >
                  {/* Emoticon */}
                  <div style={{
                    width: '40px',
                    height: '40px',
                    backgroundColor: 'rgba(58, 125, 220, 0.1)',
                    borderRadius: '50%',
                    border: 'none',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontSize: '20px',
                    boxSizing: 'border-box'
                  }}>
                    {emotion.split(' ')[0]}
                  </div>

                  {/* Text */}
                  <div className="text-center">
                    <span style={{ fontSize: '10px', fontWeight: 'inherit' }}>
                      {emotion.split(' ').slice(1).join(' ')}
                    </span>
                  </div>
                </button>
              ))}
            </div>
          </div>

          <div className="text-center mb-6">
            <h3 className="text-lg font-semibold mb-2">Tell us more (optional)</h3>
          </div>

          <div className="w-full">
            <div className="relative">
              <textarea
                value={emotionStory}
                onChange={(e) => updateStory(e.target.value.slice(0, 500))}
                placeholder="What made you feel this way?"
                className="w-full pr-14 border rounded-lg h-32 resize-none"
                style={{ paddingTop: '3rem', paddingBottom: '3rem', paddingLeft: '0.75rem', paddingRight: '3.5rem', lineHeight: '1.5' }}
                maxLength={500}
              />
              <button
                onClick={handleMicrophoneClick}
                className={`absolute top-1/2 right-3 transform -translate-y-1/2 rounded-full transition-colors ${
                  isListening ? 'bg-red-500 text-white' : 'bg-gray-100 hover:bg-gray-200 text-gray-600'
                }`}
                style={{
                  width: '40px',
                  height: '40px',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center'
                }}
                title="Voice input"
                type="button"
              >
                {isListening ? (
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
                    <rect x="6" y="4" width="12" height="16" rx="2"/>
                  </svg>
                ) : (
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M12 2a3 3 0 0 0-3 3v6a3 3 0 0 0 6 0V5a3 3 0 0 0-3-3Z"/>
                    <path d="M19 10v1a7 7 0 0 1-14 0v-1"/>
                    <line x1="12" y1="19" x2="12" y2="23"/>
                    <line x1="8" y1="23" x2="16" y2="23"/>
                  </svg>
                )}
              </button>
            </div>
            <p className="text-xs text-gray-500 mb-4 text-center">
              {emotionStory.length}/500 characters
            </p>
          </div>

          {/* Discussion Question */}
          <div className="w-full max-w-2xl mx-auto mt-8">
            <div className="text-center mb-6">
              <h3 className="text-lg font-semibold">Do you want to discuss this with anyone?</h3>
            </div>

            <div className="flex justify-center gap-3 flex-wrap">
              {['I\'m good', 'Parent', 'Teacher'].map((option) => (
                <button
                  key={option}
                  onClick={() => setDiscussionPreference(discussionPreference === option ? '' : option)}
                  className="px-4 py-3 font-medium transition-all duration-200 flex items-center gap-2"
                  style={{
                    backgroundColor: discussionPreference === option ? 'white' : 'rgba(58, 125, 220, 0.1)',
                    color: '#3a7ddc',
                    border: 'none',
                    borderRadius: '20px',
                    boxShadow: discussionPreference === option
                      ? 'inset 0 0 0 2px #3a7ddc, 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                      : 'none',
                    boxSizing: 'border-box'
                  }}
                >
                  <div
                    className="w-4 h-4 rounded-full border-2 flex items-center justify-center"
                    style={{
                      borderColor: '#3a7ddc',
                      backgroundColor: 'white'
                    }}
                  >
                    {discussionPreference === option && (
                      <div
                        className="w-2 h-2 rounded-full"
                        style={{ backgroundColor: '#3a7ddc' }}
                      />
                    )}
                  </div>
                  {option}
                </button>
              ))}
            </div>
          </div>

          {/* Data Captured for Step 2 */}
          {!hideDebugInfo && stepData && stepData.step === 2 && (
            <div className="mt-6 max-w-2xl mx-auto">
              <h3 className="text-sm font-semibold mb-2">📊 Data Captured:</h3>
              <pre className="bg-gray-900 text-white p-3 rounded-lg overflow-x-auto text-xs">
                {JSON.stringify(stepData, null, 2)}
              </pre>
            </div>
          )}
        </div>
      )}

      {/* Fixed bottom button - Step 1 */}
      {showNextButton && selectedEmotions.length > 0 && currentStep === 1 && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center" style={{ zIndex: 1000 }}>
          <button
            onClick={handleNext}
            style={{
              width: '56px',
              height: '56px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              borderRadius: '50%',
              backgroundColor: '#3a7ddc',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
              border: 'none',
              cursor: 'pointer',
              transition: 'all 0.3s ease',
              color: 'white'
            }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
            aria-label="Next"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <polyline points="9,18 15,12 9,6"></polyline>
            </svg>
          </button>
        </div>
      )}

      {/* Fixed bottom button - Step 2 */}
      {showNextButton && currentStep === 2 && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center" style={{ zIndex: 1000 }}>
          <button
            onClick={handleNext}
            style={{
              width: '56px',
              height: '56px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              borderRadius: '50%',
              backgroundColor: '#3a7ddc',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
              border: 'none',
              cursor: 'pointer',
              transition: 'all 0.3s ease',
              color: 'white'
            }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
            aria-label="Next"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <polyline points="9,18 15,12 9,6"></polyline>
            </svg>
          </button>
        </div>
      )}

      {/* Step 4: Show Data */}
      {currentStep === 4 && (
        <div className="max-w-4xl mx-auto px-4 text-center" style={{ paddingBottom: '150px' }}>
          <h3 className="text-lg font-semibold mb-2">✅ Complete!</h3>

          {!hideDebugInfo && finalData && (
            <div className="max-w-2xl mx-auto">
              <h4 className="font-medium mb-2">📊 Data Captured:</h4>
              <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-sm mb-4">
                {JSON.stringify(finalData, null, 2)}
              </pre>
              <p className="text-xs text-gray-500 mb-4">
                ✅ This data would be sent to: /api/emotion-grid
              </p>
            </div>
          )}

          {!showNextButton && (
            <button
              onClick={reset}
              className="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600"
            >
              Start Over
            </button>
          )}
        </div>
      )}

      {/* Yellow swoosh section at bottom */}
      <YellowSwoosh />
    </>
  )
}