import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { AuthContext } from '../../App'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Alert, AlertDescription } from '../ui/alert'
import { Separator } from '../ui/separator'
import { AlertCircle, LogIn, ArrowRight, Lock } from 'lucide-react'

const supabase = getSupabaseClient()

export function LoginPage() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const { setUser } = useContext(AuthContext)
  const navigate = useNavigate()

  const handleLogin = async (e: React.FormEvent) => {
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
          const response = await fetch(`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/auth/profile`, {
            headers: {
              'Authorization': `Bearer ${data.session.access_token}`,
              'Content-Type': 'application/json',
            },
          })

          if (response.ok) {
            const userData = await response.json()
            // Map old LiftStaff role to new Account role for backwards compatibility
            if (userData.profile?.role === 'LiftStaff') {
              userData.profile.role = 'Account'
            }
            setUser(userData)
            
            // Navigate based on role
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
            // Fallback to basic user data if server is unavailable
            // Assign role based on email for test users
            let fallbackRole = data.user.user_metadata?.role || 'Practitioner'
            if (data.user.email === 'admin@thelift.com') {
              fallbackRole = 'Account'
            } else if (data.user.email === 'contact@demoschool.com') {
              fallbackRole = 'GroupContact'
            } else if (data.user.email === 'child@demoschool.com') {
              fallbackRole = 'Child'
            }
            // Map old LiftStaff role to new Account role
            if (fallbackRole === 'LiftStaff') {
              fallbackRole = 'Account'
            }
            
            const fallbackUser = {
              id: data.user.id,
              email: data.user.email!,
              profile: {
                id: data.user.id,
                name: data.user.user_metadata?.name || data.user.email?.split('@')[0] || 'User',
                role: fallbackRole,
                orgId: data.user.user_metadata?.orgId || 'default-org',
                status: 'active'
              }
            }
            setUser(fallbackUser)
            
            // Navigate based on role
            switch (fallbackRole) {
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
          }
        } catch (profileError) {
          console.error('Error fetching profile:', profileError)
          // Use fallback profile
          // Assign role based on email for test users
          let fallbackRole = data.user.user_metadata?.role || 'Practitioner'
          if (data.user.email === 'admin@thelift.com') {
            fallbackRole = 'Account'
          } else if (data.user.email === 'contact@demoschool.com') {
            fallbackRole = 'GroupContact'
          } else if (data.user.email === 'child@demoschool.com') {
            fallbackRole = 'Child'
          }
          // Map old LiftStaff role to new Account role
          if (fallbackRole === 'LiftStaff') {
            fallbackRole = 'Account'
          }
          
          const fallbackUser = {
            id: data.user.id,
            email: data.user.email!,
            profile: {
              id: data.user.id,
              name: data.user.user_metadata?.name || data.user.email?.split('@')[0] || 'User',
              role: fallbackRole,
              orgId: data.user.user_metadata?.orgId || 'default-org',
              status: 'active'
            }
          }
          setUser(fallbackUser)
          
          // Navigate based on role
          switch (fallbackRole) {
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
        }
      }
    } catch (error: any) {
      console.error('Login error:', error)
      setError(error.message || 'Failed to sign in')
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

  const quickLogin = async (testEmail: string) => {
    setEmail(testEmail)
    setPassword('TestLift2024!')
    
    // Auto-submit the form
    setTimeout(() => {
      const form = document.getElementById('login-form') as HTMLFormElement
      if (form) {
        form.requestSubmit()
      }
    }, 100)
  }

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="w-full max-w-md">
        <div className="text-center mb-8">
          <h1 className="text-3xl text-gray-900 mb-2">Sign in to The Lift</h1>
          <p className="text-gray-600">For practitioners and group administrators</p>
        </div>

        <Card>
          <CardHeader className="pb-4">
            <CardTitle className="flex items-center gap-2 text-center justify-center">
              <Lock className="h-5 w-5 text-gray-600" />
              Professional Access
            </CardTitle>
            <CardDescription className="text-center">
              Sign in with your email and password or OAuth provider
            </CardDescription>
          </CardHeader>

          <CardContent>
            <form id="login-form" onSubmit={handleLogin} className="space-y-4">
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

            {/* OAuth Options */}
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
              <p className="text-xs text-gray-500 text-center">
                Contact your administrator to enable OAuth providers
              </p>
            </div>

            <Separator className="my-6" />

            <div className="space-y-3">
              <p className="text-sm text-gray-600 text-center">Quick test logins:</p>
              <div className="grid grid-cols-2 gap-2">
                <Button 
                  variant="outline" 
                  size="sm" 
                  onClick={() => quickLogin('contact@demoschool.com')}
                  className="text-xs"
                >
                  Group Admin
                </Button>
                <Button 
                  variant="outline" 
                  size="sm" 
                  onClick={() => quickLogin('practitioner@demoschool.com')}
                  className="text-xs"
                >
                  Practitioner
                </Button>
              </div>
            </div>

            <div className="mt-6 text-center space-y-3">
              <p className="text-sm text-gray-600">
                Don't have an account?{' '}
                <button
                  type="button"
                  onClick={() => navigate('/signup')}
                  className="text-gray-900 hover:text-gray-700 underline"
                >
                  Sign up here
                </button>
              </p>
              <p className="text-sm text-gray-600">
                Are you a child?{' '}
                <button
                  type="button"
                  onClick={() => navigate('/child/login')}
                  className="text-gray-900 hover:text-gray-700 underline"
                >
                  Sign in here
                </button>
              </p>
            </div>
          </CardContent>
        </Card>

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