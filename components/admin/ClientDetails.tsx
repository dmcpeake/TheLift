import React from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'

export function ClientDetails() {
  const { id } = useParams()
  const navigate = useNavigate()

  // Mock data - in real app this would be fetched from API
  const client = {
    id: id,
    name: 'Example Primary School',
    type: 'school-primary',
    email: 'admin@exampleschool.edu',
    status: 'active',
    subscription_plan: 'professional',
    max_children: 100,
    max_practitioners: 10,
    current_children: 45,
    current_practitioners: 6
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white shadow">
        <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between">
            <h1 className="text-3xl font-medium text-gray-900">{client.name}</h1>
            <Button variant="outline" onClick={() => navigate('/admin')}>
              Back to Dashboard
            </Button>
          </div>
        </div>
      </header>
      
      <main className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <div className="lg:col-span-2">
            <Card className="mb-6">
              <CardHeader>
                <CardTitle>Organisation Information</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <label className="text-sm font-medium text-gray-700">Name</label>
                  <p className="text-sm text-gray-900">{client.name}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Type</label>
                  <p className="text-sm text-gray-900">{client.type}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Contact Email</label>
                  <p className="text-sm text-gray-900">{client.email}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Status</label>
                  <span className="inline-flex px-2 py-1 text-xs font-medium bg-gray-100 text-gray-800 rounded-full">
                    {client.status}
                  </span>
                </div>
              </CardContent>
            </Card>
            
            <Card>
              <CardHeader>
                <CardTitle>Users</CardTitle>
                <CardDescription>
                  All users associated with this organisation
                </CardDescription>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-gray-600">No users found.</p>
              </CardContent>
            </Card>
          </div>
          
          <div>
            <Card className="mb-6">
              <CardHeader>
                <CardTitle>Subscription</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <label className="text-sm font-medium text-gray-700">Plan</label>
                  <p className="text-sm text-gray-900 capitalize">{client.subscription_plan}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Children</label>
                  <p className="text-sm text-gray-900">{client.current_children} / {client.max_children}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Practitioners</label>
                  <p className="text-sm text-gray-900">{client.current_practitioners} / {client.max_practitioners}</p>
                </div>
              </CardContent>
            </Card>
            
            <Card>
              <CardHeader>
                <CardTitle>Actions</CardTitle>
              </CardHeader>
              <CardContent className="space-y-2">
                <Button className="w-full" variant="outline">
                  Edit Details
                </Button>
                <Button className="w-full" variant="outline">
                  Manage Subscription
                </Button>
                <Button className="w-full" variant="destructive">
                  Suspend Client
                </Button>
              </CardContent>
            </Card>
          </div>
        </div>
      </main>
    </div>
  )
}