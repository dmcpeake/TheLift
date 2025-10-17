import React, { useState, useEffect } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { Menu, X, LogOut, Apple, Heart, Dribbble, Palette, Music, Calendar, CheckCircle, Pencil, Trash2, Plus, Trophy } from 'lucide-react'
import { useGamification } from '../../contexts/GamificationContext'

type ModalType = 'add-feel-good' | 'edit-feel-good' | 'delete-feel-good' | 'edit-favorite' | null

export function CheckInProfile() {
  const navigate = useNavigate()
  const location = useLocation()
  const { totalPoints, currentLevel, getProgressToNextLevel } = useGamification()
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false)
  const [activeTab, setActiveTab] = useState<'feel-good' | 'favorites' | 'my-progress'>('feel-good')
  const [activeModal, setActiveModal] = useState<ModalType>(null)
  const [editingIndex, setEditingIndex] = useState<number | null>(null)
  const [editingValue, setEditingValue] = useState('')
  const [editingFavoriteKey, setEditingFavoriteKey] = useState<string | null>(null)
  const [isRecording, setIsRecording] = useState(false)

  // State for lists - with sessionStorage persistence
  const [feelGoodList, setFeelGoodList] = useState<string[]>(() => {
    const saved = sessionStorage.getItem('profileFeelGoodList')
    return saved ? JSON.parse(saved) : [
      'Swimming',
      'Playing with my friends',
      'Drawing'
    ]
  })

  const [favorites, setFavorites] = useState(() => {
    const saved = sessionStorage.getItem('profileFavorites')
    return saved ? JSON.parse(saved) : {
      food: 'Pizza',
      memory: 'My first bike',
      sport: 'Football',
      colour: 'Purple',
      hobby: 'Guitar',
      thingThisYear: 'Going to Portugal'
    }
  })

  // Save feelGoodList to sessionStorage whenever it changes
  useEffect(() => {
    sessionStorage.setItem('profileFeelGoodList', JSON.stringify(feelGoodList))
  }, [feelGoodList])

  // Save favorites to sessionStorage whenever they change
  useEffect(() => {
    sessionStorage.setItem('profileFavorites', JSON.stringify(favorites))
  }, [favorites])

  // Handler functions
  const handleVoiceCapture = () => {
    if (!isRecording) {
      // Start recording
      const SpeechRecognition = (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition

      if (!SpeechRecognition) {
        console.error('Speech recognition not supported')
        return
      }

      const recognition = new SpeechRecognition()
      recognition.lang = 'en-US'
      recognition.continuous = false
      recognition.interimResults = false

      recognition.onstart = () => {
        setIsRecording(true)
      }

      recognition.onresult = (event: any) => {
        const transcript = event.results[0][0].transcript
        setEditingValue(transcript)
        setIsRecording(false)
      }

      recognition.onerror = (event: any) => {
        console.error('Speech recognition error:', event.error)
        setIsRecording(false)
      }

      recognition.onend = () => {
        setIsRecording(false)
      }

      recognition.start()
    } else {
      // Stop recording (the recognition will auto-stop after speech ends)
      setIsRecording(false)
    }
  }

  const handleAddFeelGood = (value: string) => {
    if (value.trim()) {
      setFeelGoodList([...feelGoodList, value.trim()])
      setEditingValue('')
    }
  }

  const handleEditFeelGood = (index: number) => {
    setEditingIndex(index)
    setEditingValue(feelGoodList[index])
    setActiveModal('edit-feel-good')
  }

  const handleSaveFeelGoodEdit = () => {
    if (editingIndex !== null && editingValue.trim()) {
      const newList = [...feelGoodList]
      newList[editingIndex] = editingValue.trim()
      setFeelGoodList(newList)
      setActiveModal(null)
      setEditingIndex(null)
      setEditingValue('')
    }
  }

  const handleDeleteFeelGood = (index: number) => {
    setFeelGoodList(feelGoodList.filter((_, i) => i !== index))
  }

  const handleEditFavorite = (key: string) => {
    setEditingFavoriteKey(key)
    setEditingValue(favorites[key as keyof typeof favorites])
    setActiveModal('edit-favorite')
  }

  const handleSaveFavoriteEdit = () => {
    if (editingFavoriteKey && editingValue.trim()) {
      setFavorites({
        ...favorites,
        [editingFavoriteKey]: editingValue.trim()
      })
      setActiveModal(null)
      setEditingFavoriteKey(null)
      setEditingValue('')
    }
  }

  const favoriteLabels = {
    food: 'Food',
    memory: 'Memory',
    sport: 'Sport',
    colour: 'Colour',
    hobby: 'Hobby',
    thingThisYear: 'Thing this year'
  }

  return (
    <>
      <style jsx>{`
        /* Custom Scrollbar Styling */
        .profile-scrollable::-webkit-scrollbar {
          width: 8px;
        }
        .profile-scrollable::-webkit-scrollbar-track {
          background: rgba(0, 0, 0, 0.05);
          border-radius: 10px;
        }
        .profile-scrollable::-webkit-scrollbar-thumb {
          background: rgba(0, 0, 0, 0.2);
          border-radius: 10px;
        }
        .profile-scrollable::-webkit-scrollbar-thumb:hover {
          background: rgba(0, 0, 0, 0.3);
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

        @keyframes rotateClockwise {
          from {
            transform: rotate(0deg);
          }
          to {
            transform: rotate(360deg);
          }
        }
        .star-rotate {
          animation: rotateClockwise 8s linear infinite;
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

          .profile-content-wrapper {
            padding: 0 !important;
            display: flex !important;
            flex-direction: column !important;
            align-items: center !important;
            justify-content: flex-start !important;
          }

          .profile-content-inner {
            margin-top: 120px !important;
            padding: 0 20px !important;
            width: 100% !important;
          }

          .profile-title {
            position: absolute !important;
            top: -60px !important;
            left: 0 !important;
            right: 0 !important;
            font-size: 28px !important;
            margin-bottom: 0 !important;
            color: #1f2937 !important;
            font-weight: 700 !important;
          }

          .rounded-2xl {
            margin-top: 60px !important;
          }
        }
      `}</style>
      <div
        className="min-h-screen bg-white relative overflow-hidden"
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

            {/* Trophy Icon with Level Badge */}
            <div
              style={{
                position: 'relative',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                marginLeft: '-14px',
                marginRight: '30px'
              }}
            >
              <Trophy
                style={{
                  width: '24px',
                  height: '24px',
                  color: '#FFA500',
                  fill: '#FFA500',
                  stroke: '#CC8400',
                  strokeWidth: '1px'
                }}
              />
              <div
                style={{
                  position: 'absolute',
                  bottom: '-6px',
                  right: '-6px',
                  backgroundColor: '#147fe3',
                  borderRadius: '50%',
                  width: '20px',
                  height: '20px',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  border: '2px solid white',
                  boxShadow: '0 2px 4px rgba(0, 0, 0, 0.2)'
                }}
              >
                <span
                  style={{
                    fontSize: '10px',
                    fontWeight: '700',
                    color: 'white',
                    lineHeight: '1'
                  }}
                >
                  {currentLevel}
                </span>
              </div>
            </div>

            <button
              onClick={() => navigate('/')}
              className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors shadow-lg"
              style={{ backgroundColor: 'white', border: '2px solid #147fe3' }}
              aria-label="Exit"
            >
              <LogOut className="h-5 w-5" style={{ color: '#147fe3' }} />
            </button>
          </div>

          {/* Mobile Hamburger Menu - shown only on mobile */}
          <div className="md:hidden fixed top-0 right-4 z-50 flex items-center" style={{ height: '80px' }}>
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

        {/* Profile Content */}
        <div
          className="profile-content-wrapper flex items-center justify-center"
          style={{
            minHeight: '100vh',
            padding: '80px 20px'
          }}
        >
          <div className="profile-content-inner w-full" style={{ maxWidth: '548px' }}>
            {/* Container Card */}
            <div
              className="rounded-2xl"
              style={{
                backgroundColor: 'rgba(255, 255, 255, 0.3)',
                backdropFilter: 'blur(16px)',
                border: '1px solid rgba(255, 255, 255, 0.3)',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                padding: '20px 20px 0 20px',
                position: 'relative',
                zIndex: 10,
                height: '500px',
                display: 'flex',
                flexDirection: 'column'
              }}
            >
              {/* Title */}
              <h1 className="profile-title text-4xl font-bold text-gray-900 mb-6 text-center">
                Hi Alex!
              </h1>

              {/* Pill Tab Navigation */}
              <div className="flex gap-2 mb-6" style={{
                backgroundColor: 'rgba(255, 255, 255, 0.4)',
                padding: '4px',
                borderRadius: '50px'
              }}>
                <button
                  onClick={() => setActiveTab('feel-good')}
                  className="transition-all duration-200"
                  style={{
                    flex: 1,
                    padding: '10px 16px',
                    borderRadius: '50px',
                    border: activeTab === 'feel-good' ? '2px solid #147fe3' : '2px solid transparent',
                    fontSize: '14px',
                    fontWeight: '600',
                    cursor: 'pointer',
                    backgroundColor: activeTab === 'feel-good' ? 'white' : 'transparent',
                    color: activeTab === 'feel-good' ? '#147fe3' : '#6B7280'
                  }}
                >
                  Feel good list
                </button>
                <button
                  onClick={() => setActiveTab('favorites')}
                  className="transition-all duration-200"
                  style={{
                    flex: 1,
                    padding: '10px 16px',
                    borderRadius: '50px',
                    border: activeTab === 'favorites' ? '2px solid #147fe3' : '2px solid transparent',
                    fontSize: '14px',
                    fontWeight: '600',
                    cursor: 'pointer',
                    backgroundColor: activeTab === 'favorites' ? 'white' : 'transparent',
                    color: activeTab === 'favorites' ? '#147fe3' : '#6B7280'
                  }}
                >
                  My favourites
                </button>
                <button
                  onClick={() => setActiveTab('my-progress')}
                  className="transition-all duration-200"
                  style={{
                    flex: 1,
                    padding: '10px 16px',
                    borderRadius: '50px',
                    border: activeTab === 'my-progress' ? '2px solid #147fe3' : '2px solid transparent',
                    fontSize: '14px',
                    fontWeight: '600',
                    cursor: 'pointer',
                    backgroundColor: activeTab === 'my-progress' ? 'white' : 'transparent',
                    color: activeTab === 'my-progress' ? '#147fe3' : '#6B7280'
                  }}
                >
                  My progress
                </button>
              </div>

              {/* Scrollable Content Area with Gradient */}
              <div style={{ flex: 1, position: 'relative', overflow: 'hidden' }}>
                <div
                  className="profile-scrollable"
                  style={{
                    overflowY: 'auto',
                    overflowX: 'hidden',
                    height: '100%',
                    paddingBottom: '20px',
                    paddingRight: '10px'
                  }}>
                  {/* Feel Good List Tab Content */}
                  {activeTab === 'feel-good' && (
                    <div>
                      <ul className="space-y-0">
                        {feelGoodList.map((item, index) => (
                          <li
                            key={index}
                            className="flex items-center justify-between text-gray-700 py-2"
                            style={{ fontSize: '16px', borderBottom: index < feelGoodList.length - 1 ? '1px solid rgba(0, 0, 0, 0.2)' : 'none' }}
                          >
                            <div className="flex items-center" style={{ flex: 1 }}>
                              <CheckCircle size={20} style={{ marginRight: '10px', color: '#6B7280' }} className="flex-shrink-0" />
                              {item}
                            </div>
                            <button
                              onClick={() => handleDeleteFeelGood(index)}
                              className="transition-all hover:opacity-70"
                              style={{ background: 'none', border: 'none', cursor: 'pointer', padding: '4px' }}
                              aria-label="Delete item"
                            >
                              <Trash2 size={16} style={{ color: '#6B7280' }} />
                            </button>
                          </li>
                        ))}
                      </ul>
                    </div>
                  )}

                  {/* My Favourites Tab Content */}
                  {activeTab === 'favorites' && (
                    <div>
                      <div className="space-y-0 text-gray-700">
                        {Object.entries(favorites).map(([key, value], index) => (
                          <div
                            key={key}
                            className="flex items-center justify-between py-2"
                            style={{ borderBottom: index < Object.entries(favorites).length - 1 ? '1px solid rgba(0, 0, 0, 0.2)' : 'none' }}
                          >
                            <div className="flex items-center" style={{ flex: 1 }}>
                              <span className="font-medium" style={{ width: '40%' }}>{favoriteLabels[key as keyof typeof favoriteLabels]}:</span>
                              <span style={{ flex: 1 }}>{value}</span>
                            </div>
                            <button
                              onClick={() => handleEditFavorite(key)}
                              className="transition-all hover:opacity-70"
                              style={{ background: 'none', border: 'none', cursor: 'pointer', padding: '4px' }}
                              aria-label={`Edit ${favoriteLabels[key as keyof typeof favoriteLabels]}`}
                            >
                              <Pencil size={16} style={{ color: '#6B7280' }} />
                            </button>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* My Progress Tab Content */}
                  {activeTab === 'my-progress' && (
                    <div>
                      {/* Total Points Display */}
                      <div
                        style={{
                          textAlign: 'center'
                        }}
                      >
                        <div style={{ fontSize: '14px', fontWeight: '600', color: '#1f2937', marginBottom: '4px' }}>
                          Total Points
                        </div>
                        <div style={{ fontSize: '32px', fontWeight: '700', color: '#1f2937' }}>
                          {totalPoints}
                        </div>
                      </div>

                      {/* Progress to Next Level */}
                      <div style={{ marginBottom: '24px' }}>
                        <div style={{
                          display: 'flex',
                          justifyContent: 'space-between',
                          alignItems: 'center',
                          marginBottom: '8px'
                        }}>
                          <span style={{ fontSize: '14px', fontWeight: '600', color: '#1f2937' }}>
                            Level {currentLevel}
                          </span>
                          <span style={{ fontSize: '14px', fontWeight: '600', color: '#1f2937' }}>
                            Level {currentLevel + 1}
                          </span>
                        </div>
                        <div style={{
                          width: '100%',
                          height: '12px',
                          backgroundColor: 'rgba(0, 0, 0, 0.1)',
                          borderRadius: '6px',
                          overflow: 'hidden',
                          position: 'relative'
                        }}>
                          <div style={{
                            width: `${Math.min(100, getProgressToNextLevel().percentage)}%`,
                            height: '100%',
                            backgroundColor: '#F97316',
                            borderRadius: '6px',
                            transition: 'width 0.3s ease'
                          }}></div>
                        </div>
                        <div style={{
                          fontSize: '12px',
                          color: '#6B7280',
                          marginTop: '4px',
                          textAlign: 'center'
                        }}>
                          {getProgressToNextLevel().current} / {getProgressToNextLevel().required} points
                        </div>
                      </div>

                      {/* Stars Grid */}
                      <div style={{ marginTop: '20px' }}>
                        <div style={{
                          fontSize: '14px',
                          fontWeight: '600',
                          color: '#1f2937',
                          marginBottom: '12px',
                          textAlign: 'center'
                        }}>
                          Your Journey to Level 20
                        </div>
                        <div style={{
                          display: 'grid',
                          gridTemplateColumns: 'repeat(10, 1fr)',
                          gap: '8px'
                        }}>
                          {Array.from({ length: 20 }, (_, i) => i + 1).map((level) => {
                            const isCompleted = level <= currentLevel
                            const isCurrent = level === currentLevel

                            return (
                              <div
                                key={level}
                                style={{
                                  position: 'relative',
                                  display: 'flex',
                                  flexDirection: 'column',
                                  alignItems: 'center',
                                  justifyContent: 'center'
                                }}
                              >
                                <svg
                                  className={isCompleted ? 'star-rotate' : ''}
                                  width="28"
                                  height="28"
                                  viewBox="0 0 24 24"
                                  fill={isCompleted ? '#F97316' : 'none'}
                                  stroke="white"
                                  strokeWidth="2"
                                  style={{
                                    filter: isCurrent ? 'drop-shadow(0 0 4px rgba(249, 115, 22, 0.6))' : 'none'
                                  }}
                                >
                                  <polygon points="12,2 15,8.5 22,9.5 17,14.5 18,21.5 12,18 6,21.5 7,14.5 2,9.5 9,8.5" />
                                </svg>
                                <span style={{
                                  fontSize: '9px',
                                  fontWeight: isCurrent ? '700' : '500',
                                  color: '#1f2937',
                                  marginTop: '2px'
                                }}>
                                  {level}
                                </span>
                              </div>
                            )
                          })}
                        </div>
                      </div>
                    </div>
                  )}
                </div>

                {/* Gradient Fade Overlay */}
                <div style={{
                  position: 'absolute',
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: '80px',
                  background: 'linear-gradient(to top, #f3f4f6, transparent) !important',
                  pointerEvents: 'none'
                }}></div>
              </div>

              {/* Add Button - Fixed at Bottom (only for Feel Good List) */}
              {activeTab === 'feel-good' && (
                <div className="flex justify-center" style={{ paddingTop: '12px', paddingBottom: '20px' }}>
                  <button
                    onClick={() => setActiveModal('add-feel-good')}
                    className="w-10 h-10 rounded-full flex items-center justify-center transition-colors shadow-lg"
                    style={{ backgroundColor: '#147fe3', border: 'none' }}
                    aria-label="Add to feel good list"
                    onMouseEnter={(e) => e.currentTarget.style.opacity = '0.9'}
                    onMouseLeave={(e) => e.currentTarget.style.opacity = '1'}
                  >
                    <Plus className="h-5 w-5" style={{ color: 'white' }} />
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Add Feel Good Item Modal */}
      {activeModal === 'add-feel-good' && (
        <div
          className="fixed inset-0 flex items-center justify-center"
          style={{
            zIndex: 9999,
            backgroundColor: 'rgba(0, 0, 0, 0.8)'
          }}
          onClick={() => {
            setActiveModal(null)
            setEditingValue('')
            setIsRecording(false)
          }}
        >
          <div
            className="bg-white rounded-lg max-w-2xl w-full mx-4 relative"
            onClick={(e) => e.stopPropagation()}
            style={{ maxHeight: '90vh', overflowY: 'auto', padding: '2rem' }}
          >
            <h2 className="text-2xl font-semibold text-gray-900 mb-6">
              Add something that makes you feel good
            </h2>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                What makes you feel good?
              </label>
              <div className="relative">
                <input
                  type="text"
                  value={editingValue}
                  onChange={(e) => setEditingValue(e.target.value)}
                  placeholder="Type here..."
                  className="w-full px-4 py-3 pr-14 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  style={{ fontSize: '16px' }}
                  autoFocus
                  onKeyPress={(e) => {
                    if (e.key === 'Enter') {
                      handleAddFeelGood(editingValue)
                    }
                  }}
                />
                <button
                  onClick={handleVoiceCapture}
                  className={`absolute top-1/2 right-3 transform -translate-y-1/2 w-10 h-10 rounded-full flex items-center justify-center transition-colors ${
                    isRecording ? 'bg-red-100' : 'bg-blue-100 hover:bg-blue-200'
                  }`}
                >
                  <svg
                    width="20"
                    height="20"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke={isRecording ? '#dc2626' : '#2563eb'}
                    strokeWidth="2"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  >
                    <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"/>
                    <path d="M19 10v2a7 7 0 0 1-14 0v-2"/>
                    <line x1="12" y1="19" x2="12" y2="23"/>
                    <line x1="8" y1="23" x2="16" y2="23"/>
                  </svg>
                </button>
              </div>
            </div>

            <div className="mt-8 pt-4 border-t border-gray-200" style={{ marginBottom: '-1rem' }}>
              <div className="flex items-center">
                <button
                  onClick={() => {
                    setActiveModal(null)
                    setEditingValue('')
                    setIsRecording(false)
                  }}
                  className="flex-1 font-medium transition-colors text-center"
                  style={{ fontSize: '16px', color: '#2563eb' }}
                  onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                  onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                >
                  CLOSE
                </button>
                <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>
                <button
                  onClick={() => {
                    handleAddFeelGood(editingValue)
                    // Don't close modal, just clear input
                  }}
                  className="flex-1 font-medium transition-colors text-center"
                  style={{ fontSize: '16px', color: '#2563eb' }}
                  onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                  onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                >
                  ADD
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Edit Feel Good Item Modal */}
      {activeModal === 'edit-feel-good' && (
        <div
          className="fixed inset-0 flex items-center justify-center"
          style={{
            zIndex: 9999,
            backgroundColor: 'rgba(0, 0, 0, 0.8)'
          }}
          onClick={() => {
            setActiveModal(null)
            setEditingValue('')
          }}
        >
          <div
            className="bg-white rounded-lg max-w-2xl w-full mx-4 relative"
            onClick={(e) => e.stopPropagation()}
            style={{ maxHeight: '90vh', overflowY: 'auto', padding: '2rem' }}
          >
            <h2 className="text-2xl font-semibold text-gray-900 mb-6">
              Edit item
            </h2>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                What makes you feel good?
              </label>
              <textarea
                value={editingValue}
                onChange={(e) => setEditingValue(e.target.value)}
                placeholder="Type here..."
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
                rows={3}
                style={{ fontSize: '16px' }}
                autoFocus
              />
            </div>

            <div className="mt-8 pt-4 border-t border-gray-200" style={{ marginBottom: '-1rem' }}>
              <div className="flex items-center">
                <button
                  onClick={() => {
                    setActiveModal(null)
                    setEditingValue('')
                  }}
                  className="flex-1 font-medium transition-colors text-center"
                  style={{ fontSize: '16px', color: '#2563eb' }}
                  onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                  onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                >
                  CANCEL
                </button>
                <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>
                <button
                  onClick={handleSaveFeelGoodEdit}
                  className="flex-1 font-medium transition-colors text-center"
                  style={{ fontSize: '16px', color: '#2563eb' }}
                  onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                  onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                >
                  SAVE
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Edit Favorite Item Modal */}
      {activeModal === 'edit-favorite' && editingFavoriteKey && (
        <div
          className="fixed inset-0 flex items-center justify-center"
          style={{
            zIndex: 9999,
            backgroundColor: 'rgba(0, 0, 0, 0.8)'
          }}
          onClick={() => {
            setActiveModal(null)
            setEditingValue('')
            setEditingFavoriteKey(null)
            setIsRecording(false)
          }}
        >
          <div
            className="bg-white rounded-lg max-w-2xl w-full mx-4 relative"
            onClick={(e) => e.stopPropagation()}
            style={{ maxHeight: '90vh', overflowY: 'auto', padding: '2rem' }}
          >
            <h2 className="text-2xl font-semibold text-gray-900 mb-6">
              Edit {favoriteLabels[editingFavoriteKey as keyof typeof favoriteLabels]}
            </h2>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                {favoriteLabels[editingFavoriteKey as keyof typeof favoriteLabels]}
              </label>
              <div className="relative">
                <input
                  type="text"
                  value={editingValue}
                  onChange={(e) => setEditingValue(e.target.value)}
                  placeholder="Type here..."
                  className="w-full px-4 py-3 pr-14 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  style={{ fontSize: '16px' }}
                  autoFocus
                />
                <button
                  onClick={handleVoiceCapture}
                  className={`absolute top-1/2 right-3 transform -translate-y-1/2 w-10 h-10 rounded-full flex items-center justify-center transition-colors ${
                    isRecording ? 'bg-red-100' : 'bg-blue-100 hover:bg-blue-200'
                  }`}
                >
                  <svg
                    width="20"
                    height="20"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke={isRecording ? '#dc2626' : '#2563eb'}
                    strokeWidth="2"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  >
                    <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"/>
                    <path d="M19 10v2a7 7 0 0 1-14 0v-2"/>
                    <line x1="12" y1="19" x2="12" y2="23"/>
                    <line x1="8" y1="23" x2="16" y2="23"/>
                  </svg>
                </button>
              </div>
            </div>

            <div className="mt-8 pt-4 border-t border-gray-200" style={{ marginBottom: '-1rem' }}>
              <div className="flex items-center">
                <button
                  onClick={() => {
                    setActiveModal(null)
                    setEditingValue('')
                    setEditingFavoriteKey(null)
                    setIsRecording(false)
                  }}
                  className="flex-1 font-medium transition-colors text-center"
                  style={{ fontSize: '16px', color: '#2563eb' }}
                  onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                  onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                >
                  CANCEL
                </button>
                <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>
                <button
                  onClick={handleSaveFavoriteEdit}
                  className="flex-1 font-medium transition-colors text-center"
                  style={{ fontSize: '16px', color: '#2563eb' }}
                  onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                  onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                >
                  SAVE
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  )
}
