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
          className="min-w-[200px] text-xl py-6 bg-white text-blue-600 hover:bg-gray-50 shadow-lg font-medium rounded-full"
        >
          <Play className="h-5 w-5 mr-2" />
          Start
        </Button>
      )}

      {isBreathingPhase && running && (
        <Button
          size="lg"
          onClick={onPause}
          className="min-w-[160px] text-lg py-4 bg-white/20 text-white hover:bg-white/30 shadow-lg font-medium rounded-full backdrop-blur-sm"
        >
          <Pause className="h-5 w-5 mr-2" />
          Pause
        </Button>
      )}

      {isBreathingPhase && !running && (
        <Button
          size="lg"
          onClick={onResume}
          className="min-w-[160px] text-lg py-4 bg-white/20 text-white hover:bg-white/30 shadow-lg font-medium rounded-full backdrop-blur-sm"
        >
          <Play className="h-5 w-5 mr-2" />
          Resume
        </Button>
      )}

      {phase === 'complete' && (
        <Button
          size="lg"
          onClick={onContinue}
          className="min-w-[200px] text-xl py-6 bg-white text-blue-600 hover:bg-gray-50 shadow-lg font-medium rounded-full"
        >
          Continue
          <ArrowRight className="h-5 w-5 ml-2" />
        </Button>
      )}
    </footer>
  )
}