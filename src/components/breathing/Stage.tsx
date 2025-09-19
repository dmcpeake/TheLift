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
  const [showBlurredEffects, setShowBlurredEffects] = useState(false)

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

  // Show blurred effects after a delay when breathing starts
  useEffect(() => {
    if (phase === 'intro' || phase === 'complete') {
      setShowBlurredEffects(false)
    } else if (['inhale', 'hold', 'exhale', 'holdAfter'].includes(phase)) {
      // Delay the blurred effects until after circle and ring have transitioned
      const timer = setTimeout(() => {
        setShowBlurredEffects(true)
      }, 1000) // 1 second delay to let circle/ring transition complete

      return () => clearTimeout(timer)
    }
  }, [phase])

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
        return { title: "", subtitle: 'Tap play to begin' }
      case 'inhale':
        return { title: 'Breathe in', subtitle: null }
      case 'hold':
        return { title: 'Hold', subtitle: null }
      case 'exhale':
        return { title: 'Breathe out', subtitle: null }
      case 'complete':
        return { title: 'Well done!', subtitle: null }
      default:
        return { title: 'Breathe', subtitle: null }
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
            {/* Dashed outer circle - positioned to match orange progress ring exactly */}
            <div
              className="breathing-outer-ring absolute"
              style={{
                width: '435px',
                height: '435px',
                top: '50%',
                left: '50%',
                transform: 'translate(-50%, -50%)',
                zIndex: 2
              }}
            >
              <div
                className="opacity-20"
                style={{
                  width: '100%',
                  height: '100%',
                  borderRadius: '50%',
                  border: '3px dashed #e6b6b6',
                  animation: 'spin 120s linear infinite'
                }}
              />
            </div>

            {/* Progress ring for breathing progress */}
            <svg className="progress-ring" viewBox="0 0 400 400" style={{ animation: 'none' }}>
              <defs>
                <linearGradient id="progressGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                  <stop offset="0%" stopColor="rgba(59, 130, 246, 0.8)" />
                  <stop offset="50%" stopColor="rgba(218, 131, 109, 0.8)" />
                  <stop offset="100%" stopColor="rgba(236, 72, 153, 0.8)" />
                </linearGradient>
              </defs>
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
              className={`${highContrast ? 'breathing-circle high-contrast' : circleClass} ${phase === 'intro' ? 'waiting' : ''}`}
              style={{
                transitionProperty: 'transform, background',
                transitionDuration: phase === 'intro' ? '0s' : `${
                  phase === 'inhale' ? pace.in :
                  phase === 'hold' ? pace.hold :
                  phase === 'exhale' ? pace.out :
                  4
                }s`,
                transitionTimingFunction: 'linear',
                borderRadius: '50%'
              }}
            >
              <div className="breathing-text">
                <h2 className="breathing-instruction" style={{ fontSize: getInstructionText().title === "Let's breathe!" ? '20px' : undefined, fontWeight: getInstructionText().title === "Let's breathe!" ? 'bold' : undefined }}>{getInstructionText().title}</h2>
                {getInstructionText().subtitle && (
                  <p className="breathing-subtitle" style={{ fontSize: '16px', opacity: 0.8, marginTop: '8px' }}>
                    {getInstructionText().subtitle}
                  </p>
                )}
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
      {/* Large animated color shapes radiating from breathing circle center */}
      <div
        style={{
          position: 'absolute',
          top: '50%',
          left: '50%',
          width: '300px',
          height: '300px',
          borderRadius: '50%',
          background: 'radial-gradient(circle, rgba(255, 215, 0, 1.0) 0%, rgba(255, 215, 0, 0.6) 70%)',
          filter: 'blur(30px)',
          zIndex: 1,
          animation: 'radiate1 4s ease-in-out infinite',
          transform: 'translate(-50%, -50%)',
          opacity: showBlurredEffects ? 1 : 0,
          transition: 'opacity 2s ease-in-out'
        }}
      />
      <div
        style={{
          position: 'absolute',
          top: '50%',
          left: '50%',
          width: '375px',
          height: '225px',
          borderRadius: '50%',
          background: 'radial-gradient(ellipse, rgba(255, 140, 0, 0.9) 0%, rgba(255, 140, 0, 0.4) 80%)',
          filter: 'blur(38px)',
          zIndex: 2,
          animation: 'radiate2 5s ease-in-out infinite 1s',
          transform: 'translate(-50%, -50%)',
          opacity: showBlurredEffects ? 1 : 0,
          transition: 'opacity 2s ease-in-out'
        }}
      />
      <div
        style={{
          position: 'absolute',
          top: '50%',
          left: '50%',
          width: '450px',
          height: '450px',
          borderRadius: '50%',
          background: 'radial-gradient(circle, rgba(255, 69, 0, 1.0) 0%, rgba(255, 69, 0, 0.5) 60%)',
          filter: 'blur(45px)',
          zIndex: 1,
          animation: 'radiate3 6s ease-in-out infinite 2s',
          transform: 'translate(-50%, -50%)',
          opacity: showBlurredEffects ? 1 : 0,
          transition: 'opacity 2s ease-in-out'
        }}
      />
      {renderAnimation()}

      <style jsx>{`
        @keyframes radiate1 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.3) translateX(0px) translateY(0px);
            opacity: 0.9;
          }
          25% {
            transform: translate(-50%, -50%) scale(0.9) translateX(23px) translateY(-15px);
            opacity: 0.6;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.5) translateX(-30px) translateY(23px);
            opacity: 0.3;
          }
          75% {
            transform: translate(-50%, -50%) scale(1.2) translateX(45px) translateY(30px);
            opacity: 0.5;
          }
        }

        @keyframes radiate2 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.4) translateX(0px) translateY(0px);
            opacity: 0.8;
          }
          30% {
            transform: translate(-50%, -50%) scale(1.1) translateX(-38px) translateY(23px);
            opacity: 0.5;
          }
          60% {
            transform: translate(-50%, -50%) scale(1.6) translateX(30px) translateY(-38px);
            opacity: 0.2;
          }
          90% {
            transform: translate(-50%, -50%) scale(0.9) translateX(53px) translateY(45px);
            opacity: 0.6;
          }
        }

        @keyframes radiate3 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.2) translateX(0px) translateY(0px);
            opacity: 1.0;
          }
          20% {
            transform: translate(-50%, -50%) scale(0.8) translateX(45px) translateY(-30px);
            opacity: 0.7;
          }
          40% {
            transform: translate(-50%, -50%) scale(1.3) translateX(-53px) translateY(45px);
            opacity: 0.4;
          }
          80% {
            transform: translate(-50%, -50%) scale(1.7) translateX(38px) translateY(60px);
            opacity: 0.1;
          }
        }
      `}</style>
    </div>
  )
}