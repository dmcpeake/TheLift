import React, { useState, useEffect } from 'react'
import { getSupabaseClient } from '../../../utils/supabase/client'
import { EmotionCategory } from '../../../types/database'
import { Button } from '../../ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../../ui/card'
import { Textarea } from '../../ui/textarea'
import { Badge } from '../../ui/badge'
import { motion, AnimatePresence } from 'framer-motion'
import { AlertCircle, CheckCircle2, Mic, MicOff, X, ArrowRight, ArrowLeft } from 'lucide-react'
import { Alert, AlertDescription } from '../../ui/alert'
import { emotionCategories, Emotion, getAllEmotions } from './emotionData'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../../ui/tabs'
import { Progress } from '../../ui/progress'

const supabase = getSupabaseClient()

interface EmotionGridProps {
  childId: string
  sessionId?: string | null
  onComplete?: (emotionGridId: string) => void
  maxSelections?: number
  maxStoryLength?: number
}

export function EmotionGrid({
  childId,
  sessionId = null,
  onComplete,
  maxSelections = 3,
  maxStoryLength = 500
}: EmotionGridProps) {
  const [step, setStep] = useState<'selection' | 'story' | 'summary'>('selection')
  const [selectedEmotions, setSelectedEmotions] = useState<Emotion[]>([])
  const [storyText, setStoryText] = useState('')
  const [startTime] = useState<number>(Date.now())
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [savedData, setSavedData] = useState<any>(null)
  const [isRecording, setIsRecording] = useState(false)
  const [activeCategory, setActiveCategory] = useState<EmotionCategory>('high-energy-comfortable')

  const handleEmotionToggle = (emotion: Emotion) => {
    setError(null)

    const isSelected = selectedEmotions.some(e => e.name === emotion.name)

    if (isSelected) {
      setSelectedEmotions(prev => prev.filter(e => e.name !== emotion.name))
    } else {
      if (selectedEmotions.length >= maxSelections) {
        setError(`You can select up to ${maxSelections} emotions`)
        return
      }
      setSelectedEmotions(prev => [...prev, emotion])
    }
  }

  const handleStorySubmit = async () => {
    if (selectedEmotions.length === 0) {
      setError('Please select at least one emotion')
      return
    }

    setLoading(true)
    setError(null)

    try {
      const completionTime = Date.now() - startTime

      // Save emotion grid usage
      const { data: gridData, error: gridError } = await supabase
        .from('emotion_grid_usage')
        .insert({
          child_id: childId,
          session_id: sessionId,
          story_text: storyText || null,
          story_audio_url: null, // TODO: Implement audio recording
          completion_time_ms: completionTime
        })
        .select()
        .single()

      if (gridError) throw gridError

      // Save selected emotions
      const emotionInserts = selectedEmotions.map((emotion, index) => ({
        emotion_grid_id: gridData.id,
        feeling_name: emotion.name,
        category: emotion.category,
        selection_order: index + 1
      }))

      const { error: emotionsError } = await supabase
        .from('emotion_grid_feelings')
        .insert(emotionInserts)

      if (emotionsError) throw emotionsError

      setSavedData(gridData)
      setStep('summary')

      if (onComplete) {
        onComplete(gridData.id)
      }
    } catch (err) {
      console.error('Error saving emotion grid:', err)
      setError('Failed to save your emotions. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleRecordToggle = () => {
    // TODO: Implement speech-to-text functionality
    setIsRecording(!isRecording)
    if (!isRecording) {
      // Start recording
      setError('Speech-to-text is coming soon!')
    } else {
      // Stop recording
    }
  }

  const resetGrid = () => {
    setStep('selection')
    setSelectedEmotions([])
    setStoryText('')
    setSavedData(null)
    setError(null)
  }

  const progressPercentage = step === 'selection' ? 33 : step === 'story' ? 66 : 100

  return (
    <Card className="w-full max-w-4xl mx-auto">
      <CardHeader>
        <div className="space-y-2">
          <CardTitle className="text-2xl font-bold">Emotion Check-In</CardTitle>
          <CardDescription>
            {step === 'selection' && 'How are you feeling? Select up to 3 emotions.'}
            {step === 'story' && 'Tell us more about how you\'re feeling (optional).'}
            {step === 'summary' && 'Great job! Here\'s what you shared.'}
          </CardDescription>
          <Progress value={progressPercentage} className="w-full h-2" />
        </div>
      </CardHeader>
      <CardContent className="space-y-6">
        <AnimatePresence mode="wait">
          {step === 'selection' && (
            <motion.div
              key="selection"
              initial={{ opacity: 0, x: 20 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: -20 }}
              className="space-y-6"
            >
              <div className="flex items-center justify-between">
                <div className="flex gap-2 items-center">
                  <span className="text-sm text-gray-600">Selected:</span>
                  <div className="flex gap-2">
                    {selectedEmotions.map((emotion) => (
                      <Badge
                        key={emotion.name}
                        variant="secondary"
                        className="flex items-center gap-1"
                      >
                        <span>{emotion.emoji}</span>
                        <span>{emotion.name}</span>
                        <button
                          onClick={() => handleEmotionToggle(emotion)}
                          className="ml-1 hover:text-red-500"
                        >
                          <X className="w-3 h-3" />
                        </button>
                      </Badge>
                    ))}
                  </div>
                  {selectedEmotions.length === 0 && (
                    <span className="text-sm text-gray-400">None selected</span>
                  )}
                </div>
                <span className="text-sm text-gray-500">
                  {selectedEmotions.length}/{maxSelections}
                </span>
              </div>

              <Tabs value={activeCategory} onValueChange={(v) => setActiveCategory(v as EmotionCategory)}>
                <TabsList className="grid grid-cols-2 lg:grid-cols-4 w-full">
                  {Object.entries(emotionCategories).map(([key, data]) => (
                    <TabsTrigger
                      key={key}
                      value={key}
                      className="text-xs"
                    >
                      {data.label.split(' - ')[1]}
                      <br />
                      {data.label.split(' - ')[0]}
                    </TabsTrigger>
                  ))}
                </TabsList>

                {Object.entries(emotionCategories).map(([category, data]) => (
                  <TabsContent
                    key={category}
                    value={category}
                    className="mt-4"
                  >
                    <div className={`rounded-lg p-4 ${data.bgColor} ${data.borderColor} border-2`}>
                      <h3 className={`font-semibold mb-3 ${data.color}`}>
                        {data.label}
                      </h3>
                      <div className="grid grid-cols-3 gap-2">
                        {data.emotions.map((emotion) => {
                          const isSelected = selectedEmotions.some(e => e.name === emotion.name)
                          return (
                            <motion.button
                              key={emotion.name}
                              whileHover={{ scale: 1.05 }}
                              whileTap={{ scale: 0.95 }}
                              onClick={() => handleEmotionToggle({
                                name: emotion.name,
                                category: category as EmotionCategory,
                                color: data.color,
                                bgColor: data.bgColor,
                                borderColor: data.borderColor,
                                emoji: emotion.emoji
                              })}
                              className={`
                                p-3 rounded-lg transition-all duration-200
                                ${isSelected
                                  ? 'bg-white shadow-md ring-2 ring-blue-500'
                                  : 'bg-white/50 hover:bg-white/80'
                                }
                                ${selectedEmotions.length >= maxSelections && !isSelected
                                  ? 'opacity-50 cursor-not-allowed'
                                  : 'cursor-pointer'
                                }
                              `}
                              disabled={selectedEmotions.length >= maxSelections && !isSelected}
                            >
                              <div className="flex flex-col items-center gap-1">
                                <span className="text-2xl">{emotion.emoji}</span>
                                <span className="text-xs font-medium">{emotion.name}</span>
                              </div>
                            </motion.button>
                          )
                        })}
                      </div>
                    </div>
                  </TabsContent>
                ))}
              </Tabs>

              {error && (
                <Alert variant="destructive">
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}

              <div className="flex justify-end gap-4">
                <Button
                  onClick={() => setStep('story')}
                  disabled={selectedEmotions.length === 0}
                >
                  Next
                  <ArrowRight className="ml-2 h-4 w-4" />
                </Button>
              </div>
            </motion.div>
          )}

          {step === 'story' && (
            <motion.div
              key="story"
              initial={{ opacity: 0, x: 20 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: -20 }}
              className="space-y-6"
            >
              <div className="space-y-2">
                <div className="flex gap-2 flex-wrap">
                  {selectedEmotions.map((emotion) => (
                    <Badge key={emotion.name} variant="outline">
                      {emotion.emoji} {emotion.name}
                    </Badge>
                  ))}
                </div>
              </div>

              <div className="space-y-2">
                <label className="text-sm font-medium">
                  Would you like to tell us more about these feelings? (Optional)
                </label>
                <div className="relative">
                  <Textarea
                    value={storyText}
                    onChange={(e) => setStoryText(e.target.value.slice(0, maxStoryLength))}
                    placeholder="You can share what made you feel this way, or anything else you'd like to say..."
                    className="min-h-[150px]"
                    maxLength={maxStoryLength}
                  />
                  <div className="absolute bottom-2 right-2 text-xs text-gray-400">
                    {storyText.length}/{maxStoryLength}
                  </div>
                </div>
                <div className="flex justify-end">
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={handleRecordToggle}
                    className="gap-2"
                  >
                    {isRecording ? (
                      <>
                        <MicOff className="w-4 h-4" />
                        Stop Recording
                      </>
                    ) : (
                      <>
                        <Mic className="w-4 h-4" />
                        Use Voice
                      </>
                    )}
                  </Button>
                </div>
              </div>

              {error && (
                <Alert variant="destructive">
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}

              <div className="flex justify-between gap-4">
                <Button
                  variant="outline"
                  onClick={() => setStep('selection')}
                >
                  <ArrowLeft className="mr-2 h-4 w-4" />
                  Back
                </Button>
                <Button
                  onClick={handleStorySubmit}
                  disabled={loading}
                >
                  {loading ? 'Saving...' : 'Submit'}
                </Button>
              </div>
            </motion.div>
          )}

          {step === 'summary' && (
            <motion.div
              key="summary"
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              className="space-y-6 text-center"
            >
              <div className="flex justify-center">
                <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center">
                  <CheckCircle2 className="w-8 h-8 text-green-600" />
                </div>
              </div>

              <div className="space-y-4">
                <h3 className="text-lg font-semibold">Thank you for sharing!</h3>
                <p className="text-gray-600">
                  You selected {selectedEmotions.length} emotion{selectedEmotions.length !== 1 ? 's' : ''}:
                </p>
                <div className="flex justify-center gap-2 flex-wrap">
                  {selectedEmotions.map((emotion) => (
                    <Badge key={emotion.name} variant="secondary" className="text-lg py-2 px-4">
                      {emotion.emoji} {emotion.name}
                    </Badge>
                  ))}
                </div>
                {storyText && (
                  <div className="mt-4 p-4 bg-gray-50 rounded-lg text-left">
                    <p className="text-sm text-gray-600 mb-2">Your story:</p>
                    <p className="text-gray-800">{storyText}</p>
                  </div>
                )}
              </div>

              <div className="flex justify-center gap-4">
                <Button
                  variant="outline"
                  onClick={resetGrid}
                >
                  Check In Again
                </Button>
                {onComplete && (
                  <Button
                    onClick={() => savedData && onComplete(savedData.id)}
                  >
                    Continue
                  </Button>
                )}
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </CardContent>
    </Card>
  )
}