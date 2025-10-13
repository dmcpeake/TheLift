import React, { useEffect, useState, useRef, useMemo } from 'react'
import { motion } from 'framer-motion'
import { Cloud, Loader2 } from 'lucide-react'
import { projectId, publicAnonKey } from '../../utils/supabase/info'

 // Wellbeing category colors matching the treemap
const WELLBEING_COLORS = {
  my_friends: '#3B82F6',
  my_work: '#8B5CF6',
  my_health: '#EF4444',
  my_family: '#F59E0B',
  my_fun_play: '#10B981',
  my_safety: '#6366F1',
  my_emotions: '#EC4899'
}

// Sentiment delineation (positive / negative / neutral)
const SENTIMENT_COLORS = {
  positive: '#10B981', // green
  negative: '#EF4444', // red
  neutral:  '#6366F1'  // indigo
}

const POSITIVE_WORDS = [
  'happy','good','better','proud','confident','calm','excited','energetic','fun','love','enjoy',
  'progress','improve','improving','safe','well','relaxed','grateful','kind','friend','friends',
  'reading','drawing','art','game','gaming','football','sport','healthy','success','achieve','achievement'
]

const NEGATIVE_WORDS = [
  'sad','angry','anxious','anxiety','worried','worry','tired','stressed','stress','upset','bad','worse',
  'pain','hurt','sick','ill','lonely','bored','scared','fear','unsafe','bullying','bully','argument','fight',
  'tests','test','exam','exams','nervous','frustrated','overwhelmed'
]

function normalizeWord(t: string) {
  return (t || '').toLowerCase().replace(/[^a-z]/g, '')
}

function getSentiment(t: string): 'positive' | 'negative' | 'neutral' {
  const token = normalizeWord(t)
  if (!token) return 'neutral'

  // substring heuristics catch variants (e.g., anxious/anxiety, excited/exciting)
  const negSubs = ['sad','angry','anxi','worr','stress','tired','pain','sick','ill','lonely','bored','scare','fear','unsafe','bully','argu','fight','nerv','frustrat','overwhelm']
  const posSubs = ['happy','good','better','proud','confiden','calm','excit','energetic','fun','love','enjoy','progress','improv','safe','well','relax','grate','kind','success','achiev','healthy']

  if (NEGATIVE_WORDS.includes(token) || negSubs.some(s => token.includes(s))) return 'negative'
  if (POSITIVE_WORDS.includes(token) || posSubs.some(s => token.includes(s))) return 'positive'
  return 'neutral'
}

// Simple custom word cloud component styled like treemap
interface SimpleWordCloudProps {
  words: Array<{ text: string; value: number }>
  width: number
  height: number
  colors: string[]
}

