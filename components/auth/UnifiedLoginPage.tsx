import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { getSupabaseClient } from '../../utils/supabase/client'
import { supabaseUrl, publicAnonKey } from '../../utils/supabase/info'
import { AuthContext } from '../../utils/auth/context'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../ui/tabs'

const supabase = getSupabaseClient()

export function UnifiedLoginPage() {
  const [childUsername, setChildUsername] = useState('')
  const [childPin, setChildPin] = useState('')
  const [adultEmail, setAdultEmail] = useState('')
  const [adultPassword, setAdultPassword] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState('')
  const navigate = useNavigate()
  // const authContext = useContext(AuthContext)

  const handleChildLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError('')
    
    try {
      const response = await fetch(`${supabaseUrl}/functions/v1/make-server-a1855b25/auth/child-login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${publicAnonKey}`
        },
        body: JSON.stringify({
          username: childUsername,
          pin: childPin
        })
      })
      
      const result = await response.json()
      
      if (result.success) {
        navigate('/child/onboarding')
      } else {
        setError(result.error || 'Login failed')
      }
    } catch (error) {
      setError('Login failed. Please try again.')
    } finally {
      setIsLoading(false)
    }
  }

  const handleAdultLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError('')
    
    try {
      const { data, error: authError } = await supabase.auth.signInWithPassword({
        email: adultEmail,
        password: adultPassword
      })
      
      if (authError) {
        setError(authError.message)
      } else if (data.user) {
        navigate('/dashboard')
      }
    } catch (error) {
      setError('Login failed. Please try again.')
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div className="text-center">
          <h2 className="mt-6 text-3xl font-medium text-gray-900">
            Sign in to The Lift
          </h2>
          <p className="mt-2 text-sm text-gray-600">
            Choose your sign-in method below
          </p>
        </div>
        
        <Tabs defaultValue="child" className="w-full">
          <TabsList className="grid w-full grid-cols-2">
            <TabsTrigger value="child">Child</TabsTrigger>
            <TabsTrigger value="adult">Adult</TabsTrigger>
          </TabsList>
          
          <TabsContent value="child">
            <Card>
              <CardHeader>
                <CardTitle>Child Sign In</CardTitle>
                <CardDescription>
                  Enter your username and PIN to access your activities
                </CardDescription>
              </CardHeader>
              <CardContent>
                <form onSubmit={handleChildLogin} className="space-y-4">
                  <div>
                    <label htmlFor="username" className="block text-sm font-medium text-gray-700">
                      Username
                    </label>
                    <Input
                      id="username"
                      type="text"
                      required
                      value={childUsername}
                      onChange={(e) => setChildUsername(e.target.value)}
                      placeholder="Enter your username"
                      className="mt-1"
                    />
                  </div>
                  
                  <div>
                    <label htmlFor="pin" className="block text-sm font-medium text-gray-700">
                      PIN
                    </label>
                    <Input
                      id="pin"
                      type="password"
                      required
                      maxLength={4}
                      value={childPin}
                      onChange={(e) => setChildPin(e.target.value)}
                      placeholder="Enter your PIN"
                      className="mt-1"
                    />
                  </div>
                  
                  {error && (
                    <div className="text-red-600 text-sm">{error}</div>
                  )}
                  
                  <Button
                    type="submit"
                    disabled={isLoading}
                    className="w-full"
                  >
                    {isLoading ? 'Signing in...' : 'Sign In'}
                  </Button>
                </form>
              </CardContent>
            </Card>
          </TabsContent>
          
          <TabsContent value="adult">
            <Card>
              <CardHeader>
                <CardTitle>Adult Sign In</CardTitle>
                <CardDescription>
                  Sign in with your email and password
                </CardDescription>
              </CardHeader>
              <CardContent>
                <form onSubmit={handleAdultLogin} className="space-y-4">
                  <div>
                    <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                      Email
                    </label>
                    <Input
                      id="email"
                      type="email"
                      required
                      value={adultEmail}
                      onChange={(e) => setAdultEmail(e.target.value)}
                      placeholder="Enter your email"
                      className="mt-1"
                    />
                  </div>
                  
                  <div>
                    <label htmlFor="password" className="block text-sm font-medium text-gray-700">
                      Password
                    </label>
                    <Input
                      id="password"
                      type="password"
                      required
                      value={adultPassword}
                      onChange={(e) => setAdultPassword(e.target.value)}
                      placeholder="Enter your password"
                      className="mt-1"
                    />
                  </div>
                  
                  {error && (
                    <div className="text-red-600 text-sm">{error}</div>
                  )}
                  
                  <Button
                    type="submit"
                    disabled={isLoading}
                    className="w-full"
                  >
                    {isLoading ? 'Signing in...' : 'Sign In'}
                  </Button>
                </form>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
        
        <div className="text-center">
          <p className="text-sm text-gray-600">
            Don't have an account?{' '}
            <span className="text-gray-800">Contact your administrator</span>
          </p>
        </div>
      </div>
    </div>
  )
}