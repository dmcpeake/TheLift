import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { getSupabaseClient } from '../../utils/supabase/client'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Progress } from '../ui/progress'
import { 
  Heart, 
  Shield, 
  Users, 
  Zap, 
  Trophy, 
  ArrowRight,
  ArrowLeft,
  Sparkles
} from 'lucide-react'

interface WellbeingScores {
  happy: number
  safe: number
  supported: number
  excited: number
  confident: number
}

interface EmotionConfig {
  key: keyof WellbeingScores
  label: string
  icon: React.ComponentType<{ className?: string }>
  shade: string
  selectionTips: string[]
  contextualTips: { [score: number]: string[] }
}

export function WellbeingWheel() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [currentEmotion, setCurrentEmotion] = useState(0)
  const [scores, setScores] = useState<WellbeingScores>({
    happy: 0,
    safe: 0,
    supported: 0,
    excited: 0,
    confident: 0
  })

  const emotions: EmotionConfig[] = [
    {
      key: 'happy',
      label: 'Happy',
      icon: Heart,
      shade: 'bg-gray-700',
      selectionTips: [
        'Think about your mood right now',
        'Are you feeling cheerful or sad?',
        'What number feels right for you?',
        'It\'s okay if you\'re not super happy today'
      ],
      contextualTips: {
        1: ['It\'s okay to feel sad sometimes', 'Tomorrow might feel different', 'You\'re brave for being honest', 'Talking to someone can help'],
        2: ['You might be having a tough day', 'Small things can help you feel better', 'It\'s normal to have ups and downs', 'Be kind to yourself'],
        3: ['You\'re feeling okay today', 'That\'s perfectly normal', 'Some days are just okay', 'You can find small joys'],
        4: ['You\'re feeling pretty good!', 'Notice what\'s making you happy', 'This is a great feeling', 'You can share this joy with others'],
        5: ['You\'re feeling amazing today!', 'What\'s making you so happy?', 'This feeling is wonderful', 'You\'re radiating positive energy!']
      }
    },
    {
      key: 'safe',
      label: 'Safe',
      icon: Shield,
      shade: 'bg-gray-600',
      selectionTips: [
        'Think about your surroundings',
        'Do you feel protected and secure?',
        'Are you in a comfortable space?',
        'Trust your feelings about safety'
      ],
      contextualTips: {
        1: ['It\'s important you told us this', 'You deserve to feel safe', 'Talk to a trusted adult', 'Your feelings matter'],
        2: ['Some things might be worrying you', 'It\'s okay to ask for help', 'Share your concerns with someone', 'You\'re not alone'],
        3: ['You feel mostly safe today', 'That\'s a good foundation', 'Notice what helps you feel secure', 'You can build on this feeling'],
        4: ['You feel quite safe and secure', 'That\'s wonderful to hear', 'You\'re in a good place', 'This helps you enjoy life more'],
        5: ['You feel completely safe!', 'This is how everyone should feel', 'You\'re in a great environment', 'You can relax and be yourself']
      }
    },
    {
      key: 'supported',
      label: 'Supported',
      icon: Users,
      shade: 'bg-gray-800',
      selectionTips: [
        'Think about the people in your life',
        'Do you feel cared for and loved?',
        'Who do you turn to when you need help?',
        'Consider family, friends, and teachers'
      ],
      contextualTips: {
        1: ['You might be feeling lonely', 'Everyone needs support sometimes', 'There are people who care about you', 'It\'s okay to reach out'],
        2: ['You might need more connection', 'Look for people who care about you', 'Small acts of kindness count', 'You\'re worth caring about'],
        3: ['You have some good support', 'That\'s a solid foundation', 'You can strengthen these connections', 'People do care about you'],
        4: ['You feel well supported!', 'You have good people around you', 'These relationships are precious', 'You can support others too'],
        5: ['You feel completely supported!', 'You\'re surrounded by caring people', 'This is a beautiful feeling', 'You\'re truly loved']
      }
    },
    {
      key: 'excited',
      label: 'Excited',
      icon: Zap,
      shade: 'bg-gray-500',
      selectionTips: [
        'Think about your energy level',
        'Are you looking forward to anything?',
        'Do you feel motivated and eager?',
        'It\'s okay to feel calm sometimes too'
      ],
      contextualTips: {
        1: ['You might be feeling tired today', 'Low energy is okay sometimes', 'Rest when you need to', 'Tomorrow might feel different'],
        2: ['Your energy is a bit low', 'Maybe you need some rest', 'Small activities might help', 'Be gentle with yourself'],
        3: ['You have a moderate level of excitement', 'That\'s perfectly balanced', 'You feel steady and calm', 'This is a comfortable place to be'],
        4: ['You\'re feeling quite excited!', 'You have good energy today', 'Channel this into fun activities', 'Your enthusiasm is lovely'],
        5: ['You\'re bursting with excitement!', 'Your energy is amazing', 'You\'re ready for anything', 'Share this excitement with others']
      }
    },
    {
      key: 'confident',
      label: 'Confident',
      icon: Trophy,
      shade: 'bg-gray-900',
      selectionTips: [
        'Think about believing in yourself',
        'Do you feel capable and strong?',
        'Are you ready to try new things?',
        'Confidence can grow over time'
      ],
      contextualTips: {
        1: ['Everyone feels unsure sometimes', 'You\'re braver than you think', 'Small steps build confidence', 'You have strengths you might not see'],
        2: ['You might be doubting yourself', 'That\'s more common than you think', 'Focus on what you do well', 'Confidence takes practice'],
        3: ['You have a good level of confidence', 'You know some of your strengths', 'You can build on this', 'You\'re more capable than you realise'],
        4: ['You\'re feeling quite confident!', 'You believe in your abilities', 'This helps you try new things', 'Your confidence inspires others'],
        5: ['You feel completely confident!', 'You truly believe in yourself', 'You\'re ready for any challenge', 'Your confidence is inspiring']
      }
    }
  ]

  const currentEmotionConfig = emotions[currentEmotion]

  const handleScoreSelect = (score: number) => {
    console.log('handleScoreSelect called with score:', score, 'for emotion:', currentEmotionConfig.key)
    setScores(prev => {
      const newScores = {
        ...prev,
        [currentEmotionConfig.key]: score
      }
      console.log('Updated scores:', newScores)
      return newScores
    })
  }

  const handleNext = async () => {
    if (currentEmotion < emotions.length - 1) {
      setCurrentEmotion(currentEmotion + 1)
    } else {
      // All emotions completed, save to backend then navigate to garden
      await saveWellbeingData()
    }
  }

  const saveWellbeingData = async () => {
    try {
      console.log('Saving wellbeing data:', scores)
      
      // Get the user's access token for authentication
      const supabase = getSupabaseClient()
      const { data: { session } } = await supabase.auth.getSession()
      
      let authToken = publicAnonKey // fallback
      if (session?.access_token) {
        authToken = session.access_token
        console.log('Using user access token for authentication')
      } else {
        console.log('No user session found, using public anon key')
      }
      
      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/wellbeing`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${authToken}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          wellbeingScores: scores
        })
      })

      // Calculate average score for sticker reward
      const avgScore = Object.values(scores).reduce((a, b) => a + b, 0) / Object.values(scores).length
      
      // Determine sticker based on emotional state
      let awardedSticker = 'star' // default
      if (avgScore >= 4.5) {
        awardedSticker = 'rainbow'
      } else if (avgScore >= 4) {
        awardedSticker = 'sun'
      } else if (avgScore >= 3.5) {
        awardedSticker = 'flower'
      } else if (avgScore >= 3) {
        awardedSticker = 'heart'
      } else {
        awardedSticker = 'star' // encouraging sticker even for low scores
      }

      if (response.ok) {
        const result = await response.json()
        console.log('Wellbeing data saved successfully:', result)
      } else {
        const error = await response.json()
        console.error('Failed to save wellbeing data:', error)
        console.error('Response status:', response.status)
        console.error('Response statusText:', response.statusText)
        // Continue with experience even if save fails
      }
      
      // Navigate to garden with scores and sticker reward
      navigate('/child/check-in/garden', { 
        state: { 
          wellbeingScores: scores,
          awardedSticker,
          avgScore
        } 
      })
    } catch (error) {
      console.error('Error saving wellbeing data:', error)
      
      // Still create a good experience even if save fails
      const avgScore = Object.values(scores).reduce((a, b) => a + b, 0) / Object.values(scores).length
      const awardedSticker = avgScore >= 4 ? 'sun' : avgScore >= 3 ? 'heart' : 'star'
      
      navigate('/child/check-in/garden', { 
        state: { 
          wellbeingScores: scores,
          awardedSticker,
          avgScore
        } 
      })
    }
  }

  const handlePrevious = () => {
    if (currentEmotion > 0) {
      setCurrentEmotion(currentEmotion - 1)
    }
  }

  const getScoreLabel = (score: number) => {
    const labels = [
      'Not at all',
      'A little bit',
      'Some of the time',
      'Most of the time',
      'All the time!'
    ]
    return labels[score - 1] || 'Choose a number'
  }

  const getScoreEmoji = (score: number) => {
    const emojis = ['😢', '😕', '😐', '😊', '😍']
    return emojis[score - 1] || '❓'
  }

  const getCurrentTips = () => {
    const currentScore = scores[currentEmotionConfig.key]
    if (currentScore === 0) {
      return {
        title: 'How to choose your number:',
        tips: currentEmotionConfig.selectionTips
      }
    } else {
      return {
        title: 'This is what your choice means:',
        tips: currentEmotionConfig.contextualTips[currentScore] || []
      }
    }
  }

  const isCurrentEmotionCompleted = scores[currentEmotionConfig.key] > 0
  const completedEmotions = emotions.filter(emotion => scores[emotion.key] > 0).length
  const progressPercentage = (completedEmotions / emotions.length) * 100
  const tipData = getCurrentTips()

  return (
    <div className="min-h-screen bg-gray-100">
      {/* Header */}
      <div className="bg-white/80 backdrop-blur-sm border-b border-gray-200 p-4">
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center justify-between mb-4">
            <h1 className="text-2xl font-bold text-gray-800">Wellbeing Wheel 🎯</h1>
            <Badge className="bg-gray-100 text-gray-800">
              {currentEmotion + 1} of {emotions.length}
            </Badge>
          </div>
          <div className="w-full bg-gray-200 rounded-full h-3">
            <div 
              className="bg-gray-800 h-3 rounded-full transition-all duration-500"
              style={{ width: `${progressPercentage}%` }}
            />
          </div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto p-6">
        {/* Main Emotion Card */}
        <Card className="bg-white/80 backdrop-blur-sm border-0 shadow-xl mb-6">
          <CardHeader className="text-center pb-4">
            <div className={`w-24 h-24 ${currentEmotionConfig.shade} rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg`}>
              <currentEmotionConfig.icon className="h-12 w-12 text-white" />
            </div>
            <CardTitle className="text-3xl text-gray-800 mb-2">
              How {currentEmotionConfig.label} do you feel?
            </CardTitle>
          </CardHeader>
          
          <CardContent className="px-8 pb-8">
            {/* Score Selection */}
            <div className="space-y-6">
              <div className="grid grid-cols-5 gap-3">
                {[1, 2, 3, 4, 5].map((score) => (
                  <button
                    key={score}
                    onClick={(e) => {
                      e.preventDefault()
                      console.log('Score button clicked:', score)
                      handleScoreSelect(score)
                    }}
                    className={`
                      relative p-6 rounded-2xl border-2 transition-all transform hover:scale-105 hover:shadow-lg cursor-pointer
                      ${scores[currentEmotionConfig.key] === score
                        ? 'bg-gray-800 text-white border-gray-900 shadow-lg scale-105'
                        : 'bg-white border-gray-200 text-gray-700 hover:border-gray-400 hover:bg-gray-50'
                      }
                    `}
                  >
                    <div className="text-4xl mb-2">{getScoreEmoji(score)}</div>
                    <div className="text-2xl font-bold mb-1">{score}</div>
                    <div className="text-sm font-medium">
                      {getScoreLabel(score)}
                    </div>
                    {scores[currentEmotionConfig.key] === score && (
                      <div className="absolute -top-2 -right-2 w-6 h-6 bg-gray-600 rounded-full flex items-center justify-center">
                        <span className="text-white text-xs">✓</span>
                      </div>
                    )}
                  </button>
                ))}
              </div>

              {/* Current Selection Display */}
              {isCurrentEmotionCompleted && (
                <div className={`text-center p-4 rounded-lg ${currentEmotionConfig.shade} text-white`}>
                  <p className="text-lg font-bold">
                    You feel {currentEmotionConfig.label.toLowerCase()}{' '}
                    {getScoreEmoji(scores[currentEmotionConfig.key])}{' '}
                    "{getScoreLabel(scores[currentEmotionConfig.key])}"
                  </p>
                </div>
              )}
            </div>
          </CardContent>
        </Card>

        {/* Contextual Tips Card */}
        <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg mb-6">
          <CardContent className="p-6">
            <h3 className="text-lg font-bold text-gray-800 mb-3">
              {tipData.title}
            </h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
              {tipData.tips.map((tip, index) => (
                <div key={index} className="flex items-start gap-3 p-3 bg-white/50 rounded-lg">
                  <div className="w-2 h-2 bg-gray-600 rounded-full mt-2 flex-shrink-0"></div>
                  <span className="text-gray-700">{tip}</span>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Navigation */}
        <div className="flex justify-between items-center">
          {currentEmotion > 0 && (
            <Button 
              variant="outline" 
              onClick={handlePrevious}
              className="bg-white/70 hover:bg-white/90 px-6"
            >
              <ArrowLeft className="h-4 w-4 mr-2" />
              Previous
            </Button>
          )}
          {currentEmotion === 0 && <div></div>}

          <div className="flex gap-2">
            {emotions.map((_, index) => (
              <div
                key={index}
                className={`w-3 h-3 rounded-full transition-all ${
                  index === currentEmotion
                    ? 'bg-gray-800 scale-125'
                    : index < currentEmotion
                      ? 'bg-gray-600'
                      : 'bg-gray-300'
                }`}
              />
            ))}
          </div>

          <Button 
            onClick={handleNext}
            disabled={!isCurrentEmotionCompleted}
            className="bg-gray-800 hover:bg-gray-900 text-white px-6 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {currentEmotion === emotions.length - 1 ? (
              <>
                Go to Garden
                <Sparkles className="h-4 w-4 ml-2" />
              </>
            ) : (
              <>
                Next
                <ArrowRight className="h-4 w-4 ml-2" />
              </>
            )}
          </Button>
        </div>

        {/* Encouraging Message */}
        <div className="mt-8 text-center">
          <p className="text-gray-600 italic text-lg">
            "It's okay to feel however you feel. You're being really honest and brave! 💪"
          </p>
        </div>
      </div>
    </div>
  )
}