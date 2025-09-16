import React from 'react'
import { Button } from '../ui/button'
import { Settings, SkipForward } from 'lucide-react'
import { Phase } from './types'
import { useLocation } from 'react-router-dom'

interface HeaderProps {
  onSkip: () => void
  onSettings: () => void
  phase: Phase
  techniqueName?: string
}

export function Header({ onSkip, onSettings, phase, techniqueName }: HeaderProps) {
  const location = useLocation()
  const isInCheckinFlow = location.pathname.includes('/checkin/flow')
  const showSkip = phase !== 'complete'

  return (
    <>
      {/* Centered title like breathing exercise */}
      <div className="text-center" style={{ marginTop: '80px', marginBottom: '2rem' }}>
        <h1 className="text-white mb-2" style={{ fontSize: '40px', fontWeight: 600, letterSpacing: '0.02em' }}>Breathing Exercise</h1>
        <p className="text-white text-lg opacity-80">Take a moment to breathe</p>
      </div>
    </>
  )
}