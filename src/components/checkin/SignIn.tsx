import React, { useState, useEffect } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import { LogOut, Users, Heart, ArrowLeft } from 'lucide-react'
import Lottie from 'lottie-react'

export function SignIn() {
  const navigate = useNavigate()
  const [signInType, setSignInType] = useState<'practitioner' | 'child' | null>(null)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [username, setUsername] = useState('')
  const [pin, setPin] = useState(['', '', '', ''])
  const [scrollPosition, setScrollPosition] = useState(0)
  const [theoAnimation, setTheoAnimation] = useState(null)
  const pinInputRefs = [
    React.useRef<HTMLInputElement>(null),
    React.useRef<HTMLInputElement>(null),
    React.useRef<HTMLInputElement>(null),
    React.useRef<HTMLInputElement>(null)
  ]

  useEffect(() => {
    fetch('/theo-scrolling.json')
      .then(response => response.json())
      .then(data => setTheoAnimation(data))
      .catch(error => console.error('Error loading Theo animation:', error))
  }, [])

  // Simple email validation
  const isValidEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

  const isFormValid = signInType === 'practitioner'
    ? isValidEmail(email) && password.length > 0
    : username.length > 0 && pin.every(digit => digit.length === 1)

  const handleInputFocus = () => {
    setScrollPosition(window.scrollY)
  }

  const handleInputBlur = () => {
    setTimeout(() => {
      window.scrollTo({ top: scrollPosition, behavior: 'instant' as ScrollBehavior })
    }, 300)
  }

  const handlePinChange = (index: number, value: string) => {
    // Only allow single digits
    if (value.length > 1) {
      value = value.charAt(0)
    }

    // Only allow numbers
    if (value !== '' && !/^\d$/.test(value)) {
      return
    }

    const newPin = [...pin]
    newPin[index] = value
    setPin(newPin)

    // Auto-focus next input if digit entered
    if (value !== '' && index < 3) {
      pinInputRefs[index + 1].current?.focus()
    }
  }

  const handlePinKeyDown = (index: number, e: React.KeyboardEvent<HTMLInputElement>) => {
    // Handle backspace to go to previous input
    if (e.key === 'Backspace' && pin[index] === '' && index > 0) {
      pinInputRefs[index - 1].current?.focus()
    }
  }

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (isFormValid) {
      if (signInType === 'practitioner') {
        // Store email in sessionStorage for the greeting
        sessionStorage.setItem('userEmail', email)
        window.scrollTo(0, 0)
        navigate('/dashboard')
      } else {
        // Child sign in - store username and PIN and go directly to check-in
        sessionStorage.setItem('childUsername', username)
        sessionStorage.setItem('childPin', pin.join(''))
        window.scrollTo(0, 0)
        navigate('/checkin/home')
      }
    }
  }

  return (
    <>
      <style>{`
        .signin-white-bg {
          background-color: #ffffff !important;
        }
        body {
          background-color: #ffffff !important;
        }
      `}</style>

      <div className="min-h-screen signin-white-bg" style={{ paddingTop: '80px', position: 'relative' }}>
        {/* Header Navigation */}
        <nav
          style={{
            position: 'fixed',
            top: 0,
            left: 0,
            right: 0,
            zIndex: 50,
            backgroundColor: '#ffffff',
            boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
            minHeight: '80px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            padding: '0 24px'
          }}
        >
          {/* Logo and Brand - Left side */}
          <Link
            to="/"
            className="flex items-center gap-3"
            style={{
              textDecoration: 'none'
            }}
          >
            <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
              <circle cx="7" cy="23" r="4" fill="#147fe3"/>
              <circle cx="15" cy="15" r="4" fill="#147fe3"/>
              <circle cx="23" cy="7" r="4" fill="#147fe3"/>
            </svg>
            <img src="/TheLiftLogo.svg" alt="The Lift" className="h-5" style={{ imageRendering: 'auto', shapeRendering: 'geometricPrecision', filter: 'brightness(0) saturate(100%) invert(11%) sepia(0%) saturate(7465%) hue-rotate(189deg) brightness(105%) contrast(86%)' }} />
          </Link>

          {/* Right side - Sign Out Button */}
          <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
            <button
              onClick={() => navigate('/')}
              style={{
                width: '40px',
                height: '40px',
                borderRadius: '50%',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                backgroundColor: 'white',
                border: '2px solid #147fe3',
                cursor: 'pointer',
                transition: 'background-color 0.2s',
                boxShadow: '0 2px 8px rgba(20, 127, 227, 0.2)'
              }}
              onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#f0f7ff'}
              onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'white'}
              aria-label="Sign Out"
            >
              <LogOut style={{ height: '20px', width: '20px', color: '#147fe3' }} />
            </button>
          </div>
        </nav>

        <div className="max-w-2xl mx-auto p-6" style={{ paddingBottom: '120px' }}>
          {/* Title */}
          <div className="mb-8" style={{ marginTop: '40px' }}>
            <h1 className="text-3xl font-bold text-center" style={{ color: '#1f2937' }}>
              Choose how to sign in
            </h1>
          </div>

          {/* Card Selection - Only show if no type selected */}
          {!signInType && (
            <div className="flex flex-col items-center space-y-4">
              {/* Parents & teachers Card */}
              <button
                onClick={() => setSignInType('practitioner')}
                className="w-full"
                style={{
                  padding: '1.5rem',
                  borderRadius: '12px',
                  border: '2px solid transparent',
                  background: 'white',
                  cursor: 'pointer',
                  textAlign: 'left',
                  transition: 'all 0.2s ease',
                  boxShadow: '0 4px 20px rgba(0,0,0,0.1)',
                  maxWidth: '600px'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.transform = 'scale(1.02)'
                  e.currentTarget.style.boxShadow = '0 8px 30px rgba(0,0,0,0.15)'
                  e.currentTarget.style.border = '2px solid #147fe3'
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.transform = 'scale(1)'
                  e.currentTarget.style.boxShadow = '0 4px 20px rgba(0,0,0,0.1)'
                  e.currentTarget.style.border = '2px solid transparent'
                }}
              >
                <div className="flex items-center gap-4">
                  <div
                    className="w-16 h-16 flex items-center justify-center flex-shrink-0"
                    style={{
                      backgroundColor: 'rgba(20, 127, 227, 0.1)',
                      borderRadius: '12px'
                    }}
                  >
                    <Users className="h-8 w-8" style={{ color: '#147fe3' }} />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-semibold mb-1 text-gray-900">Parents & teachers</h3>
                    <p className="text-gray-600">
                      Sign in with email & password
                    </p>
                  </div>
                </div>
              </button>

              {/* Child Card */}
              <button
                onClick={() => setSignInType('child')}
                className="w-full"
                style={{
                  padding: '1.5rem',
                  borderRadius: '12px',
                  border: '2px solid transparent',
                  background: 'white',
                  cursor: 'pointer',
                  textAlign: 'left',
                  transition: 'all 0.2s ease',
                  boxShadow: '0 4px 20px rgba(0,0,0,0.1)',
                  maxWidth: '600px'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.transform = 'scale(1.02)'
                  e.currentTarget.style.boxShadow = '0 8px 30px rgba(0,0,0,0.15)'
                  e.currentTarget.style.border = '2px solid #147fe3'
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.transform = 'scale(1)'
                  e.currentTarget.style.boxShadow = '0 4px 20px rgba(0,0,0,0.1)'
                  e.currentTarget.style.border = '2px solid transparent'
                }}
              >
                <div className="flex items-center gap-4">
                  <div
                    className="w-16 h-16 flex items-center justify-center flex-shrink-0"
                    style={{
                      backgroundColor: 'rgba(20, 127, 227, 0.1)',
                      borderRadius: '12px'
                    }}
                  >
                    <Heart className="h-8 w-8" style={{ color: '#147fe3' }} />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-semibold mb-1 text-gray-900">Child</h3>
                    <p className="text-gray-600">
                      Sign in with username & PIN
                    </p>
                  </div>
                </div>
              </button>
            </div>
          )}

          {/* Form Card - Only show if type selected */}
          {signInType && (
            <div
              style={{
                backgroundColor: 'rgba(255, 255, 255, 0.6)',
                backdropFilter: 'blur(16px)',
                WebkitBackdropFilter: 'blur(16px)',
                border: '1px solid rgba(0, 0, 0, 0.1)',
                borderRadius: '16px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.08)',
                padding: '40px',
                maxWidth: '600px',
                margin: '0 auto'
              }}
            >
              {/* Back Button */}
              <button
                type="button"
                onClick={() => setSignInType(null)}
                className="flex items-center gap-2 mb-6 transition-opacity hover:opacity-70"
                style={{
                  background: 'none',
                  border: 'none',
                  cursor: 'pointer',
                  color: '#147fe3',
                  fontSize: '14px',
                  fontWeight: '500'
                }}
              >
                <ArrowLeft size={16} />
                Back to options
              </button>

              <form onSubmit={handleSubmit} className="space-y-6">
              {/* Practitioner Sign In Form */}
              {signInType === 'practitioner' && (
                <>
                  {/* Email Field */}
                  <div>
                    <label htmlFor="email" className="block text-sm font-semibold mb-2" style={{ color: '#1f2937' }}>
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
                        backgroundColor: 'white',
                        fontSize: '16px',
                        borderRadius: '8px',
                        border: '1px solid rgba(0, 0, 0, 0.2)'
                      }}
                      placeholder="your@email.com"
                      required
                    />
                  </div>

                  {/* Password Field */}
                  <div>
                    <label htmlFor="password" className="block text-sm font-semibold mb-2" style={{ color: '#1f2937' }}>
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
                        backgroundColor: 'white',
                        fontSize: '16px',
                        borderRadius: '8px',
                        border: '1px solid rgba(0, 0, 0, 0.2)'
                      }}
                      placeholder="Enter your password"
                      required
                    />
                  </div>
                </>
              )}

              {/* Child Sign In Form */}
              {signInType === 'child' && (
                <>
                  {/* Username Field */}
                  <div>
                    <label htmlFor="username" className="block text-sm font-semibold mb-2" style={{ color: '#1f2937' }}>
                      Username
                    </label>
                    <input
                      type="text"
                      id="username"
                      value={username}
                      onChange={(e) => setUsername(e.target.value)}
                      onFocus={handleInputFocus}
                      onBlur={handleInputBlur}
                      className="w-full px-4 py-3 focus:outline-none transition-colors"
                      style={{
                        backgroundColor: 'white',
                        fontSize: '16px',
                        borderRadius: '8px',
                        border: '1px solid rgba(0, 0, 0, 0.2)'
                      }}
                      placeholder="Enter your username"
                      required
                    />
                  </div>

                  {/* PIN Field - 4 digit boxes */}
                  <div>
                    <label className="block text-sm font-semibold mb-2" style={{ color: '#1f2937' }}>
                      PIN
                    </label>
                    <div className="flex gap-3 justify-center">
                      {[0, 1, 2, 3].map((index) => (
                        <input
                          key={index}
                          ref={pinInputRefs[index]}
                          type="text"
                          inputMode="numeric"
                          pattern="[0-9]"
                          maxLength={1}
                          value={pin[index]}
                          onChange={(e) => handlePinChange(index, e.target.value)}
                          onKeyDown={(e) => handlePinKeyDown(index, e)}
                          onFocus={handleInputFocus}
                          onBlur={handleInputBlur}
                          className="focus:outline-none transition-all"
                          style={{
                            width: '60px',
                            height: '60px',
                            backgroundColor: 'white',
                            fontSize: '24px',
                            fontWeight: '600',
                            textAlign: 'center',
                            borderRadius: '12px',
                            border: pin[index] ? '2px solid #147fe3' : '2px solid rgba(0, 0, 0, 0.2)',
                            boxShadow: pin[index] ? '0 0 0 3px rgba(20, 127, 227, 0.1)' : 'none'
                          }}
                          aria-label={`PIN digit ${index + 1}`}
                        />
                      ))}
                    </div>
                  </div>
                </>
              )}

              {/* Sign In Button */}
              <div className="flex justify-center pt-4">
                <button
                  type="submit"
                  disabled={!isFormValid}
                  className="font-semibold text-lg transition-all duration-200"
                  style={{
                    backgroundColor: '#147fe3',
                    color: 'white',
                    height: '50px',
                    borderRadius: '999px',
                    paddingLeft: '50px',
                    paddingRight: '50px',
                    border: '2px solid #147fe3',
                    cursor: isFormValid ? 'pointer' : 'not-allowed',
                    boxShadow: '0 2px 8px rgba(20, 127, 227, 0.2)',
                    opacity: isFormValid ? 1 : 0.3
                  }}
                  onMouseEnter={(e) => {
                    if (isFormValid) e.currentTarget.style.backgroundColor = '#1166cc'
                  }}
                  onMouseLeave={(e) => {
                    if (isFormValid) e.currentTarget.style.backgroundColor = '#147fe3'
                  }}
                >
                  SIGN IN
                </button>
              </div>
            </form>
          </div>
          )}

          {/* Theo Animation - Shown when not in a form */}
          {theoAnimation && (
            <div style={{ marginTop: '40px', display: 'flex', justifyContent: 'center' }}>
              <div style={{ width: '300px', height: '300px' }}>
                <Lottie
                  animationData={theoAnimation}
                  loop={true}
                  autoplay={true}
                />
              </div>
            </div>
          )}
        </div>

        {/* Yellow swoosh footer - hidden on mobile */}
        <div className="hidden md:block absolute bottom-0 left-0 right-0">
          <YellowSwoosh position="absolute" />
        </div>
      </div>
    </>
  )
}
