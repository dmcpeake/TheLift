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
        return 1.8
      case 'hold':
        return 1.8
      case 'exhale':
        return 1.0
      case 'intro':
        return 1.2 // Slightly larger for intro
      case 'instruction':
        return 1.1
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
        return '✨ Breathing Circles ✨'
      case 'instruction':
        return `Let's take some calming breaths together!`
      case 'inhale':
        return '🌸 Breathe in slowly... 🌸'
      case 'hold':
        return '⭐ Hold gently... ⭐'
      case 'exhale':
        return '🍃 Breathe out softly... 🍃'
      case 'complete':
        return '🎉 Amazing job! You did it! 🎉'
      default:
        return ''
    }
  }

  const isBreathingPhase = ['inhale', 'hold', 'exhale'].includes(phase)

  return (
    <div className="flex flex-col items-center justify-center px-6 py-8">
      {/* Main breathing circle container */}
      <div className="relative w-80 h-80 md:w-96 md:h-96 mb-8">
        
        {/* Floating sparkles/stars for ambiance */}
        {!reducedMotion && (
          <div className="absolute inset-0 pointer-events-none">
            {[...Array(8)].map((_, i) => (
              <motion.div
                key={`sparkle-${i}`}
                className="absolute text-2xl"
                style={{
                  left: `${15 + (i * 10)}%`,
                  top: `${10 + Math.sin(i) * 20}%`,
                }}
                animate={{
                  y: [-10, 10, -10],
                  opacity: [0.3, 0.8, 0.3],
                  rotate: [0, 360]
                }}
                transition={{
                  duration: 3 + i * 0.5,
                  repeat: Infinity,
                  ease: 'easeInOut'
                }}
              >
                {i % 3 === 0 ? '✨' : i % 3 === 1 ? '🌟' : '💫'}
              </motion.div>
            ))}
          </div>
        )}

        {/* Outer ripple effects (exhale only) */}
        <AnimatePresence>
          {phase === 'exhale' && !reducedMotion && (
            <>
              {[0, 1, 2].map((index) => (
                <motion.div
                  key={`ripple-${index}`}
                  className="absolute inset-0 rounded-full border-4 border-rainbow"
                  style={{
                    background: 'linear-gradient(45deg, rgba(255,182,193,0.3), rgba(221,160,221,0.3), rgba(173,216,230,0.3))',
                    border: '3px solid rgba(147,197,253,0.6)'
                  }}
                  initial={{ scale: 1, opacity: 0 }}
                  animate={{
                    scale: 1.5 + index * 0.4,
                    opacity: [0, 0.6, 0]
                  }}
                  transition={{
                    duration: pace.out,
                    delay: index * 0.4,
                    ease: 'easeOut'
                  }}
                />
              ))}
            </>
          )}
        </AnimatePresence>

        {/* Main breathing circle with rainbow gradient */}
        <motion.div
          className="absolute inset-0 rounded-full shadow-2xl overflow-hidden"
          style={{
            background: highContrast 
              ? '#FFFFFF' 
              : phase === 'hold' 
              ? 'linear-gradient(135deg, #ff6b9d 0%, #c44569 25%, #f8b500 50%, #3742fa 75%, #2f3542 100%)'
              : phase === 'inhale'
              ? 'linear-gradient(135deg, #667eea 0%, #764ba2 25%, #f093fb 50%, #f5576c 75%, #4facfe 100%)'
              : phase === 'exhale'
              ? 'linear-gradient(135deg, #a8edea 0%, #fed6e3 25%, #ffecd2 50%, #fcb69f 75%, #ff8a80 100%)'
              : 'linear-gradient(135deg, #74b9ff 0%, #6c5ce7 25%, #fd79a8 50%, #fdcb6e 75%, #00b894 100%)'
          }}
          animate={{
            scale: phase === 'intro' ? [1.0, 1.2, 1.0] : getCircleScale(),
            rotate: phase === 'hold' ? [0, 180, 360] : 0,
            filter: phase === 'hold' ? 'brightness(1.3) saturate(1.2)' : 'brightness(1.1) saturate(1.1)'
          }}
          transition={{
            duration: phase === 'intro' ? 2.5 : (reducedMotion ? 0.4 : getPhaseDuration()),
            ease: phase === 'inhale' ? 'easeOut' : phase === 'exhale' ? 'easeIn' : 'easeInOut',
            repeat: phase === 'intro' ? Infinity : 0
          }}
        >
          {/* Inner magical glow effect */}
          {(phase === 'hold' || phase === 'intro') && !reducedMotion && (
            <motion.div
              className="absolute inset-8 rounded-full"
              style={{
                background: 'radial-gradient(circle, rgba(255,255,255,0.8) 0%, rgba(255,255,255,0.3) 50%, transparent 100%)'
              }}
              animate={{
                opacity: [0.3, 0.8, 0.3],
                scale: [0.9, 1.1, 0.9]
              }}
              transition={{
                duration: phase === 'hold' ? pace.hold : 2,
                repeat: phase === 'intro' ? Infinity : Math.ceil(pace.hold)
              }}
            />
          )}

          {/* Center emoji that changes with phase */}
          <div className="absolute inset-0 flex items-center justify-center">
            <motion.div 
              className="text-4xl md:text-6xl"
              animate={{
                scale: phase === 'hold' ? [1, 1.3, 1] : [1, 1.1, 1]
              }}
              transition={{
                duration: 1,
                repeat: Infinity
              }}
            >
              {phase === 'inhale' ? '🌸' : 
               phase === 'hold' ? '⭐' : 
               phase === 'exhale' ? '🍃' : 
               phase === 'complete' ? '🎉' : '✨'}
            </motion.div>
          </div>

          {/* Rainbow border effect */}
          <div 
            className="absolute inset-0 rounded-full"
            style={{
              border: '4px solid transparent',
              background: 'linear-gradient(45deg, #ff6b9d, #c44569, #f8b500, #3742fa, #2f3542, #ff6b9d) border-box',
              WebkitMask: 'linear-gradient(#fff 0 0) padding-box, linear-gradient(#fff 0 0)',
              WebkitMaskComposite: 'xor'
            }}
          />
        </motion.div>
      </div>

      {/* Large, colorful captions */}
      {captions && (
        <motion.div 
          className="text-center max-w-md mx-auto"
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
        >
          <p 
            className={cn(
              'text-2xl md:text-3xl font-bold mb-4',
              highContrast ? 'text-white' : 'text-gray-800',
              'drop-shadow-lg'
            )}
            style={{
              textShadow: highContrast ? 'none' : '2px 2px 4px rgba(0,0,0,0.1)'
            }}
            role="status"
            aria-live="polite"
          >
            {getCaptionText()}
          </p>
          {isBreathingPhase && (
            <motion.p 
              className={cn(
                'text-lg font-medium',
                highContrast ? 'text-gray-300' : 'text-purple-700'
              )}
              animate={{
                scale: [1, 1.05, 1]
              }}
              transition={{
                duration: 2,
                repeat: Infinity
              }}
            >
              🔮 Breath {cycle} of {totalCycles} 🔮
            </motion.p>
          )}
        </motion.div>
      )}

      {/* Colorful progress dots with emojis */}
      {isBreathingPhase && (
        <div className="mt-8 flex gap-3" role="progressbar" aria-valuemin={1} aria-valuemax={totalCycles} aria-valuenow={cycle}>
          {Array.from({ length: totalCycles }, (_, i) => (
            <motion.div
              key={i}
              className={cn(
                'w-8 h-8 rounded-full border-2 flex items-center justify-center text-lg font-bold transition-all shadow-lg',
                i < cycle
                  ? 'bg-green-400 border-green-500 text-white'
                  : i === cycle - 1
                  ? 'bg-purple-500 border-purple-600 text-white w-10 h-10 text-xl'
                  : 'bg-white border-purple-300 text-purple-500'
              )}
              initial={{ scale: 0, rotate: -180 }}
              animate={{ 
                scale: 1, 
                rotate: 0,
                y: i === cycle - 1 ? [-3, 3, -3] : 0
              }}
              transition={{ 
                delay: i * 0.1,
                y: { duration: 1, repeat: Infinity }
              }}
            >
              {i < cycle ? '✅' : i === cycle - 1 ? '🌟' : i + 1}
            </motion.div>
          ))}
        </div>
      )}

      {/* Magical completion animation */}
      {phase === 'complete' && !reducedMotion && (
        <motion.div
          className="absolute inset-0 pointer-events-none overflow-hidden"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.5 }}
        >
          {/* Confetti rain */}
          {Array.from({ length: 30 }, (_, i) => (
            <motion.div
              key={`confetti-${i}`}
              className="absolute w-3 h-3"
              style={{
                left: `${Math.random() * 100}%`,
                backgroundColor: ['#ff6b9d', '#c44569', '#f8b500', '#3742fa', '#00b894'][i % 5],
                borderRadius: Math.random() > 0.5 ? '50%' : '0%'
              }}
              initial={{ y: -100, rotate: 0 }}
              animate={{
                y: window.innerHeight + 100,
                rotate: 360,
                x: [-50, 50, -50]
              }}
              transition={{
                duration: 3 + Math.random() * 2,
                delay: Math.random() * 1,
                ease: 'easeOut'
              }}
            />
          ))}
        </motion.div>
      )}
    </div>
  )
}