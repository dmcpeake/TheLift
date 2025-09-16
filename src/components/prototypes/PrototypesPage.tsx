import React from 'react'
import { MoodMeter } from './MoodMeter'
import { EmotionGrid } from './EmotionGrid'
import { WellbeingWheel } from './WellbeingWheel'
import { BreathingTool } from './BreathingTool'
import { DebugViewer } from './DebugViewer'

export function PrototypesPage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50">
      {/* Header */}
      <div className="bg-white shadow-sm border-b">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">🎨 Wellbeing Tools Prototypes</h1>
              <p className="text-gray-600 mt-1">UI/UX Testing - No Authentication Required</p>
            </div>
            <div className="flex items-center gap-2">
              <span className="px-3 py-1 bg-green-100 text-green-700 rounded-full text-sm font-medium">
                Designer Mode
              </span>
              <span className="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">
                Mock Data Only
              </span>
            </div>
          </div>
        </div>
      </div>

      {/* Instructions Banner */}
      <div className="max-w-7xl mx-auto px-6 py-4">
        <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
          <h2 className="font-semibold text-yellow-900 mb-2">📋 Instructions for Designers:</h2>
          <ul className="text-sm text-yellow-800 space-y-1">
            <li>• Each tool below simulates user interaction and data capture</li>
            <li>• Click through each tool to see the JSON data structure</li>
            <li>• Check the browser console for detailed logs</li>
            <li>• Use the Debug Viewer at the bottom to see all captured data</li>
            <li>• No database connections - everything is local state only</li>
          </ul>
        </div>

        {/* Data Hierarchy Link */}
        <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mt-4">
          <a
            href="/test/data-hierarchy"
            className="text-blue-700 hover:text-blue-900 underline font-semibold text-lg"
          >
            📊 View Supabase Data Hierarchy →
          </a>
          <p className="text-blue-600 text-sm mt-1">
            View actual database data organized by Organization → Practitioner → Child → Check-ins
          </p>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-6 py-8">
        <div className="space-y-8">
          
          {/* Sequential Check-in Flow */}
          <div className="animate-fadeIn">
            <div className="bg-gradient-to-r from-blue-500 to-purple-600 rounded-lg p-8 text-white mb-8">
              <h2 className="text-3xl font-bold mb-4">🌟 Full Check-in Experience</h2>
              <p className="text-blue-100 mb-6 text-lg">
                Experience the complete wellbeing journey: Breathing → Mood → Emotions → Wellbeing Wheel
              </p>
              <div className="flex items-center gap-4">
                <a
                  href="/checkin/home"
                  className="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-blue-50 transition-colors inline-block"
                >
                  Start Full Check-in Flow →
                </a>
                <span className="text-blue-200 text-sm">~ 5-10 minutes</span>
              </div>
            </div>
          </div>
          {/* Tool 1: Mood Meter */}
          <div className="animate-fadeIn">
            <MoodMeter />
          </div>

          {/* Tool 2: Emotion Grid */}
          <div className="animate-fadeIn" style={{ animationDelay: '100ms' }}>
            <EmotionGrid />
          </div>

          {/* Tool 3: Wellbeing Wheel */}
          <div className="animate-fadeIn" style={{ animationDelay: '200ms' }}>
            <WellbeingWheel />
          </div>

          {/* Tool 4: Breathing Tool */}
          <div className="animate-fadeIn" style={{ animationDelay: '300ms' }}>
            <BreathingTool />
          </div>

          {/* Debug Viewer - Always at bottom */}
          <div className="animate-fadeIn border-t-4 border-gray-300 pt-8 mt-12" style={{ animationDelay: '400ms' }}>
            <DebugViewer />
          </div>
        </div>
      </div>

      {/* Footer */}
      <div className="bg-gray-900 text-white mt-16">
        <div className="max-w-7xl mx-auto px-6 py-8">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div>
              <h3 className="font-semibold mb-2">🔧 Technical Notes</h3>
              <ul className="text-sm text-gray-400 space-y-1">
                <li>• React + TypeScript</li>
                <li>• Tailwind CSS styling</li>
                <li>• Local state management</li>
                <li>• Console logging for debug</li>
              </ul>
            </div>
            <div>
              <h3 className="font-semibold mb-2">📊 Data Flow</h3>
              <ul className="text-sm text-gray-400 space-y-1">
                <li>• User interaction → Local state</li>
                <li>• State change → Console log</li>
                <li>• JSON display → Visual feedback</li>
                <li>• Debug viewer → Data aggregation</li>
              </ul>
            </div>
            <div>
              <h3 className="font-semibold mb-2">🎯 Next Steps</h3>
              <ul className="text-sm text-gray-400 space-y-1">
                <li>• Review data structures</li>
                <li>• Test user flows</li>
                <li>• Validate UI/UX patterns</li>
                <li>• Plan API integration</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <style>{`
        @keyframes fadeIn {
          from {
            opacity: 0;
            transform: translateY(10px);
          }
          to {
            opacity: 1;
            transform: translateY(0);
          }
        }

        .animate-fadeIn {
          animation: fadeIn 0.5s ease-out forwards;
        }
      `}</style>
    </div>
  )
}