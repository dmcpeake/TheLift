import { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'

// 36 emotions in 4 categories as specified
const EMOTION_DATA = {
  'high-energy-uncomfortable': [
    { name: 'Angry', emoji: '😠' },
    { name: 'Disgusted', emoji: '🤢' },
    { name: 'Embarrassed', emoji: '😳' },
    { name: 'Hurt', emoji: '😢' },
    { name: 'Jealous', emoji: '😒' },
    { name: 'Overwhelmed', emoji: '😰' },
    { name: 'Terrified', emoji: '😱' },
    { name: 'Shocked', emoji: '😲' },
    { name: 'Worried', emoji: '😟' }
  ],
  'low-energy-uncomfortable': [
    { name: 'Bored', emoji: '😑' },
    { name: 'Confused', emoji: '😕' },
    { name: 'Disappointed', emoji: '😞' },
    { name: 'Guilty', emoji: '😔' },
    { name: 'Hopeless', emoji: '😣' },
    { name: 'Lonely', emoji: '😢' },
    { name: 'Lost', emoji: '🫤' },
    { name: 'Resentful', emoji: '😤' },
    { name: 'Sad', emoji: '😢' }
  ],
  'high-energy-comfortable': [
    { name: 'Amazed', emoji: '🤩' },
    { name: 'Amused', emoji: '😄' },
    { name: 'Confident', emoji: '😎' },
    { name: 'Courageous', emoji: '💪' },
    { name: 'Excited', emoji: '🎉' },
    { name: 'Happy', emoji: '😊' },
    { name: 'Pleased', emoji: '😌' },
    { name: 'Motivated', emoji: '🔥' },
    { name: 'Proud', emoji: '🥰' }
  ],
  'low-energy-comfortable': [
    { name: 'Accepted', emoji: '🤗' },
    { name: 'Calm', emoji: '😌' },
    { name: 'Content', emoji: '☺️' },
    { name: 'Curious', emoji: '🤔' },
    { name: 'Hopeful', emoji: '🙏' },
    { name: 'Loved', emoji: '❤️' },
    { name: 'Relieved', emoji: '😮‍💨' },
    { name: 'Safe', emoji: '🛡️' },
    { name: 'Thankful', emoji: '🙏' }
  ]
}

const categoryLabels = {
  'high-energy-uncomfortable': { label: 'High Energy - Uncomfortable', color: 'bg-red-100 border-red-300' },
  'low-energy-uncomfortable': { label: 'Low Energy - Uncomfortable', color: 'bg-orange-100 border-orange-300' },
  'high-energy-comfortable': { label: 'High Energy - Comfortable', color: 'bg-green-100 border-green-300' },
  'low-energy-comfortable': { label: 'Low Energy - Comfortable', color: 'bg-blue-100 border-blue-300' }
}

interface SelectedEmotion {
  id: string
  name: string
  emoji: string
  category: string
}

export default function EmotionGridFullPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  
  // 3-step process state
  const [currentStep, setCurrentStep] = useState<1 | 2 | 3>(1)
  const [selectedEmotions, setSelectedEmotions] = useState<SelectedEmotion[]>([])
  const [storyText, setStoryText] = useState('')
  const [isRecording, setIsRecording] = useState(false)
  
  const childId = user?.id || 'demo_child'

  // Step 1: Emotion Selection
  const handleEmotionSelect = (emotion: SelectedEmotion) => {
    if (selectedEmotions.find(e => e.id === emotion.id)) {
      setSelectedEmotions(prev => prev.filter(e => e.id !== emotion.id))
    } else if (selectedEmotions.length < 3) {
      setSelectedEmotions(prev => [...prev, emotion])
    }
  }

  const handleStep1Continue = () => {
    if (selectedEmotions.length === 0) {
      alert('Please select at least one emotion')
      return
    }
    setCurrentStep(2)
  }

  // Step 2: Story Input
  const handleStep2Continue = () => {
    if (storyText.trim().length === 0) {
      alert('Please share your story')
      return
    }
    setCurrentStep(3)
  }

  const toggleRecording = () => {
    setIsRecording(!isRecording)
    if (!isRecording) {
      // Mock speech-to-text - in real implementation would use Web Speech API
      setStoryText(prev => prev + ' [Voice recording started...]')
      
      // Simulate realistic speech recognition after 4 seconds
      setTimeout(() => {
        const mockResponses = [
          ' Today was really challenging because I had an argument with my best friend during lunch.',
          ' I felt overwhelmed when the teacher announced we have three tests next week.',
          ' My little brother broke my favorite toy and I got really upset about it.',
          ' I was so excited when I found out I made the school soccer team!',
          ' I felt lonely during recess because my friends were playing a game I don\'t understand.'
        ]
        const randomResponse = mockResponses[Math.floor(Math.random() * mockResponses.length)]
        setStoryText(prev => prev.replace(' [Voice recording started...]', randomResponse))
        setIsRecording(false)
      }, 4000)
    } else {
      setStoryText(prev => prev.replace(' [Voice recording started...]', ' [Recording stopped]'))
    }
  }

  // Step 3: Summary & Save
  const handleComplete = async () => {
    try {
      const supabase = getSupabaseClient()
      
      // Step 1: Save to emotion_grid_usage table
      const { data: usageData, error: usageError } = await supabase
        .from('emotion_grid_usage')
        .insert({
          child_id: childId,
          session_id: null, // Would be actual session ID in real implementation
          story_text: storyText,
          completed_at: new Date().toISOString()
        })
        .select()
        .single()
      
      if (usageError) throw usageError
      
      // Step 2: Save to emotion_grid_feelings table
      const feelingsData = selectedEmotions.map(emotion => ({
        usage_id: usageData.id,
        feeling_id: emotion.id,
        feeling_name: emotion.name,
        category: emotion.category
      }))
      
      const { error: feelingsError } = await supabase
        .from('emotion_grid_feelings')
        .insert(feelingsData)
      
      if (feelingsError) throw feelingsError
      
      console.log('Successfully saved emotion grid to database')
      alert('Emotion Grid completed and saved!')
      navigate('/child/check-in?from=emotion-grid&completed=true')
      
    } catch (err) {
      console.error('Database error:', err)
      alert('Failed to save emotion data. Please try again.')
    }
  }

  const renderStep1 = () => (
    <div className="space-y-6">
      <div className="text-center">
        <h2 className="text-2xl font-bold mb-2">How are you feeling?</h2>
        <p className="text-gray-600 mb-4">Select up to 3 emotions that describe how you feel right now</p>
        <div className="inline-block px-4 py-2 bg-blue-100 rounded-lg">
          <span className="font-medium text-blue-800">
            {selectedEmotions.length}/3 emotions selected
          </span>
        </div>
      </div>

      <div className="space-y-6">
        {Object.entries(EMOTION_DATA).map(([category, emotions]) => (
          <div key={category} className="space-y-3">
            <h3 className={`text-sm font-medium px-3 py-2 rounded-lg border inline-block ${categoryLabels[category as keyof typeof categoryLabels].color}`}>
              {categoryLabels[category as keyof typeof categoryLabels].label}
            </h3>
            <div className="grid grid-cols-3 gap-3">
              {emotions.map((emotion) => {
                const emotionId = `${category}-${emotion.name}`
                const isSelected = selectedEmotions.find(e => e.id === emotionId)
                const isDisabled = !isSelected && selectedEmotions.length >= 3
                
                return (
                  <button
                    key={emotionId}
                    onClick={() => handleEmotionSelect({
                      id: emotionId,
                      name: emotion.name,
                      emoji: emotion.emoji,
                      category
                    })}
                    disabled={isDisabled}
                    className={`flex items-center gap-3 p-3 rounded-lg border-2 transition-all ${
                      isSelected 
                        ? "bg-blue-100 border-blue-400 ring-2 ring-blue-400 scale-105" 
                        : "bg-white border-gray-200 hover:bg-gray-50 hover:border-gray-300"
                    } ${isDisabled ? "opacity-50 cursor-not-allowed" : "cursor-pointer"}`}
                  >
                    <span className="text-2xl">{emotion.emoji}</span>
                    <span className="text-sm font-medium">{emotion.name}</span>
                  </button>
                )
              })}
            </div>
          </div>
        ))}
      </div>

      <div className="flex justify-between items-center pt-4">
        <div className="text-sm text-gray-600">
          Selected: {selectedEmotions.map(e => e.emoji).join(' ')}
        </div>
        <button 
          onClick={handleStep1Continue}
          disabled={selectedEmotions.length === 0}
          className="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 disabled:bg-gray-300 transition-colors"
        >
          Continue →
        </button>
      </div>
    </div>
  )

  const renderStep2 = () => (
    <div className="space-y-6">
      <div className="text-center">
        <h2 className="text-2xl font-bold mb-2">Tell Your Story</h2>
        <p className="text-gray-600 mb-4">
          You're feeling: {selectedEmotions.map(e => `${e.emoji} ${e.name}`).join(', ')}
        </p>
        <p className="text-gray-600">
          What's happening that makes you feel this way?
        </p>
      </div>

      <div className="space-y-4">
        <textarea
          value={storyText}
          onChange={(e) => setStoryText(e.target.value.slice(0, 500))}
          placeholder="Share your story here... What happened? How did it make you feel?"
          className="w-full h-40 p-4 border-2 border-gray-200 rounded-lg resize-none focus:border-purple-400 focus:outline-none"
          maxLength={500}
        />
        
        <div className="flex justify-between items-center">
          <div className="flex items-center gap-3">
            <button
              onClick={toggleRecording}
              className={`flex items-center gap-2 px-4 py-2 rounded-lg border transition-colors ${
                isRecording 
                  ? "bg-red-50 border-red-300 text-red-700" 
                  : "bg-gray-50 border-gray-300 text-gray-700 hover:bg-gray-100"
              }`}
            >
              {isRecording ? '🎤' : '🎙️'}
              {isRecording ? 'Stop Recording' : 'Voice Input'}
            </button>
            {isRecording && (
              <span className="text-sm text-red-600 animate-pulse">● Recording...</span>
            )}
          </div>
          <span className="text-sm text-gray-500">
            {storyText.length}/500 characters
          </span>
        </div>
      </div>

      <div className="flex justify-between">
        <button 
          onClick={() => setCurrentStep(1)}
          className="bg-gray-300 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-400 transition-colors"
        >
          ← Back
        </button>
        <button 
          onClick={handleStep2Continue}
          disabled={storyText.trim().length === 0}
          className="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 disabled:bg-gray-300 transition-colors"
        >
          Continue →
        </button>
      </div>
    </div>
  )

  const renderStep3 = () => (
    <div className="space-y-6">
      <div className="text-center">
        <h2 className="text-2xl font-bold mb-4">Your Emotion Check-In Summary</h2>
      </div>

      <div className="space-y-4">
        <div className="p-6 bg-blue-50 rounded-lg">
          <h3 className="font-semibold mb-3">You're feeling:</h3>
          <div className="flex flex-wrap gap-2">
            {selectedEmotions.map(emotion => (
              <div
                key={emotion.id}
                className="flex items-center gap-2 px-4 py-2 bg-white rounded-full border shadow-sm"
              >
                <span className="text-lg">{emotion.emoji}</span>
                <span className="text-sm font-medium">{emotion.name}</span>
              </div>
            ))}
          </div>
        </div>

        <div className="p-6 bg-gray-50 rounded-lg">
          <h3 className="font-semibold mb-3">Your story:</h3>
          <p className="text-gray-700 whitespace-pre-wrap leading-relaxed">{storyText}</p>
        </div>
      </div>

      <div className="flex justify-between">
        <button 
          onClick={() => setCurrentStep(2)}
          className="bg-gray-300 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-400 transition-colors"
        >
          ← Back
        </button>
        <button 
          onClick={handleComplete}
          className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors"
        >
          ✓ Complete Check-In
        </button>
      </div>
    </div>
  )

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 to-pink-50 p-4 sm:p-8">
      <div className="max-w-4xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          {/* Header with progress */}
          <div className="mb-8">
            <div className="flex items-center justify-between mb-4">
              <h1 className="text-3xl font-bold text-gray-800">Emotion Grid</h1>
              <div className="text-sm font-medium text-gray-600">
                Step {currentStep} of 3
              </div>
            </div>
            
            {/* Progress bar */}
            <div className="w-full bg-gray-200 rounded-full h-2">
              <div 
                className="bg-purple-600 h-2 rounded-full transition-all duration-300"
                style={{ width: `${(currentStep / 3) * 100}%` }}
              />
            </div>
          </div>

          {/* Step content */}
          {currentStep === 1 && renderStep1()}
          {currentStep === 2 && renderStep2()}
          {currentStep === 3 && renderStep3()}

          {/* Back to check-in link */}
          <div className="text-center mt-8 pt-6 border-t">
            <button 
              onClick={() => navigate('/child/check-in')}
              className="text-gray-500 hover:text-gray-700 transition-colors"
            >
              ← Back to Check-in Hub
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}