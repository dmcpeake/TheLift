import React, { useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { getSupabaseClient } from '../../utils/supabase/client.tsx'
import { projectId, publicAnonKey } from '../../utils/supabase/info.tsx'
import {
  ChevronDown, ChevronRight, TrendingUp, TrendingDown,
  Calendar, Heart, Brain, MessageSquare, Sparkles,
  User, Activity, AlertCircle, Clock, Minus
} from 'lucide-react'

const supabase = getSupabaseClient()

interface Organization {
  id: string
  name: string
}

interface Child {
  id: string
  name: string
  avatar_url?: string
  initials?: string
  lastCheckIn?: string
  moodTrend?: 'improving' | 'declining' | 'stable'
  averageMood?: number
  recentMood?: number
  checkInCount?: number
}

interface CheckIn {
  id: string
  created_at: string
  mood_numeric?: number
  mood_level?: string
  notes?: string
  feelings?: string[]
  explanation?: string
}

interface AIInsights {
  summary: string
  concerns?: string[]
  strengths?: string[]
  recommendations?: string[]
  lastAnalyzed?: string
}

const MOOD_COLORS = {
  1: '#EF4444', // Red
  2: '#F97316', // Orange
  3: '#FCD34D', // Yellow
  4: '#86EFAC', // Light Green
  5: '#10B981'  // Green
}

const MOOD_EMOJIS = {
  1: '😢',
  2: '😕',
  3: '😐',
  4: '🙂',
  5: '😊'
}

// Force Tailwind to include these classes by using them in a hidden div
// This ensures all avatar colors are available in production build
const FORCE_TAILWIND_CLASSES = (
  <div className="hidden bg-blue-500 bg-green-500 bg-purple-500 bg-orange-500 bg-pink-500 bg-teal-500 bg-red-500 bg-indigo-500 bg-yellow-500 bg-cyan-500 bg-emerald-500 bg-rose-500 bg-violet-500 bg-amber-500 bg-sky-500 bg-lime-500 bg-fuchsia-500 bg-slate-500 rounded-full rounded-lg" />
)
const AVATAR_STYLES = [
  { bg: 'bg-blue-500', shape: 'rounded-full' },
  { bg: 'bg-green-500', shape: 'rounded-lg' },
  { bg: 'bg-purple-500', shape: 'rounded-full' },
  { bg: 'bg-orange-500', shape: 'rounded-lg' },
  { bg: 'bg-pink-500', shape: 'rounded-full' },
  { bg: 'bg-teal-500', shape: 'rounded-lg' },
  { bg: 'bg-red-500', shape: 'rounded-full' },
  { bg: 'bg-indigo-500', shape: 'rounded-lg' },
  { bg: 'bg-yellow-500', shape: 'rounded-full' },
  { bg: 'bg-cyan-500', shape: 'rounded-lg' },
  { bg: 'bg-emerald-500', shape: 'rounded-full' },
  { bg: 'bg-rose-500', shape: 'rounded-lg' },
  { bg: 'bg-violet-500', shape: 'rounded-full' },
  { bg: 'bg-amber-500', shape: 'rounded-lg' },
  { bg: 'bg-sky-500', shape: 'rounded-full' },
  { bg: 'bg-lime-500', shape: 'rounded-lg' },
  { bg: 'bg-fuchsia-500', shape: 'rounded-full' },
  { bg: 'bg-slate-500', shape: 'rounded-lg' }
]

export function ChildSummaryAnalytics() {
  const [organizations, setOrganizations] = useState<Organization[]>([])
  const [selectedOrg, setSelectedOrg] = useState<string>('all')
  const [children, setChildren] = useState<Child[]>([])
  const [expandedChild, setExpandedChild] = useState<string | null>(null)
  const [checkInHistory, setCheckInHistory] = useState<Record<string, CheckIn[]>>({})
  const [aiInsights, setAIInsights] = useState<Record<string, AIInsights>>({})
  const [loading, setLoading] = useState(true)
  const [loadingInsights, setLoadingInsights] = useState<Record<string, boolean>>({})

  useEffect(() => {
    loadOrganizations()
  }, [])

  useEffect(() => {
    if (selectedOrg) {
      loadChildren()
    }
  }, [selectedOrg])

  const loadOrganizations = async () => {
    try {
      const { data, error } = await supabase
        .from('organisations')  // Fixed: table name has 's'
        .select('id, name')
        .order('name')

      if (error) {
        console.error('Error loading organizations:', error)
        // Use a fallback organization if table doesn't exist
        setOrganizations([{ id: 'default', name: 'All Children' }])
        setSelectedOrg('default')
        return
      }

      if (data && data.length > 0) {
        setOrganizations(data)
        if (selectedOrg === 'all') {
          setSelectedOrg(data[0].id)
        }
      } else {
        // If no organizations exist, create a default
        setOrganizations([{ id: 'default', name: 'All Children' }])
        setSelectedOrg('default')
      }
    } catch (error) {
      console.error('Error in loadOrganizations:', error)
      setOrganizations([{ id: 'default', name: 'All Children' }])
      setSelectedOrg('default')
    }
  }

  const loadChildren = async () => {
    try {
      setLoading(true)

      // Load children profiles
      let childQuery = supabase
        .from('profiles')
        .select('*')
        .eq('role', 'Child')
        .order('name')

      // Only filter by org if it's not the default fallback
      if (selectedOrg !== 'all' && selectedOrg !== 'default') {
        childQuery = childQuery.eq('org_id', selectedOrg)
      }

      const { data: childProfiles } = await childQuery

      if (!childProfiles) {
        setChildren([])
        return
      }

      // Load all mood data for each child (not just recent)
      const childIds = childProfiles.map(c => c.id)

      const { data: moodData } = await supabase
        .from('mood_meter_usage')
        .select('*')
        .in('child_id', childIds)
        .order('created_at', { ascending: false })

      // Process children with mood data
      const processedChildren: Child[] = childProfiles.map(child => {
        const childMoods = moodData?.filter(m => m.child_id === child.id) || []
        const recentMoods = childMoods.slice(0, 10)
        const olderMoods = childMoods.slice(10, 20)

        // Calculate average moods
        const recentAvg = recentMoods.length > 0
          ? recentMoods.reduce((sum, m) => sum + m.mood_numeric, 0) / recentMoods.length
          : 0
        const olderAvg = olderMoods.length > 0
          ? olderMoods.reduce((sum, m) => sum + m.mood_numeric, 0) / olderMoods.length
          : 0

        // Determine trend
        let trend: 'improving' | 'declining' | 'stable' = 'stable'
        if (recentAvg > olderAvg + 0.3) trend = 'improving'
        else if (recentAvg < olderAvg - 0.3) trend = 'declining'

        // Get initials for avatar
        const nameParts = child.name?.split(' ') || []
        const initials = nameParts.length >= 2
          ? `${nameParts[0][0]}${nameParts[1][0]}`.toUpperCase()
          : child.name?.substring(0, 2).toUpperCase() || 'XX'

        return {
          id: child.id,
          name: child.name || 'Unknown',
          avatar_url: child.avatar_url,
          initials,
          lastCheckIn: childMoods[0]?.created_at
            ? new Date(childMoods[0].created_at).toLocaleDateString()
            : 'Never',
          moodTrend: trend,
          averageMood: recentAvg,
          recentMood: childMoods[0]?.mood_numeric,
          checkInCount: childMoods.length
        }
      })

      // Sort by those needing attention first
      processedChildren.sort((a, b) => {
        // Prioritize declining trends
        if (a.moodTrend === 'declining' && b.moodTrend !== 'declining') return -1
        if (b.moodTrend === 'declining' && a.moodTrend !== 'declining') return 1

        // Then by lowest average mood
        return (a.averageMood || 5) - (b.averageMood || 5)
      })

      setChildren(processedChildren)
    } catch (error) {
      console.error('Error loading children:', error)
    } finally {
      setLoading(false)
    }
  }

  const loadCheckInHistory = async (childId: string) => {
    // Check if already loaded
    if (checkInHistory[childId]) return

    const { data: moodData } = await supabase
      .from('mood_meter_usage')
      .select('*')
      .eq('child_id', childId)
      .order('created_at', { ascending: false })
      .limit(10) // Reduced to 10 most recent

    // Only fetch mood data, not emotion data separately to avoid duplication
    const checkIns: CheckIn[] = moodData?.map(mood => ({
      id: mood.id,
      created_at: mood.created_at,
      mood_numeric: mood.mood_numeric,
      mood_level: mood.mood_level,
      notes: mood.notes,
      feelings: [], // We don't have emotion_grid_feelings yet
      explanation: null
    })) || []

    setCheckInHistory(prev => ({
      ...prev,
      [childId]: checkIns
    }))
  }

  const loadAIInsights = async (childId: string) => {
    // Check if already loading or loaded
    if (loadingInsights[childId] || aiInsights[childId]) return

    console.log('Loading AI insights for child:', childId)
    setLoadingInsights(prev => ({ ...prev, [childId]: true }))

    try {
      // Use the correct Supabase URL and key
      const supabaseUrl = `https://${projectId}.supabase.co`

      console.log('Calling AI analysis edge function...')
      // Call the AI analysis edge function (use original until optimized is deployed)
      const response = await fetch(
        `${supabaseUrl}/functions/v1/analyze-qualitative-data`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${publicAnonKey}`
          },
          body: JSON.stringify({
            childId,
            dateRange: 'all',  // Changed from 'month' to 'all' to capture the demo data
            analysisType: 'comprehensive'
          })
        }
      )

      console.log('AI analysis response:', response.status, response.ok)
      if (response.ok) {
        const data = await response.json()
        console.log('AI analysis data:', data)

        // Parse the AI response into structured insights
        const analysis = data.analysis || ''

        // Better parsing for the AI response
        const insights: AIInsights = {
          summary: extractSection(analysis, 'Executive Summary') ||
                   extractSection(analysis, 'Overview') ||
                   extractSection(analysis, 'Summary') ||
                   analysis.split('\n')[0] || // First line as fallback
                   'Analysis in progress...',
          concerns: extractBulletPoints(analysis, 'Key Concerns') ||
                   extractBulletPoints(analysis, 'Concerns') ||
                   extractBulletPoints(analysis, 'Areas of Concern'),
          strengths: extractBulletPoints(analysis, 'Positive Trends') ||
                    extractBulletPoints(analysis, 'Positive Indicators') ||
                    extractBulletPoints(analysis, 'Strengths'),
          recommendations: extractBulletPoints(analysis, 'Recommendations') ||
                          extractBulletPoints(analysis, 'Top 3 Recommendations'),
          lastAnalyzed: new Date().toLocaleDateString()
        }

        console.log('Parsed insights:', insights)

        setAIInsights(prev => ({
          ...prev,
          [childId]: insights
        }))
      }
    } catch (error) {
      console.error('Error loading AI insights:', error)
    } finally {
      setLoadingInsights(prev => ({ ...prev, [childId]: false }))
    }
  }

  const extractSection = (text: string, section: string): string => {
    // Try multiple formats: **Section**, Section:, or just Section at start of line
    const patterns = [
      new RegExp(`\\*\\*${section}\\*\\*:?\\s*([^\\*\\n]+)`, 'i'),
      new RegExp(`^${section}:?\\s*([^\\n]+)`, 'im'),
      new RegExp(`\\n${section}:?\\s*([^\\n]+)`, 'i'),
      new RegExp(`\\d+\\.\\s*\\*\\*${section}\\*\\*:?\\s*([^\\*\\n]+)`, 'i')
    ]

    for (const pattern of patterns) {
      const match = text.match(pattern)
      if (match && match[1]) {
        return match[1].trim()
      }
    }
    return ''
  }

  const extractBulletPoints = (text: string, section: string): string[] | undefined => {
    // Try to find the section
    const patterns = [
      new RegExp(`\\*\\*${section}\\*\\*:?([^\\*\\*]+?)(?=\\n\\n|\\*\\*|\\d+\\.|$)`, 'is'),
      new RegExp(`^${section}:?([^\\n]+(?:\\n(?!\\n|\\d+\\.|\\*\\*).*)+)`, 'im'),
      new RegExp(`\\d+\\.\\s*\\*\\*${section}\\*\\*:?([^\\*\\*]+?)(?=\\n\\n|\\d+\\.|$)`, 'is')
    ]

    let sectionContent = ''
    for (const pattern of patterns) {
      const match = text.match(pattern)
      if (match && match[1]) {
        sectionContent = match[1]
        break
      }
    }

    if (!sectionContent) return undefined

    // Extract bullet points
    const bulletRegex = /[-•*]\s*([^\n-•*]+)/g
    const bullets: string[] = []
    let match

    while ((match = bulletRegex.exec(sectionContent)) !== null) {
      const bullet = match[1].trim()
      if (bullet.length > 0) {
        bullets.push(bullet)
      }
    }

    return bullets.length > 0 ? bullets : undefined
  }

  const toggleChildExpansion = async (childId: string) => {
    if (expandedChild === childId) {
      setExpandedChild(null)
    } else {
      setExpandedChild(childId)
      await loadCheckInHistory(childId)
      await loadAIInsights(childId)
    }
  }

  const getAvatarStyle = (index: number) => {
    return AVATAR_STYLES[index % AVATAR_STYLES.length]
  }

  const getTrendIcon = (trend?: 'improving' | 'declining' | 'stable') => {
    switch (trend) {
      case 'improving':
        return <TrendingUp className="h-4 w-4 text-green-600" />
      case 'declining':
        return <TrendingDown className="h-4 w-4 text-red-600" />
      default:
        return <Minus className="h-4 w-4 text-gray-400" />
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="animate-spin rounded-full h-12 w-12 border-4 border-blue-500 border-t-transparent"></div>
      </div>
    )
  }

  return (
    <div className="max-w-7xl mx-auto p-6">
      {/* Force Tailwind to include avatar colors */}
      {FORCE_TAILWIND_CLASSES}

      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Child Wellbeing Summary</h1>
        <p className="text-gray-600">Click on any child to view detailed check-in history and AI insights</p>
      </div>

      {/* Organization Filter */}
      <div className="mb-6">
        <select
          value={selectedOrg}
          onChange={(e) => setSelectedOrg(e.target.value)}
          className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          {organizations.map(org => (
            <option key={org.id} value={org.id}>{org.name}</option>
          ))}
        </select>
      </div>

      {/* Children List */}
      <div className="space-y-4">
        {children.map((child, index) => (
          <motion.div
            key={child.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.05 }}
            className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden"
          >
            {/* Child Summary Row */}
            <div
              onClick={() => toggleChildExpansion(child.id)}
              className="p-4 cursor-pointer hover:bg-gray-50 transition-colors"
            >
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-4">
                  {/* Avatar - Always use generated avatars, ignore database URLs */}
                  {(() => {
                    const style = getAvatarStyle(index)
                    const baseClasses = "w-12 h-12 flex items-center justify-center text-white font-semibold transition-transform hover:scale-110 shadow-md"
                    const avatarClassName = `${baseClasses} ${style.bg} ${style.shape}`

                    // Debug logging - v2 with cache bust
                    console.log(`[v2] Child ${index}: ${child.name}`)
                    console.log(`[v2]   - Style index: ${index % AVATAR_STYLES.length}`)
                    console.log(`[v2]   - Background: ${style.bg}`)
                    console.log(`[v2]   - Shape: ${style.shape}`)
                    console.log(`[v2]   - Full className: ${avatarClassName}`)
                    console.log(`[v2]   - Build timestamp: ${new Date().toISOString()}`)

                    // Check computed style after render
                    setTimeout(() => {
                      const elem = document.querySelector(`[data-child-index="${index}"]`)
                      if (elem) {
                        const computed = window.getComputedStyle(elem)
                        console.log(`  - Computed background: ${computed.backgroundColor}`)
                        console.log(`  - Computed classes: ${elem.className}`)
                      }
                    }, 100)

                    return (
                      <div className={avatarClassName} data-child-index={index}>
                        <span className="text-sm">
                          {child.initials}
                        </span>
                      </div>
                    )
                  })()}

                  {/* Name and Basic Info */}
                  <div>
                    <h3 className="font-semibold text-gray-900">{child.name}</h3>
                    <p className="text-sm text-gray-600">
                      Last check-in: {child.lastCheckIn} • {child.checkInCount} check-ins
                    </p>
                  </div>
                </div>

                {/* Status Indicators */}
                <div className="flex items-center space-x-6">
                  {/* Current Mood */}
                  <div className="text-center">
                    <div className="text-2xl mb-1">
                      {child.recentMood ? MOOD_EMOJIS[child.recentMood as keyof typeof MOOD_EMOJIS] : '—'}
                    </div>
                    <p className="text-xs text-gray-600">Current</p>
                  </div>

                  {/* Average Mood */}
                  <div className="text-center">
                    <div className="flex items-center space-x-1">
                      <Heart className="h-5 w-5" style={{
                        color: child.averageMood ? MOOD_COLORS[Math.round(child.averageMood) as keyof typeof MOOD_COLORS] : '#6B7280'
                      }} />
                      <span className="font-semibold">
                        {child.averageMood ? child.averageMood.toFixed(1) : '—'}
                      </span>
                    </div>
                    <p className="text-xs text-gray-600">Average</p>
                  </div>

                  {/* Trend */}
                  <div className="text-center">
                    {getTrendIcon(child.moodTrend)}
                    <p className="text-xs text-gray-600">Trend</p>
                  </div>

                  {/* Expand Icon */}
                  <div>
                    {expandedChild === child.id ? (
                      <ChevronDown className="h-5 w-5 text-gray-400" />
                    ) : (
                      <ChevronRight className="h-5 w-5 text-gray-400" />
                    )}
                  </div>
                </div>
              </div>
            </div>

            {/* Expanded Content */}
            <AnimatePresence>
              {expandedChild === child.id && (
                <motion.div
                  initial={{ height: 0, opacity: 0 }}
                  animate={{ height: 'auto', opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }}
                  transition={{ duration: 0.3 }}
                  className="border-t border-gray-200"
                >
                  <div className="p-6 bg-gray-50">
                    <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                      {/* Check-in History */}
                      <div>
                        <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                          <Calendar className="h-4 w-4 mr-2" />
                          Recent Check-ins
                        </h4>

                        <div className="space-y-3 max-h-96 overflow-y-auto">
                          {checkInHistory[child.id]?.slice(0, 10).map(checkIn => (
                            <div key={checkIn.id} className="bg-white p-3 rounded-lg border border-gray-200">
                              <div className="flex items-start justify-between">
                                <div className="flex-1">
                                  <div className="flex items-center space-x-2 mb-1">
                                    <Clock className="h-3 w-3 text-gray-400" />
                                    <span className="text-xs text-gray-600">
                                      {new Date(checkIn.created_at).toLocaleString()}
                                    </span>
                                  </div>

                                  {checkIn.feelings && checkIn.feelings.length > 0 && (
                                    <div className="flex flex-wrap gap-1 mb-2">
                                      {checkIn.feelings.map((feeling, idx) => (
                                        <span key={idx} className="px-2 py-1 bg-blue-100 text-blue-700 text-xs rounded-full">
                                          {feeling}
                                        </span>
                                      ))}
                                    </div>
                                  )}

                                  {(checkIn.notes || checkIn.explanation) && (
                                    <p className="text-sm text-gray-700 italic">
                                      "{checkIn.notes || checkIn.explanation}"
                                    </p>
                                  )}
                                </div>

                                <div className="ml-3 text-2xl">
                                  {checkIn.mood_numeric && MOOD_EMOJIS[checkIn.mood_numeric as keyof typeof MOOD_EMOJIS]}
                                </div>
                              </div>
                            </div>
                          )) || (
                            <p className="text-gray-500 text-sm">No check-in history available</p>
                          )}
                        </div>
                      </div>

                      {/* AI Insights */}
                      <div>
                        <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                          <Sparkles className="h-4 w-4 mr-2" />
                          AI Insights
                        </h4>

                        {loadingInsights[child.id] ? (
                          <div className="flex items-center justify-center py-8">
                            <div className="animate-spin rounded-full h-8 w-8 border-2 border-blue-500 border-t-transparent"></div>
                          </div>
                        ) : aiInsights[child.id] ? (
                          <div className="space-y-4">
                            {/* Summary */}
                            <div className="bg-white p-4 rounded-lg border border-gray-200">
                              <h5 className="font-medium text-gray-900 mb-2 flex items-center">
                                <Brain className="h-4 w-4 mr-2" />
                                Executive Summary
                              </h5>
                              <p className="text-sm text-gray-700">{aiInsights[child.id].summary}</p>
                            </div>

                            {/* Concerns */}
                            {aiInsights[child.id].concerns && aiInsights[child.id].concerns!.length > 0 && (
                              <div className="bg-red-50 p-4 rounded-lg border border-red-200">
                                <h5 className="font-medium text-red-900 mb-2 flex items-center">
                                  <AlertCircle className="h-4 w-4 mr-2" />
                                  Areas of Concern
                                </h5>
                                <ul className="space-y-1">
                                  {aiInsights[child.id].concerns!.map((concern, idx) => (
                                    <li key={idx} className="text-sm text-red-800 flex items-start">
                                      <span className="mr-2">•</span>
                                      <span>{concern}</span>
                                    </li>
                                  ))}
                                </ul>
                              </div>
                            )}

                            {/* Strengths */}
                            {aiInsights[child.id].strengths && aiInsights[child.id].strengths!.length > 0 && (
                              <div className="bg-green-50 p-4 rounded-lg border border-green-200">
                                <h5 className="font-medium text-green-900 mb-2 flex items-center">
                                  <Activity className="h-4 w-4 mr-2" />
                                  Positive Indicators
                                </h5>
                                <ul className="space-y-1">
                                  {aiInsights[child.id].strengths!.map((strength, idx) => (
                                    <li key={idx} className="text-sm text-green-800 flex items-start">
                                      <span className="mr-2">•</span>
                                      <span>{strength}</span>
                                    </li>
                                  ))}
                                </ul>
                              </div>
                            )}

                            {/* Recommendations */}
                            {aiInsights[child.id].recommendations && aiInsights[child.id].recommendations!.length > 0 && (
                              <div className="bg-blue-50 p-4 rounded-lg border border-blue-200">
                                <h5 className="font-medium text-blue-900 mb-2 flex items-center">
                                  <MessageSquare className="h-4 w-4 mr-2" />
                                  Recommendations
                                </h5>
                                <ul className="space-y-1">
                                  {aiInsights[child.id].recommendations!.map((rec, idx) => (
                                    <li key={idx} className="text-sm text-blue-800 flex items-start">
                                      <span className="mr-2">•</span>
                                      <span>{rec}</span>
                                    </li>
                                  ))}
                                </ul>
                              </div>
                            )}

                            <p className="text-xs text-gray-500 text-right">
                              Last analyzed: {aiInsights[child.id].lastAnalyzed}
                            </p>
                          </div>
                        ) : (
                          <div className="bg-gray-100 p-4 rounded-lg text-center">
                            <p className="text-sm text-gray-600">AI insights will load shortly...</p>
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
          </motion.div>
        ))}
      </div>

      {children.length === 0 && (
        <div className="text-center py-12">
          <User className="h-12 w-12 text-gray-300 mx-auto mb-4" />
          <p className="text-gray-500">No children found in this organization</p>
        </div>
      )}
    </div>
  )
}