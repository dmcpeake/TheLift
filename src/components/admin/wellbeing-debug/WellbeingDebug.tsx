import { useState, useEffect } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { Input } from '@/components/ui/input'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { ScrollArea } from '@/components/ui/scroll-area'
import { Badge } from '@/components/ui/badge'
import { 
  Database, 
  Copy, 
  RefreshCcw, 
  Trash2, 
  Play, 
  FileJson,
  Activity,
  Brain,
  Heart,
  Wind
} from 'lucide-react'
import { createClient } from '@/utils/supabase/client'
import { 
  generateMockCheckInData,
  generateMockChildId,
  clearAllMockData,
  getRandomMood,
  getRandomEmotions,
  generateMockStory,
  getRandomWellbeingScores,
  generateMockBreathingSession
} from '@/utils/wellbeing/mock-data'
import {
  saveMoodMeter,
  createEmotionGridUsage,
  saveEmotionGridFeelings,
  updateEmotionGridStory,
  saveBreathingTool,
  createWellbeingWheelUsage,
  saveWellbeingWheelSection,
  completeWellbeingWheel,
  createCheckinSession,
  completeCheckinSession
} from '@/utils/wellbeing/database-helpers'
import { WELLBEING_SECTIONS } from '@/types/database'

const supabase = createClient()

