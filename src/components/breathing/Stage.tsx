import React from 'react'
import { motion, AnimatePresence } from 'framer-motion'
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
        return 1.5
      case 'hold':
        return 1.5
      case 'exhale':
        return 1.0
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
        return 0
    }
  }

  // Caption text
  const getCaptionText = () => {
    switch (phase) {
      case 'intro':
        return 'Breathing Circles'
      case 'instruction':
        return `Breathe in for ${pace.in}, hold for ${pace.hold}, and out for ${pace.out}`
      case 'inhale':
        return 'Breathe in...'
      case 'hold':
        return 'Hold...'
      case 'exhale':
        return 'Breathe out...'
      case 'complete':
        return 'Nice work! Ready to check in.'
      default:
        return ''
    }
  }

  const isBreathingPhase = ['inhale', 'hold', 'exhale'].includes(phase)

  return (
    <div className="flex flex-col items-center justify-center px-6 py-8">
      {/* Main breathing circle */}
      <div className="relative w-64 h-64 md:w-80 md:h-80">
        {/* Outer ripple effects (exhale only) */}
        <AnimatePresence>
          {phase === 'exhale' && !reducedMotion && (
            <>
              {[0, 1, 2].map((index) => (
                <motion.div
                  key={`ripple-${index}`}
                  className={cn(
                    'absolute inset-0 rounded-full border-2',
                    highContrast 
                      ? 'border-white' 
                      : 'border-indigo-300'
                  )}
                  initial={{ scale: 1, opacity: 0 }}
                  animate={{
                    scale: 1.5 + index * 0.3,
                    opacity: [0, 0.3, 0]
                  }}
                  transition={{
                    duration: pace.out,
                    delay: index * 0.3,
                    ease: 'easeOut'
                  }}
                />
              ))}
            </>
          )}
        </AnimatePresence>

        {/* Main circle */}
        <motion.div
          className={cn(
            'absolute inset-0 rounded-full shadow-2xl',
            highContrast
              ? 'bg-white'
              : phase === 'hold'
              ? 'bg-gradient-to-br from-purple-400 via-indigo-400 to-blue-400'
              : 'bg-gradient-to-br from-blue-400 via-indigo-400 to-purple-400'
          )}
          animate={{
            scale: getCircleScale(),
            filter: phase === 'hold' ? 'brightness(1.2)' : 'brightness(1)'
          }}
          transition={{
            duration: reducedMotion ? 0.3 : getPhaseDuration(),
            ease: phase === 'inhale' ? 'easeOut' : phase === 'exhale' ? 'easeIn' : 'linear'
          }}
        >
          {/* Inner glow effect */}
          {phase === 'hold' && !reducedMotion && (
            <motion.div
              className="absolute inset-4 rounded-full bg-white/30"
              animate={{
                opacity: [0.3, 0.6, 0.3]
              }}
              transition={{
                duration: pace.hold,
                repeat: Infinity
              }}
            />
          )}

          {/* Center dot */}
          <div 
            className={cn(
              'absolute inset-1/2 w-2 h-2 -translate-x-1/2 -translate-y-1/2 rounded-full',
              highContrast ? 'bg-gray-900' : 'bg-white/50'
            )}
          />
        </motion.div>
      </div>

      {/* Captions */}
      {captions && (
        <motion.div 
          className="mt-8 text-center"
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
        >
          <p 
            className={cn(
              'text-xl md:text-2xl font-medium',
              highContrast ? 'text-white' : 'text-gray-700'
            )}
            role="status"
            aria-live="polite"
          >
            {getCaptionText()}
          </p>
          {isBreathingPhase && (
            <p 
              className={cn(
                'mt-2 text-sm',
                highContrast ? 'text-gray-300' : 'text-gray-500'
              )}
            >
              Cycle {cycle} of {totalCycles}
            </p>
          )}
        </motion.div>
      )}

      {/* Progress dots */}
      {isBreathingPhase && (
        <div className="mt-8 flex gap-2" role="progressbar" aria-valuemin={1} aria-valuemax={totalCycles} aria-valuenow={cycle}>
          {Array.from({ length: totalCycles }, (_, i) => (
            <motion.div
              key={i}
              className={cn(
                'w-2 h-2 rounded-full transition-all',
                i < cycle
                  ? highContrast ? 'bg-white' : 'bg-indigo-500'
                  : i === cycle - 1
                  ? highContrast ? 'bg-white w-3 h-3' : 'bg-indigo-600 w-3 h-3'
                  : highContrast ? 'bg-gray-600' : 'bg-gray-300'
              )}
              initial={{ scale: 0 }}
              animate={{ scale: 1 }}
              transition={{ delay: i * 0.1 }}
            />
          ))}
        </div>
      )}

      {/* Completion animation */}
      {phase === 'complete' && !reducedMotion && (
        <motion.div
          className="absolute inset-0 pointer-events-none"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.5 }}
        >
          {/* Simple confetti/sparkle effect */}
          {Array.from({ length: 20 }, (_, i) => (
            <motion.div
              key={`sparkle-${i}`}
              className={cn(
                'absolute w-2 h-2 rounded-full',
                highContrast ? 'bg-white' : 'bg-yellow-400'
              )}
              style={{
                left: `${Math.random() * 100}%`,
                top: `${Math.random() * 100}%`
              }}
              initial={{ scale: 0, opacity: 0 }}
              animate={{
                scale: [0, 1, 0],
                opacity: [0, 1, 0],
                y: [0, -50]
              }}
              transition={{
                duration: 1.5,
                delay: Math.random() * 0.5,
                ease: 'easeOut'
              }}
            />
          ))}
        </motion.div>
      )}
    </div>
  )
}