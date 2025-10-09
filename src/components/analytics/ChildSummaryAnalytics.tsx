import React, { useState, useEffect } from 'react'
import { MoodHeatmap } from './MoodHeatmap'
import { motion, AnimatePresence } from 'framer-motion'
import { getSupabaseClient } from '../../utils/supabase/client.tsx'
import { projectId, publicAnonKey } from '../../utils/supabase/info.tsx'
import { PageAnimatedLoader } from '../shared/AnimatedLoader'
import { ComparisonView } from './comparison/ComparisonView'
import { WellbeingTreemap } from './WellbeingTreemap'
import { SafeguardingModal } from './SafeguardingModal'
import { WellbeingWheelHeatmap } from './WellbeingWheelHeatmap'
import { WellbeingTooltip } from './WellbeingTooltip'
import {
  ChevronDown, ChevronRight, TrendingUp, TrendingDown,
  Calendar, Heart, Brain, MessageSquare, Sparkles,
  User, Activity, AlertCircle, Clock, Minus, BarChart3,
  Users, Briefcase, HeartPulse, Home, Laugh, Shield
} from 'lucide-react'

const supabase = getSupabaseClient()

// Wellbeing category definitions with colors and icons
const WELLBEING_CATEGORIES = {
  my_friends: { label: 'Friends', color: '#3B82F6', icon: Users, emoji: '👥' },
  my_work: { label: 'Work/School', color: '#8B5CF6', icon: Briefcase, emoji: '📚' },
  my_health: { label: 'Health', color: '#EF4444', icon: HeartPulse, emoji: '❤️' },
  my_family: { label: 'Family', color: '#F59E0B', icon: Home, emoji: '🏠' },
  my_fun_play: { label: 'Fun & Play', color: '#10B981', icon: Laugh, emoji: '🎨' },
  my_safety: { label: 'Safety', color: '#6366F1', icon: Shield, emoji: '🛡️' },
  my_emotions: { label: 'Emotions', color: '#EC4899', icon: Brain, emoji: '💭' }
}

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
  latestNote?: string
}

interface CheckIn {
  id: string
  created_at: string
  mood_numeric?: number
  mood_level?: string
  notes?: string
  feelings?: string[]
  explanation?: string
  wellbeing_score?: number
  wellbeing_sections?: {
    section_name: string
    mood_numeric: number
    text_response: string
  }[]
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

// Format mood labels to be human-readable
function formatMoodLabel(label: string | undefined): string {
  if (!label) return ''
  // Replace underscores with spaces and capitalize each word
  return label
    .split('_')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
    .join(' ')
}

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
  const [aiLoadingProgress, setAILoadingProgress] = useState<Record<string, number>>({})
  const [selectedCheckInIds, setSelectedCheckInIds] = useState<Record<string, string>>({})
  // Removed aiAnalysisProgress to prevent excessive re-renders
  const [loadingStages, setLoadingStages] = useState<Array<{ name: string; status: 'pending' | 'loading' | 'complete' | 'error' }>>([
    { name: 'Loading organizations', status: 'loading' },
    { name: 'Loading children profiles', status: 'pending' },
    { name: 'Loading check-in data', status: 'pending' },
    { name: 'Loading mood history', status: 'pending' },
    { name: 'Loading wellbeing wheel data', status: 'pending' },
    { name: 'Preparing analytics', status: 'pending' }
  ])
  const [wellbeingWheelData, setWellbeingWheelData] = useState<Record<string, any[]>>({})
  const [currentLoadingStage, setCurrentLoadingStage] = useState(0)
  const [showComparison, setShowComparison] = useState(false)
  const [safeguardingModal, setSafeguardingModal] = useState<{ isOpen: boolean; childId: string | null }>({
    isOpen: false,
    childId: null
  })
  const [acknowledgedSafeguarding, setAcknowledgedSafeguarding] = useState<Set<string>>(new Set())

  useEffect(() => {
    loadOrganizations()
  }, [])

  useEffect(() => {
    if (selectedOrg) {
      loadChildren()
    }
  }, [selectedOrg])

