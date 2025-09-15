import React, { useState, useEffect } from 'react'
import { getSupabaseClient } from '../../../utils/supabase/client'
import { MoodType } from '../../../types/database'
import { Button } from '../../ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../../ui/card'
import { motion } from 'framer-motion'
import { AlertCircle, CheckCircle2 } from 'lucide-react'
import { Alert, AlertDescription } from '../../ui/alert'

const supabase = getSupabaseClient()

interface MoodOption {
  value: number
  label: MoodType
  emoji: string
  color: string
  bgColor: string
}

const moodOptions: MoodOption[] = [
  { value: 1, label: 'very_sad', emoji: '😢', color: 'text-red-600', bgColor: 'bg-red-50 hover:bg-red-100' },
  { value: 2, label: 'sad', emoji: '😔', color: 'text-orange-600', bgColor: 'bg-orange-50 hover:bg-orange-100' },
  { value: 3, label: 'ok', emoji: '😐', color: 'text-yellow-600', bgColor: 'bg-yellow-50 hover:bg-yellow-100' },
  { value: 4, label: 'happy', emoji: '😊', color: 'text-green-600', bgColor: 'bg-green-50 hover:bg-green-100' },
  { value: 5, label: 'very_happy', emoji: '😄', color: 'text-blue-600', bgColor: 'bg-blue-50 hover:bg-blue-100' }
]

interface MoodMeterProps {
  childId: string
  sessionId?: string | null
  onComplete?: (moodValue: number, moodLabel: MoodType) => void
  showFeedback?: boolean
  allowSkip?: boolean
}

export function MoodMeter({
  childId,
  sessionId = null,
  onComplete,
  showFeedback = true,
  allowSkip = false
}: MoodMeterProps) {
  const [selectedMood, setSelectedMood] = useState<MoodOption | null>(null)
  const [startTime, setStartTime] = useState<number>(Date.now())
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [success, setSuccess] = useState(false)
  const [selectionTime, setSelectionTime] = useState<number | null>(null)

  useEffect(() => {
    setStartTime(Date.now())
  }, [])

  const handleMoodSelect = async (mood: MoodOption) => {
    const endTime = Date.now()
    const timeTaken = endTime - startTime
    setSelectionTime(timeTaken)
    setSelectedMood(mood)
    setError(null)

    if (!showFeedback) {
      await saveMoodSelection(mood, timeTaken)
    }
  }

  const saveMoodSelection = async (mood: MoodOption, timeTaken: number) => {
    setLoading(true)
    setError(null)

    try {
      const { data, error: saveError } = await supabase
        .from('mood_meter_usage')
        .insert({
          child_id: childId,
          session_id: sessionId,
          mood_value: mood.value,
          mood_label: mood.label,
          selection_time_ms: timeTaken
        })
        .select()
        .single()

      if (saveError) throw saveError

      setSuccess(true)

      if (onComplete) {
        onComplete(mood.value, mood.label)
      }

      // Reset after a delay if showing feedback
      if (showFeedback) {
        setTimeout(() => {
          setSuccess(false)
          setSelectedMood(null)
          setStartTime(Date.now())
        }, 2000)
      }
    } catch (err) {
      console.error('Error saving mood:', err)
      setError('Failed to save your mood. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleConfirm = async () => {
    if (selectedMood && selectionTime !== null) {
      await saveMoodSelection(selectedMood, selectionTime)
    }
  }

  const handleSkip = () => {
    if (onComplete) {
      onComplete(0, 'ok') // Default to 'ok' when skipped
    }
  }

  return (
    <Card className="w-full max-w-2xl mx-auto">
      <CardHeader>
        <CardTitle className="text-2xl font-bold text-center">How are you feeling today?</CardTitle>
        <CardDescription className="text-center">
          Choose the emoji that best matches your mood
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-6">
        <div className="flex justify-center gap-4 flex-wrap">
          {moodOptions.map((mood) => (
            <motion.button
              key={mood.value}
              whileHover={{ scale: 1.1 }}
              whileTap={{ scale: 0.95 }}
              onClick={() => handleMoodSelect(mood)}
              disabled={loading || success}
              className={`
                relative p-6 rounded-xl transition-all duration-200
                ${mood.bgColor}
                ${selectedMood?.value === mood.value ? 'ring-4 ring-offset-2 ring-blue-500' : ''}
                disabled:opacity-50 disabled:cursor-not-allowed
                focus:outline-none focus:ring-4 focus:ring-offset-2 focus:ring-blue-500
              `}
            >
              <div className="flex flex-col items-center gap-2">
                <span className="text-5xl">{mood.emoji}</span>
                <span className={`text-sm font-medium capitalize ${mood.color}`}>
                  {mood.label.replace('_', ' ')}
                </span>
              </div>
              {selectedMood?.value === mood.value && (
                <motion.div
                  initial={{ scale: 0 }}
                  animate={{ scale: 1 }}
                  className="absolute -top-2 -right-2 bg-blue-500 text-white rounded-full p-1"
                >
                  <CheckCircle2 className="w-4 h-4" />
                </motion.div>
              )}
            </motion.button>
          ))}
        </div>

        {error && (
          <Alert variant="destructive">
            <AlertCircle className="h-4 w-4" />
            <AlertDescription>{error}</AlertDescription>
          </Alert>
        )}

        {success && showFeedback && (
          <motion.div
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
          >
            <Alert className="border-green-200 bg-green-50">
              <CheckCircle2 className="h-4 w-4 text-green-600" />
              <AlertDescription className="text-green-800">
                Your mood has been recorded! Thank you for sharing.
              </AlertDescription>
            </Alert>
          </motion.div>
        )}

        {selectedMood && showFeedback && !success && (
          <div className="flex justify-center gap-4 pt-4">
            <Button
              variant="outline"
              onClick={() => {
                setSelectedMood(null)
                setSelectionTime(null)
              }}
              disabled={loading}
            >
              Change Selection
            </Button>
            <Button
              onClick={handleConfirm}
              disabled={loading}
            >
              {loading ? 'Saving...' : 'Confirm Mood'}
            </Button>
          </div>
        )}

        {allowSkip && !selectedMood && !success && (
          <div className="flex justify-center pt-2">
            <Button
              variant="ghost"
              onClick={handleSkip}
              className="text-gray-500"
            >
              Skip for now
            </Button>
          </div>
        )}

        {selectionTime !== null && showFeedback && (
          <div className="text-center text-sm text-gray-500">
            Selection made in {(selectionTime / 1000).toFixed(1)} seconds
          </div>
        )}
      </CardContent>
    </Card>
  )
}