import React, { useState, useContext, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { AuthContext } from '../../utils/auth/context'
import { getDefaultModeForRole } from '../../utils/auth/helpers'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Alert, AlertDescription } from '../ui/alert'
import { Separator } from '../ui/separator'
import { AlertCircle, ArrowRight, Users, Smile, Building, ArrowLeft } from 'lucide-react'

const supabase = getSupabaseClient()

type UserType = 'adult' | 'child' | null

export function UnifiedLoginPage() {
  const [userType, setUserType] = useState<UserType>(null)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [username, setUsername] = useState('')
  const [pin, setPin] = useState(['', '', '', ''])
  const [loading, setLoading] = useState(false)
  const [loadingButton, setLoadingButton] = useState<string | null>(null)
  const [error, setError] = useState('')
  const { setUser, toggleMode, currentMode } = useContext(AuthContext)
  const navigate = useNavigate()
  
  // Refs for PIN inputs
  const pinRefs = [
    useRef<HTMLInputElement>(null),
    useRef<HTMLInputElement>(null),
    useRef<HTMLInputElement>(null),
    useRef<HTMLInputElement>(null)
  ]

  const handleAdultLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')

    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      })

      if (error) throw error

      if (data.session?.access_token) {
        // Fetch user profile from server
        try {
          const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/auth/profile`, {
            headers: {
              'Authorization': `Bearer ${data.session.access_token}`,
              'Content-Type': 'application/json',
            },
          })

          if (response.ok) {
            const userData = await response.json()
            if (userData.profile?.role === 'LiftStaff') {
              userData.profile.role = 'Account'
            }
            setUser(userData)
            
            switch (userData.profile.role) {
              case 'Account':
                navigate('/admin')
                break
              case 'Child':
                navigate('/child/home')
                break
              default:
                navigate('/dashboard')
                break
            }
          } else {
            // Fallback logic
            let fallbackRole = data.user.user_metadata?.role || 'Practitioner'
            if (data.user.email === 'admin@thelift.com') {
              fallbackRole = 'Account'
            } else if (data.user.email === 'contact@demoschool.com') {
              fallbackRole = 'GroupContact'
            }
            
            const fallbackUser = {
              id: data.user.id,
              email: data.user.email!,
              profile: {
                id: data.user.id,
                name: data.user.email?.split('@')[0] || 'User',
                role: fallbackRole,
                orgId: 'default-org',
                status: 'active'
              }
            }
            setUser(fallbackUser)
            
            switch (fallbackRole) {
              case 'Account':
                navigate('/admin')
                break
              default:
                navigate('/dashboard')
                break
            }
          }
        } catch (profileError) {
          console.error('Error fetching profile:', profileError)
          navigate('/dashboard')
        }
      }
    } catch (error: any) {
      console.error('Login error:', error)
      setError(error.message || 'Failed to sign in')
    } finally {
      setLoading(false)
    }
  }

  const handlePinChange = (index: number, value: string) => {
    // Only allow single digits
    const digit = value.replace(/\D/g, '').slice(-1)
    
    const newPin = [...pin]
    newPin[index] = digit
    setPin(newPin)

    // Auto-focus next input if digit was entered
    if (digit && index < 3) {
      setTimeout(() => pinRefs[index + 1].current?.focus(), 0)
    }
  }

  const handlePinKeyDown = (index: number, e: React.KeyboardEvent<HTMLInputElement>) => {
    // Handle backspace
    if (e.key === 'Backspace') {
      if (!pin[index] && index > 0) {
        // If current box is empty and backspace is pressed, move to previous box
        setTimeout(() => pinRefs[index - 1].current?.focus(), 0)
      } else {
        // Clear current box
        const newPin = [...pin]
        newPin[index] = ''
        setPin(newPin)
      }
    }
    
    // Handle arrow keys
    if (e.key === 'ArrowLeft' && index > 0) {
      setTimeout(() => pinRefs[index - 1].current?.focus(), 0)
    }
    if (e.key === 'ArrowRight' && index < 3) {
      setTimeout(() => pinRefs[index + 1].current?.focus(), 0)
    }

    // Prevent non-numeric input
    if (!/[0-9]/.test(e.key) && !['Backspace', 'Delete', 'Tab', 'ArrowLeft', 'ArrowRight'].includes(e.key)) {
      e.preventDefault()
    }
  }

  const handleChildLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')

    const pinString = pin.join('')

    try {
      console.log('Attempting child login with:', { username, pin: pinString })
      
      // Use child authentication endpoint with proper auth header
      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/auth/child-login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${publicAnonKey}`,
        },
        body: JSON.stringify({
          username,
          pin: pinString,
        }),
      })

      console.log('Child login response status:', response.status)
      const data = await response.json()
      console.log('Child login response data:', data)

      if (!response.ok) {
        throw new Error(data.error || 'Login failed')
      }

      if (data.success && data.user) {
        // Set user in context
        setUser({
          id: data.user.id,
          email: `${data.user.username}@child.local`,
          profile: data.user.profile
        })
        
        // Store session token for future requests
        localStorage.setItem('childSessionToken', data.sessionToken)
        
        navigate('/child/home')
      } else {
        throw new Error('Invalid response from server')
      }
    } catch (error: any) {
      console.error('Child login error:', error)
      setError(error.message || 'Failed to sign in. Please check your username and PIN.')
    } finally {
      setLoading(false)
    }
  }

  const handleOAuthLogin = async (provider: 'google' | 'microsoft') => {
    setError('')
    try {
      const { error } = await supabase.auth.signInWithOAuth({
        provider,
        options: {
          redirectTo: `${window.location.origin}/dashboard`
        }
      })
      if (error) throw error
    } catch (error: any) {
      console.error('OAuth login error:', error)
      setError(error.message || `Failed to sign in with ${provider}`)
    }
  }

  const quickLogin = async (testEmail: string, isChild = false) => {
    console.log('=== QUICK LOGIN CALLED ===', { testEmail, isChild })
    
    // Set loading state for the specific button
    const buttonId = isChild ? 'child' : testEmail
    setLoadingButton(buttonId)
    setError('') // Clear any previous errors
    
    if (isChild) {
      console.log('Quick login for child - using direct login method')
      
      try {
        // Initialize test users first
        const initResponse = await fetch(`https://${projectId}.supabase.co/functions/v1/server/auth/init-test-users`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${publicAnonKey}`,
          },
        })
        
        if (initResponse.ok) {
          console.log('✅ Test users initialized successfully')
        }

        // Wait for initialization
        await new Promise(resolve => setTimeout(resolve, 1000))
        
        // Perform child login
        setLoading(true)
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/auth/child-login`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${publicAnonKey}`,
          },
          body: JSON.stringify({
            username: 'testchild',
            pin: '1234',
          }),
        })

        const data = await response.json()

        if (!response.ok) {
          throw new Error(data.error || `Server error: ${response.status}`)
        }

        if (data.success && data.user) {
          setUser({
            id: data.user.id,
            email: `${data.user.username}@child.local`,
            profile: data.user.profile
          })
          
          localStorage.setItem('childSessionToken', data.sessionToken)
          navigate('/child/home')
        } else {
          throw new Error('Invalid response from server - missing user data')
        }
      } catch (error: any) {
        console.error('Quick login failed:', error)
        setError('Quick login failed. Please try again.')
      } finally {
        setLoading(false)
        setLoadingButton(null)
      }
    } else {
      // Handle adult login directly via Supabase auth
      console.log('Quick login for adult - using direct Supabase auth')
      
      try {
        setLoading(true)
        
        const { data, error } = await supabase.auth.signInWithPassword({
          email: testEmail,
          password: 'quicktest123',
        })

        if (error) throw error

        if (data.session?.access_token) {
          // Fetch user profile from server
          try {
            const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/auth/profile`, {
              headers: {
                'Authorization': `Bearer ${data.session.access_token}`,
                'Content-Type': 'application/json',
              },
            })

            if (response.ok) {
              const userData = await response.json()
              if (userData.profile?.role === 'LiftStaff') {
                userData.profile.role = 'Account'
              }
              setUser(userData)
              
              switch (userData.profile.role) {
                case 'Account':
                  navigate('/admin')
                  break
                case 'Child':
                  navigate('/child/home')
                  break
                default:
                  navigate('/dashboard')
                  break
              }
            } else {
              // Fallback logic
              let fallbackRole = data.user.user_metadata?.role || 'Practitioner'
              if (data.user.email === 'admin@thelift.com') {
                fallbackRole = 'Account'
              } else if (data.user.email === 'contact@demoschool.com') {
                fallbackRole = 'GroupContact'
              }
              
              const fallbackUser = {
                id: data.user.id,
                email: data.user.email!,
                profile: {
                  id: data.user.id,
                  name: data.user.email?.split('@')[0] || 'User',
                  role: fallbackRole,
                  orgId: 'default-org',
                  status: 'active'
                }
              }
              setUser(fallbackUser)
              
              switch (fallbackRole) {
                case 'Account':
                  navigate('/admin')
                  break
                default:
                  navigate('/dashboard')
                  break
              }
            }
          } catch (profileError) {
            console.error('Error fetching profile:', profileError)
            navigate('/dashboard')
          }
        }
      } catch (error: any) {
        console.error('Adult quick login failed:', error)
        setError(error.message || 'Failed to sign in')
      } finally {
        setLoading(false)
        setLoadingButton(null)
      }
    }
  }

  if (!userType) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
        <div className="w-full max-w-md">
          <div className="text-center mb-8">
            <h1 className="text-3xl text-gray-900 mb-2">Sign in to The Lift</h1>
          </div>

          <div className="space-y-4">
            <Card 
              className="cursor-pointer hover:bg-gray-50 transition-colors"
              onClick={() => setUserType('adult')}
            >
              <CardContent className="p-6">
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center">
                    <Building className="h-6 w-6 text-gray-700" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-lg text-gray-900 mb-1">Staff & Administrators</h3>
                    <p className="text-sm text-gray-600">
                      For teachers, practitioners, and group administrators
                    </p>
                  </div>
                  <ArrowRight className="h-5 w-5 text-gray-400" />
                </div>
              </CardContent>
            </Card>

            <Card 
              className="cursor-pointer hover:bg-gray-50 transition-colors"
              onClick={() => setUserType('child')}
            >
              <CardContent className="p-6">
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center">
                    <Smile className="h-6 w-6 text-gray-700" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-lg text-gray-900 mb-1">Children</h3>
                    <p className="text-sm text-gray-600">
                      For students using The Lift with username and PIN
                    </p>
                  </div>
                  <ArrowRight className="h-5 w-5 text-gray-400" />
                </div>
              </CardContent>
            </Card>
          </div>

          <div className="mt-8 text-center">
            <p className="text-sm text-gray-600 mb-4">Quick Test (Development Only):</p>
            <div className="grid grid-cols-3 gap-2">
              <Button 
                variant="outline" 
                size="sm" 
                onClick={async () => {
                  setLoadingButton('groupadmin')
                  try {
                    // Auto-login to test group admin account (using demo user)
                    const { data, error } = await supabase.auth.signInWithPassword({
                      email: 'demo@groupadmin.com',
                      password: 'password123'
                    })
                    
                    if (error) throw error
                    
                    // The auth state change will handle navigation
                  } catch (error: any) {
                    console.error('Group admin auto-login failed:', error)
                    console.error('Error details:', error.message, error.code, error.status)
                    setError(`Group Admin login failed: ${error.message}. Click here to continue with demo mode.`)
                    
                    // Don't automatically navigate - let user see the error first
                    // Disable auto-fallback for debugging
                    // setTimeout(() => {
                    //   // Fallback to bypass if auto-login fails (after 3 seconds)
                    //   setUser({ 
                    //     id: 'test-group-admin-id', 
                    //     email: 'quicktest@admin.com',
                    //     profile: { role: 'GroupContact', name: 'Test Group Admin' }
                    //   })
                    //   // Set proper mode for GroupContact
                    //   if (currentMode !== 'practitioner') {
                    //     toggleMode()
                    //   }
                    //   navigate('/dashboard')
                    // }, 3000)
                  } finally {
                    setLoadingButton(null)
                  }
                }}
                disabled={loadingButton === 'groupadmin'}
                className="text-xs"
              >
                {loadingButton === 'groupadmin' ? 'Logging in...' : 'Group Admin Demo'}
              </Button>
              <Button 
                variant="outline" 
                size="sm" 
                onClick={async () => {
                  setLoadingButton('practitioner')
                  try {
                    // Auto-login to test practitioner account (using verified user)
                    const { data, error } = await supabase.auth.signInWithPassword({
                      email: 'practitioner@example.com',
                      password: 'password123'
                    })
                    
                    if (error) throw error
                    
                    // The auth state change will handle navigation
                  } catch (error: any) {
                    console.error('Practitioner auto-login failed:', error)
                    console.error('Error details:', error.message, error.code, error.status)
                    setError(`Practitioner login failed: ${error.message}. Using demo mode.`)
                    // Fallback to bypass if auto-login fails
                    setUser({
                      id: 'test-prac-id',
                      email: 'quicktest@practitioner.com', 
                      profile: { role: 'Practitioner', name: 'Test Practitioner' }
                    })
                    // Practitioners should use practitioner mode
                    if (currentMode !== 'practitioner') {
                      toggleMode()
                    }
                    navigate('/dashboard')
                  } finally {
                    setLoadingButton(null)
                  }
                }}
                disabled={loadingButton === 'practitioner'}
                className="text-xs"
              >
                {loadingButton === 'practitioner' ? 'Logging in...' : 'Practitioner Demo'}
              </Button>
              <Button 
                variant="outline" 
                size="sm" 
                onClick={async () => {
                  setLoadingButton('child')
                  try {
                    // Navigate directly to check-in for testing wellbeing tools
                    navigate('/checkin')
                  } finally {
                    setLoadingButton(null)
                  }
                }}
                disabled={loadingButton === 'child'}
                className="text-xs"
              >
                {loadingButton === 'child' ? 'Logging in...' : 'Child Demo'}
              </Button>
            </div>
          </div>

          {error && (
            <div className="mt-4">
              <Alert className="border-red-200 bg-red-50">
                <AlertCircle className="h-4 w-4 text-red-600" />
                <AlertDescription className="text-red-800">{error}</AlertDescription>
              </Alert>
            </div>
          )}

          <div className="mt-8 text-center">
            <button
              onClick={() => navigate('/')}
              className="text-sm text-gray-600 hover:text-gray-800 underline"
            >
              ← Back to Home
            </button>
          </div>
        </div>
      </div>
    )
  }

  if (userType === 'adult') {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
        <div className="w-full max-w-md">
          <Card>
            <CardHeader className="pb-4">
              <div className="flex items-center gap-2 mb-2">
                <Button 
                  variant="ghost" 
                  size="sm" 
                  onClick={() => setUserType(null)}
                  className="p-1 h-8 w-8"
                >
                  <ArrowLeft className="h-4 w-4" />
                </Button>
                <div className="flex-1" />
              </div>
              <CardTitle className="flex items-center gap-2 text-center justify-center">
                <Building className="h-5 w-5 text-gray-600" />
                Staff Sign In
              </CardTitle>
              <CardDescription className="text-center">
                Sign in with your email and password
              </CardDescription>
            </CardHeader>

            <CardContent>
              <form id="adult-login-form" onSubmit={handleAdultLogin} className="space-y-4">
                {error && (
                  <Alert className="border-red-200 bg-red-50">
                    <AlertCircle className="h-4 w-4 text-red-600" />
                    <AlertDescription className="text-red-800">{error}</AlertDescription>
                  </Alert>
                )}

                <div className="space-y-2">
                  <Label htmlFor="email">Email Address</Label>
                  <Input
                    id="email"
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="Enter your email address"
                    required
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="password">Password</Label>
                  <Input
                    id="password"
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="Enter your password"
                    required
                  />
                </div>

                <Button 
                  type="submit" 
                  className="w-full" 
                  disabled={loading || !email || !password}
                >
                  {loading ? 'Signing In...' : 'Sign In'}
                  <ArrowRight className="h-4 w-4 ml-2" />
                </Button>
              </form>

              <Separator className="my-6" />
              <div className="space-y-3">
                <p className="text-sm text-gray-600 text-center">Or continue with:</p>
                <div className="grid grid-cols-2 gap-3">
                  <Button 
                    variant="outline" 
                    className="w-full" 
                    onClick={() => handleOAuthLogin('google')}
                  >
                    <svg className="h-4 w-4 mr-2" viewBox="0 0 24 24">
                      <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                      <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                      <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                      <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
                    </svg>
                    Google
                  </Button>
                  <Button 
                    variant="outline" 
                    className="w-full" 
                    onClick={() => handleOAuthLogin('microsoft')}
                  >
                    <svg className="h-4 w-4 mr-2" fill="currentColor" viewBox="0 0 24 24">
                      <path d="M0 0h11v11H0zm13 0h11v11H13zM0 13h11v11H0zm13 0h11v11H13z"/>
                    </svg>
                    Microsoft
                  </Button>
                </div>
              </div>

            </CardContent>
          </Card>
        </div>
      </div>
    )
  }

  if (userType === 'child') {
    const pinString = pin.join('')
    
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
        <div className="w-full max-w-md">
          <Card>
            <CardHeader className="pb-4">
              <div className="flex items-center gap-2 mb-2">
                <Button 
                  variant="ghost" 
                  size="sm" 
                  onClick={() => setUserType(null)}
                  className="p-1 h-8 w-8"
                >
                  <ArrowLeft className="h-4 w-4" />
                </Button>
                <div className="flex-1" />
              </div>
              <CardTitle className="flex items-center gap-2 text-center justify-center">
                <Smile className="h-5 w-5 text-gray-600" />
                Welcome Back!
              </CardTitle>
              <CardDescription className="text-center">
                Enter your username and PIN to continue
              </CardDescription>
            </CardHeader>

            <CardContent>
              <form id="child-login-form" onSubmit={handleChildLogin} className="space-y-6">
                {error && (
                  <Alert className="border-red-200 bg-red-50">
                    <AlertCircle className="h-4 w-4 text-red-600" />
                    <AlertDescription className="text-red-800">{error}</AlertDescription>
                  </Alert>
                )}

                <div className="space-y-2">
                  <Label htmlFor="username">Username</Label>
                  <Input
                    id="username"
                    type="text"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    placeholder="Enter your username"
                    className="text-center"
                    required
                  />
                </div>

                <div className="space-y-3">
                  <Label>PIN</Label>
                  <div className="flex justify-center gap-3">
                    {pin.map((digit, index) => (
                      <input
                        key={index}
                        ref={pinRefs[index]}
                        type="text"
                        inputMode="numeric"
                        maxLength={1}
                        value={digit}
                        onChange={(e) => handlePinChange(index, e.target.value)}
                        onKeyDown={(e) => handlePinKeyDown(index, e)}
                        onFocus={(e) => e.target.select()}
                        className="w-12 h-12 text-center text-lg border-2 border-gray-300 rounded-md bg-white focus:border-gray-500 focus:ring-2 focus:ring-gray-200 focus:outline-none transition-all"
                        placeholder={String(index + 1)}
                      />
                    ))}
                  </div>
                  <p className="text-xs text-gray-500 text-center">
                    Enter your 4-digit PIN
                  </p>
                </div>

                <Button 
                  type="submit" 
                  className="w-full" 
                  disabled={loading || !username || pinString.length !== 4}
                >
                  {loading ? 'Signing In...' : 'Sign In'}
                  <ArrowRight className="h-4 w-4 ml-2" />
                </Button>
              </form>

              <div className="mt-6 text-center border-t pt-6">
                <p className="text-sm text-gray-600 mb-2">
                  Don't have your username or PIN?
                </p>
                <p className="text-xs text-gray-500">
                  Your credentials are provided by your teacher or practitioner.{' '}
                  <button
                    type="button"
                    onClick={() => navigate('/contact')}
                    className="text-gray-700 hover:text-gray-900 underline"
                  >
                    Need help?
                  </button>
                </p>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    )
  }

  return null
}