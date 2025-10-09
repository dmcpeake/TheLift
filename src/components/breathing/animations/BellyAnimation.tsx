import React, { useEffect, useState, useRef } from 'react'
import Lottie from 'lottie-react'
import { Phase, Pace } from '../types'

interface BellyAnimationProps {
  phase: Phase
  pace: Pace
  cycle: number
  totalCycles: number
  running: boolean
  onTitleChange?: (title: string) => void
}

export function BellyAnimation({ phase, pace, cycle, totalCycles, running, onTitleChange }: BellyAnimationProps) {
  const [bellyAnimation, setBellyAnimation] = useState(null)
  const lottieRef = useRef<any>(null)
  const sequenceSetupRef = useRef(false)
  const timersRef = useRef<NodeJS.Timeout[]>([])

  // Load the Lottie animation
  useEffect(() => {
    fetch('/Breathe01.json')
      .then(response => response.json())
      .then(data => {
        console.log('Belly animation loaded:', data)
        setBellyAnimation(data)
      })
      .catch(error => console.error('Error loading belly animation:', error))
  }, [])

  // Explicit sequence - set up all timers at once when breathing starts
  useEffect(() => {
    if (!onTitleChange) return

    // Set title immediately for intro and complete
    if (phase === 'intro' || phase === 'complete') {
      const titleText = getInstructionText()
      onTitleChange(titleText.title)
      // Clear any running timers and reset for next session
      timersRef.current.forEach(timer => clearTimeout(timer))
      timersRef.current = []
      sequenceSetupRef.current = false
      return
    }

    // Only set up the entire sequence once when first inhale starts
    if (phase === 'inhale' && cycle === 1 && !sequenceSetupRef.current) {
      sequenceSetupRef.current = true

      // Immediate
      onTitleChange('Inhale')

      // Explicit sequence: 2s up, 2s down, 1s pause = 5s per cycle
      // Trigger 100ms before keyframes for mid-fade sync
      timersRef.current = []
      timersRef.current.push(setTimeout(() => onTitleChange('Exhale'), 1900))      // At 2000ms: top of cycle 1
      timersRef.current.push(setTimeout(() => onTitleChange('Inhale'), 4900))      // At 5000ms: start of cycle 2
      timersRef.current.push(setTimeout(() => onTitleChange('Exhale'), 6900))      // At 7000ms: top of cycle 2
      timersRef.current.push(setTimeout(() => onTitleChange('Inhale'), 9900))      // At 10000ms: start of cycle 3
      timersRef.current.push(setTimeout(() => onTitleChange('Exhale'), 11900))     // At 12000ms: top of cycle 3
      timersRef.current.push(setTimeout(() => onTitleChange('Inhale'), 14900))     // At 15000ms: start of cycle 4
      timersRef.current.push(setTimeout(() => onTitleChange('Exhale'), 16900))     // At 17000ms: top of cycle 4
      timersRef.current.push(setTimeout(() => onTitleChange('Well done!'), 19900)) // At 20000ms: complete
    }
  }, [phase, cycle, onTitleChange])

  const getInstructionText = () => {
    switch (phase) {
      case 'intro': return { title: "Let's breathe!", subtitle: null }
      case 'inhale': return { title: 'Inhale', subtitle: null }
      case 'exhale': return { title: 'Exhale', subtitle: null }
      case 'complete': return { title: 'Well done!', subtitle: null }
      default: return { title: '', subtitle: null }
    }
  }

  // Control animation playback based on running state
  useEffect(() => {
    if (!lottieRef.current) return

    const instance = lottieRef.current

    if (phase === 'intro' || phase === 'complete') {
      // Stop at first frame when not started or finished
      instance.stop()
    } else if (!running) {
      // Pause when user presses pause button - keeps current position
      instance.pause()
    } else {
      // Play when running - during all breathing phases (inhale, hold, exhale)
      // Just let it loop continuously, don't restart
      instance.play()
    }
  }, [phase, running])

  return (
    <div className="breathing-belly-container" style={{
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      width: '480px',
      height: '480px',
      position: 'relative',
      zIndex: 10,
      marginTop: '40px'
    }}>
      {/* Lottie Animation */}
      {bellyAnimation && (
        <div style={{
          position: 'absolute',
          width: '100%',
          height: '100%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          zIndex: 1
        }}>
          <Lottie
            animationData={bellyAnimation}
            loop={true}
            autoplay={false}
            lottieRef={lottieRef}
            style={{
              width: '400px',
              height: '400px'
            }}
          />
        </div>
      )}

      <style jsx>{`
        @media (max-width: 768px) {
          .breathing-belly-container {
            width: 100% !important;
            height: 100% !important;
          }
        }
      `}</style>
    </div>
  )
}
