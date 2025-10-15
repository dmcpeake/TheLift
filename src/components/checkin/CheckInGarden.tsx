import React, { useState, useEffect } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { Menu, X, LogOut } from 'lucide-react'
import Lottie from 'lottie-react'
import { ThreeHappyThings } from './garden/ThreeHappyThings'
import { ThreeGratefulThings } from './garden/ThreeGratefulThings'
import { IfICouldBe } from './garden/IfICouldBe'
import { DrawYourMind } from './garden/DrawYourMind'

type ActivityType = 'happy' | 'grateful' | 'ifICouldBe' | 'draw' | null

export function CheckInGarden() {
  const navigate = useNavigate()
  const location = useLocation()
  const [activeActivity, setActiveActivity] = useState<ActivityType>(null)
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false)
  const [roseAnimation, setRoseAnimation] = useState(null)

  useEffect(() => {
    window.scrollTo(0, 0)
  }, [])

  // Load the Lottie animation
  useEffect(() => {
    fetch('/theo-rose.json')
      .then(response => response.json())
      .then(data => setRoseAnimation(data))
      .catch(error => console.error('Error loading rose animation:', error))
  }, [])

  return (
    <>
      <style jsx>{`
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

          .garden-content-wrapper {
            padding: 0 !important;
            align-items: flex-start !important;
            justify-content: flex-start !important;
          }

          .garden-content-inner {
            margin-top: 120px !important;
            padding: 0 20px !important;
          }

          .garden-title {
            font-size: 28px !important;
            margin-bottom: 16px !important;
            color: #1f2937 !important;
            font-weight: 700 !important;
          }

          .garden-subtitle {
            font-size: 16px !important;
            margin-bottom: 20px !important;
            color: #6b7280 !important;
          }

          .garden-cards-grid {
            gap: 1rem !important;
            padding: 0 !important;
          }

          .garden-card-subtext {
            display: none !important;
          }

          .garden-cards-grid button > div {
            align-items: center !important;
          }

          .garden-cards-grid button > div > div:last-child {
            margin-top: 7px !important;
          }

          .mobile-nav-buttons {
            display: flex !important;
          }
        }

        /* Hide Theo animation on mobile */
        @media (max-width: 768px) {
          .theo-animation {
            display: none !important;
          }
        }

        @media (min-width: 769px) {
          .mobile-nav-buttons {
            display: none !important;
          }
        }
      `}</style>
      <div
        className="min-h-screen bg-white relative overflow-hidden flex items-start justify-start"
        style={{
          backgroundImage: 'url(/CheckinComplete.svg)',
          backgroundSize: window.innerWidth > 768 ? 'cover' : 'cover',
          backgroundPosition: window.innerWidth > 768 ? 'center bottom' : 'center',
          backgroundAttachment: window.innerWidth > 768 ? 'fixed' : 'scroll',
          backgroundRepeat: 'no-repeat'
        }}
      >
        {/* Header Bar */}
        <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'rgba(255, 255, 255, 0.3)', backdropFilter: 'blur(16px)', WebkitBackdropFilter: 'blur(16px)', boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)', minHeight: '80px', borderRadius: '0', paddingBottom: mobileMenuOpen ? '20px' : '0' }}>
          {/* The Lift Logo and Dots */}
          <div
            className="flex items-center gap-3"
            style={{
              position: 'absolute',
              left: '16px',
              top: '40px',
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

          {/* Desktop Navigation - hidden on mobile */}
          <div className="hidden md:flex fixed top-0 right-4 items-center gap-4" style={{ height: '80px', zIndex: 51 }}>
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
                  bottom: '-22px',
                  left: 0,
                  right: 0,
                  height: '2px',
                  backgroundColor: '#1f2937'
                }}></div>
              )}
            </button>

            <div style={{ width: '1px', height: '20px', backgroundColor: 'rgba(0, 0, 0, 0.2)' }}></div>

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
                  bottom: '-22px',
                  left: 0,
                  right: 0,
                  height: '2px',
                  backgroundColor: '#1f2937'
                }}></div>
              )}
            </button>

            <div style={{ width: '1px', height: '20px', backgroundColor: 'rgba(0, 0, 0, 0.2)' }}></div>

            <button
              onClick={() => navigate('/checkin/feel-good-list')}
              className="cursor-pointer transition-all hover:opacity-70 relative"
              style={{
                fontSize: '14px',
                color: '#1f2937',
                fontWeight: '500',
                background: 'none',
                border: 'none',
                padding: '8px'
              }}
              aria-label="Feel good list"
            >
              Feel good list
              {location.pathname === '/checkin/feel-good-list' && (
                <div style={{
                  position: 'absolute',
                  bottom: '-22px',
                  left: 0,
                  right: 0,
                  height: '2px',
                  backgroundColor: '#1f2937'
                }}></div>
              )}
            </button>

            <div style={{ width: '1px', height: '20px', backgroundColor: 'rgba(0, 0, 0, 0.2)' }}></div>

            <button
              onClick={() => navigate('/checkin/profile')}
              className="cursor-pointer transition-all hover:opacity-70 relative"
              style={{
                fontSize: '14px',
                color: '#1f2937',
                fontWeight: '500',
                background: 'none',
                border: 'none',
                padding: '8px'
              }}
              aria-label="My profile"
            >
              My profile
              {location.pathname === '/checkin/profile' && (
                <div style={{
                  position: 'absolute',
                  bottom: '-22px',
                  left: 0,
                  right: 0,
                  height: '2px',
                  backgroundColor: '#1f2937'
                }}></div>
              )}
            </button>

            <button
              onClick={() => navigate('/')}
              className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors shadow-lg"
              style={{ backgroundColor: 'white', border: '2px solid #147fe3' }}
              aria-label="Exit"
            >
              <LogOut className="h-5 w-5" style={{ color: '#147fe3' }} />
            </button>
          </div>

          {/* Mobile Hamburger Menu and Check In Button - shown only on mobile */}
          <div className="mobile-nav-buttons fixed top-0 right-4 z-50 flex items-center gap-2" style={{ height: '80px' }}>
            <button
              onClick={() => navigate('/checkin/home')}
              className="h-10 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors shadow-lg"
              style={{
                backgroundColor: 'white',
                border: '2px solid #147fe3',
                paddingLeft: '16px',
                paddingRight: '16px',
                fontSize: '14px',
                fontWeight: '600',
                color: '#147fe3'
              }}
              aria-label="Check In"
            >
              CHECK IN
            </button>
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors shadow-lg"
              style={{ backgroundColor: 'white', border: '2px solid #147fe3' }}
              aria-label={mobileMenuOpen ? 'Close menu' : 'Open menu'}
            >
              {mobileMenuOpen ? (
                <X className="h-5 w-5" style={{ color: '#147fe3' }} />
              ) : (
                <Menu className="h-5 w-5" style={{ color: '#147fe3' }} />
              )}
            </button>
          </div>

          {/* Mobile Menu Links - Inside Header Bar */}
          {mobileMenuOpen && (
            <div className="md:hidden" style={{ paddingTop: '80px', paddingLeft: '20px', paddingRight: '20px' }}>
              <div style={{ height: '1px', backgroundColor: 'rgba(0, 0, 0, 0.1)', margin: '0 0 4px 0' }}></div>

              <button
                onClick={() => {
                  navigate('/checkin/garden')
                  setMobileMenuOpen(false)
                }}
                className="w-full text-left transition-all hover:bg-white hover:bg-opacity-20 rounded flex items-center"
                style={{
                  fontSize: '14px',
                  color: '#1f2937',
                  fontWeight: '500',
                  background: 'none',
                  border: 'none',
                  padding: '12px 16px',
                  height: '40px'
                }}
              >
                My garden
              </button>

              <div style={{ height: '1px', backgroundColor: 'rgba(0, 0, 0, 0.1)', margin: '4px 0' }}></div>

              <button
                onClick={() => {
                  navigate('/checkin/home')
                  setMobileMenuOpen(false)
                }}
                className="w-full text-left transition-all hover:bg-white hover:bg-opacity-20 rounded flex items-center"
                style={{
                  fontSize: '14px',
                  color: '#1f2937',
                  fontWeight: '500',
                  background: 'none',
                  border: 'none',
                  padding: '12px 16px',
                  height: '40px'
                }}
              >
                Check in
              </button>

              <div style={{ height: '1px', backgroundColor: 'rgba(0, 0, 0, 0.1)', margin: '4px 0' }}></div>

              <button
                onClick={() => {
                  navigate('/checkin/feel-good-list')
                  setMobileMenuOpen(false)
                }}
                className="w-full text-left transition-all hover:bg-white hover:bg-opacity-20 rounded flex items-center"
                style={{
                  fontSize: '14px',
                  color: '#1f2937',
                  fontWeight: '500',
                  background: 'none',
                  border: 'none',
                  padding: '12px 16px',
                  height: '40px'
                }}
              >
                Feel good list
              </button>

              <div style={{ height: '1px', backgroundColor: 'rgba(0, 0, 0, 0.1)', margin: '4px 0' }}></div>

              <button
                onClick={() => {
                  navigate('/checkin/profile')
                  setMobileMenuOpen(false)
                }}
                className="w-full text-left transition-all hover:bg-white hover:bg-opacity-20 rounded flex items-center"
                style={{
                  fontSize: '14px',
                  color: '#1f2937',
                  fontWeight: '500',
                  background: 'none',
                  border: 'none',
                  padding: '12px 16px',
                  height: '40px'
                }}
              >
                My profile
              </button>

              <div style={{ height: '1px', backgroundColor: 'rgba(0, 0, 0, 0.1)', margin: '4px 0' }}></div>

              <button
                onClick={() => {
                  navigate('/')
                  setMobileMenuOpen(false)
                }}
                className="w-full text-left transition-all hover:bg-white hover:bg-opacity-20 rounded flex items-center gap-2"
                style={{
                  fontSize: '14px',
                  color: '#147fe3',
                  fontWeight: '500',
                  background: 'none',
                  border: 'none',
                  padding: '12px 16px',
                  height: '40px'
                }}
              >
                <LogOut className="h-4 w-4" />
                Exit
              </button>
            </div>
          )}
        </div>

        {/* Butterfly */}
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

        {/* Animated Leaves */}
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

        {/* Content */}
        <div
          className="garden-content-wrapper transition-opacity duration-300"
          style={{
            minHeight: '100vh',
            padding: '140px 80px 80px 80px',
            width: '100%'
          }}
        >
          <div className="garden-content-inner max-w-5xl mx-auto">
            {/* Title */}
            <h1 className="garden-title text-4xl font-bold text-gray-900 mb-2 text-center">
              This is your positive mindset practice
            </h1>
            <p className="garden-subtitle text-lg text-gray-700 mb-12 text-center">
              Choose an activity to help you reflect on the good things of your day
            </p>

            {/* Activity Cards Grid */}
            <div className="garden-cards-grid grid grid-cols-1 md:grid-cols-2 gap-6" style={{ maxWidth: '900px', margin: '0 auto', position: 'relative', zIndex: 10 }}>
              {/* Card 1: 3 Happy Things */}
              <button
                onClick={() => setActiveActivity('happy')}
                className="rounded-2xl p-6 hover:shadow-xl transition-all duration-200 text-left"
                style={{
                  backgroundColor: 'rgba(255, 255, 255, 0.3)',
                  backdropFilter: 'blur(16px)',
                  border: '1px solid rgba(255, 255, 255, 0.3)',
                  boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                  position: 'relative',
                  zIndex: 10
                }}
              >
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-yellow-100 flex items-center justify-center flex-shrink-0">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#eab308" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <path d="M8 14s1.5 2 4 2 4-2 4-2"/>
                      <line x1="9" y1="9" x2="9.01" y2="9"/>
                      <line x1="15" y1="9" x2="15.01" y2="9"/>
                    </svg>
                  </div>
                  <div>
                    <h3 className="text-xl font-semibold text-gray-900 mb-2">
                      3 things that made me happy
                    </h3>
                    <p className="garden-card-subtext text-gray-700 text-sm">
                      Reflect on the positive moments from your day
                    </p>
                  </div>
                </div>
              </button>

              {/* Card 2: 3 Grateful Things */}
              <button
                onClick={() => setActiveActivity('grateful')}
                className="rounded-2xl p-6 hover:shadow-xl transition-all duration-200 text-left"
                style={{
                  backgroundColor: 'rgba(255, 255, 255, 0.3)',
                  backdropFilter: 'blur(16px)',
                  border: '1px solid rgba(255, 255, 255, 0.3)',
                  boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                  position: 'relative',
                  zIndex: 10
                }}
              >
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-pink-100 flex items-center justify-center flex-shrink-0">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ec4899" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                      <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                    </svg>
                  </div>
                  <div>
                    <h3 className="text-xl font-semibold text-gray-900 mb-2">
                      3 things I am grateful for
                    </h3>
                    <p className="garden-card-subtext text-gray-700 text-sm">
                      Share what you're thankful for today
                    </p>
                  </div>
                </div>
              </button>

              {/* Card 3: If I Could Be */}
              <button
                onClick={() => setActiveActivity('ifICouldBe')}
                className="rounded-2xl p-6 hover:shadow-xl transition-all duration-200 text-left"
                style={{
                  backgroundColor: 'rgba(255, 255, 255, 0.3)',
                  backdropFilter: 'blur(16px)',
                  border: '1px solid rgba(255, 255, 255, 0.3)',
                  boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                  position: 'relative',
                  zIndex: 10
                }}
              >
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-purple-100 flex items-center justify-center flex-shrink-0">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#a855f7" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                      <circle cx="12" cy="10" r="3"/>
                      <path d="M12 21.7C17.3 17 20 13 20 10a8 8 0 1 0-16 0c0 3 2.7 6.9 8 11.7z"/>
                    </svg>
                  </div>
                  <div>
                    <h3 className="text-xl font-semibold text-gray-900 mb-2">
                      If I could be anything...
                    </h3>
                    <p className="garden-card-subtext text-gray-700 text-sm">
                      Imagine being any object, animal, or vegetable
                    </p>
                  </div>
                </div>
              </button>

              {/* Card 4: Draw Your Mind */}
              <button
                onClick={() => setActiveActivity('draw')}
                className="rounded-2xl p-6 hover:shadow-xl transition-all duration-200 text-left"
                style={{
                  backgroundColor: 'rgba(255, 255, 255, 0.3)',
                  backdropFilter: 'blur(16px)',
                  border: '1px solid rgba(255, 255, 255, 0.3)',
                  boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                  position: 'relative',
                  zIndex: 10
                }}
              >
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center flex-shrink-0">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#22c55e" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                      <path d="M12 19l7-7 3 3-7 7-3-3z"/>
                      <path d="M18 13l-1.5-7.5L2 2l3.5 14.5L13 18l5-5z"/>
                      <path d="M2 2l7.586 7.586"/>
                      <circle cx="11" cy="11" r="2"/>
                    </svg>
                  </div>
                  <div>
                    <h3 className="text-xl font-semibold text-gray-900 mb-2">
                      Draw what's on your mind
                    </h3>
                    <p className="garden-card-subtext text-gray-700 text-sm">
                      Express yourself through drawing
                    </p>
                  </div>
                </div>
              </button>
            </div>
          </div>
        </div>

      </div>

      {/* Theo Rose Animation - desktop only */}
      {roseAnimation && (
        <div
          className="theo-animation"
          style={{
            position: 'fixed',
            bottom: '20px',
            left: 'calc(50% + 120px)',
            transform: 'translateX(-50%)',
            width: '300px',
            height: '300px',
            zIndex: 1,
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
      )}

      {/* Activity Modals - rendered outside main container */}
      {activeActivity === 'happy' && <ThreeHappyThings onClose={() => setActiveActivity(null)} />}
      {activeActivity === 'grateful' && <ThreeGratefulThings onClose={() => setActiveActivity(null)} />}
      {activeActivity === 'ifICouldBe' && <IfICouldBe onClose={() => setActiveActivity(null)} />}
      {activeActivity === 'draw' && <DrawYourMind onClose={() => setActiveActivity(null)} />}
    </>
  )
}
