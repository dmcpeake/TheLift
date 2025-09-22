import React, { useState, useEffect } from 'react'
import { MoodHeatmap } from './MoodHeatmap'
import { motion, AnimatePresence } from 'framer-motion'
import { getSupabaseClient } from '../../utils/supabase/client.tsx'
import { projectId, publicAnonKey } from '../../utils/supabase/info.tsx'
import { PageLoader, LottieLoader } from '../shared/LottieLoader'
import { ComparisonView } from './comparison/ComparisonView'
import { CriticalSupportAlert } from './CriticalSupportAlert'
import {
  ChevronDown, ChevronRight, TrendingUp, TrendingDown,
  Calendar, Heart, Brain, MessageSquare, Sparkles,
  User, Activity, AlertCircle, Clock, Minus, BarChart3,
  AlertTriangle
} from 'lucide-react'

const supabase = getSupabaseClient()

interface Organization {
  id: string
  name: string
}

interface Child {
  id: string
  name: string
  avatar_url?: string
  initials?: string
  lastCheckIn?: string
  moodTrend?: 'improving' | 'developing' | 'stable'
  averageMood?: number
  recentMood?: number
  checkInCount?: number
}

interface CheckIn {
  id: string
  created_at: string
  mood_numeric?: number
  mood_level?: string
  notes?: string
  feelings?: string[]
  explanation?: string
}

interface AIInsights {
  summary: string
  concerns?: string[]
  strengths?: string[]
  recommendations?: string[]
  lastAnalyzed?: string
}

const MOOD_COLORS = {
  1: '#EF4444', // Red
  2: '#F97316', // Orange
  3: '#FCD34D', // Yellow
  4: '#86EFAC', // Light Green
  5: '#10B981'  // Green
}

const MOOD_EMOJIS = {
  1: '😢',
  2: '😕',
  3: '😐',
  4: '🙂',
  5: '😊'
}

// Force Tailwind to include these classes by using them in a hidden div
// This ensures all avatar colors are available in production build
const FORCE_TAILWIND_CLASSES = (
  <div className="hidden bg-blue-500 bg-green-500 bg-purple-500 bg-orange-500 bg-pink-500 bg-teal-500 bg-red-500 bg-indigo-500 bg-yellow-500 bg-cyan-500 bg-emerald-500 bg-rose-500 bg-violet-500 bg-amber-500 bg-sky-500 bg-lime-500 bg-fuchsia-500 bg-slate-500 rounded-full rounded-lg" />
)
const AVATAR_STYLES = [
  { bg: 'bg-blue-500', shape: 'rounded-full' },
  { bg: 'bg-green-500', shape: 'rounded-lg' },
  { bg: 'bg-purple-500', shape: 'rounded-full' },
  { bg: 'bg-orange-500', shape: 'rounded-lg' },
  { bg: 'bg-pink-500', shape: 'rounded-full' },
  { bg: 'bg-teal-500', shape: 'rounded-lg' },
  { bg: 'bg-red-500', shape: 'rounded-full' },
  { bg: 'bg-indigo-500', shape: 'rounded-lg' },
  { bg: 'bg-yellow-500', shape: 'rounded-full' },
  { bg: 'bg-cyan-500', shape: 'rounded-lg' },
  { bg: 'bg-emerald-500', shape: 'rounded-full' },
  { bg: 'bg-rose-500', shape: 'rounded-lg' },
  { bg: 'bg-violet-500', shape: 'rounded-full' },
  { bg: 'bg-amber-500', shape: 'rounded-lg' },
  { bg: 'bg-sky-500', shape: 'rounded-full' },
  { bg: 'bg-lime-500', shape: 'rounded-lg' },
  { bg: 'bg-fuchsia-500', shape: 'rounded-full' },
  { bg: 'bg-slate-500', shape: 'rounded-lg' }
]

