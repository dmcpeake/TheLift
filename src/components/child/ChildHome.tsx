import React, { useState, useEffect, useContext } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Progress } from '../ui/progress'
import { 
  Heart, 
  Sparkles, 
  Target, 
  Award, 
  Users, 

  Flower,
  Star,
  Sun,
  CheckCircle
} from 'lucide-react'

interface ChildData {
  name: string
  currentStreak: number
  totalCheckIns: number
  todaysCheckIn: boolean
  stickerCount: number
  gardenProgress: number
  recentStickers: string[]
}

export function ChildHome() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [childData, setChildData] = useState<ChildData | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetchChildData()
  }, [])

  const fetchChildData = async () => {
    try {
      if (!user?.id) {
        setLoading(false)
        return
      }

      // Check if child has completed today's wellbeing check
      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/wellbeing/${user.id}`, {
        headers: {
          'Authorization': `Bearer ${publicAnonKey}`,
          'Content-Type': 'application/json',
        },
      })

      let todaysCheckIn = false
      let totalCheckIns = 0
      
      if (response.ok) {
        const { wellbeingData } = await response.json()
        const today = new Date().toISOString().split('T')[0]
        
        // Check if there's a wellbeing entry for today
        todaysCheckIn = wellbeingData.some((entry: any) => 
          entry.date === today
        )
        
        totalCheckIns = wellbeingData.length
      } else {
        console.warn('Could not fetch wellbeing data, using fallback')
      }

      setChildData({
        name: user?.profile.name || 'Friend',
        currentStreak: 3, // TODO: Calculate from wellbeing data
        totalCheckIns,
        todaysCheckIn,
        stickerCount: Math.min(totalCheckIns, 15), // Award stickers based on check-ins
        gardenProgress: Math.min((totalCheckIns * 5), 100), // Garden grows with check-ins
        recentStickers: ['star', 'heart', 'flower', 'sun'].slice(0, Math.min(totalCheckIns, 4))
      })
    } catch (error) {
      console.error('Error fetching child data:', error)
      // Fallback to static data
      setChildData({
        name: user?.profile.name || 'Friend',
        currentStreak: 0,
        totalCheckIns: 0,
        todaysCheckIn: false,
        stickerCount: 0,
        gardenProgress: 0,
        recentStickers: []
      })
    } finally {
      setLoading(false)
    }
  }

  const handleStartCheckIn = () => {
    navigate('/child/check-in/wheel')
  }



  const getStickerEmoji = (sticker: string) => {
    const stickerMap: { [key: string]: string } = {
      star: '⭐',
      heart: '❤️',
      flower: '🌸',
      sun: '☀️',
      rainbow: '🌈',
      butterfly: '🦋',
      diamond: '💎',
      smile: '😊',
      tree: '🌳',
      cloud: '☁️'
    }
    return stickerMap[sticker] || '⭐'
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-100 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-4 border-gray-600 border-t-transparent mx-auto mb-4"></div>
          <p className="text-lg text-gray-700">Loading your dashboard...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-100">
      {/* Header */}
      <div className="bg-white/80 backdrop-blur-sm border-b border-gray-200 p-4">
        <div className="max-w-4xl mx-auto flex items-center justify-between">
          <div className="flex items-center gap-4">
            <div className="w-12 h-12 bg-gray-700 rounded-full flex items-center justify-center">
              <span className="text-white text-xl font-bold">
                {childData?.name.charAt(0) || 'F'}
              </span>
            </div>
            <div>
              <h1 className="text-2xl font-bold text-gray-800">
                Hi, {childData?.name}! 👋
              </h1>
              <p className="text-gray-600">Ready for your wellbeing check-in?</p>
            </div>
          </div>

        </div>
      </div>

      <div className="max-w-4xl mx-auto p-6 space-y-8">
        {/* Today's Check-in Card */}
        <Card className="bg-gray-800 text-white border-0 shadow-lg">
          <CardContent className="p-8">
            {!childData?.todaysCheckIn ? (
              <div className="text-center">
                <div className="w-20 h-20 bg-white/20 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Heart className="h-10 w-10 text-white" />
                </div>
                <h2 className="text-3xl font-bold mb-2">Time for Your Daily Check-in!</h2>
                <p className="text-lg text-gray-300 mb-6">
                  Tell us how you're feeling today and grow your garden
                </p>
                <Button 
                  onClick={handleStartCheckIn}
                  className="bg-white text-gray-800 hover:bg-gray-100 text-lg px-8 py-3 rounded-full font-bold shadow-lg transform hover:scale-105 transition-all"
                >
                  <Sparkles className="h-5 w-5 mr-2" />
                  Start Check-in
                </Button>
              </div>
            ) : (
              <div className="text-center">
                <div className="w-20 h-20 bg-white/20 rounded-full flex items-center justify-center mx-auto mb-4">
                  <CheckCircle className="h-10 w-10 text-white" />
                </div>
                <h2 className="text-3xl font-bold mb-2">Great Job Today! ✨</h2>
                <p className="text-lg text-gray-300 mb-4">
                  You've completed your check-in for today
                </p>
                <Badge className="bg-white/20 text-white text-lg px-4 py-2">
                  Come back tomorrow!
                </Badge>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Stats Row */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Target className="h-5 w-5" />
                Daily Streak
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-gray-800 mb-2">
                🔥 {childData?.currentStreak || 0}
              </div>
              <p className="text-gray-600">days in a row!</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Award className="h-5 w-5" />
                Stickers Earned
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-gray-800 mb-2">
                {childData?.stickerCount || 0}
              </div>
              <p className="text-gray-600">amazing stickers!</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Flower className="h-5 w-5" />
                Garden Progress
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-gray-800 mb-2">
                {childData?.gardenProgress || 0}%
              </div>
              <Progress 
                value={childData?.gardenProgress || 0} 
                className="h-2 bg-white/50"
              />
            </CardContent>
          </Card>
        </div>

        {/* Recent Stickers */}
        <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-gray-700">
              <Star className="h-5 w-5" />
              Your Recent Stickers
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="flex flex-wrap gap-4">
              {childData?.recentStickers.map((sticker, index) => (
                <div 
                  key={index}
                  className="w-16 h-16 bg-gray-300 rounded-full flex items-center justify-center text-2xl shadow-lg transform hover:scale-110 transition-transform cursor-pointer"
                >
                  {getStickerEmoji(sticker)}
                </div>
              ))}
              {(!childData?.recentStickers || childData.recentStickers.length === 0) && (
                <p className="text-gray-500 italic">Complete check-ins to earn stickers!</p>
              )}
            </div>
          </CardContent>
        </Card>

        {/* Activity Buttons */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <Link to="/child/stickers">
            <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg hover:shadow-xl transition-all transform hover:scale-105 cursor-pointer">
              <CardContent className="p-6 text-center">
                <div className="w-16 h-16 bg-gray-700 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Award className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-800 mb-2">My Sticker Book</h3>
                <p className="text-gray-600">See all your amazing stickers and achievements</p>
              </CardContent>
            </Card>
          </Link>

          <Link to="/child/community">
            <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg hover:shadow-xl transition-all transform hover:scale-105 cursor-pointer">
              <CardContent className="p-6 text-center">
                <div className="w-16 h-16 bg-gray-600 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Users className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-800 mb-2">Community</h3>
                <p className="text-gray-600">Connect with friends and share your journey</p>
              </CardContent>
            </Card>
          </Link>
        </div>

        {/* Encouraging Message */}
        <Card className="bg-gray-200 border-0 shadow-lg">
          <CardContent className="p-6 text-center">
            <Sun className="h-12 w-12 text-gray-600 mx-auto mb-4" />
            <h3 className="text-xl font-bold text-gray-800 mb-2">You're Doing Amazing!</h3>
            <p className="text-gray-700">
              Every check-in helps you understand your feelings better. Keep up the great work!
            </p>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}