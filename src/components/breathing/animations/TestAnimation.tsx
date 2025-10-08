import React, { useEffect, useState, useRef } from 'react'
import Lottie from 'lottie-react'
import { Phase, Pace } from '../types'

interface TestAnimationProps {
  phase: Phase
  pace: Pace
  cycle: number
  totalCycles: number
  running: boolean
  onTitleChange?: (title: string) => void
}

export function TestAnimation({ phase, pace, cycle, totalCycles, running, onTitleChange }: TestAnimationProps) {
  const [testAnimation, setTestAnimation] = useState(null)
  const lottieRef = useRef<any>(null)

  // Load the Lottie animation
  useEffect(() => {
    fetch('/BreatheCircle.json')
      .then(response => response.json())
      .then(data => {
        console.log('Test animation loaded:', data)
        setTestAnimation(data)
      })
      .catch(error => console.error('Error loading test animation:', error))
  }, [])

  // Update title before phase changes to keep in sync with animation
  useEffect(() => {
    if (!onTitleChange) return

    // Set title immediately for intro and complete
    if (phase === 'intro' || phase === 'complete') {
      const titleText = getInstructionText()
      onTitleChange(titleText.title)
      return
    }

    // For first inhale, add 200ms delay before showing title, then transition at 2800ms
    if (phase === 'inhale' && cycle === 1) {
      // Wait 200ms, then show "Inhale"
      const initialTimer = setTimeout(() => {
        onTitleChange('Inhale')
      }, 200)

      // Then transition to "Exhale" at 2800ms from phase start
      const transitionTimer = setTimeout(() => {
        onTitleChange('Exhale')
      }, 2800)

      return () => {
        clearTimeout(initialTimer)
        clearTimeout(transitionTimer)
      }
    }

    // For other inhale phases, show Inhale immediately then transition at 2800ms
    if (phase === 'inhale') {
      const timer = setTimeout(() => {
        onTitleChange('Exhale')
      }, 2800)

      return () => clearTimeout(timer)
    }

    // For exhale phase, show Exhale for 2800ms then transition to next
    if (phase === 'exhale') {
      const nextTitle = cycle < totalCycles ? 'Inhale' : 'Well done!'

      const timer = setTimeout(() => {
        onTitleChange(nextTitle)
      }, 2800)

      return () => clearTimeout(timer)
    }
  }, [phase, pace, cycle, totalCycles, onTitleChange])

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
    <div className="breathing-test-container" style={{
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
      {testAnimation && (
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
            animationData={testAnimation}
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
          .breathing-test-container {
            width: 100% !important;
            height: 100% !important;
          }
        }
      `}</style>
    </div>
  )
}
