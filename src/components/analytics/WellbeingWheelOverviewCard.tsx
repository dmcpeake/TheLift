import React, { useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { getSupabaseClient } from '../../utils/supabase/client.tsx'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { DataLoader } from '../shared/LottieLoader'
import {
  TrendingUp, TrendingDown, Heart, Activity,
  ChevronDown, ChevronUp, Calendar, User, Users,
  Smile, Home, Briefcase, HeartPulse, Laugh, Shield, Brain
} from 'lucide-react'

// Wellbeing section icons and labels
const WELLBEING_SECTIONS = {
  my_friends: { icon: Users, label: 'Friends', color: '#3B82F6' },
  my_work: { icon: Briefcase, label: 'Work/School', color: '#8B5CF6' },
  my_health: { icon: HeartPulse, label: 'Health', color: '#EF4444' },
  my_family: { icon: Home, label: 'Family', color: '#F59E0B' },
  my_fun_play: { icon: Laugh, label: 'Fun & Play', color: '#10B981' },
  my_safety: { icon: Shield, label: 'Safety', color: '#6366F1' },
  my_emotions: { icon: Brain, label: 'Emotions', color: '#EC4899' }
}

// Mood level mapping
const MOOD_LEVELS = {
  1: { color: '#EF4444', emoji: '😢', label: 'Very Sad' },
  2: { color: '#F97316', emoji: '😕', label: 'Sad' },
  3: { color: '#FCD34D', emoji: '😐', label: 'OK' },
  4: { color: '#86EFAC', emoji: '🙂', label: 'Happy' }
}

interface WellbeingData {
  date: string
  childId: string
  childName: string
  overallScore: number
  sections: {
    name: string
    score: number
    response: string
  }[]
}

interface ChildTrend {
  id: string
  name: string
  currentScore: number
  trend: 'improving' | 'declining' | 'stable'
  lastWeekAvg: number
  thisWeekAvg: number
  concernLevel: 'high' | 'medium' | 'low' | 'none'
  lastSeen: string
  sectionAverages: Record<string, number>
}

interface SectionSummary {
  section: string
  average: number
  concernCount: number
  positiveCount: number
}

interface WellbeingWheelOverviewCardProps {
  selectedOrg?: string
  dateRange?: 'week' | 'month' | 'all'
}

export function WellbeingWheelOverviewCard({ selectedOrg = 'all', dateRange = 'week' }: WellbeingWheelOverviewCardProps) {
  const [loading, setLoading] = useState(true)
  const [expanded, setExpanded] = useState(false)
  const [wellbeingData, setWellbeingData] = useState<WellbeingData[]>([])
  const [childTrends, setChildTrends] = useState<ChildTrend[]>([])
  const [sectionSummaries, setSectionSummaries] = useState<SectionSummary[]>([])
  const [stats, setStats] = useState({
    totalCheckIns: 0,
    averageScore: 0,
    childrenWithConcerns: 0,
    mostPositiveSection: '',
    mostConcerningSection: ''
  })

  useEffect(() => {
    loadWellbeingData()
  }, [dateRange, selectedOrg])

  const loadWellbeingData = async () => {
    try {
      setLoading(true)
      console.log('WellbeingWheelOverviewCard: Starting to load data', { dateRange, selectedOrg })

      const supabase = getSupabaseClient()

      // Get date range - looking back further to catch historical test data
      const now = new Date()
      let startDate = new Date()

      if (dateRange === 'week') {
        // Look back 12 months for test data
        startDate.setMonth(now.getMonth() - 12)
      } else if (dateRange === 'month') {
        startDate.setMonth(now.getMonth() - 12)
      } else {
        startDate.setFullYear(now.getFullYear() - 2)
      }

      console.log('Date range:', { startDate: startDate.toISOString(), now: now.toISOString() })

      // Fetch wellbeing wheel usage data
      let wheelQuery = supabase
        .from('wellbeing_wheel_usage')
        .select(`
          id,
          child_id,
          overall_score,
          completed_at,
          profiles!inner(name)
        `)
        .gte('completed_at', startDate.toISOString())
        .order('completed_at', { ascending: false })

      if (selectedOrg && selectedOrg !== 'all') {
        wheelQuery = wheelQuery.eq('org_id', selectedOrg)
      }

      console.log('Executing wellbeing wheel query...')
      const { data: wheelData, error: wheelError } = await wheelQuery

      console.log('Wellbeing wheel query result:', { wheelData, wheelError })

      if (wheelError) {
        console.error('Wellbeing wheel query error:', wheelError)
        throw wheelError
      }

      // Fetch sections for each wellbeing wheel check-in
      const wellbeingCheckIns: WellbeingData[] = []

      if (wheelData) {
        for (const wheel of wheelData) {
          const { data: sections, error: sectionsError } = await supabase
            .from('wellbeing_wheel_sections')
            .select('section_name, mood_numeric, text_response')
            .eq('wellbeing_wheel_id', wheel.id)

          if (!sectionsError && sections) {
            wellbeingCheckIns.push({
              date: wheel.completed_at,
              childId: wheel.child_id,
              childName: (wheel.profiles as any)?.name || 'Unknown',
              overallScore: wheel.overall_score,
              sections: sections.map(s => ({
                name: s.section_name,
                score: s.mood_numeric,
                response: s.text_response
              }))
            })
          }
        }
      }

      setWellbeingData(wellbeingCheckIns)

      // Calculate child trends
      const childMap = new Map<string, WellbeingData[]>()
      wellbeingCheckIns.forEach(checkin => {
        if (!childMap.has(checkin.childId)) {
          childMap.set(checkin.childId, [])
        }
        childMap.get(checkin.childId)!.push(checkin)
      })

      const trends: ChildTrend[] = []
      childMap.forEach((checkins, childId) => {
        const sortedCheckins = checkins.sort((a, b) =>
          new Date(b.date).getTime() - new Date(a.date).getTime()
        )

        const thisWeekCheckins = sortedCheckins.filter(c => {
          const checkDate = new Date(c.date)
          const weekAgo = new Date()
          weekAgo.setDate(weekAgo.getDate() - 7)
          return checkDate >= weekAgo
        })

        const lastWeekCheckins = sortedCheckins.filter(c => {
          const checkDate = new Date(c.date)
          const twoWeeksAgo = new Date()
          const oneWeekAgo = new Date()
          twoWeeksAgo.setDate(twoWeeksAgo.getDate() - 14)
          oneWeekAgo.setDate(oneWeekAgo.getDate() - 7)
          return checkDate >= twoWeeksAgo && checkDate < oneWeekAgo
        })

        const thisWeekAvg = thisWeekCheckins.length > 0
          ? thisWeekCheckins.reduce((sum, c) => sum + c.overallScore, 0) / thisWeekCheckins.length
          : 0

        const lastWeekAvg = lastWeekCheckins.length > 0
          ? lastWeekCheckins.reduce((sum, c) => sum + c.overallScore, 0) / lastWeekCheckins.length
          : thisWeekAvg

        let trend: 'improving' | 'declining' | 'stable' = 'stable'
        if (thisWeekAvg > lastWeekAvg + 0.3) trend = 'improving'
        else if (thisWeekAvg < lastWeekAvg - 0.3) trend = 'declining'

        const concernLevel = thisWeekAvg < 2.5 ? 'high' :
                            thisWeekAvg < 3.0 ? 'medium' :
                            thisWeekAvg < 3.5 ? 'low' : 'none'

        // Calculate section averages
        const sectionAverages: Record<string, number> = {}
        const sectionCounts: Record<string, number> = {}

        sortedCheckins.forEach(checkin => {
          checkin.sections.forEach(section => {
            if (!sectionAverages[section.name]) {
              sectionAverages[section.name] = 0
              sectionCounts[section.name] = 0
            }
            sectionAverages[section.name] += section.score
            sectionCounts[section.name]++
          })
        })

        Object.keys(sectionAverages).forEach(key => {
          sectionAverages[key] = sectionAverages[key] / sectionCounts[key]
        })

        trends.push({
          id: childId,
          name: sortedCheckins[0].childName,
          currentScore: sortedCheckins[0].overallScore,
          trend,
          lastWeekAvg,
          thisWeekAvg,
          concernLevel,
          lastSeen: sortedCheckins[0].date,
          sectionAverages
        })
      })

      // Sort by concern level
      trends.sort((a, b) => {
        const concernOrder = { high: 0, medium: 1, low: 2, none: 3 }
        return concernOrder[a.concernLevel] - concernOrder[b.concernLevel]
      })

      setChildTrends(trends)

      // Calculate section summaries
      const sectionData: Record<string, { total: number; count: number; concerns: number; positive: number }> = {}

      wellbeingCheckIns.forEach(checkin => {
        checkin.sections.forEach(section => {
          if (!sectionData[section.name]) {
            sectionData[section.name] = { total: 0, count: 0, concerns: 0, positive: 0 }
          }
          sectionData[section.name].total += section.score
          sectionData[section.name].count++
          if (section.score <= 2) sectionData[section.name].concerns++
          if (section.score >= 4) sectionData[section.name].positive++
        })
      })

      const summaries: SectionSummary[] = Object.keys(sectionData).map(section => ({
        section,
        average: sectionData[section].total / sectionData[section].count,
        concernCount: sectionData[section].concerns,
        positiveCount: sectionData[section].positive
      }))

      summaries.sort((a, b) => a.average - b.average)
      setSectionSummaries(summaries)

      // Calculate stats
      const avgScore = wellbeingCheckIns.length > 0
        ? wellbeingCheckIns.reduce((sum, c) => sum + c.overallScore, 0) / wellbeingCheckIns.length
        : 0

      const childrenWithConcerns = trends.filter(t =>
        t.concernLevel === 'high' || t.concernLevel === 'medium'
      ).length

      setStats({
        totalCheckIns: wellbeingCheckIns.length,
        averageScore: Math.round(avgScore * 10) / 10,
        childrenWithConcerns,
        mostPositiveSection: summaries[summaries.length - 1]?.section || '',
        mostConcerningSection: summaries[0]?.section || ''
      })

    } catch (error) {
      console.error('Error loading wellbeing data:', error)
    } finally {
      setLoading(false)
    }
  }

  const formatSectionName = (section: string): string => {
    return WELLBEING_SECTIONS[section as keyof typeof WELLBEING_SECTIONS]?.label || section
  }

  const getSectionIcon = (section: string) => {
    const Icon = WELLBEING_SECTIONS[section as keyof typeof WELLBEING_SECTIONS]?.icon || Activity
    return <Icon className="h-4 w-4" />
  }

  const getSectionColor = (section: string): string => {
    return WELLBEING_SECTIONS[section as keyof typeof WELLBEING_SECTIONS]?.color || '#6B7280'
  }

  const getTrendIcon = (trend: string) => {
    if (trend === 'improving') return <TrendingUp className="h-4 w-4 text-green-600" />
    if (trend === 'declining') return <TrendingDown className="h-4 w-4 text-red-600" />
    return <div className="h-4 w-4" />
  }

  const getConcernBadgeColor = (level: string): string => {
    switch (level) {
      case 'high': return 'bg-red-100 text-red-800'
      case 'medium': return 'bg-amber-100 text-amber-800'
      case 'low': return 'bg-yellow-100 text-yellow-800'
      default: return 'bg-green-100 text-green-800'
    }
  }

  if (loading) {
    return (
      <Card>
        <CardContent className="p-6">
          <DataLoader message="Loading wellbeing data..." />
        </CardContent>
      </Card>
    )
  }

  return (
    <Card className="hover:shadow-lg transition-shadow">
      <CardHeader
        className="cursor-pointer select-none"
        onClick={() => setExpanded(!expanded)}
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="h-10 w-10 rounded-lg bg-purple-100 flex items-center justify-center">
              <Heart className="h-5 w-5 text-purple-600" />
            </div>
            <div>
              <CardTitle className="text-lg">Wellbeing Wheel Check-ins</CardTitle>
              <p className="text-sm text-gray-500 mt-1">
                {stats.totalCheckIns} check-ins • Avg score: {stats.averageScore}/4
              </p>
            </div>
          </div>
          <div className="flex items-center gap-4">
            {stats.childrenWithConcerns > 0 && (
              <div className="flex items-center gap-2 px-3 py-1 bg-amber-100 rounded-full">
                <Activity className="h-4 w-4 text-amber-600" />
                <span className="text-sm font-medium text-amber-800">
                  {stats.childrenWithConcerns} need support
                </span>
              </div>
            )}
            {expanded ? (
              <ChevronUp className="h-5 w-5 text-gray-400" />
            ) : (
              <ChevronDown className="h-5 w-5 text-gray-400" />
            )}
          </div>
        </div>
      </CardHeader>

      <AnimatePresence>
        {expanded && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.3 }}
          >
            <CardContent className="space-y-6 pt-0">
              {/* Section Summary */}
              <div>
                <h4 className="text-sm font-semibold text-gray-700 mb-3">Wellbeing Categories</h4>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                  {sectionSummaries.map((summary) => (
                    <div
                      key={summary.section}
                      className="p-3 border rounded-lg hover:shadow-md transition-shadow"
                      style={{ borderLeftWidth: '4px', borderLeftColor: getSectionColor(summary.section) }}
                    >
                      <div className="flex items-center justify-between mb-2">
                        <div className="flex items-center gap-2">
                          <div style={{ color: getSectionColor(summary.section) }}>
                            {getSectionIcon(summary.section)}
                          </div>
                          <span className="text-sm font-medium text-gray-900">
                            {formatSectionName(summary.section)}
                          </span>
                        </div>
                        <span className="text-lg font-bold" style={{ color: getSectionColor(summary.section) }}>
                          {summary.average.toFixed(1)}
                        </span>
                      </div>
                      <div className="flex gap-2 text-xs text-gray-500">
                        {summary.concernCount > 0 && (
                          <span className="text-red-600">
                            {summary.concernCount} concerns
                          </span>
                        )}
                        {summary.positiveCount > 0 && (
                          <span className="text-green-600">
                            {summary.positiveCount} positive
                          </span>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Children Trends */}
              <div>
                <h4 className="text-sm font-semibold text-gray-700 mb-3">Individual Child Trends</h4>
                <div className="space-y-2">
                  {childTrends.slice(0, 10).map((child) => (
                    <div
                      key={child.id}
                      className="p-4 border rounded-lg hover:bg-gray-50 transition-colors"
                    >
                      <div className="flex items-center justify-between mb-2">
                        <div className="flex items-center gap-3">
                          <div className="h-8 w-8 rounded-full bg-gray-200 flex items-center justify-center">
                            <User className="h-4 w-4 text-gray-600" />
                          </div>
                          <div>
                            <p className="font-medium text-gray-900">{child.name}</p>
                            <p className="text-xs text-gray-500">
                              Current: {child.currentScore.toFixed(1)} • Last week: {child.lastWeekAvg.toFixed(1)}
                            </p>
                          </div>
                        </div>
                        <div className="flex items-center gap-2">
                          {getTrendIcon(child.trend)}
                          <span className={`px-2 py-1 rounded-full text-xs font-medium ${getConcernBadgeColor(child.concernLevel)}`}>
                            {child.concernLevel === 'none' ? 'Good' : child.concernLevel}
                          </span>
                        </div>
                      </div>

                      {/* Section scores for this child */}
                      <div className="grid grid-cols-7 gap-1 mt-3">
                        {Object.entries(child.sectionAverages).map(([section, score]) => (
                          <div
                            key={section}
                            className="flex flex-col items-center"
                            title={`${formatSectionName(section)}: ${score.toFixed(1)}`}
                          >
                            <div
                              className="w-full h-12 rounded flex items-end justify-center pb-1"
                              style={{
                                backgroundColor: `${getSectionColor(section)}20`,
                                borderBottom: `3px solid ${getSectionColor(section)}`
                              }}
                            >
                              <span className="text-xs font-medium" style={{ color: getSectionColor(section) }}>
                                {score.toFixed(1)}
                              </span>
                            </div>
                            <span className="text-xs text-gray-500 mt-1">
                              {formatSectionName(section).split(' ')[0]}
                            </span>
                          </div>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>

                {childTrends.length > 10 && (
                  <p className="text-sm text-gray-500 text-center mt-3">
                    Showing 10 of {childTrends.length} children
                  </p>
                )}

                {childTrends.length === 0 && (
                  <p className="text-sm text-gray-500 text-center py-8">
                    No wellbeing wheel check-ins found for the selected period
                  </p>
                )}
              </div>
            </CardContent>
          </motion.div>
        )}
      </AnimatePresence>
    </Card>
  )
}
