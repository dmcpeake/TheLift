import React, { useState, useEffect } from 'react'
import { BrowserRouter as Router, useNavigate } from 'react-router-dom'
import { getSupabaseClient } from './utils/supabase/client'
import { projectId, publicAnonKey } from './utils/supabase/info'
import { AuthContext } from './utils/auth/context'
import { User, UserMode } from './utils/auth/types'
import { fetchUserProfile, getNavigationPathForRole, getDefaultModeForRole } from './utils/auth/helpers'
import { AppRoutes } from './routes/AppRoutes'

const supabase = getSupabaseClient()

function AppContent() {
  const [user, setUser] = useState<User | null>(null)
  const [loading, setLoading] = useState(true)
  const [currentMode, setCurrentMode] = useState<UserMode>('admin')
  const [logoutUserRole, setLogoutUserRole] = useState<string | null>(null)
  const navigate = useNavigate()

  const toggleMode = () => {
    setCurrentMode(prev => prev === 'admin' ? 'practitioner' : 'admin')
  }

  useEffect(() => {
    // Initialize test users on app start
    const initializeTestUsers = async () => {
      try {
        console.log('Starting test user initialization...')
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/auth/init-test-users`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${publicAnonKey}`,
          },
        })
        
        if (response.ok) {
          const result = await response.json()
          console.log('Test users initialized successfully:', result)
          
          // Verify child data was created
          try {
            const debugResponse = await fetch(`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/auth/debug/child-data`, {
              headers: {
                'Authorization': `Bearer ${publicAnonKey}`,
              },
            })
            if (debugResponse.ok) {
              const debugData = await debugResponse.json()
              console.log('Child test data verification:', debugData)
            }
          } catch (debugError) {
            console.log('Could not verify child data:', debugError)
          }
        } else {
          const error = await response.json()
          console.log('Failed to initialize test users:', error)
        }
      } catch (error) {
        console.log('Could not initialize test users:', error)
      }
    }

    // Check for existing session
    const checkUser = async () => {
      try {
        const { data: { session } } = await supabase.auth.getSession()
        
        if (session?.user && session?.access_token) {
          const userData = await fetchUserProfile(
            session.access_token, 
            session.user.id, 
            session.user.email!
          )
          setUser(userData)
          
          // Only navigate if we're on a generic route (to avoid disrupting deep links)
          const currentPath = window.location.pathname
          const isGenericRoute = currentPath === '/' || currentPath === '/login' || currentPath === '/dashboard'
          
          if (isGenericRoute && userData?.profile?.role) {
            const defaultMode = getDefaultModeForRole(userData.profile.role)
            setCurrentMode(defaultMode)
            navigate(getNavigationPathForRole(userData.profile.role))
          }
        }
      } catch (error) {
        console.error('Error checking user session:', error)
      } finally {
        setLoading(false)
      }
    }

    // Initialize test users first, then check for existing session
    initializeTestUsers().then(() => checkUser())

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      if (event === 'SIGNED_IN' && session?.user && session?.access_token) {
        console.log('User signed in:', session.user.email)
        const userData = await fetchUserProfile(
          session.access_token, 
          session.user.id, 
          session.user.email!
        )
        console.log('User data fetched:', userData)
        setUser(userData)
        
        // Set default mode and navigate based on user role
        if (userData?.profile?.role) {
          const defaultMode = getDefaultModeForRole(userData.profile.role)
          setCurrentMode(defaultMode)
          navigate(getNavigationPathForRole(userData.profile.role))
        } else {
          // Fallback to admin mode
          setCurrentMode('admin')
        }
        
        setLogoutUserRole(null) // Clear any stored logout role
      } else if (event === 'SIGNED_OUT') {
        setUser(null)
        setCurrentMode('admin')
        
        // Handle navigation based on the role of the user who logged out
        if (logoutUserRole === 'Account') {
          console.log('Admin user signed out, navigating to /admin/login')
          navigate('/admin/login')
        } else if (logoutUserRole) {
          console.log('Non-admin user signed out, navigating to /login')
          navigate('/login')
        }
        setLogoutUserRole(null) // Clear the stored role
      }
      setLoading(false)
    })

    checkUser()

    return () => {
      subscription?.unsubscribe()
    }
  }, [])

  const logout = async () => {
    const currentUserRole = user?.profile.role
    console.log('Logout - Storing user role:', currentUserRole)
    
    // Store the user role before signing out so we can navigate appropriately
    setLogoutUserRole(currentUserRole || null)
    
    await supabase.auth.signOut()
    // Don't manually set user or navigate here - let the onAuthStateChange handler do it
  }

  const authValue = {
    user,
    setUser,
    loading,
    logout,
    currentMode,
    toggleMode
  }

  return (
    <AuthContext.Provider value={authValue}>
      <AppRoutes />
    </AuthContext.Provider>
  )
}

export default function App() {
  return (
    <Router>
      <AppContent />
    </Router>
  )
}

export { AuthContext }