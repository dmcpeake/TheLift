import React, { useState, useEffect } from 'react'
import { getSupabaseClient } from '../../../utils/supabase/client'
import { WellbeingSectionType, MoodType } from '../../../types/database'
import { Button } from '../../ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../../ui/card'
import { Textarea } from '../../ui/textarea'
import { Badge } from '../../ui/badge'
import { Progress } from '../../ui/progress'
import { motion, AnimatePresence } from 'framer-motion'
import {
  AlertCircle,
  CheckCircle2,
  Users,
  Briefcase,
  Heart,
  Home,
  Gamepad2,
  Shield,
  Brain,
  ArrowRight,
  ArrowLeft,
  RotateCcw
} from 'lucide-react'
import { Alert, AlertDescription } from '../../ui/alert'

const supabase = getSupabaseClient()

interface SectionConfig {
  name: WellbeingSectionType
  label: string
  icon: React.ComponentType<{ className?: string }>
  color: string
  bgColor: string
  description: string
}

const sections: SectionConfig[] = [
  {
    name: 'my_friends',
    label: 'My Friends',
    icon: Users,
    color: 'text-purple-600',
    bgColor: 'bg-purple-50',
    description: 'How are things with your friends?'
  },
  {
    name: 'my_work',
    label: 'My Work',
    icon: Briefcase,
    color: 'text-blue-600',
    bgColor: 'bg-blue-50',
    description: 'How is school or your activities going?'
  },
  {
    name: 'my_health',
    label: 'My Health',
    icon: Heart,
    color: 'text-red-600',
    bgColor: 'bg-red-50',
    description: 'How is your body and mind feeling?'
  },
  {
    name: 'my_family',
    label: 'My Family',
    icon: Home,
    color: 'text-green-600',
    bgColor: 'bg-green-50',
    description: 'How are things at home?'
  },
  {
    name: 'my_fun_play',
    label: 'My Fun & Play',
    icon: Gamepad2,
    color: 'text-orange-600',
    bgColor: 'bg-orange-50',
    description: 'Are you having fun and enjoying play time?'
  },
  {
    name: 'my_safety',
    label: 'My Safety',
    icon: Shield,
    color: 'text-indigo-600',
    bgColor: 'bg-indigo-50',
    description: 'Do you feel safe and secure?'
  },
  {
    name: 'my_emotions',
    label: 'My Emotions',
    icon: Brain,
    color: 'text-pink-600',
    bgColor: 'bg-pink-50',
    description: 'How are your feelings today?'
  }
]

const moodOptions = [
  { value: 1, label: 'very_sad' as MoodType, emoji: '😢', text: 'Very Sad' },
  { value: 2, label: 'sad' as MoodType, emoji: '😔', text: 'Sad' },
  { value: 3, label: 'ok' as MoodType, emoji: '😐', text: 'OK' },
  { value: 4, label: 'happy' as MoodType, emoji: '😊', text: 'Happy' },
  { value: 5, label: 'very_happy' as MoodType, emoji: '😄', text: 'Very Happy' }
]

interface SectionScore {
  score: number
  label: MoodType
  note: string
}

interface WellbeingWheelEnhancedProps {
  childId: string
  sessionId?: string | null
  onComplete?: (wellbeingWheelId: string, overallScore: number) => void
  showVisualWheel?: boolean
  allowNotes?: boolean
}

