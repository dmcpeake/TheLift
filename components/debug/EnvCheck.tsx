import React from 'react'

export function EnvCheck() {
  const supabaseUrl = process.env.REACT_APP_SUPABASE_URL
  const supabaseKey = process.env.REACT_APP_SUPABASE_ANON_KEY
  const projectId = process.env.REACT_APP_SUPABASE_PROJECT_ID

  return (
    <div className="p-4 bg-gray-100 rounded">
      <h3 className="font-bold mb-2">Environment Variables Check</h3>
      <div className="space-y-1 text-sm">
        <p><strong>URL:</strong> {supabaseUrl || 'NOT SET'}</p>
        <p><strong>Key:</strong> {supabaseKey ? `${supabaseKey.substring(0, 20)}...` : 'NOT SET'}</p>
        <p><strong>Project:</strong> {projectId || 'NOT SET'}</p>
        <p><strong>NODE_ENV:</strong> {process.env.NODE_ENV}</p>
      </div>
    </div>
  )
}