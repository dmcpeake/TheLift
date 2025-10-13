import React, { useMemo, useState, useEffect } from 'react'
import { motion } from 'framer-motion'
import { treemap, hierarchy, treemapSquarify } from 'd3-hierarchy'
import { MoodHeatmap } from './MoodHeatmap'
import { getSupabaseClient } from '../../utils/supabase/client'
import { TrendingDown, AlertTriangle, ChevronRight, ChevronDown, Users, Briefcase, HeartPulse, Home, Laugh, Shield, Brain, Cloud } from 'lucide-react'
import { WellbeingTooltip } from './WellbeingTooltip'
import { WordCloudCard } from './WordCloudCard'

interface Child {
  id: string
  name: string
  averageMood?: number
  moodTrend?: 'improving' | 'developing' | 'stable'
  latestNote?: string
}

interface CheckIn {
  mood_numeric?: number
  notes?: string
}

interface WellbeingTreemapProps {
  children: Child[]
  checkInHistory: Record<string, CheckIn[]>
  onChildClick: (childId: string) => void
  selectedChildId?: string | null
  moodHistory?: Record<string, any[]>
  preloadedWellbeingData?: Record<string, any[]>
  orgId?: string
  activeTab: 'priorities' | 'over-time'
  onTabChange: (tab: 'priorities' | 'over-time') => void
}

const getWellbeingEmotionCategory = (wellbeingScore: number) => {
  // Wellbeing wheel uses 1-4 scale
  if (wellbeingScore <= 1.5) {
    // Red (score 1 - Struggling)
    return {
      gradient: 'linear-gradient(135deg, #EF4444 0%, #DC2626 100%)', // Red to darker red
      selectedGradient: 'linear-gradient(135deg, #DC2626 0%, #B91C1C 100%)', // Darker red
      emoji: '😢'
    }
  } else if (wellbeingScore <= 2.5) {
    // Orange (score 2 - Finding it hard)
    return {
      gradient: 'linear-gradient(135deg, #F97316 0%, #EA580C 100%)', // Orange to darker orange
      selectedGradient: 'linear-gradient(135deg, #EA580C 0%, #C2410C 100%)', // Darker orange
      emoji: '😕'
    }
  } else if (wellbeingScore <= 3.5) {
    // Yellow (score 3 - OK)
    return {
      gradient: 'linear-gradient(135deg, #FCD34D 0%, #FBBF24 100%)', // Yellow to darker yellow
      selectedGradient: 'linear-gradient(135deg, #FBBF24 0%, #F59E0B 100%)', // Darker yellow
      emoji: '😐'
    }
  } else {
    // Green (score 4 - Doing well)
    return {
      gradient: 'linear-gradient(135deg, #10B981 0%, #059669 100%)', // Green to darker green
      selectedGradient: 'linear-gradient(135deg, #059669 0%, #047857 100%)', // Darker green
      emoji: '😊'
    }
  }
}

const calculateUrgencyScore = (child: Child, checkIns: CheckIn[]): number => {
  let score = 0

  // Use averageMood which now represents wellbeing wheel score (1-4 scale)
  if (child.averageMood) {
    if (child.averageMood < 1.5) {
      // Score 1 - Struggling (highest urgency)
      score += 100 + ((1.5 - child.averageMood) * 50)
    } else if (child.averageMood < 2.5) {
      // Score 2 - Finding it hard (high urgency)
      score += 50 + ((2.5 - child.averageMood) * 30)
    } else if (child.averageMood < 3.5) {
      // Score 3 - OK (moderate urgency)
      score += 15 + ((3.5 - child.averageMood) * 15)
    } else {
      // Score 4 - Doing well (low urgency)
      score += 3 + ((4 - child.averageMood) * 8)
    }
  } else {
    score += 15
  }

  if (child.moodTrend === 'developing') {
    score *= 1.3
  } else if (child.moodTrend === 'improving') {
    score *= 0.85
  }

  // Critical threshold is now ≤2 for 1-4 scale
  const recentCritical = checkIns.slice(0, 5).filter(c => c.mood_numeric && c.mood_numeric <= 2).length
  if (recentCritical > 0) {
    score += recentCritical * 15
  }

  return Math.max(3, Math.min(200, score))
}

const WELLBEING_EMOJIS = {
  1: '😢',  // Struggling
  2: '😕',  // Finding it hard
  3: '😐',  // OK
  4: '😊'   // Doing well
}

