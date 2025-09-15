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

  if (!user) return null

  const isGroupContact = user.profile.role === 'GroupContact'
  const isAdmin = user.profile.role === 'Account'

  return (
    <nav className="bg-white border-b border-gray-200 px-6 py-4">
      <div className="flex items-center justify-between">
        {/* Logo and Brand */}
        <div className="flex items-center">
          <Link to={isAdmin ? "/admin" : "/dashboard"} className="flex items-center space-x-2">
            <span className="text-xl font-bold text-gray-900">The Lift</span>
          </Link>
        </div>

        {/* Right side - Navigation and User Menu */}
        <div className="flex items-center ml-auto">
          
          {/* Navigation Links for GroupContact */}
          {isGroupContact && (
            <div className="relative flex items-center">
              <Link
                to="/dashboard"
                onClick={() => {
                  if (currentMode !== 'practitioner') toggleMode()
                }}
                className="px-3 py-2 text-sm font-medium text-gray-900 transition-colors relative hover:text-gray-700"
              >
                My Children
                {currentMode === 'practitioner' && (
                  <div className="absolute bottom-[-16px] left-0 right-0 h-0.5 bg-gray-900"></div>
                )}
              </Link>
              <div className="h-4 w-px bg-gray-300 mx-3"></div>
              <Link
                to="/dashboard"
                onClick={() => {
                  if (currentMode !== 'admin') toggleMode()
                }}
                className="px-3 py-2 text-sm font-medium text-gray-900 transition-colors relative hover:text-gray-700"
              >
                Group Admin
                {currentMode === 'admin' && (
                  <div className="absolute bottom-[-16px] left-0 right-0 h-0.5 bg-gray-900"></div>
                )}
              </Link>
            </div>
          )}

          {/* Divider between navigation and account menu */}
          {isGroupContact && (
            <div className="h-4 w-px bg-gray-300 mx-3"></div>
          )}

          {/* Admin Links */}
          {isAdmin && (
            <>
              <Link
                to="/admin"
                className="px-3 py-2 text-sm font-medium text-gray-900 transition-colors hover:text-gray-700"
              >
                Dashboard
              </Link>
              <div className="h-4 w-px bg-gray-300 mx-3"></div>
              <Link
                to="/admin/waitlist"
                className="px-3 py-2 text-sm font-medium text-gray-900 transition-colors hover:text-gray-700"
              >
                Waitlist
              </Link>
              <div className="h-4 w-px bg-gray-300 mx-3"></div>
            </>
          )}

          {/* Account Menu for all users */}
          <div className="flex items-center">
            <DropdownMenu open={isProfileOpen} onOpenChange={setIsProfileOpen}>
              <DropdownMenuTrigger asChild>
                <Button variant="ghost" size="sm" className="flex items-center space-x-2 px-3 py-2">
                  <span className="text-sm font-medium text-gray-900">My Account</span>
                  <ChevronDown className="w-4 h-4 text-gray-400" />
                </Button>
              </DropdownMenuTrigger>
              <DropdownMenuContent align="end" className="w-48">
                <DropdownMenuItem asChild>
                  <Link to="/profile" className="flex items-center space-x-2">
                    <User className="w-4 h-4" />
                    <span>Profile Settings</span>
                  </Link>
                </DropdownMenuItem>
                <DropdownMenuItem asChild>
                  <Link to="/test/wellbeing" className="flex items-center space-x-2">
                    <TestTube className="w-4 h-4" />
                    <span>Wellbeing Tools Test</span>
                  </Link>
                </DropdownMenuItem>
                <DropdownMenuSeparator />
                <DropdownMenuItem onClick={logout} className="flex items-center space-x-2 text-red-600">
                  <LogOut className="w-4 h-4" />
                  <span>Sign Out</span>
                </DropdownMenuItem>
              </DropdownMenuContent>
            </DropdownMenu>
          </div>
        </div>
      </div>
    </nav>
  )
}