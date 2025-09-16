import React from 'react'
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
  const isBreathingPhase = ['inhale', 'hold', 'exhale', 'holdAfter'].includes(phase)
  
  return (
    <div className="breathing-footer">
      {phase === 'intro' && !running && (
        <button
          onClick={onStart}
          className="breathing-button-circle breathing-button-primary"
          aria-label="Start"
        >
          <Play style={{ width: '24px', height: '24px', color: 'white' }} />
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
          onClick={onContinue}
          className="breathing-button-circle breathing-button-primary"
          aria-label="Continue"
        >
          <ArrowRight style={{ width: '24px', height: '24px', color: 'white' }} />
        </button>
      )}
    </div>
  )
}