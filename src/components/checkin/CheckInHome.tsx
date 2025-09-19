import React, { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import Lottie from 'lottie-react'
import { Settings, SkipForward, Play, Pause, Heart, Smile, Users, Sparkles, Star, Plus, LogOut, X, Compass } from 'lucide-react'
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
    <div className="min-h-screen bg-white relative overflow-hidden">
      {/* Garden Cards - 40px from top - hide when breathing */}
      {!showBreathing && (
        <div className="garden-cards-container" style={{ position: 'absolute', top: '40px', left: '0', right: '0', zIndex: 10 }}>
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
              display: block !important;
              align-items: flex-start !important;
              justify-content: flex-start !important;
              min-height: auto !important;
              padding-top: 120px !important;
            }
            .welcome-content-mobile .max-w-2xl {
              margin-top: 0 !important;
            }
            .mobile-start-button {
              position: fixed !important;
              bottom: 40px !important;
              left: 50% !important;
              transform: translateX(-50%) !important;
              z-index: 1000 !important;
            }
            .theo-animation {
              bottom: 120px !important;
            }
            .garden-cards-container {
              display: none !important;
            }
            .logout-button {
              top: 40px !important;
              margin-top: 0 !important;
              transform: none !important;
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
          top: '20px',
          right: '16px'
        }}
      >
        <LogOut className="h-6 w-6" style={{ color: '#147fe3' }} />
        </button>
      )}

      {/* Progress Header - show when breathing */}
      {showBreathing && (
        <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'white', boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)', height: '80px', borderRadius: '0' }}>
          <div className="mx-auto px-6" style={{ maxWidth: '300px', height: '80px', position: 'relative' }}>

            {/* Icons row - positioned at top */}
            <div className="grid grid-cols-3 gap-2 w-full" style={{ paddingTop: '10px', marginBottom: '6px' }}>
              {[{ icon: Heart, name: 'Mood meter' }, { icon: Smile, name: 'My emotions' }, { icon: Compass, name: 'Wellbeing' }].map((segment) => {
                const Icon = segment.icon
                return (
                  <div key={segment.name} className="text-center">
                    <div style={{ padding: '10px', margin: '-10px' }}>
                      <Icon className="h-6 w-6 mx-auto" style={{ color: '#9ca3af' }} />
                    </div>
                  </div>
                )
              })}
            </div>

            {/* Progress bar with separators - positioned 10px below icons */}
            <div className="relative w-full bg-gray-200 rounded-full h-2">
              {/* Main progress bar - 0% since no steps started */}
              <div
                className="h-2 rounded-full transition-all duration-300"
                style={{
                  width: '0%',
                  backgroundColor: '#3a7ddc'
                }}
              />
              {/* Section separators */}
              <div className="absolute top-0 bottom-0 w-px bg-white" style={{ left: '33.33%' }} />
              <div className="absolute top-0 bottom-0 w-px bg-white" style={{ left: '66.66%' }} />
            </div>

            {/* Step labels - positioned 10px below progress bar */}
            <div className="grid grid-cols-3 gap-2 w-full" style={{ marginTop: '5px' }}>
              {[{ name: 'Mood meter' }, { name: 'My emotions' }, { name: 'Wellbeing' }].map((segment) => {
                return (
                  <div key={segment.name} className="text-center">
                    <span className="text-xs" style={{ color: '#9ca3af' }}>
                      {segment.name}
                    </span>
                  </div>
                )
              })}
            </div>
          </div>

          {/* Close button positioned at vertical center right */}
          <button
            onClick={() => {
              setShowBreathing(false)
              setIsTransitioning(false)
              setBreathingStarted(false)
              setIsBreathingRunning(false)
              setShowTechniqueSelector(false)
            }}
            className="absolute top-1/2 right-4 w-10 h-10 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors shadow-lg"
            style={{ backgroundColor: '#147fe3', transform: 'translateY(-50%)' }}
          >
            <X className="h-5 w-5 text-white" />
          </button>
        </div>
      )}

      {/* Welcome Content */}
      {!showBreathing && (
        <div
          className="welcome-content-mobile flex items-center justify-center p-4 transition-opacity duration-300"
          style={{
            minHeight: 'calc(100vh - 200px)',
            paddingTop: '180px',
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

            {/* Start Button */}
            <div className="flex justify-center mobile-start-button">
              <button
                onClick={handleStartClick}
                className="font-semibold text-lg transition-all duration-200"
                style={{
                  backgroundColor: '#e87e67',
                  color: 'white',
                  height: '60px',
                  borderRadius: '30px',
                  paddingLeft: '30px',
                  paddingRight: '30px',
                  border: 'none',
                  cursor: 'pointer',
                  boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)'
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
        <>
          <style jsx>{`
            @media (max-width: 768px) {
              .breathing-title-checkin-mobile {
                font-size: 28px !important;
                margin-top: 30px !important;
              }
            }
          `}</style>
          <div className="text-center" style={{ position: 'fixed', top: '90px', left: 0, right: 0, zIndex: 40 }}>
            <h1 className="breathing-title-checkin-mobile text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em', marginTop: '50px' }}>Let's breathe!</h1>
          </div>
        </>
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
            bottom: '40px',
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
                background: 'rgba(255, 255, 255, 0.5)',
                border: 'none',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px'
              }}
              aria-label="Open settings"
            >
              <Settings style={{ width: '24px', height: '24px', color: '#3a7ddc' }} />
            </button>

            {/* Play/Pause Button */}
            <button
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
                background: '#3a7ddc',
                color: 'white',
                border: 'none',
                borderRadius: '50%',
                cursor: 'pointer',
                width: '56px',
                height: '56px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                boxShadow: '0 4px 20px rgba(0,0,0,0.1)'
              }}
              aria-label={!breathingStarted ? "Start breathing" : isBreathingRunning ? "Pause breathing" : "Resume breathing"}
            >
              {breathingStarted && isBreathingRunning ? (
                <Pause style={{ width: '24px', height: '24px', color: 'white' }} />
              ) : (
                <Play style={{ width: '24px', height: '24px', color: 'white' }} />
              )}
            </button>

            {/* Skip Button */}
            <button
              onClick={() => {
                console.log('Skip clicked!');
                handleBreathingExit('skip');
              }}
              style={{
                background: 'rgba(255, 255, 255, 0.5)',
                border: 'none',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '56px',
                height: '56px'
              }}
              aria-label="Skip to mood selection"
            >
              <SkipForward style={{ width: '24px', height: '24px', color: '#3a7ddc' }} />
            </button>
          </div>
        </>
      )}


      {/* Yellow swoosh section at bottom */}
      <YellowSwoosh>
        {/* Theo Rose Animation - centered under start button */}
        {roseAnimation && (
          <div
            className="theo-animation"
            style={{
              position: 'absolute',
              bottom: '20px',
              left: '50%',
              transform: 'translateX(-50%)',
              width: '300px',
              height: '300px',
              zIndex: 10,
              opacity: isTransitioning || showBreathing ? 0 : 1,
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
      </YellowSwoosh>
    </div>
  )
}