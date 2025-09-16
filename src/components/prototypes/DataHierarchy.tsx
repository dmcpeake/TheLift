import React, { useState, useEffect } from 'react'
import { getSupabaseClient } from '../../utils/supabase/client'

const supabase = getSupabaseClient()

interface TableInfo {
  name: string
  count: number
  sample: any[]
  error?: string
}

export function DataHierarchy() {
  const [tables, setTables] = useState<TableInfo[]>([])
  const [loading, setLoading] = useState(true)
  const [expandedTables, setExpandedTables] = useState<Set<string>>(new Set())

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    try {
      setLoading(true)

      const tableQueries = [
        // Core tables
        { name: 'organisations', query: supabase.from('organisations').select('*').limit(5) },
        { name: 'profiles', query: supabase.from('profiles').select('*').limit(10) },
        { name: 'invitations', query: supabase.from('invitations').select('*').limit(10) },
        { name: 'waitlist', query: supabase.from('waitlist').select('*').limit(10) },

        // Session tables
        { name: 'checkin_sessions', query: supabase.from('checkin_sessions').select('*').limit(10) },

        // Tool usage tables (correct names from schema)
        { name: 'breathing_tool_usage', query: supabase.from('breathing_tool_usage').select('*').limit(10) },
        { name: 'mood_meter_usage', query: supabase.from('mood_meter_usage').select('*').limit(10) },
        { name: 'emotion_grid_usage', query: supabase.from('emotion_grid_usage').select('*').limit(10) },
        { name: 'emotion_grid_feelings', query: supabase.from('emotion_grid_feelings').select('*').limit(10) },
        { name: 'wellbeing_wheel_usage', query: supabase.from('wellbeing_wheel_usage').select('*').limit(10) },
        { name: 'wellbeing_wheel_sections', query: supabase.from('wellbeing_wheel_sections').select('*').limit(10) },

        // Analytics tables
        { name: 'child_profile_scores', query: supabase.from('child_profile_scores').select('*').limit(10) },

        // Reference data
        { name: 'feeling_definitions', query: supabase.from('feeling_definitions').select('*').limit(10) },
      ]

      const results: TableInfo[] = []

      for (const { name, query } of tableQueries) {
        try {
          const { data, error, count } = await query

          if (error) {
            results.push({
              name,
              count: 0,
              sample: [],
              error: error.message
            })
          } else {
            // Get actual count
            const { count: totalCount } = await supabase
              .from(name)
              .select('*', { count: 'exact', head: true })

            results.push({
              name,
              count: totalCount || 0,
              sample: data || []
            })
          }
        } catch (err) {
          results.push({
            name,
            count: 0,
            sample: [],
            error: err instanceof Error ? err.message : 'Unknown error'
          })
        }
      }

      setTables(results)
      console.log('Tables found:', results.filter(t => !t.error).map(t => t.name))
    } catch (err) {
      console.error('Error loading data:', err)
    } finally {
      setLoading(false)
    }
  }

  const toggleTable = (tableName: string) => {
    const newExpanded = new Set(expandedTables)
    if (newExpanded.has(tableName)) {
      newExpanded.delete(tableName)
    } else {
      newExpanded.add(tableName)
    }
    setExpandedTables(newExpanded)
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-900 text-white p-8">
        <div className="max-w-7xl mx-auto">
          <h1 className="text-3xl font-bold mb-8">Supabase Database Explorer</h1>
          <div className="text-gray-400">Scanning database tables...</div>
        </div>
      </div>
    )
  }

  const existingTables = tables.filter(t => !t.error)
  const missingTables = tables.filter(t => t.error)

  return (
    <div className="min-h-screen bg-gray-900 text-white p-8">
      <div className="max-w-7xl mx-auto">
        <div className="flex justify-between items-center mb-8">
          <h1 className="text-3xl font-bold">Supabase Database Explorer</h1>
          <button
            onClick={loadData}
            className="px-4 py-2 bg-blue-600 rounded hover:bg-blue-700"
          >
            Refresh Data
          </button>
        </div>

        {/* Summary */}
        <div className="bg-gray-800 rounded-lg p-4 mb-6">
          <h2 className="text-xl font-semibold mb-2">Database Summary</h2>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <span className="text-green-400">✓ Tables Found:</span>
              <span className="ml-2 text-gray-300">{existingTables.length}</span>
            </div>
            <div>
              <span className="text-red-400">✗ Tables Missing:</span>
              <span className="ml-2 text-gray-300">{missingTables.length}</span>
            </div>
          </div>
        </div>

        {/* Existing Tables */}
        {existingTables.length > 0 && (
          <div className="mb-8">
            <h2 className="text-xl font-semibold mb-4 text-green-400">Existing Tables</h2>
            <div className="space-y-3">
              {existingTables.map(table => (
                <div key={table.name} className="bg-gray-800 rounded-lg p-4">
                  <div
                    className="flex items-center justify-between cursor-pointer hover:bg-gray-700/30 p-2 rounded"
                    onClick={() => toggleTable(table.name)}
                  >
                    <div className="flex items-center gap-3">
                      <span className="text-lg">
                        {expandedTables.has(table.name) ? '▼' : '▶'}
                      </span>
                      <span className="font-semibold text-blue-400">
                        {table.name}
                      </span>
                      <span className="text-gray-500 text-sm">
                        ({table.count} records)
                      </span>
                    </div>
                  </div>

                  {expandedTables.has(table.name) && (
                    <div className="mt-4 ml-8">
                      {table.sample.length > 0 ? (
                        <div>
                          <div className="text-sm text-gray-400 mb-2">
                            Sample data (showing {table.sample.length} of {table.count} records):
                          </div>
                          <div className="space-y-2">
                            {table.sample.map((record, idx) => (
                              <div key={idx} className="bg-gray-700 rounded p-3">
                                <pre className="text-xs text-gray-300 overflow-x-auto">
                                  {JSON.stringify(record, null, 2)}
                                </pre>
                              </div>
                            ))}
                          </div>
                        </div>
                      ) : (
                        <div className="text-gray-500 italic">No data in this table</div>
                      )}
                    </div>
                  )}
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Missing Tables */}
        {missingTables.length > 0 && (
          <div>
            <h2 className="text-xl font-semibold mb-4 text-red-400">Missing Tables</h2>
            <div className="bg-gray-800 rounded-lg p-4">
              <div className="space-y-2">
                {missingTables.map(table => (
                  <div key={table.name} className="flex items-center justify-between">
                    <span className="text-gray-400">{table.name}</span>
                    <span className="text-red-500 text-sm">{table.error}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* Help */}
        <div className="mt-8 bg-blue-900/20 border border-blue-500 rounded-lg p-4">
          <h3 className="font-semibold text-blue-400 mb-2">Database Schema Info</h3>
          <div className="text-sm text-gray-300 space-y-2">
            <p className="font-semibold">Core Tables:</p>
            <ul className="ml-4 text-xs">
              <li>• organisations - Organization/school records</li>
              <li>• profiles - All users (practitioners, children, etc.)</li>
              <li>• checkin_sessions - Check-in session tracking</li>
            </ul>
            <p className="font-semibold mt-3">Tool Usage Tables:</p>
            <ul className="ml-4 text-xs">
              <li>• breathing_tool_usage - Breathing exercise data</li>
              <li>• mood_meter_usage - Mood tracking data</li>
              <li>• emotion_grid_usage - Emotion grid selections</li>
              <li>• wellbeing_wheel_usage - Wellbeing wheel responses</li>
            </ul>
            {missingTables.length > 0 && (
              <div className="mt-3 p-2 bg-red-900/20 border border-red-500 rounded">
                <p className="text-red-400">Some tables are missing. Run migrations:</p>
                <code className="block bg-gray-800 p-2 rounded mt-2">
                  npx supabase db push
                </code>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}