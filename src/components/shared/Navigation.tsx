import React, { useContext, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { Button } from '../ui/button'
import {
  User,
  LogOut,
  ChevronDown,
  TestTube
} from 'lucide-react'
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuSeparator, DropdownMenuTrigger } from '../ui/dropdown-menu'

export function Navigation() {
  const { user, logout, currentMode, toggleMode } = useContext(AuthContext)
  const [isProfileOpen, setIsProfileOpen] = useState(false)
  const navigate = useNavigate()

  // Always show navigation for demo mode
  const isDemo = !user
  const isGroupContact = user?.profile.role === 'GroupContact' || isDemo
  const isAdmin = user?.profile.role === 'Account'

  // Get user name for greeting
  const getUserName = () => {
    if (user?.profile?.name) {
      return user.profile.name
    }
    if (user?.email) {
      return user.email.split('@')[0]
    }
    // Check sessionStorage for demo email
    const storedEmail = sessionStorage.getItem('userEmail')
    if (storedEmail) {
      return storedEmail.split('@')[0]
    }
    return 'there'
  }

  return (
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
        to={isAdmin ? "/admin" : "/dashboard"}
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

      {/* Right side - User greeting and Sign Out Button */}
      <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
        <span style={{ fontSize: '14px', fontWeight: 500, color: '#1f2937' }}>
          Hi {getUserName()}
        </span>
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
  )
}