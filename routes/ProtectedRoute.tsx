import React, { useContext } from 'react'
import { Navigate } from 'react-router-dom'
import { AuthContext } from '../utils/auth/context'
import { UserRole } from '../utils/auth/types'

interface ProtectedRouteProps {
  children: React.ReactNode
  requiredRole?: UserRole
  requiredRoles?: UserRole[]
}

export function ProtectedRoute({ children, requiredRole, requiredRoles }: ProtectedRouteProps) {
  const authContext = useContext(AuthContext)
  
  if (!authContext) {
    return <Navigate to="/login" replace />
  }
  
  const { user, loading } = authContext
  
  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-gray-600">Loading...</div>
      </div>
    )
  }
  
  if (!user) {
    return <Navigate to="/login" replace />
  }
  
  const userRole = user.profile.role
  const allowedRoles = requiredRoles || (requiredRole ? [requiredRole] : [])
  
  if (allowedRoles.length > 0 && !allowedRoles.includes(userRole)) {
    const redirectPath = userRole === 'Account' ? '/admin' : 
                        userRole === 'Child' ? '/child/home' : '/dashboard'
    return <Navigate to={redirectPath} replace />
  }
  
  return <>{children}</>
}