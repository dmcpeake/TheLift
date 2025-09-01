import React, { useState, useEffect, useContext } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId } from '../../utils/supabase/info'
import { AuthContext } from '../../App'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { 
  Star, 
  Heart, 
  Sparkles, 
  Home, 
  Trophy,
  Smile,
  Sun,
  ArrowLeft,
  CheckCircle,
  Gift
} from 'lucide-react'

interface StickerReward {
  id: string
  name: string
  emoji: string
  rarity: 'common' | 'rare' | 'legendary'
  description: string
}

export function WrapUp() {
  const navigate = useNavigate()
  const location = useLocation()
  const { user } = useContext(AuthContext)
  
  const { wellbeingScores, awardedSticker, avgScore, dailyContent, gardenActivity } = location.state || {}
  
  const [currentMood, setCurrentMood] = useState(3)
  const [earnedSticker, setEarnedSticker] = useState<StickerReward | null>(null)
  const [showStickerReveal, setShowStickerReveal] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)

  const moodOptions = [
    { value: 1, emoji: '😢', label: 'Sad', color: 'from-blue-400 to-blue-600' },
    { value: 2, emoji: '😕', label: 'Not Great', color: 'from-gray-400 to-gray-600' },
    { value: 3, emoji: '😐', label: 'Okay', color: 'from-yellow-400 to-yellow-600' },
    { value: 4, emoji: '😊', label: 'Good', color: 'from-green-400 to-green-600' },
    { value: 5, emoji: '😍', label: 'Amazing!', color: 'from-pink-400 to-purple-600' }
  ]

  const availableStickers: StickerReward[] = [
    { id: 'star', name: 'Shining Star', emoji: '⭐', rarity: 'common', description: 'You completed your check-in!' },
    { id: 'heart', name: 'Big Heart', emoji: '❤️', rarity: 'common', description: 'You shared your feelings openly!' },
    { id: 'flower', name: 'Beautiful Flower', emoji: '🌸', rarity: 'common', description: 'Your garden grew today!' },
    { id: 'sun', name: 'Bright Sun', emoji: '☀️', rarity: 'rare', description: 'You\'re spreading sunshine!' },
    { id: 'rainbow', name: 'Magic Rainbow', emoji: '🌈', rarity: 'rare', description: 'Your feelings are colorful!' },
    { id: 'butterfly', name: 'Freedom Butterfly', emoji: '🦋', rarity: 'rare', description: 'You\'re growing and changing!' },
    { id: 'diamond', name: 'Precious Diamond', emoji: '💎', rarity: 'legendary', description: 'You\'re absolutely precious!' },
    { id: 'crown', name: 'Royal Crown', emoji: '👑', rarity: 'legendary', description: 'You\'re the king/queen of feelings!' }
  ]

  const getStickerEmoji = (sticker: string) => {
    const stickerMap = {
      'rainbow': '🌈',
      'sun': '☀️',
      'flower': '🌸',
      'heart': '💖',
      'star': '⭐',
      'butterfly': '🦋',
      'tree': '🌳',
      'cloud': '☁️'
    }
    return stickerMap[sticker] || '⭐'
  }

  useEffect(() => {
    // Use the sticker from the garden if available, otherwise determine one
    if (awardedSticker) {
      const matchingSticker = availableStickers.find(s => s.id === awardedSticker) || 
        availableStickers.find(s => s.emoji === getStickerEmoji(awardedSticker))
      
      if (matchingSticker) {
        setEarnedSticker(matchingSticker)
      } else {
        // Create a custom sticker entry for the awarded sticker
        setEarnedSticker({
          id: awardedSticker,
          name: `${awardedSticker.charAt(0).toUpperCase() + awardedSticker.slice(1)} Sticker`,
          emoji: getStickerEmoji(awardedSticker),
          rarity: avgScore >= 4 ? 'rare' : 'common',
          description: `You earned this for sharing your feelings!`
        })
      }
    } else {
      // Fallback to original logic
      const calculatedAvgScore = wellbeingScores ? Object.values(wellbeingScores).reduce((a: number, b: number) => a + b, 0) / Object.keys(wellbeingScores).length : 3
      const totalActivity = gardenActivity ? (gardenActivity.plantsWatered || 0) + (gardenActivity.newPlants?.length || 0) : 0
      
      let selectedSticker: StickerReward
      
      if (calculatedAvgScore >= 4.5 && totalActivity >= 3) {
        selectedSticker = availableStickers.filter(s => s.rarity === 'legendary')[Math.floor(Math.random() * 2)]
      } else if (calculatedAvgScore >= 3.5 || totalActivity >= 2) {
        selectedSticker = availableStickers.filter(s => s.rarity === 'rare')[Math.floor(Math.random() * 3)]
      } else {
        selectedSticker = availableStickers.filter(s => s.rarity === 'common')[Math.floor(Math.random() * 3)]
      }
      
      setEarnedSticker(selectedSticker)
    }
  }, [wellbeingScores, gardenActivity, awardedSticker, avgScore])

  const handleRevealSticker = () => {
    setShowStickerReveal(true)
  }

  const handleSubmitCheckIn = async () => {
    setIsSubmitting(true)
    
    // Verify user is still authenticated
    if (!user) {
      console.error('User not found during check-in submission')
      navigate('/login')
      return
    }
    
    console.log('Submitting check-in for user:', user.profile.role, user.id)
    
    try {
      // Create check-in data
      const checkInData = {
        childId: user.id,
        wheel: wellbeingScores,
        garden: gardenActivity,
        wrapUpMood: currentMood,
        stickerAwarded: earnedSticker?.id || 'star'
      }

      // Submit to server
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()
      
      if (sessionError) {
        console.error('Session error:', sessionError)
      }
      
      if (session?.access_token) {
        try {
          const response = await fetch(`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/checkins`, {
            method: 'POST',
            headers: {
              'Authorization': `Bearer ${session.access_token}`,
              'Content-Type': 'application/json',
            },
            body: JSON.stringify(checkInData)
          })
          
          if (response.ok) {
            console.log('Check-in submitted successfully')
          } else {
            console.warn('Check-in submission failed:', response.status)
          }
        } catch (fetchError) {
          console.error('Error submitting to server:', fetchError)
        }
      } else {
        console.warn('No active session found')
      }
      
      // Mark as submitted regardless of server response for demo purposes
      setSubmitted(true)
      
      // Use a shorter delay and ensure navigation happens
      setTimeout(() => {
        try {
          navigate('/child/home', { replace: true })
        } catch (navError) {
          console.error('Navigation error:', navError)
          // Fallback navigation
          window.location.href = '/child/home'
        }
      }, 2000)
      
    } catch (error) {
      console.error('Error in check-in submission:', error)
      // Still mark as submitted for demo purposes
      setSubmitted(true)
      setTimeout(() => {
        try {
          navigate('/child/home', { replace: true })
        } catch (navError) {
          console.error('Navigation error:', navError)
          // Fallback navigation
          window.location.href = '/child/home'
        }
      }, 2000)
    } finally {
      setIsSubmitting(false)
    }
  }

  const getRarityColor = (rarity: string) => {
    switch (rarity) {
      case 'legendary': return 'from-purple-500 to-pink-500'
      case 'rare': return 'from-blue-500 to-cyan-500'
      default: return 'from-green-500 to-blue-500'
    }
  }

  const getRarityBadgeColor = (rarity: string) => {
    switch (rarity) {
      case 'legendary': return 'bg-purple-100 text-purple-800 border-purple-300'
      case 'rare': return 'bg-blue-100 text-blue-800 border-blue-300'
      default: return 'bg-green-100 text-green-800 border-green-300'
    }
  }

  if (submitted) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <Card className="bg-white border-0 shadow-xl max-w-md w-full mx-4">
          <CardContent className="p-8 text-center">
            <div className="w-20 h-20 bg-gray-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <CheckCircle className="h-10 w-10 text-white" />
            </div>
            <h2 className="text-2xl font-bold text-gray-800 mb-4">Check-in Complete! 🎉</h2>
            <p className="text-gray-600 mb-6">
              Great job sharing your feelings today. You're building healthy habits!
            </p>
            <div className="animate-pulse">
              <p className="text-sm text-gray-500">Taking you back home...</p>
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b p-4">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-2xl font-bold text-gray-800 mb-2">Almost Done! 🎯</h1>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 bg-gray-500 rounded-full"></div>
            <div className="w-3 h-3 bg-gray-500 rounded-full"></div>
            <div className="w-3 h-3 bg-gray-500 rounded-full scale-125"></div>
            <span className="text-sm text-gray-600 ml-2">Step 3 of 3</span>
          </div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto p-6 space-y-8">
        {/* Final Mood Check */}
        <Card className="bg-white border-0 shadow-xl">
          <CardHeader className="text-center">
            <div className="w-16 h-16 bg-gray-600 rounded-full flex items-center justify-center mx-auto mb-4">
              <Smile className="h-8 w-8 text-white" />
            </div>
            <CardTitle className="text-2xl text-gray-800">How are you feeling now?</CardTitle>
            <p className="text-gray-600">After sharing your feelings and taking care of your garden</p>
          </CardHeader>
          <CardContent className="px-8 pb-8">
            <div className="grid grid-cols-5 gap-3 mb-6">
              {moodOptions.map((mood) => (
                <button
                  key={mood.value}
                  onClick={() => setCurrentMood(mood.value)}
                  className={`
                    p-4 rounded-xl border-2 transition-all transform hover:scale-105
                    ${currentMood === mood.value
                      ? `bg-gradient-to-br ${mood.color} text-white border-white shadow-lg scale-105`
                      : 'bg-white border-gray-200 text-gray-700 hover:border-gray-300'
                    }
                  `}
                >
                  <div className="text-3xl mb-2">{mood.emoji}</div>
                  <div className="text-sm font-medium">{mood.label}</div>
                </button>
              ))}
            </div>
            
            {currentMood && (
              <div className={`text-center p-4 rounded-lg bg-gradient-to-r ${moodOptions[currentMood - 1].color} text-white`}>
                <p className="text-lg font-bold">
                  You're feeling {moodOptions[currentMood - 1].label.toLowerCase()}! {moodOptions[currentMood - 1].emoji}
                </p>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Sticker Reward */}
        <Card className="bg-gray-100 border-0 shadow-xl">
          <CardHeader className="text-center">
            <Gift className="h-12 w-12 text-gray-600 mx-auto mb-4" />
            <CardTitle className="text-2xl text-gray-800">You Earned a Sticker! 🎁</CardTitle>
            <p className="text-gray-700">Click to see what amazing sticker you got!</p>
          </CardHeader>
          <CardContent className="p-8">
            {!showStickerReveal ? (
              <div className="text-center">
                <button
                  onClick={handleRevealSticker}
                  className="w-32 h-32 bg-gray-400 rounded-full flex items-center justify-center text-4xl shadow-lg transform hover:scale-110 transition-all animate-pulse mx-auto mb-4"
                >
                  🎁
                </button>
                <Button
                  onClick={handleRevealSticker}
                  className="bg-gray-600 hover:bg-gray-700 text-white px-8 py-3 text-lg rounded-full"
                >
                  <Sparkles className="h-5 w-5 mr-2" />
                  Reveal My Sticker!
                </Button>
              </div>
            ) : earnedSticker && (
              <div className="text-center animate-bounce">
                <div className={`w-32 h-32 bg-gradient-to-r ${getRarityColor(earnedSticker.rarity)} rounded-full flex items-center justify-center text-6xl shadow-xl mx-auto mb-4`}>
                  {earnedSticker.emoji}
                </div>
                <h3 className="text-2xl font-bold text-gray-800 mb-2">{earnedSticker.name}</h3>
                <Badge className={`mb-3 ${getRarityBadgeColor(earnedSticker.rarity)}`}>
                  {earnedSticker.rarity.charAt(0).toUpperCase() + earnedSticker.rarity.slice(1)}
                </Badge>
                <p className="text-gray-700 max-w-md mx-auto">{earnedSticker.description}</p>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Daily Inspiration - shown after sticker reveal */}
        {showStickerReveal && dailyContent && (
          <Card className="bg-white border-0 shadow-lg">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Sparkles className="h-6 w-6" />
                Today's Inspiration
              </CardTitle>
              <p className="text-gray-600">Something special just for you!</p>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="p-4 bg-gray-50 rounded-xl">
                <h4 className="text-sm uppercase tracking-wide text-gray-500 mb-2">Uplifting Quote</h4>
                <p className="text-gray-800">"{dailyContent.quote}"</p>
              </div>
              
              <div className="p-4 bg-gray-50 rounded-xl">
                <h4 className="text-sm uppercase tracking-wide text-gray-500 mb-2">Fun Fact</h4>
                <p className="text-gray-800">{dailyContent.fact}</p>
              </div>
              
              <div className="p-4 bg-gray-50 rounded-xl">
                <h4 className="text-sm uppercase tracking-wide text-gray-500 mb-2">Smile Break</h4>
                <p className="text-gray-800">{dailyContent.joke}</p>
              </div>
            </CardContent>
          </Card>
        )}

        {/* Summary */}
        <Card className="bg-white border-0 shadow-lg">
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-gray-600">
              <Trophy className="h-6 w-6" />
              Today's Amazing Work
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div className="text-center p-4 bg-gray-50 rounded-lg">
                <Heart className="h-8 w-8 text-gray-600 mx-auto mb-2" />
                <h4 className="text-gray-800">Shared Feelings</h4>
                <p className="text-sm text-gray-600">5 emotions explored</p>
              </div>
              <div className="text-center p-4 bg-gray-50 rounded-lg">
                <Sun className="h-8 w-8 text-gray-600 mx-auto mb-2" />
                <h4 className="text-gray-800">Garden Care</h4>
                <p className="text-sm text-gray-600">{gardenActivity?.plantsWatered || 0} plants watered</p>
              </div>
              <div className="text-center p-4 bg-gray-50 rounded-lg">
                <Star className="h-8 w-8 text-gray-600 mx-auto mb-2" />
                <h4 className="text-gray-800">Sticker Earned</h4>
                <p className="text-sm text-gray-600">{earnedSticker?.name || 'Amazing reward!'}</p>
              </div>
            </div>
            
            {/* Show good things shared */}
            {gardenActivity?.wateringEntries && gardenActivity.wateringEntries.length > 0 && (
              <div className="mt-6 p-4 bg-gray-50 rounded-lg">
                <h4 className="text-gray-800 mb-3 text-center">Good Things You Shared Today:</h4>
                <div className="space-y-2">
                  {gardenActivity.wateringEntries.slice(0, 2).map((entry, index) => (
                    <div key={index} className="text-sm text-gray-700 bg-white p-2 rounded border-l-4 border-gray-400">
                      "{entry.event}"
                    </div>
                  ))}
                  {gardenActivity.wateringEntries.length > 2 && (
                    <div className="text-xs text-gray-500 text-center">
                      ...and {gardenActivity.wateringEntries.length - 2} more wonderful things!
                    </div>
                  )}
                </div>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Navigation */}
        <div className="flex justify-between items-center">
          <Button 
            variant="outline" 
            onClick={() => navigate('/child/check-in/garden')}
            className="bg-white hover:bg-gray-50 px-6"
          >
            <ArrowLeft className="h-4 w-4 mr-2" />
            Back to Garden
          </Button>

          <Button 
            onClick={handleSubmitCheckIn}
            disabled={isSubmitting || !showStickerReveal}
            className="bg-gray-600 hover:bg-gray-700 text-white px-8 py-3 text-lg rounded-full disabled:opacity-50"
          >
            {isSubmitting ? (
              <>
                <div className="animate-spin rounded-full h-5 w-5 border-2 border-white border-t-transparent mr-2" />
                Saving...
              </>
            ) : (
              <>
                <Home className="h-5 w-5 mr-2" />
                Finish & Go Home!
              </>
            )}
          </Button>
        </div>

        {/* Encouraging Message */}
        <div className="text-center mt-8">
          <p className="text-gray-600 italic text-lg">
            "You did such a wonderful job today! I'm proud of you for sharing your feelings! 🌟"
          </p>
        </div>
      </div>
    </div>
  )
}