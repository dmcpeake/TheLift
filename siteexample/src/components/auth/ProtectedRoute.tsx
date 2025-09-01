import React from 'react'
import { Navigate } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { LoadingSpinner } from '../shared/LoadingSpinner'

interface ProtectedRouteProps {
  children: React.ReactNode
  allowedRoles: string[]
}

export function ProtectedRoute({ children, allowedRoles }: ProtectedRouteProps) {
  const { user, loading, currentMode } = React.useContext(AuthContext)
  
  if (loading) return <LoadingSpinner />
  
  // Special handling for admin routes - redirect to admin login
  const currentPath = window.location.pathname
  const isAdminRoute = currentPath.startsWith('/admin') && currentPath !== '/admin/login'
  
  if (isAdminRoute && (!user || user.profile.role !== 'Account')) {
    console.log('Admin route access denied - redirecting to admin login')
    return <Navigate to="/admin/login" />
  }
  
  if (!user) {
    console.log('No user found - redirecting to login')
    return <Navigate to="/login" />
  }
  
  // Debug logging
  console.log('ProtectedRoute check:', {
    path: currentPath,
    userRole: user.profile.role,
    allowedRoles,
    currentMode,
    userId: user.id
  })
  
  // For GroupContact users, check the current mode
  if (user.profile.role === 'GroupContact') {
    // Admin-only routes
    const adminOnlyRoutes = ['practitioners', 'invite']
    const isAdminOnlyRoute = adminOnlyRoutes.some(route => currentPath.includes(route))
    
    if (isAdminOnlyRoute && currentMode === 'practitioner') {
      console.log('Access denied - GroupContact in practitioner mode accessing admin route')
      return <Navigate to="/dashboard" />
    }
    
    // GroupContact can access both admin and practitioner routes based on mode
    const effectiveRole = currentMode === 'admin' ? 'GroupContact' : 'Practitioner'
    if (!allowedRoles.includes(effectiveRole) && !allowedRoles.includes('GroupContact')) {
      console.log('Access denied - Effective role:', effectiveRole, 'Allowed roles:', allowedRoles)
      return <Navigate to="/unauthorized" />
    }
  } else {
    // For non-GroupContact users, use standard role checking
    if (!allowedRoles.includes(user.profile.role)) {
      console.log('Access denied - User role:', user.profile.role, 'Allowed roles:', allowedRoles, 'Path:', currentPath)
      return <Navigate to="/unauthorized" />
    }
  }
  
  console.log('Access granted to:', currentPath)
  return <>{children}</>
}