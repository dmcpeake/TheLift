import React, { useState, useEffect } from 'react'
import { Play, Pause, ArrowRight } from 'lucide-react'
import { Phase } from './types'

interface FooterProps {
  running: boolean
  phase: Phase
  onStart: () => void
  onPause: () => void
  onResume: () => void
  onContinue: () => void
}

export function Footer({
  running,
  phase,
  onStart,
  onPause,
  onResume,
  onContinue
}: FooterProps) {
  const [animationKey, setAnimationKey] = useState(0)
  const isBreathingPhase = ['inhale', 'hold', 'exhale', 'holdAfter'].includes(phase)

  // Trigger animation when buttons appear
  useEffect(() => {
    setAnimationKey(prev => prev + 1)
  }, [phase, running])

  // Trigger animation on component mount
  useEffect(() => {
    setAnimationKey(prev => prev + 1)
  }, [])

  return (
    <div className="breathing-footer">
      {phase === 'intro' && !running && (
        <button
          key={`start-${animationKey}`}
          onClick={onStart}
          className="breathing-button-circle breathing-button-primary"
          style={{
            animation: 'breathingCircleExpand 0.4s ease-out'
          }}
          aria-label="Start"
        >
          <Play style={{
            width: '24px',
            height: '24px',
            color: 'white',
            animation: 'breathingIconFadeIn 0.4s ease-out'
          }} />
        </button>
      )}

      {isBreathingPhase && running && (
        <button
          onClick={onPause}
          className="breathing-button-circle breathing-button-secondary"
          aria-label="Pause"
        >
          <Pause style={{ width: '24px', height: '24px', color: 'white' }} />
        </button>
      )}

      {isBreathingPhase && !running && (
        <button
          onClick={onResume}
          className="breathing-button-circle breathing-button-secondary"
          aria-label="Resume"
        >
          <Play style={{ width: '24px', height: '24px', color: 'white' }} />
        </button>
      )}

      {phase === 'complete' && (
        <button
          key={`continue-${animationKey}`}
          onClick={onContinue}
          className="breathing-button-circle breathing-button-primary"
          style={{
            animation: 'breathingCircleExpand 0.4s ease-out'
          }}
          aria-label="Continue"
        >
          <ArrowRight style={{
            width: '24px',
            height: '24px',
            color: 'white',
            animation: 'breathingIconFadeIn 0.4s ease-out'
          }} />
        </button>
      )}
    </div>
  )
}