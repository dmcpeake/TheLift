import React, { useState, useEffect, useMemo } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import {
  LineChart, Line, AreaChart, Area, BarChart, Bar,
  PieChart, Pie, Cell, RadarChart, Radar, PolarGrid,
  PolarAngleAxis, PolarRadiusAxis, Treemap,
  XAxis, YAxis, CartesianGrid, Tooltip, Legend,
  ResponsiveContainer, ComposedChart, Scatter
} from 'recharts'
import { getSupabaseClient } from '../../utils/supabase/client.tsx'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Building2, TrendingUp, Users, Activity, Brain, MessageSquare, AlertCircle, Sparkles } from 'lucide-react'

const supabase = getSupabaseClient()

// Modern color palette
const COLORS = {
  primary: ['#3B82F6', '#60A5FA', '#93C5FD', '#BFDBFE'],
  success: ['#10B981', '#34D399', '#6EE7B7', '#A7F3D0'],
  warning: ['#F59E0B', '#FCD34D', '#FDE68A', '#FEF3C7'],
  danger: ['#EF4444', '#F87171', '#FCA5A5', '#FECACA'],
  purple: ['#8B5CF6', '#A78BFA', '#C4B5FD', '#DDD6FE'],
  gradient: {
    primary: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
    success: 'linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%)',
    warm: 'linear-gradient(135deg, #fa709a 0%, #fee140 100%)',
  }
}

interface Organization {
  id: string
  name: string
  type: string
}

interface SessionData {
  date: string
  sessions: number
  moodAvg: number
  toolsUsed: number
  organization: string
  childCount: number
}

interface ChildProgress {
  id: string
  name: string
  organization: string
  totalSessions: number
  avgMood: number
  lastSession: string
  progress: number
  trend: 'up' | 'down' | 'stable'
}

