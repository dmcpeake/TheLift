import React from 'react'
import { Link, useLocation } from 'react-router-dom'
import { Button } from '../ui/button'
import { Heart } from 'lucide-react'

export function MarketingNavigation() {
  const location = useLocation()

  const isActive = (path: string) => {
    return location.pathname === path
  }

  return (
    <nav className="bg-white/80 backdrop-blur-sm border-b border-gray-100 sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-6 py-4">
        <div className="flex items-center justify-between">
          <Link to="/" className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gray-900 rounded-lg flex items-center justify-center">
              <Heart className="h-6 w-6 text-white" />
            </div>
            <span className="text-2xl font-bold text-gray-900">The Lift</span>
          </Link>
          
          <div className="hidden md:flex items-center gap-8">
            <Link 
              to="/about" 
              className={`transition-colors ${
                isActive('/about') 
                  ? 'text-gray-900 font-medium' 
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              About
            </Link>
            <Link 
              to="/how-it-works" 
              className={`transition-colors ${
                isActive('/how-it-works') 
                  ? 'text-gray-900 font-medium' 
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              How It Works
            </Link>
            <Link 
              to="/pricing" 
              className={`transition-colors ${
                isActive('/pricing') 
                  ? 'text-gray-900 font-medium' 
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              Pricing
            </Link>
            <Link 
              to="/waitlist" 
              className={`transition-colors ${
                isActive('/waitlist') 
                  ? 'text-gray-900 font-medium' 
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              Waitlist
            </Link>
          </div>
          
          <div className="flex items-center gap-4">
            <Link to="/login">
              <Button variant="outline">Sign In</Button>
            </Link>
            <Link to="/waitlist">
              <Button className="bg-gray-900 hover:bg-gray-800">
                Join Waitlist
              </Button>
            </Link>
          </div>
        </div>
      </div>
    </nav>
  )
}