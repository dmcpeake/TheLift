import React, { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import Lottie from 'lottie-react'
import { Settings, SkipForward, Play, Pause, X, Heart, Smile, Users, Sparkles, Star, Plus } from 'lucide-react'
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
    <div className="min-h-screen bg-white relative">
      {/* Garden Cards - 40px from top */}
      <div style={{ position: 'absolute', top: '40px', left: '0', right: '0', zIndex: 10 }}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="grid grid-cols-5 gap-3">

            {/* Grateful Card */}
            <div className="bg-gradient-to-br from-pink-200 to-rose-300 rounded-lg p-3 min-h-[120px]">
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
            <div className="bg-gradient-to-br from-yellow-200 to-orange-300 rounded-lg p-3 min-h-[120px]">
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
            <div className="bg-gradient-to-br from-blue-200 to-indigo-300 rounded-lg p-3 min-h-[120px]">
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
            <div className="bg-gradient-to-br from-purple-200 to-pink-300 rounded-lg p-3 min-h-[120px]">
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
            <div className="bg-gradient-to-br from-green-200 to-emerald-300 rounded-lg p-3 min-h-[120px]">
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

      {/* Close Button - Fixed positioning */}
      <button
        onClick={() => navigate('/')}
        className="fixed w-12 h-12 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors z-50 shadow-lg"
        style={{
          backgroundColor: '#147fe3',
          top: '40px',
          right: '40px'
        }}
      >
        <X className="h-6 w-6 text-white" />
      </button>

      {/* Welcome Content */}
      {!showBreathing && (
        <div
          className="flex items-center justify-center p-4 transition-opacity duration-300"
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
                Take a few minutes to explore how you're feeling today.
              </p>
            </div>

            {/* Start Button */}
            <div className="flex justify-center">
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

      {/* Breathing Exercise */}
      {showBreathing && (
        <div
          className="absolute inset-0"
          style={{
            opacity: isTransitioning ? 0 : 1,
            transform: isTransitioning ? 'scale(0.8)' : 'scale(1)',
            transition: 'opacity 500ms ease-out, transform 500ms ease-out'
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
                background: 'rgba(255, 255, 255, 0.2)',
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
                background: 'rgba(255, 255, 255, 0.2)',
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

      {/* Curved bottom section with yellow background - 200px height */}
      <div
        style={{
          position: 'absolute',
          bottom: 0,
          left: 0,
          right: 0,
          height: '200px',
          backgroundColor: '#f7d145',
          zIndex: 1
        }}
      >
        {/* Top wave with depth effect - matching homepage mental health section */}
        <svg style={{
          position: 'absolute',
          top: '-80px',
          left: 0,
          width: '100%',
          height: '80px'
        }} viewBox="0 0 1440 400" preserveAspectRatio="none">
          {/* Main wave fill */}
          <path d="M0,200 C480,400 960,0 1440,200 L1440,400 L0,400 Z" fill="#f7d145"/>
          {/* Border with varied bottom edge only */}
          <path d="M0,200 C480,400 960,0 1440,200 L1440,400 C1020,-120 400,480 0,360 Z" fill="#fae568" opacity="0.6"/>
        </svg>

        {/* Theo Rose Animation - centered under start button */}
        {roseAnimation && (
          <div
            style={{
              position: 'absolute',
              bottom: '120px',
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
              style={{
                width: '100%',
                height: '100%'
              }}
              loop={true}
              autoplay={true}
            />
          </div>
        )}
      </div>
    </div>
  )
}