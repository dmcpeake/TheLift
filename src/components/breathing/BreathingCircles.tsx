import React, { useState, useEffect, useRef, useCallback } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Settings, SkipForward } from 'lucide-react'
import Lottie from 'lottie-react'
import { BreathingCirclesProps, Phase, Pace, BreathingSettings, BreathingTechnique } from './types'
import { Stage } from './Stage'
import { Footer } from './Footer'
import { Settings as SettingsPanel } from './Settings'
import { TechniqueSelector } from './TechniqueSelector'
import { sendTelemetry } from './telemetry'
import { playAudioCue, preloadAudio } from './audio'
import { BREATHING_TECHNIQUES, getBreathingTechnique } from './techniques'
import './breathing.css'

export function BreathingCircles(props: BreathingCirclesProps & {
  embedded?: boolean;
  externalShowSettings?: boolean;
  onExternalSettingsChange?: (show: boolean) => void;
  externalShowTechniqueSelector?: boolean;
  onExternalTechniqueSelectorChange?: (show: boolean) => void;
  externalSelectedTechniqueId?: string;
  onExternalSelectedTechniqueIdChange?: (id: string) => void;
  externalBreathingStarted?: boolean;
  onExternalBreathingStartedChange?: (started: boolean) => void;
  onExternalStart?: (startFn: () => void) => void;
  onExternalPause?: (pauseFn: () => void) => void;
  onExternalResume?: (resumeFn: () => void) => void;
  onExternalRunningChange?: (running: boolean) => void;
}) {
  const {
    cycles: defaultCycles = 3,
    pace: defaultPace,
    muted: initialMuted = true,
    captions: initialCaptions = true,
    reducedMotion: initialReducedMotion = false,
    highContrast: initialHighContrast = false,
    embedded = false,
    externalShowSettings,
    onExternalSettingsChange,
    externalShowTechniqueSelector,
    onExternalTechniqueSelectorChange,
    externalSelectedTechniqueId,
    onExternalSelectedTechniqueIdChange,
    externalBreathingStarted,
    onExternalBreathingStartedChange,
    onExternalStart,
    onExternalPause,
    onExternalResume,
    onExternalRunningChange,
    onProgress,
    onComplete,
    onExit
  } = props


  // State
  const [phase, setPhase] = useState<Phase>('intro')
  const [cycle, setCycle] = useState(1)
  const [running, setRunning] = useState(false)
  const [showSettings, setShowSettings] = useState(false)

  // Use external settings control when embedded
  const effectiveShowSettings = embedded && externalShowSettings !== undefined ? externalShowSettings : showSettings
  const handleSettingsToggle = embedded && onExternalSettingsChange ? onExternalSettingsChange : setShowSettings

  // Use external technique selector control when embedded
  const effectiveShowTechniqueSelector = embedded && externalShowTechniqueSelector !== undefined ? externalShowTechniqueSelector : showTechniqueSelector
  const handleTechniqueSelectorToggle = embedded && onExternalTechniqueSelectorChange ? onExternalTechniqueSelectorChange : setShowTechniqueSelector
  const [showTechniqueSelector, setShowTechniqueSelector] = useState(false)
  const [selectedTechniqueId, setSelectedTechniqueId] = useState('balloon')

  // Use external selected technique control when embedded
  const effectiveSelectedTechniqueId = embedded && externalSelectedTechniqueId !== undefined ? externalSelectedTechniqueId : selectedTechniqueId
  const handleSelectedTechniqueIdChange = embedded && onExternalSelectedTechniqueIdChange ? onExternalSelectedTechniqueIdChange : setSelectedTechniqueId
  const [sessionId] = useState(() => crypto.randomUUID())
  const [roseAnimation, setRoseAnimation] = useState(null)
  const startTimeRef = useRef<number>(Date.now())
  const phaseTimerRef = useRef<NodeJS.Timeout>()

  // Get current technique
  const currentTechnique = getBreathingTechnique(effectiveSelectedTechniqueId) || BREATHING_TECHNIQUES[0]
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

  // Load the Theo Rose animation
  useEffect(() => {
    fetch('/theo-rose.json')
      .then(response => response.json())
      .then(data => setRoseAnimation(data))
      .catch(error => console.error('Error loading rose animation:', error))
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

  // Expose handleStart to external control when embedded
  useEffect(() => {
    if (embedded && onExternalStart) {
      onExternalStart(handleStart)
    }
  }, [embedded, onExternalStart, handleStart])

  // Expose pause/resume functions when embedded
  useEffect(() => {
    if (embedded && onExternalPause) {
      onExternalPause(handlePause)
    }
  }, [embedded, onExternalPause])

  useEffect(() => {
    if (embedded && onExternalResume) {
      onExternalResume(handleResume)
    }
  }, [embedded, onExternalResume])

  // Notify external component about running state changes
  useEffect(() => {
    if (embedded && onExternalRunningChange) {
      onExternalRunningChange(running)
    }
  }, [embedded, running, onExternalRunningChange])

  const handlePause = () => {
    // Immediately clear any running timer for instant pause
    if (phaseTimerRef.current) {
      clearTimeout(phaseTimerRef.current)
      phaseTimerRef.current = undefined
    }
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
    <div className="min-h-screen" style={{
        backgroundColor: 'white',
        paddingTop: embedded ? '0' : '140px',
        position: 'relative',
        overflow: 'hidden',
        width: '100%',
        minHeight: '100vh',
        zIndex: 1
      }}>
      {/* REMOVED ALL YELLOW BACKGROUNDS FOR DEBUG */}


      <style jsx>{`
        @keyframes radiate1 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.3) translateX(0px) translateY(0px);
            opacity: 0.9;
          }
          25% {
            transform: translate(-50%, -50%) scale(0.9) translateX(23px) translateY(-15px);
            opacity: 0.6;
          }
          50% {
            transform: translate(-50%, -50%) scale(1.5) translateX(-30px) translateY(23px);
            opacity: 0.3;
          }
          75% {
            transform: translate(-50%, -50%) scale(1.1) translateX(15px) translateY(30px);
            opacity: 0.5;
          }
        }

        @keyframes radiate2 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.2) rotate(0deg) translateX(0px) translateY(0px);
            opacity: 0.8;
          }
          33% {
            transform: translate(-50%, -50%) scale(1.35) rotate(120deg) translateX(-38px) translateY(-23px);
            opacity: 0.4;
          }
          66% {
            transform: translate(-50%, -50%) scale(1.9) rotate(240deg) translateX(30px) translateY(38px);
            opacity: 0.2;
          }
        }

        @keyframes radiate3 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.1) translateX(0px) translateY(0px);
            opacity: 0.7;
          }
          20% {
            transform: translate(-50%, -50%) scale(0.75) translateX(-23px) translateY(19px);
            opacity: 0.5;
          }
          40% {
            transform: translate(-50%, -50%) scale(1.35) translateX(26px) translateY(-30px);
            opacity: 0.3;
          }
          60% {
            transform: translate(-50%, -50%) scale(1.65) translateX(-19px) translateY(-15px);
            opacity: 0.2;
          }
          80% {
            transform: translate(-50%, -50%) scale(1.2) translateX(34px) translateY(26px);
            opacity: 0.4;
          }
        }
      `}</style>

      {/* Centered title like mood meter */}
      {!embedded && (
        <div className="text-center" style={{ marginBottom: '2rem', paddingTop: '40px' }}>
          <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>Breathing Exercise</h1>
        </div>
      )}

      <div className="w-full" style={{
        position: 'relative',
        zIndex: 10,
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        minHeight: embedded ? 'calc(100vh - 200px)' : 'auto',
        paddingTop: embedded ? '0' : '0',  // Removed padding since title now handles it
        paddingLeft: embedded ? '0' : '1.5rem',
        paddingRight: embedded ? '0' : '1.5rem'
      }}>


        {/* Settings Panel - Only show when not embedded */}
        {!embedded && (
          <AnimatePresence>
            {effectiveShowSettings && (
              <SettingsPanel
                settings={settings}
                onChange={handleSettingsChange}
                onClose={() => handleSettingsToggle(false)}
              />
            )}
          </AnimatePresence>
        )}

        {/* Technique Selector - Display cards vertically centered when open */}
        {effectiveShowTechniqueSelector && (
          <>
            {/* Click outside to close */}
            <div
              style={{
                position: 'fixed',
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                zIndex: 999
              }}
              onClick={() => handleTechniqueSelectorToggle(false)}
            />
            <div style={{
              position: 'fixed',
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              zIndex: 1000
            }}>
              <div style={{
                display: 'flex',
                flexDirection: 'column',
                gap: '12px',
                marginTop: '-90px'
              }}>
                {BREATHING_TECHNIQUES.map(technique => {
                  const isSelected = technique.id === effectiveSelectedTechniqueId
                  return (
                    <button
                      key={technique.id}
                      onClick={() => {
                        handleSelectedTechniqueIdChange(technique.id)
                        handleTechniqueSelectorToggle(false)
                        // Reset when changing technique
                        if (running) {
                          setRunning(false)
                          setPhase('intro')
                          setCycle(1)
                        }
                        // Reset external states when embedded
                        if (embedded && onExternalBreathingStartedChange && onExternalRunningChange) {
                          onExternalBreathingStartedChange(false)
                          onExternalRunningChange(false)
                        }
                      }}
                      style={{
                        padding: '1rem',
                        borderRadius: '12px',
                        border: `2px solid ${isSelected ? '#3b82f6' : 'transparent'}`,
                        background: 'white',
                        cursor: 'pointer',
                        textAlign: 'left',
                        transition: 'all 0.2s ease',
                        width: '280px',
                        boxShadow: '0 4px 20px rgba(0,0,0,0.1)'
                      }}
                    >
                      <div style={{ fontSize: '1rem', fontWeight: '600', color: '#1f2937', marginBottom: '0.25rem' }}>
                        {technique.name}
                      </div>
                      <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>
                        {technique.pace.in}s in • {technique.pace.hold}s hold • {technique.pace.out}s out
                      </div>
                    </button>
                  )
                })}
              </div>
            </div>
          </>
        )}


        {/* Main Stage - Fade out when settings open */}
        <div style={{ opacity: effectiveShowTechniqueSelector ? 0 : 1, transition: 'opacity 0.3s ease' }}>
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
        </div>

        {/* Footer Controls - Fade out when settings open - Hide when embedded */}
        {!embedded && (
          <div style={{ opacity: effectiveShowTechniqueSelector ? 0 : 1, transition: 'opacity 0.3s ease' }}>
            <Footer
              running={running}
              phase={phase}
              onStart={handleStart}
              onPause={handlePause}
              onResume={handleResume}
              onContinue={handleContinue}
            />
          </div>
        )}
      </div>
    </div>
  )
}