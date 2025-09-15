import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { getSupabaseClient } from '../../../utils/supabase/client'
import { createCheckinSession, updateCheckinSession } from '../../../utils/wellbeing/database'
import { MoodMeter } from '../mood-meter'
import { EmotionGrid } from '../emotion-grid'
import { WellbeingWheelEnhanced } from '../wellbeing-wheel/WellbeingWheelEnhanced'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../../ui/card'
import { Button } from '../../ui/button'
import { Badge } from '../../ui/badge'
import { Progress } from '../../ui/progress'
import { motion, AnimatePresence } from 'framer-motion'
import {
  CheckCircle2,
  Circle,
  Heart,
  Brain,
  Activity,
  Wind,
  Home,
  ArrowRight,
  Trophy,
  Sparkles
} from 'lucide-react'
import { Alert, AlertDescription } from '../../ui/alert'

const supabase = getSupabaseClient()

interface Tool {
  id: 'mood_meter' | 'emotion_grid' | 'wellbeing_wheel' | 'breathing_tool'
  name: string
  description: string
  icon: React.ComponentType<{ className?: string }>
  color: string
  bgColor: string
  completed: boolean
  optional?: boolean
}

interface CheckInFlowProps {
  childId: string
  allowSkip?: boolean
  requiredTools?: Array<'mood_meter' | 'emotion_grid' | 'wellbeing_wheel' | 'breathing_tool'>
  onComplete?: (sessionId: string) => void
}

