import React, { useState, useEffect } from 'react'
import { X } from 'lucide-react'
import { useGamification } from '../../../contexts/GamificationContext'

interface IfICouldBeProps {
  onClose: () => void
  onPointsAwarded?: (points: number) => void
}

export function IfICouldBe({ onClose, onPointsAwarded }: IfICouldBeProps) {
  const { awardPoints } = useGamification()
  const [whatIWouldBe, setWhatIWouldBe] = useState(() => {
    const saved = sessionStorage.getItem('ifICouldBe')
    return saved ? JSON.parse(saved).whatIWouldBe : ''
  })
  const [whyReason, setWhyReason] = useState(() => {
    const saved = sessionStorage.getItem('ifICouldBe')
    return saved ? JSON.parse(saved).whyReason : ''
  })
  const [isRecording, setIsRecording] = useState<'what' | 'why' | null>(null)
  const [pointsAwarded, setPointsAwarded] = useState<boolean>(() => {
    const saved = sessionStorage.getItem('ifICouldBePointsAwarded')
    return saved === 'true'
  })

  useEffect(() => {
    sessionStorage.setItem('ifICouldBe', JSON.stringify({ whatIWouldBe, whyReason }))
  }, [whatIWouldBe, whyReason])

  const handleVoiceCapture = (field: 'what' | 'why') => {
    // Voice capture functionality - placeholder for now
    setIsRecording(isRecording === field ? null : field)
    console.log(`Voice capture for ${field} field`)
  }

  const handleSave = () => {
    // Check if at least one field is filled and points haven't been awarded yet
    const hasContent = whatIWouldBe.trim().length > 0 || whyReason.trim().length > 0
    if (hasContent && !pointsAwarded) {
      awardPoints('Completed If I Could Be', 25)
      sessionStorage.setItem('ifICouldBePointsAwarded', 'true')
      setPointsAwarded(true)
      onPointsAwarded?.(25)
    }
    onClose()
  }

  return (
    <div
      className="fixed inset-0 flex items-center justify-center"
      style={{
        zIndex: 9999,
        backgroundColor: 'rgba(0, 0, 0, 0.8)'
      }}
    >
      <div
        className="bg-white rounded-lg max-w-2xl w-full mx-4 relative"
        onClick={(e) => e.stopPropagation()}
        style={{ maxHeight: '90vh', overflowY: 'auto', padding: '2rem' }}
      >
        {/* Title */}
        <h2 className="text-2xl font-semibold text-gray-900 mb-6">
          If I could be any object, animal or vegetable I would be...
        </h2>

        {/* Input Fields */}
        <div className="space-y-6">
          {/* What field */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              I would be...
            </label>
            <div className="relative">
              <textarea
                value={whatIWouldBe}
                onChange={(e) => setWhatIWouldBe(e.target.value)}
                placeholder="Tell us what you would be"
                className="w-full px-4 py-3 pr-14 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
                rows={3}
                style={{ fontSize: '16px' }}
              />
              <button
                onClick={() => handleVoiceCapture('what')}
                className={`absolute top-1/2 right-3 transform -translate-y-1/2 w-10 h-10 rounded-full flex items-center justify-center transition-colors ${
                  isRecording === 'what' ? 'bg-red-100' : 'bg-blue-100 hover:bg-blue-200'
                }`}
              >
                <svg
                  width="20"
                  height="20"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke={isRecording === 'what' ? '#dc2626' : '#2563eb'}
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                >
                  <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"/>
                  <path d="M19 10v2a7 7 0 0 1-14 0v-2"/>
                  <line x1="12" y1="19" x2="12" y2="23"/>
                  <line x1="8" y1="23" x2="16" y2="23"/>
                </svg>
              </button>
            </div>
          </div>

          {/* Why field */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Tell us why?
            </label>
            <div className="relative">
              <textarea
                value={whyReason}
                onChange={(e) => setWhyReason(e.target.value)}
                placeholder="Why would you be this?"
                className="w-full px-4 py-3 pr-14 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
                rows={5}
                style={{ fontSize: '16px' }}
              />
              <button
                onClick={() => handleVoiceCapture('why')}
                className={`absolute top-1/2 right-3 transform -translate-y-1/2 w-10 h-10 rounded-full flex items-center justify-center transition-colors ${
                  isRecording === 'why' ? 'bg-red-100' : 'bg-blue-100 hover:bg-blue-200'
                }`}
              >
                <svg
                  width="20"
                  height="20"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke={isRecording === 'why' ? '#dc2626' : '#2563eb'}
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                >
                  <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"/>
                  <path d="M19 10v2a7 7 0 0 1-14 0v-2"/>
                  <line x1="12" y1="19" x2="12" y2="23"/>
                  <line x1="8" y1="23" x2="16" y2="23"/>
                </svg>
              </button>
            </div>
          </div>
        </div>

        {/* Action Footer */}
        <div className="mt-8 pt-4 border-t border-gray-200" style={{ marginBottom: '-1rem' }}>
          <div className="flex items-center">
            <button
              onClick={onClose}
              className="flex-1 font-medium transition-colors text-center"
              style={{ fontSize: '16px', color: '#2563eb' }}
              onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
              onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
            >
              CLOSE
            </button>
            <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>
            <button
              onClick={handleSave}
              className="flex-1 font-medium transition-colors text-center"
              style={{ fontSize: '16px', color: '#2563eb' }}
              onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
              onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
            >
              SAVE
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
