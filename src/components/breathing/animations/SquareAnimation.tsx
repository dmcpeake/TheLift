import React, { useEffect, useState } from 'react'
import { Phase, Pace } from '../types'

interface SquareAnimationProps {
  phase: Phase
  pace: Pace
  cycle: number
  totalCycles: number
}

export function SquareAnimation({ phase, pace, cycle, totalCycles }: SquareAnimationProps) {
  const [animationKey, setAnimationKey] = useState(0)
  const [shouldAnimate, setShouldAnimate] = useState(false)
  const [currentScale, setCurrentScale] = useState(0.85)

  // Start animation when breathing begins
  useEffect(() => {
    if (phase === 'inhale' && !shouldAnimate) {
      setShouldAnimate(true)
      setAnimationKey(prev => prev + 1)
    }
  }, [phase, shouldAnimate])

  // Reset animation whenever cycle changes
  useEffect(() => {
    if (shouldAnimate) {
      setAnimationKey(prev => prev + 1)
    }
  }, [cycle, shouldAnimate])

  // Handle scale transitions with proper timing
  useEffect(() => {
    let timeoutId: NodeJS.Timeout

    // Check if we're on mobile
    const isMobile = window.innerWidth <= 768
    const inhaleScale = isMobile ? 1.0 : 1.1
    const restScale = isMobile ? 0.8 : 0.85

    switch (phase) {
      case 'inhale':
        // Start at current scale, then transition to inhale scale
        timeoutId = setTimeout(() => setCurrentScale(inhaleScale), 50)
        break
      case 'hold':
        // Stay at inhaled state
        setCurrentScale(inhaleScale)
        break
      case 'exhale':
        // Start at inhale scale, then transition to rest scale
        timeoutId = setTimeout(() => setCurrentScale(restScale), 50)
        break
      case 'holdAfter':
        // Stay at rest scale (exhaled state)
        setCurrentScale(restScale)
        break
      default:
        setCurrentScale(restScale)
    }

    return () => {
      if (timeoutId) clearTimeout(timeoutId)
    }
  }, [phase])

  const squareSize = 280
  const mobileSquareSize = 224 // 20% smaller for mobile
  const strokeWidth = 12
  
  // Get total duration for one complete cycle
  const totalDuration = pace.in + pace.hold + pace.out + (pace.holdAfter || 0)

  const getInstructionText = () => {
    switch (phase) {
      case 'intro': return { title: "", subtitle: 'Tap play to begin' }
      case 'inhale': return { title: 'Inhale', subtitle: null }
      case 'hold': return { title: 'Hold', subtitle: null }
      case 'exhale': return { title: 'Exhale', subtitle: null }
      case 'holdAfter': return { title: 'Hold', subtitle: null }
      case 'complete': return { title: 'Well done!', subtitle: null }
      default: return { title: 'Breathe', subtitle: null }
    }
  }

  return (
    <div className="breathing-square-container" style={{
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      width: '480px',
      height: '480px',
      position: 'relative',
      zIndex: 10
    }}>
      <svg
        className="breathing-square-svg"
        width="480"
        height="480"
        viewBox="0 0 480 480"
        style={{ position: 'absolute', zIndex: 15 }}
      >
        {/* Background white square - animated with breathing */}
        <g className="breathing-square-inner">
          <rect
            x="100"
            y="100"
            width={squareSize}
            height={squareSize}
            rx="20"
            fill="white"
            stroke="none"
            style={{
              transformOrigin: '240px 240px',
              transform: `scale(${currentScale})`,
              animation: phase === 'intro' ? 'squareWaiting 4s ease-in-out infinite' : 'none',
              transition: phase === 'intro' ? 'none' : `transform ${
                phase === 'inhale' ? pace.in :
                phase === 'hold' ? 0 :
                phase === 'exhale' ? pace.out :
                phase === 'holdAfter' ? 0 :
                0.5
              }s linear`
            }}
          />
        </g>


        {/* Animated line that traces around the outer square - orange without glow */}
        {shouldAnimate && (
          <rect
            key={animationKey}
            x="60"
            y="60"
            width={squareSize + 80}
            height={squareSize + 80}
            rx="30"
            fill="none"
            stroke="#e87e67"
            strokeWidth={strokeWidth}
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeDasharray={`${(squareSize + 80) * 4} ${(squareSize + 80) * 4}`}
            strokeDashoffset={(squareSize + 80) * 4}
            style={{
              animation: `traceSquare ${totalDuration}s linear forwards`
            }}
          />
        )}
      </svg>

      {/* CSS Animation */}
      <style jsx>{`
        @media (max-width: 768px) {
          .breathing-square-svg {
            width: 100% !important;
            height: 100% !important;
          }
          .breathing-square-inner {
            transform-origin: 240px 240px;
            transform: scale(0.8);
          }
        }
        @keyframes traceSquare {
          to {
            stroke-dashoffset: 0;
          }
        }

        @keyframes squareWaiting {
          0%, 100% {
            transform: scale(1);
          }
          50% {
            transform: scale(1.05);
          }
        }
      `}</style>

      {/* Center text */}
      <div style={{
        position: 'relative',
        zIndex: 20,
        textAlign: 'center',
        padding: '2rem'
      }}>
        <h2 style={{
          fontSize: getInstructionText().title === "Let's breathe!" ? '20px' : '16px',
          fontWeight: getInstructionText().title === "Let's breathe!" ? 'bold' : '400',
          color: '#1f2937',
          marginBottom: '0.5rem'
        }}>
          {getInstructionText().title}
        </h2>
        {getInstructionText().subtitle && (
          <p style={{
            fontSize: '16px',
            opacity: 0.8,
            marginTop: '8px',
            color: '#1f2937'
          }}>
            {getInstructionText().subtitle}
          </p>
        )}
        {['inhale', 'hold', 'exhale', 'holdAfter'].includes(phase) && (
          <p style={{
            fontSize: '0.9rem',
            fontWeight: '500',
            color: '#6b7280'
          }}>
            {cycle} of {totalCycles}
          </p>
        )}
      </div>
    </div>
  )
}