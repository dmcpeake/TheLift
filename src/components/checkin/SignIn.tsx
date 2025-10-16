import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { LogOut } from 'lucide-react'

export function SignIn() {
  const navigate = useNavigate()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [scrollPosition, setScrollPosition] = useState(0)

  // Simple email validation
  const isValidEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

  const isFormValid = isValidEmail(email) && password.length > 0

  const handleInputFocus = () => {
    setScrollPosition(window.scrollY)
  }

  const handleInputBlur = () => {
    setTimeout(() => {
      window.scrollTo({ top: scrollPosition, behavior: 'instant' as ScrollBehavior })
    }, 300)
  }

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (isFormValid) {
      window.scrollTo(0, 0)

      // Check if user has completed onboarding
      const onboardingComplete = sessionStorage.getItem('onboardingComplete')

      if (!onboardingComplete) {
        // First time user - redirect to onboarding
        navigate('/checkin/onboarding')
      } else {
        // Returning user - go to home
        navigate('/checkin/home')
      }
    }
  }

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

          .signin-content-wrapper {
            padding: 0 !important;
            display: flex !important;
            flex-direction: column !important;
            align-items: center !important;
            justify-content: flex-start !important;
          }

          .signin-content-inner {
            margin-top: 120px !important;
            padding: 0 20px !important;
            width: 100% !important;
          }

          .signin-title {
            font-size: 28px !important;
            margin-bottom: 16px !important;
            color: #1f2937 !important;
            font-weight: 700 !important;
          }

          .signin-subtitle {
            font-size: 16px !important;
            margin-bottom: 24px !important;
            color: #6b7280 !important;
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
        <div className="fixed top-0 left-0 right-0 z-50" style={{ backgroundColor: 'rgba(255, 255, 255, 0.3)', backdropFilter: 'blur(16px)', WebkitBackdropFilter: 'blur(16px)', boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)', minHeight: '80px', borderRadius: '0' }}>
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

          {/* Exit Button */}
          <div className="fixed top-0 right-4 flex items-center" style={{ height: '80px', zIndex: 51 }}>
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

        {/* Sign In Form */}
        <div
          className="signin-content-wrapper flex items-center justify-center"
          style={{
            minHeight: '100vh',
            padding: '80px 20px'
          }}
        >
          <div className="signin-content-inner max-w-md w-full">
            {/* Title and Subtitle */}
            <h1 className="signin-title text-4xl font-bold text-gray-900 mb-2 text-center">
              Sign In
            </h1>
            <p className="signin-subtitle text-lg text-gray-700 mb-12 text-center" style={{ fontWeight: 500 }}>
              Enter your details to continue
            </p>

            {/* Container Card */}
            <div
              className="rounded-2xl"
              style={{
                backgroundColor: 'rgba(255, 255, 255, 0.3)',
                backdropFilter: 'blur(16px)',
                border: '1px solid rgba(255, 255, 255, 0.3)',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                padding: '40px',
                position: 'relative',
                zIndex: 10
              }}
            >

              {/* Form */}
              <form onSubmit={handleSubmit} className="space-y-6">
                {/* Email Field */}
                <div>
                  <label htmlFor="email" className="block text-sm font-semibold text-gray-900 mb-2">
                    Email Address
                  </label>
                  <input
                    type="email"
                    id="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    onFocus={handleInputFocus}
                    onBlur={handleInputBlur}
                    className="w-full px-4 py-3 focus:outline-none transition-colors"
                    style={{
                      backgroundColor: 'rgba(255, 255, 255, 0.9)',
                      fontSize: '16px',
                      borderRadius: '4px',
                      border: '1px solid rgba(0, 0, 0, 0.2)'
                    }}
                    placeholder="your@email.com"
                    required
                  />
                </div>

                {/* Password Field */}
                <div>
                  <label htmlFor="password" className="block text-sm font-semibold text-gray-900 mb-2">
                    Password
                  </label>
                  <input
                    type="password"
                    id="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    onFocus={handleInputFocus}
                    onBlur={handleInputBlur}
                    className="w-full px-4 py-3 focus:outline-none transition-colors"
                    style={{
                      backgroundColor: 'rgba(255, 255, 255, 0.9)',
                      fontSize: '16px',
                      borderRadius: '4px',
                      border: '1px solid rgba(0, 0, 0, 0.2)'
                    }}
                    placeholder="Enter your password"
                    required
                  />
                </div>

                {/* Sign In Button */}
                <div className="flex justify-center pt-4">
                  <button
                    type="submit"
                    disabled={!isFormValid}
                    className="font-semibold text-lg transition-all duration-200"
                    style={{
                      backgroundColor: '#e87e67',
                      color: 'white',
                      height: '60px',
                      borderRadius: '30px',
                      paddingLeft: '50px',
                      paddingRight: '50px',
                      border: '2px solid white',
                      cursor: isFormValid ? 'pointer' : 'not-allowed',
                      boxShadow: '0 5px 40px rgba(0, 0, 0, 0.25)',
                      opacity: isFormValid ? 1 : 0.3
                    }}
                    onMouseEnter={(e) => {
                      if (isFormValid) e.currentTarget.style.backgroundColor = '#d66e5a'
                    }}
                    onMouseLeave={(e) => {
                      if (isFormValid) e.currentTarget.style.backgroundColor = '#e87e67'
                    }}
                  >
                    SIGN IN
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
