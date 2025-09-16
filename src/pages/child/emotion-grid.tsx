import { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'

const emotions = [
  { name: 'Happy', emoji: '😊', category: 'positive' },
  { name: 'Excited', emoji: '🎉', category: 'positive' },
  { name: 'Calm', emoji: '😌', category: 'positive' },
  { name: 'Proud', emoji: '🥰', category: 'positive' },
  { name: 'Sad', emoji: '😢', category: 'negative' },
  { name: 'Angry', emoji: '😠', category: 'negative' },
  { name: 'Worried', emoji: '😟', category: 'negative' },
  { name: 'Confused', emoji: '😕', category: 'negative' }
]

export default function EmotionGridPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [selectedEmotions, setSelectedEmotions] = useState<string[]>([])
  const [step, setStep] = useState(1)
  const [story, setStory] = useState('')
  
  const childId = user?.id || 'demo_child'

  const toggleEmotion = (emotion: string) => {
    setSelectedEmotions(prev => 
      prev.includes(emotion) 
        ? prev.filter(e => e !== emotion)
        : prev.length < 3 ? [...prev, emotion] : prev
    )
  }

  const handleComplete = () => {
    console.log('Emotion grid completed:', { emotions: selectedEmotions, story, childId })
    navigate('/child/check-in')
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 to-pink-50 p-4 sm:p-8">
      <div className="max-w-3xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          <div className="text-center mb-8">
            <h1 className="text-3xl font-bold text-gray-800 mb-2">Emotion Grid</h1>
            <p className="text-gray-600">
              Step {step} of 2: {step === 1 ? 'Choose up to 3 emotions' : 'Tell your story'}
            </p>
          </div>

          {step === 1 && (
            <>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
                {emotions.map((emotion) => (
                  <button
                    key={emotion.name}
                    onClick={() => toggleEmotion(emotion.name)}
                    className={`p-4 rounded-lg border-2 transition-all ${
                      selectedEmotions.includes(emotion.name)
                        ? 'bg-purple-100 border-purple-400 ring-2 ring-purple-400'
                        : 'bg-gray-50 border-gray-200 hover:bg-gray-100'
                    }`}
                    disabled={!selectedEmotions.includes(emotion.name) && selectedEmotions.length >= 3}
                  >
                    <div className="text-3xl mb-2">{emotion.emoji}</div>
                    <div className="text-sm font-medium">{emotion.name}</div>
                  </button>
                ))}
              </div>

              <div className="text-center">
                <p className="text-gray-600 mb-4">
                  Selected: {selectedEmotions.length}/3 emotions
                </p>
                <button
                  onClick={() => setStep(2)}
                  disabled={selectedEmotions.length === 0}
                  className="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 transition-colors disabled:bg-gray-300"
                >
                  Continue
                </button>
              </div>
            </>
          )}

          {step === 2 && (
            <>
              <div className="mb-6">
                <h3 className="text-lg font-semibold mb-4">
                  You're feeling: {selectedEmotions.map(e => emotions.find(em => em.name === e)?.emoji).join(' ')}
                </h3>
                <p className="text-gray-600 mb-4">Tell us what's happening that makes you feel this way:</p>
                <textarea
                  value={story}
                  onChange={(e) => setStory(e.target.value)}
                  placeholder="Share your story here..."
                  className="w-full h-32 p-4 border-2 border-gray-200 rounded-lg resize-none focus:border-purple-400 focus:outline-none"
                  maxLength={500}
                />
                <p className="text-sm text-gray-500 text-right mt-1">
                  {story.length}/500 characters
                </p>
              </div>

              <div className="flex gap-3 justify-center">
                <button
                  onClick={() => setStep(1)}
                  className="bg-gray-300 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-400 transition-colors"
                >
                  Back
                </button>
                <button
                  onClick={handleComplete}
                  disabled={story.trim().length === 0}
                  className="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 transition-colors disabled:bg-gray-300"
                >
                  Complete
                </button>
              </div>
            </>
          )}

          <div className="text-center mt-8">
            <button 
              onClick={() => navigate('/child/check-in')}
              className="text-gray-600 hover:text-gray-800 transition-colors"
            >
              ← Back to Check-in
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}