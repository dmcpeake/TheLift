import React, { useState, useEffect, useRef, useCallback } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { BreathingCirclesProps, Phase, Pace, BreathingSettings, BreathingTechnique } from './types'
import { Header } from './Header'
import { Stage } from './Stage'
import { Footer } from './Footer'
import { Settings } from './Settings'
import { TechniqueSelector } from './TechniqueSelector'
import { sendTelemetry } from './telemetry'
import { playAudioCue, preloadAudio } from './audio'
import { BREATHING_TECHNIQUES, getBreathingTechnique } from './techniques'
import './breathing.css'

export function BreathingCircles(props: BreathingCirclesProps) {
  const {
    cycles: defaultCycles = 5,
    pace: defaultPace,
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
  const [showTechniqueSelector, setShowTechniqueSelector] = useState(false)
  const [selectedTechniqueId, setSelectedTechniqueId] = useState('balloon')
  const [sessionId] = useState(() => crypto.randomUUID())
  const startTimeRef = useRef<number>(Date.now())
  const phaseTimerRef = useRef<NodeJS.Timeout>()

  // Get current technique
  const currentTechnique = getBreathingTechnique(selectedTechniqueId) || BREATHING_TECHNIQUES[0]
  const cycles = currentTechnique.cycles || defaultCycles
  const pace = currentTechnique.pace

  // Settings
  const [settings, setSettings] = useState<BreathingSettings>(() => {
    const stored = localStorage.getItem('lift.breathing.prefs')
    if (stored) {
      try {
        return JSON.parse(stored)
      } catch {}
    }
    return {
      paceLabel: 'standard',
      captions: initialCaptions,
      reducedMotion: initialReducedMotion,
      muted: initialMuted,
      highContrast: initialHighContrast
    }
  })


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
        case 'inhale':
          return 'hold'
        case 'hold':
          return 'exhale'
        case 'exhale':
          // Check if this technique has holdAfter (square breathing)
          if (pace.holdAfter && pace.holdAfter > 0) {
            return 'holdAfter'
          } else if (cycle < cycles) {
            setCycle(prev => prev + 1)
            return 'inhale'
          } else {
            return 'complete'
          }
        case 'holdAfter':
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
  }, [cycle, cycles, pace])

  // Phase timing and effects
  useEffect(() => {
    if (!running) return

    // Clear any existing timer
    if (phaseTimerRef.current) {
      clearTimeout(phaseTimerRef.current)
    }

    let duration = 0
    
    // Send telemetry on first inhale
    if (phase === 'inhale' && cycle === 1 && !running) {
      sendTelemetry({
        sessionId,
        event: 'breathing_started',
        pace: pace,
        muted: settings.muted,
        reducedMotion: settings.reducedMotion,
        ts: new Date().toISOString()
      })
    }
    
    switch (phase) {
      case 'inhale':
        if (!settings.muted) playAudioCue('inhale')
        onProgress?.(cycle, 'inhale', 0)
        duration = pace.in * 1000
        break
      
      case 'hold':
        if (!settings.muted) playAudioCue('hold')
        onProgress?.(cycle, 'hold', 0)
        duration = pace.hold * 1000
        break
      
      case 'exhale':
        if (!settings.muted) playAudioCue('exhale')
        onProgress?.(cycle, 'exhale', 0)
        duration = pace.out * 1000
        
        // Only log cycle completion if no holdAfter phase
        if (!pace.holdAfter || pace.holdAfter === 0) {
          sendTelemetry({
            sessionId,
            event: 'breathing_cycle_completed',
            cycle,
            pace: pace,
            ts: new Date().toISOString()
          })
        }
        break
      
      case 'holdAfter':
        if (!settings.muted) playAudioCue('hold')
        duration = (pace.holdAfter || 0) * 1000
        
        // Log cycle completion after final hold
        sendTelemetry({
          sessionId,
          event: 'breathing_cycle_completed',
          cycle,
          pace: pace,
          ts: new Date().toISOString()
        })
        break
      
      case 'complete':
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
    pace,
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
    setPhase('inhale')
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

      {/* Technique Selector */}
      <TechniqueSelector
        selectedId={selectedTechniqueId}
        onSelect={(id) => {
          setSelectedTechniqueId(id)
          // Reset when changing technique
          if (running) {
            setRunning(false)
            setPhase('intro')
            setCycle(1)
          }
        }}
        isOpen={showTechniqueSelector}
        onToggle={() => setShowTechniqueSelector(!showTechniqueSelector)}
      />

      {/* Header */}
      <Header 
        onSkip={handleSkip}
        onSettings={() => setShowSettings(true)}
        phase={phase}
        techniqueName={currentTechnique.name}
      />

      {/* Main Stage */}
      <Stage
        phase={phase}
        cycle={cycle}
        totalCycles={cycles}
        pace={pace}
        technique={currentTechnique}
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