export function CheckInFlow({
  childId,
  allowSkip = true,
  requiredTools = ['mood_meter'],
  onComplete
}: CheckInFlowProps) {
  const navigate = useNavigate()
  const [sessionId, setSessionId] = useState<string | null>(null)
  const [currentTool, setCurrentTool] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [tools, setTools] = useState<Tool[]>([
    {
      id: 'mood_meter',
      name: 'Mood Meter',
      description: 'How are you feeling today?',
      icon: Heart,
      color: 'text-red-600',
      bgColor: 'bg-red-50',
      completed: false,
      optional: !requiredTools.includes('mood_meter')
    },
    {
      id: 'emotion_grid',
      name: 'Emotion Grid',
      description: 'Explore your emotions in detail',
      icon: Brain,
      color: 'text-purple-600',
      bgColor: 'bg-purple-50',
      completed: false,
      optional: !requiredTools.includes('emotion_grid')
    },
    {
      id: 'wellbeing_wheel',
      name: 'Wellbeing Wheel',
      description: 'Check in on different areas of your life',
      icon: Activity,
      color: 'text-blue-600',
      bgColor: 'bg-blue-50',
      completed: false,
      optional: !requiredTools.includes('wellbeing_wheel')
    },
    {
      id: 'breathing_tool',
      name: 'Breathing Exercise',
      description: 'Take a moment to breathe and relax',
      icon: Wind,
      color: 'text-green-600',
      bgColor: 'bg-green-50',
      completed: false,
      optional: !requiredTools.includes('breathing_tool')
    }
  ])

  useEffect(() => {
    initializeSession()
  }, [])

  const initializeSession = async () => {
    setLoading(true)
    setError(null)

    try {
      const session = await createCheckinSession(childId)
      setSessionId(session.id)
    } catch (err) {
      console.error('Error creating session:', err)
      setError('Failed to start check-in session')
    } finally {
      setLoading(false)
    }
  }

  const handleToolComplete = async (toolId: Tool['id']) => {
    if (!sessionId) return

    try {
      await updateCheckinSession(sessionId, toolId)
      setTools(prev => prev.map(tool =>
        tool.id === toolId ? { ...tool, completed: true } : tool
      ))
      setCurrentTool(null)
    } catch (err) {
      console.error('Error updating session:', err)
      setError('Failed to save progress')
    }
  }

  const handleToolSelect = (toolId: string) => {
    setCurrentTool(toolId)
    setError(null)
  }

  const handleComplete = () => {
    if (onComplete && sessionId) {
      onComplete(sessionId)
    } else {
      navigate('/child/home')
    }
  }

  const completedCount = tools.filter(t => t.completed).length
  const requiredCount = tools.filter(t => !t.optional).length
  const progressPercentage = (completedCount / tools.length) * 100
  const canComplete = tools.filter(t => !t.optional && !t.completed).length === 0

  if (currentTool && sessionId) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 p-6">
        <div className="max-w-4xl mx-auto">
          <Button
            variant="ghost"
            onClick={() => setCurrentTool(null)}
            className="mb-4"
          >
            ← Back to Tools
          </Button>

          <AnimatePresence mode="wait">
            <motion.div
              key={currentTool}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
            >
              {currentTool === 'mood_meter' && (
                <MoodMeter
                  childId={childId}
                  sessionId={sessionId}
                  onComplete={() => handleToolComplete('mood_meter')}
                  showFeedback={true}
                  allowSkip={allowSkip}
                />
              )}
              {currentTool === 'emotion_grid' && (
                <EmotionGrid
                  childId={childId}
                  sessionId={sessionId}
                  onComplete={() => handleToolComplete('emotion_grid')}
                />
              )}
              {currentTool === 'wellbeing_wheel' && (
                <WellbeingWheelEnhanced
                  childId={childId}
                  sessionId={sessionId}
                  onComplete={() => handleToolComplete('wellbeing_wheel')}
                />
              )}
              {currentTool === 'breathing_tool' && (
                <Card className="max-w-2xl mx-auto">
                  <CardHeader>
                    <CardTitle>Breathing Exercise</CardTitle>
                    <CardDescription>
                      This tool is coming soon! For now, take 3 deep breaths.
                    </CardDescription>
                  </CardHeader>
                  <CardContent>
                    <Button onClick={() => handleToolComplete('breathing_tool')}>
                      Complete Exercise
                    </Button>
                  </CardContent>
                </Card>
              )}
            </motion.div>
          </AnimatePresence>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 p-6">
      <div className="max-w-4xl mx-auto space-y-6">
        {/* Header */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <div>
                <CardTitle className="text-2xl">Daily Check-In</CardTitle>
                <CardDescription>
                  Choose which tools you'd like to use today
                </CardDescription>
              </div>
              <Badge variant="outline" className="text-lg px-4 py-2">
                {completedCount}/{tools.length} Complete
              </Badge>
            </div>
            <Progress value={progressPercentage} className="mt-4" />
          </CardHeader>
        </Card>

        {/* Tool Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {tools.map((tool) => (
            <motion.div
              key={tool.id}
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
            >
              <Card
                className={`cursor-pointer transition-all duration-200 ${
                  tool.completed
                    ? 'opacity-75 ring-2 ring-green-500'
                    : 'hover:shadow-lg'
                }`}
                onClick={() => !tool.completed && handleToolSelect(tool.id)}
              >
                <CardHeader>
                  <div className="flex items-start justify-between">
                    <div className={`p-3 rounded-lg ${tool.bgColor}`}>
                      <tool.icon className={`w-6 h-6 ${tool.color}`} />
                    </div>
                    {tool.completed ? (
                      <CheckCircle2 className="w-6 h-6 text-green-500" />
                    ) : (
                      <Circle className="w-6 h-6 text-gray-300" />
                    )}
                  </div>
                  <CardTitle className="mt-3">{tool.name}</CardTitle>
                  <CardDescription>{tool.description}</CardDescription>
                  {tool.optional && (
                    <Badge variant="secondary" className="mt-2">
                      Optional
                    </Badge>
                  )}
                </CardHeader>
                <CardContent>
                  {!tool.completed && (
                    <Button className="w-full" variant="outline">
                      Start
                      <ArrowRight className="ml-2 h-4 w-4" />
                    </Button>
                  )}
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </div>

        {/* Completion Card */}
        {canComplete && (
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
          >
            <Card className="bg-gradient-to-r from-green-50 to-blue-50">
              <CardHeader>
                <div className="flex items-center justify-between">
                  <div>
                    <CardTitle className="flex items-center gap-2">
                      <Trophy className="w-5 h-5 text-yellow-500" />
                      Great Job!
                    </CardTitle>
                    <CardDescription>
                      You've completed all required check-ins
                    </CardDescription>
                  </div>
                  <Sparkles className="w-8 h-8 text-yellow-500" />
                </div>
              </CardHeader>
              <CardContent>
                <div className="flex gap-4">
                  {completedCount < tools.length && (
                    <Button variant="outline">
                      Continue with Optional Tools
                    </Button>
                  )}
                  <Button onClick={handleComplete}>
                    <Home className="mr-2 h-4 w-4" />
                    Finish Check-In
                  </Button>
                </div>
              </CardContent>
            </Card>
          </motion.div>
        )}

        {/* Error Message */}
        {error && (
          <Alert variant="destructive">
            <AlertDescription>{error}</AlertDescription>
          </Alert>
        )}

        {/* Skip Option */}
        {allowSkip && !canComplete && (
          <div className="text-center">
            <Button
              variant="ghost"
              onClick={handleComplete}
              className="text-gray-500"
            >
              Skip remaining tools for now
            </Button>
          </div>
        )}
      </div>
    </div>
  )
}