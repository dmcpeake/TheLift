import React from 'react'
import { Button } from '../ui/button'
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
  const isBreathingPhase = ['inhale', 'hold', 'exhale'].includes(phase)
  
  return (
    <footer className="flex justify-center p-4 md:p-6">
      {phase === 'intro' && !running && (
        <Button
          size="lg"
          onClick={onStart}
          className="min-w-[200px] bg-gradient-to-r from-indigo-500 to-purple-500 hover:from-indigo-600 hover:to-purple-600 text-white"
        >
          <Play className="h-5 w-5 mr-2" />
          Start
        </Button>
      )}

      {isBreathingPhase && running && (
        <Button
          size="lg"
          variant="secondary"
          onClick={onPause}
          className="min-w-[200px]"
        >
          <Pause className="h-5 w-5 mr-2" />
          Pause
        </Button>
      )}

      {isBreathingPhase && !running && (
        <Button
          size="lg"
          onClick={onResume}
          className="min-w-[200px] bg-gradient-to-r from-indigo-500 to-purple-500 hover:from-indigo-600 hover:to-purple-600 text-white"
        >
          <Play className="h-5 w-5 mr-2" />
          Resume
        </Button>
      )}

      {phase === 'complete' && (
        <Button
          size="lg"
          onClick={onContinue}
          className="min-w-[200px] bg-gradient-to-r from-green-500 to-emerald-500 hover:from-green-600 hover:to-emerald-600 text-white"
        >
          Continue
          <ArrowRight className="h-5 w-5 ml-2" />
        </Button>
      )}
    </footer>
  )
}