import React, { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import { ProgressHeader } from '../shared/ProgressHeader'
import Lottie from 'lottie-react'
import { Settings, SkipForward, Play, Pause, Users, Sparkles, Star, Plus, LogOut, X, Heart, Smile } from 'lucide-react'
import { BreathingCircles } from '../breathing/BreathingCircles'

// Force deployment refresh

export function CheckInHome() {
  const navigate = useNavigate()
  const [roseAnimation, setRoseAnimation] = useState(null)
  const [showBreathing, setShowBreathing] = useState(false)
  const [isTransitioning, setIsTransitioning] = useState(false)
  const [showTechniqueSelector, setShowTechniqueSelector] = useState(false)
  const [selectedTechniqueId, setSelectedTechniqueId] = useState('balloon')
  const [breathingStarted, setBreathingStarted] = useState(false)
  const [isBreathingRunning, setIsBreathingRunning] = useState(false)
  const [buttonAnimationKey, setButtonAnimationKey] = useState(0)
  const breathingStartRef = useRef<(() => void) | null>(null)
  const breathingPauseRef = useRef<(() => void) | null>(null)
  const breathingResumeRef = useRef<(() => void) | null>(null)

  // Garden card states
  const [gratefulItems, setGratefulItems] = useState<string[]>([])
  const [happinessItems, setHappinessItems] = useState<string[]>([])
  const [kindActItems, setKindActItems] = useState<string[]>([])
  const [glimmerItems, setGlimmerItems] = useState<string[]>([])
  const [progressItems, setProgressItems] = useState<string[]>([])

  const addItem = (text: string, type: 'grateful' | 'happiness' | 'kindAct' | 'glimmer' | 'progress') => {
    if (!text.trim()) return

    switch (type) {
      case 'grateful':
        if (gratefulItems.length < 3) setGratefulItems([...gratefulItems, text.trim()])
        break
      case 'happiness':
        if (happinessItems.length < 3) setHappinessItems([...happinessItems, text.trim()])
        break
      case 'kindAct':
        if (kindActItems.length < 3) setKindActItems([...kindActItems, text.trim()])
        break
      case 'glimmer':
        if (glimmerItems.length < 3) setGlimmerItems([...glimmerItems, text.trim()])
        break
      case 'progress':
        if (progressItems.length < 3) setProgressItems([...progressItems, text.trim()])
        break
    }
  }

  // Load the Lottie animation
  useEffect(() => {
    fetch('/theo-rose.json')
      .then(response => response.json())
      .then(data => setRoseAnimation(data))
      .catch(error => console.error('Error loading rose animation:', error))
  }, [])

  // Trigger button animation when breathing UI first appears
  useEffect(() => {
    if (showBreathing) {
      setButtonAnimationKey(prev => prev + 1)
    }
  }, [showBreathing])

  const handleStartClick = () => {
    setIsTransitioning(true)
    // Fade out welcome content, then fade in breathing
    setTimeout(() => {
      setShowBreathing(true)
      setTimeout(() => {
        setIsTransitioning(false)
      }, 50)
    }, 300)
  }

  const handleBreathingComplete = () => {
    navigate('/checkin/flow/mood')
  }

  const handleBreathingExit = (reason: string) => {
    if (reason === 'skip') {
      navigate('/checkin/flow/mood')
    }
  }

  return (
    <>
      <style jsx>{`
        @keyframes circleExpand {
          0% {
            width: 56px;
            border-radius: 28px;
          }
          100% {
            width: 140px;
            border-radius: 28px;
          }
        }
        @keyframes textFadeIn {
          0% {
            opacity: 0;
          }
          60% {
            opacity: 0;
          }
          100% {
            opacity: 1;
          }
        }
      `}</style>
      <div className="min-h-screen bg-white relative overflow-hidden" style={{
        backgroundImage: 'url(/background.svg)',
        backgroundSize: window.innerWidth > 768 ? 'cover' : 'cover',
        backgroundPosition: window.innerWidth > 768 ? 'center bottom' : 'center',
        backgroundAttachment: window.innerWidth > 768 ? 'fixed' : 'scroll',
        backgroundRepeat: 'no-repeat'
      }}>
      {/* Garden Cards - 40px from top - hide when breathing */}
      {!showBreathing && (
        <div className="garden-cards-container" style={{ position: 'absolute', top: '20px', left: '0', right: '0', zIndex: 10, opacity: 0 }}>
        <style jsx>{`
          .cards-container {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 0.75rem;
          }
          @media (max-width: 768px) {
            .cards-container {
              display: none !important;
            }
            .welcome-content-mobile {
              display: flex !important;
              align-items: flex-start !important;
              justify-content: center !important;
              min-height: auto !important;
              padding-top: 140px !important;
            }
            .welcome-content-mobile .max-w-2xl {
              margin-top: 0 !important;
            }
            .mobile-start-button {
              position: fixed !important;
              bottom: 32px !important;
              left: 50% !important;
              transform: translateX(-50%) !important;
              z-index: 1000 !important;
            }
            .desktop-start-button {
              display: none !important;
            }
            .theo-animation {
              bottom: 75px !important;
            }
            .garden-cards-container {
              display: none !important;
            }
          }
          @media (min-width: 769px) {
            .welcome-content-mobile {
              padding-top: 0 !important;
              min-height: calc(100vh - 200px) !important;
              align-items: center !important;
            }
            .mobile-start-button {
              display: none !important;
            }
            .desktop-start-button {
              display: flex !important;
            }
            .logout-button {
              top: 40px !important;
              margin-top: 0 !important;
              transform: none !important;
              width: 2.5rem !important;
              height: 2.5rem !important;
            }
            .logout-button .logout-icon {
              width: 1.25rem !important;
              height: 1.25rem !important;
            }
            .breathing-title-checkin-mobile {
              font-size: 28px !important;
              margin-top: 30px !important;
            }
          }
        `}</style>
        <div className="max-w-7xl mx-auto md:px-6">
          <div className="cards-container">

            {/* Grateful Card */}
            <div className="card-item bg-gradient-to-br from-pink-200 to-rose-300 rounded-lg p-3 min-h-[120px]">
              <div className="flex items-center gap-1 mb-2">
                <Heart className="h-3 w-3 text-rose-800" />
                <h3 className="text-xs font-semibold text-rose-800">Grateful</h3>
              </div>
              <div className="space-y-1">
                {gratefulItems.map((item, index) => (
                  <div key={index} className="text-xs text-rose-800 bg-white/30 rounded p-1">
                    {item.length > 20 ? item.substring(0, 20) + '...' : item}
                  </div>
                ))}
                {gratefulItems.length < 3 && (
                  <button
                    onClick={() => {
                      const text = prompt('What are you grateful for?')
                      if (text) addItem(text, 'grateful')
                    }}
                    className="w-full text-xs text-rose-800 bg-white/30 rounded p-1 hover:bg-white/40 transition-colors flex items-center justify-center gap-1"
                  >
                    <Plus className="h-2 w-2" />
                    Add
                  </button>
                )}
              </div>
            </div>

            {/* Happiness Card */}
            <div className="card-item bg-gradient-to-br from-yellow-200 to-orange-300 rounded-lg p-3 min-h-[120px]">
              <div className="flex items-center gap-1 mb-2">
                <Smile className="h-3 w-3 text-orange-800" />
                <h3 className="text-xs font-semibold text-orange-800">Happy</h3>
              </div>
              <div className="space-y-1">
                {happinessItems.map((item, index) => (
                  <div key={index} className="text-xs text-orange-800 bg-white/30 rounded p-1">
                    {item.length > 20 ? item.substring(0, 20) + '...' : item}
                  </div>
                ))}
                {happinessItems.length < 3 && (
                  <button
                    onClick={() => {
                      const text = prompt('What made you happy?')
                      if (text) addItem(text, 'happiness')
                    }}
                    className="w-full text-xs text-orange-800 bg-white/30 rounded p-1 hover:bg-white/40 transition-colors flex items-center justify-center gap-1"
                  >
                    <Plus className="h-2 w-2" />
                    Add
                  </button>
                )}
              </div>
            </div>

            {/* Kind Acts Card */}
            <div className="card-item bg-gradient-to-br from-blue-200 to-indigo-300 rounded-lg p-3 min-h-[120px]">
              <div className="flex items-center gap-1 mb-2">
                <Users className="h-3 w-3 text-indigo-800" />
                <h3 className="text-xs font-semibold text-indigo-800">Kind Acts</h3>
              </div>
              <div className="space-y-1">
                {kindActItems.map((item, index) => (
                  <div key={index} className="text-xs text-indigo-800 bg-white/30 rounded p-1">
                    {item.length > 20 ? item.substring(0, 20) + '...' : item}
                  </div>
                ))}
                {kindActItems.length < 3 && (
                  <button
                    onClick={() => {
                      const text = prompt('What kind act did you do?')
                      if (text) addItem(text, 'kindAct')
                    }}
                    className="w-full text-xs text-indigo-800 bg-white/30 rounded p-1 hover:bg-white/40 transition-colors flex items-center justify-center gap-1"
                  >
                    <Plus className="h-2 w-2" />
                    Add
                  </button>
                )}
              </div>
            </div>

            {/* Glimmers Card */}
            <div className="card-item bg-gradient-to-br from-purple-200 to-pink-300 rounded-lg p-3 min-h-[120px]">
              <div className="flex items-center gap-1 mb-2">
                <Sparkles className="h-3 w-3 text-purple-800" />
                <h3 className="text-xs font-semibold text-purple-800">Glimmers</h3>
              </div>
              <div className="space-y-1">
                {glimmerItems.map((item, index) => (
                  <div key={index} className="text-xs text-purple-800 bg-white/30 rounded p-1">
                    {item.length > 20 ? item.substring(0, 20) + '...' : item}
                  </div>
                ))}
                {glimmerItems.length < 3 && (
                  <button
                    onClick={() => {
                      const text = prompt('What sparked joy today?')
                      if (text) addItem(text, 'glimmer')
                    }}
                    className="w-full text-xs text-purple-800 bg-white/30 rounded p-1 hover:bg-white/40 transition-colors flex items-center justify-center gap-1"
                  >
                    <Plus className="h-2 w-2" />
                    Add
                  </button>
                )}
              </div>
            </div>

            {/* Progress Card */}
            <div className="card-item bg-gradient-to-br from-green-200 to-emerald-300 rounded-lg p-3 min-h-[120px]">
              <div className="flex items-center gap-1 mb-2">
                <Star className="h-3 w-3 text-emerald-800" />
                <h3 className="text-xs font-semibold text-emerald-800">Progress</h3>
              </div>
              <div className="space-y-1">
                {progressItems.map((item, index) => (
                  <div key={index} className="text-xs text-emerald-800 bg-white/30 rounded p-1">
                    {item.length > 20 ? item.substring(0, 20) + '...' : item}
                  </div>
                ))}
                {progressItems.length < 3 && (
                  <button
                    onClick={() => {
                      const text = prompt('What progress did you make?')
                      if (text) addItem(text, 'progress')
                    }}
                    className="w-full text-xs text-emerald-800 bg-white/30 rounded p-1 hover:bg-white/40 transition-colors flex items-center justify-center gap-1"
                  >
                    <Plus className="h-2 w-2" />
                    Add
                  </button>
                )}
              </div>
            </div>

          </div>
        </div>
        </div>
      )}

      {/* Close Button - Fixed positioning - hide when breathing */}
      {!showBreathing && (
        <button
        onClick={() => navigate('/')}
        className="logout-button fixed w-12 h-12 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors z-50 shadow-lg"
        style={{
          backgroundColor: 'white',
          border: '1px solid #147fe3',
          top: '40px',
          right: '40px'
        }}
      >
        <LogOut className="logout-icon h-6 w-6" style={{ color: '#147fe3' }} />
        </button>
      )}

      {/* Progress Header - show when breathing */}
      {showBreathing && (
        <>
          <ProgressHeader
            currentStep="breathing"
            completedData={{}}
            currentStepHasSelection={false}
            emotionGridStep={1}
            // No navigation on breathing page
          />

          {/* Close button positioned at vertical center right */}
          <div className="fixed top-0 right-4 z-50 flex items-center" style={{ height: '80px' }}>
            <button
              onClick={() => {
                setShowBreathing(false)
                setIsTransitioning(false)
                setBreathingStarted(false)
                setIsBreathingRunning(false)
                setShowTechniqueSelector(false)
              }}
              className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors shadow-lg"
              style={{ backgroundColor: '#147fe3' }}
            >
              <X className="h-5 w-5 text-white" />
            </button>
          </div>
        </>
      )}

      {/* Welcome Content */}
      {!showBreathing && (
        <div
          className="welcome-content-mobile flex items-start justify-center p-4 transition-opacity duration-300"
          style={{
            minHeight: 'auto',
            opacity: isTransitioning ? 0 : 1
          }}
        >
          <div className="max-w-2xl mx-auto text-center">
            {/* Header */}
            <div className="mb-8">
              <h1 className="text-4xl font-bold text-gray-900 mb-4">
                Ready for your check in?
              </h1>
              <p className="text-lg text-gray-600 max-w-lg mx-auto">
                Take a moment to explore how you're feeling.
              </p>
            </div>

            {/* Start Button - desktop only */}
            <div className="flex justify-center desktop-start-button">
              <button
                onClick={handleStartClick}
                className="font-semibold text-lg transition-all duration-200"
                style={{
                  backgroundColor: '#e87e67',
                  color: 'white',
                  height: '60px',
                  borderRadius: '30px',
                  paddingLeft: '50px',
                  paddingRight: '50px',
                  border: '2px solid white',
                  cursor: 'pointer',
                  boxShadow: '0 5px 40px rgba(0, 0, 0, 0.25)'
                }}
                onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#d66e5a'}
                onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#e87e67'}
              >
                START
              </button>
            </div>

          </div>
        </div>
      )}

      {/* Title header for breathing */}
      {showBreathing && (
        <div className="text-center" style={{ position: 'fixed', top: '90px', left: 0, right: 0, zIndex: 40 }}>
          <h1 className="breathing-title-checkin-mobile text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em', marginTop: '50px' }}>Let's breathe!</h1>
        </div>
      )}

      {/* Breathing Exercise */}
      {showBreathing && (
        <div
            className="absolute inset-0 overflow-hidden"
            style={{
              opacity: isTransitioning ? 0 : 1,
              transform: isTransitioning ? 'scale(0.8)' : 'scale(1)',
              transition: 'opacity 500ms ease-out, transform 500ms ease-out',
              paddingTop: '200px',
              paddingBottom: '150px',
              height: '100vh',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '100vw',
              left: 0,
              right: 0
            }}
          >
          <BreathingCircles
            cycles={5}
            muted={false}
            captions={true}
            embedded={true}
            externalShowTechniqueSelector={showTechniqueSelector}
            onExternalTechniqueSelectorChange={setShowTechniqueSelector}
            externalSelectedTechniqueId={selectedTechniqueId}
            onExternalSelectedTechniqueIdChange={setSelectedTechniqueId}
            externalBreathingStarted={breathingStarted}
            onExternalBreathingStartedChange={setBreathingStarted}
            onExternalStart={(startFn) => {
              breathingStartRef.current = () => {
                startFn()
                setBreathingStarted(true)
              }
            }}
            onExternalPause={(pauseFn) => { breathingPauseRef.current = pauseFn }}
            onExternalResume={(resumeFn) => { breathingResumeRef.current = resumeFn }}
            onExternalRunningChange={setIsBreathingRunning}
            onComplete={handleBreathingComplete}
            onExit={handleBreathingExit}
          />
        </div>
      )}

      {/* Breathing Control Buttons */}
      {showBreathing && (
        <>
          {/* Button Container */}
          <div style={{
            position: 'fixed',
            bottom: '32px',
            left: '50%',
            transform: 'translateX(-50%)',
            display: 'flex',
            gap: '20px',
            alignItems: 'center',
            zIndex: 1001
          }}>
            {/* Settings Button */}
            <button
              onClick={() => {
                console.log('Technique selector clicked!');
                setShowTechniqueSelector(!showTechniqueSelector);
              }}
              style={{
                backgroundColor: 'white',
                border: '2px solid #3a7ddc',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#f8fafc'
                e.currentTarget.style.borderColor = '#2e6bc7'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'white'
                e.currentTarget.style.borderColor = '#3a7ddc'
              }}
              aria-label="Open settings"
            >
              <Settings style={{ width: '24px', height: '24px', color: '#3a7ddc' }} />
            </button>

            {/* Play/Pause Button */}
            <button
              key={`play-${buttonAnimationKey}`}
              onClick={() => {
                if (!breathingStarted) {
                  console.log('Play clicked!');
                  if (breathingStartRef.current) {
                    breathingStartRef.current();
                  }
                } else if (isBreathingRunning) {
                  console.log('Pause clicked!');
                  if (breathingPauseRef.current) {
                    breathingPauseRef.current();
                  }
                } else {
                  console.log('Resume clicked!');
                  if (breathingResumeRef.current) {
                    breathingResumeRef.current();
                  }
                }
              }}
              style={{
                width: '140px',
                height: '56px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                borderRadius: '28px',
                backgroundColor: '#3a7ddc',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                border: 'none',
                cursor: 'pointer',
                transition: 'background-color 0.3s ease',
                color: 'white',
                fontSize: '16px',
                fontWeight: '600',
                animation: 'circleExpand 0.4s ease-out'
              }}
              onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
              onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
              aria-label={!breathingStarted ? "Start breathing" : isBreathingRunning ? "Pause breathing" : "Resume breathing"}
            >
              <span style={{ animation: 'textFadeIn 0.4s ease-out' }}>
                {breathingStarted && isBreathingRunning ? 'PAUSE' : 'PLAY'}
              </span>
            </button>

            {/* Skip Button */}
            <button
              onClick={() => {
                console.log('Skip clicked!');
                handleBreathingExit('skip');
              }}
              style={{
                backgroundColor: 'white',
                border: '2px solid #3a7ddc',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#f8fafc'
                e.currentTarget.style.borderColor = '#2e6bc7'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'white'
                e.currentTarget.style.borderColor = '#3a7ddc'
              }}
              aria-label="Skip to mood selection"
            >
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
                <polyline points="9,18 15,12 9,6"></polyline>
              </svg>
            </button>
          </div>
        </>
      )}


      {/* Yellow swoosh section at bottom - only show when breathing */}
      {showBreathing && <YellowSwoosh />}

      {/* Start Button - only show when not breathing */}
      {!showBreathing && (
        <div className="flex justify-center mobile-start-button" style={{ position: 'fixed', bottom: '32px', left: '50%', transform: 'translateX(-50%)', zIndex: 20 }}>
          <button
            onClick={handleStartClick}
            className="transition-all duration-200"
            style={{
              backgroundColor: '#e87e67',
              color: 'white',
              width: '180px',
              height: '56px',
              borderRadius: '28px',
              border: '2px solid white',
              cursor: 'pointer',
              fontSize: '16px',
              fontWeight: '600',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: '0 5px 40px rgba(0, 0, 0, 0.25)'
            }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#d66e5a'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#e87e67'}
          >
            START
          </button>
        </div>
      )}

      {/* Theo Rose Animation - centered under start button - only show when not breathing */}
      {roseAnimation && !showBreathing && (
        <div
          className="theo-animation"
          style={{
            position: 'fixed',
            bottom: '100px',
            left: 'calc(50% + 60px)',
            transform: 'translateX(-50%)',
            width: '300px',
            height: '300px',
            zIndex: 10,
            opacity: isTransitioning ? 0 : 1,
            transition: 'opacity 300ms ease-in-out'
          }}
        >
          <Lottie
            animationData={roseAnimation}
            loop={true}
            autoplay={true}
          />
        </div>
      )}
    </div>
    </>
  )
}