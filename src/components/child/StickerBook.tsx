import React, { useState, useEffect, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Progress } from '../ui/progress'
import { 
  ArrowLeft, 
  Star, 
  Trophy, 
  Target, 
  Award, 
  Sparkles,
  Crown,
  Heart,
  Lock
} from 'lucide-react'

interface Sticker {
  id: string
  name: string
  emoji: string
  rarity: 'common' | 'rare' | 'epic' | 'legendary'
  description: string
  earnedDate?: string
  category: 'emotions' | 'garden' | 'streak' | 'special'
}

interface Achievement {
  id: string
  name: string
  description: string
  icon: React.ComponentType<{ className?: string }>
  progress: number
  maxProgress: number
  completed: boolean
  reward?: string
}

export function StickerBook() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [activeTab, setActiveTab] = useState<'stickers' | 'achievements'>('stickers')
  const [selectedCategory, setSelectedCategory] = useState<string>('all')

  const allStickers: Sticker[] = [
    // Earned Stickers
    { id: 'star1', name: 'First Star', emoji: '⭐', rarity: 'common', description: 'Your very first check-in!', earnedDate: '2024-08-20', category: 'emotions' },
    { id: 'heart1', name: 'Big Heart', emoji: '❤️', rarity: 'common', description: 'Shared your happy feelings!', earnedDate: '2024-08-20', category: 'emotions' },
    { id: 'flower1', name: 'Garden Bloom', emoji: '🌸', rarity: 'common', description: 'Watered 3 plants in one day!', earnedDate: '2024-08-21', category: 'garden' },
    { id: 'sun1', name: 'Sunshine', emoji: '☀️', rarity: 'rare', description: 'Feeling great for 3 days!', earnedDate: '2024-08-21', category: 'streak' },
    { id: 'rainbow1', name: 'Rainbow Magic', emoji: '🌈', rarity: 'rare', description: 'Shared all 5 emotions honestly!', earnedDate: '2024-08-22', category: 'emotions' },
    { id: 'butterfly1', name: 'Growth Butterfly', emoji: '🦋', rarity: 'epic', description: 'Check-in streak of 7 days!', earnedDate: '2024-08-22', category: 'streak' },
    
    // Locked Stickers (not yet earned)
    { id: 'diamond1', name: 'Precious Diamond', emoji: '💎', rarity: 'legendary', description: 'Complete 30 check-ins', category: 'special' },
    { id: 'crown1', name: 'Feeling Crown', emoji: '👑', rarity: 'legendary', description: 'Master of emotions - 50 check-ins!', category: 'special' },
    { id: 'unicorn1', name: 'Magic Unicorn', emoji: '🦄', rarity: 'epic', description: 'Perfect garden care for 10 days', category: 'garden' },
    { id: 'fire1', name: 'Fire Streak', emoji: '🔥', rarity: 'epic', description: '14 days in a row!', category: 'streak' },
    { id: 'rocket1', name: 'Blast Off', emoji: '🚀', rarity: 'rare', description: 'Amazing mood improvement!', category: 'emotions' },
    { id: 'tree1', name: 'Wisdom Tree', emoji: '🌳', rarity: 'rare', description: 'Grew 10 plants total', category: 'garden' }
  ]

  const achievements: Achievement[] = [
    { id: 'first_checkin', name: 'First Steps', description: 'Complete your first check-in', icon: Star, progress: 1, maxProgress: 1, completed: true, reward: '⭐' },
    { id: 'week_streak', name: 'Week Warrior', description: 'Check in for 7 days in a row', icon: Target, progress: 3, maxProgress: 7, completed: false, reward: '🦋' },
    { id: 'garden_master', name: 'Garden Master', description: 'Water 20 plants total', icon: Award, progress: 8, maxProgress: 20, completed: false, reward: '🌳' },
    { id: 'emotion_expert', name: 'Emotion Expert', description: 'Complete 25 wellbeing wheels', icon: Heart, progress: 15, maxProgress: 25, completed: false, reward: '👑' },
    { id: 'month_champion', name: 'Month Champion', description: 'Check in for 30 days total', icon: Trophy, progress: 15, maxProgress: 30, completed: false, reward: '💎' }
  ]

  const earnedStickers = allStickers.filter(s => s.earnedDate)
  const lockedStickers = allStickers.filter(s => !s.earnedDate)

  const categories = [
    { id: 'all', name: 'All Stickers', emoji: '🌟' },
    { id: 'emotions', name: 'Emotions', emoji: '❤️' },
    { id: 'garden', name: 'Garden', emoji: '🌻' },
    { id: 'streak', name: 'Streaks', emoji: '🔥' },
    { id: 'special', name: 'Special', emoji: '✨' }
  ]

  const filteredStickers = selectedCategory === 'all' 
    ? allStickers 
    : allStickers.filter(s => s.category === selectedCategory)

  const getRarityColor = (rarity: string) => {
    switch (rarity) {
      case 'legendary': return 'from-purple-500 to-pink-500'
      case 'epic': return 'from-orange-500 to-red-500'
      case 'rare': return 'from-blue-500 to-cyan-500'
      default: return 'from-green-500 to-blue-500'
    }
  }

  const getRarityBadgeColor = (rarity: string) => {
    switch (rarity) {
      case 'legendary': return 'bg-purple-100 text-purple-800 border-purple-300'
      case 'epic': return 'bg-orange-100 text-orange-800 border-orange-300'
      case 'rare': return 'bg-blue-100 text-blue-800 border-blue-300'
      default: return 'bg-green-100 text-green-800 border-green-300'
    }
  }

  const completionPercentage = Math.round((earnedStickers.length / allStickers.length) * 100)

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-100 via-pink-50 to-yellow-100">
      {/* Header */}
      <div className="bg-white/80 backdrop-blur-sm border-b border-white/20 p-4">
        <div className="max-w-6xl mx-auto">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-4">
              <Button 
                variant="outline" 
                onClick={() => navigate('/child/home')}
                className="bg-white/50 hover:bg-white/70"
              >
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back Home
              </Button>
              <div>
                <h1 className="text-2xl font-bold text-gray-800">My Sticker Book 📚</h1>
                <p className="text-gray-600">Collect amazing stickers and unlock achievements!</p>
              </div>
            </div>
            <Badge className="bg-purple-100 text-purple-800 text-lg px-4 py-2">
              {earnedStickers.length}/{allStickers.length} Collected
            </Badge>
          </div>
          
          {/* Progress Bar */}
          <div className="mb-4">
            <div className="flex justify-between text-sm text-gray-600 mb-2">
              <span>Collection Progress</span>
              <span>{completionPercentage}%</span>
            </div>
            <Progress value={completionPercentage} className="h-3" />
          </div>
        </div>
      </div>

      <div className="max-w-6xl mx-auto p-6">
        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardContent className="p-6 text-center">
              <div className="w-12 h-12 bg-gradient-to-r from-blue-400 to-purple-500 rounded-full flex items-center justify-center mx-auto mb-3">
                <Star className="h-6 w-6 text-white" />
              </div>
              <div className="text-2xl font-bold text-gray-800">{earnedStickers.length}</div>
              <p className="text-gray-600">Stickers Earned</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardContent className="p-6 text-center">
              <div className="w-12 h-12 bg-gradient-to-r from-green-400 to-blue-500 rounded-full flex items-center justify-center mx-auto mb-3">
                <Trophy className="h-6 w-6 text-white" />
              </div>
              <div className="text-2xl font-bold text-gray-800">
                {achievements.filter(a => a.completed).length}
              </div>
              <p className="text-gray-600">Achievements</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardContent className="p-6 text-center">
              <div className="w-12 h-12 bg-gradient-to-r from-yellow-400 to-orange-500 rounded-full flex items-center justify-center mx-auto mb-3">
                <Crown className="h-6 w-6 text-white" />
              </div>
              <div className="text-2xl font-bold text-gray-800">
                {earnedStickers.filter(s => s.rarity === 'legendary' || s.rarity === 'epic').length}
              </div>
              <p className="text-gray-600">Rare Stickers</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardContent className="p-6 text-center">
              <div className="w-12 h-12 bg-gradient-to-r from-pink-400 to-red-500 rounded-full flex items-center justify-center mx-auto mb-3">
                <Heart className="h-6 w-6 text-white" />
              </div>
              <div className="text-2xl font-bold text-gray-800">15</div>
              <p className="text-gray-600">Days Active</p>
            </CardContent>
          </Card>
        </div>

        {/* Tabs */}
        <div className="flex gap-4 mb-8">
          <Button
            onClick={() => setActiveTab('stickers')}
            className={`px-6 py-3 rounded-full font-medium transition-all ${
              activeTab === 'stickers'
                ? 'bg-gradient-to-r from-blue-500 to-purple-600 text-white shadow-lg'
                : 'bg-white/70 text-gray-700 hover:bg-white/90'
            }`}
          >
            <Sparkles className="h-4 w-4 mr-2" />
            My Stickers
          </Button>
          <Button
            onClick={() => setActiveTab('achievements')}
            className={`px-6 py-3 rounded-full font-medium transition-all ${
              activeTab === 'achievements'
                ? 'bg-gradient-to-r from-blue-500 to-purple-600 text-white shadow-lg'
                : 'bg-white/70 text-gray-700 hover:bg-white/90'
            }`}
          >
            <Trophy className="h-4 w-4 mr-2" />
            Achievements
          </Button>
        </div>

        {/* Stickers Tab */}
        {activeTab === 'stickers' && (
          <div className="space-y-6">
            {/* Category Filter */}
            <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
              <CardContent className="p-6">
                <h3 className="text-lg font-bold text-gray-800 mb-4">Filter by Category</h3>
                <div className="flex flex-wrap gap-3">
                  {categories.map((category) => (
                    <button
                      key={category.id}
                      onClick={() => setSelectedCategory(category.id)}
                      className={`
                        px-4 py-2 rounded-full border-2 transition-all transform hover:scale-105
                        ${selectedCategory === category.id
                          ? 'bg-blue-500 text-white border-blue-500 shadow-lg'
                          : 'bg-white border-gray-200 text-gray-700 hover:border-blue-300'
                        }
                      `}
                    >
                      {category.emoji} {category.name}
                    </button>
                  ))}
                </div>
              </CardContent>
            </Card>

            {/* Stickers Grid */}
            <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-xl">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Star className="h-6 w-6 text-yellow-500" />
                  {selectedCategory === 'all' ? 'All Stickers' : categories.find(c => c.id === selectedCategory)?.name}
                </CardTitle>
              </CardHeader>
              <CardContent className="p-6">
                <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                  {filteredStickers.map((sticker) => (
                    <div
                      key={sticker.id}
                      className={`
                        relative p-4 rounded-xl border-2 transition-all transform hover:scale-105 cursor-pointer
                        ${sticker.earnedDate 
                          ? 'bg-white border-gray-200 shadow-lg hover:shadow-xl' 
                          : 'bg-gray-100 border-gray-300 opacity-60'
                        }
                      `}
                    >
                      {sticker.earnedDate ? (
                        <>
                          <div className={`w-16 h-16 bg-gradient-to-r ${getRarityColor(sticker.rarity)} rounded-full flex items-center justify-center text-2xl mx-auto mb-3 shadow-lg`}>
                            {sticker.emoji}
                          </div>
                          <h4 className="font-bold text-center text-gray-800 text-sm mb-1">{sticker.name}</h4>
                          <Badge className={`${getRarityBadgeColor(sticker.rarity)} w-full justify-center text-xs`}>
                            {sticker.rarity}
                          </Badge>
                          <p className="text-xs text-gray-600 text-center mt-2">{sticker.description}</p>
                          {sticker.earnedDate && (
                            <p className="text-xs text-gray-500 text-center mt-1">
                              Earned {new Date(sticker.earnedDate).toLocaleDateString()}
                            </p>
                          )}
                        </>
                      ) : (
                        <>
                          <div className="w-16 h-16 bg-gray-300 rounded-full flex items-center justify-center text-2xl mx-auto mb-3">
                            <Lock className="h-6 w-6 text-gray-500" />
                          </div>
                          <h4 className="font-bold text-center text-gray-600 text-sm mb-1">{sticker.name}</h4>
                          <Badge className="bg-gray-200 text-gray-600 w-full justify-center text-xs">
                            Locked
                          </Badge>
                          <p className="text-xs text-gray-500 text-center mt-2">{sticker.description}</p>
                        </>
                      )}
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </div>
        )}

        {/* Achievements Tab */}
        {activeTab === 'achievements' && (
          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-xl">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Trophy className="h-6 w-6 text-yellow-500" />
                My Achievements
              </CardTitle>
            </CardHeader>
            <CardContent className="p-6">
              <div className="space-y-4">
                {achievements.map((achievement) => (
                  <div
                    key={achievement.id}
                    className={`
                      p-6 rounded-xl border-2 transition-all
                      ${achievement.completed 
                        ? 'bg-gradient-to-r from-green-50 to-blue-50 border-green-300' 
                        : 'bg-white border-gray-200'
                      }
                    `}
                  >
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-4">
                        <div className={`
                          w-12 h-12 rounded-full flex items-center justify-center
                          ${achievement.completed 
                            ? 'bg-gradient-to-r from-green-400 to-blue-500 text-white' 
                            : 'bg-gray-200 text-gray-500'
                          }
                        `}>
                          <achievement.icon className="h-6 w-6" />
                        </div>
                        <div>
                          <h4 className="font-bold text-gray-800">{achievement.name}</h4>
                          <p className="text-gray-600 text-sm">{achievement.description}</p>
                        </div>
                      </div>
                      <div className="text-right">
                        {achievement.completed ? (
                          <div className="flex items-center gap-2">
                            <Badge className="bg-green-100 text-green-800">Complete!</Badge>
                            {achievement.reward && (
                              <div className="text-2xl">{achievement.reward}</div>
                            )}
                          </div>
                        ) : (
                          <div>
                            <div className="text-sm text-gray-600 mb-2">
                              {achievement.progress}/{achievement.maxProgress}
                            </div>
                            <Progress 
                              value={(achievement.progress / achievement.maxProgress) * 100} 
                              className="w-24 h-2"
                            />
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        )}

        {/* Motivational Message */}
        <Card className="bg-gradient-to-r from-yellow-200 via-pink-200 to-purple-200 border-0 shadow-lg mt-8">
          <CardContent className="p-6 text-center">
            <Sparkles className="h-8 w-8 text-purple-600 mx-auto mb-4" />
            <h3 className="text-lg font-bold text-gray-800 mb-2">Keep Going, Superstar! ⭐</h3>
            <p className="text-gray-700">
              Every sticker tells a story about your amazing journey of understanding your feelings. 
              You're doing such incredible work!
            </p>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}