import React, { useState, useEffect } from 'react'
import { useLocation } from 'react-router-dom'
import { Button } from '../ui/button'

export function MarketingNavigation() {
  const location = useLocation()
  const [isScrolled, setIsScrolled] = useState(false)
  const [isMobile, setIsMobile] = useState(false)

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 0)
    }
    
    const handleResize = () => {
      setIsMobile(window.innerWidth < 768)
    }
    
    // Set initial value
    handleResize()
    
    window.addEventListener('scroll', handleScroll)
    window.addEventListener('resize', handleResize)
    return () => {
      window.removeEventListener('scroll', handleScroll)
      window.removeEventListener('resize', handleResize)
    }
  }, [])

  const isActive = (path: string) => {
    return location.pathname === path
  }

  const handleJoinWaitlistClick = (e: React.MouseEvent) => {
    e.preventDefault()
    const waitlistForm = document.getElementById('waitlist-form')
    if (waitlistForm) {
      waitlistForm.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }
  }

  const handleLogoClick = (e: React.MouseEvent) => {
    e.preventDefault()
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  return (
    <nav 
      className="bg-white sticky top-0 z-50 transition-shadow duration-300" 
      style={{ 
        borderBottom: '1px solid #e5e5e5',
        boxShadow: isScrolled ? '0 4px 8px rgba(0, 0, 0, 0.1)' : 'none'
      }}
    >
      <div
        className="w-full py-5"
        style={{
          paddingLeft: '20px',
          paddingRight: '20px'
        }}
      >
        <div className="flex items-center justify-between">
          <button onClick={handleLogoClick} className="flex items-center gap-3 cursor-pointer">
            <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
              <circle cx="7" cy="23" r="4" fill="#147fe3"/>
              <circle cx="15" cy="15" r="4" fill="#147fe3"/>
              <circle cx="23" cy="7" r="4" fill="#147fe3"/>
            </svg>
            <img src="/TheLiftLogo.svg" alt="The Lift" className="h-5" style={{ imageRendering: 'auto', shapeRendering: 'geometricPrecision', filter: 'brightness(0) saturate(100%) invert(11%) sepia(0%) saturate(7465%) hue-rotate(189deg) brightness(105%) contrast(86%)' }} />
          </button>
          
          <div className="flex items-center" style={{ gap: '20px' }}>
            {/* SIGN IN button temporarily hidden - login page still accessible at /login */}
            {/* <Button
              onClick={() => window.location.href = '/login'}
              variant="outline"
              className="h-10 rounded flex items-center justify-center pt-2.5 pb-2"
              style={{ border: '1px solid #147fe3', color: '#147fe3', backgroundColor: 'transparent' }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = '#147fe3'
                e.currentTarget.style.color = 'white'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'transparent'
                e.currentTarget.style.color = '#147fe3'
              }}
            >
              SIGN IN
            </Button> */}
            <Button
              onClick={handleJoinWaitlistClick}
              className="h-10 rounded flex items-center justify-center pt-2.5 pb-2"
              style={{ backgroundColor: '#147fe3', color: 'white' }}
              onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#1171CD'}
              onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#147fe3'}
            >
              JOIN WAITLIST
            </Button>
          </div>
        </div>
      </div>
    </nav>
  )
}