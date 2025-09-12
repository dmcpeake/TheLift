import React, { useState, useEffect } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { Button } from '../ui/button'
import { Heart, Triangle } from 'lucide-react'

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
          paddingLeft: isMobile ? '20px' : '60px', 
          paddingRight: isMobile ? '20px' : '60px' 
        }}
      >
        <div className="flex items-center justify-between">
          <button onClick={handleLogoClick} className="flex items-center gap-3 cursor-pointer">
            <Triangle className="h-10 w-10 fill-current" style={{ color: '#147fe3' }} />
            <img src="/TheLiftLogo.svg" alt="The Lift" className="h-5" style={{ imageRendering: 'auto', shapeRendering: 'geometricPrecision', filter: 'brightness(0) saturate(100%) invert(11%) sepia(0%) saturate(7465%) hue-rotate(189deg) brightness(105%) contrast(86%)' }} />
          </button>
          
          <div className="flex items-center" style={{ gap: '20px' }}>
            <Link to="/login" style={{ display: 'none' }}>
              <Button variant="outline" className="h-10 rounded flex items-center justify-center pt-2.5 pb-2" style={{ color: '#147fe3', borderColor: '#147fe3' }}>SIGN IN</Button>
            </Link>
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