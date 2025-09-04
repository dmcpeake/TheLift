import React from 'react'
import { Button } from '../ui/button'
import { Settings, SkipForward } from 'lucide-react'
import { Phase } from './types'

interface HeaderProps {
  onSkip: () => void
  onSettings: () => void
  phase: Phase
}

export function Header({ onSkip, onSettings, phase }: HeaderProps) {
  const showSkip = phase !== 'complete'
  
  return (
    <div className="breathing-header">
      <h1 className="breathing-title">
        Breathing Exercise
      </h1>
      
      <div style={{ display: 'flex', gap: '0.5rem' }}>
        <Button
          variant="ghost"
          size="icon"
          onClick={onSettings}
          style={{
            color: 'rgba(255, 255, 255, 0.8)',
            border: 'none',
            background: 'none'
          }}
          className="hover:text-white hover:bg-white/20"
          aria-label="Settings"
        >
          <Settings className="h-5 w-5" />
        </Button>
        
        {showSkip && (
          <Button
            variant="ghost"
            size="sm"
            onClick={onSkip}
            style={{
              color: 'rgba(255, 255, 255, 0.8)',
              border: 'none',
              background: 'none'
            }}
            className="hover:text-white hover:bg-white/20"
          >
            <SkipForward className="h-4 w-4 mr-1" />
            Skip
          </Button>
        )}
      </div>
    </div>
  )
}