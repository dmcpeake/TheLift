import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { 
  ArrowLeft, 
  Users, 
  Heart, 
  Star, 
  MessageCircle, 
  Award,
  Smile,
  Sun,
  Sparkles,
  Shield,
  ThumbsUp
} from 'lucide-react'

interface CommunityPost {
  id: string
  type: 'achievement' | 'mood' | 'garden' | 'encouragement'
  childName: string
  avatar: string
  content: string
  timestamp: string
  likes: number
  sticker?: string
}

interface Encouragement {
  id: string
  message: string
  emoji: string
  category: 'positive' | 'support' | 'celebration'
}

export function Community() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [activeTab, setActiveTab] = useState<'feed' | 'encourage'>('feed')
  const [selectedEncouragement, setSelectedEncouragement] = useState<string | null>(null)

  const communityPosts: CommunityPost[] = [
    {
      id: '1',
      type: 'achievement',
      childName: 'Emma S.',
      avatar: '🌸',
      content: 'I earned my first Rainbow sticker today! Feeling all the emotions is okay!',
      timestamp: '2 hours ago',
      likes: 8,
      sticker: '🌈'
    },
    {
      id: '2', 
      type: 'garden',
      childName: 'Jake L.',
      avatar: '🌟',
      content: 'My Happiness Flower bloomed today! It grew so big and beautiful!',
      timestamp: '4 hours ago',
      likes: 12,
      sticker: '🌻'
    },
    {
      id: '3',
      type: 'mood',
      childName: 'Sofia M.',
      avatar: '🦋',
      content: 'Had a tough day but my check-in helped me feel better. My garden is growing!',
      timestamp: '1 day ago',
      likes: 15,
      sticker: '💪'
    },
    {
      id: '4',
      type: 'achievement',
      childName: 'Alex R.',
      avatar: '⭐',
      content: 'Completed my 7-day streak! I feel so proud of myself!',
      timestamp: '1 day ago',
      likes: 20,
      sticker: '🔥'
    },
    {
      id: '5',
      type: 'encouragement',
      childName: 'Maya C.',
      avatar: '🌺',
      content: 'Remember: Every feeling is valid and you are amazing just as you are!',
      timestamp: '2 days ago',
      likes: 25
    }
  ]

  const encouragements: Encouragement[] = [
    { id: '1', message: 'You are amazing!', emoji: '⭐', category: 'positive' },
    { id: '2', message: 'Keep being awesome!', emoji: '💪', category: 'positive' },
    { id: '3', message: 'You are brave!', emoji: '🦁', category: 'support' },
    { id: '4', message: 'So proud of you!', emoji: '🏆', category: 'celebration' },
    { id: '5', message: 'You make a difference!', emoji: '🌟', category: 'positive' },
    { id: '6', message: 'Keep growing!', emoji: '🌱', category: 'support' },
    { id: '7', message: 'You are loved!', emoji: '❤️', category: 'support' },
    { id: '8', message: 'Fantastic work!', emoji: '🎉', category: 'celebration' },
    { id: '9', message: 'Believe in yourself!', emoji: '🌈', category: 'positive' },
    { id: '10', message: 'You are enough!', emoji: '💖', category: 'support' }
  ]

  const getPostTypeIcon = (type: string) => {
    switch (type) {
      case 'achievement': return Award
      case 'mood': return Heart
      case 'garden': return Sun
      case 'encouragement': return MessageCircle
      default: return Star
    }
  }

  const getPostTypeColor = (type: string) => {
    switch (type) {
      case 'achievement': return 'from-yellow-400 to-orange-500'
      case 'mood': return 'from-pink-400 to-red-500' 
      case 'garden': return 'from-green-400 to-blue-500'
      case 'encouragement': return 'from-purple-400 to-pink-500'
      default: return 'from-blue-400 to-purple-500'
    }
  }

  const handleSendEncouragement = (encouragementId: string) => {
    setSelectedEncouragement(encouragementId)
    // Simulate sending encouragement
    setTimeout(() => {
      setSelectedEncouragement(null)
      // Show success message or animation
    }, 1000)
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-100 via-purple-50 to-pink-100">
      {/* Header */}
      <div className="bg-white/80 backdrop-blur-sm border-b border-white/20 p-4">
        <div className="max-w-4xl mx-auto">
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
                <h1 className="text-2xl font-bold text-gray-800">Community 🌟</h1>
                <p className="text-gray-600">Share your journey and support friends!</p>
              </div>
            </div>
            <Badge className="bg-purple-100 text-purple-800 flex items-center gap-2">
              <Shield className="h-4 w-4" />
              Safe Space
            </Badge>
          </div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto p-6">
        {/* Safety Notice */}
        <Card className="bg-gradient-to-r from-green-200 to-blue-200 border-0 shadow-lg mb-6">
          <CardContent className="p-4">
            <div className="flex items-center gap-3">
              <Shield className="h-6 w-6 text-green-700" />
              <div>
                <h3 className="font-bold text-green-800">Safe & Kind Community</h3>
                <p className="text-green-700 text-sm">
                  This is a safe space where we celebrate each other's growth and share positive energy!
                </p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Tabs */}
        <div className="flex gap-4 mb-8">
          <Button
            onClick={() => setActiveTab('feed')}
            className={`px-6 py-3 rounded-full font-medium transition-all ${
              activeTab === 'feed'
                ? 'bg-gradient-to-r from-blue-500 to-purple-600 text-white shadow-lg'
                : 'bg-white/70 text-gray-700 hover:bg-white/90'
            }`}
          >
            <Users className="h-4 w-4 mr-2" />
            Community Feed
          </Button>
          <Button
            onClick={() => setActiveTab('encourage')}
            className={`px-6 py-3 rounded-full font-medium transition-all ${
              activeTab === 'encourage'
                ? 'bg-gradient-to-r from-blue-500 to-purple-600 text-white shadow-lg'
                : 'bg-white/70 text-gray-700 hover:bg-white/90'
            }`}
          >
            <Heart className="h-4 w-4 mr-2" />
            Send Encouragement
          </Button>
        </div>

        {/* Community Feed Tab */}
        {activeTab === 'feed' && (
          <div className="space-y-6">
            <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
              <CardHeader>
                <CardTitle className="flex items-center gap-2 text-blue-600">
                  <Users className="h-6 w-6" />
                  What's Happening
                </CardTitle>
              </CardHeader>
              <CardContent className="p-6">
                <div className="space-y-4">
                  {communityPosts.map((post) => {
                    const PostIcon = getPostTypeIcon(post.type)
                    return (
                      <div key={post.id} className="bg-white rounded-lg p-4 border border-gray-100 shadow-sm">
                        <div className="flex items-start gap-4">
                          <div className={`w-12 h-12 bg-gradient-to-r ${getPostTypeColor(post.type)} rounded-full flex items-center justify-center text-white text-xl shadow-lg`}>
                            {post.avatar}
                          </div>
                          <div className="flex-1">
                            <div className="flex items-center gap-3 mb-2">
                              <h4 className="font-bold text-gray-800">{post.childName}</h4>
                              <div className={`w-6 h-6 bg-gradient-to-r ${getPostTypeColor(post.type)} rounded-full flex items-center justify-center`}>
                                <PostIcon className="h-3 w-3 text-white" />
                              </div>
                              <span className="text-xs text-gray-500">{post.timestamp}</span>
                            </div>
                            <p className="text-gray-700 mb-3">{post.content}</p>
                            <div className="flex items-center justify-between">
                              <div className="flex items-center gap-4">
                                <button className="flex items-center gap-2 px-3 py-1 bg-pink-100 hover:bg-pink-200 rounded-full transition-colors">
                                  <ThumbsUp className="h-4 w-4 text-pink-600" />
                                  <span className="text-sm text-pink-700">{post.likes}</span>
                                </button>
                                {post.sticker && (
                                  <div className="flex items-center gap-1">
                                    <span className="text-lg">{post.sticker}</span>
                                    <span className="text-xs text-gray-500">earned</span>
                                  </div>
                                )}
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    )
                  })}
                </div>
              </CardContent>
            </Card>

            {/* Inspiration Card */}
            <Card className="bg-gradient-to-r from-yellow-200 via-pink-200 to-purple-200 border-0 shadow-lg">
              <CardContent className="p-6 text-center">
                <Sparkles className="h-8 w-8 text-purple-600 mx-auto mb-4" />
                <h3 className="text-lg font-bold text-gray-800 mb-2">You Inspire Others! ✨</h3>
                <p className="text-gray-700">
                  When you share your journey, you help other children feel brave and supported. 
                  Your story matters!
                </p>
              </CardContent>
            </Card>
          </div>
        )}

        {/* Send Encouragement Tab */}
        {activeTab === 'encourage' && (
          <div className="space-y-6">
            <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-xl">
              <CardHeader>
                <CardTitle className="flex items-center gap-2 text-pink-600">
                  <Heart className="h-6 w-6" />
                  Send Some Love
                </CardTitle>
                <p className="text-gray-600">Choose a message to send to someone who might need encouragement!</p>
              </CardHeader>
              <CardContent className="p-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  {encouragements.map((encouragement) => (
                    <button
                      key={encouragement.id}
                      onClick={() => handleSendEncouragement(encouragement.id)}
                      disabled={selectedEncouragement === encouragement.id}
                      className={`
                        p-4 rounded-xl border-2 transition-all transform hover:scale-105 text-left
                        ${selectedEncouragement === encouragement.id
                          ? 'bg-green-100 border-green-400 scale-105'
                          : 'bg-white border-gray-200 hover:border-pink-300 hover:shadow-lg'
                        }
                      `}
                    >
                      <div className="flex items-center gap-3">
                        <div className="text-3xl">{encouragement.emoji}</div>
                        <div className="flex-1">
                          <p className="font-medium text-gray-800">{encouragement.message}</p>
                          <Badge className={`mt-1 text-xs ${
                            encouragement.category === 'positive' ? 'bg-blue-100 text-blue-700' :
                            encouragement.category === 'support' ? 'bg-green-100 text-green-700' :
                            'bg-purple-100 text-purple-700'
                          }`}>
                            {encouragement.category}
                          </Badge>
                        </div>
                        {selectedEncouragement === encouragement.id && (
                          <div className="text-green-600">
                            <div className="animate-spin rounded-full h-5 w-5 border-2 border-green-600 border-t-transparent" />
                          </div>
                        )}
                      </div>
                    </button>
                  ))}
                </div>
              </CardContent>
            </Card>

            {/* How It Works */}
            <Card className="bg-gradient-to-r from-blue-200 to-purple-200 border-0 shadow-lg">
              <CardContent className="p-6">
                <h3 className="text-lg font-bold text-gray-800 mb-4 flex items-center gap-2">
                  <MessageCircle className="h-5 w-5" />
                  How Encouragement Works
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div className="text-center">
                    <div className="w-12 h-12 bg-blue-500 rounded-full flex items-center justify-center mx-auto mb-3">
                      <span className="text-white font-bold">1</span>
                    </div>
                    <h4 className="font-medium text-gray-800 mb-1">Choose Message</h4>
                    <p className="text-sm text-gray-600">Pick an encouraging message that feels right to you</p>
                  </div>
                  <div className="text-center">
                    <div className="w-12 h-12 bg-purple-500 rounded-full flex items-center justify-center mx-auto mb-3">
                      <span className="text-white font-bold">2</span>
                    </div>
                    <h4 className="font-medium text-gray-800 mb-1">Send Safely</h4>
                    <p className="text-sm text-gray-600">Your message is shared anonymously and kindly</p>
                  </div>
                  <div className="text-center">
                    <div className="w-12 h-12 bg-pink-500 rounded-full flex items-center justify-center mx-auto mb-3">
                      <span className="text-white font-bold">3</span>
                    </div>
                    <h4 className="font-medium text-gray-800 mb-1">Spread Joy</h4>
                    <p className="text-sm text-gray-600">Someone receives your kind words and feels supported</p>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        )}

        {/* Bottom Message */}
        <div className="mt-8 text-center">
          <p className="text-gray-600 italic text-lg">
            "Together we grow stronger, kinder, and more understanding! 💕"
          </p>
        </div>
      </div>
    </div>
  )
}