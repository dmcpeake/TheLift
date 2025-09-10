import React from 'react'
import { Link, useLocation } from 'react-router-dom'
import { Button } from '../ui/button'
import { Heart } from 'lucide-react'

export function MarketingNavigation() {
  const location = useLocation()

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
    <nav className="bg-white/80 backdrop-blur-sm sticky top-0 z-50" style={{ borderBottom: '1px solid #e5e5e5' }}>
      <div className="max-w-7xl mx-auto px-6 py-5">
        <div className="flex items-center justify-between">
          <button onClick={handleLogoClick} className="flex items-center gap-3 cursor-pointer">
            <img src="/TheLiftLogo.svg" alt="The Lift" className="h-10" style={{ imageRendering: 'auto', shapeRendering: 'geometricPrecision' }} />
          </button>
          
          <div className="flex items-center" style={{ gap: '20px' }}>
            <Link to="/login">
              <Button variant="outline" className="h-10 rounded flex items-center justify-center pt-2.5 pb-2" style={{ color: '#3F7A9A', borderColor: '#3F7A9A' }}>SIGN IN</Button>
            </Link>
            <Button 
              onClick={handleJoinWaitlistClick}
              className="h-10 rounded flex items-center justify-center pt-2.5 pb-2" 
              style={{ backgroundColor: '#3F7A9A', color: 'white' }} 
              onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2F5A7A'} 
              onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3F7A9A'}
            >
              JOIN WAITLIST
            </Button>
          </div>
        </div>
      </div>
    </nav>
  )
}