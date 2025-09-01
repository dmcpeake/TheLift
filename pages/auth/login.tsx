import React, { useState } from 'react'
import Head from 'next/head'

const supabaseUrl = 'https://jxdkwfhsicynyvhkutjm.supabase.co'
const publicAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4ZGt3ZmhzaWN5bnl2aGt1dGptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUxNzc0NDYsImV4cCI6MjA0MDc1MzQ0Nn0.dprP2hhT-gKqg3hxrKmFM0aOgQQtZBhGb9wKoHJPZYU'

export default function LoginPage() {
  const [activeTab, setActiveTab] = useState('child')
  const [childUsername, setChildUsername] = useState('')
  const [childPin, setChildPin] = useState('')
  const [adultEmail, setAdultEmail] = useState('')
  const [adultPassword, setAdultPassword] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState('')

  const handleChildLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError('')
    
    try {
      const response = await fetch(`${supabaseUrl}/functions/v1/server/auth/child-login`, {
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
        window.location.href = '/child/home'
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
      const response = await fetch(`${supabaseUrl}/auth/v1/token?grant_type=password`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'apikey': publicAnonKey
        },
        body: JSON.stringify({
          email: adultEmail,
          password: adultPassword
        })
      })
      
      const result = await response.json()
      
      if (result.access_token) {
        localStorage.setItem('supabase.auth.token', JSON.stringify(result))
        window.location.href = '/dashboard'
      } else {
        setError('Invalid email or password')
      }
    } catch (error) {
      setError('Login failed. Please try again.')
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <>
      <Head>
        <title>Login - The Lift</title>
        <meta name="description" content="Login to The Lift wellbeing platform" />
      </Head>

      <div className="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4">
        <div className="max-w-md w-full space-y-8">
          <div className="text-center">
            <h2 className="text-3xl font-medium text-gray-900">
              Sign in to The Lift
            </h2>
            <p className="mt-2 text-sm text-gray-600">
              Choose your sign-in method below
            </p>
          </div>
          
          <div className="bg-white rounded-lg shadow p-6">
            <div className="flex border-b border-gray-200 mb-6">
              <button
                onClick={() => setActiveTab('child')}
                className={`flex-1 py-2 px-4 text-center font-medium ${
                  activeTab === 'child' 
                    ? 'text-gray-900 border-b-2 border-gray-900' 
                    : 'text-gray-500 hover:text-gray-700'
                }`}
              >
                Child
              </button>
              <button
                onClick={() => setActiveTab('adult')}
                className={`flex-1 py-2 px-4 text-center font-medium ${
                  activeTab === 'adult' 
                    ? 'text-gray-900 border-b-2 border-gray-900' 
                    : 'text-gray-500 hover:text-gray-700'
                }`}
              >
                Adult
              </button>
            </div>
            
            {activeTab === 'child' && (
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Child Sign In</h3>
                <p className="text-sm text-gray-600 mb-4">
                  Enter your username and PIN to access your activities
                </p>
                
                <form onSubmit={handleChildLogin} className="space-y-4">
                  <div>
                    <label htmlFor="username" className="block text-sm font-medium text-gray-700">
                      Username
                    </label>
                    <input
                      id="username"
                      type="text"
                      required
                      value={childUsername}
                      onChange={(e) => setChildUsername(e.target.value)}
                      placeholder="Enter your username"
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-gray-500 focus:border-gray-500"
                    />
                  </div>
                  
                  <div>
                    <label htmlFor="pin" className="block text-sm font-medium text-gray-700">
                      PIN
                    </label>
                    <input
                      id="pin"
                      type="password"
                      required
                      maxLength={4}
                      value={childPin}
                      onChange={(e) => setChildPin(e.target.value)}
                      placeholder="Enter your PIN"
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-gray-500 focus:border-gray-500"
                    />
                  </div>
                  
                  {error && (
                    <div className="text-red-600 text-sm">{error}</div>
                  )}
                  
                  <button
                    type="submit"
                    disabled={isLoading}
                    className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500 disabled:opacity-50"
                  >
                    {isLoading ? 'Signing in...' : 'Sign In'}
                  </button>
                </form>
              </div>
            )}
            
            {activeTab === 'adult' && (
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Adult Sign In</h3>
                <p className="text-sm text-gray-600 mb-4">
                  Sign in with your email and password
                </p>
                
                <form onSubmit={handleAdultLogin} className="space-y-4">
                  <div>
                    <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                      Email
                    </label>
                    <input
                      id="email"
                      type="email"
                      required
                      value={adultEmail}
                      onChange={(e) => setAdultEmail(e.target.value)}
                      placeholder="practitioner@thelift.app"
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-gray-500 focus:border-gray-500"
                    />
                  </div>
                  
                  <div>
                    <label htmlFor="password" className="block text-sm font-medium text-gray-700">
                      Password
                    </label>
                    <input
                      id="password"
                      type="password"
                      required
                      value={adultPassword}
                      onChange={(e) => setAdultPassword(e.target.value)}
                      placeholder="Enter your password"
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-gray-500 focus:border-gray-500"
                    />
                  </div>
                  
                  {error && (
                    <div className="text-red-600 text-sm">{error}</div>
                  )}
                  
                  <button
                    type="submit"
                    disabled={isLoading}
                    className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500 disabled:opacity-50"
                  >
                    {isLoading ? 'Signing in...' : 'Sign In'}
                  </button>
                </form>
              </div>
            )}
          </div>
          
          <div className="text-center">
            <p className="text-sm text-gray-600">
              Don't have an account?{' '}
              <span className="text-gray-800">Contact your administrator</span>
            </p>
          </div>
        </div>
      </div>
    </>
  )
}