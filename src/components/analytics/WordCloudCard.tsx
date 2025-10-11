import React, { useEffect, useState } from 'react'
import { motion } from 'framer-motion'
import { Cloud, Loader2 } from 'lucide-react'
import { WordCloud, Word } from '@isoterik/react-word-cloud'
import { projectId, publicAnonKey } from '../../utils/supabase/info'

interface WordCloudCardProps {
  orgId?: string
  childId?: string
  dateRange?: 'week' | 'month' | 'all'
  title?: string
}

interface WordCloudWord {
  text: string
  value: number
}

export function WordCloudCard({ orgId, childId, dateRange = 'all', title = 'Key Themes' }: WordCloudCardProps) {
  const [words, setWords] = useState<Word[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    loadWordCloudData()
  }, [orgId, childId, dateRange])

  const loadWordCloudData = async () => {
    console.log('🔍 Loading word cloud data...', { orgId, childId, dateRange })
    setLoading(true)
    setError(null)

    try {
      const supabaseUrl = `https://${projectId}.supabase.co`
      const response = await fetch(
        `${supabaseUrl}/functions/v1/generate-word-cloud`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${publicAnonKey}`
          },
          body: JSON.stringify({
            orgId,
            childId,
            dateRange,
            maxWords: 50
          })
        }
      )

      if (!response.ok) {
        const errorData = await response.json()
        throw new Error(errorData.error || 'Failed to generate word cloud')
      }

      const data = await response.json()
      console.log('✅ Word cloud data received:', data)

      if (data.success && data.words) {
        // Convert WordCloudWord[] to Word[] format expected by the library
        const formattedWords: Word[] = data.words.map((w: WordCloudWord) => ({
          text: w.text,
          value: w.value
        }))
        setWords(formattedWords)
      } else {
        setWords([])
      }
    } catch (err) {
      console.error('❌ Error loading word cloud:', err)
      setError(err instanceof Error ? err.message : 'Failed to load word cloud')
    } finally {
      setLoading(false)
    }
  }

  // Custom color scheme based on wellbeing theme
  const colors = [
    '#3B82F6', // Blue (Friends)
    '#8B5CF6', // Purple (Work/School)
    '#EF4444', // Red (Health)
    '#F59E0B', // Orange (Family)
    '#10B981', // Green (Fun & Play)
    '#6366F1', // Indigo (Safety)
    '#EC4899'  // Pink (Emotions)
  ]

  // Word cloud options
  const options = {
    colors,
    enableTooltip: true,
    deterministic: true,
    fontFamily: 'Inter, system-ui, sans-serif',
    fontSizes: [16, 80] as [number, number],
    fontStyle: 'normal' as const,
    fontWeight: '600' as const,
    padding: 3,
    rotations: 2,
    rotationAngles: [-90, 0] as [number, number],
    scale: 'sqrt' as const,
    spiral: 'archimedean' as const,
    transitionDuration: 1000
  }

  return (
    <div className="bg-white rounded-lg border border-gray-200 p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center space-x-2">
          <Cloud className="h-5 w-5 text-blue-600" />
          <h3 className="text-lg font-semibold text-gray-900">{title}</h3>
        </div>
        {loading && (
          <Loader2 className="h-4 w-4 text-gray-400 animate-spin" />
        )}
      </div>

      {/* Word Cloud Display */}
      <div className="relative">
        {loading && (
          <div className="py-8 space-y-4">
            {/* Skeleton for word cloud - simulate word boxes */}
            <div className="grid grid-cols-5 gap-4 items-center justify-items-center">
              {/* Large words (top row) */}
              <div className="h-12 w-32 bg-gray-200 rounded animate-pulse"></div>
              <div className="h-10 w-28 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '100ms' }}></div>
              <div className="h-14 w-36 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '200ms' }}></div>
              <div className="h-11 w-30 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '300ms' }}></div>
              <div className="h-13 w-32 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '400ms' }}></div>

              {/* Medium words (second row) */}
              <div className="h-9 w-24 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '500ms' }}></div>
              <div className="h-8 w-28 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '600ms' }}></div>
              <div className="h-10 w-26 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '700ms' }}></div>
              <div className="h-9 w-22 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '800ms' }}></div>
              <div className="h-8 w-24 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '900ms' }}></div>

              {/* Small words (third row) */}
              <div className="h-6 w-18 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1000ms' }}></div>
              <div className="h-7 w-20 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1100ms' }}></div>
              <div className="h-6 w-22 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1200ms' }}></div>
              <div className="h-7 w-16 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1300ms' }}></div>
              <div className="h-6 w-20 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1400ms' }}></div>

              {/* Smaller words (fourth row) */}
              <div className="h-5 w-16 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1500ms' }}></div>
              <div className="h-5 w-18 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1600ms' }}></div>
              <div className="h-6 w-14 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1700ms' }}></div>
              <div className="h-5 w-16 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1800ms' }}></div>
              <div className="h-5 w-18 bg-gray-200 rounded animate-pulse" style={{ animationDelay: '1900ms' }}></div>
            </div>
            <p className="text-sm text-gray-500 text-center mt-4">Analyzing qualitative data...</p>
          </div>
        )}

        {error && (
          <div className="flex flex-col items-center justify-center py-16 space-y-2">
            <Cloud className="h-12 w-12 text-gray-300" />
            <p className="text-sm text-gray-500">{error}</p>
          </div>
        )}

        {!loading && !error && words.length === 0 && (
          <div className="flex flex-col items-center justify-center py-16 space-y-2">
            <Cloud className="h-12 w-12 text-gray-300" />
            <p className="text-sm text-gray-500">No qualitative data available</p>
            <p className="text-xs text-gray-400">Check back after children complete more check-ins</p>
          </div>
        )}

        {!loading && !error && words.length > 0 && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 0.5 }}
            className="w-full"
            style={{ height: '400px' }}
          >
            <WordCloud
              words={words}
              options={options}
            />
          </motion.div>
        )}
      </div>

      {/* Legend */}
      {!loading && !error && words.length > 0 && (
        <div className="mt-4 pt-4 border-t border-gray-200">
          <p className="text-xs text-gray-500 text-center">
            Word size indicates frequency and emotional significance in children's responses
          </p>
        </div>
      )}
    </div>
  )
}
