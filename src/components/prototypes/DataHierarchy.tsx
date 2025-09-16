import React, { useState, useEffect } from 'react'
import { getSupabaseClient } from '../../utils/supabase/client'

const supabase = getSupabaseClient()

interface Organization {
  id: string
  name: string
  practitioners?: Practitioner[]
}

interface Practitioner {
  id: string
  name: string
  email: string
  org_id: string
  role: string
  children?: Child[]
}

interface Child {
  id: string
  first_name: string
  date_of_birth?: string
  primary_practitioner_id: string
  profile?: any
  checkins?: CheckIn[]
}

interface CheckIn {
  id: string
  type: string
  data: any
  created_at: string
}

export function DataHierarchy() {
  const [organizations, setOrganizations] = useState<Organization[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [expandedOrgs, setExpandedOrgs] = useState<Set<string>>(new Set())
  const [expandedPractitioners, setExpandedPractitioners] = useState<Set<string>>(new Set())
  const [expandedChildren, setExpandedChildren] = useState<Set<string>>(new Set())

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    try {
      setLoading(true)
      setError(null)

      // Load organizations (note: table is 'organisations' with an 's')
      const { data: orgs, error: orgError } = await supabase
        .from('organisations')
        .select('*')
        .order('name')

      if (orgError) {
        console.error('Organization error:', orgError)
        throw new Error(`Failed to load organizations: ${orgError.message}`)
      }

      // Load practitioners (from profiles table with role filter)
      const { data: practitioners, error: practError } = await supabase
        .from('profiles')
        .select('*')
        .in('role', ['Practitioner', 'GroupContact'])
        .order('name')

      if (practError) {
        console.error('Practitioner error:', practError)
        throw new Error(`Failed to load practitioners: ${practError.message}`)
      }

      // Load children with their profile info
      const { data: children, error: childError } = await supabase
        .from('children')
        .select('*, profile:profiles!children_id_fkey(name, email)')
        .order('first_name')

      if (childError) {
        console.error('Children error:', childError)
        throw new Error(`Failed to load children: ${childError.message}`)
      }

      // Load check-in sessions
      const { data: sessions, error: sessionError } = await supabase
        .from('checkin_sessions')
        .select('*')
        .order('created_at', { ascending: false })

      if (sessionError) console.warn('Sessions table may not exist:', sessionError)

      // Load breathing data
      const { data: breathingData, error: breathingError } = await supabase
        .from('breathing_tool_data')
        .select('*')

      if (breathingError) console.warn('Breathing data table may not exist:', breathingError)

      // Load mood meter data
      const { data: moodData, error: moodError } = await supabase
        .from('mood_meter_data')
        .select('*')

      if (moodError) console.warn('Mood meter table may not exist:', moodError)

      // Load emotion grid data
      const { data: emotionData, error: emotionError } = await supabase
        .from('emotion_grid_data')
        .select('*')

      if (emotionError) console.warn('Emotion grid table may not exist:', emotionError)

      // Load wellbeing wheel data
      const { data: wellbeingData, error: wellbeingError } = await supabase
        .from('wellbeing_wheel_data')
        .select('*')

      if (wellbeingError) console.warn('Wellbeing wheel table may not exist:', wellbeingError)

      // Organize data hierarchically
      const organizedData = (orgs || []).map(org => {
        const orgPractitioners = (practitioners || []).filter(p => p.org_id === org.id)

        return {
          ...org,
          practitioners: orgPractitioners.map(pract => {
            const practChildren = (children || []).filter(c => c.primary_practitioner_id === pract.id)

            return {
              ...pract,
              children: practChildren.map(child => {
                const childSessions = (sessions || []).filter(s => s.child_id === child.id)

                const checkins: CheckIn[] = []

                // Add session data
                childSessions?.forEach(s => {
                  checkins.push({
                    id: s.id,
                    type: 'Check-in Session',
                    data: {
                      session_type: s.session_type,
                      completed: s.completed
                    },
                    created_at: s.created_at
                  })
                })

                // Add breathing data
                const childBreathing = (breathingData || []).filter(b => b.child_id === child.id)
                childBreathing.forEach(b => {
                  checkins.push({
                    id: b.id,
                    type: 'Breathing',
                    data: {
                      pattern: b.pattern_type,
                      duration: b.duration_seconds,
                      completion_rate: b.completion_rate
                    },
                    created_at: b.created_at
                  })
                })

                // Add mood data
                const childMood = (moodData || []).filter(m => m.child_id === child.id)
                childMood.forEach(m => {
                  checkins.push({
                    id: m.id,
                    type: 'Mood Meter',
                    data: {
                      mood_level: m.mood_level,
                      mood_numeric: m.mood_numeric
                    },
                    created_at: m.created_at
                  })
                })

                // Add emotion data
                const childEmotion = (emotionData || []).filter(e => e.child_id === child.id)
                childEmotion.forEach(e => {
                  checkins.push({
                    id: e.id,
                    type: 'Emotion Grid',
                    data: {
                      selected_emotions: e.selected_emotions,
                      story: e.story,
                      selected_help_options: e.selected_help_options
                    },
                    created_at: e.created_at
                  })
                })

                // Add wellbeing data
                const childWellbeing = (wellbeingData || []).filter(w => w.child_id === child.id)
                childWellbeing.forEach(w => {
                  checkins.push({
                    id: w.id,
                    type: 'Wellbeing Wheel',
                    data: {
                      area: w.area,
                      rating: w.rating,
                      mood: w.mood,
                      notes: w.notes
                    },
                    created_at: w.created_at
                  })
                })

                // Sort checkins by date
                checkins.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())

                return {
                  ...child,
                  checkins
                }
              })
            }
          })
        }
      })

      setOrganizations(organizedData)
      console.log('Loaded data:', {
        organizations: orgs?.length || 0,
        practitioners: practitioners?.length || 0,
        children: children?.length || 0
      })
    } catch (err) {
      console.error('Error loading data:', err)
      setError(err instanceof Error ? err.message : 'Failed to load data')
    } finally {
      setLoading(false)
    }
  }

  const toggleOrg = (orgId: string) => {
    const newExpanded = new Set(expandedOrgs)
    if (newExpanded.has(orgId)) {
      newExpanded.delete(orgId)
    } else {
      newExpanded.add(orgId)
    }
    setExpandedOrgs(newExpanded)
  }

  const togglePractitioner = (practId: string) => {
    const newExpanded = new Set(expandedPractitioners)
    if (newExpanded.has(practId)) {
      newExpanded.delete(practId)
    } else {
      newExpanded.add(practId)
    }
    setExpandedPractitioners(newExpanded)
  }

  const toggleChild = (childId: string) => {
    const newExpanded = new Set(expandedChildren)
    if (newExpanded.has(childId)) {
      newExpanded.delete(childId)
    } else {
      newExpanded.add(childId)
    }
    setExpandedChildren(newExpanded)
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-900 text-white p-8">
        <div className="max-w-7xl mx-auto">
          <h1 className="text-3xl font-bold mb-8">Supabase Data Hierarchy</h1>
          <div className="text-gray-400">Loading data...</div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-900 text-white p-8">
        <div className="max-w-7xl mx-auto">
          <h1 className="text-3xl font-bold mb-8">Supabase Data Hierarchy</h1>
          <div className="bg-red-900/20 border border-red-500 rounded-lg p-4">
            <div className="text-red-400">Error: {error}</div>
            <button
              onClick={loadData}
              className="mt-4 px-4 py-2 bg-red-600 rounded hover:bg-red-700"
            >
              Retry
            </button>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-900 text-white p-8">
      <div className="max-w-7xl mx-auto">
        <div className="flex justify-between items-center mb-8">
          <h1 className="text-3xl font-bold">Supabase Data Hierarchy</h1>
          <button
            onClick={loadData}
            className="px-4 py-2 bg-blue-600 rounded hover:bg-blue-700"
          >
            Refresh Data
          </button>
        </div>

        {organizations.length === 0 ? (
          <div className="bg-gray-800 rounded-lg p-8 text-center">
            <div className="text-gray-400 mb-4">No organizations found in the database</div>
            <div className="text-sm text-gray-500">
              Make sure the database has been seeded with test data
            </div>
          </div>
        ) : (
          <div className="space-y-4">
            {organizations.map(org => (
              <div key={org.id} className="bg-gray-800 rounded-lg p-4">
                <div
                  className="flex items-center justify-between cursor-pointer hover:bg-gray-700/30 p-2 rounded"
                  onClick={() => toggleOrg(org.id)}
                >
                  <div className="flex items-center gap-2">
                    <span className="text-xl">
                      {expandedOrgs.has(org.id) ? '▼' : '▶'}
                    </span>
                    <span className="text-lg font-semibold text-blue-400">
                      🏢 {org.name}
                    </span>
                    <span className="text-gray-500 text-sm">
                      ({org.practitioners?.length || 0} practitioners)
                    </span>
                  </div>
                </div>

                {expandedOrgs.has(org.id) && org.practitioners && org.practitioners.length > 0 && (
                  <div className="ml-8 mt-4 space-y-3">
                    {org.practitioners.map(pract => (
                      <div key={pract.id} className="bg-gray-700 rounded-lg p-3">
                        <div
                          className="flex items-center justify-between cursor-pointer hover:bg-gray-600/30 p-2 rounded"
                          onClick={() => togglePractitioner(pract.id)}
                        >
                          <div className="flex items-center gap-2">
                            <span>
                              {expandedPractitioners.has(pract.id) ? '▼' : '▶'}
                            </span>
                            <span className="font-semibold text-green-400">
                              👤 {pract.name}
                            </span>
                            <span className="text-gray-400 text-sm">
                              ({pract.role})
                            </span>
                            <span className="text-gray-400 text-sm">
                              {pract.email}
                            </span>
                            <span className="text-gray-500 text-sm">
                              ({pract.children?.length || 0} children)
                            </span>
                          </div>
                        </div>

                        {expandedPractitioners.has(pract.id) && pract.children && pract.children.length > 0 && (
                          <div className="ml-8 mt-3 space-y-2">
                            {pract.children.map(child => (
                              <div key={child.id} className="bg-gray-600 rounded-lg p-2">
                                <div
                                  className="flex items-center justify-between cursor-pointer hover:bg-gray-500/30 p-2 rounded"
                                  onClick={() => toggleChild(child.id)}
                                >
                                  <div className="flex items-center gap-2">
                                    <span className="text-sm">
                                      {expandedChildren.has(child.id) ? '▼' : '▶'}
                                    </span>
                                    <span className="text-yellow-400">
                                      👶 {child.first_name || child.profile?.name || 'Unnamed'}
                                    </span>
                                    {child.date_of_birth && (
                                      <span className="text-gray-400 text-sm">
                                        (DOB: {new Date(child.date_of_birth).toLocaleDateString()})
                                      </span>
                                    )}
                                    <span className="text-gray-500 text-sm">
                                      ({child.checkins?.length || 0} check-ins)
                                    </span>
                                  </div>
                                </div>

                                {expandedChildren.has(child.id) && child.checkins && child.checkins.length > 0 && (
                                  <div className="ml-8 mt-2 space-y-1">
                                    {child.checkins.map(checkin => (
                                      <div key={checkin.id} className="bg-gray-500 rounded p-2 text-sm">
                                        <div className="flex justify-between items-start">
                                          <div>
                                            <span className="font-semibold text-cyan-300">
                                              {checkin.type}
                                            </span>
                                            <span className="text-gray-300 ml-2">
                                              {new Date(checkin.created_at).toLocaleString()}
                                            </span>
                                          </div>
                                        </div>
                                        <div className="mt-1 text-gray-200 font-mono text-xs bg-gray-900/50 p-2 rounded">
                                          <pre>{JSON.stringify(checkin.data, null, 2)}</pre>
                                        </div>
                                      </div>
                                    ))}
                                  </div>
                                )}
                              </div>
                            ))}
                          </div>
                        )}
                      </div>
                    ))}
                  </div>
                )}

                {expandedOrgs.has(org.id) && (!org.practitioners || org.practitioners.length === 0) && (
                  <div className="ml-8 mt-4 text-gray-500 italic">
                    No practitioners in this organization
                  </div>
                )}
              </div>
            ))}
          </div>
        )}

        <div className="mt-8 bg-gray-800 rounded-lg p-4">
          <h2 className="font-semibold text-gray-300 mb-2">Database Info</h2>
          <div className="text-sm text-gray-500 space-y-1">
            <div>• Table names: organisations, profiles, children</div>
            <div>• Check-in tables: checkin_sessions, breathing_tool_data, mood_meter_data, emotion_grid_data, wellbeing_wheel_data</div>
            <div>• Click any item to expand/collapse</div>
            <div>• Data is loaded from your Supabase project</div>
          </div>
        </div>
      </div>
    </div>
  )
}