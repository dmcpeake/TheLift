import React, { useState, useEffect } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ChevronLeft, ChevronRight, TreePine, X } from 'lucide-react'
import { BreathingCircles } from '../breathing/BreathingCircles'
import { MoodMeter } from '../prototypes/MoodMeter'
import { EmotionGrid } from '../prototypes/EmotionGrid'
import { WellbeingWheel } from '../prototypes/WellbeingWheel'
import { ProgressHeader } from '../shared/ProgressHeader'
import { WellbeingRadialGraph } from '../shared/WellbeingRadialGraph'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import Lottie from 'lottie-react'
import BlushingShaded from '../../assets/animations/Blushing_Shaded.json'
import HappyShaded from '../../assets/animations/Happy_Shaded.json'
import MehShaded from '../../assets/animations/Meh_Shaded.json'
import SadTearShaded from '../../assets/animations/Sad_Tear_Shaded.json'
import CryingShaded from '../../assets/animations/Crying_Shaded.json'

type FlowStep = 'checkin' | 'mood' | 'emotions' | 'wellbeing' | 'chart' | 'talk' | 'garden' | 'complete'

const steps = [
  { id: 'mood', name: 'My emotions', number: 1 },
  { id: 'wellbeing', name: 'Wellbeing wheel', number: 2 },
  { id: 'emotions', name: 'My emotions', number: 3 },
  { id: 'chart', name: 'Wellbeing chart', number: 4 },
  { id: 'talk', name: 'Talk to someone', number: 5 }
]

