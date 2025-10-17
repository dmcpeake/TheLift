import React, { useState, useEffect } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import { LogOut } from 'lucide-react'
import Lottie from 'lottie-react'

export function SignIn() {
  const navigate = useNavigate()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [scrollPosition, setScrollPosition] = useState(0)
  const [theoAnimation, setTheoAnimation] = useState(null)

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
      // Store email in sessionStorage for the greeting
      sessionStorage.setItem('userEmail', email)
      window.scrollTo(0, 0)
      navigate('/dashboard')
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
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px',
              textDecoration: 'none'
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
              style={{
                height: '20px',
                imageRendering: 'auto',
                shapeRendering: 'geometricPrecision',
                filter: 'brightness(0) saturate(100%) invert(11%) sepia(0%) saturate(7465%) hue-rotate(189deg) brightness(105%) contrast(86%)'
              }}
            />
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

        <div className="max-w-md mx-auto p-6" style={{ paddingBottom: '120px' }}>
          {/* Title */}
          <div className="mb-8" style={{ marginTop: '40px' }}>
            <h1 className="text-3xl font-bold text-center" style={{ color: '#1f2937' }}>
              Sign In
            </h1>
          </div>

          {/* Form Card */}
          <div
            style={{
              backgroundColor: 'rgba(255, 255, 255, 0.6)',
              backdropFilter: 'blur(16px)',
              WebkitBackdropFilter: 'blur(16px)',
              border: '1px solid rgba(0, 0, 0, 0.1)',
              borderRadius: '16px',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.08)',
              padding: '40px'
            }}
          >
            <form onSubmit={handleSubmit} className="space-y-6">
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

          {/* Theo Animation */}
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
