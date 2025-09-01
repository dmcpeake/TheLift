import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'

export function AddChild() {
  const [formData, setFormData] = useState({
    first_name: '',
    date_of_birth: '',
    year_group: '',
    class_name: '',
    parent_guardian_name: '',
    parent_guardian_email: '',
    parent_guardian_phone: '',
    consent_given: false,
    consent_type: 'written',
    username: '',
    pin: ''
  })
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState('')
  const navigate = useNavigate()

  const generateCredentials = () => {
    const username = `${formData.first_name.toLowerCase()}${Math.floor(Math.random() * 1000)}`
    const pin = Math.floor(1000 + Math.random() * 9000).toString()
    setFormData(prev => ({ ...prev, username, pin }))
  }

  React.useEffect(() => {
    if (formData.first_name && (!formData.username || !formData.pin)) {
      generateCredentials()
    }
  }, [formData.first_name])

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError('')
    
    if (!formData.consent_given) {
      setError('Consent must be given before adding a child.')
      setIsLoading(false)
      return
    }
    
    try {
      // This would typically make an API call to create the child
      console.log('Creating child:', formData)
      // Simulate success and redirect
      setTimeout(() => {
        navigate('/dashboard')
      }, 1000)
    } catch (error) {
      setError('Failed to add child. Please try again.')
    } finally {
      setIsLoading(false)
    }
  }

  const handleInputChange = (field: string, value: string | boolean) => {
    setFormData(prev => ({
      ...prev,
      [field]: value
    }))
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white shadow">
        <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between">
            <h1 className="text-3xl font-medium text-gray-900">Add New Child</h1>
            <Button variant="outline" onClick={() => navigate('/dashboard')}>
              Back to Dashboard
            </Button>
          </div>
        </div>
      </header>
      
      <main className="max-w-2xl mx-auto py-6 sm:px-6 lg:px-8">
        <form onSubmit={handleSubmit} className="space-y-6">
          <Card>
            <CardHeader>
              <CardTitle>Child Information</CardTitle>
              <CardDescription>
                Basic information about the child
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <label htmlFor="first_name" className="block text-sm font-medium text-gray-700">
                  First Name *
                </label>
                <Input
                  id="first_name"
                  type="text"
                  required
                  value={formData.first_name}
                  onChange={(e) => handleInputChange('first_name', e.target.value)}
                  placeholder="Enter child's first name"
                  className="mt-1"
                />
              </div>
              
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label htmlFor="date_of_birth" className="block text-sm font-medium text-gray-700">
                    Date of Birth
                  </label>
                  <Input
                    id="date_of_birth"
                    type="date"
                    value={formData.date_of_birth}
                    onChange={(e) => handleInputChange('date_of_birth', e.target.value)}
                    className="mt-1"
                  />
                </div>
                
                <div>
                  <label htmlFor="year_group" className="block text-sm font-medium text-gray-700">
                    Year Group
                  </label>
                  <Input
                    id="year_group"
                    type="text"
                    value={formData.year_group}
                    onChange={(e) => handleInputChange('year_group', e.target.value)}
                    placeholder="e.g. Year 3"
                    className="mt-1"
                  />
                </div>
              </div>
              
              <div>
                <label htmlFor="class_name" className="block text-sm font-medium text-gray-700">
                  Class Name
                </label>
                <Input
                  id="class_name"
                  type="text"
                  value={formData.class_name}
                  onChange={(e) => handleInputChange('class_name', e.target.value)}
                  placeholder="e.g. 3B"
                  className="mt-1"
                />
              </div>
            </CardContent>
          </Card>
          
          <Card>
            <CardHeader>
              <CardTitle>Parent/Guardian Details</CardTitle>
              <CardDescription>
                Contact information for the child's parent or guardian
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <label htmlFor="parent_guardian_name" className="block text-sm font-medium text-gray-700">
                  Parent/Guardian Name *
                </label>
                <Input
                  id="parent_guardian_name"
                  type="text"
                  required
                  value={formData.parent_guardian_name}
                  onChange={(e) => handleInputChange('parent_guardian_name', e.target.value)}
                  placeholder="Enter parent/guardian name"
                  className="mt-1"
                />
              </div>
              
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label htmlFor="parent_guardian_email" className="block text-sm font-medium text-gray-700">
                    Email Address
                  </label>
                  <Input
                    id="parent_guardian_email"
                    type="email"
                    value={formData.parent_guardian_email}
                    onChange={(e) => handleInputChange('parent_guardian_email', e.target.value)}
                    placeholder="parent@example.com"
                    className="mt-1"
                  />
                </div>
                
                <div>
                  <label htmlFor="parent_guardian_phone" className="block text-sm font-medium text-gray-700">
                    Phone Number
                  </label>
                  <Input
                    id="parent_guardian_phone"
                    type="tel"
                    value={formData.parent_guardian_phone}
                    onChange={(e) => handleInputChange('parent_guardian_phone', e.target.value)}
                    placeholder="07xxx xxx xxx"
                    className="mt-1"
                  />
                </div>
              </div>
            </CardContent>
          </Card>
          
          <Card>
            <CardHeader>
              <CardTitle>Consent & Account Setup</CardTitle>
              <CardDescription>
                Consent information and login credentials
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <label className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    checked={formData.consent_given}
                    onChange={(e) => handleInputChange('consent_given', e.target.checked)}
                    className="rounded border-gray-300 text-gray-600 shadow-sm focus:border-gray-300 focus:ring focus:ring-gray-200 focus:ring-opacity-50"
                  />
                  <span className="text-sm font-medium text-gray-700">
                    Consent has been obtained from parent/guardian *
                  </span>
                </label>
              </div>
              
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label htmlFor="username" className="block text-sm font-medium text-gray-700">
                    Username
                  </label>
                  <div className="flex mt-1">
                    <Input
                      id="username"
                      type="text"
                      value={formData.username}
                      onChange={(e) => handleInputChange('username', e.target.value)}
                      className="flex-1"
                    />
                    <Button
                      type="button"
                      variant="outline"
                      onClick={generateCredentials}
                      className="ml-2"
                    >
                      Generate
                    </Button>
                  </div>
                </div>
                
                <div>
                  <label htmlFor="pin" className="block text-sm font-medium text-gray-700">
                    PIN
                  </label>
                  <Input
                    id="pin"
                    type="text"
                    value={formData.pin}
                    onChange={(e) => handleInputChange('pin', e.target.value)}
                    maxLength={4}
                    className="mt-1"
                  />
                </div>
              </div>
            </CardContent>
          </Card>
          
          {error && (
            <div className="text-red-600 text-sm bg-red-50 p-3 rounded-md">
              {error}
            </div>
          )}
          
          <div className="flex justify-end space-x-4">
            <Button
              type="button"
              variant="outline"
              onClick={() => navigate('/dashboard')}
            >
              Cancel
            </Button>
            <Button
              type="submit"
              disabled={isLoading}
            >
              {isLoading ? 'Adding Child...' : 'Add Child'}
            </Button>
          </div>
        </form>
      </main>
    </div>
  )
}