import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { getSupabaseClient } from '../../utils/supabase/client'
import { AuthContext } from '../../App'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Alert, AlertDescription } from '../ui/alert'
import { Separator } from '../ui/separator'
import { AlertCircle, Shield, ArrowRight } from 'lucide-react'

const supabase = getSupabaseClient()

export function AdminLoginPage() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const navigate = useNavigate()
  const { setUser } = useContext(AuthContext)

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')

    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      })

      if (error) {
        setError(error.message)
      } else if (data.user) {
        console.log('Admin login successful')
        // Redirect will be handled by the AuthContext and ProtectedRoute
        navigate('/admin')
      }
    } catch (err) {
      setError('An unexpected error occurred')
      console.error('Login error:', err)
    } finally {
      setLoading(false)
    }
  }


  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="w-full max-w-md">
        <div className="text-center mb-8">
          <div className="flex items-center justify-center mb-4">
            <Shield className="h-12 w-12 text-gray-900" />
          </div>
          <h1 className="text-3xl font-bold text-gray-900 mb-2">The Lift Admin</h1>
          <p className="text-gray-600">System Administrator Access</p>
        </div>

        <Card>
          <CardHeader className="text-center">
          </CardHeader>
          <CardContent>
            <form onSubmit={handleLogin} className="space-y-4">
              {error && (
                <Alert className="border-red-200 bg-red-50">
                  <AlertCircle className="h-4 w-4 text-red-600" />
                  <AlertDescription className="text-red-800">{error}</AlertDescription>
                </Alert>
              )}

              <div className="space-y-2">
                <Label htmlFor="admin-email">Admin Email</Label>
                <Input
                  id="admin-email"
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder="Enter admin email"
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="admin-password">Password</Label>
                <Input
                  id="admin-password"
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="Enter password"
                  required
                />
              </div>

              <Button type="submit" className="w-full" disabled={loading}>
                {loading ? 'Signing In...' : 'Sign In to Admin Panel'}
                <ArrowRight className="h-4 w-4 ml-2" />
              </Button>
            </form>

            <Separator className="my-6" />

            <div className="space-y-3">
              <p className="text-sm text-gray-600 text-center">Development access:</p>
              <Button 
                variant="outline" 
                size="sm" 
                onClick={() => {
                  // Skip login, go directly to Lift Admin dashboard
                  setUser({ 
                    id: 'test-lift-admin-id', 
                    email: 'admin@thelift.com',
                    profile: { role: 'Account', name: 'Test Lift Admin' }
                  })
                  navigate('/admin')
                }}
                className="w-full text-xs"
                disabled={loading}
              >
                Quick Admin Login
              </Button>
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