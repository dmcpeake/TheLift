import React from 'react'
import { motion } from 'framer-motion'
import { cn } from '../ui/utils'
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
  // Calculate circle scale based on phase
  const getCircleScale = () => {
    switch (phase) {
      case 'inhale':
        return 1.3
      case 'hold':
        return 1.3
      case 'exhale':
        return 0.7
      default:
        return 1.0
    }
  }

  // Get phase duration for animation
  const getPhaseDuration = () => {
    switch (phase) {
      case 'inhale':
        return pace.in
      case 'hold':
        return pace.hold
      case 'exhale':
        return pace.out
      default:
        return 1
    }
  }

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
  const getProgressAngle = () => {
    const totalPhases = totalCycles * 3 // inhale, hold, exhale per cycle
    const currentPhaseIndex = ((cycle - 1) * 3) + 
      (phase === 'inhale' ? 0 : phase === 'hold' ? 1 : phase === 'exhale' ? 2 : 0)
    return (currentPhaseIndex / totalPhases) * 360
  }

  const isBreathingPhase = ['inhale', 'hold', 'exhale'].includes(phase)

  return (
    <div className="flex flex-col items-center justify-center px-6 py-12 min-h-[600px]">
      
      {/* Main breathing visualization */}
      <div className="relative w-96 h-96 flex items-center justify-center">
        
        {/* Outer progress ring */}
        {isBreathingPhase && (
          <div className="absolute inset-0">
            <svg width="100%" height="100%" viewBox="0 0 400 400" className="transform -rotate-90">
              {/* Background ring */}
              <circle
                cx="200"
                cy="200"
                r="180"
                fill="none"
                stroke="rgba(255, 255, 255, 0.2)"
                strokeWidth="8"
                strokeDasharray="20 10"
              />
              {/* Progress ring */}
              <motion.circle
                cx="200"
                cy="200"
                r="180"
                fill="none"
                stroke="rgba(255, 255, 255, 0.8)"
                strokeWidth="8"
                strokeDasharray="20 10"
                strokeLinecap="round"
                initial={{ strokeDashoffset: 1130 }}
                animate={{ 
                  strokeDashoffset: 1130 - (getProgressAngle() / 360) * 1130
                }}
                transition={{ duration: 0.5 }}
              />
            </svg>
          </div>
        )}

        {/* Inner white circle */}
        <motion.div
          className={cn(
            'w-80 h-80 rounded-full flex items-center justify-center shadow-2xl',
            highContrast ? 'bg-black text-white border-4 border-white' : 'bg-white text-gray-600'
          )}
          animate={{
            scale: getCircleScale()
          }}
          transition={{
            duration: reducedMotion ? 0.3 : getPhaseDuration(),
            ease: phase === 'inhale' ? 'easeOut' : phase === 'exhale' ? 'easeIn' : 'linear'
          }}
          style={{
            boxShadow: '0 20px 60px rgba(0, 0, 0, 0.1), 0 8px 25px rgba(0, 0, 0, 0.08)'
          }}
        >
          {/* Text inside circle */}
          <div className="text-center">
            <motion.h2 
              className={cn(
                'text-4xl md:text-5xl font-light mb-2',
                highContrast ? 'text-white' : 'text-gray-600'
              )}
              animate={{
                opacity: [0.7, 1, 0.7]
              }}
              transition={{
                duration: 2,
                repeat: Infinity,
                ease: 'easeInOut'
              }}
            >
              {getInstructionText()}
            </motion.h2>
            {isBreathingPhase && (
              <p className={cn(
                'text-lg font-light',
                highContrast ? 'text-gray-300' : 'text-gray-400'
              )}>
                {cycle} of {totalCycles}
              </p>
            )}
          </div>
        </motion.div>
      </div>

      {/* Phase instruction below (if needed) */}
      {captions && phase === 'instruction' && (
        <div className="mt-8 text-center max-w-md">
          <p className={cn(
            'text-xl font-light',
            highContrast ? 'text-white' : 'text-white/80'
          )}>
            Watch the circle grow as you breathe in,
            <br />
            and shrink as you breathe out
          </p>
        </div>
      )}
    </div>
  )
}