export function WellbeingDebug() {
  const [testChildId, setTestChildId] = useState('')
  const [recentData, setRecentData] = useState<any[]>([])
  const [selectedTable, setSelectedTable] = useState('checkin_sessions')
  const [isLoading, setIsLoading] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error', text: string } | null>(null)
  const [queryResult, setQueryResult] = useState<any>(null)

  const tables = [
    'checkin_sessions',
    'mood_meter_usage',
    'emotion_grid_usage',
    'emotion_grid_feelings',
    'wellbeing_wheel_usage',
    'wellbeing_wheel_sections',
    'breathing_tool_usage',
    'child_profile_scores'
  ]

  useEffect(() => {
    if (testChildId) {
      fetchRecentData()
    }
  }, [testChildId, selectedTable])

  const fetchRecentData = async () => {
    setIsLoading(true)
    try {
      let query = supabase.from(selectedTable).select('*')
      
      if (!['emotion_grid_feelings', 'wellbeing_wheel_sections'].includes(selectedTable)) {
        query = query.eq('child_id', testChildId)
      }
      
      const { data, error } = await query.order('created_at', { ascending: false }).limit(10)
      
      if (error) throw error
      setRecentData(data || [])
    } catch (err) {
      showMessage('error', err instanceof Error ? err.message : 'Failed to fetch data')
    } finally {
      setIsLoading(false)
    }
  }

  const showMessage = (type: 'success' | 'error', text: string) => {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 5000)
  }

  const generateNewChildId = () => {
    const newId = generateMockChildId()
    setTestChildId(newId)
    navigator.clipboard.writeText(newId)
    showMessage('success', `Generated new child ID: ${newId} (copied to clipboard)`)
  }

  const generateMoodMeterData = async () => {
    if (!testChildId) {
      showMessage('error', 'Please generate a child ID first')
      return
    }
    
    try {
      const mood = getRandomMood()
      const selectionTime = Math.floor(Math.random() * 5000) + 1000
      await saveMoodMeter(testChildId, mood, selectionTime)
      showMessage('success', `Generated mood meter data: ${mood}`)
      fetchRecentData()
    } catch (err) {
      showMessage('error', err instanceof Error ? err.message : 'Failed to generate mood data')
    }
  }

  const generateEmotionGridData = async () => {
    if (!testChildId) {
      showMessage('error', 'Please generate a child ID first')
      return
    }
    
    try {
      const usage = await createEmotionGridUsage(testChildId)
      const emotions = getRandomEmotions(3)
      await saveEmotionGridFeelings(usage.id, emotions.map(e => ({
        id: `${e.category}-${e.name}`,
        name: e.name,
        category: e.category
      })))
      const story = generateMockStory()
      await updateEmotionGridStory(usage.id, story)
      showMessage('success', 'Generated emotion grid data')
      fetchRecentData()
    } catch (err) {
      showMessage('error', err instanceof Error ? err.message : 'Failed to generate emotion data')
    }
  }

  const generateWellbeingWheelData = async () => {
    if (!testChildId) {
      showMessage('error', 'Please generate a child ID first')
      return
    }
    
    try {
      const usage = await createWellbeingWheelUsage(testChildId)
      const scores = getRandomWellbeingScores()
      
      for (const section of WELLBEING_SECTIONS) {
        await saveWellbeingWheelSection(usage.id, section.id, scores[section.id])
      }
      
      await completeWellbeingWheel(usage.id)
      showMessage('success', 'Generated wellbeing wheel data')
      fetchRecentData()
    } catch (err) {
      showMessage('error', err instanceof Error ? err.message : 'Failed to generate wellbeing data')
    }
  }

  const generateBreathingData = async () => {
    if (!testChildId) {
      showMessage('error', 'Please generate a child ID first')
      return
    }
    
    try {
      const session = generateMockBreathingSession()
      await saveBreathingTool(testChildId, session.duration, session.cycles, session.pattern)
      showMessage('success', `Generated breathing data: ${session.pattern}`)
      fetchRecentData()
    } catch (err) {
      showMessage('error', err instanceof Error ? err.message : 'Failed to generate breathing data')
    }
  }

  const generateFullCheckIn = async () => {
    if (!testChildId) {
      showMessage('error', 'Please generate a child ID first')
      return
    }
    
    try {
      const session = await createCheckinSession(testChildId, 'as_needed')
      
      await generateMoodMeterData()
      await generateEmotionGridData()
      await generateWellbeingWheelData()
      await generateBreathingData()
      
      await completeCheckinSession(session.id)
      showMessage('success', 'Generated complete check-in session')
      fetchRecentData()
    } catch (err) {
      showMessage('error', err instanceof Error ? err.message : 'Failed to generate check-in')
    }
  }

  const clearChildData = async () => {
    if (!testChildId) {
      showMessage('error', 'No child ID to clear')
      return
    }
    
    if (!confirm(`Clear all data for child ${testChildId}?`)) return
    
    try {
      await clearAllMockData(testChildId)
      showMessage('success', 'Cleared all data for child')
      setRecentData([])
    } catch (err) {
      showMessage('error', err instanceof Error ? err.message : 'Failed to clear data')
    }
  }

  const executeCustomQuery = async (query: string) => {
    try {
      const result = await supabase.rpc('exec_sql', { query })
      setQueryResult(result.data)
      showMessage('success', 'Query executed successfully')
    } catch (err) {
      showMessage('error', 'Query failed - check console for details')
      console.error(err)
    }
  }

  return (
    <div className="w-full max-w-7xl mx-auto space-y-6 p-6">
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Database className="h-5 w-5" />
            Wellbeing Tools Debug Interface
          </CardTitle>
        </CardHeader>
        <CardContent>
          <Tabs defaultValue="generator" className="w-full">
            <TabsList className="grid w-full grid-cols-4">
              <TabsTrigger value="generator">Data Generator</TabsTrigger>
              <TabsTrigger value="viewer">Data Viewer</TabsTrigger>
              <TabsTrigger value="tester">Tool Tester</TabsTrigger>
              <TabsTrigger value="query">SQL Query</TabsTrigger>
            </TabsList>

            <TabsContent value="generator" className="space-y-4">
              <div className="flex items-center gap-4">
                <Input
                  placeholder="Child ID"
                  value={testChildId}
                  onChange={(e) => setTestChildId(e.target.value)}
                  className="max-w-xs"
                />
                <Button onClick={generateNewChildId} variant="outline">
                  Generate New ID
                </Button>
                <Button onClick={clearChildData} variant="destructive" size="sm">
                  <Trash2 className="h-4 w-4 mr-2" />
                  Clear Data
                </Button>
              </div>

              <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                <Card>
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm flex items-center gap-2">
                      <Heart className="h-4 w-4" />
                      Mood Meter
                    </CardTitle>
                  </CardHeader>
                  <CardContent>
                    <Button onClick={generateMoodMeterData} className="w-full" size="sm">
                      Generate Mood Data
                    </Button>
                  </CardContent>
                </Card>

                <Card>
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm flex items-center gap-2">
                      <Brain className="h-4 w-4" />
                      Emotion Grid
                    </CardTitle>
                  </CardHeader>
                  <CardContent>
                    <Button onClick={generateEmotionGridData} className="w-full" size="sm">
                      Generate Emotions
                    </Button>
                  </CardContent>
                </Card>

                <Card>
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm flex items-center gap-2">
                      <Activity className="h-4 w-4" />
                      Wellbeing Wheel
                    </CardTitle>
                  </CardHeader>
                  <CardContent>
                    <Button onClick={generateWellbeingWheelData} className="w-full" size="sm">
                      Generate Wheel
                    </Button>
                  </CardContent>
                </Card>

                <Card>
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm flex items-center gap-2">
                      <Wind className="h-4 w-4" />
                      Breathing Tool
                    </CardTitle>
                  </CardHeader>
                  <CardContent>
                    <Button onClick={generateBreathingData} className="w-full" size="sm">
                      Generate Session
                    </Button>
                  </CardContent>
                </Card>

                <Card className="md:col-span-2">
                  <CardHeader className="pb-3">
                    <CardTitle className="text-sm">Full Check-In</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <Button onClick={generateFullCheckIn} className="w-full" variant="default">
                      <Play className="h-4 w-4 mr-2" />
                      Generate Complete Session
                    </Button>
                  </CardContent>
                </Card>
              </div>
            </TabsContent>

            <TabsContent value="viewer" className="space-y-4">
              <div className="flex items-center gap-4">
                <Select value={selectedTable} onValueChange={setSelectedTable}>
                  <SelectTrigger className="w-64">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {tables.map(table => (
                      <SelectItem key={table} value={table}>
                        {table.replace(/_/g, ' ')}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
                <Button onClick={fetchRecentData} variant="outline" size="sm">
                  <RefreshCcw className="h-4 w-4 mr-2" />
                  Refresh
                </Button>
              </div>

              <ScrollArea className="h-96 w-full rounded-md border">
                <div className="p-4">
                  {isLoading ? (
                    <p className="text-center text-gray-500">Loading...</p>
                  ) : recentData.length > 0 ? (
                    <pre className="text-xs">
                      {JSON.stringify(recentData, null, 2)}
                    </pre>
                  ) : (
                    <p className="text-center text-gray-500">No data found</p>
                  )}
                </div>
              </ScrollArea>
            </TabsContent>

            <TabsContent value="tester" className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <Card>
                  <CardHeader>
                    <CardTitle className="text-sm">Test Individual Tools</CardTitle>
                  </CardHeader>
                  <CardContent className="space-y-2">
                    <Button 
                      onClick={() => window.open(`/test/mood-meter?childId=${testChildId}`, '_blank')}
                      className="w-full"
                      variant="outline"
                    >
                      Open Mood Meter
                    </Button>
                    <Button 
                      onClick={() => window.open(`/test/emotion-grid?childId=${testChildId}`, '_blank')}
                      className="w-full"
                      variant="outline"
                    >
                      Open Emotion Grid
                    </Button>
                    <Button 
                      onClick={() => window.open(`/test/wellbeing-wheel?childId=${testChildId}`, '_blank')}
                      className="w-full"
                      variant="outline"
                    >
                      Open Wellbeing Wheel
                    </Button>
                    <Button 
                      onClick={() => window.open(`/test/breathing-tool?childId=${testChildId}`, '_blank')}
                      className="w-full"
                      variant="outline"
                    >
                      Open Breathing Tool
                    </Button>
                  </CardContent>
                </Card>

                <Card>
                  <CardHeader>
                    <CardTitle className="text-sm">Test Complete Flow</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <Button 
                      onClick={() => window.open(`/test/check-in-flow?childId=${testChildId}`, '_blank')}
                      className="w-full"
                    >
                      Open Check-In Flow
                    </Button>
                  </CardContent>
                </Card>
              </div>
            </TabsContent>

            <TabsContent value="query" className="space-y-4">
              <div className="space-y-2">
                <p className="text-sm text-gray-600">Execute custom SQL queries (read-only)</p>
                <textarea
                  className="w-full h-32 p-3 border rounded-md font-mono text-sm"
                  placeholder="SELECT * FROM mood_meter_usage WHERE child_id = '...' LIMIT 10"
                  onKeyDown={(e) => {
                    if (e.key === 'Enter' && e.metaKey) {
                      executeCustomQuery((e.target as HTMLTextAreaElement).value)
                    }
                  }}
                />
                <Button onClick={() => {
                  const textarea = document.querySelector('textarea')
                  if (textarea) executeCustomQuery(textarea.value)
                }}>
                  Execute Query (Cmd+Enter)
                </Button>
              </div>
              
              {queryResult && (
                <ScrollArea className="h-64 w-full rounded-md border">
                  <div className="p-4">
                    <pre className="text-xs">
                      {JSON.stringify(queryResult, null, 2)}
                    </pre>
                  </div>
                </ScrollArea>
              )}
            </TabsContent>
          </Tabs>

          {message && (
            <div className={cn(
              "mt-4 p-3 rounded-lg text-sm",
              message.type === 'success' ? "bg-green-50 text-green-700" : "bg-red-50 text-red-700"
            )}>
              {message.text}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}