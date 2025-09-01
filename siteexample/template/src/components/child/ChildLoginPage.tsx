import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId } from '../../utils/supabase/info'
import { AuthContext } from '../../utils/auth/context'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Alert, AlertDescription } from '../ui/alert'
import { PinInput } from '../shared/PinInput'
import { AlertCircle, ArrowRight, Users, Smile } from 'lucide-react'

const supabase = getSupabaseClient()

export function ChildLoginPage() {
  const [username, setUsername] = useState('')
  const [pin, setPin] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const { setUser } = useContext(AuthContext)
  const navigate = useNavigate()

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')

    try {
      console.log('Attempting child login with:', { username, pin })
      
      // Use child authentication endpoint
      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/auth/child-login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          username,
          pin,
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

  const quickLogin = async () => {
    console.log('Child quick login triggered')
    setUsername('testchild')
    setPin('1234')
    
    // Auto-submit the form
    setTimeout(() => {
      console.log('Submitting child login form from quick login')
      const form = document.getElementById('child-login-form') as HTMLFormElement
      if (form) {
        console.log('Child form found, submitting from quick login')
        form.requestSubmit()
      } else {
        console.log('Child form not found in quick login')
      }
    }, 100)
  }

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="w-full max-w-md">
        <div className="text-center mb-8">
          <div className="flex justify-center mb-4">
            <div className="w-16 h-16 bg-gray-200 rounded-full flex items-center justify-center">
              <Smile className="h-8 w-8 text-gray-600" />
            </div>
          </div>
          <h1 className="text-2xl text-gray-900 mb-2">Welcome to The Lift</h1>
          <p className="text-gray-600">Sign in with your username and PIN</p>
        </div>

        <Card>
          <CardHeader className="pb-4">
            <CardTitle className="flex items-center gap-2 text-center justify-center">
              <Users className="h-5 w-5 text-gray-600" />
              Child Sign In
            </CardTitle>
            <CardDescription className="text-center">
              Enter your username and 4-digit PIN to continue
            </CardDescription>
          </CardHeader>

          <CardContent>
            <form id="child-login-form" onSubmit={handleLogin} className="space-y-6">
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
                <Label htmlFor="pin">PIN</Label>
                <div className="flex justify-center">
                  <PinInput
                    value={pin}
                    onChange={setPin}
                    placeholder="0000"
                    className="justify-center"
                  />
                </div>
                <p className="text-xs text-gray-500 text-center">
                  Enter your 4-digit PIN
                </p>
              </div>

              <Button 
                type="submit" 
                className="w-full" 
                disabled={loading || !username || pin.length !== 4}
              >
                {loading ? 'Signing In...' : 'Sign In'}
                <ArrowRight className="h-4 w-4 ml-2" />
              </Button>
            </form>

            <div className="mt-6 space-y-4">
              <div className="text-center">
                <p className="text-sm text-gray-600 mb-3">Quick test login:</p>
                <Button 
                  variant="outline" 
                  size="sm" 
                  onClick={quickLogin}
                  className="text-xs"
                >
                  Test Child
                </Button>
              </div>

              <div className="text-center border-t pt-4">
                <p className="text-sm text-gray-600 mb-2">
                  Don't have your username or PIN?
                </p>
                <p className="text-xs text-gray-500">
                  Ask your teacher or practitioner for help
                </p>
              </div>
            </div>
          </CardContent>
        </Card>

        <div className="mt-8 text-center space-y-2">
          <button
            onClick={() => navigate('/login')}
            className="text-sm text-gray-600 hover:text-gray-800 underline block"
          >
            Are you a teacher or practitioner? Sign in here
          </button>
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