import React from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { X, Activity, Calendar, Clock, Brain, Sparkles, AlertCircle, MessageSquare } from 'lucide-react'
import { WellbeingWheelHeatmap } from './WellbeingWheelHeatmap'
import { WellbeingTooltip } from './WellbeingTooltip'
import { AIInsightsSkeleton } from '../shared/AIInsightsSkeleton'

interface Child {
  id: string
  name: string
  initials?: string
}

interface CheckIn {
  id: string
  created_at: string
  mood_numeric?: number
  mood_level?: string
  notes?: string
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

interface ChildDetailPanelProps {
  child: Child
  checkInHistory: CheckIn[]
  aiInsights?: AIInsights
  selectedCheckInId?: string
  onCheckInSelect: (checkInId: string) => void
  onClose: () => void
  loadingInsights: boolean
  aiLoadingProgress: number
}

const WELLBEING_CATEGORIES = {
  my_friends: { label: 'Friends', color: '#3B82F6', emoji: '👥' },
  my_work: { label: 'Work/School', color: '#8B5CF6', emoji: '📚' },
  my_health: { label: 'Health', color: '#EF4444', emoji: '❤️' },
  my_family: { label: 'Family', color: '#F59E0B', emoji: '🏠' },
  my_fun_play: { label: 'Fun & Play', color: '#10B981', emoji: '🎨' },
  my_safety: { label: 'Safety', color: '#6366F1', emoji: '🛡️' },
  my_emotions: { label: 'Emotions', color: '#EC4899', emoji: '💭' }
}

const MOOD_COLORS = {
  1: '#EF4444',
  2: '#F97316',
  3: '#FCD34D',
  4: '#86EFAC',
  5: '#10B981'
}

// Helper function to clean up AI text
const cleanupText = (text: string): string => {
  let cleaned = text
    .replace(/declining_pattern/gi, 'developing pattern')
    .replace(/improving_pattern/gi, 'strengthening pattern')
    .replace(/stable_pattern/gi, 'consistent pattern')
    .replace(/concerning_pattern/gi, 'area for additional support')
    .replace(/(\w+)_(\w+)/g, '$1 $2')

  if (cleaned.length > 0) {
    cleaned = cleaned.charAt(0).toUpperCase() + cleaned.slice(1)
  }

  return cleaned
}

export function ChildDetailPanel({
  child,
  checkInHistory,
  aiInsights,
  selectedCheckInId,
  onCheckInSelect,
  onClose,
  loadingInsights,
  aiLoadingProgress
}: ChildDetailPanelProps) {
  return (
    <AnimatePresence>
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        exit={{ opacity: 0 }}
        className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4"
        onClick={onClose}
      >
        <motion.div
          initial={{ scale: 0.95, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          exit={{ scale: 0.95, opacity: 0 }}
          transition={{ duration: 0.2 }}
          className="bg-white rounded-lg shadow-xl max-w-6xl w-full max-h-[90vh] overflow-hidden"
          onClick={(e) => e.stopPropagation()}
        >
          {/* Header */}
          <div className="bg-gradient-to-r from-blue-600 to-purple-600 px-6 py-4 flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <div className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center">
                <span className="text-white font-semibold text-sm">{child.initials}</span>
              </div>
              <div>
                <h2 className="text-xl font-bold text-white">{child.name}</h2>
                <p className="text-blue-100 text-sm">Detailed Wellbeing Overview</p>
              </div>
            </div>
            <button
              onClick={onClose}
              className="text-white hover:bg-white/20 rounded-lg p-2 transition-colors"
            >
              <X className="h-5 w-5" />
            </button>
          </div>

          {/* Content */}
          <div className="p-6 overflow-y-auto max-h-[calc(90vh-80px)]">
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              {/* Left Column: Check-in History */}
              <div className="space-y-6">
                {/* Wellbeing Wheel Category Heatmap */}
                <div>
                  <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                    <Activity className="h-4 w-4 mr-2" />
                    Wellbeing Categories Over Time
                  </h4>

                  <div className="bg-white p-4 rounded-lg border border-gray-200">
                    {checkInHistory && checkInHistory.length > 0 ? (
                      <WellbeingWheelHeatmap
                        checkIns={checkInHistory}
                        selectedCheckInId={selectedCheckInId}
                        onCheckInSelect={onCheckInSelect}
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
                      const filteredCheckIns = checkInHistory?.filter(
                        checkIn => checkIn.notes && checkIn.notes !== 'No notes available'
                      ) || []

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

                      return checkInsToShow.map(checkIn => (
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
                                      <span className="text-sm font-medium" style={{ color: category.color }}>
                                        {category.emoji} {category.label}
                                      </span>
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
                      ))
                    })()}
                  </div>
                </div>
              </div>

              {/* Right Column: AI Insights */}
              <div>
                <h4 className="font-semibold text-gray-900 mb-4 flex items-center">
                  <Sparkles className="h-4 w-4 mr-2" />
                  Support Insights
                </h4>

                <div className="relative">
                  <div className="min-h-[300px]">
                    {/* Show skeleton when loading, otherwise show content */}
                    {loadingInsights ? (
                      <AIInsightsSkeleton />
                    ) : (
                    <div className="space-y-4">
                      {/* Summary */}
                      {aiInsights && (
                        <div className="bg-white p-4 rounded-lg border border-gray-200">
                          <h5 className="font-medium text-gray-900 mb-2 flex items-center">
                            <Brain className="h-4 w-4 mr-2" />
                            Wellbeing Overview
                          </h5>
                          <p className="text-sm text-gray-700">{cleanupText(aiInsights.summary)}</p>
                        </div>
                      )}

                      {/* Concerns */}
                      {aiInsights && aiInsights.concerns && aiInsights.concerns.length > 0 && (
                        <div className="bg-amber-50 p-4 rounded-lg border border-amber-200">
                          <h5 className="font-medium text-amber-900 mb-2 flex items-center">
                            <AlertCircle className="h-4 w-4 mr-2" />
                            Areas for Additional Support
                          </h5>
                          <ul className="space-y-1">
                            {aiInsights.concerns.map((concern, idx) => (
                              <li key={idx} className="text-sm text-amber-800 flex items-start">
                                <span className="mr-2">•</span>
                                <span>{concern}</span>
                              </li>
                            ))}
                          </ul>
                        </div>
                      )}

                      {/* Strengths */}
                      {aiInsights && aiInsights.strengths && aiInsights.strengths.length > 0 && (
                        <div className="bg-green-50 p-4 rounded-lg border border-green-200">
                          <h5 className="font-medium text-green-900 mb-2 flex items-center">
                            <Activity className="h-4 w-4 mr-2" />
                            Positive Indicators
                          </h5>
                          <ul className="space-y-1">
                            {aiInsights.strengths.map((strength, idx) => (
                              <li key={idx} className="text-sm text-green-800 flex items-start">
                                <span className="mr-2">•</span>
                                <span>{strength}</span>
                              </li>
                            ))}
                          </ul>
                        </div>
                      )}

                      {/* Recommendations */}
                      {aiInsights && aiInsights.recommendations && aiInsights.recommendations.length > 0 && (
                        <div className="bg-blue-50 p-4 rounded-lg border border-blue-200">
                          <h5 className="font-medium text-blue-900 mb-2 flex items-center">
                            <MessageSquare className="h-4 w-4 mr-2" />
                            Recommendations
                          </h5>
                          <ul className="space-y-1">
                            {aiInsights.recommendations.map((rec, idx) => (
                              <li key={idx} className="text-sm text-blue-800 flex items-start">
                                <span className="mr-2">•</span>
                                <span>{rec}</span>
                              </li>
                            ))}
                          </ul>
                        </div>
                      )}

                      {aiInsights && (
                        <p className="text-xs text-gray-500 text-right">
                          Last analyzed: {aiInsights.lastAnalyzed}
                        </p>
                      )}
                    </div>
                    )}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </motion.div>
      </motion.div>
    </AnimatePresence>
  )
}
