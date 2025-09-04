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
          className="min-w-[240px] text-xl py-6 bg-gradient-to-r from-pink-500 via-purple-500 to-blue-500 hover:from-pink-600 hover:via-purple-600 hover:to-blue-600 text-white shadow-2xl transform hover:scale-105 transition-all duration-200 font-bold rounded-full"
        >
          <Play className="h-6 w-6 mr-3" />
          🌟 Let's Start! 🌟
        </Button>
      )}

      {isBreathingPhase && running && (
        <Button
          size="lg"
          onClick={onPause}
          className="min-w-[200px] text-lg py-4 bg-gradient-to-r from-orange-400 to-red-400 hover:from-orange-500 hover:to-red-500 text-white shadow-xl rounded-full font-bold"
        >
          <Pause className="h-5 w-5 mr-2" />
          ⏸️ Pause
        </Button>
      )}

      {isBreathingPhase && !running && (
        <Button
          size="lg"
          onClick={onResume}
          className="min-w-[200px] text-lg py-4 bg-gradient-to-r from-green-500 to-teal-500 hover:from-green-600 hover:to-teal-600 text-white shadow-xl rounded-full font-bold"
        >
          <Play className="h-5 w-5 mr-2" />
          ▶️ Continue
        </Button>
      )}

      {phase === 'complete' && (
        <Button
          size="lg"
          onClick={onContinue}
          className="min-w-[240px] text-xl py-6 bg-gradient-to-r from-yellow-400 via-orange-400 to-red-400 hover:from-yellow-500 hover:via-orange-500 hover:to-red-500 text-white shadow-2xl transform hover:scale-105 transition-all duration-200 font-bold rounded-full"
        >
          🎉 Amazing! Continue! 🎉
          <ArrowRight className="h-6 w-6 ml-3" />
        </Button>
      )}
    </footer>
  )
}