export function CheckinProgressViz() {
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [organizations, setOrganizations] = useState<Organization[]>([])
  const [selectedOrg, setSelectedOrg] = useState<string>('all')
  const [sessionData, setSessionData] = useState<SessionData[]>([])
  const [childProgress, setChildProgress] = useState<ChildProgress[]>([])
  const [viewMode, setViewMode] = useState<'overview' | 'timeline' | 'children' | 'insights' | 'qualitative'>('overview')
  const [dateRange, setDateRange] = useState<'week' | 'month' | 'all'>('all')
  const [qualitativeData, setQualitativeData] = useState<any[]>([])
  const [aiAnalysis, setAiAnalysis] = useState<any>(null)
  const [isAnalyzing, setIsAnalyzing] = useState(false)
  const [analysisError, setAnalysisError] = useState<string | null>(null)

  useEffect(() => {
    loadData()
  }, [selectedOrg, dateRange])

  const loadData = async () => {
    try {
      setLoading(true)
      setError(null)
      console.log('Loading data for CheckinProgressViz...')

      // Load organizations
      const { data: orgs, error: orgsError } = await supabase
        .from('organisations')
        .select('*')
        .order('name')

      if (orgsError) {
        console.error('Error loading organizations:', orgsError)
      } else {
        console.log('Loaded organizations:', orgs?.length || 0)
        if (orgs) {
          setOrganizations(orgs)
        }
      }

      // Build query based on filters - simplified query
      let sessionsQuery = supabase
        .from('checkin_sessions')
        .select('*')
        .order('started_at', { ascending: false })

      if (selectedOrg !== 'all') {
        console.log('Filtering by org:', selectedOrg)
        sessionsQuery = sessionsQuery.eq('org_id', selectedOrg)
      }

      // Apply date filter
      const now = new Date()
      if (dateRange === 'week') {
        const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
        sessionsQuery = sessionsQuery.gte('started_at', weekAgo.toISOString())
        console.log('Filtering by week, from:', weekAgo.toISOString())
      } else if (dateRange === 'month') {
        const monthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
        sessionsQuery = sessionsQuery.gte('started_at', monthAgo.toISOString())
        console.log('Filtering by month, from:', monthAgo.toISOString())
      }

      const { data: sessions, error } = await sessionsQuery

      if (error) {
        console.error('Error loading sessions:', error)
        throw error
      }

      // Process session data
      if (sessions && sessions.length > 0) {
        console.log('Found sessions:', sessions.length)
        console.log('Sample session:', sessions[0])

        // Load mood data in batches to avoid URL too long error
        const sessionIds = sessions.map(s => s.id)
        console.log('Loading mood data for', sessionIds.length, 'sessions')

        let allMoods: any[] = []
        const batchSize = 50 // Process 50 sessions at a time

        for (let i = 0; i < sessionIds.length; i += batchSize) {
          const batch = sessionIds.slice(i, i + batchSize)
          const { data: moods, error: moodsError } = await supabase
            .from('mood_meter_usage')
            .select('session_id, mood_numeric, mood_level')
            .in('session_id', batch)

          if (moodsError) {
            console.error('Error loading mood data batch:', moodsError)
          } else if (moods) {
            allMoods = [...allMoods, ...moods]
          }
        }

        const moods = allMoods
        console.log('Loaded mood data:', moods?.length || 0, 'entries')

        // Combine sessions with mood data
        const sessionsWithMood = sessions.map(session => ({
          ...session,
          mood_data: moods?.find(m => m.session_id === session.id)
        }))

        processSessionData(sessionsWithMood, orgs || [])

        // Load child progress
        console.log('Loading child profiles...')
        const { data: children, error: childrenError } = await supabase
          .from('profiles')
          .select('*')
          .eq('role', 'Child')

        if (childrenError) {
          console.error('Error loading children:', childrenError)
        } else if (children) {
          console.log('Loaded children:', children.length)
          processChildProgress(children, sessionsWithMood)
        }
      } else {
        // No sessions found, set empty data
        console.log('No sessions found')
        setSessionData([])
        setChildProgress([])
      }

      // Load qualitative data
      await loadQualitativeData()

    } catch (error: any) {
      console.error('Error loading data:', error)
      setError(error?.message || 'Failed to load data')
    } finally {
      setLoading(false)
    }
  }

  const loadQualitativeData = async () => {
    try {
      console.log('Loading qualitative data...')

      // Load emotion grid data with explanations
      let emotionQuery = supabase
        .from('emotion_grid_usage')
        .select(`
          *,
          emotion_grid_feelings (*)
        `)
        .not('explanation_text', 'is', null)
        .order('created_at', { ascending: false })

      if (selectedOrg !== 'all') {
        emotionQuery = emotionQuery.eq('org_id', selectedOrg)
      }

      // Apply date filter
      const now = new Date()
      if (dateRange === 'week') {
        const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
        emotionQuery = emotionQuery.gte('created_at', weekAgo.toISOString())
      } else if (dateRange === 'month') {
        const monthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
        emotionQuery = emotionQuery.gte('created_at', monthAgo.toISOString())
      }

      const { data: emotionData, error: emotionError } = await emotionQuery

      if (emotionError) {
        console.error('Error loading emotion data:', emotionError)
      } else if (emotionData) {
        console.log('Loaded emotion data:', emotionData.length)

        // Get child names
        const childIds = [...new Set(emotionData.map(e => e.child_id))]
        const { data: childProfiles } = await supabase
          .from('profiles')
          .select('id, name')
          .in('id', childIds)

        const childNames = new Map(childProfiles?.map(p => [p.id, p.name]) || [])

        // Process qualitative data
        const processed = emotionData.map(item => ({
          id: item.id,
          childName: childNames.get(item.child_id) || 'Unknown',
          childId: item.child_id,
          date: new Date(item.created_at).toLocaleDateString(),
          time: new Date(item.created_at).toLocaleTimeString(),
          explanation: item.explanation_text,
          feelings: item.emotion_grid_feelings?.map((f: any) => ({
            name: f.feeling_name,
            category: f.feeling_category,
            emoji: f.feeling_emoji
          })) || [],
          inputMethod: item.input_method
        }))

        setQualitativeData(processed)
      }
    } catch (error) {
      console.error('Error loading qualitative data:', error)
    }
  }

  const runAIAnalysis = async (analysisType: 'trends' | 'sentiment' | 'concerns' | 'comprehensive' = 'comprehensive') => {
    // Prevent multiple simultaneous requests
    if (isAnalyzing) {
      console.log('Analysis already in progress, skipping...')
      return
    }

    try {
      setIsAnalyzing(true)
      setAiAnalysis(null)
      setAnalysisError(null)

      // Check for user but don't require it (demo mode)
      const { data: { user } } = await supabase.auth.getUser()
      console.log('Running AI analysis, user:', user?.email || 'demo mode')

      const response = await supabase.functions.invoke('analyze-qualitative-data', {
        body: {
          orgId: selectedOrg === 'all' ? null : selectedOrg,
          dateRange,
          analysisType
        }
      })

      if (response.error) {
        throw response.error
      }

      setAiAnalysis(response.data)
    } catch (error: any) {
      console.error('Error running AI analysis:', error)

      // Check for specific error types
      if (error.message?.includes('429') || response?.error?.message?.includes('rate limit')) {
        setAnalysisError('Rate limit reached. Please wait a moment before trying again.')
      } else {
        setAnalysisError(error.message || 'Failed to run AI analysis')
      }
    } finally {
      setIsAnalyzing(false)
    }
  }

  const processSessionData = (sessions: any[], orgs: Organization[]) => {
    // Group sessions by date
    const grouped = sessions.reduce((acc: any, session) => {
      const date = new Date(session.started_at).toLocaleDateString()
      if (!acc[date]) {
        acc[date] = {
          sessions: 0,
          moods: [],
          tools: new Set(),
          orgs: new Set(),
          children: new Set()
        }
      }

      acc[date].sessions++
      if (session.mood_data?.mood_numeric) {
        acc[date].moods.push(session.mood_data.mood_numeric)
      }
      acc[date].tools.add(...(session.tools_completed || []))
      acc[date].orgs.add(session.org_id)
      acc[date].children.add(session.child_id)

      return acc
    }, {})

    // Convert to array format
    const data = Object.entries(grouped).map(([date, info]: any) => ({
      date,
      sessions: info.sessions,
      moodAvg: info.moods.length > 0
        ? info.moods.reduce((a: number, b: number) => a + b, 0) / info.moods.length
        : 0,
      toolsUsed: info.tools.size,
      organization: orgs.find(o => info.orgs.has(o.id))?.name || 'Unknown',
      childCount: info.children.size
    }))

    setSessionData(data.reverse())
  }

  const processChildProgress = (children: any[], sessions: any[]) => {
    const childData = children.map(child => {
      const childSessions = sessions.filter(s => s.child_id === child.id)
      const recentSessions = childSessions.slice(0, 10)
      const olderSessions = childSessions.slice(10, 20)

      const recentMoods = recentSessions
        .filter(s => s.mood_data?.mood_numeric)
        .map(s => s.mood_data.mood_numeric)

      const olderMoods = olderSessions
        .filter(s => s.mood_data?.mood_numeric)
        .map(s => s.mood_data.mood_numeric)

      const recentMood = recentMoods.length > 0
        ? recentMoods.reduce((a, b) => a + b, 0) / recentMoods.length
        : 3

      const olderMood = olderMoods.length > 0
        ? olderMoods.reduce((a, b) => a + b, 0) / olderMoods.length
        : 3

      let trend: 'up' | 'down' | 'stable' = 'stable'
      if (recentMood > olderMood + 0.5) trend = 'up'
      else if (recentMood < olderMood - 0.5) trend = 'down'

      return {
        id: child.id,
        name: child.name,
        organization: child.org_id,
        totalSessions: childSessions.length,
        avgMood: recentMood,
        lastSession: childSessions[0]?.started_at || '',
        progress: Math.min((childSessions.length / 36) * 100, 100),
        trend
      }
    })

    if (selectedOrg !== 'all') {
      setChildProgress(childData.filter(c => c.organization === selectedOrg))
    } else {
      setChildProgress(childData)
    }
  }

  // Memoized calculations
  const stats = useMemo(() => {
    const totalSessions = sessionData.reduce((sum, d) => sum + d.sessions, 0)
    const avgMood = sessionData.length > 0
      ? sessionData.reduce((sum, d) => sum + d.moodAvg, 0) / sessionData.length
      : 0
    const activeChildren = new Set(sessionData.flatMap(d => d.childCount)).size
    const engagementRate = childProgress.filter(c => c.totalSessions > 0).length / (childProgress.length || 1) * 100

    return { totalSessions, avgMood, activeChildren, engagementRate }
  }, [sessionData, childProgress])

  const CustomTooltip = ({ active, payload, label }: any) => {
    if (active && payload && payload.length) {
      return (
        <div className="bg-white p-3 rounded-lg shadow-xl border border-gray-200">
          <p className="text-gray-800 font-semibold">{label}</p>
          {payload.map((entry: any, index: number) => (
            <p key={index} className="text-gray-600">
              {entry.name}: {entry.value}
            </p>
          ))}
        </div>
      )
    }
    return null
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-100 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-4 border-gray-600 border-t-transparent mx-auto mb-4"></div>
          <p className="text-lg text-gray-700">Loading analytics data...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-100 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">Error Loading Analytics</h1>
          <p className="text-red-600 mb-4">{error}</p>
          <button
            onClick={() => {
              setError(null)
              loadData()
            }}
            className="bg-gray-900 text-white px-4 py-2 rounded hover:bg-gray-700"
          >
            Retry
          </button>
        </div>
      </div>
    )
  }

  if (!sessionData.length && !loading) {
    return (
      <div className="min-h-screen bg-gray-100 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">No Data Available</h1>
          <p className="text-gray-600 mb-4">No check-in sessions found for the selected filters.</p>
          <p className="text-gray-500 text-sm mb-6">Try adjusting the date range or organization filter.</p>
          <button
            onClick={() => {
              setDateRange('all')
              setSelectedOrg('all')
            }}
            className="bg-gray-900 text-white px-4 py-2 rounded hover:bg-gray-700"
          >
            Reset Filters
          </button>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-100">
      {/* Header */}
      <div className="bg-white/80 backdrop-blur-sm border-b border-gray-200 p-6">
        <div className="max-w-7xl mx-auto">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">Check-in Progress Analytics</h1>
          <p className="text-gray-600">Real-time insights into children's wellbeing journeys</p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto p-6 space-y-8">

        {/* Filters */}
        <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
          <CardContent className="p-6">
            <div className="flex flex-wrap gap-4">
            {/* Organization Filter */}
            <div className="flex-1 min-w-[200px]">
              <label className="text-gray-700 text-sm mb-2 block font-medium">Organization</label>
              <select
                value={selectedOrg}
                onChange={(e) => setSelectedOrg(e.target.value)}
                className="w-full bg-white text-gray-800 rounded-lg px-4 py-2 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500"
              >
                <option value="all">All Organizations</option>
                {organizations.map(org => (
                  <option key={org.id} value={org.id}>{org.name}</option>
                ))}
              </select>
            </div>

            {/* Date Range */}
            <div className="flex-1 min-w-[200px]">
              <label className="text-gray-700 text-sm mb-2 block font-medium">Time Period</label>
              <div className="flex gap-2">
                {(['week', 'month', 'all'] as const).map(range => (
                  <button
                    key={range}
                    onClick={() => setDateRange(range)}
                    className={`flex-1 py-2 px-4 rounded-lg transition-all ${
                      dateRange === range
                        ? 'bg-gray-800 text-white'
                        : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
                    }`}
                  >
                    {range === 'all' ? 'All Time' : range === 'week' ? 'Week' : 'Month'}
                  </button>
                ))}
              </div>
            </div>

            {/* View Mode */}
            <div className="flex-1 min-w-[400px]">
              <label className="text-gray-700 text-sm mb-2 block font-medium">View</label>
              <div className="flex gap-2">
                {(['overview', 'timeline', 'children', 'insights', 'qualitative'] as const).map(mode => (
                  <button
                    key={mode}
                    onClick={() => setViewMode(mode)}
                    className={`flex-1 py-2 px-4 rounded-lg transition-all capitalize ${
                      viewMode === mode
                        ? 'bg-gray-800 text-white'
                        : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
                    }`}
                  >
                    {mode}
                  </button>
                ))}
              </div>
            </div>
          </div>
          </CardContent>
        </Card>

        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Activity className="h-5 w-5" />
                Total Sessions
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-gray-800">{stats.totalSessions}</div>
              <p className="text-gray-600">check-in sessions</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <TrendingUp className="h-5 w-5" />
                Avg Mood
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-gray-800">{stats.avgMood.toFixed(1)}</div>
              <p className="text-gray-600">mood score</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Users className="h-5 w-5" />
                Active Children
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-gray-800">
                {childProgress.filter(c => c.totalSessions > 0).length}
              </div>
              <p className="text-gray-600">participating</p>
            </CardContent>
          </Card>

          <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Building2 className="h-5 w-5" />
                Engagement
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-gray-800">
                {stats.engagementRate.toFixed(0)}%
              </div>
              <p className="text-gray-600">engagement rate</p>
            </CardContent>
          </Card>
        </div>

        {/* Main Visualization Area */}
        <AnimatePresence mode="wait">
          {viewMode === 'overview' && (
            <motion.div
              key="overview"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="space-y-8"
            >
              {/* Sessions Timeline */}
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                <CardHeader>
                  <CardTitle className="text-gray-700">Sessions Over Time</CardTitle>
                </CardHeader>
                <CardContent>
                <ResponsiveContainer width="100%" height={300}>
                  <AreaChart data={sessionData}>
                    <defs>
                      <linearGradient id="colorSessions" x1="0" y1="0" x2="0" y2="1">
                        <stop offset="5%" stopColor="#6b7280" stopOpacity={0.8}/>
                        <stop offset="95%" stopColor="#6b7280" stopOpacity={0.1}/>
                      </linearGradient>
                    </defs>
                    <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                    <XAxis dataKey="date" stroke="#6b7280" />
                    <YAxis stroke="#6b7280" />
                    <Tooltip content={<CustomTooltip />} />
                    <Area
                      type="monotone"
                      dataKey="sessions"
                      stroke="#6b7280"
                      fillOpacity={1}
                      fill="url(#colorSessions)"
                      strokeWidth={2}
                    />
                  </AreaChart>
                </ResponsiveContainer>
                </CardContent>
              </Card>

              {/* Mood Trends */}
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                <CardHeader>
                  <CardTitle className="text-gray-700">Mood Trends</CardTitle>
                </CardHeader>
                <CardContent>
                <ResponsiveContainer width="100%" height={300}>
                  <LineChart data={sessionData}>
                    <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                    <XAxis dataKey="date" stroke="#6b7280" />
                    <YAxis domain={[0, 5]} stroke="#6b7280" />
                    <Tooltip content={<CustomTooltip />} />
                    <Line
                      type="monotone"
                      dataKey="moodAvg"
                      stroke="#10B981"
                      strokeWidth={3}
                      dot={{ fill: '#10B981', r: 4 }}
                      activeDot={{ r: 6 }}
                    />
                  </LineChart>
                </ResponsiveContainer>
                </CardContent>
              </Card>
            </motion.div>
          )}

          {viewMode === 'timeline' && (
            <motion.div
              key="timeline"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="bg-white/70 backdrop-blur-sm rounded-xl p-6 border-0 shadow-lg"
            >
              <h3 className="text-xl font-semibold text-gray-700 mb-4">Detailed Timeline</h3>
              <ResponsiveContainer width="100%" height={400}>
                <ComposedChart data={sessionData}>
                  <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                  <XAxis dataKey="date" stroke="#6b7280" />
                  <YAxis yAxisId="left" stroke="#6b7280" />
                  <YAxis yAxisId="right" orientation="right" stroke="#6b7280" />
                  <Tooltip content={<CustomTooltip />} />
                  <Legend />
                  <Bar yAxisId="left" dataKey="sessions" fill="#6b7280" opacity={0.8} />
                  <Line yAxisId="right" type="monotone" dataKey="moodAvg" stroke="#10B981" strokeWidth={2} />
                  <Scatter yAxisId="left" dataKey="childCount" fill="#F59E0B" />
                </ComposedChart>
              </ResponsiveContainer>
            </motion.div>
          )}

          {viewMode === 'children' && (
            <motion.div
              key="children"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="space-y-6"
            >
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                <CardHeader>
                  <CardTitle className="text-gray-700">Individual Progress</CardTitle>
                </CardHeader>
                <CardContent>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                  {childProgress.slice(0, 12).map((child) => (
                    <motion.div
                      key={child.id}
                      initial={{ opacity: 0, scale: 0.9 }}
                      animate={{ opacity: 1, scale: 1 }}
                      whileHover={{ scale: 1.05 }}
                      className="bg-gray-100 border border-gray-200 rounded-lg p-4 cursor-pointer hover:shadow-lg transition-all"
                    >
                      <div className="flex items-center justify-between mb-2">
                        <h4 className="font-semibold text-gray-800">{child.name}</h4>
                        <span className={`text-sm px-2 py-1 rounded text-white ${
                          child.trend === 'up' ? 'bg-green-600' :
                          child.trend === 'down' ? 'bg-red-600' :
                          'bg-gray-500'
                        }`}>
                          {child.trend === 'up' ? '↑' : child.trend === 'down' ? '↓' : '→'}
                        </span>
                      </div>
                      <div className="space-y-2">
                        <div>
                          <div className="flex justify-between text-sm text-gray-600">
                            <span>Sessions</span>
                            <span className="font-medium">{child.totalSessions}</span>
                          </div>
                          <div className="w-full bg-gray-200 rounded-full h-2 mt-1">
                            <motion.div
                              initial={{ width: 0 }}
                              animate={{ width: `${child.progress}%` }}
                              transition={{ duration: 1, ease: "easeOut" }}
                              className="bg-gray-600 h-2 rounded-full"
                            />
                          </div>
                        </div>
                        <div className="flex justify-between text-sm">
                          <span className="text-gray-600">Avg Mood</span>
                          <span className="text-gray-800 font-medium">
                            {['😢', '😕', '😐', '🙂', '😊'][Math.floor(child.avgMood)]}
                            {' '}
                            {child.avgMood.toFixed(1)}
                          </span>
                        </div>
                      </div>
                    </motion.div>
                  ))}
                </div>
                </CardContent>
              </Card>
            </motion.div>
          )}

          {viewMode === 'insights' && (
            <motion.div
              key="insights"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="grid grid-cols-1 lg:grid-cols-2 gap-6"
            >
              {/* Engagement by Organization */}
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                <CardHeader>
                  <CardTitle className="text-gray-700">Engagement by Organization</CardTitle>
                </CardHeader>
                <CardContent>
                <ResponsiveContainer width="100%" height={300}>
                  <PieChart>
                    <Pie
                      data={organizations.map(org => ({
                        name: org.name,
                        value: childProgress.filter(c => c.organization === org.id).length
                      }))}
                      cx="50%"
                      cy="50%"
                      outerRadius={80}
                      fill="#8884d8"
                      dataKey="value"
                      label
                    >
                      {organizations.map((_, index) => (
                        <Cell key={`cell-${index}`} fill={COLORS.primary[index % COLORS.primary.length]} />
                      ))}
                    </Pie>
                    <Tooltip />
                  </PieChart>
                </ResponsiveContainer>
                </CardContent>
              </Card>

              {/* Progress Distribution */}
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                <CardHeader>
                  <CardTitle className="text-gray-700">Progress Distribution</CardTitle>
                </CardHeader>
                <CardContent>
                <ResponsiveContainer width="100%" height={300}>
                  <BarChart
                    data={[
                      { range: '0-25%', count: childProgress.filter(c => c.progress <= 25).length },
                      { range: '26-50%', count: childProgress.filter(c => c.progress > 25 && c.progress <= 50).length },
                      { range: '51-75%', count: childProgress.filter(c => c.progress > 50 && c.progress <= 75).length },
                      { range: '76-100%', count: childProgress.filter(c => c.progress > 75).length },
                    ]}
                  >
                    <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                    <XAxis dataKey="range" stroke="#6b7280" />
                    <YAxis stroke="#6b7280" />
                    <Tooltip content={<CustomTooltip />} />
                    <Bar dataKey="count" fill="#6b7280" />
                  </BarChart>
                </ResponsiveContainer>
                </CardContent>
              </Card>

              {/* Key Insights */}
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg lg:col-span-2">
                <CardHeader>
                  <CardTitle className="text-gray-700">Key Insights</CardTitle>
                </CardHeader>
                <CardContent>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div className="bg-green-50 border border-green-200 rounded-lg p-4">
                    <h4 className="text-green-700 font-semibold mb-2">Top Performers</h4>
                    <ul className="space-y-1">
                      {childProgress
                        .filter(c => c.trend === 'up')
                        .slice(0, 3)
                        .map(child => (
                          <li key={child.id} className="text-gray-600 text-sm">
                            {child.name} - {child.totalSessions} sessions
                          </li>
                        ))}
                    </ul>
                  </div>

                  <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                    <h4 className="text-yellow-700 font-semibold mb-2">Need Attention</h4>
                    <ul className="space-y-1">
                      {childProgress
                        .filter(c => c.totalSessions < 5)
                        .slice(0, 3)
                        .map(child => (
                          <li key={child.id} className="text-gray-600 text-sm">
                            {child.name} - Last: {child.lastSession ? new Date(child.lastSession).toLocaleDateString() : 'Never'}
                          </li>
                        ))}
                    </ul>
                  </div>

                  <div className="bg-purple-50 border border-purple-200 rounded-lg p-4">
                    <h4 className="text-purple-700 font-semibold mb-2">Recent Activity</h4>
                    <p className="text-gray-600 text-sm">
                      {sessionData.slice(0, 3).map(d => (
                        <span key={d.date} className="block">
                          {d.date}: {d.sessions} sessions
                        </span>
                      ))}
                    </p>
                  </div>
                </div>
                </CardContent>
              </Card>
            </motion.div>
          )}

          {viewMode === 'qualitative' && (
            <motion.div
              key="qualitative"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="space-y-6"
            >
              {/* AI Analysis Section */}
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                <CardHeader>
                  <CardTitle className="flex items-center justify-between">
                    <span className="flex items-center gap-2 text-gray-700">
                      <Brain className="h-5 w-5" />
                      AI-Powered Insights
                    </span>
                    <div className="flex gap-2">
                      <button
                        onClick={() => runAIAnalysis('trends')}
                        disabled={isAnalyzing}
                        className="px-3 py-1 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50 text-sm"
                      >
                        Analyze Trends
                      </button>
                      <button
                        onClick={() => runAIAnalysis('sentiment')}
                        disabled={isAnalyzing}
                        className="px-3 py-1 bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:opacity-50 text-sm"
                      >
                        Sentiment Analysis
                      </button>
                      <button
                        onClick={() => runAIAnalysis('concerns')}
                        disabled={isAnalyzing}
                        className="px-3 py-1 bg-orange-600 text-white rounded-lg hover:bg-orange-700 disabled:opacity-50 text-sm"
                      >
                        Flag Concerns
                      </button>
                      <button
                        onClick={() => runAIAnalysis('comprehensive')}
                        disabled={isAnalyzing}
                        className="px-3 py-1 bg-purple-600 text-white rounded-lg hover:bg-purple-700 disabled:opacity-50 text-sm"
                      >
                        Full Analysis
                      </button>
                    </div>
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  {isAnalyzing && (
                    <div className="flex items-center justify-center py-8">
                      <div className="animate-spin rounded-full h-12 w-12 border-4 border-purple-600 border-t-transparent"></div>
                      <span className="ml-3 text-gray-600">Analyzing with Claude AI...</span>
                    </div>
                  )}
                  {aiAnalysis && !isAnalyzing && (
                    <div className="space-y-4">
                      {aiAnalysis.analysis && (
                        <div className="prose prose-sm max-w-none">
                          <div className="bg-purple-50 border border-purple-200 rounded-lg p-4">
                            <h4 className="flex items-center gap-2 text-purple-700 font-semibold mb-3">
                              <Sparkles className="h-4 w-4" />
                              Analysis Results
                            </h4>
                            <div className="text-gray-700 whitespace-pre-wrap">
                              {aiAnalysis.analysis}
                            </div>
                          </div>
                        </div>
                      )}
                      {aiAnalysis.metadata && (
                        <div className="grid grid-cols-4 gap-4 mt-4">
                          <div className="bg-gray-50 rounded-lg p-3">
                            <p className="text-xs text-gray-500">Data Points</p>
                            <p className="text-lg font-semibold text-gray-800">{aiAnalysis.metadata.dataPoints}</p>
                          </div>
                          <div className="bg-gray-50 rounded-lg p-3">
                            <p className="text-xs text-gray-500">Children</p>
                            <p className="text-lg font-semibold text-gray-800">{aiAnalysis.metadata.uniqueChildren}</p>
                          </div>
                          <div className="bg-gray-50 rounded-lg p-3">
                            <p className="text-xs text-gray-500">Period</p>
                            <p className="text-lg font-semibold text-gray-800">{aiAnalysis.metadata.dateRange}</p>
                          </div>
                          <div className="bg-gray-50 rounded-lg p-3">
                            <p className="text-xs text-gray-500">Analysis Type</p>
                            <p className="text-lg font-semibold text-gray-800 capitalize">{aiAnalysis.metadata.analysisType}</p>
                          </div>
                        </div>
                      )}
                    </div>
                  )}
                  {!aiAnalysis && !isAnalyzing && (
                    <div className="text-center py-8">
                      <Brain className="h-16 w-16 text-gray-300 mx-auto mb-4" />
                      {analysisError ? (
                        <>
                          <p className="text-red-600 mb-2">Analysis Error</p>
                          <p className="text-sm text-red-500 mb-4">{analysisError}</p>
                          {analysisError.includes('Rate limit') && (
                            <p className="text-xs text-gray-500">Wait 10-15 seconds before trying again</p>
                          )}
                        </>
                      ) : (
                        <>
                          <p className="text-gray-600 mb-2">No AI analysis yet</p>
                          <p className="text-sm text-gray-500">Click one of the analysis buttons above to get AI-powered insights</p>
                        </>
                      )}
                    </div>
                  )}
                </CardContent>
              </Card>

              {/* Qualitative Data Table */}
              <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2 text-gray-700">
                    <MessageSquare className="h-5 w-5" />
                    Children's Expressions & Feelings
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  {qualitativeData.length > 0 ? (
                    <div className="space-y-4 max-h-96 overflow-y-auto">
                      {qualitativeData.map((item) => (
                        <motion.div
                          key={item.id}
                          initial={{ opacity: 0, y: 20 }}
                          animate={{ opacity: 1, y: 0 }}
                          className="bg-gray-50 border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow"
                        >
                          <div className="flex justify-between items-start mb-2">
                            <h4 className="font-semibold text-gray-800">{item.childName}</h4>
                            <span className="text-xs text-gray-500">
                              {item.date} {item.time}
                            </span>
                          </div>

                          {item.feelings.length > 0 && (
                            <div className="flex flex-wrap gap-2 mb-3">
                              {item.feelings.map((feeling: any, idx: number) => (
                                <span
                                  key={idx}
                                  className="px-2 py-1 bg-white border border-gray-300 rounded-full text-xs flex items-center gap-1"
                                >
                                  <span>{feeling.emoji}</span>
                                  <span>{feeling.name}</span>
                                </span>
                              ))}
                            </div>
                          )}

                          {item.explanation && (
                            <div className="bg-white border border-gray-200 rounded p-3">
                              <p className="text-sm text-gray-700 italic">
                                "{item.explanation}"
                              </p>
                              {item.inputMethod && (
                                <p className="text-xs text-gray-500 mt-2">
                                  Input: {item.inputMethod === 'speech_to_text' ? '🎤 Voice' : '⌨️ Typed'}
                                </p>
                              )}
                            </div>
                          )}
                        </motion.div>
                      ))}
                    </div>
                  ) : (
                    <div className="text-center py-8">
                      <MessageSquare className="h-16 w-16 text-gray-300 mx-auto mb-4" />
                      <p className="text-gray-600">No qualitative data available</p>
                      <p className="text-sm text-gray-500 mt-2">
                        Children's explanations and feelings will appear here when available
                      </p>
                    </div>
                  )}
                </CardContent>
              </Card>

              {/* Summary Stats */}
              <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm text-gray-600">Total Expressions</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-2xl font-bold text-gray-800">{qualitativeData.length}</p>
                    <p className="text-xs text-gray-500">emotional explanations</p>
                  </CardContent>
                </Card>

                <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm text-gray-600">Unique Children</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-2xl font-bold text-gray-800">
                      {new Set(qualitativeData.map(d => d.childId)).size}
                    </p>
                    <p className="text-xs text-gray-500">sharing feelings</p>
                  </CardContent>
                </Card>

                <Card className="bg-white/70 backdrop-blur-sm border-0 shadow-lg">
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm text-gray-600">Voice Input</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="text-2xl font-bold text-gray-800">
                      {qualitativeData.filter(d => d.inputMethod === 'speech_to_text').length}
                    </p>
                    <p className="text-xs text-gray-500">voice recordings</p>
                  </CardContent>
                </Card>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  )
}