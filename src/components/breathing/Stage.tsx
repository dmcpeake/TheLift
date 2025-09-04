import React, { useEffect, useState } from 'react'
import { Phase, Pace } from './types'

interface StageProps {
  phase: Phase
  cycle: number
  totalCycles: number
  pace: Pace
  reducedMotion: boolean
  captions: boolean
  highContrast: boolean
}

export function Stage({
  phase,
  cycle,
  totalCycles,
  pace,
  reducedMotion,
  captions,
  highContrast
}: StageProps) {
  const [circleClass, setCircleClass] = useState('')

  // Update circle class based on phase
  useEffect(() => {
    switch (phase) {
      case 'inhale':
        setCircleClass('breathing-circle inhale')
        break
      case 'hold':
        setCircleClass('breathing-circle hold')
        break
      case 'exhale':
        setCircleClass('breathing-circle exhale')
        break
      default:
        setCircleClass('breathing-circle')
    }
  }, [phase])

  // Get instruction text for inside the circle
  const getInstructionText = () => {
    switch (phase) {
      case 'intro':
        return 'get ready'
      case 'instruction':
        return 'follow the circle'
      case 'inhale':
        return 'breathe in'
      case 'hold':
        return 'hold'
      case 'exhale':
        return 'breathe out'
      case 'complete':
        return 'well done!'
      default:
        return 'breathe'
    }
  }

  // Calculate progress for the outer ring
  const getProgressPercent = () => {
    const totalPhases = totalCycles * 3 // inhale, hold, exhale per cycle
    const currentPhaseIndex = ((cycle - 1) * 3) + 
      (phase === 'inhale' ? 0 : phase === 'hold' ? 1 : phase === 'exhale' ? 2 : 0)
    return (currentPhaseIndex / totalPhases) * 100
  }

  const isBreathingPhase = ['inhale', 'hold', 'exhale'].includes(phase)
  const circumference = 2 * Math.PI * 180 // radius = 180
  const strokeDashoffset = circumference - (getProgressPercent() / 100) * circumference

  return (
    <div className="breathing-stage">
      <div className="breathing-circle-container">
        
        {/* Outer progress ring */}
        {isBreathingPhase && (
          <svg className="progress-ring" viewBox="0 0 400 400">
            <defs>
              <linearGradient id="progressGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" stopColor="rgba(59, 130, 246, 0.8)" />
                <stop offset="50%" stopColor="rgba(147, 51, 234, 0.8)" />
                <stop offset="100%" stopColor="rgba(236, 72, 153, 0.8)" />
              </linearGradient>
            </defs>
            {/* Background ring */}
            <circle
              className="progress-ring-bg"
              cx="200"
              cy="200"
              r="180"
            />
            {/* Progress ring */}
            <circle
              className="progress-ring-progress"
              cx="200"
              cy="200"
              r="180"
              style={{
                strokeDasharray: circumference,
                strokeDashoffset: strokeDashoffset
              }}
            />
          </svg>
        )}

        {/* Inner white circle */}
        <div className={highContrast ? 'breathing-circle high-contrast' : circleClass}>
          {/* Text inside circle */}
          <div className="breathing-text">
            <h2 className="breathing-instruction">
              {getInstructionText()}
            </h2>
            {isBreathingPhase && (
              <p className="breathing-counter">
                {cycle} of {totalCycles}
              </p>
            )}
          </div>
        </div>
      </div>

      {/* Phase instruction below (if needed) */}
      {captions && phase === 'instruction' && (
        <div style={{ marginTop: '2rem', textAlign: 'center', maxWidth: '28rem' }}>
          <p style={{ 
            fontSize: '1.25rem', 
            fontWeight: '300',
            color: highContrast ? 'white' : 'rgba(255, 255, 255, 0.8)',
            lineHeight: '1.6'
          }}>
            Watch the circle grow as you breathe in,
            <br />
            and shrink as you breathe out
          </p>
        </div>
      )}
    </div>
  )
}