export function ChildSummaryAnalytics() {
  const [organizations, setOrganizations] = useState<Organization[]>([])
  const [selectedOrg, setSelectedOrg] = useState<string>('all')
  const [children, setChildren] = useState<Child[]>([])
  const [expandedChild, setExpandedChild] = useState<string | null>(null)
  const [checkInHistory, setCheckInHistory] = useState<Record<string, CheckIn[]>>({})
  const [moodHistory, setMoodHistory] = useState<Record<string, any[]>>({})
  const [aiInsights, setAIInsights] = useState<Record<string, AIInsights>>({})
  const [loading, setLoading] = useState(true)
  const [loadingInsights, setLoadingInsights] = useState<Record<string, boolean>>({})
  const [aiAnalysisProgress, setAiAnalysisProgress] = useState<Record<string, number>>({})
  const [loadingStages, setLoadingStages] = useState<Array<{ name: string; status: 'pending' | 'loading' | 'complete' | 'error' }>>([
    { name: 'Loading organizations', status: 'loading' },
    { name: 'Loading children profiles', status: 'pending' },
    { name: 'Loading check-in data', status: 'pending' },
    { name: 'Loading mood history', status: 'pending' },
    { name: 'Preparing analytics', status: 'pending' }
  ])
  const [currentLoadingStage, setCurrentLoadingStage] = useState(0)
  const [showComparison, setShowComparison] = useState(false)

  useEffect(() => {
    loadOrganizations()
  }, [])

  useEffect(() => {
    if (selectedOrg) {
      loadChildren()
    }
  }, [selectedOrg])

  const loadOrganizations = async () => {
    try {
      setLoadingStages(prev => prev.map((s, i) =>
        i === 0 ? { ...s, status: 'loading' } : s
      ))

      const { data, error } = await supabase
        .from('organisations')  // Fixed: table name has 's'
        .select('id, name')
        .order('name')

      if (error) {
        console.error('Error loading organizations:', error)
        setLoadingStages(prev => prev.map((s, i) =>
          i === 0 ? { ...s, status: 'error' } : s
        ))
        // Use a fallback organization if table doesn't exist
        setOrganizations([{ id: 'default', name: 'All Children' }])
        setSelectedOrg('default')
        return
      }

      setLoadingStages(prev => prev.map((s, i) =>
        i === 0 ? { ...s, status: 'complete' } : s
      ))

      if (data && data.length > 0) {
        setOrganizations(data)
        if (selectedOrg === 'all') {
          setSelectedOrg(data[0].id)
        }
      } else {
        // If no organizations exist, create a default
        setOrganizations([{ id: 'default', name: 'All Children' }])
        setSelectedOrg('default')
      }
    } catch (error) {
      console.error('Error in loadOrganizations:', error)
      setLoadingStages(prev => prev.map((s, i) =>
        i === 0 ? { ...s, status: 'error' } : s
      ))
      setOrganizations([{ id: 'default', name: 'All Children' }])
      setSelectedOrg('default')
    }
  }

  const loadChildren = async () => {
    try {
      setLoading(true)
      setCurrentLoadingStage(1)
      setLoadingStages(prev => prev.map((s, i) => ({
        ...s,
        status: i === 0 ? 'complete' : i === 1 ? 'loading' : 'pending'
      })))

      // Load children profiles
      let childQuery = supabase
        .from('profiles')
        .select('*')
        .eq('role', 'Child')
        .order('name')

      // Only filter by org if it's not the default fallback
      if (selectedOrg !== 'all' && selectedOrg !== 'default') {
        childQuery = childQuery.eq('org_id', selectedOrg)
      }

      const { data: childProfiles } = await childQuery

      if (!childProfiles) {
        setChildren([])
        return
      }

      // Update loading stage - moving to check-in data
      setCurrentLoadingStage(2)
      setLoadingStages(prev => prev.map((s, i) => ({
        ...s,
        status: i <= 1 ? 'complete' : i === 2 ? 'loading' : 'pending'
      })))

      // Load all mood data for each child (not just recent)
      const childIds = childProfiles.map(c => c.id)

      const { data: moodData } = await supabase
        .from('mood_meter_usage')
        .select('*')
        .in('child_id', childIds)
        .order('selected_at', { ascending: false })

      // Update loading stage - moving to mood history
      setCurrentLoadingStage(3)
      setLoadingStages(prev => prev.map((s, i) => ({
        ...s,
        status: i <= 2 ? 'complete' : i === 3 ? 'loading' : 'pending'
      })))

      // Store mood history for all children (for comparison views)
      const allMoodHistory: Record<string, any[]> = {}
      childProfiles.forEach(child => {
        const childMoods = moodData?.filter(m => m.child_id === child.id) || []
        allMoodHistory[child.id] = childMoods
      })
      setMoodHistory(allMoodHistory)

      // Process children with mood data
      const processedChildren: Child[] = childProfiles.map(child => {
        const childMoods = allMoodHistory[child.id] || []
        const recentMoods = childMoods.slice(0, 10)
        const olderMoods = childMoods.slice(10, 20)

        // Calculate average moods
        const recentAvg = recentMoods.length > 0
          ? recentMoods.reduce((sum, m) => sum + m.mood_numeric, 0) / recentMoods.length
          : 0
        const olderAvg = olderMoods.length > 0
          ? olderMoods.reduce((sum, m) => sum + m.mood_numeric, 0) / olderMoods.length
          : 0

        // Determine trend
        let trend: 'improving' | 'developing' | 'stable' = 'stable'
        if (recentAvg > olderAvg + 0.3) trend = 'improving'
        else if (recentAvg < olderAvg - 0.3) trend = 'developing'

        // Get initials for avatar
        const nameParts = child.name?.split(' ') || []
        const initials = nameParts.length >= 2
          ? `${nameParts[0][0]}${nameParts[1][0]}`.toUpperCase()
          : child.name?.substring(0, 2).toUpperCase() || 'XX'

        return {
          id: child.id,
          name: child.name || 'Unknown',
          avatar_url: child.avatar_url,
          initials,
          lastCheckIn: childMoods[0]?.selected_at
            ? new Date(childMoods[0].selected_at).toLocaleDateString('en-US', {
                month: 'short',
                day: 'numeric',
                year: 'numeric'
              })
            : 'Never',
          moodTrend: trend,
          averageMood: recentAvg,
          recentMood: childMoods[0]?.mood_numeric,
          checkInCount: childMoods.length
        }
      })

      // Sort by those needing attention first
      processedChildren.sort((a, b) => {
        // CRITICAL: Children with average mood < 2.5 always come first
        const aCritical = (a.averageMood || 5) < 2.5
        const bCritical = (b.averageMood || 5) < 2.5

        if (aCritical && !bCritical) return -1
        if (!aCritical && bCritical) return 1

        // Among critical cases, sort by severity (lowest mood first)
        if (aCritical && bCritical) {
          return (a.averageMood || 5) - (b.averageMood || 5)
        }

        // Then prioritize children with developing trends
        if (a.moodTrend === 'developing' && b.moodTrend !== 'developing') return -1
        if (b.moodTrend === 'developing' && a.moodTrend !== 'developing') return 1

        // Finally by lowest average mood
        return (a.averageMood || 5) - (b.averageMood || 5)
      })

      // Update loading stage - preparing analytics
      setCurrentLoadingStage(4)
      setLoadingStages(prev => prev.map((s, i) => ({
        ...s,
        status: i <= 3 ? 'complete' : i === 4 ? 'loading' : 'pending'
      })))

      // Small delay to show the final stage
      await new Promise(resolve => setTimeout(resolve, 500))

      setChildren(processedChildren)

      // Complete all loading stages
      setLoadingStages(prev => prev.map(s => ({ ...s, status: 'complete' })))
    } catch (error) {
      console.error('Error loading children:', error)
      setLoadingStages(prev => prev.map((s, i) => ({
        ...s,
        status: s.status === 'loading' ? 'error' : s.status
      })))
    } finally {
      setLoading(false)
    }
  }

  const loadCheckInHistory = async (childId: string) => {
    // Check if already loaded
    if (checkInHistory[childId]) return

    console.log(`Loading check-in history for child: ${childId}`)

    // Fetch check-in sessions with notes from various tools
    const [sessionsResponse, moodResponse] = await Promise.all([
      // Get recent check-in sessions
      supabase
        .from('checkin_sessions')
        .select('*')
        .eq('child_id', childId)
        .order('started_at', { ascending: false })
        .limit(5),

      // Get mood meter data for the heatmap
      supabase
        .from('mood_meter_usage')
        .select('*')
        .eq('child_id', childId)
        .order('selected_at', { ascending: false })
        .limit(30)
    ])

    const { data: sessionsData, error: sessionsError } = sessionsResponse
    const { data: moodData, error: moodError } = moodResponse

    // For each session, fetch associated tool notes
    const checkIns: CheckIn[] = []

    if (sessionsData) {
      for (const session of sessionsData) {
        // Fetch all tool usage data for this session
        const [moodUsage, emotionUsage, wellbeingUsage] = await Promise.all([
          supabase
            .from('mood_meter_usage')
            .select('mood_level, mood_numeric, notes')
            .eq('session_id', session.id)
            .single(),

          supabase
            .from('emotion_grid_usage')
            .select('explanation_text')
            .eq('session_id', session.id)
            .single()
            .then(result => {
              // Handle 406 errors gracefully
              if (result.error && result.error.code === 'PGRST301') {
                console.log('emotion_grid_usage not accessible, skipping')
                return { data: null, error: null }
              }
              return result
            }),

          supabase
            .from('wellbeing_wheel_usage')
            .select('overall_score')
            .eq('session_id', session.id)
            .single()
            .then(result => {
              // Handle 406 errors gracefully
              if (result.error && result.error.code === 'PGRST301') {
                console.log('wellbeing_wheel_usage not accessible, skipping')
                return { data: null, error: null }
              }
              return result
            })
        ])

        // Combine all notes and information
        const notes = []
        if (moodUsage.data?.notes) notes.push(`Mood: ${moodUsage.data.notes}`)
        if (emotionUsage && emotionUsage.data?.explanation_text) notes.push(`Feelings: ${emotionUsage.data.explanation_text}`)
        if (wellbeingUsage && wellbeingUsage.data?.overall_score) notes.push(`Wellbeing score: ${wellbeingUsage.data.overall_score}`)

        // Only add check-in if there are actual notes
        const combinedNotes = notes.join(' | ')
        if (combinedNotes && combinedNotes.trim() !== '') {
          checkIns.push({
            id: session.id,
            created_at: session.started_at, // Use started_at instead of created_at
            mood_numeric: moodUsage.data?.mood_numeric,
            mood_level: moodUsage.data?.mood_level,
            notes: combinedNotes,
            feelings: [],
            explanation: emotionUsage.data?.explanation_text
          })
        }
      }
    }

    console.log(`Processed ${checkIns.length} check-ins with notes`)

    // Store mood data separately for heatmap
    const moodHistory = moodData || []

    setCheckInHistory(prev => ({
      ...prev,
      [childId]: checkIns
    }))

    // Store mood data for heatmap (we'll add this state next)
    setMoodHistory(prev => ({
      ...prev,
      [childId]: moodHistory
    }))
  }

  const loadAIInsights = async (childId: string) => {
    // Check if already loading or loaded
    if (loadingInsights[childId] || aiInsights[childId]) return

    console.log('Loading AI insights for child:', childId)
    setLoadingInsights(prev => ({ ...prev, [childId]: true }))
    setAiAnalysisProgress(prev => ({ ...prev, [childId]: 0 }))

    // Simulate progress updates
    const progressInterval = setInterval(() => {
      setAiAnalysisProgress(prev => {
        const currentProgress = prev[childId] || 0
        if (currentProgress >= 90) {
          return prev
        }
        // Increment by 10-20% each time
        const increment = Math.floor(Math.random() * 10) + 10
        return { ...prev, [childId]: Math.min(currentProgress + increment, 90) }
      })
    }, 500)

    try {
      // Use the correct Supabase URL and key
      const supabaseUrl = `https://${projectId}.supabase.co`

      console.log('Calling AI analysis edge function...')
      // Call the optimized AI analysis edge function with new comprehensive prompt
      const response = await fetch(
        `${supabaseUrl}/functions/v1/analyze-qualitative-data-optimized`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${publicAnonKey}`
          },
          body: JSON.stringify({
            childId,
            dateRange: 'all',  // Changed from 'month' to 'all' to capture the demo data
            analysisType: 'comprehensive'
          })
        }
      )

      console.log('AI analysis response:', response.status, response.ok)
      if (response.ok) {
        const data = await response.json()
        console.log('AI analysis data:', data)

        // Log debug info if available
        if (data.debug) {
          console.log('🔍 DEBUG INFO FROM EDGE FUNCTION:')
          console.log(`  Organization Type: ${data.debug.orgType}`)
          console.log(`  Prompt File Used: ${data.debug.promptFile}.md`)
          console.log(`  Child Name: ${data.debug.childName}`)
          console.log(`  System Prompt Type: ${data.debug.systemPromptType}`)
        }

        // Parse the AI response into structured insights
        const analysis = cleanupText(data.analysis || '')

        // Debug: Log the raw AI response
        console.log('Raw AI analysis response:', analysis.substring(0, 500) + '...')
        console.log('Full AI response for debugging:', analysis)

        // Parse the new comprehensive AI response format
        const insights: AIInsights = {
          summary: cleanupText(extractSection(analysis, 'EXECUTIVE SUMMARY') ||
                   extractSection(analysis, 'Executive Summary') ||
                   analysis.split('\n')[0] || // First line as fallback
                   'Analysis in progress...'),
          concerns: extractBulletPoints(analysis, 'RED FLAGS & EARLY WARNING SIGNS') ||
                   extractBulletPoints(analysis, 'RED FLAGS') ||
                   extractBulletPoints(analysis, 'IMMEDIATE ACTION REQUIRED') ||
                   extractBulletPoints(analysis, 'Key Concerns'),
          strengths: extractBulletPoints(analysis, 'STRENGTHS & PROTECTIVE FACTORS') ||
                    extractBulletPoints(analysis, 'STRENGTHS') ||
                    extractBulletPoints(analysis, 'Positive Indicators'),
          recommendations: extractBulletPoints(analysis, 'SUPPORT RECOMMENDATIONS') ||
                          extractBulletPoints(analysis, 'Recommendations') ||
                          extractBulletPoints(analysis, 'IMMEDIATE ACTION REQUIRED'),
          lastAnalyzed: new Date().toLocaleDateString()
        }

        console.log('Parsed insights:', insights)

        // Set progress to 100% when complete
        clearInterval(progressInterval)
        setAiAnalysisProgress(prev => ({ ...prev, [childId]: 100 }))

        setAIInsights(prev => ({
          ...prev,
          [childId]: insights
        }))
      }
    } catch (error) {
      console.error('Error loading AI insights:', error)
      clearInterval(progressInterval)
      setAiAnalysisProgress(prev => ({ ...prev, [childId]: 0 }))
    } finally {
      setTimeout(() => {
        setLoadingInsights(prev => ({ ...prev, [childId]: false }))
        setAiAnalysisProgress(prev => ({ ...prev, [childId]: 0 }))
      }, 500) // Small delay to show 100% briefly
    }
  }

  // Helper function to clean up text with underscores and fix capitalization
  const cleanupText = (text: string): string => {
    // Replace common patterns with underscores with proper text
    let cleaned = text
      .replace(/declining_pattern/gi, 'developing pattern')
      .replace(/improving_pattern/gi, 'strengthening pattern')
      .replace(/stable_pattern/gi, 'consistent pattern')
      .replace(/concerning_pattern/gi, 'area for additional support')
      .replace(/positive_pattern/gi, 'strength-based pattern')
      .replace(/mood_trend/gi, 'mood trend')
      .replace(/emotional_state/gi, 'emotional state')
      .replace(/wellbeing_score/gi, 'wellbeing score')
      .replace(/check_in/gi, 'check-in')
      .replace(/follow_up/gi, 'follow-up')
      .replace(/self_esteem/gi, 'self-esteem')
      .replace(/peer_relationships/gi, 'peer relationships')
      .replace(/family_dynamics/gi, 'family dynamics')
      .replace(/school_performance/gi, 'school performance')
      .replace(/behavioral_changes/gi, 'behavioral changes')
      .replace(/risk_factors/gi, 'risk factors')
      .replace(/protective_factors/gi, 'protective factors')
      .replace(/mental_health/gi, 'mental health')
      .replace(/emotional_regulation/gi, 'emotional regulation')
      .replace(/coping_strategies/gi, 'coping strategies')
      .replace(/support_system/gi, 'support system')
      .replace(/warning_signs/gi, 'warning signs')
      // Clean up camelCase field names from AI responses
      .replace(/"?moodTrend"?/g, 'mood trend')
      .replace(/"?averageMood"?/g, 'average mood')
      .replace(/"?checkInCount"?/g, 'check-in count')
      .replace(/"?lastCheckIn"?/g, 'last check-in')
      .replace(/"?recentMood"?/g, 'recent mood')
      .replace(/"?concerningPatterns?"?/g, 'areas for additional support')
      .replace(/"?positivePatterns?"?/g, 'positive indicators')
      .replace(/"?emotionalState"?/g, 'emotional state')
      .replace(/"?wellbeingScore"?/g, 'wellbeing score')
      .replace(/"?supportNeeds"?/g, 'support needs')
      // Remove quotes around technical field names
      .replace(/["']([a-zA-Z_]+)["']/g, '$1')
      // Handle generic camelCase to space conversion (without lowercasing everything)
      .replace(/([a-z])([A-Z])/g, '$1 $2')
      // Generic pattern: replace any remaining word_word patterns
      .replace(/(\w+)_(\w+)/g, '$1 $2')

    // Fix sentence capitalization
    // First, capitalize the first letter of the entire string
    if (cleaned.length > 0) {
      cleaned = cleaned.charAt(0).toUpperCase() + cleaned.slice(1)
    }

    // Capitalize first letter after sentence endings (. ! ?)
    cleaned = cleaned.replace(/([.!?])\s+([a-z])/g, (match, p1, p2) => {
      return p1 + ' ' + p2.toUpperCase()
    })

    // Capitalize proper nouns (children's names)
    const childNames = ['Sophia', 'Emma', 'Aisha', 'Lucas', 'Oliver', 'Ava', 'Maya', 'Charlie', 'Sebastian', 'Jayden', 'Liam', 'Noah', 'Ethan', 'Mason', 'Olivia', 'Isabella', 'Mia', 'Charlotte']
    childNames.forEach(name => {
      const regex = new RegExp(`\\b${name.toLowerCase()}\\b`, 'gi')
      cleaned = cleaned.replace(regex, name)
    })

    // Fix spacing issues around decimals (like "3. 5" -> "3.5")
    cleaned = cleaned.replace(/(\d)\s+\.\s+(\d)/g, '$1.$2')

    // Capitalize 'I' when it stands alone
    cleaned = cleaned.replace(/\bi\b/g, 'I')

    // Ensure bullet points start with capital letters
    cleaned = cleaned.replace(/^(•|-)\s*([a-z])/gm, (match, bullet, letter) => {
      return bullet + ' ' + letter.toUpperCase()
    })

    return cleaned
  }

  const extractSection = (text: string, section: string): string => {
    // Match **SECTION** followed by content until the next ** section or end
    const pattern = new RegExp(`\\*\\*${section}\\*\\*\\s*\\n([^\\*]+?)(?=\\n\\*\\*|$)`, 'si')
    const match = text.match(pattern)

    if (match && match[1]) {
      let content = match[1].trim()

      // Check if content contains inline bullets (text with - embedded)
      if (content.includes(' - ')) {
        // Format inline bullets as a proper list
        const parts = content.split(' - ')
        if (parts.length > 1) {
          // First part is the intro, rest are bullet points
          const intro = parts[0].trim()
          const bullets = parts.slice(1).map(b => b.trim()).filter(b => b)
          return cleanupText(intro)
        }
      }

      // Otherwise, get the first 2-3 sentences for the summary
      const sentences = content.split(/[.!?]/).filter(s => s.trim())
      const result = sentences.slice(0, 3).join('. ').trim() + (sentences.length > 0 ? '.' : '')
      return cleanupText(result)
    }

    return ''
  }

  const extractBulletPoints = (text: string, section: string): string[] | undefined => {
    // More flexible pattern that handles various section title formats
    const sectionPatterns = [
      new RegExp(`\\*\\*${section}\\*\\*[:\\s]*\\n([^\\*]+?)(?=\\n\\*\\*|$)`, 'si'),
      new RegExp(`\\*\\*${section.replace('&', '\\&')}\\*\\*[:\\s]*\\n([^\\*]+?)(?=\\n\\*\\*|$)`, 'si'),
      new RegExp(`${section}[:\\s]*\\n([^\\*]+?)(?=\\n\\*\\*|$)`, 'si')
    ]

    let sectionContent = ''
    for (const pattern of sectionPatterns) {
      const match = text.match(pattern)
      if (match && match[1]) {
        sectionContent = match[1]
        break
      }
    }

    if (!sectionContent) {
      console.log(`Could not find section: ${section}`)
      return undefined
    }

    const bullets: string[] = []

    // First check if content has inline bullets (text with - embedded)
    if (sectionContent.includes(' - ')) {
      const parts = sectionContent.split(' - ')
      if (parts.length > 1) {
        // Skip the first part (intro text) and extract bullets
        for (let i = 1; i < parts.length; i++) {
          // Extract the bullet text up to the next line break or end
          let bulletText = parts[i].trim()
          // Remove any trailing text that's not part of this bullet
          const lineEnd = bulletText.indexOf('\n')
          if (lineEnd > -1 && i < parts.length - 1) {
            bulletText = bulletText.substring(0, lineEnd).trim()
          }
          // Clean up the bullet text, removing any partial sentence at the end
          bulletText = bulletText.replace(/\s+(Overall|Based on|In summary|However|Additionally).*$/i, '').trim()
          if (bulletText && bulletText.length > 10) {
            bullets.push(cleanupText(bulletText))
          }
        }
      }
    }

    // If no inline bullets found, check for traditional markdown bullets
    if (bullets.length === 0) {
      const lines = sectionContent.split('\n')

      for (const line of lines) {
        const trimmedLine = line.trim()

        // Skip empty lines
        if (!trimmedLine) continue

        // Match lines that start with -, •, *, or numbers
        if (/^[-•*]\s+/.test(trimmedLine)) {
          // Bullet point
          const content = trimmedLine.replace(/^[-•*]\s+/, '').trim()
          if (content) bullets.push(cleanupText(content))
        } else if (/^\d+\.\s+/.test(trimmedLine)) {
          // Numbered item
          const content = trimmedLine.replace(/^\d+\.\s+/, '').trim()
          if (content) bullets.push(cleanupText(content))
        } else if (/^(HIGH|MODERATE|LOW)\s+PRIORITY:/i.test(trimmedLine)) {
          // Priority items from IMMEDIATE ACTION section
          bullets.push(cleanupText(trimmedLine))
        } else if (trimmedLine && bullets.length > 0 && !trimmedLine.includes(':') && !trimmedLine.startsWith('**')) {
          // Continuation of previous bullet (indented or wrapped text)
          bullets[bullets.length - 1] += ' ' + cleanupText(trimmedLine)
        }
      }
    }

    // If no bullets found, but we have content, convert paragraph to bullet points
    if (bullets.length === 0 && sectionContent.trim()) {
      // Split by sentences and create bullet points
      const sentences = sectionContent.trim().split(/[.!?]/).filter(s => s.trim())

      // For sections like STRENGTHS that might say "no strengths found", only include if meaningful
      if (section.includes('STRENGTHS') && sectionContent.toLowerCase().includes('does not')) {
        return undefined
      }

      // Convert first 3-4 meaningful sentences to bullets
      for (const sentence of sentences.slice(0, 4)) {
        const cleaned = sentence.trim()
        if (cleaned && cleaned.length > 10) {
          bullets.push(cleanupText(cleaned))
        }
      }
    }

    console.log(`Extracted ${bullets.length} bullets from ${section}`)
    return bullets.length > 0 ? bullets : undefined
  }

  const toggleChildExpansion = async (childId: string) => {
    if (expandedChild === childId) {
      setExpandedChild(null)
    } else {
      setExpandedChild(childId)
      await loadCheckInHistory(childId)
      await loadAIInsights(childId)
    }
  }

  const getAvatarStyle = (index: number) => {
    return AVATAR_STYLES[index % AVATAR_STYLES.length]
  }

  const getTrendIcon = (trend?: 'improving' | 'developing' | 'stable') => {
    switch (trend) {
      case 'improving':
        return <TrendingUp className="h-4 w-4 text-green-600" />
      case 'developing':
        return <TrendingDown className="h-4 w-4 text-amber-600" />
      default:
        return <Minus className="h-4 w-4 text-gray-400" />
    }
  }

  if (loading) {
    return <PageLoader message="Loading analytics data..." />
  }

  return (
    <div className="max-w-7xl mx-auto p-6">
      {/* Force Tailwind to include avatar colors */}
      {FORCE_TAILWIND_CLASSES}

      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Wellbeing Support Overview</h1>
        <p className="text-gray-600">View each child's wellbeing journey and personalized support insights</p>
      </div>

      {/* Organization Filter and Compare Button */}
      <div className="mb-6 flex items-center justify-between">
        <select
          value={selectedOrg}
          onChange={(e) => setSelectedOrg(e.target.value)}
          className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          {organizations.map(org => (
            <option key={org.id} value={org.id}>{org.name}</option>
          ))}
        </select>

        {children.length >= 2 && !showComparison && (
          <button
            onClick={() => setShowComparison(true)}
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors flex items-center space-x-2"
          >
            <BarChart3 className="h-4 w-4" />
            <span>Compare Children</span>
          </button>
        )}
      </div>

      {/* Comparison View - Appears inline when active */}
      <AnimatePresence>
        {showComparison && (
          <ComparisonView
            children={children}
            moodHistory={moodHistory}
            organizationName={
              selectedOrg === 'all'
                ? 'All Organizations'
                : organizations.find(org => org.id === selectedOrg)?.name
            }
            onClose={() => setShowComparison(false)}
          />
        )}
      </AnimatePresence>

      {/* Critical Support Summary Banner */}
      {(() => {
        const criticalChildren = children.filter(child => (child.averageMood || 5) < 2.5)
        if (criticalChildren.length > 0) {
          return (
            <motion.div
              initial={{ opacity: 0, y: -10 }}
              animate={{ opacity: 1, y: 0 }}
              className="bg-red-50 border-2 border-red-300 rounded-lg p-4 mb-6 flex items-center justify-between"
            >
              <div className="flex items-center space-x-3">
                <div className="relative">
                  <div className="absolute inset-0 bg-red-400 rounded-full animate-ping opacity-75"></div>
                  <AlertTriangle className="relative h-6 w-6 text-red-600" />
                </div>
                <div>
                  <h3 className="text-lg font-bold text-red-900">
                    {criticalChildren.length} {criticalChildren.length === 1 ? 'child requires' : 'children require'} urgent wellbeing support
                  </h3>
                  <p className="text-sm text-red-700">
                    Average mood scores below 2.5 indicate immediate intervention is needed
                  </p>
                </div>
              </div>
              <button
                className="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors font-medium text-sm"
                onClick={() => {
                  // Scroll to first critical child
                  const firstCritical = criticalChildren[0]
                  if (firstCritical && expandedChild !== firstCritical.id) {
                    toggleChildExpansion(firstCritical.id)
                  }
                }}
              >
                Review Now
              </button>
            </motion.div>
          )
        }
        return null
      })()}

      {/* Children List */}
      <div className="space-y-4">
        {children.map((child, index) => {
          const isCritical = (child.averageMood || 5) < 2.5
          const criticalMoodCount = moodHistory[child.id]?.filter(m => m.mood_numeric <= 2).length || 0

          return (
            <motion.div
              key={child.id}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.05 }}
            >
              {/* Show Critical Support Alert for children with average mood < 2.5 */}
              {isCritical && (
                <CriticalSupportAlert
                  childName={child.name}
                  averageMood={child.averageMood || 0}
                  lastCheckIn={child.lastCheckIn || 'Never'}
                  checkInCount={child.checkInCount || 0}
                  criticalCheckIns={criticalMoodCount}
                  onViewDetails={() => toggleChildExpansion(child.id)}
                  onContactSupport={() => {
                    // TODO: Implement contact support functionality
                    alert('Contact support feature coming soon')
                  }}
                  onGenerateReport={() => {
                    // TODO: Implement report generation
                    alert('Report generation feature coming soon')
                  }}
                />
              )}

              <div className={`bg-white rounded-lg shadow-sm overflow-hidden ${
                isCritical ? 'border-2 border-red-400' : 'border border-gray-200'
              }`}
          >
            {/* Child Summary Row */}
            <div
              onClick={() => toggleChildExpansion(child.id)}
              className="p-4 cursor-pointer hover:bg-gray-50 transition-colors"
            >
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-4">
                  {/* Avatar - Always use generated avatars, ignore database URLs */}
                  {(() => {
                    const style = getAvatarStyle(index)
                    const baseClasses = "w-12 h-12 flex items-center justify-center text-white font-semibold shadow-sm"
                    const avatarClassName = `${baseClasses} ${style.bg} ${style.shape}`


                    return (
                      <div className={avatarClassName} data-child-index={index}>
                        <span className="text-sm">
                          {child.initials}
                        </span>
                      </div>
                    )
                  })()}

                  {/* Name and Basic Info */}
                  <div className="flex-1">
                    <div className="flex items-center space-x-2">
                      <h3 className="font-semibold text-gray-900 text-lg">{child.name}</h3>
                      {isCritical && (
                        <span className="px-2 py-0.5 bg-red-100 text-red-700 text-xs font-bold rounded-full uppercase">
                          Urgent Support
                        </span>
                      )}
                    </div>
                    <div className="flex items-center space-x-3 mt-1">
                      <span className="flex items-center text-sm text-gray-600">
                        <Calendar className="h-3 w-3 mr-2" />
                        {child.lastCheckIn}
                      </span>
                      <span className="text-gray-400">•</span>
                      <span className="text-sm font-medium text-gray-600">
                        {child.checkInCount} check-ins
                      </span>
                    </div>
                  </div>
                </div>

                {/* Status Indicators - Inline Design */}
                <div className="flex items-center space-x-2">
                  {/* Current */}
                  <div className="flex items-center space-x-1">
                    <span className="text-xl">
                      {child.recentMood ? MOOD_EMOJIS[child.recentMood as keyof typeof MOOD_EMOJIS] : '—'}
                    </span>
                    <span className="text-sm text-gray-600">Current</span>
                  </div>

                  <span className="text-gray-400">•</span>

                  {/* Average */}
                  <div className="flex items-center space-x-1">
                    <Heart className="h-4 w-4" style={{
                      color: child.averageMood ? MOOD_COLORS[Math.round(child.averageMood) as keyof typeof MOOD_COLORS] : '#9CA3AF',
                      fill: child.averageMood ? MOOD_COLORS[Math.round(child.averageMood) as keyof typeof MOOD_COLORS] : 'none',
                      fillOpacity: 0.15
                    }} />
                    <span className="text-sm font-medium text-gray-700">
                      {child.averageMood ? child.averageMood.toFixed(1) : '—'}
                    </span>
                    <span className="text-sm text-gray-600">Average</span>
                  </div>

                  <span className="text-gray-400">•</span>

                  {/* Trend */}
                  <div className="flex items-center space-x-1">
                    {getTrendIcon(child.moodTrend)}
                    <span className="text-sm text-gray-600">Trend</span>
                  </div>

                  {/* Expand Icon */}
                  <div className="ml-4">
                    {expandedChild === child.id ? (
                      <ChevronDown className="h-5 w-5 text-gray-400" />
                    ) : (
                      <ChevronRight className="h-5 w-5 text-gray-400" />
                    )}
                  </div>
                </div>
              </div>
            </div>

            {/* Expanded Content */}
            <AnimatePresence>
              {expandedChild === child.id && (
                <motion.div
                  initial={{ height: 0, opacity: 0 }}
                  animate={{ height: 'auto', opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }}
                  transition={{ duration: 0.3 }}
                  className="border-t border-gray-200"
                >
                  <div className="p-6 bg-gray-50">
                    <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                      {/* Check-in History Column */}
                      <div className="space-y-6">
                        {/* Mood Meter Heatmap */}
                        <div>
                          <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                            <Activity className="h-4 w-4 mr-2" />
                            Mood Meter Calendar (Jan - Apr 2025)
                          </h4>

                          <div className="bg-white p-4 rounded-lg border border-gray-200">
                            {moodHistory[child.id] && moodHistory[child.id].length > 0 ? (
                              <MoodHeatmap
                                moodData={moodHistory[child.id]}
                                MOOD_EMOJIS={MOOD_EMOJIS}
                              />
                            ) : (
                              <p className="text-sm text-gray-500">No mood data available</p>
                            )}
                          </div>
                        </div>

                        {/* Qualitative Check-ins */}
                        <div>
                          <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                            <Calendar className="h-4 w-4 mr-2" />
                            Latest Check-ins
                          </h4>

                          <div className="space-y-3 max-h-64 overflow-y-auto">
                            {(() => {
                              const filteredCheckIns = checkInHistory[child.id]?.filter(
                                checkIn => checkIn.notes && checkIn.notes !== 'No notes available'
                              ) || []

                              return filteredCheckIns.length > 0 ? (
                                filteredCheckIns.slice(0, 5).map(checkIn => (
                                <div key={checkIn.id} className="bg-white p-3 rounded-lg border border-gray-200">
                                  <div className="flex items-start">
                                    <div className="flex-1">
                                      <div className="flex items-center space-x-2 mb-1">
                                        <Clock className="h-3 w-3 text-gray-400" />
                                        <span className="text-xs text-gray-600">
                                          {new Date(checkIn.created_at).toLocaleDateString('en-US', {
                                            month: 'short',
                                            day: 'numeric',
                                            year: 'numeric',
                                            hour: '2-digit',
                                            minute: '2-digit'
                                          })}
                                        </span>
                                      </div>

                                      {checkIn.mood_level && (
                                        <div className="flex items-center space-x-2 mb-2">
                                          <span className="text-sm font-medium text-gray-600">Mood:</span>
                                          <span className="px-2 py-1 text-xs rounded-full" style={{
                                            backgroundColor: MOOD_COLORS[checkIn.mood_numeric || 3] + '20',
                                            color: MOOD_COLORS[checkIn.mood_numeric || 3]
                                          }}>
                                            {MOOD_EMOJIS[checkIn.mood_numeric || 3]} {checkIn.mood_level}
                                          </span>
                                        </div>
                                      )}

                                      {checkIn.feelings && checkIn.feelings.length > 0 && (
                                        <div className="flex flex-wrap gap-1 mb-2">
                                          {checkIn.feelings.map((feeling, idx) => (
                                            <span key={idx} className="px-2 py-1 bg-blue-100 text-blue-700 text-xs rounded-full">
                                              {feeling}
                                            </span>
                                          ))}
                                        </div>
                                      )}

                                      {checkIn.notes && checkIn.notes !== 'No notes available' && (
                                        <p className="text-sm text-gray-700 italic">
                                          "{checkIn.notes}"
                                        </p>
                                      )}
                                    </div>
                                  </div>
                                </div>
                              ))
                            ) : (
                              <p className="text-sm text-gray-500">No check-ins with notes available</p>
                            )
                            })()}
                          </div>
                        </div>
                      </div>

                      {/* AI Insights */}
                      <div>
                        <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                          <Sparkles className="h-4 w-4 mr-2" />
                          Support Insights
                        </h4>

                        <div className="relative min-h-[300px] overflow-hidden">
                          {/* Show loader if loading, otherwise show content */}
                          {loadingInsights[child.id] ? (
                            <div className="absolute inset-0 flex items-center justify-center bg-white/90 backdrop-blur-sm rounded-lg">
                              <LottieLoader
                                loading={true}
                                size="small"
                                message="Analyzing wellbeing patterns..."
                              />
                            </div>
                          ) : (
                          <div className="space-y-4">
                            {/* Summary */}
                            {aiInsights[child.id] && (
                            <div className="bg-white p-4 rounded-lg border border-gray-200">
                              <h5 className="font-medium text-gray-900 mb-2 flex items-center">
                                <Brain className="h-4 w-4 mr-2" />
                                Wellbeing Overview
                              </h5>
                              {(() => {
                                const summary = aiInsights[child.id].summary
                                // Check if summary contains inline bullets (with various formats)
                                if (summary.includes(' - ') || summary.includes('- ') || summary.match(/^-\s+/m)) {
                                  let bullets: string[] = []
                                  let intro = ''

                                  // Handle different bullet formats
                                  if (summary.includes('- ')) {
                                    // Split on "- " pattern (hyphen with space after)
                                    const firstBullet = summary.indexOf('- ')
                                    if (firstBullet > 0) {
                                      intro = summary.substring(0, firstBullet).trim()
                                      const bulletText = summary.substring(firstBullet)
                                      // Split by "- " but keep the content
                                      bullets = bulletText.split(/\s*-\s+/)
                                        .filter(b => b.trim())
                                        .map(b => cleanupText(b.trim()))
                                    } else {
                                      // Bullets start at beginning
                                      bullets = summary.split(/\s*-\s+/)
                                        .filter(b => b.trim())
                                        .map(b => cleanupText(b.trim()))
                                    }
                                  } else if (summary.includes(' - ')) {
                                    // Original format with space-hyphen-space
                                    const parts = summary.split(' - ')
                                    intro = parts[0].trim()
                                    bullets = parts.slice(1).map(b => cleanupText(b.trim()))
                                  }

                                  // Clean up bullets
                                  bullets = bullets.map(b => {
                                    // Remove any text after "Overall" or similar concluding words
                                    let bulletText = b.replace(/\s+(Overall|Based on|In summary|However|Additionally|Which).*$/i, '').trim()
                                    // Remove trailing punctuation if it's incomplete
                                    bulletText = bulletText.replace(/[,;]$/, '')
                                    // Ensure bullet ends with period if it doesn't have one
                                    if (bulletText && !bulletText.match(/[.!?]$/)) {
                                      bulletText += '.'
                                    }
                                    return bulletText
                                  }).filter(b => b && b.length > 10)

                                  return (
                                    <div className="space-y-2">
                                      {intro && <p className="text-sm text-gray-700">{intro}:</p>}
                                      {bullets.length > 0 && (
                                        <ul className="space-y-1 ml-2">
                                          {bullets.map((bullet, idx) => (
                                            <li key={idx} className="text-sm text-gray-700 flex items-start">
                                              <span className="mr-2 text-gray-400">•</span>
                                              <span>{bullet}</span>
                                            </li>
                                          ))}
                                        </ul>
                                      )}
                                    </div>
                                  )
                                }
                                // If no inline bullets, display as regular paragraph
                                return <p className="text-sm text-gray-700">{summary}</p>
                              })()}
                            </div>
                            )}

                            {/* Concerns */}
                            {aiInsights[child.id] && aiInsights[child.id].concerns && aiInsights[child.id].concerns!.length > 0 && (
                              <div className="bg-amber-50 p-4 rounded-lg border border-amber-200">
                                <h5 className="font-medium text-amber-900 mb-2 flex items-center">
                                  <AlertCircle className="h-4 w-4 mr-2" />
                                  Areas for Additional Support
                                </h5>
                                <ul className="space-y-1">
                                  {aiInsights[child.id].concerns!.map((concern, idx) => (
                                    <li key={idx} className="text-sm text-amber-800 flex items-start">
                                      <span className="mr-2">•</span>
                                      <span>{concern}</span>
                                    </li>
                                  ))}
                                </ul>
                              </div>
                            )}

                            {/* Strengths */}
                            {aiInsights[child.id] && aiInsights[child.id].strengths && aiInsights[child.id].strengths!.length > 0 && (
                              <div className="bg-green-50 p-4 rounded-lg border border-green-200">
                                <h5 className="font-medium text-green-900 mb-2 flex items-center">
                                  <Activity className="h-4 w-4 mr-2" />
                                  Positive Indicators
                                </h5>
                                <ul className="space-y-1">
                                  {aiInsights[child.id].strengths!.map((strength, idx) => (
                                    <li key={idx} className="text-sm text-green-800 flex items-start">
                                      <span className="mr-2">•</span>
                                      <span>{strength}</span>
                                    </li>
                                  ))}
                                </ul>
                              </div>
                            )}

                            {/* Recommendations */}
                            {aiInsights[child.id] && aiInsights[child.id].recommendations && aiInsights[child.id].recommendations!.length > 0 && (
                              <div className="bg-blue-50 p-4 rounded-lg border border-blue-200">
                                <h5 className="font-medium text-blue-900 mb-2 flex items-center">
                                  <MessageSquare className="h-4 w-4 mr-2" />
                                  Recommendations
                                </h5>
                                <ul className="space-y-1">
                                  {aiInsights[child.id].recommendations!.map((rec, idx) => (
                                    <li key={idx} className="text-sm text-blue-800 flex items-start">
                                      <span className="mr-2">•</span>
                                      <span>{rec}</span>
                                    </li>
                                  ))}
                                </ul>
                              </div>
                            )}

                            {aiInsights[child.id] && (
                            <p className="text-xs text-gray-500 text-right">
                              Last analyzed: {aiInsights[child.id].lastAnalyzed}
                            </p>
                            )}
                          </div>
                          )}
                        </div>
                      </div>
                    </div>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
              </div>
            </motion.div>
          )
        })}
      </div>

      {children.length === 0 && (
        <div className="text-center py-12">
          <User className="h-12 w-12 text-gray-300 mx-auto mb-4" />
          <p className="text-gray-500">No children found in this organization</p>
        </div>
      )}
    </div>
  )
}