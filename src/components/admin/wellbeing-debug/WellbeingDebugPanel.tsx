import React, { useState, useEffect } from 'react'
import { getSupabaseClient } from '../../../utils/supabase/client'
import {
  getChildSessions,
  getMoodHistory,
  getEmotionGridHistory,
  getWellbeingWheelHistory,
  getBreathingToolHistory,
  getChildWellbeingSnapshot,
  clearChildData
} from '../../../utils/wellbeing/database'
import {
  generateMockSession,
  generateHistoricalData,
  insertMockMoodData,
  insertMockEmotionGridData,
  insertMockWellbeingWheelData,
  insertMockBreathingData
} from '../../../utils/wellbeing/mockData'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../../ui/card'
import { Button } from '../../ui/button'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../../ui/tabs'
import { Alert, AlertDescription } from '../../ui/alert'
import { Badge } from '../../ui/badge'
import { Input } from '../../ui/input'
import { Label } from '../../ui/label'
import { ScrollArea } from '../../ui/scroll-area'
import {
  AlertCircle,
  Database,
  Trash2,
  RefreshCw,
  Download,
  Upload,
  Activity,
  Brain,
  Heart,
  Wind,
  Clock,
  TrendingUp,
  Users,
  Copy,
  CheckCircle2
} from 'lucide-react'

const supabase = getSupabaseClient()

interface WellbeingDebugPanelProps {
  childId?: string
}

