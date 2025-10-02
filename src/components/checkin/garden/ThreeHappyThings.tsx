import React, { useState } from 'react'
import { X } from 'lucide-react'

interface ThreeHappyThingsProps {
  onClose: () => void
}

export function ThreeHappyThings({ onClose }: ThreeHappyThingsProps) {
  const [responses, setResponses] = useState(['', '', ''])
  const [isRecording, setIsRecording] = useState<number | null>(null)

  const handleTextChange = (index: number, value: string) => {
    const newResponses = [...responses]
    newResponses[index] = value
    setResponses(newResponses)
  }

  const handleVoiceCapture = (index: number) => {
    // Voice capture functionality - placeholder for now
    setIsRecording(isRecording === index ? null : index)
    console.log(`Voice capture for input ${index}`)
  }

  return (
    <div
      className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-lg p-8 max-w-2xl w-full mx-4 relative"
        onClick={(e) => e.stopPropagation()}
        style={{ maxHeight: '90vh', overflowY: 'auto' }}
      >
        {/* Close Button */}
        <button
          onClick={onClose}
          className="absolute top-4 right-4 w-10 h-10 rounded-full flex items-center justify-center hover:bg-gray-100 transition-colors"
          style={{ border: '1px solid #e5e7eb' }}
        >
          <X size={20} color="#374151" />
        </button>

        {/* Title */}
        <h2 className="text-2xl font-semibold text-gray-900 mb-6 pr-12">
          3 things that made me happy today
        </h2>

        {/* Input Fields */}
        <div className="space-y-6">
          {[1, 2, 3].map((num, index) => (
            <div key={num}>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Thing {num}
              </label>
              <div className="relative">
                <textarea
                  value={responses[index]}
                  onChange={(e) => handleTextChange(index, e.target.value)}
                  placeholder={`What made you happy?`}
                  className="w-full px-4 py-3 pr-12 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
                  rows={3}
                  style={{ fontSize: '16px' }}
                />
                <button
                  onClick={() => handleVoiceCapture(index)}
                  className={`absolute right-3 top-3 w-10 h-10 rounded-full flex items-center justify-center transition-colors ${
                    isRecording === index ? 'bg-red-100' : 'bg-gray-100 hover:bg-gray-200'
                  }`}
                >
                  <svg
                    width="20"
                    height="20"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke={isRecording === index ? '#dc2626' : '#374151'}
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
          ))}
        </div>

        {/* Save Button */}
        <div className="mt-8 flex justify-center">
          <button
            onClick={onClose}
            className="px-8 py-3 bg-blue-600 text-white font-semibold rounded-full hover:bg-blue-700 transition-colors"
          >
            Save
          </button>
        </div>
      </div>
    </div>
  )
}
