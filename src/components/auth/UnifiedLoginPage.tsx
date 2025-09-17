import React from 'react'
import { useNavigate } from 'react-router-dom'
import { Card, CardContent } from '../ui/card'
import {
  Users,
  Building,
  UserCheck,
  Heart,
  ArrowRight
} from 'lucide-react'

export function UnifiedLoginPage() {
  const navigate = useNavigate()

  const demoBoxes = [
    {
      id: 'checkin',
      title: 'Child Check-in Flow',
      description: 'Experience the wellbeing check-in journey',
      icon: Heart,
      color: '#e87e67',
      path: '/checkin/home'
    },
    {
      id: 'admin',
      title: 'Platform Admin',
      description: 'Manage organizations and practitioners',
      icon: Building,
      color: '#147fe3',
      path: '/admin'
    },
    {
      id: 'practitioner',
      title: 'Practitioner View',
      description: 'View and manage children',
      icon: UserCheck,
      color: '#f7d145',
      path: '/dashboard'
    },
    {
      id: 'groupadmin',
      title: 'Group Admin',
      description: 'Manage practitioners in your organization',
      icon: Users,
      color: '#4ade80',
      path: '/practitioners'
    }
  ]

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="w-full max-w-5xl">
        <div className="text-center mb-10">
          <h1 className="text-4xl font-bold text-gray-900 mb-3">Demo Portal</h1>
          <p className="text-lg text-gray-600">Select a demo experience to explore The Lift platform</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {demoBoxes.map((box) => (
            <Card
              key={box.id}
              className="cursor-pointer hover:shadow-lg transition-all hover:scale-105 border-2 hover:border-gray-300"
              onClick={() => navigate(box.path)}
            >
              <CardContent className="p-8">
                <div className="flex items-start gap-4">
                  <div
                    className="w-16 h-16 rounded-lg flex items-center justify-center flex-shrink-0"
                    style={{ backgroundColor: `${box.color}20` }}
                  >
                    <box.icon className="h-8 w-8" style={{ color: box.color }} />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-semibold text-gray-900 mb-2">{box.title}</h3>
                    <p className="text-gray-600 mb-4">
                      {box.description}
                    </p>
                    <div className="flex items-center gap-2 text-sm font-medium" style={{ color: box.color }}>
                      <span>Launch Demo</span>
                      <ArrowRight className="h-4 w-4" />
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>

        <div className="mt-10 text-center">
          <p className="text-sm text-gray-500 mb-4">
            This is a demo environment. No authentication required.
          </p>
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