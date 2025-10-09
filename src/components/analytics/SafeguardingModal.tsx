import React, { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { AlertTriangle, X, Phone, Calendar, FileText, CheckCircle2 } from 'lucide-react'

interface SafeguardingModalProps {
  isOpen: boolean
  onClose: () => void
  child: {
    id: string
    name: string
    averageMood: number
    recentMoods?: number[]
    concerningNotes?: string[]
  }
  onActionTaken: (action: 'reviewed' | 'escalated' | 'followed_up' | 'contacted_parent', notes?: string) => void
}

export function SafeguardingModal({ isOpen, onClose, child, onActionTaken }: SafeguardingModalProps) {
  const [checklist, setChecklist] = useState({
    reviewedData: false,
    assessedRisk: false,
    followPolicy: false,
    willEscalate: false
  })
  const [actionNotes, setActionNotes] = useState('')
  const [showActionForm, setShowActionForm] = useState(false)

  const allChecked = Object.values(checklist).every(v => v)

  const handleCheckboxChange = (key: keyof typeof checklist) => {
    setChecklist(prev => ({ ...prev, [key]: !prev[key] }))
  }

  const handleAcknowledge = () => {
    if (allChecked) {
      onActionTaken('reviewed', actionNotes)
      onClose()
    }
  }

  const handleQuickAction = (action: 'escalated' | 'followed_up' | 'contacted_parent') => {
    onActionTaken(action, actionNotes)
    onClose()
  }

  const getSeverityLevel = (mood: number) => {
    if (mood <= 1.5) return { label: 'CRITICAL', color: 'bg-red-600' }
    if (mood <= 2.0) return { label: 'SEVERE', color: 'bg-orange-600' }
    return { label: 'HIGH', color: 'bg-amber-600' }
  }

  const severity = getSeverityLevel(child.averageMood)

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* Backdrop */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 bg-black bg-opacity-50 z-50"
            onClick={onClose}
          />

          {/* Modal */}
          <motion.div
            initial={{ opacity: 0, scale: 0.95, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.95, y: 20 }}
            className="fixed inset-0 z-50 flex items-center justify-center p-4"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="bg-white rounded-lg shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
              {/* Header */}
              <div className="bg-red-50 border-b-4 border-red-600 p-6">
                <div className="flex items-start justify-between">
                  <div className="flex items-start space-x-4">
                    <div className="bg-red-600 p-3 rounded-lg">
                      <AlertTriangle className="h-6 w-6 text-white" />
                    </div>
                    <div>
                      <h2 className="text-2xl font-bold text-red-900">Safeguarding Check Required</h2>
                      <p className="text-red-700 mt-1">
                        <span className="font-semibold">{child.name}</span> requires immediate attention
                      </p>
                      <div className="mt-2">
                        <span className={`inline-block px-3 py-1 rounded-full text-white text-sm font-bold ${severity.color}`}>
                          {severity.label} CONCERN
                        </span>
                      </div>
                    </div>
                  </div>
                  <button
                    onClick={onClose}
                    className="text-red-400 hover:text-red-600 transition-colors"
                    disabled={!allChecked}
                  >
                    <X className="h-6 w-6" />
                  </button>
                </div>
              </div>

              {/* Content */}
              <div className="p-6 space-y-6">
                {/* Key Information */}
                <div className="bg-gray-50 rounded-lg p-4 border border-gray-200">
                  <h3 className="font-semibold text-gray-900 mb-3 flex items-center">
                    <FileText className="h-4 w-4 mr-2" />
                    Recent Wellbeing Data
                  </h3>

                  <div className="space-y-2">
                    <div className="flex items-center justify-between">
                      <span className="text-sm text-gray-600">Average mood (recent):</span>
                      <span className="text-lg font-bold text-red-600">{child.averageMood.toFixed(1)} / 5.0</span>
                    </div>

                    {child.recentMoods && child.recentMoods.length > 0 && (
                      <div>
                        <span className="text-sm text-gray-600">Last 5 check-ins:</span>
                        <div className="flex space-x-2 mt-1">
                          {child.recentMoods.slice(0, 5).map((mood, idx) => (
                            <div
                              key={idx}
                              className={`px-3 py-1 rounded text-sm font-medium ${
                                mood <= 2 ? 'bg-red-100 text-red-700' :
                                mood <= 3 ? 'bg-yellow-100 text-yellow-700' :
                                'bg-blue-100 text-blue-700'
                              }`}
                            >
                              {mood.toFixed(1)}
                            </div>
                          ))}
                        </div>
                      </div>
                    )}

                    {child.concerningNotes && child.concerningNotes.length > 0 && (
                      <div className="mt-3 pt-3 border-t border-gray-200">
                        <span className="text-sm font-medium text-gray-700">Concerning phrases:</span>
                        <ul className="mt-2 space-y-1">
                          {child.concerningNotes.slice(0, 3).map((note, idx) => (
                            <li key={idx} className="text-sm text-gray-600 italic">
                              "{note}"
                            </li>
                          ))}
                        </ul>
                      </div>
                    )}
                  </div>
                </div>

                {/* Required Actions Checklist */}
                <div className="bg-blue-50 rounded-lg p-4 border border-blue-200">
                  <h3 className="font-semibold text-gray-900 mb-3">Required Actions</h3>
                  <div className="space-y-3">
                    {[
                      { key: 'reviewedData', label: 'I have reviewed the child\'s recent check-in data' },
                      { key: 'assessedRisk', label: 'I have assessed immediate risk' },
                      { key: 'followPolicy', label: 'I will follow my organization\'s safeguarding policy' },
                      { key: 'willEscalate', label: 'I will escalate to the Designated Safeguarding Lead if needed' }
                    ].map(({ key, label }) => (
                      <label key={key} className="flex items-start space-x-3 cursor-pointer group">
                        <input
                          type="checkbox"
                          checked={checklist[key as keyof typeof checklist]}
                          onChange={() => handleCheckboxChange(key as keyof typeof checklist)}
                          className="mt-1 h-5 w-5 rounded border-gray-300 text-blue-600 focus:ring-blue-500"
                        />
                        <span className="text-sm text-gray-700 group-hover:text-gray-900">{label}</span>
                      </label>
                    ))}
                  </div>
                </div>

                {/* Action Notes */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Action Notes (Optional)
                  </label>
                  <textarea
                    value={actionNotes}
                    onChange={(e) => setActionNotes(e.target.value)}
                    placeholder="Record any immediate actions taken or observations..."
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                    rows={3}
                  />
                </div>

                {/* Quick Action Buttons */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
                  <button
                    onClick={() => handleQuickAction('escalated')}
                    disabled={!allChecked}
                    className="flex items-center justify-center space-x-2 px-4 py-3 bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:bg-gray-300 disabled:cursor-not-allowed transition-colors"
                  >
                    <Phone className="h-4 w-4" />
                    <span className="font-medium">Contact DSL</span>
                  </button>

                  <button
                    onClick={() => handleQuickAction('followed_up')}
                    disabled={!allChecked}
                    className="flex items-center justify-center space-x-2 px-4 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:bg-gray-300 disabled:cursor-not-allowed transition-colors"
                  >
                    <Calendar className="h-4 w-4" />
                    <span className="font-medium">Schedule Follow-up</span>
                  </button>

                  <button
                    onClick={() => handleQuickAction('contacted_parent')}
                    disabled={!allChecked}
                    className="flex items-center justify-center space-x-2 px-4 py-3 bg-purple-600 text-white rounded-lg hover:bg-purple-700 disabled:bg-gray-300 disabled:cursor-not-allowed transition-colors"
                  >
                    <Phone className="h-4 w-4" />
                    <span className="font-medium">Contact Parent</span>
                  </button>
                </div>

                {/* Acknowledge Button */}
                <div className="pt-4 border-t border-gray-200">
                  <button
                    onClick={handleAcknowledge}
                    disabled={!allChecked}
                    className="w-full flex items-center justify-center space-x-2 px-6 py-4 bg-gray-900 text-white rounded-lg hover:bg-gray-800 disabled:bg-gray-300 disabled:cursor-not-allowed transition-colors font-semibold"
                  >
                    <CheckCircle2 className="h-5 w-5" />
                    <span>Acknowledge & Continue</span>
                  </button>
                  {!allChecked && (
                    <p className="text-sm text-red-600 text-center mt-2">
                      Please complete all checklist items before continuing
                    </p>
                  )}
                </div>

                {/* Footer */}
                <div className="text-xs text-gray-500 text-center pt-2">
                  This action will be logged for safeguarding compliance and audit purposes.
                </div>
              </div>
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  )
}