export function CheckInFlow() {
  const { step } = useParams<{ step: string }>()
  const navigate = useNavigate()
  const [completeMood, setCompleteMood] = useState<string | null>(null)
  const [completedData, setCompletedData] = useState<Record<string, any>>({})
  const [currentStepHasSelection, setCurrentStepHasSelection] = useState(false)
  const [emotionGridStep, setEmotionGridStep] = useState(1)

  // State to trigger completion in child components
  const [triggerEmotionCompletion, setTriggerEmotionCompletion] = useState(false)
  const [triggerMoodCompletion, setTriggerMoodCompletion] = useState(false)
  const [triggerWellbeingCompletion, setTriggerWellbeingCompletion] = useState(false)
  const [theoAnimation, setTheoAnimation] = useState<any>(null)
  const [showSupportLightbox, setShowSupportLightbox] = useState(false)
  const [theoDocumentAnimation, setTheoDocumentAnimation] = useState<any>(null)
  const [activeCardIndex, setActiveCardIndex] = useState(0)
  const [theoSuccessAnimation, setTheoSuccessAnimation] = useState<any>(null)
  const [theoThumbsUpAnimation, setTheoThumbsUpAnimation] = useState<any>(null)

  const currentStep = (step || 'mood') as FlowStep
  const currentStepIndex = steps.findIndex(s => s.id === currentStep)

  // Load Theo animations
  useEffect(() => {
    fetch('/theo-waving.json')
      .then(response => response.json())
      .then(data => setTheoAnimation(data))
      .catch(error => console.error('Error loading Theo animation:', error))

    fetch('/theo-document.json')
      .then(response => response.json())
      .then(data => setTheoDocumentAnimation(data))
      .catch(error => console.error('Error loading Theo document animation:', error))

    fetch('/theo-success.json')
      .then(response => response.json())
      .then(data => setTheoSuccessAnimation(data))
      .catch(error => console.error('Error loading Theo success animation:', error))

    fetch('/theo-thumb-up.json')
      .then(response => response.json())
      .then(data => setTheoThumbsUpAnimation(data))
      .catch(error => console.error('Error loading Theo thumbs up animation:', error))
  }, [])

  // Reset selection state when step changes
  React.useEffect(() => {
    // Scroll to top when step changes
    window.scrollTo(0, 0)

    // Check if current step has completed data
    const hasCompletedData = completedData[currentStep] && !completedData[currentStep].skipped
    setCurrentStepHasSelection(hasCompletedData)

    // Reset emotion grid step to 1 when navigating back to emotions
    if (currentStep === 'emotions') {
      setEmotionGridStep(1)
    }

    // Reset all trigger states when step changes
    setTriggerEmotionCompletion(false)
    setTriggerMoodCompletion(false)
    setTriggerWellbeingCompletion(false)
  }, [currentStep, completedData])

  // No auto-redirect - user must click DONE button

  const handleStepComplete = (stepId: string, data: any) => {
    // Store the completed data
    setCompletedData(prev => ({ ...prev, [stepId]: data }))

    // Special handling for wellbeing completion
    if (stepId === 'wellbeing') {
      // Check if user has any wellbeing data or just skipped everything
      const hasWellbeingData = data.sections && data.sections.some(section => section.mood_numeric > 0)

      if (hasWellbeingData) {
        // User has wellbeing data - go to chart page
        navigate('/checkin/flow/chart')
      } else {
        // User skipped everything or has no data - go directly to talk page
        navigate('/checkin/flow/talk')
      }
      return
    }

    // Special handling for chart completion - go to emotions page (since order changed)
    if (stepId === 'chart') {
      // Navigate to emotions page (step 3 in new order)
      navigate('/checkin/flow/emotions')
      return
    }

    // Special handling for emotions completion - go to talk page
    if (stepId === 'emotions') {
      // Navigate to talk page
      navigate('/checkin/flow/talk')
      return
    }

    // Special handling for talk completion
    if (stepId === 'talk') {
      // Navigate to complete step
      navigate('/checkin/flow/complete')
      return
    }

    // Navigate to next step
    const nextStepIndex = currentStepIndex + 1
    if (nextStepIndex < steps.length) {
      const nextStep = steps[nextStepIndex]
      navigate(`/checkin/flow/${nextStep.id}`)
    } else {
      // All steps complete
      navigate('/checkin/flow/complete')
    }
  }

  const handleNavigateToStep = (stepId: string) => {
    // Check if the step we're navigating to has completed data
    const hasCompletedData = completedData[stepId] && !completedData[stepId].skipped
    setCurrentStepHasSelection(hasCompletedData) // Set selection state based on completed data
    navigate(`/checkin/flow/${stepId}`)
  }

  const handleStepSelectionMade = () => {
    setCurrentStepHasSelection(true)
  }

  const handleStepSelectionRemoved = () => {
    setCurrentStepHasSelection(false)
  }

  const handleSkip = (stepId: string) => {
    // Mark as skipped and move to next step
    setCompletedData(prev => ({ ...prev, [stepId]: { skipped: true } }))

    const nextStepIndex = currentStepIndex + 1
    if (nextStepIndex < steps.length) {
      const nextStep = steps[nextStepIndex]
      navigate(`/checkin/flow/${nextStep.id}`)
    } else {
      navigate('/checkin/flow/complete')
    }
  }

  // Progress bar component
  const ProgressBar = () => {
    return (
      <>
        {/* Progress header */}
        <ProgressHeader
          currentStep={currentStep}
          completedData={completedData}
          currentStepHasSelection={currentStepHasSelection}
          emotionGridStep={emotionGridStep}
          onNavigateToStep={handleNavigateToStep}
        />

        {/* Close button positioned at vertical center right */}
        <div className="fixed top-0 right-4 z-50 flex items-center" style={{ height: '80px' }}>
          <button
            onClick={() => navigate('/checkin/home')}
            className="w-10 h-10 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors shadow-lg"
            style={{ backgroundColor: '#3a7ddc' }}
          >
            <X className="h-5 w-5 text-white" />
          </button>
        </div>
      </>
    )
  }

  // Completion page
  if (currentStep === 'complete') {
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

            .complete-content {
              padding: 0 !important;
              align-items: flex-start !important;
              justify-content: flex-start !important;
            }
            .complete-content .max-w-4xl {
              margin-top: 40px !important;
              padding: 0 !important;
              width: 100% !important;
            }
            .complete-blurred-container {
              margin-left: 20px !important;
              margin-right: 20px !important;
              margin-top: 20px !important;
              padding-top: 10px !important;
              padding-left: 20px !important;
              padding-right: 20px !important;
              padding-bottom: 0 !important;
            }
            .complete-header-mobile {
              padding: 0 20px !important;
              margin-bottom: 20px !important;
            }
            .complete-header-mobile h1 {
              font-size: 28px !important;
              margin-bottom: 0 !important;
              color: #1f2937 !important;
              font-weight: 700 !important;
            }
            .complete-mood-meter {
              margin-top: 0 !important;
              margin-bottom: -10px !important;
            }
            .complete-header-desktop {
              display: none !important;
            }
            .complete-mobile-button {
              display: flex !important;
            }
            .complete-desktop-button {
              display: none !important;
            }
            .complete-exit-button {
              width: 3rem !important;
              height: 3rem !important;
              top: 20px !important;
              right: 20px !important;
            }
            .complete-exit-button svg {
              width: 1.25rem !important;
              height: 1.25rem !important;
            }
          }

          /* Desktop Optimizations */
          @media (min-width: 769px) {
            .complete-header-mobile {
              display: none !important;
            }
            .complete-mobile-button {
              display: none !important;
            }
            .complete-desktop-button {
              display: flex !important;
            }
            .complete-mood-meter {
              margin-top: -60px !important;
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
          {/* Close Button */}
          <button
            onClick={() => navigate('/')}
            className="complete-exit-button fixed w-12 h-12 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors z-50 shadow-lg"
            style={{
              backgroundColor: 'white',
              border: '1px solid #147fe3',
              top: '40px',
              right: '40px'
            }}
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#147fe3" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
              <polyline points="16 17 21 12 16 7"/>
              <line x1="21" y1="12" x2="9" y2="12"/>
            </svg>
          </button>

          {/* Welcome Content */}
          <div
            className="complete-content flex items-center justify-center transition-opacity duration-300"
            style={{
              minHeight: '100vh',
              padding: '80px',
              width: '100%'
            }}
          >
            <div className="max-w-4xl mx-auto text-center">
              {/* Header - Mobile only (outside blurred container) */}
              <div className="complete-header-mobile md:hidden text-center">
                <h1 className="text-gray-900">
                  Great check in, how do you feel now?
                </h1>
              </div>

              {/* Container Card - Blurred Box */}
              <div
                className="complete-blurred-container rounded-2xl"
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
                {/* Header - Desktop only (inside blurred container) */}
                <div className="complete-header-desktop hidden md:block text-center" style={{ marginTop: '20px', marginBottom: '2rem' }}>
                  <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                    Great check in today!
                  </h1>
                  <p className="text-gray-600" style={{ fontSize: '16px', fontWeight: 400, lineHeight: '1.5' }}>
                    How do you feel now?
                  </p>
                </div>

                {/* Use MoodMeter component without title */}
                <div className="complete-mood-meter">
                  <MoodMeter
                    onComplete={(data) => {
                      setCompleteMood(data.mood_level)
                    }}
                    onSelectionMade={() => {
                      // Enable button - actual mood value will be set via onComplete
                      setCompleteMood('selected')
                    }}
                    onSelectionRemoved={() => {
                      setCompleteMood(null)
                    }}
                    showNextButton={false}
                    hideButton={true}
                    hideDebugInfo={true}
                    hideSwoosh={true}
                    hideTitle={true}
                  />
                </div>

                {/* MY GARDEN Button - desktop only */}
                <div className="complete-desktop-button hidden md:flex justify-center" style={{ marginBottom: '20px', marginTop: '-40px', position: 'relative', zIndex: 20 }}>
                  <button
                    onClick={() => completeMood && navigate('/checkin/garden')}
                    disabled={!completeMood}
                    className="font-semibold text-lg transition-all duration-200"
                    style={{
                      backgroundColor: '#e87e67',
                      color: 'white',
                      height: '60px',
                      borderRadius: '30px',
                      paddingLeft: '50px',
                      paddingRight: '50px',
                      border: '2px solid white',
                      cursor: completeMood ? 'pointer' : 'not-allowed',
                      boxShadow: '0 5px 40px rgba(0, 0, 0, 0.25)',
                      position: 'relative',
                      zIndex: 20,
                      opacity: completeMood ? 1 : 0.3
                    }}
                    onMouseEnter={(e) => {
                      if (completeMood) e.currentTarget.style.backgroundColor = '#d66e5a'
                    }}
                    onMouseLeave={(e) => {
                      if (completeMood) e.currentTarget.style.backgroundColor = '#e87e67'
                    }}
                  >
                    MY GARDEN
                  </button>
                </div>
              </div>
            </div>
          </div>

          {/* MY GARDEN Button - mobile only */}
          <div className="complete-mobile-button md:hidden flex justify-center" style={{ position: 'fixed', bottom: '32px', left: '50%', transform: 'translateX(-50%)', zIndex: 9999 }}>
            <button
              onClick={() => completeMood && navigate('/checkin/garden')}
              disabled={!completeMood}
              className="transition-all duration-200"
              style={{
                backgroundColor: '#e87e67',
                color: 'white',
                width: '180px',
                height: '56px',
                borderRadius: '28px',
                border: '2px solid white',
                cursor: completeMood ? 'pointer' : 'not-allowed',
                fontSize: '16px',
                fontWeight: '600',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                boxShadow: '0 5px 40px rgba(0, 0, 0, 0.25)',
                position: 'relative',
                zIndex: 10001,
                pointerEvents: 'auto',
                opacity: completeMood ? 1 : 0.3
              }}
              onMouseEnter={(e) => {
                if (completeMood) e.currentTarget.style.backgroundColor = '#d66e5a'
              }}
              onMouseLeave={(e) => {
                if (completeMood) e.currentTarget.style.backgroundColor = '#e87e67'
              }}
            >
              MY GARDEN
            </button>
          </div>


          <style jsx>{`
            @media (min-width: 769px) {
              .complete-mobile-button {
                display: none !important;
              }
              .complete-content {
                align-items: center !important;
              }
            }
            @media (max-width: 768px) {
              .complete-content {
                align-items: flex-start !important;
                padding-top: 40px !important;
              }
              .theo-success-animation {
                bottom: 55px !important;
                left: calc(50% + 60px) !important;
              }
            }
          `}</style>
        </div>
      </>
    )
  }

  return (
    <>
      <style jsx>{`
        @media (max-width: 767px) {
          .chart-page-container {
            padding-top: 60px !important;
          }
          .chart-title-container {
            margin-top: 40px;
          }
          .chart-graph-container {
            display: none !important;
          }
          .chart-main-title {
            visibility: hidden;
            position: relative;
          }
          .chart-main-title::before {
            content: 'Feeling down?';
            visibility: visible;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
          }
          .complete-done-container {
            bottom: 32px !important;
            padding: 0 2rem !important;
          }
          .talk-buttons-container {
            flex-wrap: nowrap !important;
            gap: 0.5rem !important;
          }
          .talk-page-container {
            padding-top: 60px !important;
          }
          .talk-content-wrapper {
            margin-top: 40px;
            padding-left: 0 !important;
            padding-right: 0 !important;
          }
          .talk-title-container {
            padding-left: 1.5rem !important;
            padding-right: 1.5rem !important;
          }
        }
      `}</style>

      {/* Progress bar shows on all steps except garden */}
      {currentStep !== 'garden' && <ProgressBar />}

      <div className="min-h-screen">
        {currentStep === 'mood' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <div className="max-w-7xl mx-auto px-6 w-full">
              <MoodMeter
                onComplete={(data) => handleStepComplete('mood', data)}
                showNextButton={true}
                onSelectionMade={handleStepSelectionMade}
                onSelectionRemoved={handleStepSelectionRemoved}
                hideDebugInfo={true}
                triggerCompletion={triggerMoodCompletion}
                initialData={completedData['mood']}
              />
            </div>
          </div>
        )}

        {currentStep === 'emotions' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <EmotionGrid
              onComplete={(data) => handleStepComplete('emotions', data)}
              showNextButton={true}
              onSelectionMade={handleStepSelectionMade}
              hideDebugInfo={true}
              triggerCompletion={triggerEmotionCompletion}
              initialData={completedData['emotions']}
              onStepChange={setEmotionGridStep}
              onPartialSave={(data) => {
                // Save emotion data without triggering navigation
                setCompletedData(prev => ({ ...prev, emotions: data }))
              }}
            />
          </div>
        )}

        {currentStep === 'wellbeing' && (
          <div className="bg-white min-h-screen" style={{ paddingTop: '140px' }}>
            <WellbeingWheel
                onComplete={(data) => handleStepComplete('wellbeing', data)}
                showNextButton={true}
                onSelectionMade={handleStepSelectionMade}
                hideDebugInfo={true}
                triggerCompletion={triggerWellbeingCompletion}
                initialData={completedData['wellbeing']}
                onPartialSave={(data) => {
                  // Save wellbeing data without triggering navigation
                  setCompletedData(prev => ({ ...prev, wellbeing: data }))
                }}
              />
          </div>
        )}

        {currentStep === 'chart' && (
          <>
            <div className="bg-white min-h-screen relative chart-page-container" style={{ paddingTop: '140px', paddingBottom: '120px' }}>
              {/* Title - matching wellbeing page styling */}
              <div className="text-center chart-title-container" style={{ marginBottom: '0.5rem' }}>
                <h1 className="text-gray-900 mb-2 chart-main-title" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                  Low score?
                </h1>
              </div>

              <div className="chart-page-content flex flex-col items-center p-8"
                   style={{ paddingTop: '0' }}>

                {/* Support Tips Section */}
                <div className="support-tips-section" style={{ width: '100%', maxWidth: '900px', marginBottom: '20px' }}>
                  <p className="chart-support-title text-gray-600 mx-auto px-4" style={{
                    fontSize: '16px',
                    fontWeight: 400,
                    lineHeight: '1.5',
                    maxWidth: '800px',
                    marginBottom: '1.5rem',
                    marginTop: '0',
                    textAlign: 'center'
                  }}>
                    To feel better you could try...
                  </p>

                  {/* Desktop: 3 columns, Mobile: Horizontal scroll */}
                  <div
                    className="support-tips-container"
                    onScroll={(e) => {
                      const container = e.currentTarget
                      const scrollLeft = container.scrollLeft
                      const cardWidth = 280 + 24 // card width + gap
                      const index = Math.round(scrollLeft / cardWidth)
                      setActiveCardIndex(index)
                    }}
                    style={{
                      display: 'flex',
                      gap: '1.5rem',
                      overflowX: 'auto',
                      scrollSnapType: 'x mandatory',
                      WebkitOverflowScrolling: 'touch',
                      paddingBottom: '1rem'
                    }}
                  >
                    {/* Card 1 */}
                    <div
                      style={{
                        flex: '0 0 auto',
                        width: 'calc(100% - 2rem)',
                        minWidth: '280px',
                        maxWidth: '280px',
                        backgroundColor: 'white',
                        borderRadius: '4px',
                        padding: '1rem 1.5rem',
                        border: '2px solid #e5e7eb',
                        scrollSnapAlign: 'center',
                        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
                        minHeight: 'auto'
                      }}
                    >
                      <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '0.75rem' }}>
                        <div style={{
                          backgroundColor: 'rgba(227, 141, 59, 0.2)',
                          width: '40px',
                          height: '40px',
                          borderRadius: '50%',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center'
                        }}>
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                          </svg>
                        </div>
                      </div>
                      <p style={{
                        margin: '0',
                        color: '#374151',
                        lineHeight: '1.5',
                        textAlign: 'center',
                        fontSize: '14px'
                      }}>
                        List out the things that make you feel good
                      </p>
                    </div>

                    {/* Card 2 */}
                    <div
                      style={{
                        flex: '0 0 auto',
                        width: 'calc(100% - 2rem)',
                        minWidth: '280px',
                        maxWidth: '280px',
                        backgroundColor: 'white',
                        borderRadius: '4px',
                        padding: '1rem 1.5rem',
                        border: '2px solid #e5e7eb',
                        scrollSnapAlign: 'center',
                        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
                        minHeight: 'auto'
                      }}
                    >
                      <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '0.75rem' }}>
                        <div style={{
                          backgroundColor: 'rgba(227, 141, 59, 0.2)',
                          width: '40px',
                          height: '40px',
                          borderRadius: '50%',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center'
                        }}>
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                          </svg>
                        </div>
                      </div>
                      <p style={{
                        margin: '0',
                        color: '#374151',
                        lineHeight: '1.5',
                        textAlign: 'center',
                        fontSize: '14px'
                      }}>
                        Talk to a friend
                      </p>
                    </div>

                    {/* Card 3 */}
                    <div
                      style={{
                        flex: '0 0 auto',
                        width: 'calc(100% - 2rem)',
                        minWidth: '280px',
                        maxWidth: '280px',
                        backgroundColor: 'white',
                        borderRadius: '4px',
                        padding: '1rem 1.5rem',
                        border: '2px solid #e5e7eb',
                        scrollSnapAlign: 'center',
                        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
                        minHeight: 'auto'
                      }}
                    >
                      <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '0.75rem' }}>
                        <div style={{
                          backgroundColor: 'rgba(227, 141, 59, 0.2)',
                          width: '40px',
                          height: '40px',
                          borderRadius: '50%',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center'
                        }}>
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
                          </svg>
                        </div>
                      </div>
                      <p style={{
                        margin: '0',
                        color: '#374151',
                        lineHeight: '1.5',
                        textAlign: 'center',
                        fontSize: '14px'
                      }}>
                        Talk to your adults or teachers for more support
                      </p>
                    </div>
                  </div>

                  {/* Mobile scroll indicator dots */}
                  <div className="mobile-dots" style={{
                    display: 'flex',
                    justifyContent: 'center',
                    gap: '8px',
                    marginTop: '1rem'
                  }}>
                    <div style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: activeCardIndex === 0 ? '#3a7ddc' : '#d1d5db',
                      transition: 'background-color 0.3s ease'
                    }}></div>
                    <div style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: activeCardIndex === 1 ? '#3a7ddc' : '#d1d5db',
                      transition: 'background-color 0.3s ease'
                    }}></div>
                    <div style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: activeCardIndex === 2 ? '#3a7ddc' : '#d1d5db',
                      transition: 'background-color 0.3s ease'
                    }}></div>
                  </div>
                </div>

                {/* Radial Graph - Hidden on mobile, shown below cards on desktop */}
                <div className="chart-graph-container" style={{ marginBottom: '3rem', marginTop: '20px' }}>
                  <WellbeingRadialGraph
                    sections={completedData.wellbeing?.sections || []}
                    size={250}
                    theoAnimation={theoAnimation}
                  />
                </div>
              </div>

              <style jsx>{`
                @media (max-width: 767px) {
                  .chart-page-content {
                    padding-left: 0 !important;
                    padding-right: 0 !important;
                  }
                  .support-tips-section {
                    padding-left: 0 !important;
                    padding-right: 0 !important;
                  }
                  .support-tips-container {
                    flex-direction: column !important;
                    overflow-x: visible !important;
                    scroll-snap-type: none !important;
                    margin-left: 20px !important;
                    margin-right: 20px !important;
                    padding-left: 0 !important;
                    padding-right: 0 !important;
                    gap: 1rem !important;
                  }
                  .support-tips-container > div {
                    width: 100% !important;
                    max-width: 100% !important;
                    min-width: auto !important;
                  }
                  .mobile-dots {
                    display: none !important;
                  }
                }
                @media (min-width: 768px) {
                  .support-tips-container {
                    justify-content: center;
                    overflow-x: visible !important;
                  }
                  .mobile-dots {
                    display: none !important;
                  }
                }

                .support-tips-container::-webkit-scrollbar {
                  display: none;
                }

                .support-tips-container {
                  -ms-overflow-style: none;
                  scrollbar-width: none;
                }
              `}</style>

              {/* Yellow swoosh footer - hidden on mobile */}
              <div className="hidden md:block absolute bottom-0 left-0 right-0">
                <YellowSwoosh />
              </div>

              {/* NEXT Button - positioned above yellow swoosh on desktop, at bottom on mobile */}
              <div className="fixed left-1/2 transform -translate-x-1/2 text-center"
                   style={{ zIndex: 1100, bottom: '32px' }}>
                <button
                  onClick={() => handleStepComplete('chart', {})}
                  className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                  style={{
                    backgroundColor: '#3a7ddc',
                    color: 'white',
                    width: '140px',
                    height: '56px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    borderRadius: '28px'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.backgroundColor = '#2e6bc7'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.backgroundColor = '#3a7ddc'
                  }}
                >
                  NEXT
                </button>
              </div>
            </div>
          </>
        )}

        {currentStep === 'talk' && (
          <div className="talk-page-container bg-white min-h-screen" style={{ paddingTop: '140px', paddingBottom: '120px' }}>
            <div className="talk-content-wrapper mx-auto px-6" style={{ maxWidth: '800px' }}>
              {/* Main Content - fades out */}
              <div
                className="talk-main-content transition-opacity duration-500"
                style={{
                  opacity: completedData.talk ? 0 : 1,
                  display: completedData.talk ? 'none' : 'block'
                }}
              >
                {/* Title - matching other page styling */}
                <div className="text-center talk-title-container" style={{ marginBottom: '3rem' }}>
                  <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                    Do you want to talk to someone?
                  </h1>
                </div>

                {/* Summary Content - not in cards */}
                <div className="space-y-10">
                  {/* Mood Section */}
                  {completedData.mood && (
                    <div>
                      <hr className="border-t border-gray-200 mb-6" />
                      <h2 className="text-center text-gray-700 mb-4" style={{ fontSize: '18px', fontWeight: 600 }}>
                        Your mood
                      </h2>
                      <div className="flex flex-col items-center justify-center gap-2">
                        {(() => {
                          // Get the mood animation based on mood level
                          const getMoodAnimation = () => {
                            switch (completedData.mood.mood_level) {
                              case 'very_happy': return BlushingShaded
                              case 'happy': return HappyShaded
                              case 'ok': return MehShaded
                              case 'sad': return SadTearShaded
                              case 'very_sad': return CryingShaded
                              default: return null
                            }
                          }
                          const animation = getMoodAnimation()
                          if (animation) {
                            return (
                              <div style={{ width: '60px', height: '60px' }}>
                                <Lottie
                                  animationData={animation}
                                  loop={true}
                                  autoplay={true}
                                  style={{ width: '100%', height: '100%' }}
                                />
                              </div>
                            )
                          }
                          return null
                        })()}
                        <p className="text-lg capitalize">
                          {completedData.mood.mood_level.replace('_', ' ')}
                        </p>
                      </div>
                      {completedData.mood.notes && (
                        <p className="text-center text-gray-600 mt-3 italic" style={{ maxWidth: '500px', margin: '1rem auto' }}>
                          "{completedData.mood.notes}"
                        </p>
                      )}
                      <div className="mt-6"></div>
                    </div>
                  )}

                  {/* Emotions Section */}
                  {completedData.emotions?.selected_emotions && completedData.emotions.selected_emotions.length > 0 && (
                    <div>
                      <hr className="border-t border-gray-200 mb-6" />
                      <h2 className="text-center text-gray-700 mb-4" style={{ fontSize: '18px', fontWeight: 600 }}>
                        Your emotions
                      </h2>
                      <div className="flex flex-wrap justify-center gap-3">
                        {completedData.emotions.selected_emotions.map((emotion: string, index: number) => {
                          // Find the emoji for this emotion
                          const emotionsData = {
                            'red': [
                              ['🤬 Enraged', '😣 Stressed', '😲 Shocked'],
                              ['😤 Fuming', '😠 Angry', '😰 Restless'],
                              ['🤢 Repulsed', '😟 Worried', '😬 Uneasy']
                            ],
                            'yellow': [
                              ['😮 Surprised', '🥳 Festive', '🤩 Ecstatic'],
                              ['⚡ Energized', '😊 Optimistic', '😃 Excited'],
                              ['🙂 Pleasant', '🤞 Hopeful', '🥰 Blissful']
                            ],
                            'blue': [
                              ['🤮 Disgusted', '😞 Down', '😐 Apathetic'],
                              ['😩 Miserable', '🥺 Lonely', '😪 Tired'],
                              ['😭 Despair', '😔 Desolate', '🪫 Drained']
                            ],
                            'green': [
                              ['😮‍💨 At ease', '🙂 Content', '🫶 Fulfilled'],
                              ['😌 Relaxed', '💤 Restful', '⚖️ Balanced'],
                              ['🥱 Sleepy', '🕊️ Tranquil', '🧘 Serene']
                            ]
                          }

                          let emotionWithEmoji = emotion
                          let quadrantColor = 'gray'

                          // Find which quadrant this emotion belongs to
                          Object.entries(emotionsData).forEach(([quadrant, quadrantEmotions]) => {
                            quadrantEmotions.forEach(row => {
                              row.forEach(emotionStr => {
                                const label = emotionStr.split(' ').slice(1).join(' ')
                                if (label === emotion) {
                                  emotionWithEmoji = emotionStr
                                  quadrantColor = quadrant
                                }
                              })
                            })
                          })

                          const [emoji, ...labelParts] = emotionWithEmoji.split(' ')

                          // Get background color based on quadrant
                          const getQuadrantColors = (quadrant: string) => {
                            switch (quadrant) {
                              case 'red':
                                return { bg: '#f7e9ee', border: '#d78fab' }
                              case 'yellow':
                                return { bg: '#f7e9db', border: '#d7914c' }
                              case 'blue':
                                return { bg: '#ecf3f4', border: '#9fc4c7' }
                              case 'green':
                                return { bg: '#f5f8f6', border: '#ceddd1' }
                              default:
                                return { bg: '#f9f9f9', border: '#e5e7eb' }
                            }
                          }

                          const colors = getQuadrantColors(quadrantColor)

                          return (
                            <div
                              key={index}
                              className="flex flex-col items-center justify-center gap-1"
                              style={{
                                width: '80px',
                                height: '80px',
                                padding: '8px',
                                backgroundColor: colors.bg,
                                border: `2px solid ${colors.border}`,
                                color: '#374151',
                                borderRadius: '4px',
                                boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)'
                              }}
                            >
                              <span className="text-xl">{emoji}</span>
                              <span className="text-xs font-medium text-center" style={{ lineHeight: '1.1' }}>
                                {labelParts.join(' ')}
                              </span>
                            </div>
                          )
                        })}
                      </div>
                      {completedData.emotions?.emotion_story && (
                        <p className="text-center text-gray-600 mt-3 italic" style={{ maxWidth: '500px', margin: '1rem auto' }}>
                          "{completedData.emotions.emotion_story}"
                        </p>
                      )}
                      <hr className="border-t border-gray-200 mt-6 mb-6" />
                    </div>
                  )}

                </div>
              </div>

              {/* Message - fades in after button click */}
              <div
                className="talk-message transition-opacity duration-500"
                style={{
                  opacity: completedData.talk ? 1 : 0,
                  display: completedData.talk ? 'block' : 'none'
                }}
              >
                {/* Title and Subtitle - matching wellbeing page styling */}
                <div className="text-center" style={{ marginBottom: '2rem' }}>
                  {(() => {
                    const talkChoice = completedData.talk?.choice
                    if (talkChoice === 'parent') {
                      return (
                        <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                          Your parent will check in with you soon
                        </h1>
                      )
                    } else if (talkChoice === 'teacher') {
                      return (
                        <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                          Your teacher will check in with you soon
                        </h1>
                      )
                    } else {
                      return (
                        <>
                          <h1 className="text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
                            Your feelings are safe with us
                          </h1>
                          <p className="text-gray-600 mx-auto px-4" style={{
                            fontSize: '16px',
                            fontWeight: 400,
                            lineHeight: '1.5',
                            maxWidth: '800px',
                            marginTop: '8px',
                            textAlign: 'center'
                          }}>
                            Have a lift
                          </p>
                        </>
                      )
                    }
                  })()}
                </div>

                {/* Lift cards section */}
                <div style={{ width: '100%', maxWidth: '900px', margin: '0 auto' }}>
                  {/* Cards - Desktop: 3 columns, Mobile: Horizontal scroll */}
                  <div
                    className="lift-cards-container"
                    onScroll={(e) => {
                      const container = e.currentTarget
                      const scrollLeft = container.scrollLeft
                      const cardWidth = 280 + 24 // card width + gap
                      const index = Math.round(scrollLeft / cardWidth)
                      setActiveCardIndex(index)
                    }}
                    style={{
                      display: 'flex',
                      gap: '1.5rem',
                      overflowX: 'auto',
                      scrollSnapType: 'x mandatory',
                      WebkitOverflowScrolling: 'touch',
                      paddingBottom: '1rem'
                    }}
                  >
                    {/* Joke Card */}
                    <div
                      style={{
                        flex: '0 0 auto',
                        width: 'calc(100% - 2rem)',
                        minWidth: '280px',
                        maxWidth: '280px',
                        backgroundColor: 'white',
                        borderRadius: '4px',
                        padding: '1rem 1.5rem',
                        border: '2px solid #e5e7eb',
                        scrollSnapAlign: 'center',
                        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
                        minHeight: 'auto'
                      }}
                    >
                      <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '0.75rem' }}>
                        <div style={{
                          backgroundColor: 'rgba(227, 141, 59, 0.2)',
                          width: '40px',
                          height: '40px',
                          borderRadius: '50%',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center'
                        }}>
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <circle cx="12" cy="12" r="10"/>
                            <path d="M8 14s1.5 2 4 2 4-2 4-2"/>
                            <line x1="9" y1="9" x2="9.01" y2="9"/>
                            <line x1="15" y1="9" x2="15.01" y2="9"/>
                          </svg>
                        </div>
                      </div>
                      <h3 style={{
                        margin: '0 0 0.5rem 0',
                        color: '#374151',
                        textAlign: 'center',
                        fontSize: '14px',
                        fontWeight: '600'
                      }}>
                        Joke of the day
                      </h3>
                      <p style={{
                        margin: '0',
                        color: '#374151',
                        lineHeight: '1.5',
                        textAlign: 'center',
                        fontSize: '14px'
                      }}>
                        Where do fish keep their money?<br />
                        <strong>In a river bank</strong>
                      </p>
                    </div>

                    {/* Riddle Card */}
                    <div
                      style={{
                        flex: '0 0 auto',
                        width: 'calc(100% - 2rem)',
                        minWidth: '280px',
                        maxWidth: '280px',
                        backgroundColor: 'white',
                        borderRadius: '4px',
                        padding: '1rem 1.5rem',
                        border: '2px solid #e5e7eb',
                        scrollSnapAlign: 'center',
                        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
                        minHeight: 'auto'
                      }}
                    >
                      <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '0.75rem' }}>
                        <div style={{
                          backgroundColor: 'rgba(227, 141, 59, 0.2)',
                          width: '40px',
                          height: '40px',
                          borderRadius: '50%',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center'
                        }}>
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <circle cx="12" cy="12" r="10"/>
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/>
                            <line x1="12" y1="17" x2="12.01" y2="17"/>
                          </svg>
                        </div>
                      </div>
                      <h3 style={{
                        margin: '0 0 0.5rem 0',
                        color: '#374151',
                        textAlign: 'center',
                        fontSize: '14px',
                        fontWeight: '600'
                      }}>
                        Riddle of the day
                      </h3>
                      <p style={{
                        margin: '0',
                        color: '#374151',
                        lineHeight: '1.5',
                        textAlign: 'center',
                        fontSize: '14px'
                      }}>
                        What is the hardest key to turn?<br />
                        <strong>A donkey</strong>
                      </p>
                    </div>

                    {/* Fact Card */}
                    <div
                      style={{
                        flex: '0 0 auto',
                        width: 'calc(100% - 2rem)',
                        minWidth: '280px',
                        maxWidth: '280px',
                        backgroundColor: 'white',
                        borderRadius: '4px',
                        padding: '1rem 1.5rem',
                        border: '2px solid #e5e7eb',
                        scrollSnapAlign: 'center',
                        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
                        minHeight: 'auto'
                      }}
                    >
                      <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '0.75rem' }}>
                        <div style={{
                          backgroundColor: 'rgba(227, 141, 59, 0.2)',
                          width: '40px',
                          height: '40px',
                          borderRadius: '50%',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center'
                        }}>
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#e38d3b" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <circle cx="12" cy="12" r="10"/>
                            <line x1="12" y1="16" x2="12" y2="12"/>
                            <line x1="12" y1="8" x2="12.01" y2="8"/>
                          </svg>
                        </div>
                      </div>
                      <h3 style={{
                        margin: '0 0 0.5rem 0',
                        color: '#374151',
                        textAlign: 'center',
                        fontSize: '14px',
                        fontWeight: '600'
                      }}>
                        Fact of the day
                      </h3>
                      <p style={{
                        margin: '0',
                        color: '#374151',
                        lineHeight: '1.5',
                        textAlign: 'center',
                        fontSize: '14px'
                      }}>
                        A crocodile cannot stick its tongue out
                      </p>
                    </div>
                  </div>

                  {/* Mobile scroll indicator dots */}
                  <div className="mobile-dots" style={{
                    display: 'flex',
                    justifyContent: 'center',
                    gap: '8px',
                    marginTop: '1rem'
                  }}>
                    <div style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: activeCardIndex === 0 ? '#3a7ddc' : '#d1d5db',
                      transition: 'background-color 0.3s ease'
                    }}></div>
                    <div style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: activeCardIndex === 1 ? '#3a7ddc' : '#d1d5db',
                      transition: 'background-color 0.3s ease'
                    }}></div>
                    <div style={{
                      width: '8px',
                      height: '8px',
                      borderRadius: '50%',
                      backgroundColor: activeCardIndex === 2 ? '#3a7ddc' : '#d1d5db',
                      transition: 'background-color 0.3s ease'
                    }}></div>
                  </div>

                  {/* Theo Thumbs Up Animation */}
                  {theoThumbsUpAnimation && (
                    <div className="theo-animation-mobile-hide" style={{ display: 'flex', justifyContent: 'center', marginTop: '2rem', marginBottom: '2rem' }}>
                      <div style={{ width: '200px', height: '200px' }}>
                        <Lottie
                          animationData={theoThumbsUpAnimation}
                          loop={true}
                          autoplay={true}
                          style={{ width: '100%', height: '100%' }}
                        />
                      </div>
                    </div>
                  )}
                </div>

                <style jsx>{`
                  @media (max-width: 767px) {
                    .lift-cards-container {
                      padding-left: 0 !important;
                      padding-right: 0 !important;
                    }
                    .lift-cards-container > div {
                      width: 100% !important;
                    }
                    .theo-animation-mobile-hide {
                      display: none !important;
                    }
                  }
                  @media (min-width: 768px) {
                    .lift-cards-container {
                      justify-content: center;
                      overflow-x: visible !important;
                    }
                    .mobile-dots {
                      display: none !important;
                    }
                  }

                  .lift-cards-container::-webkit-scrollbar {
                    display: none;
                  }

                  .lift-cards-container {
                    -ms-overflow-style: none;
                    scrollbar-width: none;
                  }
                `}</style>
              </div>

              {/* Yellow swoosh footer */}
              <div className="hidden md:block absolute bottom-0 left-0 right-0">
                <YellowSwoosh />
              </div>

              {/* Action Buttons - positioned above yellow swoosh - show when no selection */}
              {!completedData.talk && (
                <div
                  className="talk-buttons transition-opacity duration-500 fixed left-1/2 transform -translate-x-1/2"
                  style={{
                    zIndex: 1100,
                    bottom: '32px'
                  }}
                >
                  <div className="talk-buttons-container flex justify-center gap-4">
                    <button
                      onClick={() => {
                        setCompletedData(prev => ({ ...prev, talk: { choice: 'parent' } }))
                      }}
                      className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                      style={{
                        backgroundColor: '#3a7ddc',
                        color: 'white',
                        width: '100px',
                        height: '56px',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        borderRadius: '28px'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.backgroundColor = '#2e6bc7'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.backgroundColor = '#3a7ddc'
                      }}
                    >
                      A parent
                    </button>

                    <button
                      onClick={() => {
                        setCompletedData(prev => ({ ...prev, talk: { choice: 'teacher' } }))
                      }}
                      className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                      style={{
                        backgroundColor: '#3a7ddc',
                        color: 'white',
                        width: '100px',
                        height: '56px',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        borderRadius: '28px'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.backgroundColor = '#2e6bc7'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.backgroundColor = '#3a7ddc'
                      }}
                    >
                      A teacher
                    </button>

                    <button
                      onClick={() => {
                        setCompletedData(prev => ({ ...prev, talk: { choice: 'none' } }))
                      }}
                      className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                      style={{
                        backgroundColor: '#3a7ddc',
                        color: 'white',
                        width: '100px',
                        height: '56px',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        borderRadius: '28px'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.backgroundColor = '#2e6bc7'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.backgroundColor = '#3a7ddc'
                      }}
                    >
                      No one
                    </button>
                  </div>
                </div>
              )}

              {/* NEXT Button - show when selection is made */}
              {completedData.talk && (
                <div
                  className="fixed left-1/2 transform -translate-x-1/2"
                  style={{ zIndex: 1100, bottom: '32px' }}
                >
                  <button
                    onClick={() => navigate('/checkin/flow/complete')}
                    className="text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
                    style={{
                      backgroundColor: '#3a7ddc',
                      color: 'white',
                      width: '140px',
                      height: '56px',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      borderRadius: '28px'
                    }}
                    onMouseEnter={(e) => {
                      e.currentTarget.style.backgroundColor = '#2e6bc7'
                    }}
                    onMouseLeave={(e) => {
                      e.currentTarget.style.backgroundColor = '#3a7ddc'
                    }}
                  >
                    NEXT
                  </button>
                </div>
              )}
            </div>
          </div>
        )}

      </div>
    </>
  )
}