function SimpleWordCloud({ words, width, height, colors }: SimpleWordCloudProps) {
  const wordElements = useMemo(() => {
    if (!words || words.length === 0) return []

    // Sort words by value (importance)
    const sortedWords = [...words].sort((a, b) => b.value - a.value)

    // Take top 20 words for better coverage
    const topWords = sortedWords.slice(0, 20)

    // Calculate sizes based on values (like treemap squares)
    const maxValue = Math.max(...topWords.map(w => w.value))
    const minValue = Math.min(...topWords.map(w => w.value))

    // Use d3-style treemap algorithm for proper space filling
    const totalValue = topWords.reduce((sum, word) => sum + word.value, 0)

     // Create a proper treemap layout with amplified size differences
    const layoutWords: Array<{
      text: string;
      value: number;
      x: number;
      y: number;
      width: number;
      height: number;
      sentiment: 'positive' | 'negative' | 'neutral';
      color: string;
      gradientId: string;
    }> = []

    // Amplify size differences using non-linear scaling
    const amplifiedWords = sortedWords.map(word => ({
      ...word,
      // Use square of the value to amplify differences (35^2 = 1225, 90^2 = 8100)
      amplifiedValue: Math.pow(word.value, 2)
    }))

    const amplifiedTotal = amplifiedWords.reduce((sum, word) => sum + word.amplifiedValue, 0)

    // Create a proper space-filling treemap layout
    const sortedBySize = [...amplifiedWords].sort((a, b) => b.amplifiedValue - a.amplifiedValue)

    // Use a simple treemap algorithm that creates rectangles
    let currentX = 0
    let currentY = 0
    let remainingWidth = width
    let remainingHeight = height

    for (let i = 0; i < sortedBySize.length; i++) {
      const word = sortedBySize[i]
      const proportion = word.amplifiedValue / amplifiedTotal
      const area = proportion * width * height

      // Decide orientation based on remaining space
      const aspectRatio = remainingWidth / remainingHeight

      let rectWidth: number
      let rectHeight: number

      if (remainingWidth > remainingHeight) {
        // Landscape orientation
        rectWidth = Math.min(remainingWidth, area / remainingHeight)
        rectHeight = remainingHeight
      } else {
        // Portrait orientation
        rectHeight = Math.min(remainingHeight, area / remainingWidth)
        rectWidth = remainingWidth
      }

      // Ensure minimum dimensions
      rectWidth = Math.max(50, rectWidth)
      rectHeight = Math.max(40, rectHeight)

       // Determine sentiment-based color
      const sentiment = getSentiment(word.text)
      const color = SENTIMENT_COLORS[sentiment]

      layoutWords.push({
        text: word.text,
        value: word.value,
        x: currentX,
        y: currentY,
        width: rectWidth,
        height: rectHeight,
        sentiment,
        color,
        gradientId: `word-gradient-${i}`
      })

      // Update remaining space
      if (remainingWidth > remainingHeight) {
        currentX += rectWidth
        remainingWidth -= rectWidth
      } else {
        currentY += rectHeight
        remainingHeight -= rectHeight
      }

      // Reset if we've filled the current strip
      if (remainingWidth < 50 || remainingHeight < 40) {
        if (remainingWidth > remainingHeight) {
          currentY += remainingHeight
          remainingHeight = height - currentY
          remainingWidth = width
          currentX = 0
        } else {
          currentX += remainingWidth
          remainingWidth = width - currentX
          remainingHeight = height
          currentY = 0
        }
      }
    }

    return layoutWords
  }, [words, width, height, colors])

  return (
    <div style={{ width: '100%', height: `${height}px`, overflow: 'hidden' }}>
      <svg width="100%" height="100%" viewBox={`0 0 ${width} ${height}`} preserveAspectRatio="xMidYMid meet">
        <defs>
          {wordElements.map((word, index) => (
            <linearGradient
              key={word.gradientId}
              id={word.gradientId}
              x1="0%"
              y1="0%"
              x2="100%"
              y2="100%"
            >
              <stop offset="0%" style={{ stopColor: word.color, stopOpacity: 1 }} />
              <stop offset="50%" style={{ stopColor: word.color, stopOpacity: 0.8 }} />
              <stop offset="100%" style={{ stopColor: word.color.replace('4', '6').replace('8', 'A').replace('C', 'E'), stopOpacity: 0.9 }} />
            </linearGradient>
          ))}
        </defs>

        {wordElements.map((word, index) => (
          <motion.g
            key={`${word.text}-${index}`}
            initial={{ opacity: 0, scale: 0.5 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ delay: index * 0.05, duration: 0.3 }}
          >
            {/* Rectangle background like treemap */}
            <rect
              x={word.x + 1}
              y={word.y + 1}
              width={Math.max(0, word.width - 2)}
              height={Math.max(0, word.height - 2)}
              rx={4}
              ry={4}
              fill={`url(#${word.gradientId})`}
              stroke={word.color}
              strokeWidth={1.5}
              opacity={0.95}
            />

            {/* Word text - multi-line wrap to avoid ellipsis and vertical clipping */}
            {(() => {
              const padding = 6
              // Base font size derived from rect size with upper bound
              let fontSize = Math.max(
                8,
                Math.min(word.width * 0.22, word.height * 0.32, 18)
              )
              const charWidth = fontSize * 0.6 // approx width per character
              const maxCharsPerLine = Math.max(
                3,
                Math.floor((word.width - padding * 2) / charWidth)
              )

              // Word-wrap into lines that fit horizontally
              const wordsArr = (word.text || '').split(' ')
              const lines: string[] = []
              let line = ''
              for (const w of wordsArr) {
                const test = line ? `${line} ${w}` : w
                if (test.length <= maxCharsPerLine) {
                  line = test
                } else {
                  if (line) lines.push(line)
                  line = w
                }
              }
              if (line) lines.push(line)

              // Limit number of lines to fit vertically, reduce fontSize if needed
              const lineHeight = fontSize * 1.1
              const maxLinesByHeight = Math.max(
                1,
                Math.floor((word.height - padding * 2) / lineHeight)
              )
              let maxLines = Math.min(3, maxLinesByHeight)

              // If still doesn't fit at current font size, try to shrink font slightly
              if (lines.length > maxLines && maxLines < 2) {
                fontSize = Math.max(8, fontSize - 2)
              }

              const effectiveLines =
                lines.length > maxLines
                  ? [...lines.slice(0, maxLines - 1), lines[maxLines - 1] + '…']
                  : lines

              const totalTextHeight =
                (effectiveLines.length - 1) * lineHeight
              const startY = word.y + word.height / 2 - totalTextHeight / 2

              return (
                <text
                  x={word.x + word.width / 2}
                  y={startY}
                  fontSize={fontSize}
                  fontWeight="700"
                  fill="white"
                  textAnchor="middle"
                  dominantBaseline="middle"
                  style={{
                    fontFamily: 'Inter, system-ui, sans-serif',
                    textShadow: '0 1px 2px rgba(0,0,0,0.3)',
                    pointerEvents: 'none'
                  }}
                >
                  {effectiveLines.map((ln, i) => (
                    <tspan
                      key={i}
                      x={word.x + word.width / 2}
                      dy={i === 0 ? 0 : lineHeight}
                    >
                      {ln}
                    </tspan>
                  ))}
                </text>
              )
            })()}
          </motion.g>
        ))}
      </svg>
    </div>
  )
}

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
  const [words, setWords] = useState<Array<{ text: string; value: number }>>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const containerRef = useRef<HTMLDivElement>(null)

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
        // Convert WordCloudWord[] to our simple format
        const formattedWords = data.words
          .filter((w: WordCloudWord) => w.text && w.text.trim() && w.value > 0)
          .map((w: WordCloudWord) => ({
            text: w.text.trim(),
            value: Math.max(1, Math.min(100, w.value)) // Ensure value is between 1-100
          }))

        console.log('Formatted words for word cloud:', formattedWords.length, formattedWords.slice(0, 5))
        console.log(
          'Word values:',
          formattedWords.map((w: { text: string; value: number }) => `${w.text}: ${w.value}`).join(', ')
        )
        setWords(formattedWords)
      } else {
        console.log('No words data received from API')
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

  // Word cloud options - spread directly as props
  const wordCloudProps = {
    colors,
    enableTooltip: true,
    deterministic: false, // Changed to false to avoid deterministic layout issues
    fontFamily: 'Inter, system-ui, sans-serif',
    fontSizes: [14, 60] as [number, number], // Reduced max size to prevent overflow
    fontStyle: 'normal' as const,
    fontWeight: '500' as const,
    padding: 2,
    rotations: 1, // Reduced rotations
    rotationAngles: [0, 0] as [number, number], // No rotation to avoid layout issues
    scale: 'linear' as const, // Changed from sqrt to linear
    spiral: 'rectangular' as const, // Changed from archimedean
    transitionDuration: 500, // Reduced transition time
    width: 600,
    height: 400
  }

  return (
    <div className="bg-white rounded-lg border border-gray-200 p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center space-x-2">
          <Cloud className="h-5 w-5 text-blue-600" />
          <h3 className="card-title">{title}</h3>
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
            className="w-full overflow-hidden"
            style={{ height: '320px' }}
            ref={containerRef}
          >
            <SimpleWordCloud
              words={words}
              width={1200}
              height={320}
              colors={colors}
            />
          </motion.div>
        )}
      </div>

      {/* Legend */}
      {!loading && !error && words.length > 0 && (
        <div className="mt-4 pt-4 border-t border-gray-200">
          <div className="flex items-center justify-center gap-6 text-xs text-gray-600">
            <div className="flex items-center gap-2">
              <span className="inline-block w-3 h-3 rounded-sm" style={{ background: SENTIMENT_COLORS.negative }}></span>
              <span>Negative</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="inline-block w-3 h-3 rounded-sm" style={{ background: SENTIMENT_COLORS.neutral }}></span>
              <span>Neutral</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="inline-block w-3 h-3 rounded-sm" style={{ background: SENTIMENT_COLORS.positive }}></span>
              <span>Positive</span>
            </div>
          </div>
          <p className="text-[11px] text-gray-400 text-center mt-2">
            Color denotes sentiment; size reflects frequency and emotional significance
          </p>
        </div>
      )}
    </div>
  )
}