  // Auto-select most recent check-in when checkInHistory updates
  useEffect(() => {
    if (expandedChild && checkInHistory[expandedChild]) {
      const checkIns = checkInHistory[expandedChild]
      if (checkIns.length > 0 && !selectedCheckInIds[expandedChild]) {
        const mostRecent = checkIns[0]
        setSelectedCheckInIds(prev => ({
          ...prev,
          [expandedChild]: mostRecent.id
        }))
      }
    }
  }, [checkInHistory, expandedChild])

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
        // Keep selectedOrg as 'all' by default - don't auto-select first org
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

      // Only filter by org if it's not the default fallback or parent view
      if (selectedOrg !== 'all' && selectedOrg !== 'default' && selectedOrg !== 'parent') {
        childQuery = childQuery.eq('org_id', selectedOrg)
      }

      let { data: childProfiles } = await childQuery

      if (!childProfiles) {
        setChildren([])
        return
      }

      // If parent view is selected, randomly select 2 children
      if (selectedOrg === 'parent' && childProfiles.length > 2) {
        // Shuffle and take first 2
        const shuffled = [...childProfiles].sort(() => Math.random() - 0.5)
        childProfiles = shuffled.slice(0, 2)
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
        // Only calculate trend if we have enough data (at least 10 check-ins)
        if (childMoods.length >= 10) {
          if (recentAvg > olderAvg + 0.3) trend = 'improving'
          else if (recentAvg < olderAvg - 0.3) trend = 'developing'
        }

        // Debug logging for Jayden
        if (child.name === 'Jayden Martinez') {
          console.log('Jayden Martinez complete data:', {
            totalCheckIns: childMoods.length,
            recentMoodsCount: recentMoods.length,
            olderMoodsCount: olderMoods.length,
            recentAvg,
            olderAvg,
            difference: recentAvg - olderAvg,
            trend,
            recentMoodValues: recentMoods.map(m => m.mood_numeric),
            olderMoodValues: olderMoods.map(m => m.mood_numeric)
          })
        }

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
          checkInCount: childMoods.length,
          latestNote: childMoods[0]?.explanation_text || childMoods[0]?.notes
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

      // Load check-in history for all children (for Priority Support Card)
      await loadAllCheckInHistory(childIds)

      // Update loading stage - loading wellbeing wheel data
      setCurrentLoadingStage(5)
      setLoadingStages(prev => prev.map((s, i) => ({
        ...s,
        status: i <= 4 ? 'complete' : i === 5 ? 'loading' : 'pending'
      })))

      // Load all wellbeing wheel data for Over Time tab
      await loadAllWellbeingWheelData(childIds)

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

  const loadAllCheckInHistory = async (childIds: string[]) => {
    console.log(`Loading check-in history for ${childIds.length} children...`)

    try {
      // Fetch wellbeing wheel check-ins for all children
      const { data: wellbeingWheelData } = await supabase
        .from('wellbeing_wheel_usage')
        .select('id, child_id, session_id, completed_at, overall_score, started_at')
        .in('child_id', childIds)
        .order('completed_at', { ascending: false })

      // Group data by child
      const checkInsByChild: Record<string, CheckIn[]> = {}

      // Process each child
      for (const childId of childIds) {
        const childWellbeingData = wellbeingWheelData?.filter(w => w.child_id === childId).slice(0, 10) || []
        const childCheckIns: CheckIn[] = []

        // For each wellbeing wheel check-in, fetch sections
        for (const wheel of childWellbeingData) {
          const { data: sections } = await supabase
            .from('wellbeing_wheel_sections')
            .select('section_name, mood_numeric, text_response')
            .eq('wellbeing_wheel_id', wheel.id)
            .order('created_at', { ascending: true })

          if (sections && sections.length > 0) {
            childCheckIns.push({
              id: wheel.id,
              created_at: wheel.completed_at,
              mood_numeric: wheel.overall_score,
              mood_level: wheel.overall_score <= 1.5 ? 'Very Sad' : wheel.overall_score <= 2.5 ? 'Sad' : wheel.overall_score <= 3.5 ? 'OK' : 'Happy',
              notes: `Wellbeing Score: ${wheel.overall_score.toFixed(1)}`,
              wellbeing_score: wheel.overall_score,
              wellbeing_sections: sections
            })
          }
        }

        checkInsByChild[childId] = childCheckIns
      }

      setCheckInHistory(checkInsByChild)
      console.log('Check-in history loaded for all children:', Object.keys(checkInsByChild).length, 'children')
      console.log('Sample check-in data:', checkInsByChild[childIds[0]]?.slice(0, 2))
    } catch (error) {
      console.error('Error loading check-in history:', error)
    }
  }

  const loadAllWellbeingWheelData = async (childIds: string[]) => {
    console.log(`Loading wellbeing wheel data for Over Time tab (${childIds.length} children)...`)

    try {
      // Fetch ALL wellbeing wheel check-ins for Jan-Mar 2025 period
      const { data: wellbeingWheelData, error } = await supabase
        .from('wellbeing_wheel_usage')
        .select('id, child_id, completed_at, overall_score')
        .in('child_id', childIds)
        .gte('completed_at', '2025-01-01')
        .lte('completed_at', '2025-03-31')
        .order('completed_at', { ascending: true })

      if (error) {
        console.error('Error loading wellbeing wheel data:', error)
        return
      }

      if (!wellbeingWheelData) {
        console.log('No wellbeing wheel data found')
        return
      }

      console.log(`Loaded ${wellbeingWheelData.length} wellbeing wheel check-ins`)

      // Fetch all sections in one batch query
      const wheelIds = wellbeingWheelData.map(w => w.id)
      const { data: allSections } = await supabase
        .from('wellbeing_wheel_sections')
        .select('wellbeing_wheel_id, section_name, mood_numeric, text_response')
        .in('wellbeing_wheel_id', wheelIds)

      console.log(`Loaded ${allSections?.length || 0} wellbeing sections`)

      // Group sections by wellbeing_wheel_id for fast lookup
      const sectionsByWheelId: Record<string, any[]> = {}
      allSections?.forEach(section => {
        if (!sectionsByWheelId[section.wellbeing_wheel_id]) {
          sectionsByWheelId[section.wellbeing_wheel_id] = []
        }
        sectionsByWheelId[section.wellbeing_wheel_id].push(section)
      })

      // Group by child
      const dataByChild: Record<string, any[]> = {}
      childIds.forEach(childId => {
        const childWheels = wellbeingWheelData.filter(w => w.child_id === childId)
        dataByChild[childId] = childWheels.map(wheel => ({
          ...wheel,
          sections: sectionsByWheelId[wheel.id] || []
        }))
      })

      setWellbeingWheelData(dataByChild)
      console.log('Wellbeing wheel data loaded for all children:', Object.keys(dataByChild).length, 'children')
    } catch (error) {
      console.error('Error loading wellbeing wheel data:', error)
    }
  }

  const loadCheckInHistory = async (childId: string) => {
    // Check if already loaded with detailed data (check for mood_level which is only in detailed load)
    const existingData = checkInHistory[childId]
    if (existingData && existingData[0]?.mood_level) {
      console.log(`Check-in history already loaded for child: ${childId}`)
      return
    }

    console.log(`Loading detailed check-in history for child: ${childId}`)

    const supabase = getSupabaseClient()

    // Fetch wellbeing wheel check-ins directly (they're more comprehensive than mood meter)
    const { data: wellbeingWheelData, error: wellbeingError } = await supabase
      .from('wellbeing_wheel_usage')
      .select('id, child_id, session_id, completed_at, overall_score, started_at')
      .eq('child_id', childId)
      .order('completed_at', { ascending: false })
      .limit(10)

    if (wellbeingError) {
      console.error('Error loading wellbeing wheel data:', wellbeingError)
      return
    }

    // Also get mood meter data for backwards compatibility and heatmap
    const { data: moodData, error: moodError } = await supabase
      .from('mood_meter_usage')
      .select('*')
      .eq('child_id', childId)
      .order('selected_at', { ascending: false })
      .limit(30)

    // For each wellbeing wheel check-in, fetch the detailed sections
    const checkIns: CheckIn[] = []

    if (wellbeingWheelData) {
      for (const wheel of wellbeingWheelData) {
        // Fetch sections for this wellbeing wheel check-in
        const { data: sections, error: sectionsError } = await supabase
          .from('wellbeing_wheel_sections')
          .select('section_name, mood_numeric, text_response')
          .eq('wellbeing_wheel_id', wheel.id)
          .order('created_at', { ascending: true })

        if (!sectionsError && sections && sections.length > 0) {
          // Check if there are any meaningful text responses
          const hasNotes = sections.some(s => s.text_response && s.text_response.trim() !== '')

          if (hasNotes) {
            checkIns.push({
              id: wheel.id,
              created_at: wheel.completed_at,
              mood_numeric: wheel.overall_score,
              mood_level: wheel.overall_score <= 1.5 ? 'Very Sad' : wheel.overall_score <= 2.5 ? 'Sad' : wheel.overall_score <= 3.5 ? 'OK' : 'Happy',
              notes: `Wellbeing Score: ${wheel.overall_score.toFixed(1)}`,
              wellbeing_score: wheel.overall_score,
              wellbeing_sections: sections
            })
          }
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

    console.log('🔵 STARTING AI insights loading for child:', childId)
    setLoadingInsights(prev => {
      console.log('🔵 Setting loadingInsights to TRUE for child:', childId)
      return { ...prev, [childId]: true }
    })
    setAILoadingProgress(prev => ({ ...prev, [childId]: 0 }))

    // Simulate progress updates
    const progressInterval = setInterval(() => {
      setAILoadingProgress(prev => {
        const currentProgress = prev[childId] || 0
        if (currentProgress >= 90) {
          clearInterval(progressInterval)
          return prev
        }
        return { ...prev, [childId]: currentProgress + 10 }
      })
    }, 300)

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

        // AI analysis complete

        setAIInsights(prev => ({
          ...prev,
          [childId]: insights
        }))
      }
    } catch (error) {
      console.error('Error loading AI insights:', error)
      // Error handling
    } finally {
      // Set progress to 100% before hiding
      setAILoadingProgress(prev => ({ ...prev, [childId]: 100 }))

      setTimeout(() => {
        console.log('🔵 Setting loadingInsights to FALSE for child:', childId)
        setLoadingInsights(prev => ({ ...prev, [childId]: false }))
        setAILoadingProgress(prev => ({ ...prev, [childId]: 0 }))
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

      // Check if content has markdown bullets (lines starting with -)
      const lines = content.split('\n')
      const bulletLines = lines.filter(line => line.trim().startsWith('-'))

      if (bulletLines.length > 0) {
        // Join all bullet points with line breaks to preserve the full summary
        const bullets = bulletLines.map(line =>
          line.trim().replace(/^-\s*/, '').trim()
        ).filter(b => b)

        // Return all bullets joined as the summary
        return cleanupText(bullets.join('\n'))
      }

      // Check if content contains inline bullets (text with - embedded)
      if (content.includes(' - ')) {
        // Format inline bullets as a proper list
        const parts = content.split(' - ')
        if (parts.length > 1) {
          // Join all parts for the summary
          return cleanupText(content)
        }
      }

      // Return the full content for the summary
      return cleanupText(content)
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
      // Check if child needs safeguarding check
      const child = children.find(c => c.id === childId)
      const needsSafeguarding = child && child.averageMood && child.averageMood < 2.5

      if (needsSafeguarding && !acknowledgedSafeguarding.has(childId)) {
        // Show safeguarding modal first
        setSafeguardingModal({ isOpen: true, childId })
      } else {
        // Proceed normally
        setExpandedChild(childId)
        await loadCheckInHistory(childId)
        await loadAIInsights(childId)
      }
    }
  }

  const handleSafeguardingAction = async (childId: string, action: string, notes?: string) => {
    console.log('Safeguarding action taken:', { childId, action, notes })

    // TODO: Log to database
    // await supabase.from('safeguarding_actions').insert({
    //   child_id: childId,
    //   practitioner_id: user.id,
    //   action_taken: action,
    //   notes: notes,
    //   triggered_at: new Date().toISOString()
    // })

    // Mark as acknowledged for this session
    setAcknowledgedSafeguarding(prev => new Set(prev).add(childId))

    // Close modal and expand child card
    setSafeguardingModal({ isOpen: false, childId: null })
    setExpandedChild(childId)
    await loadCheckInHistory(childId)
    await loadAIInsights(childId)
  }

  const getAvatarStyle = (childId: string) => {
    // Use child ID hash to consistently assign colors across filters
    const hash = childId.split('').reduce((acc, char) => acc + char.charCodeAt(0), 0)
    return AVATAR_STYLES[hash % AVATAR_STYLES.length]
  }

  const getTrendIcon = (trend?: 'improving' | 'developing' | 'stable', childName?: string) => {
    // Debug logging
    if (childName === 'Jayden Martinez') {
      console.log('getTrendIcon called for Jayden:', { trend, childName })
      console.log('Returning Minus icon for stable trend')
    }

    switch (trend) {
      case 'improving':
        return <TrendingUp className="h-4 w-4 text-green-600" />
      case 'developing':
        return <TrendingDown className="h-4 w-4 text-amber-600" />
      case 'stable':
        return <Minus className="h-4 w-4 text-gray-600" strokeWidth={2} />
      default:
        return <Minus className="h-4 w-4 text-gray-600" strokeWidth={2} />
    }
  }

  if (loading) {
    // Calculate progress based on completed loading stages
    const totalStages = loadingStages.length
    const completedStages = loadingStages.filter(s => s.status === 'complete').length
    const loadingStage = loadingStages.find(s => s.status === 'loading')

    // Give partial credit for the currently loading stage
    const progress = ((completedStages + (loadingStage ? 0.5 : 0)) / totalStages) * 100

    return <PageAnimatedLoader message="Loading analytics data..." progress={progress} />
  }

  return (
    <div className="max-w-7xl mx-auto p-6">
      {/* Force Tailwind to include avatar colors */}
      {FORCE_TAILWIND_CLASSES}

      {/* Safeguarding Modal */}
      {safeguardingModal.isOpen && safeguardingModal.childId && (() => {
        const child = children.find(c => c.id === safeguardingModal.childId)
        if (!child) return null

        // Get recent moods from mood history
        const recentMoods = moodHistory[child.id]?.slice(0, 5).map(m => m.mood_numeric) || []

        // Get concerning notes from check-in history
        const concerningNotes = checkInHistory[child.id]
          ?.filter(c => c.notes && c.notes !== 'No notes available')
          .slice(0, 3)
          .map(c => c.notes || '') || []

        return (
          <SafeguardingModal
            isOpen={true}
            onClose={() => setSafeguardingModal({ isOpen: false, childId: null })}
            child={{
              id: child.id,
              name: child.name,
              averageMood: child.averageMood || 0,
              recentMoods,
              concerningNotes
            }}
            onActionTaken={(action, notes) => handleSafeguardingAction(child.id, action, notes)}
          />
        )
      })()}

      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Wellbeing Support Overview</h1>
        <p className="text-gray-600">View each child's wellbeing journey and personalized support insights</p>
      </div>

      {/* Organization Filter and Compare Button */}
      <div className="mb-6 flex items-center justify-between">
        <div className="flex items-center space-x-4">
          <select
            value={selectedOrg}
            onChange={(e) => setSelectedOrg(e.target.value)}
            className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="all">All Children</option>
            <option value="parent">Parent View (2 Children)</option>
            {organizations.map(org => (
              <option key={org.id} value={org.id}>{org.name}</option>
            ))}
          </select>

          {/* Organization Logo */}
          {selectedOrg !== 'all' && selectedOrg !== 'parent' && (() => {
            const currentOrg = organizations.find(org => org.id === selectedOrg)
            let logoPath = ''

            if (currentOrg) {
              // Map organization names to logo files
              if (currentOrg.name === 'The Rainbow School') {
                logoPath = '/trs.png'
              } else if (currentOrg.name === 'The Soke') {
                logoPath = '/the_soke.webp'
              } else if (currentOrg.name === 'Evelina Hospital') {
                logoPath = '/evelina.png'
              }
            }

            if (logoPath) {
              return (
                <img
                  src={logoPath}
                  alt={`${currentOrg?.name} logo`}
                  className="h-12 w-auto object-contain"
                  style={{
                    maxHeight: '48px',
                    minHeight: '48px',
                    width: 'auto'
                  }}
                  onError={(e) => {
                    console.error(`Failed to load logo: ${logoPath}`)
                    e.currentTarget.style.display = 'none'
                  }}
                />
              )
            }
            return null
          })()}
        </div>

        {children.length >= 2 && !showComparison && selectedOrg !== 'parent' && (
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
            wellbeingData={checkInHistory}
            organizationName={
              selectedOrg === 'all'
                ? 'All Organizations'
                : organizations.find(org => org.id === selectedOrg)?.name
            }
            onClose={() => setShowComparison(false)}
          />
        )}
      </AnimatePresence>

      {/* Wellbeing Treemap - Visual overview of wellbeing */}
      <WellbeingTreemap
        children={children}
        checkInHistory={checkInHistory}
        onChildClick={toggleChildExpansion}
        selectedChildId={expandedChild}
        moodHistory={moodHistory}
        preloadedWellbeingData={wellbeingWheelData}
      />

      {/* Children List - Selected child first if any, then rest */}
      <div className="space-y-4">
        {(() => {
          const selectedChild = expandedChild ? children.find(c => c.id === expandedChild) : null
          const otherChildren = children.filter(c => c.id !== expandedChild)
          const orderedChildren = selectedChild ? [selectedChild, ...otherChildren] : children

          return orderedChildren.map((child, index) => {
          const isCritical = (child.averageMood || 5) < 2.5
          const criticalMoodCount = moodHistory[child.id]?.filter(m => m.mood_numeric <= 2).length || 0

          return (
            <motion.div
              key={child.id}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.05 }}
            >
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
                    const style = getAvatarStyle(child.id)
                    const baseClasses = "w-12 h-12 flex items-center justify-center text-white font-semibold shadow-sm"

                    // Debug logging
                    console.log(`Avatar for ${child.name}:`, {
                      childId: child.id,
                      bgClass: style.bg,
                      shape: style.shape,
                      fullClassName: `${baseClasses} ${style.bg} ${style.shape}`
                    })

                    // Use inline styles like the mood heatmap fix
                    const bgColorMap: Record<string, string> = {
                      'bg-blue-500': '#3b82f6',
                      'bg-green-500': '#22c55e',
                      'bg-purple-500': '#a855f7',
                      'bg-orange-500': '#f97316',
                      'bg-pink-500': '#ec4899',
                      'bg-teal-500': '#14b8a6',
                      'bg-red-500': '#ef4444',
                      'bg-indigo-500': '#6366f1',
                      'bg-yellow-500': '#eab308',
                      'bg-cyan-500': '#06b6d4',
                      'bg-emerald-500': '#10b981',
                      'bg-rose-500': '#f43f5e',
                      'bg-violet-500': '#8b5cf6',
                      'bg-amber-500': '#f59e0b',
                      'bg-sky-500': '#0ea5e9',
                      'bg-lime-500': '#84cc16',
                      'bg-fuchsia-500': '#d946ef',
                      'bg-slate-500': '#64748b'
                    }

                    const backgroundColor = bgColorMap[style.bg] || '#6b7280'

                    console.log(`  -> Mapped to color: ${backgroundColor}`)

                    return (
                      <div
                        className={`${baseClasses} ${style.shape}`}
                        style={{ backgroundColor }}
                        data-child-id={child.id}
                        data-bg-class={style.bg}
                      >
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
                    {getTrendIcon(child.moodTrend, child.name)}
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
                        {/* Wellbeing Wheel Category Heatmap */}
                        <div>
                          <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                            <Activity className="h-4 w-4 mr-2" />
                            Wellbeing Categories Over Time
                          </h4>

                          <div className="bg-white p-4 rounded-lg border border-gray-200">
                            {checkInHistory[child.id] && checkInHistory[child.id].length > 0 ? (
                              <WellbeingWheelHeatmap
                                checkIns={checkInHistory[child.id]}
                                selectedCheckInId={selectedCheckInIds[child.id]}
                                onCheckInSelect={(checkInId) => {
                                  setSelectedCheckInIds(prev => ({
                                    ...prev,
                                    [child.id]: checkInId
                                  }))
                                }}
                              />
                            ) : (
                              <p className="text-sm text-gray-500">No wellbeing wheel data available</p>
                            )}
                          </div>
                        </div>

                        {/* Check-in Details */}
                        <div>
                          <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                            <Calendar className="h-4 w-4 mr-2" />
                            Check-in Details
                          </h4>

                          <div className="min-h-[300px]">
                            {(() => {
                              const selectedCheckInId = selectedCheckInIds[child.id]
                              const filteredCheckIns = checkInHistory[child.id]?.filter(
                                checkIn => checkIn.notes && checkIn.notes !== 'No notes available'
                              ) || []

                              // Show selected check-in if available, otherwise show instruction
                              const checkInsToShow = selectedCheckInId
                                ? filteredCheckIns.filter(c => c.id === selectedCheckInId)
                                : []

                              if (checkInsToShow.length === 0 && !selectedCheckInId) {
                                return (
                                  <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 text-center min-h-[300px] flex items-center justify-center">
                                    <p className="text-sm text-blue-700">
                                      Click on a check-in date in the calendar above to view details
                                    </p>
                                  </div>
                                )
                              }

                              if (checkInsToShow.length === 0 && selectedCheckInId) {
                                return (
                                  <div className="min-h-[300px] flex items-center justify-center">
                                    <p className="text-sm text-gray-500">Selected check-in not found</p>
                                  </div>
                                )
                              }

                              return checkInsToShow.map(checkIn => {
                                const CategoryIcon = (props: { section: string }) => {
                                  const category = WELLBEING_CATEGORIES[props.section as keyof typeof WELLBEING_CATEGORIES]
                                  const Icon = category?.icon
                                  return Icon ? <Icon className="h-4 w-4" /> : null
                                }

                                return (
                                  <div key={checkIn.id} className="bg-white p-4 rounded-lg border border-gray-200 space-y-4">
                                    {/* Date */}
                                    <div className="flex items-center space-x-2 text-gray-500">
                                      <Clock className="h-4 w-4" />
                                      <span className="text-sm">
                                        {new Date(checkIn.created_at).toLocaleDateString('en-US', {
                                          weekday: 'long',
                                          month: 'long',
                                          day: 'numeric',
                                          year: 'numeric',
                                          hour: '2-digit',
                                          minute: '2-digit'
                                        })}
                                      </span>
                                    </div>

                                    {/* Overall Mood Bar */}
                                    {checkIn.wellbeing_score && (
                                      <div>
                                        <div className="flex items-center justify-between mb-2">
                                          <span className="text-sm font-semibold text-gray-700">Overall Wellbeing</span>
                                          <span className="text-sm font-bold text-gray-900">{checkIn.wellbeing_score.toFixed(1)}/4</span>
                                        </div>
                                        <div className="w-full h-3 bg-gray-200 rounded-full overflow-hidden">
                                          <div
                                            className="h-full rounded-full transition-all"
                                            style={{
                                              width: `${(checkIn.wellbeing_score / 4) * 100}%`,
                                              backgroundColor: MOOD_COLORS[Math.round(checkIn.wellbeing_score) as keyof typeof MOOD_COLORS]
                                            }}
                                          />
                                        </div>
                                      </div>
                                    )}

                                    {/* Wellbeing Categories */}
                                    {checkIn.wellbeing_sections && checkIn.wellbeing_sections.length > 0 && (
                                      <div className="space-y-3">
                                        {checkIn.wellbeing_sections.map((section, idx) => {
                                          const category = WELLBEING_CATEGORIES[section.section_name as keyof typeof WELLBEING_CATEGORIES]
                                          if (!category) return null

                                          const categoryContent = (
                                            <div>
                                              <div className="flex items-center justify-between mb-1">
                                                <div className="flex items-center space-x-2">
                                                  <span style={{ color: category.color }}>
                                                    <CategoryIcon section={section.section_name} />
                                                  </span>
                                                  <span className="text-sm font-medium" style={{ color: category.color }}>
                                                    {category.label}
                                                  </span>
                                                </div>
                                                <span className="text-xs font-semibold text-gray-700">{section.mood_numeric}/4</span>
                                              </div>
                                              <div className="w-full h-2 bg-gray-100 rounded-full overflow-hidden cursor-help">
                                                <div
                                                  className="h-full rounded-full transition-all"
                                                  style={{
                                                    width: `${(section.mood_numeric / 4) * 100}%`,
                                                    backgroundColor: category.color
                                                  }}
                                                />
                                              </div>
                                            </div>
                                          )

                                          return (
                                            <div key={idx}>
                                              {section.text_response ? (
                                                <WellbeingTooltip
                                                  date={new Date(checkIn.created_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                                                  categoryName={category.label}
                                                  categoryColor={category.color}
                                                  score={section.mood_numeric}
                                                  textResponse={section.text_response}
                                                >
                                                  {categoryContent}
                                                </WellbeingTooltip>
                                              ) : (
                                                categoryContent
                                              )}
                                            </div>
                                          )
                                        })}
                                      </div>
                                    )}
                                  </div>
                                )
                              })
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

                        <div className="relative">
                          {/* Minimum height container for content */}
                          <div className="min-h-[300px]">
                            {/* Content with blur effect when loading */}
                            <div className={`space-y-4 transition-all duration-700 ${
                              loadingInsights[child.id] ? 'filter blur-[3px] opacity-30' : 'filter blur-0 opacity-100'
                            }`}>
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
                          </div>

                          {/* Loading Overlay with progress bar - positioned over content area only */}
                          {loadingInsights[child.id] && (
                            <div className="absolute inset-0 flex flex-col items-center justify-center bg-white/95 rounded-lg z-10" style={{ top: '50px' }}>
                              <div className="px-8 py-6 max-w-sm w-full">
                                <div className="space-y-6">
                                  {/* Main loading title */}
                                  <div className="text-center">
                                    <h5 className="text-sm font-medium text-gray-900 mb-1">Analyzing Wellbeing Data</h5>
                                    <p className="text-xs text-gray-500">
                                      {aiLoadingProgress[child.id] < 30 ? 'Gathering check-in data...' :
                                       aiLoadingProgress[child.id] < 60 ? 'Processing emotional patterns...' :
                                       aiLoadingProgress[child.id] < 90 ? 'Generating personalized insights...' :
                                       'Finalizing analysis...'}
                                    </p>
                                  </div>

                                  {/* Progress bar */}
                                  <div className="w-full">
                                    <div className="flex justify-between text-xs text-gray-600 mb-2">
                                      <span>Progress</span>
                                      <span>{aiLoadingProgress[child.id] || 0}%</span>
                                    </div>
                                    <div className="w-full bg-gray-200 rounded-full h-2.5 overflow-hidden">
                                      <div
                                        className="bg-gradient-to-r from-blue-500 to-purple-600 h-full rounded-full transition-all duration-300 ease-out"
                                        style={{ width: `${aiLoadingProgress[child.id] || 0}%` }}
                                      />
                                    </div>
                                  </div>

                                  {/* Loading animation dots */}
                                  <div className="flex justify-center">
                                    <div className="flex space-x-2">
                                      <div className="w-2 h-2 bg-blue-500 rounded-full animate-bounce" style={{ animationDelay: '0ms' }}></div>
                                      <div className="w-2 h-2 bg-purple-500 rounded-full animate-bounce" style={{ animationDelay: '150ms' }}></div>
                                      <div className="w-2 h-2 bg-blue-500 rounded-full animate-bounce" style={{ animationDelay: '300ms' }}></div>
                                    </div>
                                  </div>
                                </div>
                              </div>
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
          })
        })()}
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