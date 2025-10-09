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

  // Update title before phase changes to keep in sync with animation
  useEffect(() => {
    if (!onTitleChange) return

    // Set title immediately for intro and complete
    if (phase === 'intro' || phase === 'complete') {
      const titleText = getInstructionText()
      onTitleChange(titleText.title)
      return
    }

    // For first inhale only, show title immediately
    if (phase === 'inhale' && cycle === 1) {
      onTitleChange('Inhale')

      const timer = setTimeout(() => {
        onTitleChange('Exhale')
      }, (pace.in * 1000) - 100)

      return () => clearTimeout(timer)
    }

    // For all other phases, just set timer for next title (previous timer already changed to current title)
    if (phase === 'inhale' || phase === 'exhale') {
      const phaseDuration = phase === 'inhale' ? pace.in : pace.out
      const nextPhase = phase === 'inhale' ? 'exhale' : (cycle < totalCycles ? 'inhale' : 'complete')
      const nextTitle = nextPhase === 'inhale' ? 'Inhale' : nextPhase === 'exhale' ? 'Exhale' : 'Well done!'

      const timer = setTimeout(() => {
        onTitleChange(nextTitle)
      }, (phaseDuration * 1000) - 100)

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
