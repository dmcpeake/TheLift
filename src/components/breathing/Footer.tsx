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
          className="breathing-button breathing-button-primary"
        >
          <Play style={{ width: '20px', height: '20px' }} />
          Start
        </button>
      )}

      {isBreathingPhase && running && (
        <button
          onClick={onPause}
          className="breathing-button breathing-button-secondary"
          style={{ minWidth: '160px' }}
        >
          <Pause style={{ width: '20px', height: '20px' }} />
          Pause
        </button>
      )}

      {isBreathingPhase && !running && (
        <button
          onClick={onResume}
          className="breathing-button breathing-button-secondary"
          style={{ minWidth: '160px' }}
        >
          <Play style={{ width: '20px', height: '20px' }} />
          Resume
        </button>
      )}

      {phase === 'complete' && (
        <button
          onClick={onContinue}
          className="breathing-button breathing-button-primary"
        >
          Continue
          <ArrowRight style={{ width: '20px', height: '20px' }} />
        </button>
      )}
    </div>
  )
}