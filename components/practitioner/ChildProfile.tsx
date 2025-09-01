import React from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'

export function ChildProfile() {
  const { id } = useParams()
  const navigate = useNavigate()

  // Mock data - in real app this would be fetched from API
  const child = {
    id: id,
    first_name: 'Alice',
    age: 7,
    year_group: 'Year 3',
    class_name: '3B',
    username: 'alice123',
    total_sessions: 12,
    current_mood_trend: 'positive',
    stickers_earned: 24,
    garden_items: 15
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white shadow">
        <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-medium text-gray-900">{child.first_name}</h1>
              <p className="text-sm text-gray-600 mt-1">{child.year_group} • {child.class_name}</p>
            </div>
            <Button variant="outline" onClick={() => navigate('/dashboard')}>
              Back to Dashboard
            </Button>
          </div>
        </div>
      </header>
      
      <main className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <div className="lg:col-span-2">
            <div className="grid grid-cols-2 gap-6 mb-6">
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Total Sessions</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-medium">{child.total_sessions}</div>
                  <p className="text-xs text-muted-foreground">Completed</p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Mood Trend</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-medium">{child.current_mood_trend}</div>
                  <p className="text-xs text-muted-foreground">Overall direction</p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Stickers Earned</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-medium">{child.stickers_earned}</div>
                  <p className="text-xs text-muted-foreground">Achievements</p>
                </CardContent>
              </Card>
              
              <Card>
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">Garden Items</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-medium">{child.garden_items}</div>
                  <p className="text-xs text-muted-foreground">Unlocked</p>
                </CardContent>
              </Card>
            </div>
            
            <Card>
              <CardHeader>
                <CardTitle>Wellbeing Timeline</CardTitle>
                <CardDescription>
                  Recent wellbeing check-ins and activities
                </CardDescription>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-gray-600">No sessions completed yet.</p>
              </CardContent>
            </Card>
          </div>
          
          <div>
            <Card className="mb-6">
              <CardHeader>
                <CardTitle>Child Details</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <label className="text-sm font-medium text-gray-700">First Name</label>
                  <p className="text-sm text-gray-900">{child.first_name}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Age</label>
                  <p className="text-sm text-gray-900">{child.age} years</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Year Group</label>
                  <p className="text-sm text-gray-900">{child.year_group}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Class</label>
                  <p className="text-sm text-gray-900">{child.class_name}</p>
                </div>
                <div>
                  <label className="text-sm font-medium text-gray-700">Username</label>
                  <p className="text-sm text-gray-900">{child.username}</p>
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
                  Add Note
                </Button>
                <Button className="w-full" variant="outline">
                  Generate Report
                </Button>
                <Button className="w-full" variant="destructive">
                  Archive Child
                </Button>
              </CardContent>
            </Card>
          </div>
        </div>
      </main>
    </div>
  )
}