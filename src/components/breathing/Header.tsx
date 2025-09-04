import React from 'react'
import { Button } from '../ui/button'
import { Settings, SkipForward } from 'lucide-react'
import { cn } from '../ui/utils'
import { Phase } from './types'

interface HeaderProps {
  onSkip: () => void
  onSettings: () => void
  phase: Phase
}

export function Header({ onSkip, onSettings, phase }: HeaderProps) {
  const showSkip = phase !== 'complete'
  
  return (
    <header className="flex items-center justify-between p-4 md:p-6">
      <h1 className="text-3xl md:text-4xl font-light text-white">
        Breathing Exercise
      </h1>
      
      <div className="flex gap-2">
        <Button
          variant="ghost"
          size="icon"
          onClick={onSettings}
          className="text-white/80 hover:text-white hover:bg-white/20"
          aria-label="Settings"
        >
          <Settings className="h-5 w-5" />
        </Button>
        
        {showSkip && (
          <Button
            variant="ghost"
            size="sm"
            onClick={onSkip}
            className="text-white/80 hover:text-white hover:bg-white/20"
          >
            <SkipForward className="h-4 w-4 mr-1" />
            Skip
          </Button>
        )}
      </div>
    </header>
  )
}