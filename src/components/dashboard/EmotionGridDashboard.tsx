import React, { useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import {
  LineChart, Line, AreaChart, Area, ScatterChart, Scatter,
  XAxis, YAxis, CartesianGrid, Tooltip, Legend,
  ResponsiveContainer, Cell, PieChart, Pie, RadialBarChart, RadialBar
} from 'recharts'
import { getSupabaseClient } from '../../utils/supabase/client.tsx'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { DataLoader } from '../shared/LottieLoader'
import {
  TrendingUp, TrendingDown, AlertCircle, Heart,
  Smile, Frown, Meh, Sparkles, Users, Activity,
  ChevronUp, ChevronDown, Calendar, User, CheckCircle
} from 'lucide-react'

const supabase = getSupabaseClient()

// Emotion quadrant colors (energy/comfort grid)
const EMOTION_COLORS = {
  'high-energy-comfortable': '#10B981', // Emerald - Happy, Excited
  'low-energy-comfortable': '#3B82F6',  // Blue - Calm, Peaceful
  'high-energy-uncomfortable': '#F59E0B', // Amber - Angry, Frustrated
  'low-energy-uncomfortable': '#EF4444'  // Red - Sad, Tired
}

const MOOD_GRADIENT = [
  { value: 1, color: '#DC2626', emoji: '😢', label: 'Very Sad' },
  { value: 2, color: '#F97316', emoji: '😕', label: 'Sad' },
  { value: 3, color: '#FCD34D', emoji: '😐', label: 'OK' },
  { value: 4, color: '#86EFAC', emoji: '🙂', label: 'Happy' },
  { value: 5, color: '#10B981', emoji: '😊', label: 'Very Happy' }
]

interface EmotionData {
  date: string
  timestamp: string
  childId: string
  childName: string
  feelings: string[]
  categories: string[]
  explanation?: string
  moodScore?: number
  dominantEmotion?: string
}

interface ChildTrend {
  id: string
  name: string
  currentMood: number
  trend: 'improving' | 'declining' | 'stable'
  lastWeekAvg: number
  thisWeekAvg: number
  concernLevel: 'high' | 'medium' | 'low' | 'none'
  recentEmotions: string[]
  lastSeen: string
}

interface GroupMood {
  overall: number
  distribution: { category: string; count: number; percentage: number }[]
  timeOfDay: { hour: number; mood: number }[]
  trending: 'up' | 'down' | 'stable'
}

interface EmotionGridDashboardProps {
  selectedOrg?: string
  dateRange?: 'week' | 'month' | 'all'
}

export function EmotionGridDashboard({ selectedOrg = 'all', dateRange = 'week' }: EmotionGridDashboardProps) {
  const [loading, setLoading] = useState(true)
  const [emotionData, setEmotionData] = useState<EmotionData[]>([])
  const [childTrends, setChildTrends] = useState<ChildTrend[]>([])
  const [groupMood, setGroupMood] = useState<GroupMood | null>(null)
  const [selectedChild, setSelectedChild] = useState<string | null>(null)

  useEffect(() => {
    loadEmotionData()
  }, [dateRange, selectedOrg])

  const loadEmotionData = async () => {
    try {
      setLoading(true)

      console.log('Loading emotion data with:', { selectedOrg, dateRange })

      // Get date range
      const now = new Date()
      let startDate = new Date()

      if (dateRange === 'week') {
        startDate.setDate(now.getDate() - 7)
      } else if (dateRange === 'month') {
        startDate.setDate(now.getDate() - 30)
      } else {
        startDate.setFullYear(now.getFullYear() - 1)
      }

      console.log('Date range:', { startDate: startDate.toISOString(), now: now.toISOString() })

      // Fetch emotion grid data - simplified query first
      let emotionQuery = supabase
        .from('emotion_grid_usage')
        .select('*')
        .gte('created_at', startDate.toISOString())
        .order('created_at', { ascending: false })

      if (selectedOrg && selectedOrg !== 'all') {
        emotionQuery = emotionQuery.eq('org_id', selectedOrg)
      }

      const { data: emotionGridData, error: emotionError } = await emotionQuery

      console.log('Emotion grid data:', {
        count: emotionGridData?.length || 0,
        data: emotionGridData,
        error: emotionError
      })

      if (emotionError) throw emotionError

      // Fetch mood data
      let moodQuery = supabase
        .from('mood_meter_usage')
        .select('*')
        .gte('created_at', startDate.toISOString())
        .order('created_at', { ascending: false })

      if (selectedOrg && selectedOrg !== 'all') {
        moodQuery = moodQuery.eq('org_id', selectedOrg)
      }

      const { data: moodData, error: moodError } = await moodQuery

      console.log('Mood meter data:', {
        count: moodData?.length || 0,
        data: moodData,
        error: moodError
      })

      if (moodError) throw moodError

      // Also fetch emotion_grid_feelings separately to understand the data
      const { data: feelingsData, error: feelingsError } = await supabase
        .from('emotion_grid_feelings')
        .select('*')

      console.log('Available feelings:', {
        count: feelingsData?.length || 0,
        data: feelingsData,
        error: feelingsError
      })

      // Fetch child profiles
      const childIds = [...new Set([
        ...(emotionGridData?.map(e => e.child_id) || []),
        ...(moodData?.map(m => m.child_id) || [])
      ])]

      const { data: children } = await supabase
        .from('profiles')
        .select('id, name')
        .in('id', childIds)

      const childNames = new Map(children?.map(c => [c.id, c.name]) || [])

      // Process emotion data
      const processed: EmotionData[] = []

      // Process emotion grid data if available, otherwise use mood data
      if (emotionGridData && emotionGridData.length > 0) {
        emotionGridData.forEach(item => {
          // For now, use mock data based on item properties
          const feelings: string[] = ['Happy', 'Excited'] // Placeholder
          const categories: string[] = ['high-energy-comfortable'] // Placeholder

          // Find corresponding mood score
          const mood = moodData?.find(m =>
            m.child_id === item.child_id &&
            Math.abs(new Date(m.created_at).getTime() - new Date(item.created_at).getTime()) < 3600000 // Within 1 hour
          )

          processed.push({
            date: new Date(item.created_at).toLocaleDateString(),
            timestamp: item.created_at,
            childId: item.child_id,
            childName: childNames.get(item.child_id) || 'Unknown',
            feelings,
            categories,
            explanation: item.explanation_text,
            moodScore: mood?.mood_numeric,
            dominantEmotion: categories[0] // First selected is usually dominant
          })
        })
      }

      // Also process mood data as emotion data if no emotion grid data
      if ((!emotionGridData || emotionGridData.length === 0) && moodData && moodData.length > 0) {
        moodData.forEach(item => {
          // Map mood levels to emotion categories
          const moodToCategory: Record<number, string> = {
            1: 'low-energy-uncomfortable',
            2: 'low-energy-uncomfortable',
            3: 'low-energy-comfortable',
            4: 'high-energy-comfortable',
            5: 'high-energy-comfortable'
          }

          const moodToFeelings: Record<number, string[]> = {
            1: ['Sad', 'Tired'],
            2: ['Disappointed', 'Lonely'],
            3: ['Calm', 'Content'],
            4: ['Happy', 'Playful'],
            5: ['Excited', 'Joyful']
          }

          processed.push({
            date: new Date(item.created_at).toLocaleDateString(),
            timestamp: item.created_at,
            childId: item.child_id,
            childName: childNames.get(item.child_id) || 'Unknown',
            feelings: moodToFeelings[item.mood_numeric] || ['Unknown'],
            categories: [moodToCategory[item.mood_numeric] || 'unknown'],
            explanation: item.notes,
            moodScore: item.mood_numeric,
            dominantEmotion: moodToCategory[item.mood_numeric] || 'unknown'
          })
        })
      }

      console.log('Processed emotion data:', {
        count: processed.length,
        data: processed,
        sampleItem: processed[0]
      })

      setEmotionData(processed)
      analyzeChildTrends(processed)
      calculateGroupMood(processed)

    } catch (error) {
      console.error('Error loading emotion data:', error)
    } finally {
      setLoading(false)
    }
  }

  const analyzeChildTrends = (data: EmotionData[]) => {
    const childMap = new Map<string, EmotionData[]>()

    // Group by child
    data.forEach(item => {
      if (!childMap.has(item.childId)) {
        childMap.set(item.childId, [])
      }
      childMap.get(item.childId)?.push(item)
    })

    const trends: ChildTrend[] = []
    const now = new Date()
    const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)

    childMap.forEach((childData, childId) => {
      const sortedData = childData.sort((a, b) =>
        new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime()
      )

      const thisWeek = sortedData.filter(d => new Date(d.timestamp) > weekAgo)
      const lastWeek = sortedData.filter(d => new Date(d.timestamp) <= weekAgo).slice(0, thisWeek.length)

      const thisWeekMoods = thisWeek.filter(d => d.moodScore).map(d => d.moodScore!)
      const lastWeekMoods = lastWeek.filter(d => d.moodScore).map(d => d.moodScore!)

      const thisWeekAvg = thisWeekMoods.length > 0
        ? thisWeekMoods.reduce((a, b) => a + b, 0) / thisWeekMoods.length
        : 3

      const lastWeekAvg = lastWeekMoods.length > 0
        ? lastWeekMoods.reduce((a, b) => a + b, 0) / lastWeekMoods.length
        : 3

      // Determine trend
      let trend: 'improving' | 'declining' | 'stable' = 'stable'
      if (thisWeekAvg > lastWeekAvg + 0.5) trend = 'improving'
      else if (thisWeekAvg < lastWeekAvg - 0.5) trend = 'declining'

      // Determine concern level
      let concernLevel: 'high' | 'medium' | 'low' | 'none' = 'none'
      const recentNegativeEmotions = thisWeek.filter(d =>
        d.categories.some(c => c.includes('uncomfortable'))
      ).length

      if (thisWeekAvg < 2 || recentNegativeEmotions > thisWeek.length * 0.7) {
        concernLevel = 'high'
      } else if (thisWeekAvg < 3 || recentNegativeEmotions > thisWeek.length * 0.5) {
        concernLevel = 'medium'
      } else if (trend === 'declining') {
        concernLevel = 'low'
      }

      trends.push({
        id: childId,
        name: sortedData[0]?.childName || 'Unknown',
        currentMood: thisWeekAvg,
        trend,
        lastWeekAvg,
        thisWeekAvg,
        concernLevel,
        recentEmotions: thisWeek.slice(0, 5).flatMap(d => d.feelings),
        lastSeen: sortedData[0]?.date || 'Never'
      })
    })

    // Sort by concern level
    trends.sort((a, b) => {
      const levels = { high: 0, medium: 1, low: 2, none: 3 }
      return levels[a.concernLevel] - levels[b.concernLevel]
    })

    setChildTrends(trends)
  }

  const calculateGroupMood = (data: EmotionData[]) => {
    // Overall mood
    const moodScores = data.filter(d => d.moodScore).map(d => d.moodScore!)
    const overall = moodScores.length > 0
      ? moodScores.reduce((a, b) => a + b, 0) / moodScores.length
      : 3

    // Category distribution
    const categoryCount = new Map<string, number>()
    data.forEach(item => {
      item.categories.forEach(cat => {
        categoryCount.set(cat, (categoryCount.get(cat) || 0) + 1)
      })
    })

    const total = Array.from(categoryCount.values()).reduce((a, b) => a + b, 0)
    const distribution = Array.from(categoryCount.entries()).map(([category, count]) => ({
      category: category.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' '),
      count,
      percentage: (count / total) * 100
    }))

    // Time of day analysis
    const hourlyMood = new Map<number, number[]>()
    data.forEach(item => {
      if (item.moodScore) {
        const hour = new Date(item.timestamp).getHours()
        if (!hourlyMood.has(hour)) {
          hourlyMood.set(hour, [])
        }
        hourlyMood.get(hour)?.push(item.moodScore)
      }
    })

    const timeOfDay = Array.from(hourlyMood.entries()).map(([hour, moods]) => ({
      hour,
      mood: moods.reduce((a, b) => a + b, 0) / moods.length
    })).sort((a, b) => a.hour - b.hour)

    // Trending
    const recentData = data.slice(0, Math.floor(data.length / 2))
    const olderData = data.slice(Math.floor(data.length / 2))

    const recentAvg = recentData.filter(d => d.moodScore)
      .reduce((sum, d) => sum + d.moodScore!, 0) / (recentData.length || 1)
    const olderAvg = olderData.filter(d => d.moodScore)
      .reduce((sum, d) => sum + d.moodScore!, 0) / (olderData.length || 1)

    let trending: 'up' | 'down' | 'stable' = 'stable'
    if (recentAvg > olderAvg + 0.3) trending = 'up'
    else if (recentAvg < olderAvg - 0.3) trending = 'down'

    setGroupMood({
      overall,
      distribution,
      timeOfDay,
      trending
    })
  }

  const CustomTooltip = ({ active, payload, label }: any) => {
    if (active && payload && payload.length) {
      return (
        <div className="bg-white p-3 rounded-lg shadow-xl border border-gray-200">
          <p className="font-semibold">{label}</p>
          {payload.map((entry: any, index: number) => (
            <p key={index} className="text-sm">
              <span style={{ color: entry.color }}>{entry.name}:</span> {entry.value.toFixed(1)}
            </p>
          ))}
        </div>
      )
    }
    return null
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center p-8">
        <DataLoader message="Loading emotion data..." />
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h2 className="text-2xl font-bold text-gray-900">Emotion & Mood Tracker</h2>
        <p className="text-gray-600">Real-time emotional wellbeing insights</p>
      </div>

      {/* Group Mood Overview */}
      {groupMood && (
        <Card className="bg-gradient-to-r from-blue-50 to-green-50 border-0 shadow-lg">
          <CardHeader>
            <CardTitle className="flex items-center justify-between">
              <span className="flex items-center gap-2">
                <Sparkles className="h-5 w-5 text-yellow-500" />
                Group Mood Overview
              </span>
              <div className="flex items-center gap-2">
                {groupMood.trending === 'up' && <TrendingUp className="h-5 w-5 text-green-600" />}
                {groupMood.trending === 'down' && <TrendingDown className="h-5 w-5 text-red-600" />}
                {groupMood.trending === 'stable' && <Activity className="h-5 w-5 text-gray-600" />}
                <span className="text-sm font-normal text-gray-600">
                  {groupMood.trending === 'up' ? 'Improving' :
                   groupMood.trending === 'down' ? 'Declining' : 'Stable'}
                </span>
              </div>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {/* Overall Mood Gauge */}
              <div className="flex flex-col items-center">
                <div className="relative w-32 h-32">
                  <svg className="w-full h-full transform -rotate-90">
                    <circle
                      cx="64"
                      cy="64"
                      r="56"
                      stroke="#e5e7eb"
                      strokeWidth="12"
                      fill="none"
                    />
                    <circle
                      cx="64"
                      cy="64"
                      r="56"
                      stroke={MOOD_GRADIENT[Math.round(groupMood.overall) - 1]?.color || '#FCD34D'}
                      strokeWidth="12"
                      fill="none"
                      strokeDasharray={`${(groupMood.overall / 5) * 351.86} 351.86`}
                      strokeLinecap="round"
                    />
                  </svg>
                  <div className="absolute inset-0 flex flex-col items-center justify-center">
                    <span className="text-3xl">
                      {MOOD_GRADIENT[Math.round(groupMood.overall) - 1]?.emoji || '😐'}
                    </span>
                    <span className="text-lg font-bold text-gray-800">
                      {groupMood.overall.toFixed(1)}
                    </span>
                  </div>
                </div>
                <p className="text-sm text-gray-600 mt-2">Overall Mood</p>
              </div>

              {/* Emotion Distribution */}
              <div className="col-span-2">
                <h4 className="text-sm font-medium text-gray-700 mb-3">Emotion Distribution</h4>
                <div className="space-y-2">
                  {groupMood.distribution.map((item, index) => (
                    <div key={index} className="flex items-center gap-2">
                      <div
                        className="w-4 h-4 rounded"
                        style={{
                          backgroundColor: EMOTION_COLORS[item.category.toLowerCase().replace(/ /g, '-') as keyof typeof EMOTION_COLORS] || '#6B7280'
                        }}
                      />
                      <span className="text-sm text-gray-700 flex-1">{item.category}</span>
                      <div className="w-32 bg-gray-200 rounded-full h-2">
                        <div
                          className="h-2 rounded-full transition-all"
                          style={{
                            width: `${item.percentage}%`,
                            backgroundColor: EMOTION_COLORS[item.category.toLowerCase().replace(/ /g, '-') as keyof typeof EMOTION_COLORS] || '#6B7280'
                          }}
                        />
                      </div>
                      <span className="text-sm text-gray-600 w-12 text-right">
                        {item.percentage.toFixed(0)}%
                      </span>
                    </div>
                  ))}
                </div>
              </div>
            </div>

            {/* Time of Day Mood Chart */}
            {groupMood.timeOfDay.length > 0 && (
              <div className="mt-6">
                <h4 className="text-sm font-medium text-gray-700 mb-3">Mood Throughout the Day</h4>
                <ResponsiveContainer width="100%" height={150}>
                  <AreaChart data={groupMood.timeOfDay}>
                    <defs>
                      <linearGradient id="colorMood" x1="0" y1="0" x2="0" y2="1">
                        <stop offset="5%" stopColor="#3B82F6" stopOpacity={0.8}/>
                        <stop offset="95%" stopColor="#3B82F6" stopOpacity={0.1}/>
                      </linearGradient>
                    </defs>
                    <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                    <XAxis
                      dataKey="hour"
                      tickFormatter={(h) => `${h}:00`}
                      stroke="#6b7280"
                    />
                    <YAxis domain={[1, 5]} stroke="#6b7280" />
                    <Tooltip content={<CustomTooltip />} />
                    <Area
                      type="monotone"
                      dataKey="mood"
                      stroke="#3B82F6"
                      fillOpacity={1}
                      fill="url(#colorMood)"
                      strokeWidth={2}
                    />
                  </AreaChart>
                </ResponsiveContainer>
              </div>
            )}
          </CardContent>
        </Card>
      )}

      {/* Children Who Need Attention */}
      <Card className="border-0 shadow-lg">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <AlertCircle className="h-5 w-5 text-orange-500" />
            Children Requiring Attention
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {childTrends
              .filter(child => child.concernLevel !== 'none')
              .slice(0, 6)
              .map(child => (
                <motion.div
                  key={child.id}
                  initial={{ opacity: 0, scale: 0.95 }}
                  animate={{ opacity: 1, scale: 1 }}
                  whileHover={{ scale: 1.02 }}
                  className={`p-4 rounded-lg border-2 cursor-pointer transition-all ${
                    child.concernLevel === 'high'
                      ? 'border-red-300 bg-red-50'
                      : child.concernLevel === 'medium'
                      ? 'border-orange-300 bg-orange-50'
                      : 'border-yellow-300 bg-yellow-50'
                  }`}
                  onClick={() => setSelectedChild(child.id)}
                >
                  <div className="flex items-start justify-between mb-2">
                    <div>
                      <h4 className="font-semibold text-gray-900">{child.name}</h4>
                      <p className="text-xs text-gray-600">Last seen: {child.lastSeen}</p>
                    </div>
                    <div className="flex items-center gap-1">
                      {child.trend === 'improving' && <ChevronUp className="h-4 w-4 text-green-600" />}
                      {child.trend === 'declining' && <ChevronDown className="h-4 w-4 text-red-600" />}
                      <span className="text-2xl">
                        {MOOD_GRADIENT[Math.round(child.currentMood) - 1]?.emoji || '😐'}
                      </span>
                    </div>
                  </div>

                  <div className="space-y-2">
                    <div className="flex justify-between text-sm">
                      <span className="text-gray-600">Current Mood</span>
                      <span className="font-medium">{child.currentMood.toFixed(1)}/5</span>
                    </div>

                    <div className="flex justify-between text-sm">
                      <span className="text-gray-600">Trend</span>
                      <span className={`font-medium ${
                        child.trend === 'improving' ? 'text-green-600' :
                        child.trend === 'declining' ? 'text-red-600' :
                        'text-gray-600'
                      }`}>
                        {child.trend.charAt(0).toUpperCase() + child.trend.slice(1)}
                      </span>
                    </div>

                    {child.recentEmotions.length > 0 && (
                      <div>
                        <p className="text-xs text-gray-600 mb-1">Recent feelings:</p>
                        <div className="flex flex-wrap gap-1">
                          {child.recentEmotions.slice(0, 3).map((emotion, idx) => (
                            <span
                              key={idx}
                              className="px-2 py-1 bg-white rounded-full text-xs border border-gray-200"
                            >
                              {emotion}
                            </span>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                </motion.div>
              ))}
          </div>

          {childTrends.filter(c => c.concernLevel !== 'none').length === 0 && (
            <div className="text-center py-8">
              <CheckCircle className="h-12 w-12 text-green-500 mx-auto mb-3" />
              <p className="text-gray-600">All children are doing well!</p>
              <p className="text-sm text-gray-500">No immediate concerns detected.</p>
            </div>
          )}
        </CardContent>
      </Card>

      {/* All Children Grid */}
      <Card className="border-0 shadow-lg">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Users className="h-5 w-5 text-blue-500" />
            All Children - Mood Overview
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-3">
            {childTrends.map(child => (
              <div
                key={child.id}
                className="relative group cursor-pointer"
                onClick={() => setSelectedChild(child.id)}
              >
                <div className="text-center p-3 rounded-lg bg-gray-50 hover:bg-gray-100 transition-all">
                  <div className="text-2xl mb-1">
                    {MOOD_GRADIENT[Math.round(child.currentMood) - 1]?.emoji || '😐'}
                  </div>
                  <p className="text-xs font-medium text-gray-900 truncate">
                    {child.name}
                  </p>
                  <p className="text-xs text-gray-600">
                    {child.currentMood.toFixed(1)}
                  </p>
                  {child.trend === 'improving' && (
                    <ChevronUp className="h-3 w-3 text-green-600 mx-auto" />
                  )}
                  {child.trend === 'declining' && (
                    <ChevronDown className="h-3 w-3 text-red-600 mx-auto" />
                  )}
                </div>

                {/* Concern indicator */}
                {child.concernLevel !== 'none' && (
                  <div className={`absolute -top-1 -right-1 w-3 h-3 rounded-full ${
                    child.concernLevel === 'high' ? 'bg-red-500' :
                    child.concernLevel === 'medium' ? 'bg-orange-500' :
                    'bg-yellow-500'
                  } animate-pulse`} />
                )}
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}