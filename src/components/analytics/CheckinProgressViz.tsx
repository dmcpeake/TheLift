import React, { useState, useEffect, useMemo } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import {
  LineChart, Line, AreaChart, Area, BarChart, Bar,
  PieChart, Pie, Cell, RadarChart, Radar, PolarGrid,
  PolarAngleAxis, PolarRadiusAxis, Treemap,
  XAxis, YAxis, CartesianGrid, Tooltip, Legend,
  ResponsiveContainer, ComposedChart, Scatter
} from 'recharts'
import { getSupabaseClient } from '../../utils/supabase/client'

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
  const [organizations, setOrganizations] = useState<Organization[]>([])
  const [selectedOrg, setSelectedOrg] = useState<string>('all')
  const [sessionData, setSessionData] = useState<SessionData[]>([])
  const [childProgress, setChildProgress] = useState<ChildProgress[]>([])
  const [viewMode, setViewMode] = useState<'overview' | 'timeline' | 'children' | 'insights'>('overview')
  const [dateRange, setDateRange] = useState<'week' | 'month' | 'all'>('month')

  useEffect(() => {
    loadData()
  }, [selectedOrg, dateRange])

  const loadData = async () => {
    try {
      setLoading(true)

      // Load organizations
      const { data: orgs } = await supabase
        .from('organisations')
        .select('*')
        .order('name')

      if (orgs) {
        setOrganizations(orgs)
      }

      // Build query based on filters - simplified query
      let sessionsQuery = supabase
        .from('checkin_sessions')
        .select('*')
        .order('started_at', { ascending: false })

      if (selectedOrg !== 'all') {
        sessionsQuery = sessionsQuery.eq('org_id', selectedOrg)
      }

      // Apply date filter
      const now = new Date()
      if (dateRange === 'week') {
        const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
        sessionsQuery = sessionsQuery.gte('started_at', weekAgo.toISOString())
      } else if (dateRange === 'month') {
        const monthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
        sessionsQuery = sessionsQuery.gte('started_at', monthAgo.toISOString())
      }

      const { data: sessions, error } = await sessionsQuery

      if (error) throw error

      // Process session data
      if (sessions && sessions.length > 0) {
        console.log('Found sessions:', sessions.length)

        // Load mood data separately
        const sessionIds = sessions.map(s => s.id)
        const { data: moods } = await supabase
          .from('mood_meter_usage')
          .select('session_id, mood_numeric, mood_level')
          .in('session_id', sessionIds)

        // Combine sessions with mood data
        const sessionsWithMood = sessions.map(session => ({
          ...session,
          mood_data: moods?.find(m => m.session_id === session.id)
        }))

        processSessionData(sessionsWithMood, orgs || [])

        // Load child progress
        const { data: children } = await supabase
          .from('profiles')
          .select('*')
          .eq('role', 'Child')

        if (children) {
          processChildProgress(children, sessionsWithMood)
        }
      } else {
        // No sessions found, set empty data
        setSessionData([])
        setChildProgress([])
      }

    } catch (error) {
      console.error('Error loading data:', error)
    } finally {
      setLoading(false)
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
        <div className="bg-gray-800 p-3 rounded-lg shadow-xl border border-gray-700">
          <p className="text-white font-semibold">{label}</p>
          {payload.map((entry: any, index: number) => (
            <p key={index} style={{ color: entry.color }}>
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
      <div className="min-h-screen bg-gradient-to-br from-gray-900 via-purple-900 to-gray-900 p-8">
        <div className="max-w-7xl mx-auto">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-center"
          >
            <h1 className="text-4xl font-bold text-white mb-4">Loading Analytics...</h1>
            <div className="inline-block animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-purple-500"></div>
          </motion.div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-900 via-purple-900 to-gray-900 p-8">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="mb-8"
        >
          <h1 className="text-5xl font-bold text-white mb-2">Check-in Progress Analytics</h1>
          <p className="text-gray-300">Real-time insights into children's wellbeing journeys</p>
        </motion.div>

        {/* Filters */}
        <motion.div
          initial={{ opacity: 0, x: -20 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ delay: 0.1 }}
          className="bg-gray-800/50 backdrop-blur rounded-xl p-6 mb-8"
        >
          <div className="flex flex-wrap gap-4">
            {/* Organization Filter */}
            <div className="flex-1 min-w-[200px]">
              <label className="text-gray-300 text-sm mb-2 block">Organization</label>
              <select
                value={selectedOrg}
                onChange={(e) => setSelectedOrg(e.target.value)}
                className="w-full bg-gray-700 text-white rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-purple-500"
              >
                <option value="all">All Organizations</option>
                {organizations.map(org => (
                  <option key={org.id} value={org.id}>{org.name}</option>
                ))}
              </select>
            </div>

            {/* Date Range */}
            <div className="flex-1 min-w-[200px]">
              <label className="text-gray-300 text-sm mb-2 block">Time Period</label>
              <div className="flex gap-2">
                {(['week', 'month', 'all'] as const).map(range => (
                  <button
                    key={range}
                    onClick={() => setDateRange(range)}
                    className={`flex-1 py-2 px-4 rounded-lg transition-all ${
                      dateRange === range
                        ? 'bg-purple-600 text-white'
                        : 'bg-gray-700 text-gray-300 hover:bg-gray-600'
                    }`}
                  >
                    {range === 'all' ? 'All Time' : range === 'week' ? 'Week' : 'Month'}
                  </button>
                ))}
              </div>
            </div>

            {/* View Mode */}
            <div className="flex-1 min-w-[300px]">
              <label className="text-gray-300 text-sm mb-2 block">View</label>
              <div className="flex gap-2">
                {(['overview', 'timeline', 'children', 'insights'] as const).map(mode => (
                  <button
                    key={mode}
                    onClick={() => setViewMode(mode)}
                    className={`flex-1 py-2 px-4 rounded-lg transition-all capitalize ${
                      viewMode === mode
                        ? 'bg-gradient-to-r from-purple-600 to-blue-600 text-white'
                        : 'bg-gray-700 text-gray-300 hover:bg-gray-600'
                    }`}
                  >
                    {mode}
                  </button>
                ))}
              </div>
            </div>
          </div>
        </motion.div>

        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          {[
            { label: 'Total Sessions', value: stats.totalSessions, icon: '📊', color: 'from-blue-600 to-purple-600' },
            { label: 'Avg Mood', value: stats.avgMood.toFixed(1), icon: '😊', color: 'from-green-600 to-teal-600' },
            { label: 'Active Children', value: childProgress.filter(c => c.totalSessions > 0).length, icon: '👥', color: 'from-purple-600 to-pink-600' },
            { label: 'Engagement', value: `${stats.engagementRate.toFixed(0)}%`, icon: '🎯', color: 'from-orange-600 to-red-600' },
          ].map((stat, index) => (
            <motion.div
              key={stat.label}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.2 + index * 0.1 }}
              className={`bg-gradient-to-br ${stat.color} p-6 rounded-xl shadow-xl`}
            >
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-white/80 text-sm">{stat.label}</p>
                  <p className="text-3xl font-bold text-white mt-1">{stat.value}</p>
                </div>
                <span className="text-4xl">{stat.icon}</span>
              </div>
            </motion.div>
          ))}
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
              <div className="bg-gray-800/50 backdrop-blur rounded-xl p-6">
                <h3 className="text-xl font-semibold text-white mb-4">Sessions Over Time</h3>
                <ResponsiveContainer width="100%" height={300}>
                  <AreaChart data={sessionData}>
                    <defs>
                      <linearGradient id="colorSessions" x1="0" y1="0" x2="0" y2="1">
                        <stop offset="5%" stopColor="#8B5CF6" stopOpacity={0.8}/>
                        <stop offset="95%" stopColor="#8B5CF6" stopOpacity={0.1}/>
                      </linearGradient>
                    </defs>
                    <CartesianGrid strokeDasharray="3 3" stroke="#374151" />
                    <XAxis dataKey="date" stroke="#9CA3AF" />
                    <YAxis stroke="#9CA3AF" />
                    <Tooltip content={<CustomTooltip />} />
                    <Area
                      type="monotone"
                      dataKey="sessions"
                      stroke="#8B5CF6"
                      fillOpacity={1}
                      fill="url(#colorSessions)"
                      strokeWidth={2}
                    />
                  </AreaChart>
                </ResponsiveContainer>
              </div>

              {/* Mood Trends */}
              <div className="bg-gray-800/50 backdrop-blur rounded-xl p-6">
                <h3 className="text-xl font-semibold text-white mb-4">Mood Trends</h3>
                <ResponsiveContainer width="100%" height={300}>
                  <LineChart data={sessionData}>
                    <CartesianGrid strokeDasharray="3 3" stroke="#374151" />
                    <XAxis dataKey="date" stroke="#9CA3AF" />
                    <YAxis domain={[0, 5]} stroke="#9CA3AF" />
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
              </div>
            </motion.div>
          )}

          {viewMode === 'timeline' && (
            <motion.div
              key="timeline"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="bg-gray-800/50 backdrop-blur rounded-xl p-6"
            >
              <h3 className="text-xl font-semibold text-white mb-4">Detailed Timeline</h3>
              <ResponsiveContainer width="100%" height={400}>
                <ComposedChart data={sessionData}>
                  <CartesianGrid strokeDasharray="3 3" stroke="#374151" />
                  <XAxis dataKey="date" stroke="#9CA3AF" />
                  <YAxis yAxisId="left" stroke="#9CA3AF" />
                  <YAxis yAxisId="right" orientation="right" stroke="#9CA3AF" />
                  <Tooltip content={<CustomTooltip />} />
                  <Legend />
                  <Bar yAxisId="left" dataKey="sessions" fill="#8B5CF6" opacity={0.8} />
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
              <div className="bg-gray-800/50 backdrop-blur rounded-xl p-6">
                <h3 className="text-xl font-semibold text-white mb-4">Individual Progress</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                  {childProgress.slice(0, 12).map((child) => (
                    <motion.div
                      key={child.id}
                      initial={{ opacity: 0, scale: 0.9 }}
                      animate={{ opacity: 1, scale: 1 }}
                      whileHover={{ scale: 1.05 }}
                      className="bg-gray-700/50 rounded-lg p-4 cursor-pointer"
                    >
                      <div className="flex items-center justify-between mb-2">
                        <h4 className="font-semibold text-white">{child.name}</h4>
                        <span className={`text-sm px-2 py-1 rounded ${
                          child.trend === 'up' ? 'bg-green-600' :
                          child.trend === 'down' ? 'bg-red-600' :
                          'bg-gray-600'
                        }`}>
                          {child.trend === 'up' ? '↑' : child.trend === 'down' ? '↓' : '→'}
                        </span>
                      </div>
                      <div className="space-y-2">
                        <div>
                          <div className="flex justify-between text-sm text-gray-400">
                            <span>Sessions</span>
                            <span>{child.totalSessions}</span>
                          </div>
                          <div className="w-full bg-gray-600 rounded-full h-2 mt-1">
                            <motion.div
                              initial={{ width: 0 }}
                              animate={{ width: `${child.progress}%` }}
                              transition={{ duration: 1, ease: "easeOut" }}
                              className="bg-gradient-to-r from-purple-600 to-blue-600 h-2 rounded-full"
                            />
                          </div>
                        </div>
                        <div className="flex justify-between text-sm">
                          <span className="text-gray-400">Avg Mood</span>
                          <span className="text-white">
                            {['😢', '😕', '😐', '🙂', '😊'][Math.floor(child.avgMood)]}
                            {' '}
                            {child.avgMood.toFixed(1)}
                          </span>
                        </div>
                      </div>
                    </motion.div>
                  ))}
                </div>
              </div>
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
              <div className="bg-gray-800/50 backdrop-blur rounded-xl p-6">
                <h3 className="text-xl font-semibold text-white mb-4">Engagement by Organization</h3>
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
              </div>

              {/* Progress Distribution */}
              <div className="bg-gray-800/50 backdrop-blur rounded-xl p-6">
                <h3 className="text-xl font-semibold text-white mb-4">Progress Distribution</h3>
                <ResponsiveContainer width="100%" height={300}>
                  <BarChart
                    data={[
                      { range: '0-25%', count: childProgress.filter(c => c.progress <= 25).length },
                      { range: '26-50%', count: childProgress.filter(c => c.progress > 25 && c.progress <= 50).length },
                      { range: '51-75%', count: childProgress.filter(c => c.progress > 50 && c.progress <= 75).length },
                      { range: '76-100%', count: childProgress.filter(c => c.progress > 75).length },
                    ]}
                  >
                    <CartesianGrid strokeDasharray="3 3" stroke="#374151" />
                    <XAxis dataKey="range" stroke="#9CA3AF" />
                    <YAxis stroke="#9CA3AF" />
                    <Tooltip content={<CustomTooltip />} />
                    <Bar dataKey="count" fill="#8B5CF6" />
                  </BarChart>
                </ResponsiveContainer>
              </div>

              {/* Key Insights */}
              <div className="bg-gray-800/50 backdrop-blur rounded-xl p-6 lg:col-span-2">
                <h3 className="text-xl font-semibold text-white mb-4">Key Insights</h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div className="bg-gradient-to-r from-green-600/20 to-teal-600/20 border border-green-600/30 rounded-lg p-4">
                    <h4 className="text-green-400 font-semibold mb-2">Top Performers</h4>
                    <ul className="space-y-1">
                      {childProgress
                        .filter(c => c.trend === 'up')
                        .slice(0, 3)
                        .map(child => (
                          <li key={child.id} className="text-gray-300 text-sm">
                            {child.name} - {child.totalSessions} sessions
                          </li>
                        ))}
                    </ul>
                  </div>

                  <div className="bg-gradient-to-r from-yellow-600/20 to-orange-600/20 border border-yellow-600/30 rounded-lg p-4">
                    <h4 className="text-yellow-400 font-semibold mb-2">Need Attention</h4>
                    <ul className="space-y-1">
                      {childProgress
                        .filter(c => c.totalSessions < 5)
                        .slice(0, 3)
                        .map(child => (
                          <li key={child.id} className="text-gray-300 text-sm">
                            {child.name} - Last: {child.lastSession ? new Date(child.lastSession).toLocaleDateString() : 'Never'}
                          </li>
                        ))}
                    </ul>
                  </div>

                  <div className="bg-gradient-to-r from-purple-600/20 to-pink-600/20 border border-purple-600/30 rounded-lg p-4">
                    <h4 className="text-purple-400 font-semibold mb-2">Recent Activity</h4>
                    <p className="text-gray-300 text-sm">
                      {sessionData.slice(0, 3).map(d => (
                        <span key={d.date} className="block">
                          {d.date}: {d.sessions} sessions
                        </span>
                      ))}
                    </p>
                  </div>
                </div>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  )
}