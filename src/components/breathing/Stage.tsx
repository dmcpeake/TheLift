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
        // Balloon breathing (default circle animation) - with radiating rings
        return (
          <div className="breathing-circle-container">

            {/* Progress ring for breathing progress */}
            <svg className="progress-ring" viewBox="-10 -10 420 420" style={{ animation: 'none', overflow: 'visible' }}>
              <defs>
                <linearGradient id="progressGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                  <stop offset="0%" stopColor="rgba(59, 130, 246, 0.8)" />
                  <stop offset="50%" stopColor="rgba(218, 131, 109, 0.8)" />
                  <stop offset="100%" stopColor="rgba(236, 72, 153, 0.8)" />
                </linearGradient>
                <filter id="dotShadow" x="-50%" y="-50%" width="200%" height="200%">
                  <feDropShadow dx="0" dy="2" stdDeviation="2" floodOpacity="0.3"/>
                </filter>
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

              {/* Cycle separators - white circles marking each breath cycle start - only show when breathing */}
              {isBreathingPhase && (
                <>
                  {/* The progress ring is rotated -90deg in CSS, so dots align with the rotated progress */}
                  {/* For 3 cycles: dots at 0%, 33.33%, and 66.67% of the circle */}

                  {/* Cycle 1 start: Top (0% - start position after rotation) */}
                  <circle
                    cx="380"
                    cy="200"
                    r="7"
                    fill="white"
                    stroke="#e87e67"
                    strokeWidth="2"
                    style={{
                      filter: 'drop-shadow(0px -2px 4px rgba(0,0,0,0.15))'
                    }}
                  />
                  {/* Cycle 2 start: 1/3 around (33.33% position) */}
                  <circle
                    cx={200 + 180 * Math.cos((2 * Math.PI * 1) / 3)}
                    cy={200 + 180 * Math.sin((2 * Math.PI * 1) / 3)}
                    r="7"
                    fill="white"
                    stroke="#e87e67"
                    strokeWidth="2"
                    style={{
                      filter: 'drop-shadow(0px -2px 4px rgba(0,0,0,0.15))'
                    }}
                  />
                  {/* Cycle 3 start: 2/3 around (66.67% position) */}
                  <circle
                    cx={200 + 180 * Math.cos((2 * Math.PI * 2) / 3)}
                    cy={200 + 180 * Math.sin((2 * Math.PI * 2) / 3)}
                    r="7"
                    fill="white"
                    stroke="#e87e67"
                    strokeWidth="2"
                    style={{
                      filter: 'drop-shadow(0px -2px 4px rgba(0,0,0,0.15))'
                    }}
                  />
                </>
              )}
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
                borderRadius: '50%',
                position: 'relative',
                zIndex: 10
              }}
            >
              {/* Colored radiating rings INSIDE the balloon */}
              {(isBreathingPhase || phase === 'intro') && (
                <>
                  {/* Inner core ring 1 - smallest, brightest */}
                  <div
                    style={{
                      position: 'absolute',
                      top: '50%',
                      left: '50%',
                      width: '80px',
                      height: '80px',
                      borderRadius: '50%',
                      background: 'radial-gradient(circle, rgba(255, 204, 0, 0.8) 0%, rgba(255, 204, 0, 0.4) 100%)',
                      transform: 'translate(-50%, -50%)',
                      animation: phase === 'intro' ? 'none' : `${phase === 'inhale' ? 'pulseRing1' : phase === 'exhale' ? 'pulseRing1Reverse' : 'none'} ${phase === 'inhale' ? pace.in : pace.out}s ease-in-out`,
                      zIndex: 3
                    }}
                  />
                  {/* Inner core ring 2 - medium */}
                  <div
                    style={{
                      position: 'absolute',
                      top: '50%',
                      left: '50%',
                      width: '160px',
                      height: '160px',
                      borderRadius: '50%',
                      background: 'radial-gradient(circle, rgba(255, 140, 0, 0.6) 0%, rgba(255, 140, 0, 0.2) 100%)',
                      transform: 'translate(-50%, -50%)',
                      animation: phase === 'intro' ? 'none' : `${phase === 'inhale' ? 'pulseRing2' : phase === 'exhale' ? 'pulseRing2Reverse' : 'none'} ${phase === 'inhale' ? pace.in : pace.out}s ease-in-out`,
                      animationDelay: '0.2s',
                      zIndex: 2
                    }}
                  />
                  {/* Inner core ring 3 - largest */}
                  <div
                    style={{
                      position: 'absolute',
                      top: '50%',
                      left: '50%',
                      width: '240px',
                      height: '240px',
                      borderRadius: '50%',
                      background: 'radial-gradient(circle, rgba(255, 69, 0, 0.4) 0%, rgba(255, 69, 0, 0.1) 100%)',
                      transform: 'translate(-50%, -50%)',
                      animation: phase === 'intro' ? 'none' : `${phase === 'inhale' ? 'pulseRing3' : phase === 'exhale' ? 'pulseRing3Reverse' : 'none'} ${phase === 'inhale' ? pace.in : pace.out}s ease-in-out`,
                      animationDelay: '0.4s',
                      zIndex: 1
                    }}
                  />
                </>
              )}

              <div className="breathing-text" style={{
                position: 'relative',
                zIndex: 5,
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                justifyContent: 'center',
                height: '100%'
              }}>
                <h2 className="breathing-instruction" style={{
                  fontSize: getInstructionText().title === "Let's breathe!" ? '20px' : undefined,
                  fontWeight: getInstructionText().title === "Let's breathe!" ? 'bold' : undefined,
                  margin: 0
                }}>{getInstructionText().title}</h2>
                {getInstructionText().subtitle && (
                  <p className="breathing-subtitle" style={{ fontSize: '16px', opacity: 0.8 }}>
                    {getInstructionText().subtitle}
                  </p>
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
        @keyframes pulseRing1 {
          0% {
            transform: translate(-50%, -50%) scale(0.8);
            opacity: 0.2;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.2);
            opacity: 0.6;
          }
          100% {
            transform: translate(-50%, -50%) scale(1.4);
            opacity: 0.1;
          }
        }

        @keyframes pulseRing1Reverse {
          0% {
            transform: translate(-50%, -50%) scale(1.4);
            opacity: 0.1;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.2);
            opacity: 0.6;
          }
          100% {
            transform: translate(-50%, -50%) scale(0.8);
            opacity: 0.2;
          }
        }

        @keyframes pulseRing2 {
          0% {
            transform: translate(-50%, -50%) scale(0.9);
            opacity: 0.15;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.3);
            opacity: 0.5;
          }
          100% {
            transform: translate(-50%, -50%) scale(1.5);
            opacity: 0.05;
          }
        }

        @keyframes pulseRing2Reverse {
          0% {
            transform: translate(-50%, -50%) scale(1.5);
            opacity: 0.05;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.3);
            opacity: 0.5;
          }
          100% {
            transform: translate(-50%, -50%) scale(0.9);
            opacity: 0.15;
          }
        }

        @keyframes pulseRing3 {
          0% {
            transform: translate(-50%, -50%) scale(1);
            opacity: 0.1;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.4);
            opacity: 0.4;
          }
          100% {
            transform: translate(-50%, -50%) scale(1.6);
            opacity: 0;
          }
        }

        @keyframes pulseRing3Reverse {
          0% {
            transform: translate(-50%, -50%) scale(1.6);
            opacity: 0;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.4);
            opacity: 0.4;
          }
          100% {
            transform: translate(-50%, -50%) scale(1);
            opacity: 0.1;
          }
        }

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