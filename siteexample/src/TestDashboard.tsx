import React from 'react'

export function TestDashboard() {
  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <h1 className="text-2xl font-bold mb-4">Test Dashboard</h1>
      <div className="bg-white p-4 rounded-lg shadow">
        <p>This is a test dashboard to verify the app is working.</p>
        <p>If you can see this, React is rendering correctly.</p>
      </div>
    </div>
  )
}