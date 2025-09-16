import React, { useState, useEffect } from 'react'

interface EmotionData {
  selected_emotions: string[]
  emotion_story: string
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
}

export function EmotionGrid({ onComplete, showNextButton = false, onSelectionMade, hideDebugInfo = false, triggerCompletion = false, initialData }: EmotionGridProps = {}) {
  const [currentStep, setCurrentStep] = useState(1)
  const [selectedEmotions, setSelectedEmotions] = useState<string[]>([])
  const [emotionStory, setEmotionStory] = useState('')
  const [finalData, setFinalData] = useState<EmotionData | null>(null)
  const [stepData, setStepData] = useState<any>(null)
  const [startTime] = useState(Date.now())
  const [isListening, setIsListening] = useState(false)

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
    happy: ['😊 Joyful', '🤗 Grateful', '😄 Excited', '😌 Content', '🥰 Loved', '😎 Confident', '🤩 Amazed', '😇 Peaceful', '🎉 Celebratory'],
    sad: ['😢 Sad', '😔 Disappointed', '😟 Worried', '😰 Anxious', '😭 Heartbroken', '😩 Frustrated', '😞 Lonely', '😣 Hurt', '😖 Stressed'],
    angry: ['😠 Angry', '😤 Annoyed', '🤬 Furious', '😡 Mad', '👿 Vengeful', '😾 Irritated', '🙄 Fed up', '😒 Bitter', '💢 Explosive'],
    other: ['😴 Tired', '🤔 Confused', '😐 Neutral', '😶 Speechless', '🤒 Sick', '😵 Overwhelmed', '🥱 Bored', '😳 Embarrassed', '🤯 Mind-blown']
  }

  const allEmotions = Object.values(emotions).flat()

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

    // Auto-advance to step 2 when emotions are selected, go back to step 1 if none selected
    if (newEmotions.length > 0) {
      setCurrentStep(2)
    } else {
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
    // Complete the grid since step 2 text is optional
    handleComplete()
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
      {/* Centered title like breathing exercise */}
      <div className="text-center" style={{ marginTop: '40px', marginBottom: '1rem' }}>
        <h1 className="text-gray-900 mb-2" style={{ fontSize: '40px', fontWeight: 600, letterSpacing: '0.02em' }}>What emotions are you feeling?</h1>
      </div>


      {/* Step 1: Select Emotions - Always visible */}
      {(currentStep === 1 || currentStep === 2 || currentStep === 4) && (
        <div className="max-w-4xl mx-auto px-4">
          <div className="text-center mb-6">
            <h3 className="text-lg font-semibold mb-2">Select up to 3 emotions</h3>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
            {Object.entries(emotions).map(([category, categoryEmotions]) => (
              <div key={category} className="space-y-3">
                <h4 className="text-lg font-semibold text-gray-800 capitalize text-center">
                  {category}
                </h4>
                <div className="grid grid-cols-3 gap-2">
                  {categoryEmotions.map((emotion) => (
                    <button
                      key={emotion}
                      onClick={() => toggleEmotion(emotion)}
                      disabled={!selectedEmotions.includes(emotion) && selectedEmotions.length >= 3}
                      className={`
                        p-3 rounded-lg text-xs transition-all
                        ${selectedEmotions.includes(emotion)
                          ? 'text-white ring-2'
                          : 'bg-gray-100 hover:bg-gray-200 disabled:opacity-50 disabled:cursor-not-allowed'}
                      `}
                      style={{
                        backgroundColor: selectedEmotions.includes(emotion) ? '#3a7ddc' : undefined,
                        boxShadow: selectedEmotions.includes(emotion) ? `0 0 0 2px rgba(58, 125, 220, 0.3)` : undefined
                      }}
                    >
                      {emotion}
                    </button>
                  ))}
                </div>
              </div>
            ))}
          </div>

          {/* Data Captured for Step 1 */}
          {!hideDebugInfo && stepData && stepData.step === 1 && (
            <div className="mt-6">
              <h3 className="text-sm font-semibold mb-2">📊 Data Captured:</h3>
              <pre className="bg-gray-900 text-white p-3 rounded-lg overflow-x-auto text-xs">
                {JSON.stringify(stepData, null, 2)}
              </pre>
            </div>
          )}
        </div>
      )}

      {/* Step 2: Write Story - Show when emotions selected */}
      {currentStep === 2 && selectedEmotions.length > 0 && (
        <div className="max-w-4xl mx-auto px-4">
          <div className="text-center mb-6">
            <h3 className="text-lg font-semibold mb-2">Tell us more (optional)</h3>
          </div>

          <div className="w-full">
            <div className="relative">
              <textarea
                value={emotionStory}
                onChange={(e) => updateStory(e.target.value.slice(0, 500))}
                placeholder="What made you feel this way? (optional)"
                className="w-full p-3 border rounded-lg h-32 resize-none"
                maxLength={500}
              />
              <button
                onClick={handleMicrophoneClick}
                className={`absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 rounded-full transition-colors ${
                  isListening ? 'bg-red-500 text-white' : 'bg-gray-100 hover:bg-gray-200 text-gray-600'
                }`}
                style={{
                  width: '56px',
                  height: '56px',
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

      {/* Fixed bottom button */}
      {showNextButton && selectedEmotions.length > 0 && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center z-1000">
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
        <div className="max-w-4xl mx-auto px-4 text-center">
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
    </>
  )
}