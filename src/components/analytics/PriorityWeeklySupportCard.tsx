import React, { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import {
  ChevronDown,
  ChevronUp,
  AlertCircle,
  Clock,
  Lightbulb,
  BookOpen,
  MessageCircle,
  Calendar
} from 'lucide-react'

interface Child {
  id: string
  name: string
  averageMood?: number
  lastCheckIn?: string
  recentMood?: number
}

interface CheckIn {
  id: string
  created_at: string
  mood_numeric?: number
  notes?: string
}

interface PriorityChild {
  child: Child
  urgencyLevel: 'urgent' | 'monitor'
  triggerQuote: string
  triggerReason: string
  suggestedAction: {
    type: 'question' | 'resource'
    content: string
  }
  daysSinceCheckIn: number
}

interface PriorityWeeklySupportCardProps {
  children: Child[]
  checkInHistory: Record<string, CheckIn[]>
  onChildClick: (childId: string) => void
  organizationName?: string
}

// Emotive terms that indicate a child needs support
const EMOTIVE_TERMS = {
  isolation: ['lonely', 'alone', 'nobody', 'no one', 'isolated', 'left out'],
  distress: ['worried', 'scared', 'afraid', 'anxious', 'nervous', 'panic', 'terrified'],
  sadness: ['sad', 'depressed', 'down', 'miserable', 'unhappy', 'crying', 'upset'],
  hopelessness: ['hopeless', 'pointless', 'worthless', 'useless', 'give up', 'no point'],
  understanding: ['understand', 'understands', 'listen', 'hear me', 'ignore', 'dismissed'],
  harm: ['hurt', 'pain', 'harm', 'die', 'death', 'end it', 'disappear'],
  anger: ['angry', 'mad', 'furious', 'hate', 'rage', 'annoyed'],
  overwhelming: ['overwhelmed', 'too much', 'cannot cope', "can't cope", 'breaking']
}

// Suggested actions based on trigger category
const SUGGESTED_ACTIONS: Record<string, { question: string; resource: string }> = {
  isolation: {
    question: "I noticed you mentioned feeling alone. Can you tell me more about what's been happening?",
    resource: "Social connection activities - buddy system, group work"
  },
  distress: {
    question: "You mentioned feeling worried. What's been on your mind lately?",
    resource: "Anxiety toolkit - breathing exercises, grounding techniques"
  },
  sadness: {
    question: "I can see things have been difficult. Would you like to talk about how you're feeling?",
    resource: "Mood regulation resources - journaling, creative expression"
  },
  hopelessness: {
    question: "I'm concerned about how you're feeling. Can we talk about what's making you feel this way?",
    resource: "Immediate support referral - counselor, safeguarding lead"
  },
  understanding: {
    question: "It sounds like you need someone to listen. I'm here - what would you like to share?",
    resource: "Active listening session - dedicated 1:1 time"
  },
  harm: {
    question: "I'm very concerned about what you've shared. Let's talk right away - you're important to us.",
    resource: "URGENT: Safeguarding protocol - immediate intervention required"
  },
  anger: {
    question: "I can see you're feeling really frustrated. What's been making you feel this way?",
    resource: "Emotional regulation toolkit - safe expression strategies"
  },
  overwhelming: {
    question: "It sounds like things feel like too much right now. Let's break this down together.",
    resource: "Stress management - task prioritization, support planning"
  },
  lowMood: {
    question: "I've noticed your mood has been lower recently. How are you doing?",
    resource: "Check-in conversation - explore recent changes or stressors"
  }
}

export function PriorityWeeklySupportCard({
  children,
  checkInHistory,
  onChildClick,
  organizationName
}: PriorityWeeklySupportCardProps) {
  const [isExpanded, setIsExpanded] = useState(true)
  const [expandedSection, setExpandedSection] = useState<'urgent' | 'monitor' | null>('urgent')

  // Analyze children and categorize by priority
  const analyzePriorityChildren = (): { urgent: PriorityChild[]; monitor: PriorityChild[] } => {
    const priorityChildren: PriorityChild[] = []

    console.log(`🔍 Analyzing ${children.length} children for priority support in: ${organizationName || 'All Organizations'}`)

    children.forEach(child => {
      const childCheckIns = checkInHistory[child.id] || []
      if (childCheckIns.length === 0) return

      // Get most recent check-ins (last 7 days worth)
      const oneWeekAgo = new Date()
      oneWeekAgo.setDate(oneWeekAgo.getDate() - 7)

      const recentCheckIns = childCheckIns.filter(checkIn =>
        new Date(checkIn.created_at) >= oneWeekAgo
      )

      // Calculate days since last check-in
      const lastCheckInDate = new Date(childCheckIns[0].created_at)
      const daysSince = Math.floor((Date.now() - lastCheckInDate.getTime()) / (1000 * 60 * 60 * 24))

      // Analyze for emotive terms and low mood
      let triggerFound = false
      let triggerQuote = ''
      let triggerCategory = ''
      let urgencyLevel: 'urgent' | 'monitor' = 'monitor'

      // Check recent check-ins for emotive language
      for (const checkIn of recentCheckIns) {
        if (!checkIn.notes) continue

        const notesLower = checkIn.notes.toLowerCase()

        // Check each category of emotive terms
        for (const [category, terms] of Object.entries(EMOTIVE_TERMS)) {
          for (const term of terms) {
            if (notesLower.includes(term)) {
              triggerFound = true
              triggerQuote = checkIn.notes
              triggerCategory = category

              // Harm, hopelessness, and overwhelming are always urgent
              if (['harm', 'hopelessness', 'overwhelming'].includes(category)) {
                urgencyLevel = 'urgent'
              } else if (checkIn.mood_numeric && checkIn.mood_numeric <= 2) {
                urgencyLevel = 'urgent'
              }

              break
            }
          }
          if (triggerFound) break
        }
        if (triggerFound) break
      }

      // If no emotive terms found, check for consistently low mood
      if (!triggerFound && child.averageMood && child.averageMood < 3.0) {
        triggerFound = true
        triggerCategory = 'lowMood'
        triggerQuote = recentCheckIns[0]?.notes || 'Low mood detected across multiple check-ins'

        if (child.averageMood < 2.5) {
          urgencyLevel = 'urgent'
        }
      }

      // Add to priority list if trigger found
      if (triggerFound) {
        const suggestedAction = SUGGESTED_ACTIONS[triggerCategory] || SUGGESTED_ACTIONS.lowMood

        priorityChildren.push({
          child,
          urgencyLevel,
          triggerQuote: triggerQuote.length > 100
            ? triggerQuote.substring(0, 97) + '...'
            : triggerQuote,
          triggerReason: getTriggerReason(triggerCategory, child.averageMood),
          suggestedAction: {
            type: triggerCategory === 'harm' || urgencyLevel === 'urgent' ? 'question' : 'resource',
            content: urgencyLevel === 'urgent'
              ? suggestedAction.question
              : suggestedAction.resource
          },
          daysSinceCheckIn: daysSince
        })
      }
    })

    // Sort by urgency level, then by average mood (lowest first)
    priorityChildren.sort((a, b) => {
      if (a.urgencyLevel === 'urgent' && b.urgencyLevel !== 'urgent') return -1
      if (a.urgencyLevel !== 'urgent' && b.urgencyLevel === 'urgent') return 1
      return (a.child.averageMood || 5) - (b.child.averageMood || 5)
    })

    return {
      urgent: priorityChildren.filter(p => p.urgencyLevel === 'urgent'),
      monitor: priorityChildren.filter(p => p.urgencyLevel === 'monitor')
    }
  }

  const getTriggerReason = (category: string, avgMood?: number): string => {
    const categoryLabels: Record<string, string> = {
      isolation: 'Social isolation indicators',
      distress: 'Anxiety/distress markers',
      sadness: 'Low mood language',
      hopelessness: 'Hopelessness expressed',
      understanding: 'Feeling unheard',
      harm: 'Self-harm/safety concern',
      anger: 'Anger/frustration indicators',
      overwhelming: 'Feeling overwhelmed',
      lowMood: `Consistently low mood (avg: ${avgMood?.toFixed(1)})`
    }
    return categoryLabels[category] || 'Concern detected'
  }

  const { urgent, monitor } = analyzePriorityChildren()
  const totalPriority = urgent.length + monitor.length

  if (totalPriority === 0) {
    return null // Don't show card if no priorities
  }

  const renderPriorityChild = (priorityChild: PriorityChild) => {
    const { child, triggerQuote, triggerReason, suggestedAction, daysSinceCheckIn, urgencyLevel } = priorityChild

    return (
      <motion.div
        key={child.id}
        initial={{ opacity: 0, y: -10 }}
        animate={{ opacity: 1, y: 0 }}
        className={`
          bg-white rounded-lg border-l-4 p-4 mb-3 cursor-pointer hover:shadow-md transition-shadow
          ${urgencyLevel === 'urgent' ? 'border-red-500' : 'border-amber-500'}
        `}
        onClick={() => onChildClick(child.id)}
      >
        {/* Header */}
        <div className="flex items-start justify-between mb-2">
          <div className="flex-1">
            <div className="flex items-center space-x-2 mb-1">
              <h4 className="font-semibold text-gray-900">{child.name}</h4>
              <span className={`
                px-2 py-0.5 text-xs font-medium rounded-full
                ${urgencyLevel === 'urgent'
                  ? 'bg-red-100 text-red-700'
                  : 'bg-amber-100 text-amber-700'
                }
              `}>
                Avg mood: {child.averageMood?.toFixed(1) || 'N/A'}
              </span>
            </div>
            <div className="flex items-center space-x-3 text-xs text-gray-600">
              <span className="flex items-center">
                <Clock className="h-3 w-3 mr-1" />
                {daysSinceCheckIn === 0 ? 'Today' :
                 daysSinceCheckIn === 1 ? 'Yesterday' :
                 `${daysSinceCheckIn} days ago`}
              </span>
              <span className="text-gray-400">•</span>
              <span className="text-gray-600">{triggerReason}</span>
            </div>
          </div>
        </div>

        {/* Trigger Quote */}
        <div className="bg-gray-50 rounded-md p-3 mb-3">
          <p className="text-sm text-gray-700 italic">
            "{triggerQuote}"
          </p>
        </div>

        {/* Suggested Action */}
        <div className={`
          rounded-md p-3 flex items-start space-x-2
          ${urgencyLevel === 'urgent'
            ? 'bg-red-50 border border-red-200'
            : 'bg-blue-50 border border-blue-200'
          }
        `}>
          {suggestedAction.type === 'question' ? (
            <MessageCircle className={`h-4 w-4 mt-0.5 flex-shrink-0 ${
              urgencyLevel === 'urgent' ? 'text-red-600' : 'text-blue-600'
            }`} />
          ) : (
            <BookOpen className={`h-4 w-4 mt-0.5 flex-shrink-0 ${
              urgencyLevel === 'urgent' ? 'text-red-600' : 'text-blue-600'
            }`} />
          )}
          <div className="flex-1">
            <p className={`text-xs font-medium mb-1 ${
              urgencyLevel === 'urgent' ? 'text-red-900' : 'text-blue-900'
            }`}>
              {suggestedAction.type === 'question' ? 'Suggested Question:' : 'Suggested Resource:'}
            </p>
            <p className={`text-sm ${
              urgencyLevel === 'urgent' ? 'text-red-800' : 'text-blue-800'
            }`}>
              {suggestedAction.content}
            </p>
          </div>
        </div>
      </motion.div>
    )
  }

  return (
    <motion.div
      initial={{ opacity: 0, y: -20 }}
      animate={{ opacity: 1, y: 0 }}
      className="bg-gradient-to-r from-blue-50 to-purple-50 rounded-lg shadow-md border border-blue-200 mb-6 overflow-hidden"
    >
      {/* Header */}
      <div
        className="flex items-center justify-between px-6 py-4 cursor-pointer hover:bg-white/50 transition-colors"
        onClick={() => setIsExpanded(!isExpanded)}
      >
        <div className="flex items-center space-x-3">
          <div className="bg-blue-600 text-white p-2 rounded-lg">
            <Lightbulb className="h-5 w-5" />
          </div>
          <div>
            <h3 className="text-lg font-bold text-gray-900">
              This Week's Priority Support
              {organizationName && organizationName !== 'All Organizations' && (
                <span className="text-sm font-normal text-gray-600 ml-2">
                  • {organizationName}
                </span>
              )}
            </h3>
            <p className="text-sm text-gray-600">
              {totalPriority} {totalPriority === 1 ? 'child needs' : 'children need'} attention
              {urgent.length > 0 && (
                <span className="ml-2 text-red-600 font-medium">
                  ({urgent.length} urgent)
                </span>
              )}
            </p>
          </div>
        </div>
        <button className="text-gray-600 hover:text-gray-900">
          {isExpanded ? (
            <ChevronUp className="h-6 w-6" />
          ) : (
            <ChevronDown className="h-6 w-6" />
          )}
        </button>
      </div>

      {/* Content */}
      <AnimatePresence>
        {isExpanded && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.3 }}
            className="px-6 pb-6"
          >
            {/* Urgent Section */}
            {urgent.length > 0 && (
              <div className="mb-4">
                <button
                  onClick={(e) => {
                    e.stopPropagation()
                    setExpandedSection(expandedSection === 'urgent' ? null : 'urgent')
                  }}
                  className="flex items-center justify-between w-full text-left mb-3 group"
                >
                  <div className="flex items-center space-x-2">
                    <AlertCircle className="h-5 w-5 text-red-600" />
                    <h4 className="font-semibold text-red-900 text-base">
                      URGENT ({urgent.length})
                    </h4>
                  </div>
                  {expandedSection === 'urgent' ? (
                    <ChevronUp className="h-4 w-4 text-red-600 group-hover:text-red-700" />
                  ) : (
                    <ChevronDown className="h-4 w-4 text-red-600 group-hover:text-red-700" />
                  )}
                </button>

                <AnimatePresence>
                  {expandedSection === 'urgent' && (
                    <motion.div
                      initial={{ height: 0, opacity: 0 }}
                      animate={{ height: 'auto', opacity: 1 }}
                      exit={{ height: 0, opacity: 0 }}
                    >
                      {urgent.map(renderPriorityChild)}
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>
            )}

            {/* Monitor Section */}
            {monitor.length > 0 && (
              <div>
                <button
                  onClick={(e) => {
                    e.stopPropagation()
                    setExpandedSection(expandedSection === 'monitor' ? null : 'monitor')
                  }}
                  className="flex items-center justify-between w-full text-left mb-3 group"
                >
                  <div className="flex items-center space-x-2">
                    <Calendar className="h-5 w-5 text-amber-600" />
                    <h4 className="font-semibold text-amber-900 text-base">
                      MONITOR ({monitor.length})
                    </h4>
                  </div>
                  {expandedSection === 'monitor' ? (
                    <ChevronUp className="h-4 w-4 text-amber-600 group-hover:text-amber-700" />
                  ) : (
                    <ChevronDown className="h-4 w-4 text-amber-600 group-hover:text-amber-700" />
                  )}
                </button>

                <AnimatePresence>
                  {expandedSection === 'monitor' && (
                    <motion.div
                      initial={{ height: 0, opacity: 0 }}
                      animate={{ height: 'auto', opacity: 1 }}
                      exit={{ height: 0, opacity: 0 }}
                    >
                      {monitor.map(renderPriorityChild)}
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>
            )}
          </motion.div>
        )}
      </AnimatePresence>
    </motion.div>
  )
}
