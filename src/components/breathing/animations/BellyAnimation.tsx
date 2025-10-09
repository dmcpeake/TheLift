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

  // Debug logging
  console.log(`BellyAnimation render: phase=${phase}, cycle=${cycle}/${totalCycles}, running=${running}`)

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

  // Update title based on phase changes
  useEffect(() => {
    if (!onTitleChange) return

    // Set title based on current phase and cycle
    if (phase === 'intro') {
      onTitleChange("Let's breathe!")
    } else if (phase === 'inhale') {
      onTitleChange('Inhale')
    } else if (phase === 'exhale') {
      onTitleChange('Exhale')
    } else if (phase === 'holdAfter' && cycle === totalCycles) {
      // Show "Well done!" on final cycle's holdAfter
      onTitleChange('Well done!')
    } else if (phase === 'complete') {
      onTitleChange('Well done!')
    }
    // Don't change title during hold phase (keep showing previous)
  }, [phase, cycle, totalCycles, onTitleChange])

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
      console.log('Animation stopped - phase is intro or complete')
      instance.stop()
    } else if (!running) {
      // Pause when user presses pause button - keeps current position
      console.log('Animation paused - running is false')
      instance.pause()
    } else if (phase === 'holdAfter' && cycle === totalCycles) {
      // Pause on final cycle's holdAfter phase
      console.log('Animation paused - final cycle holdAfter')
      instance.pause()
    } else {
      // Play when running - during all breathing phases (inhale, hold, exhale)
      // Just let it loop continuously, don't restart
      instance.play()
    }
  }, [phase, running, cycle, totalCycles])

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
