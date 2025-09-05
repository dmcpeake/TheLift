import React, { useEffect, useState } from 'react'
import { Phase, Pace } from '../types'

interface RainbowAnimationProps {
  phase: Phase
  pace: Pace
  cycle: number
  totalCycles: number
}

export function RainbowAnimation({ phase, pace, cycle, totalCycles }: RainbowAnimationProps) {
  const [progress, setProgress] = useState(0)
  const [rainbowOpacity, setRainbowOpacity] = useState(0)
  const [visibleArcs, setVisibleArcs] = useState<boolean[]>(new Array(7).fill(false))

  const rainbowColors = [
    '#ef4444', // Red
    '#f97316', // Orange
    '#fbbf24', // Yellow
    '#84cc16', // Green
    '#06b6d4', // Cyan
    '#6366f1', // Indigo
    '#a855f7', // Purple
  ]

  useEffect(() => {
    if (phase === 'inhale') {
      // Build up rainbow arcs sequentially during inhale
      setVisibleArcs(new Array(7).fill(false))
      
      // Animate each arc appearing one by one
      const arcDelay = (pace.in * 1000) / rainbowColors.length
      rainbowColors.forEach((_, index) => {
        setTimeout(() => {
          setVisibleArcs(prev => {
            const newArcs = [...prev]
            newArcs[index] = true
            return newArcs
          })
        }, index * arcDelay)
      })
    } else if (phase === 'hold') {
      // Keep all arcs visible during hold
      setVisibleArcs(new Array(7).fill(true))
    } else if (phase === 'exhale') {
      // Fade out arcs during exhale
      setVisibleArcs(new Array(7).fill(false))
    } else {
      // Reset for other phases
      setVisibleArcs(new Array(7).fill(false))
    }
  }, [phase, pace])

  const getInstructionText = () => {
    switch (phase) {
      case 'intro':
        return 'tap start'
      case 'inhale':
        return 'breathe in colors'
      case 'hold':
        return 'hold the rainbow'
      case 'exhale':
        return 'let colors flow out'
      case 'complete':
        return 'beautiful!'
      default:
        return 'breathe'
    }
  }

  const centerX = 240
  const centerY = 380
  const baseRadius = 100

  return (
    <div className="breathing-rainbow-container" style={{
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
        {/* Cloud bases */}
        <ellipse cx="120" cy="380" rx="60" ry="30" fill="rgba(255, 255, 255, 0.8)" />
        <ellipse cx="360" cy="380" rx="60" ry="30" fill="rgba(255, 255, 255, 0.8)" />
        
        {/* Rainbow arcs */}
        {rainbowColors.map((color, index) => {
          const radius = baseRadius + index * 20
          const strokeWidth = 18
          const isVisible = visibleArcs[index]
          
          return (
            <path
              key={index}
              d={`M ${centerX - radius} ${centerY} A ${radius} ${radius} 0 0 1 ${centerX + radius} ${centerY}`}
              fill="none"
              stroke={color}
              strokeWidth={strokeWidth}
              strokeLinecap="round"
              opacity={isVisible ? 0.9 : 0}
              style={{
                transition: `opacity ${
                  phase === 'inhale' ? (pace.in / rainbowColors.length) :
                  phase === 'exhale' ? pace.out :
                  0.3
                }s ease-out`,
                filter: isVisible ? `drop-shadow(0 0 15px ${color}40)` : 'none'
              }}
            />
          )
        })}

        {/* Sparkles */}
        {visibleArcs.map((isVisible, index) => isVisible && (
          <g key={`sparkle-${index}`}>
            <circle
              cx={centerX - baseRadius - index * 20 + Math.cos(index) * 15}
              cy={centerY - 30 + Math.sin(index) * 10}
              r="2"
              fill="white"
              opacity={0.8}
              style={{
                animation: 'twinkle 2s infinite',
                animationDelay: `${index * 0.3}s`
              }}
            />
            <circle
              cx={centerX + baseRadius + index * 20 + Math.cos(index + 1) * 15}
              cy={centerY - 30 + Math.sin(index + 1) * 10}
              r="2"
              fill="white"
              opacity={0.8}
              style={{
                animation: 'twinkle 2s infinite',
                animationDelay: `${index * 0.3 + 1}s`
              }}
            />
          </g>
        ))}
      </svg>

      {/* Center text */}
      <div style={{
        position: 'relative',
        zIndex: 10,
        textAlign: 'center',
        padding: '2rem',
        marginTop: '-100px'
      }}>
        <h2 style={{
          fontSize: '1.8rem',
          fontWeight: '600',
          background: visibleArcs.some(v => v)
            ? `linear-gradient(90deg, ${rainbowColors.filter((_, i) => visibleArcs[i]).join(', ')})`
            : 'linear-gradient(90deg, #1f2937, #1f2937)',
          backgroundClip: 'text',
          WebkitBackgroundClip: 'text',
          WebkitTextFillColor: 'transparent',
          marginBottom: '0.5rem',
          transition: 'all 0.3s ease'
        }}>
          {getInstructionText()}
        </h2>
        {['inhale', 'hold', 'exhale'].includes(phase) && (
          <p style={{
            fontSize: '0.9rem',
            fontWeight: '500',
            color: '#6b7280'
          }}>
            color {cycle} of {totalCycles}
          </p>
        )}
      </div>

      <style jsx>{`
        @keyframes twinkle {
          0%, 100% { transform: scale(1); opacity: 0.8; }
          50% { transform: scale(1.2); opacity: 1; }
        }
      `}</style>
    </div>
  )
}