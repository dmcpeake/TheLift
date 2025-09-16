import React, { useState, useEffect, useRef, useCallback } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Settings } from 'lucide-react'
import { BreathingCirclesProps, Phase, Pace, BreathingSettings, BreathingTechnique } from './types'
import { Stage } from './Stage'
import { Footer } from './Footer'
import { Settings as SettingsPanel } from './Settings'
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
    <div className="bg-white min-h-screen" style={{ paddingTop: '140px', position: 'relative', overflow: 'hidden' }}>
      {/* Large animated color shapes radiating from breathing circle center */}
      <div
        style={{
          position: 'absolute',
          top: '50%',
          left: '50%',
          width: '400px',
          height: '400px',
          borderRadius: '50%',
          background: 'radial-gradient(circle, rgba(255, 50, 80, 0.8) 0%, rgba(255, 50, 80, 0.2) 70%)',
          filter: 'blur(40px)',
          zIndex: 1,
          animation: 'radiate1 4s ease-in-out infinite',
          transform: 'translate(-50%, -50%)'
        }}
      />
      <div
        style={{
          position: 'absolute',
          top: '50%',
          left: '50%',
          width: '500px',
          height: '300px',
          borderRadius: '50%',
          background: 'radial-gradient(ellipse, rgba(50, 100, 255, 0.7) 0%, rgba(50, 100, 255, 0.15) 80%)',
          filter: 'blur(50px)',
          zIndex: 2,
          animation: 'radiate2 5s ease-in-out infinite 1s',
          transform: 'translate(-50%, -50%)'
        }}
      />
      <div
        style={{
          position: 'absolute',
          top: '50%',
          left: '50%',
          width: '600px',
          height: '600px',
          borderRadius: '50%',
          background: 'radial-gradient(circle, rgba(147, 51, 234, 0.6) 0%, rgba(147, 51, 234, 0.1) 60%)',
          filter: 'blur(60px)',
          zIndex: 1,
          animation: 'radiate3 6s ease-in-out infinite 2s',
          transform: 'translate(-50%, -50%)'
        }}
      />

      <style jsx>{`
        @keyframes radiate1 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.3) translateX(0px) translateY(0px);
            opacity: 0.9;
          }
          25% {
            transform: translate(-50%, -50%) scale(1.2) translateX(30px) translateY(-20px);
            opacity: 0.6;
          }
          50% {
            transform: translate(-50%, -50%) scale(2.0) translateX(-40px) translateY(30px);
            opacity: 0.3;
          }
          75% {
            transform: translate(-50%, -50%) scale(1.5) translateX(20px) translateY(40px);
            opacity: 0.5;
          }
        }

        @keyframes radiate2 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.2) rotate(0deg) translateX(0px) translateY(0px);
            opacity: 0.8;
          }
          33% {
            transform: translate(-50%, -50%) scale(1.8) rotate(120deg) translateX(-50px) translateY(-30px);
            opacity: 0.4;
          }
          66% {
            transform: translate(-50%, -50%) scale(2.5) rotate(240deg) translateX(40px) translateY(50px);
            opacity: 0.2;
          }
        }

        @keyframes radiate3 {
          0%, 100% {
            transform: translate(-50%, -50%) scale(0.1) translateX(0px) translateY(0px);
            opacity: 0.7;
          }
          20% {
            transform: translate(-50%, -50%) scale(1.0) translateX(-30px) translateY(25px);
            opacity: 0.5;
          }
          40% {
            transform: translate(-50%, -50%) scale(1.8) translateX(35px) translateY(-40px);
            opacity: 0.3;
          }
          60% {
            transform: translate(-50%, -50%) scale(2.2) translateX(-25px) translateY(-20px);
            opacity: 0.2;
          }
          80% {
            transform: translate(-50%, -50%) scale(1.6) translateX(45px) translateY(35px);
            opacity: 0.4;
          }
        }
      `}</style>

      <div className="max-w-7xl mx-auto px-6 w-full" style={{ position: 'relative', zIndex: 10 }}>
        {/* Title positioned exactly like other pages */}
        <div className="text-center" style={{ marginTop: '40px', marginBottom: '2rem' }}>
          <h1 className="text-gray-900 mb-2" style={{ fontSize: '40px', fontWeight: 600, letterSpacing: '0.02em' }}>Let's breathe</h1>
        </div>

        {/* Settings icon positioned 40px above play button */}
        <button
          onClick={() => setShowTechniqueSelector(!showTechniqueSelector)}
          style={{
            position: 'fixed',
            bottom: 'calc(2rem + 56px + 40px)', // Footer padding + button height + 40px gap
            left: '50%',
            transform: 'translateX(-50%)',
            background: 'transparent',
            border: 'none',
            cursor: 'pointer',
            zIndex: 100,
            transition: 'all 0.3s ease'
          }}
          aria-label={showTechniqueSelector ? 'Close settings' : 'Open settings'}
        >
          <Settings style={{ width: '24px', height: '24px', color: '#3a7ddc' }} />
        </button>

        {/* Settings Panel */}
        <AnimatePresence>
          {showSettings && (
            <SettingsPanel
              settings={settings}
              onChange={handleSettingsChange}
              onClose={() => setShowSettings(false)}
            />
          )}
        </AnimatePresence>

        {/* Technique Selector - Display cards vertically centered when open */}
        {showTechniqueSelector && (
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
              onClick={() => setShowTechniqueSelector(false)}
            />
            <div
              style={{
                position: 'fixed',
                top: '50%',
                left: '50%',
                transform: 'translate(-50%, -50%)',
                zIndex: 1000,
                display: 'flex',
                flexDirection: 'column',
                gap: '12px',
                maxWidth: '320px'
              }}
            >
            {BREATHING_TECHNIQUES.map(technique => {
              const isSelected = technique.id === selectedTechniqueId
              return (
                <button
                  key={technique.id}
                  onClick={() => {
                    setSelectedTechniqueId(technique.id)
                    setShowTechniqueSelector(false)
                    // Reset when changing technique
                    if (running) {
                      setRunning(false)
                      setPhase('intro')
                      setCycle(1)
                    }
                  }}
                  style={{
                    padding: '1rem',
                    borderRadius: '12px',
                    border: `2px solid ${isSelected ? '#3b82f6' : 'transparent'}`,
                    background: isSelected
                      ? 'rgba(255, 255, 255, 0.9)'
                      : 'rgba(255, 255, 255, 0.85)',
                    backdropFilter: 'blur(10px)',
                    cursor: 'pointer',
                    textAlign: 'left',
                    transition: 'all 0.2s ease',
                    width: '280px',
                    boxShadow: '0 4px 20px rgba(0,0,0,0.1)'
                  }}
                  onMouseEnter={e => {
                    if (!isSelected) {
                      e.currentTarget.style.background = 'rgba(255, 255, 255, 0.95)'
                      e.currentTarget.style.transform = 'scale(1.02)'
                    }
                  }}
                  onMouseLeave={e => {
                    if (!isSelected) {
                      e.currentTarget.style.background = 'rgba(255, 255, 255, 0.85)'
                      e.currentTarget.style.transform = 'scale(1)'
                    }
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'flex-start' }}>
                    <div style={{ flex: 1 }}>
                      <h3 style={{
                        fontSize: '1rem',
                        fontWeight: '600',
                        color: '#1f2937',
                        marginBottom: '0.25rem'
                      }}>
                        {technique.name}
                      </h3>
                      <p style={{
                        fontSize: '0.875rem',
                        color: '#6b7280',
                        lineHeight: '1.4',
                        whiteSpace: 'nowrap',
                        overflow: 'hidden',
                        textOverflow: 'ellipsis'
                      }}>
                        {technique.pace.in}s in • {technique.pace.hold}s hold • {technique.pace.out}s out
                      </p>
                    </div>
                  </div>
                </button>
              )
            })}
            </div>
          </>
        )}

        {/* Main Stage - Fade out when settings open */}
        <div style={{ opacity: showTechniqueSelector ? 0 : 1, transition: 'opacity 0.3s ease' }}>
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

        {/* Footer Controls - Fade out when settings open */}
        <div style={{ opacity: showTechniqueSelector ? 0 : 1, transition: 'opacity 0.3s ease' }}>
          <Footer
            running={running}
            phase={phase}
            onStart={handleStart}
            onPause={handlePause}
            onResume={handleResume}
            onContinue={handleContinue}
          />
        </div>
      </div>
    </div>
  )
}