// Wellbeing category colors matching ChildSummaryAnalytics
const WELLBEING_COLORS = {
  my_friends: '#3B82F6',
  my_work: '#8B5CF6',
  my_health: '#EF4444',
  my_family: '#F59E0B',
  my_fun_play: '#10B981',
  my_safety: '#6366F1',
  my_emotions: '#EC4899'
}

const CATEGORY_LABELS = {
  my_friends: 'Friends',
  my_work: 'Work',
  my_health: 'Health',
  my_family: 'Family',
  my_fun_play: 'Fun',
  my_safety: 'Safety',
  my_emotions: 'Emotions'
}

const MOOD_COLORS = {
  1: '#EF4444',
  2: '#F97316',
  3: '#FCD34D',
  4: '#10B981'
}

export function WellbeingTreemap({ children, checkInHistory, onChildClick, selectedChildId, moodHistory, preloadedWellbeingData, orgId, activeTab, onTabChange }: WellbeingTreemapProps) {
  // Use preloaded data if available, otherwise initialize empty
  const wellbeingData = preloadedWellbeingData || {}

  const treemapData = useMemo(() => {
    if (children.length === 0) return []

    const childrenWithUrgency = children.map(child => {
      const checkIns = checkInHistory[child.id] || []
      const urgencyScore = calculateUrgencyScore(child, checkIns)
      // Use wellbeing score (1-4 scale) - default to 2.5 if not available
      const wellbeingCategory = getWellbeingEmotionCategory(child.averageMood || 2.5)

      return {
        child,
        urgencyScore,
        moodCategory: wellbeingCategory
      }
    })

    const root = hierarchy({
      name: 'root',
      children: childrenWithUrgency.map(c => ({
        name: c.child.name,
        value: c.urgencyScore,
        child: c.child,
        moodCategory: c.moodCategory
      }))
    })
      .sum(d => (d as any).value || 0)
      .sort((a, b) => (b.value || 0) - (a.value || 0))

    const treemapLayout = treemap<any>()
      .size([1200, 270])
      .padding(2)
      .tile(treemapSquarify)

    return treemapLayout(root).leaves()
  }, [children, checkInHistory])

  return (
    <div className="bg-white rounded-lg shadow-sm border border-gray-200 px-4 pt-3 pb-4 mb-6">
      {/* Header with Tabs */}
      <div className="flex items-center justify-between mb-1">
        <div className="flex items-center space-x-6">
          <div className="flex border-b border-gray-200">
            <button
              onClick={() => onTabChange('over-time')}
              className={`px-4 py-2 text-lg font-bold transition-colors ${
                activeTab === 'over-time'
                  ? 'text-gray-900 border-b-2 border-blue-600'
                  : 'text-gray-500 hover:text-gray-700'
              }`}
            >
              🔍 Weekly Overview
            </button>
            <button
              onClick={() => onTabChange('priorities')}
              className={`px-4 py-2 text-lg font-bold transition-colors ${
                activeTab === 'priorities'
                  ? 'text-gray-900 border-b-2 border-blue-600'
                  : 'text-gray-500 hover:text-gray-700'
              }`}
            >
              📊 Data Viz
            </button>
          </div>
        </div>

        {/* Legend - only show for Priorities tab */}
        {activeTab === 'priorities' && (
          <div className="flex gap-3 text-xs">
            <div className="flex items-center gap-1">
              <div className="w-3 h-3 rounded" style={{ backgroundColor: '#EF4444', border: '1px solid #DC2626' }}></div>
              <span className="text-gray-600">1 😢</span>
            </div>
            <div className="flex items-center gap-1">
              <div className="w-3 h-3 rounded" style={{ backgroundColor: '#F97316', border: '1px solid #EA580C' }}></div>
              <span className="text-gray-600">2 😕</span>
            </div>
            <div className="flex items-center gap-1">
              <div className="w-3 h-3 rounded" style={{ backgroundColor: '#FCD34D', border: '1px solid #FBBF24' }}></div>
              <span className="text-gray-600">3 😐</span>
            </div>
            <div className="flex items-center gap-1">
              <div className="w-3 h-3 rounded" style={{ backgroundColor: '#10B981', border: '1px solid #059669' }}></div>
              <span className="text-gray-600">4 😊</span>
            </div>
          </div>
        )}
      </div>

      {/* Tab Content */}
      {activeTab === 'priorities' ? (
        // Data Viz Tab - Full Width Stacked Cards
        <div className="mt-4 space-y-4">
          {/* Treemap Card */}
          <div className="bg-white rounded-lg border border-gray-200 p-4">
            <div className="flex items-center justify-between mb-3">
              <h3 className="text-lg font-semibold text-gray-900">Children by Support Priority</h3>
            </div>
              <div className="relative w-full rounded-lg" style={{ height: '270px' }}>
                {treemapData.length > 0 ? (
                  <svg viewBox="0 0 1200 270" className="w-full h-full">
                {treemapData.map((node: any, index) => {
                  const { child, moodCategory } = node.data
                  const width = node.x1 - node.x0
                  const height = node.y1 - node.y0
                  const isSelected = selectedChildId === child.id
                  const area = width * height
                  const emojiFontSize = Math.min(width, height) * 0.12
                  const nameFontSize = Math.min(width, height) * 0.14
                  const moodScoreFontSize = Math.min(width, height) * 0.11
                  const showText = area > 3000

                  // Create unique gradient IDs for each square
                  const gradientId = `gradient-${child.id}`

                  return (
                    <g key={child.id}>
                      <defs>
                        <linearGradient id={gradientId} x1="0%" y1="0%" x2="100%" y2="100%">
                          {isSelected ? (
                            <>
                              <stop offset="0%" style={{ stopColor: moodCategory.selectedGradient.match(/#[0-9a-f]{6}/gi)?.[0] || '#000', stopOpacity: 1 }} />
                              <stop offset="100%" style={{ stopColor: moodCategory.selectedGradient.match(/#[0-9a-f]{6}/gi)?.[1] || '#000', stopOpacity: 1 }} />
                            </>
                          ) : (
                            <>
                              <stop offset="0%" style={{ stopColor: moodCategory.gradient.match(/#[0-9a-f]{6}/gi)?.[0] || '#000', stopOpacity: 1 }} />
                              <stop offset="100%" style={{ stopColor: moodCategory.gradient.match(/#[0-9a-f]{6}/gi)?.[1] || '#000', stopOpacity: 1 }} />
                            </>
                          )}
                        </linearGradient>
                      </defs>
                      <motion.rect
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: index * 0.03 }}
                        x={node.x0}
                        y={node.y0}
                        width={width}
                        height={height}
                        rx={8}
                        ry={8}
                        className="cursor-pointer transition-all duration-300"
                        fill={`url(#${gradientId})`}
                        onClick={() => onChildClick(child.id)}
                      />

                      <g pointerEvents="none">
                        {/* Emoji */}
                        <text
                          x={node.x0 + width / 2}
                          y={node.y0 + (showText ? height * 0.3 : height * 0.4)}
                          textAnchor="middle"
                          dominantBaseline="middle"
                          fontSize={emojiFontSize}
                        >
                          {moodCategory.emoji}
                        </text>

                        {/* Child name */}
                        {showText && (
                          <text
                            x={node.x0 + width / 2}
                            y={node.y0 + height * 0.55}
                            textAnchor="middle"
                            dominantBaseline="middle"
                            fontSize={nameFontSize}
                            fontWeight="700"
                            fill="#1f2937"
                          >
                            {child.name.split(' ')[0]}
                          </text>
                        )}

                        {/* Mood score */}
                        {child.averageMood && showText && (
                          <text
                            x={node.x0 + width / 2}
                            y={node.y0 + height * 0.75}
                            textAnchor="middle"
                            dominantBaseline="middle"
                            fontSize={moodScoreFontSize}
                            fontWeight="600"
                            fill="#374151"
                          >
                            {child.averageMood.toFixed(1)}
                          </text>
                        )}

                        {/* Critical alert indicator (pulsing red dot) */}
                        {child.moodTrend === 'developing' && child.averageMood && child.averageMood < 2.5 && width > 30 && height > 30 && (
                          <circle cx={node.x0 + 8} cy={node.y0 + 8} r={4} fill="#ef4444" opacity={0.8}>
                            <animate attributeName="opacity" values="0.8;0.3;0.8" dur="2s" repeatCount="indefinite" />
                          </circle>
                        )}
                      </g>
                    </g>
                  )
                })}
              </svg>
              ) : (
                <div className="absolute inset-0 flex items-center justify-center text-gray-500">
                  <p className="text-sm">No children found</p>
                </div>
              )}
              </div>
            <p className="text-xs text-gray-500 mt-2">Larger areas indicate children who may need more support. Click a child to view details.</p>
          </div>

          {/* Word Cloud Card */}
          <WordCloudCard
            orgId={orgId}
            childId={selectedChildId || undefined}
            dateRange="all"
            title={selectedChildId ? `Key Themes from ${children.find(c => c.id === selectedChildId)?.name || 'Selected Child'}` : "Key Themes from All Check-ins"}
          />
        </div>
      ) : (
        // Over Time Tab - Simple Matrix View
        <div className="space-y-1 mt-4">
          {/* Header Row */}
          <div className="bg-gray-50 border border-gray-200 rounded-lg p-2">
            <div className="grid gap-2" style={{ gridTemplateColumns: '180px repeat(7, 1fr)' }}>
              <div className="font-semibold text-gray-700 text-xs">Child Name</div>
              <div className="flex items-center justify-center space-x-1">
                <Users className="h-3 w-3" style={{ color: WELLBEING_COLORS.my_friends }} />
                <span className="text-xs font-semibold text-gray-700">Friends</span>
              </div>
              <div className="flex items-center justify-center space-x-1">
                <Briefcase className="h-3 w-3" style={{ color: WELLBEING_COLORS.my_work }} />
                <span className="text-xs font-semibold text-gray-700">Work</span>
              </div>
              <div className="flex items-center justify-center space-x-1">
                <HeartPulse className="h-3 w-3" style={{ color: WELLBEING_COLORS.my_health }} />
                <span className="text-xs font-semibold text-gray-700">Health</span>
              </div>
              <div className="flex items-center justify-center space-x-1">
                <Home className="h-3 w-3" style={{ color: WELLBEING_COLORS.my_family }} />
                <span className="text-xs font-semibold text-gray-700">Family</span>
              </div>
              <div className="flex items-center justify-center space-x-1">
                <Laugh className="h-3 w-3" style={{ color: WELLBEING_COLORS.my_fun_play }} />
                <span className="text-xs font-semibold text-gray-700">Fun</span>
              </div>
              <div className="flex items-center justify-center space-x-1">
                <Shield className="h-3 w-3" style={{ color: WELLBEING_COLORS.my_safety }} />
                <span className="text-xs font-semibold text-gray-700">Safety</span>
              </div>
              <div className="flex items-center justify-center space-x-1">
                <Brain className="h-3 w-3" style={{ color: WELLBEING_COLORS.my_emotions }} />
                <span className="text-xs font-semibold text-gray-700">Emotions</span>
              </div>
            </div>
          </div>

          {/* Child Rows */}
          {children.map(child => {
            const childWellbeingData = wellbeingData[child.id] || []
            const categories = ['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions']
            const isExpanded = selectedChildId === child.id

            // Get latest check-in
            const latestCheckIn = childWellbeingData.length > 0 ? childWellbeingData[childWellbeingData.length - 1] : null

            return (
              <div key={child.id} className="border border-gray-200 rounded-lg overflow-hidden">
                {/* Summary Row - Always Visible */}
                <div
                  className="p-2 cursor-pointer hover:bg-gray-50 transition-colors"
                  onClick={() => onChildClick(child.id)}
                >
                  <div className="grid gap-2 items-center" style={{ gridTemplateColumns: '180px repeat(7, 1fr)' }}>
                    {/* Child Name */}
                    <div className="flex items-center space-x-1.5">
                      {isExpanded ? (
                        <ChevronDown className="h-3.5 w-3.5 text-gray-500 flex-shrink-0" />
                      ) : (
                        <ChevronRight className="h-3.5 w-3.5 text-gray-500 flex-shrink-0" />
                      )}
                      <span className="font-medium text-gray-900 text-xs">{child.name}</span>
                    </div>

                    {/* Latest Scores for Each Category */}
                    {categories.map(category => {
                      const section = latestCheckIn?.sections.find((s: any) => s.section_name === category)
                      const score = section?.mood_numeric || 0
                      const categoryLabel = CATEGORY_LABELS[category as keyof typeof CATEGORY_LABELS]
                      const categoryColor = WELLBEING_COLORS[category as keyof typeof WELLBEING_COLORS]

                      const cellContent = score > 0 ? (
                        <div
                          className="w-7 h-7 rounded flex items-center justify-center text-xs font-bold text-white cursor-help"
                          style={{ backgroundColor: MOOD_COLORS[score as keyof typeof MOOD_COLORS] }}
                        >
                          {score}
                        </div>
                      ) : (
                        <div className="w-7 h-7 rounded bg-gray-100 flex items-center justify-center text-xs text-gray-400">
                          —
                        </div>
                      )

                      return (
                        <div
                          key={category}
                          className="flex items-center justify-center"
                        >
                          {score > 0 && section?.text_response ? (
                            <WellbeingTooltip
                              date={new Date(latestCheckIn.completed_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}
                              categoryName={categoryLabel}
                              categoryColor={categoryColor}
                              score={score}
                              textResponse={section.text_response}
                            >
                              {cellContent}
                            </WellbeingTooltip>
                          ) : (
                            cellContent
                          )}
                        </div>
                      )
                    })}
                  </div>
                </div>

                {/* Expanded Timeline View */}
                {isExpanded && childWellbeingData.length > 0 && (
                  <div className="border-t border-gray-200 bg-gray-50 p-4">
                    <div className="space-y-2">
                      {/* Timeline Header with Dates */}
                      <div className="flex items-center space-x-2 mb-3">
                        <div className="w-20 text-xs font-semibold text-gray-700">Category</div>
                        <div className="flex-1 grid gap-1" style={{ gridTemplateColumns: `repeat(${childWellbeingData.length}, minmax(0, 1fr))` }}>
                          {childWellbeingData.map((checkIn, idx) => (
                            <div key={idx} className="text-center">
                              <div className="text-xs text-gray-500">
                                {new Date(checkIn.completed_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}
                              </div>
                            </div>
                          ))}
                        </div>
                      </div>

                      {/* Category Rows with Historical Data */}
                      {categories.map(category => {
                        const categoryLabel = CATEGORY_LABELS[category as keyof typeof CATEGORY_LABELS]
                        const categoryColor = WELLBEING_COLORS[category as keyof typeof WELLBEING_COLORS]

                        return (
                          <div key={category} className="flex items-center space-x-2">
                            {/* Category Label */}
                            <div className="w-20 text-xs font-medium" style={{ color: categoryColor }}>
                              {categoryLabel}
                            </div>

                            {/* Historical Cells */}
                            <div className="flex-1 grid gap-1" style={{ gridTemplateColumns: `repeat(${childWellbeingData.length}, minmax(0, 1fr))` }}>
                              {childWellbeingData.map((checkIn, idx) => {
                                const section = checkIn.sections.find((s: any) => s.section_name === category)
                                const score = section?.mood_numeric || 0

                                const historicalCellContent = (
                                  <div
                                    className="h-10 rounded flex flex-col items-center justify-center cursor-help hover:ring-2 hover:ring-blue-400 transition-all"
                                    style={{
                                      backgroundColor: score > 0 ? MOOD_COLORS[score as keyof typeof MOOD_COLORS] : '#E5E7EB',
                                      opacity: score > 0 ? 0.9 : 0.3
                                    }}
                                  >
                                    {score > 0 && (
                                      <span className="text-xs font-bold text-white">{score}</span>
                                    )}
                                  </div>
                                )

                                return (
                                  <div key={idx}>
                                    {score > 0 && section?.text_response ? (
                                      <WellbeingTooltip
                                        date={new Date(checkIn.completed_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                                        categoryName={categoryLabel}
                                        categoryColor={categoryColor}
                                        score={score}
                                        textResponse={section.text_response}
                                      >
                                        {historicalCellContent}
                                      </WellbeingTooltip>
                                    ) : (
                                      historicalCellContent
                                    )}
                                  </div>
                                )
                              })}
                            </div>
                          </div>
                        )
                      })}

                      {/* Overall Score Row */}
                      <div className="flex items-center space-x-2 pt-2 border-t border-gray-300">
                        <div className="w-20 text-xs font-bold text-gray-900">Overall</div>
                        <div className="flex-1 grid gap-1" style={{ gridTemplateColumns: `repeat(${childWellbeingData.length}, minmax(0, 1fr))` }}>
                          {childWellbeingData.map((checkIn, idx) => {
                            const overallScore = checkIn.overall_score || 0

                            return (
                              <div
                                key={idx}
                                className="h-10 rounded flex flex-col items-center justify-center"
                                style={{
                                  backgroundColor: overallScore > 0 ? MOOD_COLORS[Math.round(overallScore) as keyof typeof MOOD_COLORS] : '#E5E7EB',
                                  opacity: overallScore > 0 ? 0.9 : 0.3
                                }}
                                title={`Overall Wellbeing: ${overallScore.toFixed(1)}/4`}
                              >
                                {overallScore > 0 && (
                                  <span className="text-xs font-bold text-white">{overallScore.toFixed(1)}</span>
                                )}
                              </div>
                            )
                          })}
                        </div>
                      </div>
                    </div>
                  </div>
                )}

                {/* No Data Message */}
                {isExpanded && childWellbeingData.length === 0 && (
                  <div className="border-t border-gray-200 bg-gray-50 p-4">
                    <p className="text-sm text-gray-500 text-center">No wellbeing wheel data available for this child</p>
                  </div>
                )}
              </div>
            )
          })}
        </div>
      )}
    </div>
  )
}
