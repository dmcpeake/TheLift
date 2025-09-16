import React from 'react'
import { useNavigate } from 'react-router-dom'

// Force deployment refresh

export function CheckInHome() {
  const navigate = useNavigate()

  return (
    <div className="min-h-screen bg-white flex items-center justify-center p-4">
      <div className="max-w-2xl mx-auto text-center">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">
            Ready for your check in?
          </h1>
          <p className="text-lg text-gray-600 max-w-lg mx-auto">
            Take a few minutes to explore how you're feeling today.
          </p>
        </div>

        {/* Start Button */}
        <div className="flex justify-center">
          <button
            onClick={() => navigate('/checkin/flow/breathing')}
            className="font-semibold text-lg transition-all duration-200"
            style={{
              backgroundColor: '#e87e67',
              color: 'white',
              height: '60px',
              borderRadius: '30px',
              paddingLeft: '30px',
              paddingRight: '30px',
              border: 'none',
              cursor: 'pointer',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)'
            }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#d66e5a'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#e87e67'}
          >
            START
          </button>
        </div>
      </div>
    </div>
  )
}