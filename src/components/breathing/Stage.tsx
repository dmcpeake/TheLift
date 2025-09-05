import React, { useEffect, useState } from 'react'
import { Phase, Pace, BreathingTechnique } from './types'
import { SquareAnimation } from './animations/SquareAnimation'
import { RainbowAnimation } from './animations/RainbowAnimation'
import { FlowerAnimation } from './animations/FlowerAnimation'

interface StageProps {
  phase: Phase
  cycle: number
  totalCycles: number
  pace: Pace
  technique?: BreathingTechnique
  reducedMotion: boolean
  captions: boolean
  highContrast: boolean
}

export function Stage({
  phase,
  cycle,
  totalCycles,
  pace,
  technique,
  reducedMotion,
  captions,
  highContrast
}: StageProps) {
  const [circleClass, setCircleClass] = useState('')
  const [phaseProgress, setPhaseProgress] = useState(0)

  // Update circle class and transition duration based on phase
  useEffect(() => {
    const getDuration = () => {
      switch (phase) {
        case 'inhale': return pace.in
        case 'hold': return pace.hold
        case 'exhale': return pace.out
        default: return 4
      }
    }

    const duration = getDuration()
    
    switch (phase) {
      case 'inhale':
        setCircleClass(`breathing-circle inhale`)
        break
      case 'hold':
        setCircleClass(`breathing-circle hold`)
        break
      case 'exhale':
        setCircleClass(`breathing-circle exhale`)
        break
      default:
        setCircleClass('breathing-circle')
    }
  }, [phase, pace])

  // Animate progress within each phase
  useEffect(() => {
    if (!['inhale', 'hold', 'exhale'].includes(phase)) {
      setPhaseProgress(0)
      return
    }

    setPhaseProgress(0)
    const duration = phase === 'inhale' ? pace.in : 
                    phase === 'hold' ? pace.hold : 
                    pace.out
    
    // Start the progress animation
    const timer = setTimeout(() => {
      setPhaseProgress(1)
    }, 50) // Small delay to ensure transition starts

    return () => clearTimeout(timer)
  }, [phase, pace])

  // Get instruction text for inside the circle
  const getInstructionText = () => {
    switch (phase) {
      case 'intro':
        return 'tap start'
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

  // Calculate progress for the outer ring based on time
  const getProgressPercent = () => {
    if (!['inhale', 'hold', 'exhale'].includes(phase)) return 0
    
    const totalDurationPerCycle = pace.in + pace.hold + pace.out
    const totalDuration = totalCycles * totalDurationPerCycle
    
    const completedCycles = cycle - 1
    const completedDuration = completedCycles * totalDurationPerCycle
    
    let currentPhaseDuration = 0
    let currentPhaseMaxDuration = 0
    
    switch (phase) {
      case 'inhale':
        currentPhaseDuration = 0
        currentPhaseMaxDuration = pace.in
        break
      case 'hold':
        currentPhaseDuration = pace.in
        currentPhaseMaxDuration = pace.hold
        break
      case 'exhale':
        currentPhaseDuration = pace.in + pace.hold
        currentPhaseMaxDuration = pace.out
        break
    }
    
    // Add the progress within the current phase
    const currentPhaseProgressDuration = currentPhaseMaxDuration * phaseProgress
    const totalProgress = completedDuration + currentPhaseDuration + currentPhaseProgressDuration
    
    return Math.min((totalProgress / totalDuration) * 100, 100)
  }

  const isBreathingPhase = ['inhale', 'hold', 'exhale', 'holdAfter'].includes(phase)
  const circumference = 2 * Math.PI * 180 // radius = 180
  const strokeDashoffset = circumference - (getProgressPercent() / 100) * circumference

  // Render technique-specific animation
  const renderAnimation = () => {
    const techniqueId = technique?.id || 'balloon'
    
    switch (techniqueId) {
      case 'square':
        return (
          <SquareAnimation
            phase={phase}
            pace={pace}
            cycle={cycle}
            totalCycles={totalCycles}
          />
        )
      case 'rainbow':
        return (
          <RainbowAnimation
            phase={phase}
            pace={pace}
            cycle={cycle}
            totalCycles={totalCycles}
          />
        )
      case 'flower':
        return (
          <FlowerAnimation
            phase={phase}
            pace={pace}
            cycle={cycle}
            totalCycles={totalCycles}
          />
        )
      default:
        // Balloon breathing (default circle animation)
        return (
          <div className="breathing-circle-container">
            {/* Outer progress ring - always visible */}
            <svg className="progress-ring" viewBox="0 0 400 400">
              <defs>
                <linearGradient id="progressGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                  <stop offset="0%" stopColor="rgba(59, 130, 246, 0.8)" />
                  <stop offset="50%" stopColor="rgba(147, 51, 234, 0.8)" />
                  <stop offset="100%" stopColor="rgba(236, 72, 153, 0.8)" />
                </linearGradient>
              </defs>
              <circle className="progress-ring-bg" cx="200" cy="200" r="180" />
              <circle
                className="progress-ring-progress"
                cx="200"
                cy="200"
                r="180"
                style={{
                  strokeDasharray: circumference,
                  strokeDashoffset: strokeDashoffset,
                  transitionDuration: `${
                    phase === 'inhale' ? pace.in :
                    phase === 'hold' ? pace.hold :
                    phase === 'exhale' ? pace.out :
                    4
                  }s`,
                  transitionTimingFunction: 'linear'
                }}
              />
            </svg>

            {/* Inner balloon circle */}
            <div 
              className={highContrast ? 'breathing-circle high-contrast' : circleClass}
              style={{
                transitionProperty: 'transform, background',
                transitionDuration: `${
                  phase === 'inhale' ? pace.in :
                  phase === 'hold' ? pace.hold :
                  phase === 'exhale' ? pace.out :
                  4
                }s`,
                transitionTimingFunction: 'cubic-bezier(0.25, 0.8, 0.25, 1)',
                borderRadius: '50%'
              }}
            >
              <div className="breathing-text">
                <h2 className="breathing-instruction">{getInstructionText()}</h2>
                {isBreathingPhase && (
                  <p className="breathing-counter">{cycle} of {totalCycles}</p>
                )}
              </div>
            </div>
          </div>
        )
    }
  }

  return (
    <div className="breathing-stage">
      {renderAnimation()}
    </div>
  )
}