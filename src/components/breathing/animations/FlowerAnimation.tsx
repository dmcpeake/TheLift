import React, { useEffect, useState } from 'react'
import { Phase, Pace } from '../types'

interface FlowerAnimationProps {
  phase: Phase
  pace: Pace
  cycle: number
  totalCycles: number
}

export function FlowerAnimation({ phase, pace, cycle, totalCycles }: FlowerAnimationProps) {
  const [petalStates, setPetalStates] = useState<Array<'attached' | 'falling' | 'returning'>>
    (new Array(8).fill('attached'))
  const [centerScale, setCenterScale] = useState(1)

  const petalCount = 8
  const centerRadius = 40
  const petalLength = 60
  const petalWidth = 45

  useEffect(() => {
    if (phase === 'inhale') {
      // Petals return and flower grows
      setPetalStates(new Array(8).fill('returning'))
      setCenterScale(1.2)
      setTimeout(() => {
        setPetalStates(new Array(8).fill('attached'))
      }, pace.in * 500)
    } else if (phase === 'exhale') {
      // Blow petals away
      setCenterScale(0.9)
      const interval = (pace.out * 1000) / petalCount
      let currentPetal = 0
      
      const timer = setInterval(() => {
        if (currentPetal < petalCount) {
          setPetalStates(prev => {
            const newStates = [...prev]
            newStates[currentPetal] = 'falling'
            return newStates
          })
          currentPetal++
        } else {
          clearInterval(timer)
        }
      }, interval)
      
      return () => clearInterval(timer)
    } else if (phase === 'hold') {
      setCenterScale(1.1)
    }
  }, [phase, pace])

  const getInstructionText = () => {
    switch (phase) {
      case 'intro':
        return 'tap start'
      case 'inhale':
        return 'smell the flower'
      case 'hold':
        return 'enjoy the scent'
      case 'exhale':
        return 'blow the petals'
      case 'complete':
        return 'lovely!'
      default:
        return 'breathe'
    }
  }

  const getPetalPosition = (index: number, state: string) => {
    const angle = (index * 360) / petalCount
    const radian = (angle * Math.PI) / 180
    const centerX = 150 // Center of the 300px container
    const centerY = 150
    const petalDistance = centerRadius + petalLength / 2
    
    if (state === 'falling') {
      // Petals blow away radially
      const distance = petalDistance + 100 + Math.random() * 80
      const wobble = Math.sin(Date.now() / 1000 + index) * 10
      const x = centerX + Math.cos(radian) * distance + wobble
      const y = centerY + Math.sin(radian) * distance + wobble
      return {
        left: `${x - petalWidth / 2}px`,
        top: `${y - petalLength / 2}px`,
        transform: `rotate(${angle + 180 + wobble}deg) scale(0.6)`,
        opacity: 0.2
      }
    } else if (state === 'returning') {
      // Petals coming back to position
      const x = centerX + Math.cos(radian) * (petalDistance * 1.2)
      const y = centerY + Math.sin(radian) * (petalDistance * 1.2)
      return {
        left: `${x - petalWidth / 2}px`,
        top: `${y - petalLength / 2}px`,
        transform: `rotate(${angle - 90}deg) scale(1.1)`,
        opacity: 0.8
      }
    } else {
      // Normal attached position around the center
      const x = centerX + Math.cos(radian) * petalDistance
      const y = centerY + Math.sin(radian) * petalDistance
      return {
        left: `${x - petalWidth / 2}px`,
        top: `${y - petalLength / 2}px`,
        transform: `rotate(${angle - 90}deg) scale(1)`,
        opacity: 1
      }
    }
  }

  return (
    <div className="breathing-flower-container" style={{
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      width: '480px',
      height: '480px',
      position: 'relative'
    }}>
      <div style={{
        position: 'absolute',
        width: '300px',
        height: '300px',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center'
      }}>
        {/* Stem */}
        <div style={{
          position: 'absolute',
          bottom: '50px',
          width: '6px',
          height: '100px',
          background: 'linear-gradient(180deg, #86efac 0%, #059669 100%)',
          borderRadius: '3px',
          transformOrigin: 'bottom',
          transform: phase === 'exhale' ? 'scaleX(0.9)' : 'scaleX(1)',
          transition: 'transform 0.3s ease'
        }} />

        {/* Leaves */}
        <div style={{
          position: 'absolute',
          bottom: '80px',
          left: '140px',
          width: '30px',
          height: '20px',
          background: '#86efac',
          borderRadius: '0 100% 0 100%',
          transform: phase === 'exhale' ? 'rotate(-10deg)' : 'rotate(0deg)',
          transition: 'transform 0.3s ease'
        }} />
        <div style={{
          position: 'absolute',
          bottom: '90px',
          right: '140px',
          width: '30px',
          height: '20px',
          background: '#86efac',
          borderRadius: '100% 0 100% 0',
          transform: phase === 'exhale' ? 'rotate(10deg)' : 'rotate(0deg)',
          transition: 'transform 0.3s ease'
        }} />

        {/* Petals */}
        {Array.from({ length: petalCount }).map((_, index) => {
          const petalPosition = getPetalPosition(index, petalStates[index])
          const petalColors = [
            ['#f472b6', '#f9a8d4'], // Pink
            ['#fbbf24', '#fde047'], // Yellow
            ['#fb7185', '#fda4af'], // Rose
            ['#a78bfa', '#c4b5fd'], // Purple
            ['#60a5fa', '#93c5fd'], // Blue
            ['#34d399', '#6ee7b7'], // Emerald
            ['#fbbf24', '#fde047'], // Yellow
            ['#f472b6', '#f9a8d4'], // Pink
          ]
          const [color1, color2] = petalColors[index] || petalColors[0]
          
          return (
            <div
              key={index}
              style={{
                position: 'absolute',
                width: `${petalWidth}px`,
                height: `${petalLength}px`,
                background: `linear-gradient(135deg, ${color1} 0%, ${color2} 100%)`,
                borderRadius: '50% 50% 50% 50% / 60% 60% 40% 40%',
                transformOrigin: 'center center',
                ...petalPosition,
                transition: `all ${petalStates[index] === 'falling' ? pace.out : pace.in}s ease-out`,
                boxShadow: '0 2px 10px rgba(0, 0, 0, 0.15)',
                zIndex: 5
              }}
            />
          )
        })}

        {/* Flower center */}
        <div style={{
          position: 'absolute',
          left: `${150 - centerRadius}px`,
          top: `${150 - centerRadius}px`,
          width: `${centerRadius * 2}px`,
          height: `${centerRadius * 2}px`,
          background: 'radial-gradient(circle, #fbbf24 0%, #f59e0b 100%)',
          borderRadius: '50%',
          transform: `scale(${centerScale})`,
          transition: 'transform 0.5s ease',
          boxShadow: '0 4px 20px rgba(251, 191, 36, 0.4)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          zIndex: 10
        }}>
          {/* Center dots for texture */}
          {Array.from({ length: 7 }).map((_, i) => (
            <div
              key={i}
              style={{
                position: 'absolute',
                width: '4px',
                height: '4px',
                background: '#92400e',
                borderRadius: '50%',
                transform: `
                  rotate(${i * 51.4}deg) 
                  translateY(${15 - Math.random() * 5}px)
                `,
                opacity: 0.6
              }}
            />
          ))}
        </div>
      </div>

      {/* Text overlay - only show during active breathing phases */}
      {['inhale', 'hold', 'exhale', 'complete'].includes(phase) && (
        <div style={{
          position: 'relative',
          zIndex: 20,
          textAlign: 'center',
          padding: '2rem',
          marginTop: '150px'
        }}>
          <h2 style={{
            fontSize: '1.8rem',
            fontWeight: '600',
            color: '#1f2937',
            marginBottom: '0.5rem',
            textShadow: '0 2px 4px rgba(0, 0, 0, 0.1)'
          }}>
            {getInstructionText()}
          </h2>
          {['inhale', 'hold', 'exhale'].includes(phase) && (
            <p style={{
              fontSize: '0.9rem',
              fontWeight: '500',
              color: '#6b7280'
            }}>
              {cycle} of {totalCycles}
            </p>
          )}
        </div>
      )}
    </div>
  )
}