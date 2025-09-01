import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'

export function CreateClient() {
  const [formData, setFormData] = useState({
    name: '',
    type: 'school-primary',
    email: '',
    subscription_plan: 'essential',
    max_children: 50,
    max_practitioners: 5
  })
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState('')
  const navigate = useNavigate()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError('')
    
    try {
      // This would typically make an API call to create the client
      console.log('Creating client:', formData)
      // Simulate success and redirect
      setTimeout(() => {
        navigate('/admin')
      }, 1000)
    } catch (error) {
      setError('Failed to create client. Please try again.')
    } finally {
      setIsLoading(false)
    }
  }

  const handleInputChange = (field: string, value: string | number) => {
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
            <h1 className="text-3xl font-medium text-gray-900">Create New Client</h1>
            <Button variant="outline" onClick={() => navigate('/admin')}>
              Back to Dashboard
            </Button>
          </div>
        </div>
      </header>
      
      <main className="max-w-2xl mx-auto py-6 sm:px-6 lg:px-8">
        <Card>
          <CardHeader>
            <CardTitle>Organisation Details</CardTitle>
            <CardDescription>
              Enter the details for the new client organisation
            </CardDescription>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-6">
              <div>
                <label htmlFor="name" className="block text-sm font-medium text-gray-700">
                  Organisation Name
                </label>
                <Input
                  id="name"
                  type="text"
                  required
                  value={formData.name}
                  onChange={(e) => handleInputChange('name', e.target.value)}
                  placeholder="Enter organisation name"
                  className="mt-1"
                />
              </div>
              
              <div>
                <label htmlFor="type" className="block text-sm font-medium text-gray-700">
                  Organisation Type
                </label>
                <select
                  id="type"
                  value={formData.type}
                  onChange={(e) => handleInputChange('type', e.target.value)}
                  className="mt-1 block w-full rounded-md border border-gray-300 bg-white py-2 px-3 shadow-sm focus:border-gray-500 focus:outline-none focus:ring-gray-500"
                >
                  <option value="school-primary">Primary School</option>
                  <option value="school-secondary">Secondary School</option>
                  <option value="academy-trust">Academy Trust</option>
                  <option value="clinic-private">Private Clinic</option>
                  <option value="nhs-trust">NHS Trust</option>
                  <option value="hospital">Hospital</option>
                  <option value="charity">Charity</option>
                  <option value="other">Other</option>
                </select>
              </div>
              
              <div>
                <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                  Contact Email
                </label>
                <Input
                  id="email"
                  type="email"
                  required
                  value={formData.email}
                  onChange={(e) => handleInputChange('email', e.target.value)}
                  placeholder="contact@organisation.com"
                  className="mt-1"
                />
              </div>
              
              <div>
                <label htmlFor="subscription_plan" className="block text-sm font-medium text-gray-700">
                  Subscription Plan
                </label>
                <select
                  id="subscription_plan"
                  value={formData.subscription_plan}
                  onChange={(e) => handleInputChange('subscription_plan', e.target.value)}
                  className="mt-1 block w-full rounded-md border border-gray-300 bg-white py-2 px-3 shadow-sm focus:border-gray-500 focus:outline-none focus:ring-gray-500"
                >
                  <option value="essential">Essential</option>
                  <option value="professional">Professional</option>
                  <option value="enterprise">Enterprise</option>
                </select>
              </div>
              
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label htmlFor="max_children" className="block text-sm font-medium text-gray-700">
                    Maximum Children
                  </label>
                  <Input
                    id="max_children"
                    type="number"
                    min="1"
                    required
                    value={formData.max_children}
                    onChange={(e) => handleInputChange('max_children', parseInt(e.target.value))}
                    className="mt-1"
                  />
                </div>
                
                <div>
                  <label htmlFor="max_practitioners" className="block text-sm font-medium text-gray-700">
                    Maximum Practitioners
                  </label>
                  <Input
                    id="max_practitioners"
                    type="number"
                    min="1"
                    required
                    value={formData.max_practitioners}
                    onChange={(e) => handleInputChange('max_practitioners', parseInt(e.target.value))}
                    className="mt-1"
                  />
                </div>
              </div>
              
              {error && (
                <div className="text-red-600 text-sm">{error}</div>
              )}
              
              <div className="flex justify-end space-x-4">
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => navigate('/admin')}
                >
                  Cancel
                </Button>
                <Button
                  type="submit"
                  disabled={isLoading}
                >
                  {isLoading ? 'Creating...' : 'Create Client'}
                </Button>
              </div>
            </form>
          </CardContent>
        </Card>
      </main>
    </div>
  )
}