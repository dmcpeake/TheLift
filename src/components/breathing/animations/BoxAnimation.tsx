import React, { useEffect, useState, useRef } from 'react'
import Lottie from 'lottie-react'
import { Phase, Pace } from '../types'

interface BoxAnimationProps {
  phase: Phase
  pace: Pace
  cycle: number
  totalCycles: number
  running: boolean
  onTitleChange?: (title: string) => void
}

export function BoxAnimation({ phase, pace, cycle, totalCycles, running, onTitleChange }: BoxAnimationProps) {
  const [boxAnimation, setBoxAnimation] = useState(null)
  const lottieRef = useRef<any>(null)

  // Load the Lottie animation
  useEffect(() => {
    fetch('/box breathing 4-4-4.json')
      .then(response => response.json())
      .then(data => {
        console.log('Box animation loaded:', data)
        setBoxAnimation(data)
      })
      .catch(error => console.error('Error loading box animation:', error))
  }, [])

  // Update title to match current phase
  useEffect(() => {
    if (!onTitleChange) return

    // Set title immediately for intro and complete
    if (phase === 'intro') {
      onTitleChange("Let's breathe!")
      return
    }

    if (phase === 'complete') {
      onTitleChange('Well done!')
      return
    }

    // Show current phase title immediately
    const currentTitle = phase === 'inhale' ? 'Inhale' :
                        phase === 'hold' ? 'Hold' :
                        phase === 'exhale' ? 'Exhale' :
                        phase === 'holdAfter' ? 'Hold' : ''

    if (currentTitle) {
      onTitleChange(currentTitle)
    }
  }, [phase, onTitleChange])

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

  const getInstructionText = () => {
    switch (phase) {
      case 'intro': return { title: "Let's breathe!", subtitle: null }
      case 'inhale': return { title: 'Inhale', subtitle: null }
      case 'hold': return { title: 'Hold', subtitle: null }
      case 'exhale': return { title: 'Exhale', subtitle: null }
      case 'holdAfter': return { title: 'Hold', subtitle: null }
      case 'complete': return { title: 'Well done!', subtitle: null }
      default: return { title: '', subtitle: null }
    }
  }

  return (
    <div className="breathing-box-container" style={{
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      width: '480px',
      height: '480px',
      position: 'relative',
      zIndex: 10
    }}>
      {/* Lottie Animation */}
      {boxAnimation && (
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
            animationData={boxAnimation}
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

      {/* Center text - hidden for box breathing */}

      <style jsx>{`
        @media (max-width: 768px) {
          .breathing-box-container {
            width: 100% !important;
            height: 100% !important;
          }
        }
      `}</style>
    </div>
  )
}
