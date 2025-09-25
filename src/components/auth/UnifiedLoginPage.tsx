import React from 'react'
import { useNavigate } from 'react-router-dom'
import { Card, CardContent } from '../ui/card'
import {
  Users,
  Building,
  UserCheck,
  Heart,
  X
} from 'lucide-react'

export function UnifiedLoginPage() {
  const navigate = useNavigate()

  const demoBoxes = [
    {
      id: 'checkin',
      title: 'Child check in',
      description: 'Wellbeing data capture',
      icon: Heart,
      color: '#147fe3',
      path: '/checkin/home'
    },
    {
      id: 'practitioner',
      title: 'Practitioner',
      description: 'Manage children and reports',
      icon: UserCheck,
      color: '#147fe3',
      path: '/dashboard'
    },
    {
      id: 'groupadmin',
      title: 'Organisation',
      description: 'Manage practitioners and children',
      icon: Users,
      color: '#147fe3',
      path: '/practitioners'
    },
    {
      id: 'admin',
      title: 'Platform admin',
      description: 'Manage and onboard customers',
      icon: Building,
      color: '#147fe3',
      path: '/admin'
    }
  ]

  return (
    <div className="min-h-screen bg-white relative">
      <style>{`
        @media (max-width: 768px) {
          .login-card {
            width: calc(100vw - 4rem) !important;
            max-width: 400px !important;
            padding: 1rem !important;
            margin: 0 auto 1rem auto !important;
          }
          .mobile-container {
            align-items: flex-start !important;
            justify-content: flex-start !important;
            padding: 80px 20px 20px 20px !important;
          }
          .cards-container {
            width: 100% !important;
          }
          .login-card-title {
            font-size: 1.125rem !important;
          }
          .login-card-desc {
            font-size: 0.875rem !important;
          }
          .login-icon-container {
            width: 3rem !important;
            height: 3rem !important;
          }
          .login-icon {
            width: 1.5rem !important;
            height: 1.5rem !important;
          }
        }
      `}</style>
      {/* Close Button - Fixed positioning */}
      <button
        onClick={() => navigate('/')}
        className="fixed w-12 h-12 rounded-full flex items-center justify-center hover:bg-[#1066c2] transition-colors z-50 shadow-lg"
        style={{
          backgroundColor: '#147fe3',
          top: '20px',
          right: '20px'
        }}
      >
        <X className="h-6 w-6 text-white" />
      </button>

      <div className="mobile-container min-h-screen flex items-center justify-center p-4">
        <div className="cards-container flex flex-col items-center space-y-4">
          {demoBoxes.map((box) => (
            <button
              key={box.id}
              onClick={() => navigate(box.path)}
              className="login-card"
              style={{
                padding: '1.5rem',
                borderRadius: '8px',
                border: '2px solid transparent',
                background: 'white',
                cursor: 'pointer',
                textAlign: 'left',
                transition: 'all 0.2s ease',
                boxShadow: '0 4px 20px rgba(0,0,0,0.1)',
                width: '600px'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.transform = 'scale(1.02)'
                e.currentTarget.style.boxShadow = '0 8px 30px rgba(0,0,0,0.15)'
                e.currentTarget.style.border = '2px solid #3b82f6'
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.transform = 'scale(1)'
                e.currentTarget.style.boxShadow = '0 4px 20px rgba(0,0,0,0.1)'
                e.currentTarget.style.border = '2px solid transparent'
              }}
            >
              <div className="flex items-center gap-4">
                <div
                  className="login-icon-container w-16 h-16 flex items-center justify-center flex-shrink-0"
                  style={{
                    backgroundColor: `${box.color}20`,
                    borderRadius: '8px'
                  }}
                >
                  <box.icon className="login-icon h-8 w-8" style={{ color: box.color }} />
                </div>
                <div className="flex-1">
                  <h3 className="login-card-title text-xl font-semibold mb-2 text-gray-900">{box.title}</h3>
                  <p className="login-card-desc text-gray-600">
                    {box.description}
                  </p>
                </div>
              </div>
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}