export function WellbeingWheelEnhanced({
  childId,
  sessionId = null,
  onComplete,
  showVisualWheel = true,
  allowNotes = true
}: WellbeingWheelEnhancedProps) {
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0)
  const [sectionScores, setSectionScores] = useState<Record<WellbeingSectionType, SectionScore>>(() => {
    const initial: any = {}
    sections.forEach(section => {
      initial[section.name] = { score: 0, label: 'ok', note: '' }
    })
    return initial
  })
  const [startTime] = useState<number>(Date.now())
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [savedData, setSavedData] = useState<any>(null)
  const [viewMode, setViewMode] = useState<'sequential' | 'wheel'>('sequential')

  const currentSection = sections[currentSectionIndex]
  const currentScore = sectionScores[currentSection.name]
  const completedSections = Object.values(sectionScores).filter(s => s.score > 0).length
  const progressPercentage = (completedSections / sections.length) * 100

  const handleScoreSelect = (score: number, label: MoodType) => {
    setSectionScores(prev => ({
      ...prev,
      [currentSection.name]: {
        ...prev[currentSection.name],
        score,
        label
      }
    }))
    setError(null)
  }

  const handleNoteChange = (note: string) => {
    setSectionScores(prev => ({
      ...prev,
      [currentSection.name]: {
        ...prev[currentSection.name],
        note
      }
    }))
  }

  const handleNext = () => {
    if (currentSectionIndex < sections.length - 1) {
      setCurrentSectionIndex(currentSectionIndex + 1)
    } else {
      saveWellbeingData()
    }
  }

  const handlePrevious = () => {
    if (currentSectionIndex > 0) {
      setCurrentSectionIndex(currentSectionIndex - 1)
    }
  }

  const calculateOverallScore = () => {
    const scores = Object.values(sectionScores).map(s => s.score).filter(s => s > 0)
    if (scores.length === 0) return 0
    return scores.reduce((a, b) => a + b, 0) / scores.length
  }

  const saveWellbeingData = async () => {
    setLoading(true)
    setError(null)

    try {
      const completionTime = Date.now() - startTime
      const overallScore = calculateOverallScore()

      // Save wellbeing wheel usage
      const { data: wheelData, error: wheelError } = await supabase
        .from('wellbeing_wheel_usage')
        .insert({
          child_id: childId,
          session_id: sessionId,
          overall_score: overallScore,
          completion_time_ms: completionTime
        })
        .select()
        .single()

      if (wheelError) throw wheelError

      // Save section scores
      const sectionInserts = sections.map(section => ({
        wellbeing_wheel_id: wheelData.id,
        section_name: section.name,
        score_value: sectionScores[section.name].score,
        score_label: sectionScores[section.name].label,
        text_note: sectionScores[section.name].note || null
      }))

      const { error: sectionsError } = await supabase
        .from('wellbeing_wheel_sections')
        .insert(sectionInserts)

      if (sectionsError) throw sectionsError

      setSavedData({ ...wheelData, overallScore })

      if (onComplete) {
        onComplete(wheelData.id, overallScore)
      }
    } catch (err) {
      console.error('Error saving wellbeing wheel:', err)
      setError('Failed to save your wellbeing check-in. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const resetWheel = () => {
    setCurrentSectionIndex(0)
    setSectionScores(() => {
      const initial: any = {}
      sections.forEach(section => {
        initial[section.name] = { score: 0, label: 'ok', note: '' }
      })
      return initial
    })
    setSavedData(null)
    setError(null)
  }

  // Render wheel visualization
  const renderWheel = () => {
    const centerX = 200
    const centerY = 200
    const radius = 150
    const angleStep = (2 * Math.PI) / sections.length

    return (
      <svg width="400" height="400" className="mx-auto">
        {sections.map((section, index) => {
          const startAngle = index * angleStep - Math.PI / 2
          const endAngle = (index + 1) * angleStep - Math.PI / 2
          const score = sectionScores[section.name].score
          const scoreRadius = (score / 5) * radius

          const x1 = centerX + Math.cos(startAngle) * scoreRadius
          const y1 = centerY + Math.sin(startAngle) * scoreRadius
          const x2 = centerX + Math.cos(endAngle) * scoreRadius
          const y2 = centerY + Math.sin(endAngle) * scoreRadius

          const largeArcFlag = angleStep > Math.PI ? 1 : 0

          const pathData = [
            `M ${centerX} ${centerY}`,
            `L ${x1} ${y1}`,
            `A ${scoreRadius} ${scoreRadius} 0 ${largeArcFlag} 1 ${x2} ${y2}`,
            'Z'
          ].join(' ')

          return (
            <g key={section.name}>
              {/* Section background */}
              <path
                d={pathData}
                fill={section.color.replace('text-', 'fill-')}
                fillOpacity={0.3}
                stroke={section.color.replace('text-', 'stroke-')}
                strokeWidth="2"
              />
              {/* Section label */}
              <text
                x={centerX + Math.cos((startAngle + endAngle) / 2) * (radius + 20)}
                y={centerY + Math.sin((startAngle + endAngle) / 2) * (radius + 20)}
                textAnchor="middle"
                className="text-xs font-medium fill-gray-700"
              >
                {section.label}
              </text>
            </g>
          )
        })}
        {/* Center circle */}
        <circle cx={centerX} cy={centerY} r="10" fill="white" stroke="gray" strokeWidth="2" />
      </svg>
    )
  }

  if (savedData) {
    return (
      <Card className="w-full max-w-2xl mx-auto">
        <CardHeader>
          <div className="flex justify-center mb-4">
            <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center">
              <CheckCircle2 className="w-8 h-8 text-green-600" />
            </div>
          </div>
          <CardTitle className="text-2xl font-bold text-center">Wellbeing Check-In Complete!</CardTitle>
          <CardDescription className="text-center">
            Your overall wellbeing score: {savedData.overallScore.toFixed(1)}/5.0
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-6">
          {showVisualWheel && (
            <div className="flex justify-center">
              {renderWheel()}
            </div>
          )}

          <div className="space-y-2">
            {sections.map(section => {
              const score = sectionScores[section.name]
              return (
                <div key={section.name} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div className="flex items-center gap-3">
                    <section.icon className={`w-5 h-5 ${section.color}`} />
                    <span className="font-medium">{section.label}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <span className="text-2xl">{moodOptions[score.score - 1]?.emoji}</span>
                    <Badge variant="secondary">{score.score}/5</Badge>
                  </div>
                </div>
              )
            })}
          </div>

          <div className="flex justify-center gap-4">
            <Button variant="outline" onClick={resetWheel}>
              <RotateCcw className="mr-2 h-4 w-4" />
              Check In Again
            </Button>
            {onComplete && (
              <Button onClick={() => onComplete(savedData.id, savedData.overallScore)}>
                Continue
              </Button>
            )}
          </div>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card className="w-full max-w-3xl mx-auto">
      <CardHeader>
        <CardTitle className="text-2xl font-bold">Wellbeing Wheel</CardTitle>
        <CardDescription>
          Let's check in on different areas of your life
        </CardDescription>
        <Progress value={progressPercentage} className="w-full h-2" />
      </CardHeader>
      <CardContent className="space-y-6">
        {viewMode === 'sequential' ? (
          <AnimatePresence mode="wait">
            <motion.div
              key={currentSectionIndex}
              initial={{ opacity: 0, x: 20 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: -20 }}
              className="space-y-6"
            >
              {/* Current Section */}
              <div className={`p-6 rounded-xl ${currentSection.bgColor}`}>
                <div className="flex items-center gap-4 mb-4">
                  <div className={`w-12 h-12 rounded-full ${currentSection.bgColor} flex items-center justify-center`}>
                    <currentSection.icon className={`w-6 h-6 ${currentSection.color}`} />
                  </div>
                  <div>
                    <h3 className="text-lg font-semibold">{currentSection.label}</h3>
                    <p className="text-sm text-gray-600">{currentSection.description}</p>
                  </div>
                </div>

                {/* Mood Selection */}
                <div className="grid grid-cols-5 gap-2">
                  {moodOptions.map((mood) => (
                    <motion.button
                      key={mood.value}
                      whileHover={{ scale: 1.05 }}
                      whileTap={{ scale: 0.95 }}
                      onClick={() => handleScoreSelect(mood.value, mood.label)}
                      className={`
                        p-4 rounded-lg transition-all duration-200
                        ${currentScore.score === mood.value
                          ? 'bg-white shadow-md ring-2 ring-blue-500'
                          : 'bg-white/70 hover:bg-white'
                        }
                      `}
                    >
                      <div className="flex flex-col items-center gap-1">
                        <span className="text-3xl">{mood.emoji}</span>
                        <span className="text-xs font-medium">{mood.text}</span>
                      </div>
                    </motion.button>
                  ))}
                </div>

                {/* Optional Note */}
                {allowNotes && currentScore.score > 0 && (
                  <div className="mt-4 space-y-2">
                    <label className="text-sm font-medium text-gray-700">
                      Add a note (optional):
                    </label>
                    <Textarea
                      value={currentScore.note}
                      onChange={(e) => handleNoteChange(e.target.value)}
                      placeholder="Share more about how you're feeling in this area..."
                      className="resize-none h-20"
                      maxLength={200}
                    />
                    <div className="text-xs text-gray-500 text-right">
                      {currentScore.note.length}/200
                    </div>
                  </div>
                )}
              </div>

              {/* Section Progress Dots */}
              <div className="flex justify-center gap-2">
                {sections.map((section, index) => (
                  <button
                    key={section.name}
                    onClick={() => setCurrentSectionIndex(index)}
                    className={`
                      w-3 h-3 rounded-full transition-all
                      ${index === currentSectionIndex
                        ? 'bg-blue-500 w-8'
                        : sectionScores[section.name].score > 0
                          ? 'bg-blue-300'
                          : 'bg-gray-300'
                      }
                    `}
                  />
                ))}
              </div>

              {error && (
                <Alert variant="destructive">
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}

              {/* Navigation */}
              <div className="flex justify-between">
                <Button
                  variant="outline"
                  onClick={handlePrevious}
                  disabled={currentSectionIndex === 0}
                >
                  <ArrowLeft className="mr-2 h-4 w-4" />
                  Previous
                </Button>

                <Button
                  onClick={handleNext}
                  disabled={currentScore.score === 0 || loading}
                >
                  {currentSectionIndex === sections.length - 1 ? (
                    loading ? 'Saving...' : 'Complete'
                  ) : (
                    <>
                      Next
                      <ArrowRight className="ml-2 h-4 w-4" />
                    </>
                  )}
                </Button>
              </div>
            </motion.div>
          </AnimatePresence>
        ) : (
          // Wheel view mode
          <div className="space-y-6">
            {renderWheel()}
            <div className="text-center">
              <p className="text-gray-600">
                Click on each section to rate how you're feeling
              </p>
            </div>
          </div>
        )}

        {/* View Toggle */}
        {showVisualWheel && (
          <div className="flex justify-center">
            <Button
              variant="ghost"
              size="sm"
              onClick={() => setViewMode(viewMode === 'sequential' ? 'wheel' : 'sequential')}
            >
              {viewMode === 'sequential' ? 'Show Wheel View' : 'Show Questions'}
            </Button>
          </div>
        )}
      </CardContent>
    </Card>
  )
}