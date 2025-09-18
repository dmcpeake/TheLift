import React from 'react'
import { useNavigate } from 'react-router-dom'
import { X } from 'lucide-react'
import { BreathingCircles } from './BreathingCircles'

// Simple title header without progress sections
const TitleHeader = ({ onClose }: { onClose: () => void }) => {
  return (
    <div className="fixed top-0 left-0 right-0 bg-white shadow-sm z-50 p-4">
      <div className="max-w-4xl mx-auto">
        <div className="flex items-center justify-between">
          <h1 className="text-xl font-bold text-gray-800">Title</h1>

          {/* Close button positioned at top right */}
          <button
            onClick={onClose}
            className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors shadow-lg"
            style={{ backgroundColor: '#147fe3' }}
          >
            <X className="h-5 w-5 text-white" />
          </button>
        </div>
      </div>
    </div>
  )
}

export function BreathingRouteWithProgress() {
  const navigate = useNavigate()

  const handleComplete = () => {
    // Navigate back to check-in flow after breathing exercise, marking it complete
    navigate('/child/check-in?from=breathing&completed=true')
  }

  const handleExit = (reason: 'skip' | 'close') => {
    if (reason === 'skip') {
      // If skipped, advance directly to mood meter
      navigate('/child/tools/mood-meter')
    } else {
      // If closed, go back to home
      navigate('/child/home')
    }
  }

  const handleClose = () => {
    navigate('/child/home')
  }

  return (
    <>
      <TitleHeader onClose={handleClose} />
      <div className="pt-24"> {/* Add padding to account for fixed header */}
        {/* Centered title like mood meter */}
        <div className="text-center" style={{ marginBottom: '2rem' }}>
          <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>Breathing Exercise</h1>
        </div>

        <BreathingCircles
          cycles={5}
          muted={false} // Default to sound on for child experience
          captions={true}
          hideHeader={true}
          onComplete={handleComplete}
          onExit={handleExit}
        />
      </div>
    </>
  )
}