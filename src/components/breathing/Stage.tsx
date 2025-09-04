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
        return 1.4
      case 'hold':
        return 1.4
      case 'exhale':
        return 0.6
      default:
        return 0.8
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

  // Get phase color
  const getPhaseColor = () => {
    switch (phase) {
      case 'inhale':
        return 'from-blue-400 to-blue-600'
      case 'hold':
        return 'from-purple-400 to-purple-600'
      case 'exhale':
        return 'from-green-400 to-green-600'
      case 'complete':
        return 'from-yellow-400 to-orange-500'
      default:
        return 'from-indigo-400 to-indigo-600'
    }
  }

  // Caption text - simple, no emojis
  const getCaptionText = () => {
    switch (phase) {
      case 'intro':
        return 'Get ready to breathe'
      case 'instruction':
        return 'Follow the circle as it grows and shrinks'
      case 'inhale':
        return 'Breathe in slowly'
      case 'hold':
        return 'Hold your breath'
      case 'exhale':
        return 'Breathe out slowly'
      case 'complete':
        return 'Well done! You completed all breaths'
      default:
        return ''
    }
  }

  const isBreathingPhase = ['inhale', 'hold', 'exhale'].includes(phase)

  return (
    <div className="flex flex-col items-center justify-center px-6 py-12 min-h-[500px]">
      
      {/* Large breathing circle - this is the main focus */}
      <div className="relative mb-12">
        <motion.div
          className={cn(
            'w-80 h-80 md:w-96 md:h-96 rounded-full shadow-xl bg-gradient-to-br',
            highContrast ? 'bg-white border-4 border-black' : getPhaseColor()
          )}
          animate={{
            scale: getCircleScale()
          }}
          transition={{
            duration: reducedMotion ? 0.3 : getPhaseDuration(),
            ease: phase === 'inhale' ? 'easeOut' : phase === 'exhale' ? 'easeIn' : 'linear'
          }}
        />
      </div>

      {/* Large, clear instructions */}
      {captions && (
        <div className="text-center max-w-lg mx-auto mb-8">
          <h2 
            className={cn(
              'text-3xl md:text-4xl font-bold mb-4',
              highContrast ? 'text-black' : 'text-gray-900'
            )}
          >
            {getCaptionText()}
          </h2>
          {isBreathingPhase && (
            <p 
              className={cn(
                'text-xl md:text-2xl font-medium',
                highContrast ? 'text-gray-800' : 'text-gray-700'
              )}
            >
              Breath {cycle} of {totalCycles}
            </p>
          )}
        </div>
      )}

      {/* Simple progress bar */}
      {isBreathingPhase && (
        <div className="w-full max-w-md mx-auto">
          <div className="bg-gray-300 rounded-full h-4 mb-2">
            <motion.div 
              className="bg-gradient-to-r from-blue-500 to-purple-500 h-4 rounded-full"
              initial={{ width: '0%' }}
              animate={{ width: `${(cycle / totalCycles) * 100}%` }}
              transition={{ duration: 0.5 }}
            />
          </div>
          <div className="flex justify-between text-sm text-gray-600">
            <span>Progress</span>
            <span>{cycle}/{totalCycles}</span>
          </div>
        </div>
      )}
    </div>
  )
}