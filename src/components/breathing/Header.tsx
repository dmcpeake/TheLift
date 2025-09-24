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
      <style>{`
        @media (max-width: 768px) {
          .breathing-title-mobile {
            font-size: 28px !important;
          }
          .breathing-header-container-mobile {
            margin-top: 0px !important;
          }
        }
      `}</style>

      {/* Centered title like breathing exercise */}
      <div className="breathing-header-container-mobile text-center" style={{ marginTop: '20px', marginBottom: '2rem' }}>
        <h1 className="breathing-title-mobile text-white mb-2" style={{ fontSize: '40px', fontWeight: 600, letterSpacing: '0.02em' }}>Let's breathe!</h1>
      </div>
    </>
  )
}