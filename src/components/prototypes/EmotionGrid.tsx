import React, { useState } from 'react'

interface EmotionData {
  selected_emotions: string[]
  emotion_story: string
  step_completed: number
  completed_at: string
  time_to_complete_seconds: number
}

export function EmotionGrid() {
  const [currentStep, setCurrentStep] = useState(1)
  const [selectedEmotions, setSelectedEmotions] = useState<string[]>([])
  const [emotionStory, setEmotionStory] = useState('')
  const [finalData, setFinalData] = useState<EmotionData | null>(null)
  const [startTime] = useState(Date.now())

  const emotions = {
    happy: ['😊 Joyful', '🤗 Grateful', '😄 Excited', '😌 Content', '🥰 Loved', '😎 Confident', '🤩 Amazed', '😇 Peaceful', '🎉 Celebratory'],
    sad: ['😢 Sad', '😔 Disappointed', '😟 Worried', '😰 Anxious', '😭 Heartbroken', '😩 Frustrated', '😞 Lonely', '😣 Hurt', '😖 Stressed'],
    angry: ['😠 Angry', '😤 Annoyed', '🤬 Furious', '😡 Mad', '👿 Vengeful', '😾 Irritated', '🙄 Fed up', '😒 Bitter', '💢 Explosive'],
    other: ['😴 Tired', '🤔 Confused', '😐 Neutral', '😶 Speechless', '🤒 Sick', '😵 Overwhelmed', '🥱 Bored', '😳 Embarrassed', '🤯 Mind-blown']
  }

  const allEmotions = Object.values(emotions).flat()

  const toggleEmotion = (emotion: string) => {
    if (selectedEmotions.includes(emotion)) {
      setSelectedEmotions(selectedEmotions.filter(e => e !== emotion))
    } else if (selectedEmotions.length < 3) {
      setSelectedEmotions([...selectedEmotions, emotion])
    }
  }

  const handleNext = () => {
    const stepData = {
      step: currentStep,
      data: currentStep === 1 ? selectedEmotions : emotionStory,
      timestamp: new Date().toISOString()
    }
    console.log(`📝 EMOTION GRID - Step ${currentStep}:`, stepData)
    setCurrentStep(currentStep + 1)
  }

  const handleComplete = () => {
    const timeToComplete = Math.round((Date.now() - startTime) / 1000)

    const data: EmotionData = {
      selected_emotions: selectedEmotions,
      emotion_story: emotionStory,
      step_completed: 3,
      completed_at: new Date().toISOString(),
      time_to_complete_seconds: timeToComplete
    }

    console.log('🎯 EMOTION GRID COMPLETE DATA:', data)
    setFinalData(data)
    setCurrentStep(4)
  }

  const reset = () => {
    setCurrentStep(1)
    setSelectedEmotions([])
    setEmotionStory('')
    setFinalData(null)
  }

  return (
    <div className="p-6 bg-white rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-4">Emotion Grid Prototype</h2>

      {/* Progress indicator */}
      <div className="flex mb-6">
        {[1, 2, 3].map((step) => (
          <div
            key={step}
            className={`flex-1 h-2 mx-1 rounded-full ${
              currentStep > step ? 'bg-green-500' :
              currentStep === step ? 'bg-blue-500' : 'bg-gray-200'
            }`}
          />
        ))}
      </div>

      {/* Step 1: Select Emotions */}
      {currentStep === 1 && (
        <div>
          <h3 className="text-lg font-semibold mb-2">Step 1: Select up to 3 emotions</h3>
          <p className="text-gray-600 mb-4">
            Selected: {selectedEmotions.length}/3
          </p>

          <div className="grid grid-cols-3 gap-2 mb-6">
            {allEmotions.map((emotion) => (
              <button
                key={emotion}
                onClick={() => toggleEmotion(emotion)}
                disabled={!selectedEmotions.includes(emotion) && selectedEmotions.length >= 3}
                className={`
                  p-3 rounded-lg text-sm transition-all
                  ${selectedEmotions.includes(emotion)
                    ? 'bg-blue-500 text-white ring-2 ring-blue-300'
                    : 'bg-gray-100 hover:bg-gray-200 disabled:opacity-50 disabled:cursor-not-allowed'}
                `}
              >
                {emotion}
              </button>
            ))}
          </div>

          <button
            onClick={handleNext}
            disabled={selectedEmotions.length === 0}
            className="px-6 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Next →
          </button>
        </div>
      )}

      {/* Step 2: Write Story */}
      {currentStep === 2 && (
        <div>
          <h3 className="text-lg font-semibold mb-2">Step 2: Tell us more (optional)</h3>
          <p className="text-gray-600 mb-4">
            You selected: {selectedEmotions.join(', ')}
          </p>

          <textarea
            value={emotionStory}
            onChange={(e) => setEmotionStory(e.target.value.slice(0, 500))}
            placeholder="What made you feel this way? (optional)"
            className="w-full p-3 border rounded-lg h-32 resize-none"
            maxLength={500}
          />
          <p className="text-xs text-gray-500 mb-4">
            {emotionStory.length}/500 characters
          </p>

          <div className="flex gap-2">
            <button
              onClick={() => setCurrentStep(1)}
              className="px-6 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50"
            >
              ← Back
            </button>
            <button
              onClick={handleNext}
              className="px-6 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600"
            >
              Next →
            </button>
          </div>
        </div>
      )}

      {/* Step 3: Review */}
      {currentStep === 3 && (
        <div>
          <h3 className="text-lg font-semibold mb-4">Step 3: Review your response</h3>

          <div className="bg-gray-50 p-4 rounded-lg mb-4">
            <p className="font-medium mb-2">Selected Emotions:</p>
            <div className="flex flex-wrap gap-2 mb-4">
              {selectedEmotions.map((emotion) => (
                <span key={emotion} className="px-3 py-1 bg-blue-100 text-blue-700 rounded-full">
                  {emotion}
                </span>
              ))}
            </div>

            {emotionStory && (
              <>
                <p className="font-medium mb-2">Your Story:</p>
                <p className="text-gray-700 italic">"{emotionStory}"</p>
              </>
            )}
          </div>

          <div className="flex gap-2">
            <button
              onClick={() => setCurrentStep(2)}
              className="px-6 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50"
            >
              ← Back
            </button>
            <button
              onClick={handleComplete}
              className="px-6 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600"
            >
              Complete ✓
            </button>
          </div>
        </div>
      )}

      {/* Step 4: Show Data */}
      {currentStep === 4 && finalData && (
        <div>
          <h3 className="text-lg font-semibold mb-2">✅ Complete!</h3>
          <h4 className="font-medium mb-2">📊 Data Captured:</h4>
          <pre className="bg-gray-900 text-green-400 p-4 rounded-lg overflow-x-auto text-sm mb-4">
            {JSON.stringify(finalData, null, 2)}
          </pre>
          <p className="text-xs text-gray-500 mb-4">
            ✅ This data would be sent to: /api/emotion-grid
          </p>
          <button
            onClick={reset}
            className="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600"
          >
            Start Over
          </button>
        </div>
      )}
    </div>
  )
}