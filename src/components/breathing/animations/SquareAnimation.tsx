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

  const squareSize = 280
  const strokeWidth = 12
  
  // Get total duration for one complete cycle
  const totalDuration = pace.in + pace.hold + pace.out + (pace.holdAfter || 0)

  const getInstructionText = () => {
    switch (phase) {
      case 'intro': return 'tap start'
      case 'inhale': return 'breathe in'
      case 'hold': return 'hold'
      case 'exhale': return 'breathe out'
      case 'holdAfter': return 'hold'
      case 'complete': return 'well done!'
      default: return 'breathe'
    }
  }

  return (
    <div className="breathing-square-container" style={{
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      width: '480px',
      height: '480px',
      position: 'relative'
    }}>
      <svg
        width="480"
        height="480"
        viewBox="0 0 480 480"
        style={{ position: 'absolute' }}
      >
        <defs>
          <linearGradient id="squareGradient" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stopColor="#3b82f6" />
            <stop offset="25%" stopColor="#10b981" />
            <stop offset="50%" stopColor="#f59e0b" />
            <stop offset="75%" stopColor="#ef4444" />
            <stop offset="100%" stopColor="#8b5cf6" />
          </linearGradient>
        </defs>

        {/* Background white square */}
        <rect
          x="100"
          y="100"
          width={squareSize}
          height={squareSize}
          rx="20"
          fill="rgba(255, 255, 255, 0.95)"
          stroke="none"
        />

        {/* Dotted outline square - 40px gap from white box */}
        <rect
          x="60"
          y="60"
          width={squareSize + 80}
          height={squareSize + 80}
          rx="30"
          fill="none"
          stroke="rgba(255, 255, 255, 0.25)"
          strokeWidth="8"
          strokeDasharray="12 6"
        />

        {/* Animated line that traces around the outer square - only show when breathing */}
        {shouldAnimate && (
          <rect
            key={animationKey}
            x="60"
            y="60"
            width={squareSize + 80}
            height={squareSize + 80}
            rx="30"
            fill="none"
            stroke="url(#squareGradient)"
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
        @keyframes traceSquare {
          to {
            stroke-dashoffset: 0;
          }
        }
      `}</style>

      {/* Center text */}
      <div style={{
        position: 'relative',
        zIndex: 10,
        textAlign: 'center',
        padding: '2rem'
      }}>
        <h2 style={{
          fontSize: '1.8rem',
          fontWeight: '600',
          color: '#1f2937',
          marginBottom: '0.5rem'
        }}>
          {getInstructionText()}
        </h2>
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