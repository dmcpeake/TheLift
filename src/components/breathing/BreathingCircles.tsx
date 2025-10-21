import React, { useState, useEffect, useRef, useCallback } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Settings, SkipForward, Info } from 'lucide-react'
import { createPortal } from 'react-dom'
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
  onBreathingTitleChange?: (title: string) => void;
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
    onBreathingTitleChange,
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
  const [selectedTechniqueId, setSelectedTechniqueId] = useState('belly')
  const [showInfoModal, setShowInfoModal] = useState(false)
  const [infoModalTechniqueId, setInfoModalTechniqueId] = useState<string | null>(null)

  // Use external selected technique control when embedded
  const effectiveSelectedTechniqueId = embedded && externalSelectedTechniqueId !== undefined ? externalSelectedTechniqueId : selectedTechniqueId
  const handleSelectedTechniqueIdChange = embedded && onExternalSelectedTechniqueIdChange ? onExternalSelectedTechniqueIdChange : setSelectedTechniqueId
  const [sessionId] = useState(() => crypto.randomUUID())
  const [roseAnimation, setRoseAnimation] = useState(null)
  const [techniqueAnimations, setTechniqueAnimations] = useState<Record<string, any>>({})
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

  // Load technique animations for preview
  useEffect(() => {
    const animationFiles: Record<string, string> = {
      belly: '/Breathe01.json',
      box: '/box breathing 4-4-4.json',
      balloon: '/BreatheCircle.json'
    }

    const loadAnimations = async () => {
      const loadedAnimations: Record<string, any> = {}

      for (const [id, file] of Object.entries(animationFiles)) {
        try {
          const response = await fetch(file)
          const data = await response.json()
          loadedAnimations[id] = data
        } catch (error) {
          console.error(`Error loading animation for ${id}:`, error)
        }
      }

      setTechniqueAnimations(loadedAnimations)
    }

    loadAnimations()
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
        setTimeout(() => onComplete?.(), 4000)
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

  const getBreathingTechniqueInfo = (id: string) => {
    switch (id) {
      case 'balloon':
        return {
          title: 'Balloon Breathing',
          sections: [
            {
              heading: 'What it is:',
              content: 'Unbroken, smooth, slow breathing — no pause between inhale and exhale. Can also be called cyclical breathing or coherent breathing.'
            },
            {
              heading: 'Great for:',
              items: [
                'Inducing calm and presence',
                'Regulating the nervous system gently',
                'Entering a meditative or flow state',
                'Helping children relax without structured patterns'
              ]
            },
            {
              heading: 'Best used when:',
              items: [
                'Practising mindfulness or gentle grounding',
                'Calming down gradually (e.g. after a meltdown or busy environment)',
                'Working with younger children or neurodivergent individuals'
              ]
            }
          ]
        }
      case 'belly':
        return {
          title: 'Belly Breathing',
          sections: [
            {
              heading: 'What it is:',
              content: 'Breathing deeply into your abdomen (not your chest), engaging the diaphragm.'
            },
            {
              heading: 'Great for:',
              items: [
                'Reducing anxiety & stress',
                'Activating the parasympathetic nervous system (rest & digest)',
                'Improving focus and emotional regulation',
                'Helping kids & adults with sensory overload, panic, or ADHD',
                'Regulating heart rate'
              ]
            },
            {
              heading: 'Best used when:',
              items: [
                'You feel anxious, overwhelmed, or unfocused',
                'Before sleep or in calming routines',
                'In trauma-informed or grounding interventions'
              ]
            }
          ]
        }
      case 'box':
        return {
          title: 'Box Breathing',
          sections: [
            {
              heading: 'What it is:',
              content: 'Breathing in a structured rhythm: Inhale – Hold – Exhale – Hold, typically 4 seconds each.'
            },
            {
              heading: 'Great for:',
              items: [
                'Improving focus & concentration',
                'Managing high-pressure or performance moments',
                'Reducing stress while staying alert',
                'Training emotional control (used by Navy SEALs, athletes, etc.)'
              ]
            },
            {
              heading: 'Best used when:',
              items: [
                'Preparing for a challenging task or public speaking',
                'Regulating nerves without getting too relaxed',
                'Teaching kids structured coping tools'
              ]
            }
          ]
        }
      default:
        return {
          title: 'Breathing Technique',
          sections: []
        }
    }
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
                {BREATHING_TECHNIQUES.filter(t => t.id !== 'test').map(technique => {
                  const isSelected = technique.id === effectiveSelectedTechniqueId
                  return (
                    <div
                      key={technique.id}
                      style={{
                        position: 'relative'
                      }}
                    >
                      <button
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
                          width: '320px',
                          boxShadow: '0 4px 20px rgba(0,0,0,0.1)'
                        }}
                      >
                      <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                        <div style={{ minWidth: '216px' }}>
                          <div style={{ fontSize: '1rem', fontWeight: '600', color: '#1f2937', marginBottom: '0.25rem' }}>
                            {technique.name}
                          </div>
                          <div style={{ fontSize: '0.875rem', color: '#6b7280', whiteSpace: 'nowrap' }}>
                            {technique.description}
                          </div>
                        </div>
                        {/* Lottie Animation Preview */}
                        {techniqueAnimations[technique.id] && (
                          <div style={{
                            width: '60px',
                            height: '60px',
                            flexShrink: 0,
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center'
                          }}>
                            <Lottie
                              animationData={techniqueAnimations[technique.id]}
                              loop={true}
                              autoplay={true}
                              style={{
                                width: '100%',
                                height: '100%'
                              }}
                            />
                          </div>
                        )}
                      </div>
                    </button>

                    {/* Info Icon - Positioned absolutely to the right */}
                    <div
                      onClick={() => {
                        setInfoModalTechniqueId(technique.id)
                        setShowInfoModal(true)
                      }}
                      style={{
                        position: 'absolute',
                        top: '50%',
                        left: 'calc(100% + 20px)',
                        transform: 'translateY(-50%)',
                        width: '30px',
                        height: '30px',
                        backgroundColor: '#3b82f6',
                        borderRadius: '50%',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        cursor: 'pointer'
                      }}
                    >
                      <Info size={18} color="white" />
                    </div>
                  </div>
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
            running={running}
            onTitleChange={onBreathingTitleChange}
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

      {/* Breathing Technique Info Modal */}
      {showInfoModal && infoModalTechniqueId && createPortal(
        <div
          style={{
            position: 'fixed',
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            backgroundColor: 'rgba(0, 0, 0, 0.8)',
            zIndex: 9999
          }}
          onClick={() => setShowInfoModal(false)}
        >
          <div
            style={{
              position: 'absolute',
              top: '20px',
              left: '20px',
              right: '20px',
              bottom: '20px',
              backgroundColor: 'white',
              borderRadius: '8px',
              padding: '20px',
              display: 'flex',
              flexDirection: 'column',
              overflow: 'hidden',
              maxWidth: 'calc(896px + 40px)',
              margin: '0 auto'
            }}
            onClick={(e) => e.stopPropagation()}
          >
            {/* Header */}
            <div style={{ textAlign: 'center', marginBottom: '20px' }}>
              <h2 style={{ fontSize: '24px', fontWeight: '600', color: '#111827', marginBottom: '16px' }}>
                {BREATHING_TECHNIQUES.find(t => t.id === infoModalTechniqueId)?.name}
              </h2>
              <div style={{
                width: '100%',
                height: '1px',
                borderTop: '1px dashed #d1d5db',
                marginBottom: '0'
              }} />
            </div>

            {/* Content area */}
            <div style={{
              flex: 1,
              overflow: 'auto'
            }}>
              <div style={{ padding: '20px', color: '#374151' }}>
                {(() => {
                  const info = getBreathingTechniqueInfo(infoModalTechniqueId)
                  return info.sections.map((section, idx) => (
                    <div key={idx} style={{ marginBottom: '24px' }}>
                      <h3 style={{
                        fontSize: '18px',
                        fontWeight: '600',
                        color: '#1f2937',
                        marginBottom: '12px'
                      }}>
                        {section.heading}
                      </h3>
                      {section.content && (
                        <p style={{
                          color: '#374151',
                          lineHeight: '1.6',
                          marginBottom: '8px'
                        }}>
                          {section.content}
                        </p>
                      )}
                      {section.items && (
                        <ul style={{
                          paddingLeft: '24px',
                          color: '#374151',
                          lineHeight: '1.8'
                        }}>
                          {section.items.map((item, itemIdx) => (
                            <li key={itemIdx} style={{ marginBottom: '8px' }}>
                              {item}
                            </li>
                          ))}
                        </ul>
                      )}
                    </div>
                  ))
                })()}
              </div>
            </div>

            {/* Footer */}
            <div style={{
              borderTop: '1px solid #e5e7eb',
              paddingTop: '20px',
              marginTop: '0px'
            }}>
              <button
                onClick={() => setShowInfoModal(false)}
                style={{
                  width: '100%',
                  padding: '12px',
                  textAlign: 'center',
                  color: '#3a7ddc',
                  fontWeight: '500',
                  backgroundColor: 'transparent',
                  border: 'none',
                  cursor: 'pointer',
                  fontSize: '16px'
                }}
              >
                CLOSE
              </button>
            </div>
          </div>
        </div>,
        document.body
      )}
    </div>
  )
}