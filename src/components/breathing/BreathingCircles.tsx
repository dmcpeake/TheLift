import React, { useState, useEffect, useRef, useCallback } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { BreathingCirclesProps, Phase, Pace, BreathingSettings } from './types'
import { Header } from './Header'
import { Stage } from './Stage'
import { Footer } from './Footer'
import { Settings } from './Settings'
import { sendTelemetry } from './telemetry'
import { playAudioCue, preloadAudio } from './audio'
import './breathing.css'

const DEFAULT_PACE: Pace = { in: 4, hold: 2, out: 4, label: 'standard' }
const SHORT_PACE: Pace = { in: 3, hold: 1, out: 3, label: 'short' }
const SLOW_PACE: Pace = { in: 5, hold: 3, out: 5, label: 'slow' }

export function BreathingCircles(props: BreathingCirclesProps) {
  const {
    cycles = 5,
    pace = DEFAULT_PACE,
    muted: initialMuted = true,
    captions: initialCaptions = true,
    reducedMotion: initialReducedMotion = false,
    highContrast: initialHighContrast = false,
    onProgress,
    onComplete,
    onExit
  } = props

  // State
  const [phase, setPhase] = useState<Phase>('intro')
  const [cycle, setCycle] = useState(1)
  const [running, setRunning] = useState(false)
  const [showSettings, setShowSettings] = useState(false)
  const [sessionId] = useState(() => crypto.randomUUID())
  const startTimeRef = useRef<number>(Date.now())
  const phaseTimerRef = useRef<NodeJS.Timeout>()

  // Settings
  const [settings, setSettings] = useState<BreathingSettings>(() => {
    const stored = localStorage.getItem('lift.breathing.prefs')
    if (stored) {
      try {
        return JSON.parse(stored)
      } catch {}
    }
    return {
      paceLabel: pace.label as 'standard' || 'standard',
      captions: initialCaptions,
      reducedMotion: initialReducedMotion,
      muted: initialMuted,
      highContrast: initialHighContrast
    }
  })

  // Get current pace based on settings
  const currentPace = settings.paceLabel === 'short' ? SHORT_PACE : 
                      settings.paceLabel === 'slow' ? SLOW_PACE : DEFAULT_PACE

  // Preload audio on mount
  useEffect(() => {
    preloadAudio()
  }, [])

  // Save settings to localStorage
  useEffect(() => {
    localStorage.setItem('lift.breathing.prefs', JSON.stringify(settings))
    sendTelemetry({
      sessionId,
      event: 'settings_changed',
      ts: new Date().toISOString()
    })
  }, [settings, sessionId])

  // Check for OS reduced motion preference
  useEffect(() => {
    const mediaQuery = window.matchMedia('(prefers-reduced-motion: reduce)')
    const handleChange = () => {
      if (mediaQuery.matches && !settings.reducedMotion) {
        setSettings(prev => ({ ...prev, reducedMotion: true }))
      }
    }
    handleChange()
    mediaQuery.addEventListener('change', handleChange)
    return () => mediaQuery.removeEventListener('change', handleChange)
  }, [settings.reducedMotion])

  // Phase progression logic
  const nextPhase = useCallback(() => {
    setPhase((currentPhase) => {
      switch (currentPhase) {
        case 'intro':
          return 'instruction'
        case 'instruction':
          return 'inhale'
        case 'inhale':
          return 'hold'
        case 'hold':
          return 'exhale'
        case 'exhale':
          if (cycle < cycles) {
            setCycle(prev => prev + 1)
            return 'inhale'
          } else {
            return 'complete'
          }
        default:
          return 'complete'
      }
    })
  }, [cycle, cycles])

  // Phase timing and effects
  useEffect(() => {
    if (!running) return

    // Clear any existing timer
    if (phaseTimerRef.current) {
      clearTimeout(phaseTimerRef.current)
    }

    let duration = 0
    
    switch (phase) {
      case 'intro':
        sendTelemetry({
          sessionId,
          event: 'breathing_started',
          pace: currentPace,
          muted: settings.muted,
          reducedMotion: settings.reducedMotion,
          ts: new Date().toISOString()
        })
        duration = 3000
        break
      
      case 'instruction':
        duration = 5000
        break
      
      case 'inhale':
        if (!settings.muted) playAudioCue('inhale')
        onProgress?.(cycle, 'inhale', 0)
        duration = currentPace.in * 1000
        break
      
      case 'hold':
        if (!settings.muted) playAudioCue('hold')
        onProgress?.(cycle, 'hold', 0)
        duration = currentPace.hold * 1000
        break
      
      case 'exhale':
        if (!settings.muted) playAudioCue('exhale')
        onProgress?.(cycle, 'exhale', 0)
        duration = currentPace.out * 1000
        
        // Log cycle completion
        sendTelemetry({
          sessionId,
          event: 'breathing_cycle_completed',
          cycle,
          pace: currentPace,
          ts: new Date().toISOString()
        })
        break
      
      case 'complete':
        if (!settings.muted) playAudioCue('success')
        const elapsedMs = Date.now() - startTimeRef.current
        sendTelemetry({
          sessionId,
          event: 'breathing_completed',
          elapsedMs,
          ts: new Date().toISOString()
        })
        setRunning(false)
        setTimeout(() => onComplete?.(), 1500)
        return
    }

    phaseTimerRef.current = setTimeout(nextPhase, duration)

    return () => {
      if (phaseTimerRef.current) {
        clearTimeout(phaseTimerRef.current)
      }
    }
  }, [
    running,
    phase,
    cycle,
    cycles,
    currentPace,
    settings.muted,
    settings.reducedMotion,
    sessionId,
    nextPhase,
    onProgress,
    onComplete
  ])

  // Handlers
  const handleStart = () => {
    startTimeRef.current = Date.now()
    setRunning(true)
  }

  const handlePause = () => {
    setRunning(false)
  }

  const handleResume = () => {
    setRunning(true)
  }

  const handleSkip = () => {
    setRunning(false)
    sendTelemetry({
      sessionId,
      event: 'breathing_exited',
      elapsedMs: Date.now() - startTimeRef.current,
      ts: new Date().toISOString()
    })
    onExit?.('skip')
  }

  const handleContinue = () => {
    onComplete?.()
  }

  const handleSettingsChange = (newSettings: Partial<BreathingSettings>) => {
    setSettings(prev => ({ ...prev, ...newSettings }))
  }

  return (
    <div className="breathing-container">
      {/* Settings Panel */}
      <AnimatePresence>
        {showSettings && (
          <Settings
            settings={settings}
            onChange={handleSettingsChange}
            onClose={() => setShowSettings(false)}
          />
        )}
      </AnimatePresence>

      {/* Header */}
      <Header 
        onSkip={handleSkip}
        onSettings={() => setShowSettings(true)}
        phase={phase}
      />

      {/* Main Stage */}
      <Stage
        phase={phase}
        cycle={cycle}
        totalCycles={cycles}
        pace={currentPace}
        reducedMotion={settings.reducedMotion}
        captions={settings.captions}
        highContrast={settings.highContrast}
      />

      {/* Footer Controls */}
      <Footer
        running={running}
        phase={phase}
        onStart={handleStart}
        onPause={handlePause}
        onResume={handleResume}
        onContinue={handleContinue}
      />
    </div>
  )
}