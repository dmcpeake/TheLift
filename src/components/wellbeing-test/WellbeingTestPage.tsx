import React, { useState } from 'react'
import { MoodMeter } from '../child/mood-meter'
import { EmotionGrid } from '../child/emotion-grid'
import { WellbeingWheelEnhanced } from '../child/wellbeing-wheel/WellbeingWheelEnhanced'
import { CheckInFlow } from '../child/check-in-flow/CheckInFlow'
import { WellbeingDebugPanel } from '../admin/wellbeing-debug/WellbeingDebugPanel'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../ui/tabs'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Badge } from '../ui/badge'
import { Alert, AlertDescription } from '../ui/alert'
import {
  Heart,
  Brain,
  Activity,
  Wind,
  LayoutGrid,
  Database,
  TestTube,
  Settings,
  User
} from 'lucide-react'

export function WellbeingTestPage() {
  const [testChildId, setTestChildId] = useState('test-child-001')
  const [activeTab, setActiveTab] = useState('overview')
  const [testResults, setTestResults] = useState<any>({})

  const handleToolComplete = (toolName: string, data: any) => {
    setTestResults(prev => ({
      ...prev,
      [toolName]: {
        completedAt: new Date().toISOString(),
        data
      }
    }))
    console.log(`${toolName} completed:`, data)
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto space-y-6">
        {/* Header */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <div>
                <CardTitle className="text-3xl flex items-center gap-2">
                  <TestTube className="w-8 h-8" />
                  Wellbeing Tools Test Suite v2
                </CardTitle>
                <CardDescription className="mt-2">
                  Test and preview all wellbeing tools with database integration
                </CardDescription>
              </div>
              <Badge variant="outline" className="text-lg px-4 py-2">
                Designer Mode
              </Badge>
            </div>
          </CardHeader>
          <CardContent>
            <div className="flex gap-4 items-end">
              <div className="flex-1">
                <Label htmlFor="testChildId">Test Child ID</Label>
                <Input
                  id="testChildId"
                  value={testChildId}
                  onChange={(e) => setTestChildId(e.target.value)}
                  placeholder="Enter test child ID"
                />
              </div>
              <Button variant="outline" onClick={() => setTestChildId(`test-child-${Date.now()}`)}>
                Generate New ID
              </Button>
            </div>
          </CardContent>
        </Card>

        {/* Main Tabs */}
        <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
          <TabsList className="grid grid-cols-7 w-full mb-6">
            <TabsTrigger value="overview">
              <LayoutGrid className="mr-2 h-4 w-4" />
              Overview
            </TabsTrigger>
            <TabsTrigger value="mood">
              <Heart className="mr-2 h-4 w-4" />
              Mood
            </TabsTrigger>
            <TabsTrigger value="emotions">
              <Brain className="mr-2 h-4 w-4" />
              Emotions
            </TabsTrigger>
            <TabsTrigger value="wheel">
              <Activity className="mr-2 h-4 w-4" />
              Wheel
            </TabsTrigger>
            <TabsTrigger value="breathing">
              <Wind className="mr-2 h-4 w-4" />
              Breathing
            </TabsTrigger>
            <TabsTrigger value="flow">
              <Settings className="mr-2 h-4 w-4" />
              Flow
            </TabsTrigger>
            <TabsTrigger value="debug">
              <Database className="mr-2 h-4 w-4" />
              Debug
            </TabsTrigger>
          </TabsList>

          {/* Overview Tab */}
          <TabsContent value="overview" className="mt-6 space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <Card>
                <CardHeader>
                  <CardTitle>Quick Links</CardTitle>
                  <CardDescription>Jump to any tool for testing</CardDescription>
                </CardHeader>
                <CardContent className="space-y-2">
                  <Button
                    variant="outline"
                    className="w-full justify-start"
                    onClick={() => setActiveTab('mood')}
                  >
                    <Heart className="mr-2 h-4 w-4" />
                    Test Mood Meter
                  </Button>
                  <Button
                    variant="outline"
                    className="w-full justify-start"
                    onClick={() => setActiveTab('emotions')}
                  >
                    <Brain className="mr-2 h-4 w-4" />
                    Test Emotion Grid
                  </Button>
                  <Button
                    variant="outline"
                    className="w-full justify-start"
                    onClick={() => setActiveTab('wheel')}
                  >
                    <Activity className="mr-2 h-4 w-4" />
                    Test Wellbeing Wheel
                  </Button>
                  <Button
                    variant="outline"
                    className="w-full justify-start"
                    onClick={() => setActiveTab('flow')}
                  >
                    <Settings className="mr-2 h-4 w-4" />
                    Test Complete Flow
                  </Button>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle>Test Results</CardTitle>
                  <CardDescription>Recent tool completions</CardDescription>
                </CardHeader>
                <CardContent>
                  {Object.keys(testResults).length === 0 ? (
                    <p className="text-gray-500">No tests completed yet</p>
                  ) : (
                    <div className="space-y-2">
                      {Object.entries(testResults).map(([tool, result]: any) => (
                        <div key={tool} className="flex items-center justify-between p-2 bg-gray-50 rounded">
                          <span className="font-medium">{tool}</span>
                          <Badge variant="secondary">
                            {new Date(result.completedAt).toLocaleTimeString()}
                          </Badge>
                        </div>
                      ))}
                    </div>
                  )}
                </CardContent>
              </Card>
            </div>

            <Card>
              <CardHeader>
                <CardTitle>Testing Instructions</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <Alert>
                  <User className="h-4 w-4" />
                  <AlertDescription>
                    <strong>For Designers:</strong> Use this page to test all wellbeing tools with realistic database integration.
                    Each tool saves data to Supabase and you can view the raw data in the Debug tab.
                  </AlertDescription>
                </Alert>

                <div className="space-y-2">
                  <h3 className="font-semibold">Available Tools:</h3>
                  <ul className="list-disc list-inside space-y-1 text-sm text-gray-600">
                    <li><strong>Mood Meter:</strong> 5-option mood selector with emoji visualization</li>
                    <li><strong>Emotion Grid:</strong> 36 emotions in 4 categories, max 3 selections, optional story</li>
                    <li><strong>Wellbeing Wheel:</strong> 7 life areas with mood ratings and optional notes</li>
                    <li><strong>Breathing Tool:</strong> (Coming soon) Guided breathing exercises</li>
                    <li><strong>Check-in Flow:</strong> Complete multi-tool check-in experience</li>
                  </ul>
                </div>

                <div className="space-y-2">
                  <h3 className="font-semibold">Debug Features:</h3>
                  <ul className="list-disc list-inside space-y-1 text-sm text-gray-600">
                    <li>Generate mock data for any tool</li>
                    <li>View raw database records</li>
                    <li>Export data as JSON</li>
                    <li>Clear all test data</li>
                    <li>Create historical data for trend testing</li>
                  </ul>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Mood Meter Tab */}
          <TabsContent value="mood" className="mt-6 space-y-6">
            <Card>
              <CardHeader>
                <CardTitle>Mood Meter Test</CardTitle>
                <CardDescription>Test the mood selection tool</CardDescription>
              </CardHeader>
              <CardContent>
                <MoodMeter
                  childId={testChildId}
                  onComplete={(value, label) => handleToolComplete('MoodMeter', { value, label })}
                  showFeedback={true}
                  allowSkip={true}
                />
              </CardContent>
            </Card>
          </TabsContent>

          {/* Emotion Grid Tab */}
          <TabsContent value="emotions" className="mt-6 space-y-6">
            <Card>
              <CardHeader>
                <CardTitle>Emotion Grid Test</CardTitle>
                <CardDescription>Test the emotion selection and story tool</CardDescription>
              </CardHeader>
              <CardContent>
                <EmotionGrid
                  childId={testChildId}
                  onComplete={(gridId) => handleToolComplete('EmotionGrid', { gridId })}
                  maxSelections={3}
                  maxStoryLength={500}
                />
              </CardContent>
            </Card>
          </TabsContent>

          {/* Wellbeing Wheel Tab */}
          <TabsContent value="wheel" className="mt-6 space-y-6">
            <Card>
              <CardHeader>
                <CardTitle>Wellbeing Wheel Test</CardTitle>
                <CardDescription>Test the 7-section wellbeing assessment</CardDescription>
              </CardHeader>
              <CardContent>
                <WellbeingWheelEnhanced
                  childId={testChildId}
                  onComplete={(wheelId, score) => handleToolComplete('WellbeingWheel', { wheelId, score })}
                  showVisualWheel={true}
                  allowNotes={true}
                />
              </CardContent>
            </Card>
          </TabsContent>

          {/* Breathing Tool Tab */}
          <TabsContent value="breathing" className="mt-6 space-y-6">
            <Card>
              <CardHeader>
                <CardTitle>Breathing Tool Test</CardTitle>
                <CardDescription>Breathing exercises with timer and pattern selection</CardDescription>
              </CardHeader>
              <CardContent>
                <Alert>
                  <Wind className="h-4 w-4" />
                  <AlertDescription>
                    The breathing tool integration is coming soon. The existing breathing component
                    needs to be enhanced with database integration to track duration, cycles, and patterns.
                  </AlertDescription>
                </Alert>
                <div className="mt-4">
                  <Button variant="outline" disabled>
                    Start Breathing Exercise
                  </Button>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Check-in Flow Tab */}
          <TabsContent value="flow" className="mt-6 space-y-6">
            <CheckInFlow
              childId={testChildId}
              allowSkip={true}
              requiredTools={['mood_meter']}
              onComplete={(sessionId) => handleToolComplete('CheckInFlow', { sessionId })}
            />
          </TabsContent>

          {/* Debug Tab */}
          <TabsContent value="debug" className="mt-6">
            <WellbeingDebugPanel childId={testChildId} />
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}