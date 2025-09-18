import React, { useState, useEffect } from 'react'
import { getSupabaseClient } from '../../utils/supabase/client'

const supabase = getSupabaseClient()

interface TableInfo {
  name: string
  count: number
  sample: any[]
  allData?: any[]
  error?: string
}

export function DataHierarchy() {
  const [tables, setTables] = useState<TableInfo[]>([])
  const [loading, setLoading] = useState(true)
  const [expandedTables, setExpandedTables] = useState<Set<string>>(new Set())
  const [exportData, setExportData] = useState<string>('')
  const [showExport, setShowExport] = useState(false)
  const [copySuccess, setCopySuccess] = useState(false)
  const [organizations, setOrganizations] = useState<any[]>([])
  const [selectedOrg, setSelectedOrg] = useState<string>('all')
  const [children, setChildren] = useState<any[]>([])
  const [selectedChild, setSelectedChild] = useState<string>('all')
  const [recordLimit, setRecordLimit] = useState<number>(100)
  const [exportOffset, setExportOffset] = useState<number>(0)

  useEffect(() => {
    loadOrganizations()
    loadData()
  }, [])

  useEffect(() => {
    if (selectedOrg !== 'all') {
      loadChildren(selectedOrg)
    } else {
      setChildren([])
      setSelectedChild('all')
    }
  }, [selectedOrg])

  const loadOrganizations = async () => {
    try {
      const { data } = await supabase
        .from('organisations')
        .select('id, name')
        .order('name')

      if (data) {
        setOrganizations(data)
      }
    } catch (error) {
      console.error('Error loading organizations:', error)
    }
  }

  const loadChildren = async (orgId: string) => {
    try {
      const { data } = await supabase
        .from('profiles')
        .select('id, name')
        .eq('org_id', orgId)
        .eq('role', 'Child')
        .order('name')

      if (data) {
        setChildren(data)
      }
    } catch (error) {
      console.error('Error loading children:', error)
    }
  }

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

            // Get ALL data for export
            const { data: allData } = await supabase
              .from(name)
              .select('*')
              .limit(1000)

            results.push({
              name,
              count: totalCount || 0,
              sample: data || [],
              allData: allData || []
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

  const generateExportData = async () => {
    try {
      setLoading(true)

      // Build queries with organization filter and chunking
      const tableConfigs = [
        'organisations',
        'profiles',
        'checkin_sessions',
        'breathing_tool_usage',
        'mood_meter_usage',
        'emotion_grid_usage',
        'emotion_grid_feelings',
        'wellbeing_wheel_usage',
        'wellbeing_wheel_sections',
        'child_profile_scores'
      ]

      const exportObj: any = {
        metadata: {
          exported_at: new Date().toISOString(),
          organization: selectedOrg === 'all' ? 'All Organizations' : organizations.find(o => o.id === selectedOrg)?.name || selectedOrg,
          child: selectedChild === 'all' ? 'All Children' : children.find(c => c.id === selectedChild)?.name || selectedChild,
          record_limit: recordLimit,
          offset: exportOffset,
          chunk_info: `Records ${exportOffset + 1} to ${exportOffset + recordLimit}`
        },
        data: {}
      }

      for (const tableName of tableConfigs) {
        try {
          let query = supabase.from(tableName).select('*')

          // Apply organization filter for tables that have org_id
          if (selectedOrg !== 'all' && ['profiles', 'checkin_sessions', 'mood_meter_usage',
              'emotion_grid_usage', 'wellbeing_wheel_usage', 'child_profile_scores'].includes(tableName)) {
            query = query.eq('org_id', selectedOrg)
          }

          // Apply child filter for tables that have child_id
          if (selectedChild !== 'all' && ['checkin_sessions', 'breathing_tool_usage', 'mood_meter_usage',
              'emotion_grid_usage', 'emotion_grid_feelings', 'wellbeing_wheel_usage', 'wellbeing_wheel_sections',
              'child_profile_scores'].includes(tableName)) {
            query = query.eq('child_id', selectedChild)
          }

          // Special case for profiles table when filtering by child
          if (selectedChild !== 'all' && tableName === 'profiles') {
            query = query.eq('id', selectedChild)
          }

          // Apply limit and offset for chunking
          query = query.range(exportOffset, exportOffset + recordLimit - 1)
          query = query.order('created_at', { ascending: false, nullsFirst: false })

          const { data, error, count } = await query

          if (!error && data) {
            exportObj.data[tableName] = {
              count: data.length,
              total_available: count,
              records: data
            }
          }
        } catch (err) {
          console.error(`Error exporting ${tableName}:`, err)
        }
      }

      const exportString = JSON.stringify(exportObj, null, 2)
      setExportData(exportString)
      setShowExport(true)
    } catch (error) {
      console.error('Export error:', error)
    } finally {
      setLoading(false)
    }
  }

  const copyToClipboard = async () => {
    try {
      await navigator.clipboard.writeText(exportData)
      setCopySuccess(true)
      setTimeout(() => setCopySuccess(false), 2000)
    } catch (err) {
      console.error('Failed to copy:', err)
    }
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
  const tablesWithData = existingTables.filter(t => t.count > 0)
  const emptyTables = existingTables.filter(t => t.count === 0)

  return (
    <div className="min-h-screen bg-gray-900 text-white p-8">
      <div className="max-w-7xl mx-auto">
        <div className="mb-8">
          <div className="flex justify-between items-center mb-4">
            <h1 className="text-3xl font-bold">Supabase Database Explorer</h1>
            <button
              onClick={loadData}
              className="px-4 py-2 bg-blue-600 rounded hover:bg-blue-700"
            >
              Refresh Data
            </button>
          </div>

          {/* Export Controls */}
          <div className="bg-gray-800 rounded-lg p-4">
            <h2 className="text-lg font-semibold mb-3">Export Controls</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-6 gap-4">
              {/* Organization Filter */}
              <div>
                <label className="block text-sm text-gray-400 mb-1">Organization</label>
                <select
                  value={selectedOrg}
                  onChange={(e) => setSelectedOrg(e.target.value)}
                  className="w-full px-3 py-2 bg-gray-700 text-white rounded border border-gray-600 focus:border-blue-500"
                >
                  <option value="all">All Organizations</option>
                  {organizations.map(org => (
                    <option key={org.id} value={org.id}>{org.name}</option>
                  ))}
                </select>
              </div>

              {/* Child Filter */}
              <div>
                <label className="block text-sm text-gray-400 mb-1">Child</label>
                <select
                  value={selectedChild}
                  onChange={(e) => setSelectedChild(e.target.value)}
                  disabled={selectedOrg === 'all'}
                  className="w-full px-3 py-2 bg-gray-700 text-white rounded border border-gray-600 focus:border-blue-500 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  <option value="all">All Children</option>
                  {children.map(child => (
                    <option key={child.id} value={child.id}>{child.name}</option>
                  ))}
                </select>
              </div>

              {/* Record Limit */}
              <div>
                <label className="block text-sm text-gray-400 mb-1">Records per Table</label>
                <select
                  value={recordLimit}
                  onChange={(e) => setRecordLimit(Number(e.target.value))}
                  className="w-full px-3 py-2 bg-gray-700 text-white rounded border border-gray-600 focus:border-blue-500"
                >
                  <option value={10}>10 records</option>
                  <option value={50}>50 records</option>
                  <option value={100}>100 records</option>
                  <option value={250}>250 records</option>
                  <option value={500}>500 records</option>
                </select>
              </div>

              {/* Offset */}
              <div>
                <label className="block text-sm text-gray-400 mb-1">Start from Record</label>
                <input
                  type="number"
                  value={exportOffset}
                  onChange={(e) => setExportOffset(Number(e.target.value))}
                  min="0"
                  step={recordLimit}
                  className="w-full px-3 py-2 bg-gray-700 text-white rounded border border-gray-600 focus:border-blue-500"
                />
              </div>

              {/* Chunk Navigation */}
              <div className="flex items-end gap-2">
                <button
                  onClick={() => setExportOffset(Math.max(0, exportOffset - recordLimit))}
                  disabled={exportOffset === 0}
                  className="px-3 py-2 bg-gray-600 rounded hover:bg-gray-500 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  ← Previous
                </button>
                <button
                  onClick={() => setExportOffset(exportOffset + recordLimit)}
                  className="px-3 py-2 bg-gray-600 rounded hover:bg-gray-500"
                >
                  Next →
                </button>
              </div>

              {/* Export Button */}
              <div className="flex items-end">
                <button
                  onClick={generateExportData}
                  className="w-full px-4 py-2 bg-green-600 rounded hover:bg-green-700 flex items-center justify-center gap-2"
                >
                  <span>📋</span>
                  Export Chunk
                </button>
              </div>
            </div>

            {/* Chunk Info */}
            <div className="mt-3 text-sm text-gray-400">
              Current chunk: Records {exportOffset + 1} to {exportOffset + recordLimit}
              {selectedOrg !== 'all' && ' (filtered by organization)'}
              {selectedChild !== 'all' && ' (filtered by child)'}
            </div>
          </div>
        </div>

        {/* Export Modal */}
        {showExport && (
          <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4">
            <div className="bg-gray-800 rounded-lg max-w-4xl w-full max-h-[80vh] flex flex-col">
              <div className="p-4 border-b border-gray-700 flex justify-between items-center">
                <h2 className="text-xl font-semibold">Export Data - Ready to Copy</h2>
                <button
                  onClick={() => setShowExport(false)}
                  className="text-gray-400 hover:text-white"
                >
                  ✕
                </button>
              </div>
              <div className="p-4 flex-1 overflow-auto">
                <div className="mb-4">
                  <p className="text-gray-400 text-sm mb-2">
                    Copy this JSON data and paste it to Claude to generate synthetic data for missing/empty tables:
                  </p>
                  <button
                    onClick={copyToClipboard}
                    className={`px-4 py-2 rounded ${
                      copySuccess
                        ? 'bg-green-600 hover:bg-green-700'
                        : 'bg-blue-600 hover:bg-blue-700'
                    }`}
                  >
                    {copySuccess ? '✓ Copied!' : '📋 Copy to Clipboard'}
                  </button>
                </div>
                <pre className="bg-gray-900 p-4 rounded text-xs overflow-auto">
                  {exportData}
                </pre>
              </div>
            </div>
          </div>
        )}

        {/* Summary */}
        <div className="bg-gray-800 rounded-lg p-4 mb-6">
          <h2 className="text-xl font-semibold mb-2">Database Summary</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div>
              <span className="text-green-400">✓ Tables Found:</span>
              <span className="ml-2 text-gray-300">{existingTables.length}</span>
            </div>
            <div>
              <span className="text-blue-400">📊 With Data:</span>
              <span className="ml-2 text-gray-300">{tablesWithData.length}</span>
            </div>
            <div>
              <span className="text-yellow-400">⚠ Empty:</span>
              <span className="ml-2 text-gray-300">{emptyTables.length}</span>
            </div>
            <div>
              <span className="text-red-400">✗ Missing:</span>
              <span className="ml-2 text-gray-300">{missingTables.length}</span>
            </div>
          </div>
        </div>

        {/* Tables with Data */}
        {tablesWithData.length > 0 && (
          <div className="mb-8">
            <h2 className="text-xl font-semibold mb-4 text-green-400">Tables with Data</h2>
            <div className="space-y-3">
              {tablesWithData.map(table => (
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
                      <span className="text-green-500 text-sm font-semibold">
                        {table.count} records
                      </span>
                    </div>
                  </div>

                  {expandedTables.has(table.name) && (
                    <div className="mt-4 ml-8">
                      <div className="text-sm text-gray-400 mb-2">
                        Sample data (showing {Math.min(table.sample.length, 3)} of {table.count} records):
                      </div>
                      <div className="space-y-2">
                        {table.sample.slice(0, 3).map((record, idx) => (
                          <div key={idx} className="bg-gray-700 rounded p-3">
                            <pre className="text-xs text-gray-300 overflow-x-auto">
                              {JSON.stringify(record, null, 2)}
                            </pre>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Empty Tables */}
        {emptyTables.length > 0 && (
          <div className="mb-8">
            <h2 className="text-xl font-semibold mb-4 text-yellow-400">Empty Tables (Need Data)</h2>
            <div className="bg-gray-800 rounded-lg p-4">
              <div className="grid grid-cols-2 md:grid-cols-3 gap-2">
                {emptyTables.map(table => (
                  <div key={table.name} className="text-gray-400">
                    • {table.name}
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* Missing Tables */}
        {missingTables.length > 0 && (
          <div className="mb-8">
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
          <h3 className="font-semibold text-blue-400 mb-2">How to Generate Synthetic Data</h3>
          <div className="text-sm text-gray-300 space-y-2">
            <ol className="list-decimal ml-4 space-y-1">
              <li>Click "Export All Data" button above</li>
              <li>Copy the JSON data to your clipboard</li>
              <li>Paste it to Claude with a prompt like: "Generate SQL INSERT statements for the empty tables"</li>
              <li>Run the generated SQL in your Supabase SQL editor</li>
            </ol>
            <p className="font-semibold mt-3">Empty tables that need data:</p>
            <ul className="ml-4 text-xs text-yellow-400">
              {emptyTables.map(t => (
                <li key={t.name}>• {t.name}</li>
              ))}
            </ul>
          </div>
        </div>
      </div>
    </div>
  )
}