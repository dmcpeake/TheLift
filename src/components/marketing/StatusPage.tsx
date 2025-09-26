import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { MarketingNavigation } from './MarketingNavigation'
import { getSupabaseClient } from '../../utils/supabase/client'
import {
  CheckCircle,
  Circle,
  Clock,
  Database,
  Users,
  Activity,
  BarChart3,
  Calendar,
  ArrowRight,
  Package,
  Mail,
  Lock,
  Sparkles,
  TreePine,
  BookOpen
} from 'lucide-react'

interface DBStats {
  totalChildren: number
  totalCheckIns: number
  totalOrganizations: number
  totalMoodEntries: number
  avgMoodScore: number
  lastUpdated: string
}

export function StatusPage() {
  const [dbStats, setDbStats] = useState<DBStats>({
    totalChildren: 0,
    totalCheckIns: 0,
    totalOrganizations: 0,
    totalMoodEntries: 0,
    avgMoodScore: 0,
    lastUpdated: new Date().toISOString()
  })
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetchDatabaseStats()
  }, [])

  const fetchDatabaseStats = async () => {
    try {
      const supabase = getSupabaseClient()

      // Fetch children count
      const { count: childrenCount } = await supabase
        .from('profiles')
        .select('*', { count: 'exact', head: true })
        .eq('role', 'Child')

      // Fetch check-ins count
      const { count: checkInsCount } = await supabase
        .from('checkin_sessions')
        .select('*', { count: 'exact', head: true })
        .eq('status', 'completed')

      // Fetch organizations count
      const { count: orgsCount } = await supabase
        .from('organisations')
        .select('*', { count: 'exact', head: true })

      // Fetch mood entries and calculate average
      const { data: moodData, count: moodCount } = await supabase
        .from('mood_meter_usage')
        .select('mood_numeric')
        .not('mood_numeric', 'is', null)

      let avgMood = 0
      if (moodData && moodData.length > 0) {
        const sum = moodData.reduce((acc, m) => acc + (m.mood_numeric || 0), 0)
        avgMood = sum / moodData.length
      }

      setDbStats({
        totalChildren: childrenCount || 0,
        totalCheckIns: checkInsCount || 0,
        totalOrganizations: orgsCount || 0,
        totalMoodEntries: moodCount || 0,
        avgMoodScore: Math.round(avgMood * 10) / 10,
        lastUpdated: new Date().toISOString()
      })
    } catch (error) {
      console.error('Error fetching database stats:', error)
    } finally {
      setLoading(false)
    }
  }

  const completedMilestones = [
    {
      icon: <CheckCircle className="h-5 w-5" />,
      title: "Check-in Tools v1",
      description: "Mood meter, emotion grid, breathing exercises, wellbeing wheel",
      date: "Completed",
      status: "completed"
    },
    {
      icon: <BarChart3 className="h-5 w-5" />,
      title: "Analytics Dashboard v1",
      description: "Child summaries, AI insights, mood trends, critical alerts",
      date: "Completed",
      status: "completed"
    },
    {
      icon: <Database className="h-5 w-5" />,
      title: "Test Data Generation",
      description: `${dbStats.totalChildren} children, ${dbStats.totalCheckIns} check-ins across ${dbStats.totalOrganizations} organizations`,
      date: "Completed",
      status: "completed"
    }
  ]

  const upcomingMilestones = [
    {
      icon: <TreePine className="h-5 w-5" />,
      title: "Garden Content",
      description: "Interactive wellbeing garden with rewards and progress tracking",
      date: "Sep 30 - Oct 11",
      status: "upcoming",
      week: "Week 1-2",
      type: "design"
    },
    {
      icon: <Sparkles className="h-5 w-5" />,
      title: "Check-in Tools v2",
      description: "User feedback integration, improved UX, accessibility enhancements",
      date: "Sep 30 - Oct 11",
      status: "upcoming",
      week: "Week 1-2",
      type: "design"
    },
    {
      icon: <Lock className="h-5 w-5" />,
      title: "Email/Password Login",
      description: "Secure authentication system for all user types",
      date: "Oct 7 - Oct 18",
      status: "upcoming",
      week: "Week 2-3",
      type: "development"
    },
    {
      icon: <Database className="h-5 w-5" />,
      title: "Database Integration",
      description: "Connect check-in tools to live database",
      date: "Oct 14 - Oct 25",
      status: "upcoming",
      week: "Week 3-4",
      type: "development"
    },
    {
      icon: <BookOpen className="h-5 w-5" />,
      title: "Educational Content",
      description: "Resources for children, parents, and practitioners",
      date: "Oct 28 - Nov 6",
      status: "upcoming",
      week: "Week 5-6",
      type: "design"
    },
    {
      icon: <Package className="h-5 w-5" />,
      title: "Pilot Launch",
      description: "Full system ready for initial deployment",
      date: "Nov 6, 2024",
      status: "milestone",
      week: "Launch",
      type: "milestone"
    }
  ]

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleString('en-US', {
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })
  }

  return (
    <>
      <MarketingNavigation />
      <div className="min-h-screen bg-gradient-to-b from-blue-50 via-purple-50 to-pink-50">


        {/* Progress Timeline */}
        <section className="px-4 sm:px-6 lg:px-8" style={{ paddingTop: '50px', paddingBottom: '50px' }}>
          <div className="max-w-7xl mx-auto">
            <div className="text-center mb-12">
              <h2 className="text-3xl font-bold text-gray-900 mb-4">Development Status</h2>
              <p className="text-gray-600">September 29 - November 6, 2024</p>
            </div>

            <div className="grid lg:grid-cols-2 gap-12">
              {/* Completed Section */}
              <div>
                <h3 className="text-xl font-semibold text-gray-900 mb-6 flex items-center">
                  <CheckCircle className="h-6 w-6 text-green-600 mr-2" />
                  Completed Milestones
                </h3>
                <div className="space-y-4">
                  {completedMilestones.map((milestone, index) => (
                    <div key={index} className="bg-green-50 border border-green-200 rounded-xl p-4">
                      <div className="flex items-start">
                        <div className="flex-shrink-0 bg-green-600 text-white rounded-lg p-2 mr-4">
                          {milestone.icon}
                        </div>
                        <div className="flex-1">
                          <h4 className="font-semibold text-gray-900">{milestone.title}</h4>
                          <p className="text-sm text-gray-600 mt-1">{milestone.description}</p>
                          <div className="flex items-center mt-2 text-xs text-green-700">
                            <CheckCircle className="h-3 w-3 mr-1" />
                            {milestone.date}
                          </div>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Upcoming Section */}
              <div>
                <h3 className="text-xl font-semibold text-gray-900 mb-6 flex items-center">
                  <Clock className="h-6 w-6 text-blue-600 mr-2" />
                  Upcoming Milestones
                </h3>
                <div className="space-y-4">
                  {upcomingMilestones.map((milestone, index) => {
                    const iconBgColor =
                      milestone.type === 'design' ? '#9333ea' :
                      milestone.type === 'development' ? '#2563eb' :
                      '#6b7280';

                    const tagBgColor =
                      milestone.type === 'design' ? '#f3e8ff' :
                      milestone.type === 'development' ? '#dbeafe' :
                      '#f3f4f6';

                    const tagTextColor =
                      milestone.type === 'design' ? '#6b21a8' :
                      milestone.type === 'development' ? '#1e40af' :
                      '#374151';

                    const typeLabel =
                      milestone.type === 'design' ? 'Design' :
                      milestone.type === 'development' ? 'Dev' :
                      '';

                    return (
                      <div
                        key={index}
                        className="bg-white border-gray-200 border rounded-xl p-4"
                      >
                        <div className="flex items-start">
                          <div
                            className="flex-shrink-0 text-white rounded-lg p-2 mr-4"
                            style={{ backgroundColor: iconBgColor }}
                          >
                            {milestone.icon}
                          </div>
                          <div className="flex-1">
                            <div className="flex items-center gap-2">
                              <h4 className="font-semibold text-gray-900">{milestone.title}</h4>
                              {typeLabel && (
                                <span
                                  className="text-xs px-2 py-0.5 rounded-full font-medium"
                                  style={{
                                    backgroundColor: tagBgColor,
                                    color: tagTextColor
                                  }}
                                >
                                  {typeLabel}
                                </span>
                              )}
                            </div>
                            <p className="text-sm text-gray-600 mt-1">{milestone.description}</p>
                            <div className="flex items-center justify-between mt-2">
                              <span className="text-xs text-gray-500 flex items-center">
                                <Calendar className="h-3 w-3 mr-1" />
                                {milestone.date}
                              </span>
                              <span className="text-xs px-2 py-1 rounded-full bg-gray-100 text-gray-700">
                                {milestone.week}
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>
                    )
                  })}
                </div>
              </div>
            </div>

          </div>
        </section>

      </div>
    </>
  )
}