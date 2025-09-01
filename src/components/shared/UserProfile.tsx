import React, { useState, useContext } from 'react'
import { AuthContext } from '../../App'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Alert, AlertDescription } from '../ui/alert'
import { getSupabaseClient } from '../../utils/supabase/client'
import { 
  CheckCircle,
  AlertTriangle,
  Check,
  Circle
} from 'lucide-react'

const supabase = getSupabaseClient()

export function UserProfile() {
  const { user, setUser } = useContext(AuthContext)
  const [loading, setLoading] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error', text: string } | null>(null)
  
  const [formData, setFormData] = useState({
    name: user?.profile?.name || '',
    newPassword: '',
    confirmPassword: ''
  })

  const handleInputChange = (field: string, value: string) => {
    setFormData(prev => ({ ...prev, [field]: value }))
  }

  // Password validation functions
  const passwordValidation = {
    hasMinLength: (password: string) => password.length >= 6,
    hasUppercase: (password: string) => /[A-Z]/.test(password),
    hasNumberOrSpecial: (password: string) => /[\d!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)
  }

  const passwordRequirements = [
    { key: 'hasMinLength', label: 'At least 6 characters', check: passwordValidation.hasMinLength },
    { key: 'hasUppercase', label: 'Contains 1+ uppercase letter', check: passwordValidation.hasUppercase },
    { key: 'hasNumberOrSpecial', label: 'Contains a number or special character', check: passwordValidation.hasNumberOrSpecial }
  ]

  const isPasswordValid = (password: string) => {
    return passwordRequirements.every(req => req.check(password))
  }

  const handleUpdate = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setMessage(null)

    // Validate passwords if provided
    if (formData.newPassword || formData.confirmPassword) {
      if (formData.newPassword !== formData.confirmPassword) {
        setMessage({ type: 'error', text: 'Passwords do not match.' })
        setLoading(false)
        return
      }

      if (formData.newPassword && !isPasswordValid(formData.newPassword)) {
        setMessage({ type: 'error', text: 'Password does not meet all requirements.' })
        setLoading(false)
        return
      }
    }

    try {
      // Update name if changed
      if (formData.name !== user?.profile?.name) {
        const response = await fetch(`https://thelift.supabase.co/functions/v1/server/auth/update-profile`, {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${await supabase.auth.getSession().then(s => s.data.session?.access_token)}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            name: formData.name
          })
        })

        if (!response.ok) {
          throw new Error('Failed to update name')
        }

        // Update user context
        if (user) {
          setUser({
            ...user,
            profile: {
              ...user.profile,
              name: formData.name
            }
          })
        }
      }

      // Update password if provided
      if (formData.newPassword) {
        const { error } = await supabase.auth.updateUser({
          password: formData.newPassword
        })

        if (error) {
          throw error
        }

        // Clear password fields
        setFormData(prev => ({
          ...prev,
          newPassword: '',
          confirmPassword: ''
        }))
      }

      setMessage({ type: 'success', text: 'Profile updated successfully!' })
    } catch (error: any) {
      console.error('Error updating profile:', error)
      setMessage({ type: 'error', text: error.message || 'Failed to update profile. Please try again.' })
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-2xl text-gray-900">Profile</h1>
        </div>

        {/* Alert Messages */}
        {message && (
          <Alert className={`mb-6 ${message.type === 'success' ? 'border-green-200 bg-green-50' : 'border-red-200 bg-red-50'}`}>
            {message.type === 'success' ? (
              <CheckCircle className="h-4 w-4 text-green-600" />
            ) : (
              <AlertTriangle className="h-4 w-4 text-red-600" />
            )}
            <AlertDescription className={message.type === 'success' ? 'text-green-800' : 'text-red-800'}>
              {message.text}
            </AlertDescription>
          </Alert>
        )}

        {/* Update Form */}
        <Card>
          <CardHeader>
            <CardTitle>Update Profile</CardTitle>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleUpdate} className="space-y-4">
              <div>
                <Label htmlFor="name">Name</Label>
                <Input
                  id="name"
                  value={formData.name}
                  onChange={(e) => handleInputChange('name', e.target.value)}
                  placeholder="Enter your name"
                  className="mt-1"
                />
              </div>

              <div>
                <Label htmlFor="newPassword">New Password</Label>
                <Input
                  id="newPassword"
                  type="password"
                  value={formData.newPassword}
                  onChange={(e) => handleInputChange('newPassword', e.target.value)}
                  placeholder="Enter new password (optional)"
                  className="mt-1"
                />
              </div>

              <div>
                <Label htmlFor="confirmPassword">Confirm Password</Label>
                <Input
                  id="confirmPassword"
                  type="password"
                  value={formData.confirmPassword}
                  onChange={(e) => handleInputChange('confirmPassword', e.target.value)}
                  placeholder="Confirm new password"
                  className="mt-1"
                />
              </div>

              {/* Password Requirements */}
              {formData.newPassword && (
                <div className="space-y-2">
                  <p className="text-sm text-gray-600">Password requirements:</p>
                  <div className="space-y-1">
                    {passwordRequirements.map((requirement) => {
                      const isValid = requirement.check(formData.newPassword)
                      return (
                        <div key={requirement.key} className="flex items-center gap-2">
                          {isValid ? (
                            <Check className="h-4 w-4 text-green-600" />
                          ) : (
                            <Circle className="h-4 w-4 text-gray-400" />
                          )}
                          <span className={`text-sm ${isValid ? 'text-green-600' : 'text-gray-500'}`}>
                            {requirement.label}
                          </span>
                        </div>
                      )
                    })}
                  </div>
                  
                  {/* Password Match Indicator */}
                  {formData.confirmPassword && (
                    <div className="flex items-center gap-2 pt-2">
                      {formData.newPassword === formData.confirmPassword ? (
                        <Check className="h-4 w-4 text-green-600" />
                      ) : (
                        <Circle className="h-4 w-4 text-gray-400" />
                      )}
                      <span className={`text-sm ${
                        formData.newPassword === formData.confirmPassword ? 'text-green-600' : 'text-gray-500'
                      }`}>
                        Passwords match
                      </span>
                    </div>
                  )}
                </div>
              )}

              <Button 
                type="submit" 
                disabled={
                  loading || 
                  (formData.newPassword && !isPasswordValid(formData.newPassword)) ||
                  (formData.newPassword && formData.newPassword !== formData.confirmPassword)
                }
                className="w-full"
              >
                {loading ? (
                  <>
                    <div className="animate-spin rounded-full h-4 w-4 border-2 border-white border-t-transparent mr-2"></div>
                    Updating...
                  </>
                ) : (
                  'Update'
                )}
              </Button>
            </form>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}