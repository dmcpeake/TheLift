import React, { useState, useEffect, useRef } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import { ProgressHeader } from '../shared/ProgressHeader'
import Lottie from 'lottie-react'
import { Settings, SkipForward, Play, Pause, Users, Sparkles, Star, Plus, LogOut, X, Heart, Smile } from 'lucide-react'
import { BreathingCircles } from '../breathing/BreathingCircles'
import './checkin-mobile.css'

// Force deployment refresh - button should show START

export function CheckInHome() {
  const navigate = useNavigate()
  const location = useLocation()
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
        @keyframes leafGroup {
          0% {
            transform: translateX(-150px) translateY(0);
            opacity: 0;
          }
          10% {
            opacity: 0.9;
          }
          90% {
            opacity: 0.9;
          }
          100% {
            transform: translateX(calc(100vw + 150px)) translateY(-50vh);
            opacity: 0;
          }
        }
        @keyframes leafFloat1 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(-10px, -15px) rotate(45deg);
          }
          50% {
            transform: translate(-25px, 10px) rotate(-30deg);
          }
          75% {
            transform: translate(-35px, -8px) rotate(60deg);
          }
          100% {
            transform: translate(-50px, 0) rotate(360deg);
          }
        }
        @keyframes leafFloat2 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(15px, 12px) rotate(-45deg);
          }
          50% {
            transform: translate(30px, -20px) rotate(30deg);
          }
          75% {
            transform: translate(45px, 5px) rotate(-60deg);
          }
          100% {
            transform: translate(60px, -10px) rotate(-360deg);
          }
        }
        @keyframes leafFloat3 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(5px, -10px) rotate(30deg);
          }
          50% {
            transform: translate(10px, 15px) rotate(-45deg);
          }
          75% {
            transform: translate(15px, -5px) rotate(45deg);
          }
          100% {
            transform: translate(20px, 20px) rotate(720deg);
          }
        }
        @keyframes leafFloat4 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(-8px, 8px) rotate(-30deg);
          }
          50% {
            transform: translate(-20px, -15px) rotate(45deg);
          }
          75% {
            transform: translate(-30px, 10px) rotate(-45deg);
          }
          100% {
            transform: translate(-40px, -25px) rotate(360deg);
          }
        }
        @keyframes leafFloat5 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(12px, -5px) rotate(45deg);
          }
          50% {
            transform: translate(25px, 12px) rotate(-60deg);
          }
          75% {
            transform: translate(40px, -8px) rotate(30deg);
          }
          100% {
            transform: translate(55px, 15px) rotate(-360deg);
          }
        }
        .leaf-group {
          position: fixed;
          top: 75%;
          width: 180px;
          height: 150px;
          pointer-events: none;
          z-index: 2;
          animation: leafGroup 10s linear infinite;
        }
        .leaf {
          position: absolute;
          width: 30px;
          height: 30px;
        }
        .leaf1 {
          top: 10px;
          left: 15px;
          animation: leafFloat1 3s ease-in-out infinite;
        }
        .leaf2 {
          top: 45px;
          left: 80px;
          animation: leafFloat2 3.5s ease-in-out infinite;
          animation-delay: 0.3s;
        }
        .leaf3 {
          top: 90px;
          left: 30px;
          animation: leafFloat3 4s ease-in-out infinite;
          animation-delay: 0.6s;
        }
        .leaf4 {
          top: 20px;
          left: 120px;
          animation: leafFloat4 3.8s ease-in-out infinite;
          animation-delay: 0.9s;
        }
        .leaf5 {
          top: 75px;
          left: 100px;
          animation: leafFloat5 3.2s ease-in-out infinite;
          animation-delay: 1.2s;
        }
        @keyframes butterflyPath {
          0% {
            transform: translateX(-100px) translateY(0);
            opacity: 0;
          }
          5% {
            opacity: 0.8;
          }
          15% {
            transform: translateX(15vw) translateY(-50px);
          }
          30% {
            transform: translateX(30vw) translateY(30px);
          }
          45% {
            transform: translateX(45vw) translateY(-70px);
          }
          60% {
            transform: translateX(60vw) translateY(10px);
          }
          75% {
            transform: translateX(75vw) translateY(-60px);
          }
          90% {
            transform: translateX(90vw) translateY(20px);
          }
          95% {
            opacity: 0.8;
          }
          100% {
            transform: translateX(calc(100vw + 100px)) translateY(-30px);
            opacity: 0;
          }
        }
        @keyframes butterflyWings {
          0%, 100% {
            transform: scaleY(1) scaleX(1);
          }
          50% {
            transform: scaleY(0.3) scaleX(1.1);
          }
        }
        .butterfly {
          position: fixed;
          bottom: 15%;
          width: 40px;
          height: 40px;
          pointer-events: none;
          z-index: 3;
          opacity: 0;
          animation: butterflyPath 12s linear infinite;
          animation-delay: 2s;
          animation-fill-mode: forwards;
        }
        .butterfly svg {
          animation: butterflyWings 0.2s ease-in-out infinite;
        }

        /* Mobile Optimizations */
        @media (max-width: 768px) {
          .leaf-group {
            width: 100px !important;
            height: 100px !important;
            top: 80% !important;
          }
          .leaf {
            width: 20px !important;
            height: 20px !important;
          }
          .leaf1 { top: 5px !important; left: 10px !important; }
          .leaf2 { top: 30px !important; left: 50px !important; }
          .leaf3 { top: 60px !important; left: 20px !important; }
          .leaf4 { top: 15px !important; left: 70px !important; }
          .leaf5 { top: 50px !important; left: 65px !important; }

          .butterfly {
            width: 28px !important;
            height: 28px !important;
            bottom: 20% !important;
          }

          .welcome-content-mobile {
            padding: 0 !important;
            min-height: auto !important;
            align-items: flex-start !important;
            justify-content: flex-start !important;
            display: flex !important;
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
          }

          .welcome-content-mobile .max-w-4xl {
            margin-top: 20px !important;
            padding: 0 20px !important;
            width: 100% !important;
          }

          .welcome-content-mobile .rounded-2xl {
            background: none !important;
            backdrop-filter: none !important;
            border: none !important;
            box-shadow: none !important;
            padding: 0 !important;
            position: static !important;
            z-index: auto !important;
          }

          .welcome-content-mobile h1 {
            font-size: 28px !important;
            margin-bottom: 16px !important;
            color: #1f2937 !important;
          }

          .welcome-content-mobile p {
            font-size: 16px !important;
            margin-bottom: 24px !important;
            color: #6b7280 !important;
          }
        }
      `}</style>
      <div className={`min-h-screen bg-white relative overflow-hidden ${showBreathing ? 'breathing-active' : ''}`} style={{
        backgroundImage: !showBreathing ? 'url(/background.svg)' : undefined,
        backgroundSize: window.innerWidth > 768 ? 'cover' : 'cover',
        backgroundPosition: window.innerWidth > 768 ? 'center bottom' : 'center',
        backgroundAttachment: window.innerWidth > 768 ? 'fixed' : 'scroll',
        backgroundRepeat: 'no-repeat'
      }}>

      {/* Butterfly - only show when not breathing */}
      {!showBreathing && (
        <div className="butterfly">
          <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            {/* Left wing */}
            <ellipse cx="12" cy="20" rx="10" ry="15" fill="#FF6B9D" fillOpacity="0.7" transform="rotate(-20 12 20)"/>
            <ellipse cx="12" cy="20" rx="8" ry="12" fill="#C66FCF" fillOpacity="0.6" transform="rotate(-20 12 20)"/>
            {/* Right wing */}
            <ellipse cx="28" cy="20" rx="10" ry="15" fill="#FF6B9D" fillOpacity="0.7" transform="rotate(20 28 20)"/>
            <ellipse cx="28" cy="20" rx="8" ry="12" fill="#C66FCF" fillOpacity="0.6" transform="rotate(20 28 20)"/>
            {/* Body */}
            <ellipse cx="20" cy="20" rx="2" ry="8" fill="#4A4A4A" fillOpacity="0.8"/>
            {/* Antennae */}
            <line x1="20" y1="16" x2="17" y2="12" stroke="#4A4A4A" strokeWidth="0.5" strokeOpacity="0.6"/>
            <line x1="20" y1="16" x2="23" y2="12" stroke="#4A4A4A" strokeWidth="0.5" strokeOpacity="0.6"/>
            <circle cx="17" cy="12" r="0.8" fill="#4A4A4A" fillOpacity="0.6"/>
            <circle cx="23" cy="12" r="0.8" fill="#4A4A4A" fillOpacity="0.6"/>
          </svg>
        </div>
      )}

      {/* Animated Leaves - only show when not breathing */}
      {!showBreathing && (
        <div className="leaf-group">
          <div className="leaf leaf1">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#8BC34A" fillOpacity="0.85"/>
            </svg>
          </div>
          <div className="leaf leaf2">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#FFA726" fillOpacity="0.75"/>
            </svg>
          </div>
          <div className="leaf leaf3">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#FFD54F" fillOpacity="0.7"/>
            </svg>
          </div>
          <div className="leaf leaf4">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#FF7043" fillOpacity="0.8"/>
            </svg>
          </div>
          <div className="leaf leaf5">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#CDDC39" fillOpacity="0.65"/>
            </svg>
          </div>
        </div>
      )}
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
              justify-content: flex-start !important;
              min-height: 100vh !important;
              padding: 40px 20px 20px 20px !important;
            }
            .welcome-content-mobile .max-w-4xl {
              margin-top: 0 !important;
              margin-left: auto !important;
              margin-right: auto !important;
              width: 100% !important;
            }
            .welcome-content-mobile .rounded-2xl {
              background: transparent !important;
              backdrop-filter: none !important;
              border: none !important;
              box-shadow: none !important;
              padding: 0 !important;
            }
            .mobile-start-button {
              position: fixed !important;
              bottom: 32px !important;
              left: 50% !important;
              transform: translateX(-50%) !important;
              z-index: 10000 !important;
            }
            .desktop-start-button {
              display: none !important;
            }
            .theo-animation {
              bottom: 55px !important;
              left: calc(50% + 60px) !important;
            }
            .garden-cards-container {
              display: none !important;
            }
          }
          @media (min-width: 769px) {
            .welcome-content-mobile {
              padding: 80px !important;
              min-height: 100vh !important;
              align-items: center !important;
            }
            .mobile-start-button {
              display: none !important;
            }
            .desktop-start-button {
              display: flex !important;
            }
            .logout-button {
              top: 20px !important;
              right: 20px !important;
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
            /* Mobile breathing container adjustments */
            .breathing-container-mobile {
              padding-top: 120px !important;
              padding-bottom: 100px !important;
              height: 100vh !important;
              position: fixed !important;
              top: 0 !important;
              left: 0 !important;
              right: 0 !important;
              width: 100vw !important;
              display: flex !important;
              align-items: center !important;
              justify-content: center !important;
              z-index: 1001 !important;
            }
            /* Ensure start button is hidden when breathing */
            .breathing-active .mobile-start-button {
              display: none !important;
              visibility: hidden !important;
              opacity: 0 !important;
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

      {/* Header Bar - show when not breathing */}
      {!showBreathing && (
        <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'rgba(255, 255, 255, 0.3)', backdropFilter: 'blur(16px)', border: '1px solid rgba(255, 255, 255, 0.3)', boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)', height: '80px', borderRadius: '0' }}>
          {/* The Lift Logo and Dots */}
          <div
            className="flex items-center gap-3"
            style={{
              position: 'absolute',
              left: '16px',
              top: '50%',
              transform: 'translateY(-50%)',
              zIndex: 51
            }}
          >
            <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
              <circle cx="7" cy="23" r="4" fill="#147fe3"/>
              <circle cx="15" cy="15" r="4" fill="#147fe3"/>
              <circle cx="23" cy="7" r="4" fill="#147fe3"/>
            </svg>
            <img
              src="/TheLiftLogo.svg"
              alt="The Lift"
              className="h-5"
              style={{
                imageRendering: 'auto',
                shapeRendering: 'geometricPrecision',
                filter: 'brightness(0) saturate(100%) invert(11%) sepia(0%) saturate(7465%) hue-rotate(189deg) brightness(105%) contrast(86%)'
              }}
            />
          </div>

          {/* Navigation Links and Exit Button on the right */}
          <div className="fixed top-0 right-4 z-50 flex items-center gap-4" style={{ height: '80px' }}>
            <button
              onClick={() => navigate('/checkin/garden')}
              className="cursor-pointer transition-all hover:opacity-70 relative"
              style={{
                fontSize: '14px',
                color: '#1f2937',
                fontWeight: '500',
                background: 'none',
                border: 'none',
                padding: '8px'
              }}
              aria-label="My garden"
            >
              My garden
              {location.pathname === '/checkin/garden' && (
                <div style={{
                  position: 'absolute',
                  bottom: '-32px',
                  left: 0,
                  right: 0,
                  height: '2px',
                  backgroundColor: '#1f2937'
                }}></div>
              )}
            </button>

            <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>

            <button
              onClick={() => navigate('/checkin/home')}
              className="cursor-pointer transition-all hover:opacity-70 relative"
              style={{
                fontSize: '14px',
                color: '#1f2937',
                fontWeight: '500',
                background: 'none',
                border: 'none',
                padding: '8px'
              }}
              aria-label="Check in"
            >
              Check in
              {location.pathname === '/checkin/home' && (
                <div style={{
                  position: 'absolute',
                  bottom: '-32px',
                  left: 0,
                  right: 0,
                  height: '2px',
                  backgroundColor: '#1f2937'
                }}></div>
              )}
            </button>

            <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>

            <button
              onClick={() => navigate('/')}
              className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors shadow-lg"
              style={{ backgroundColor: 'white', border: '2px solid #147fe3' }}
              aria-label="Exit"
            >
              <LogOut className="h-5 w-5" style={{ color: '#147fe3' }} />
            </button>
          </div>
        </div>
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
          className="welcome-content-mobile flex items-start justify-start transition-opacity duration-300"
          style={{
            minHeight: '100vh',
            opacity: isTransitioning ? 0 : 1,
            padding: '80px',
            paddingTop: '80px'
          }}
        >
          <div className="max-w-4xl mx-auto text-center">
            {/* Container Card */}
            <div
              className="rounded-2xl"
              style={{
                backgroundColor: 'rgba(255, 255, 255, 0.3)',
                backdropFilter: 'blur(16px)',
                border: '1px solid rgba(255, 255, 255, 0.3)',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                padding: '22px 52px',
                position: 'relative',
                zIndex: 10
              }}
            >
              {/* Header */}
              <div className="mb-8" style={{ marginTop: '20px', marginBottom: '20px' }}>
                <h1 className="text-4xl font-bold text-gray-900 mb-4">
                  Ready for your check in?
                </h1>
                <p className="text-lg text-gray-900 max-w-lg mx-auto" style={{ fontWeight: 500 }}>
                  Take a moment to explore your feelings.
                </p>
              </div>

              {/* Start Button - desktop only */}
              <div className="flex justify-center desktop-start-button" style={{ marginBottom: '20px' }}>
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
        </div>
      )}

      {/* Breathing Exercise */}
      {showBreathing && (
        <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
          <div className="max-w-7xl mx-auto px-6 w-full">
            {/* Title header for breathing - positioned like mood page */}
            <div className="text-center" style={{ marginBottom: '1rem', position: 'relative', zIndex: 50 }}>
              <h1 className="breathing-title-checkin-mobile text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>Let's breathe!</h1>
            </div>

            <div
              className="breathing-container-mobile"
              style={{
                opacity: isTransitioning ? 0 : 1,
                transform: isTransitioning ? 'scale(0.8)' : 'scale(1)',
                transition: 'opacity 500ms ease-out, transform 500ms ease-out',
                height: 'calc(100vh - 200px)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                overflow: 'visible',
                position: 'relative'
              }}
            >
          <BreathingCircles
            cycles={3}
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
          </div>
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
      {showBreathing && (
        <div className="yellow-swoosh-container">
          <YellowSwoosh />
        </div>
      )}

      {/* Start Button - only show when not breathing */}
      {!showBreathing && (
        <div className="flex justify-center mobile-start-button" style={{ position: 'fixed', bottom: '32px', left: '50%', transform: 'translateX(-50%)', zIndex: 9999 }}>
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
              boxShadow: '0 5px 40px rgba(0, 0, 0, 0.25)',
              position: 'relative',
              zIndex: 10001,
              pointerEvents: 'auto'
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
        <div style={{ position: 'relative' }}>
          {/* Theo Animation */}
          <div
            className="theo-animation"
            style={{
              position: 'fixed',
              bottom: '20px',
              left: 'calc(50% + 120px)',
              transform: 'translateX(-50%)',
              width: '300px',
              height: '300px',
              zIndex: 5,
              opacity: isTransitioning ? 0 : 1,
              transition: 'opacity 300ms ease-in-out',
              pointerEvents: 'none'
            }}
          >
            <Lottie
              animationData={roseAnimation}
              loop={true}
              autoplay={true}
            />
          </div>
        </div>
      )}
    </div>
    </>
  )
}