export function WellbeingDebugPanel({ childId: propChildId }: WellbeingDebugPanelProps) {
  const [childId, setChildId] = useState(propChildId || '')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [success, setSuccess] = useState<string | null>(null)
  const [activeTab, setActiveTab] = useState('overview')
  const [snapshot, setSnapshot] = useState<any>(null)
  const [rawData, setRawData] = useState<any>({})
  const [copied, setCopied] = useState(false)

  useEffect(() => {
    if (childId) {
      loadSnapshot()
    }
  }, [childId])

  const loadSnapshot = async () => {
    if (!childId) return

    setLoading(true)
    setError(null)

    try {
      const data = await getChildWellbeingSnapshot(childId)
      setSnapshot(data)
    } catch (err) {
      console.error('Error loading snapshot:', err)
      setError('Failed to load wellbeing data')
    } finally {
      setLoading(false)
    }
  }

  const loadRawData = async (dataType: string) => {
    if (!childId) return

    setLoading(true)
    setError(null)

    try {
      let data
      switch (dataType) {
        case 'sessions':
          data = await getChildSessions(childId, 20)
          break
        case 'mood':
          data = await getMoodHistory(childId, 50)
          break
        case 'emotions':
          data = await getEmotionGridHistory(childId, 20)
          break
        case 'wheel':
          data = await getWellbeingWheelHistory(childId, 20)
          break
        case 'breathing':
          data = await getBreathingToolHistory(childId, 30)
          break
      }
      setRawData(prev => ({ ...prev, [dataType]: data }))
    } catch (err) {
      console.error(`Error loading ${dataType} data:`, err)
      setError(`Failed to load ${dataType} data`)
    } finally {
      setLoading(false)
    }
  }

  const handleGenerateMockSession = async () => {
    if (!childId) {
      setError('Please enter a Child ID')
      return
    }

    setLoading(true)
    setError(null)
    setSuccess(null)

    try {
      const session = await generateMockSession(childId)
      setSuccess(`Mock session created: ${session.id}`)
      await loadSnapshot()
    } catch (err) {
      console.error('Error generating mock session:', err)
      setError('Failed to generate mock session')
    } finally {
      setLoading(false)
    }
  }

  const handleGenerateHistoricalData = async () => {
    if (!childId) {
      setError('Please enter a Child ID')
      return
    }

    setLoading(true)
    setError(null)
    setSuccess(null)

    try {
      const sessions = await generateHistoricalData(childId, 7)
      setSuccess(`Generated ${sessions.length} days of historical data`)
      await loadSnapshot()
    } catch (err) {
      console.error('Error generating historical data:', err)
      setError('Failed to generate historical data')
    } finally {
      setLoading(false)
    }
  }

  const handleGenerateSingleTool = async (tool: string) => {
    if (!childId) {
      setError('Please enter a Child ID')
      return
    }

    setLoading(true)
    setError(null)
    setSuccess(null)

    try {
      let result
      switch (tool) {
        case 'mood':
          result = await insertMockMoodData(childId)
          break
        case 'emotions':
          result = await insertMockEmotionGridData(childId)
          break
        case 'wheel':
          result = await insertMockWellbeingWheelData(childId)
          break
        case 'breathing':
          result = await insertMockBreathingData(childId)
          break
      }
      setSuccess(`${tool} data created: ${result.id}`)
      await loadSnapshot()
    } catch (err) {
      console.error(`Error generating ${tool} data:`, err)
      setError(`Failed to generate ${tool} data`)
    } finally {
      setLoading(false)
    }
  }

  const handleClearData = async () => {
    if (!childId) {
      setError('Please enter a Child ID')
      return
    }

    if (!window.confirm('Are you sure you want to clear all wellbeing data for this child?')) {
      return
    }

    setLoading(true)
    setError(null)
    setSuccess(null)

    try {
      await clearChildData(childId)
      setSuccess('All wellbeing data cleared')
      setSnapshot(null)
      setRawData({})
    } catch (err) {
      console.error('Error clearing data:', err)
      setError('Failed to clear data')
    } finally {
      setLoading(false)
    }
  }

  const copyToClipboard = (data: any) => {
    navigator.clipboard.writeText(JSON.stringify(data, null, 2))
    setCopied(true)
    setTimeout(() => setCopied(false), 2000)
  }

  const exportData = () => {
    const dataStr = JSON.stringify({ snapshot, rawData }, null, 2)
    const dataUri = 'data:application/json;charset=utf-8,' + encodeURIComponent(dataStr)
    const exportFileDefaultName = `wellbeing-data-${childId}-${Date.now()}.json`

    const linkElement = document.createElement('a')
    linkElement.setAttribute('href', dataUri)
    linkElement.setAttribute('download', exportFileDefaultName)
    linkElement.click()
  }

  return (
    <div className="w-full max-w-7xl mx-auto p-6 space-y-6">
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Database className="w-5 h-5" />
            Wellbeing Tools Debug Panel
          </CardTitle>
          <CardDescription>
            Test and debug wellbeing tools with mock data
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {/* Child ID Input */}
            <div className="flex gap-4 items-end">
              <div className="flex-1">
                <Label htmlFor="childId">Child ID</Label>
                <Input
                  id="childId"
                  value={childId}
                  onChange={(e) => setChildId(e.target.value)}
                  placeholder="Enter child ID (e.g., uuid)"
                />
              </div>
              <Button onClick={loadSnapshot} disabled={!childId || loading}>
                <RefreshCw className="mr-2 h-4 w-4" />
                Load Data
              </Button>
            </div>

            {/* Quick Actions */}
            <div className="flex flex-wrap gap-2">
              <Button
                variant="outline"
                size="sm"
                onClick={handleGenerateMockSession}
                disabled={loading}
              >
                <Upload className="mr-2 h-4 w-4" />
                Generate Full Session
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={handleGenerateHistoricalData}
                disabled={loading}
              >
                <Clock className="mr-2 h-4 w-4" />
                Generate 7 Days History
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={() => handleGenerateSingleTool('mood')}
                disabled={loading}
              >
                <Heart className="mr-2 h-4 w-4" />
                Add Mood
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={() => handleGenerateSingleTool('emotions')}
                disabled={loading}
              >
                <Brain className="mr-2 h-4 w-4" />
                Add Emotions
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={() => handleGenerateSingleTool('wheel')}
                disabled={loading}
              >
                <Activity className="mr-2 h-4 w-4" />
                Add Wheel
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={() => handleGenerateSingleTool('breathing')}
                disabled={loading}
              >
                <Wind className="mr-2 h-4 w-4" />
                Add Breathing
              </Button>
              <Button
                variant="destructive"
                size="sm"
                onClick={handleClearData}
                disabled={loading}
              >
                <Trash2 className="mr-2 h-4 w-4" />
                Clear All Data
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={exportData}
                disabled={!snapshot}
              >
                <Download className="mr-2 h-4 w-4" />
                Export
              </Button>
            </div>

            {/* Status Messages */}
            {error && (
              <Alert variant="destructive">
                <AlertCircle className="h-4 w-4" />
                <AlertDescription>{error}</AlertDescription>
              </Alert>
            )}
            {success && (
              <Alert className="border-green-200 bg-green-50">
                <CheckCircle2 className="h-4 w-4 text-green-600" />
                <AlertDescription className="text-green-800">{success}</AlertDescription>
              </Alert>
            )}
          </div>
        </CardContent>
      </Card>

      {/* Data Tabs */}
      {snapshot && (
        <Card>
          <CardHeader>
            <CardTitle>Child Wellbeing Data</CardTitle>
          </CardHeader>
          <CardContent>
            <Tabs value={activeTab} onValueChange={setActiveTab}>
              <TabsList className="grid grid-cols-6 w-full">
                <TabsTrigger value="overview">Overview</TabsTrigger>
                <TabsTrigger value="sessions">Sessions</TabsTrigger>
                <TabsTrigger value="mood">Mood</TabsTrigger>
                <TabsTrigger value="emotions">Emotions</TabsTrigger>
                <TabsTrigger value="wheel">Wheel</TabsTrigger>
                <TabsTrigger value="breathing">Breathing</TabsTrigger>
              </TabsList>

              <TabsContent value="overview" className="space-y-4">
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                  <Card>
                    <CardHeader className="pb-2">
                      <CardTitle className="text-sm">Average Mood</CardTitle>
                    </CardHeader>
                    <CardContent>
                      <div className="text-2xl font-bold">
                        {snapshot.averageMood.toFixed(1)}/5.0
                      </div>
                    </CardContent>
                  </Card>
                  <Card>
                    <CardHeader className="pb-2">
                      <CardTitle className="text-sm">Total Sessions</CardTitle>
                    </CardHeader>
                    <CardContent>
                      <div className="text-2xl font-bold">
                        {snapshot.recentSessions.length}
                      </div>
                    </CardContent>
                  </Card>
                  <Card>
                    <CardHeader className="pb-2">
                      <CardTitle className="text-sm">Breathing Minutes</CardTitle>
                    </CardHeader>
                    <CardContent>
                      <div className="text-2xl font-bold">
                        {snapshot.breathingMinutes.toFixed(1)}
                      </div>
                    </CardContent>
                  </Card>
                  <Card>
                    <CardHeader className="pb-2">
                      <CardTitle className="text-sm">Last Check-In</CardTitle>
                    </CardHeader>
                    <CardContent>
                      <div className="text-sm">
                        {snapshot.lastCheckIn
                          ? new Date(snapshot.lastCheckIn).toLocaleDateString()
                          : 'Never'}
                      </div>
                    </CardContent>
                  </Card>
                </div>

                <Card>
                  <CardHeader>
                    <CardTitle className="text-sm">Mood Trend</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <div className="flex gap-2">
                      {snapshot.moodTrend.map((mood: number, index: number) => (
                        <div
                          key={index}
                          className="flex-1 bg-blue-100 rounded p-2 text-center"
                        >
                          <div className="text-lg">
                            {['😢', '😔', '😐', '😊', '😄'][mood - 1]}
                          </div>
                          <div className="text-xs">{mood}/5</div>
                        </div>
                      ))}
                    </div>
                  </CardContent>
                </Card>

                <Card>
                  <CardHeader>
                    <CardTitle className="text-sm">Top Emotions</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <div className="flex flex-wrap gap-2">
                      {Object.entries(snapshot.emotionFrequency)
                        .sort((a: any, b: any) => b[1] - a[1])
                        .slice(0, 8)
                        .map(([emotion, count]: any) => (
                          <Badge key={emotion} variant="secondary">
                            {emotion} ({count})
                          </Badge>
                        ))}
                    </div>
                  </CardContent>
                </Card>
              </TabsContent>

              <TabsContent value="sessions">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => loadRawData('sessions')}
                  className="mb-4"
                >
                  Load Raw Data
                </Button>
                {rawData.sessions && (
                  <ScrollArea className="h-[400px]">
                    <pre className="text-xs bg-gray-50 p-4 rounded">
                      {JSON.stringify(rawData.sessions, null, 2)}
                    </pre>
                  </ScrollArea>
                )}
              </TabsContent>

              <TabsContent value="mood">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => loadRawData('mood')}
                  className="mb-4"
                >
                  Load Raw Data
                </Button>
                {rawData.mood && (
                  <ScrollArea className="h-[400px]">
                    <pre className="text-xs bg-gray-50 p-4 rounded">
                      {JSON.stringify(rawData.mood, null, 2)}
                    </pre>
                  </ScrollArea>
                )}
              </TabsContent>

              <TabsContent value="emotions">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => loadRawData('emotions')}
                  className="mb-4"
                >
                  Load Raw Data
                </Button>
                {rawData.emotions && (
                  <ScrollArea className="h-[400px]">
                    <pre className="text-xs bg-gray-50 p-4 rounded">
                      {JSON.stringify(rawData.emotions, null, 2)}
                    </pre>
                  </ScrollArea>
                )}
              </TabsContent>

              <TabsContent value="wheel">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => loadRawData('wheel')}
                  className="mb-4"
                >
                  Load Raw Data
                </Button>
                {rawData.wheel && (
                  <ScrollArea className="h-[400px]">
                    <pre className="text-xs bg-gray-50 p-4 rounded">
                      {JSON.stringify(rawData.wheel, null, 2)}
                    </pre>
                  </ScrollArea>
                )}
              </TabsContent>

              <TabsContent value="breathing">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => loadRawData('breathing')}
                  className="mb-4"
                >
                  Load Raw Data
                </Button>
                {rawData.breathing && (
                  <ScrollArea className="h-[400px]">
                    <pre className="text-xs bg-gray-50 p-4 rounded">
                      {JSON.stringify(rawData.breathing, null, 2)}
                    </pre>
                  </ScrollArea>
                )}
              </TabsContent>
            </Tabs>

            <div className="mt-4 flex justify-end">
              <Button
                variant="outline"
                size="sm"
                onClick={() => copyToClipboard({ snapshot, rawData })}
              >
                {copied ? (
                  <>
                    <CheckCircle2 className="mr-2 h-4 w-4" />
                    Copied!
                  </>
                ) : (
                  <>
                    <Copy className="mr-2 h-4 w-4" />
                    Copy All Data
                  </>
                )}
              </Button>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  )
}