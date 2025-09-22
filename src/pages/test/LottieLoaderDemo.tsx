import React, { useState } from 'react'
import { LottieLoader, PageLoader, DataLoader, InlineLoader, ChildLoader } from '../../components/shared/LottieLoader'

export function LottieLoaderDemo() {
  const [showOverlay, setShowOverlay] = useState(false)
  const [showData, setShowData] = useState(false)

  const handleOverlayDemo = () => {
    setShowOverlay(true)
    setTimeout(() => setShowOverlay(false), 3000)
  }

  const handleDataDemo = () => {
    setShowData(true)
    setTimeout(() => setShowData(false), 3000)
  }

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-6xl mx-auto">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Lottie Loader Components</h1>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Basic Loader */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-lg font-semibold mb-4">Basic Loader</h2>
            <div className="h-40 flex items-center justify-center border-2 border-gray-100 rounded-lg">
              <LottieLoader loading size="medium" message="Loading content..." />
            </div>
          </div>

          {/* Small Inline Loader */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-lg font-semibold mb-4">Inline Loader (Small)</h2>
            <div className="h-40 flex items-center justify-center border-2 border-gray-100 rounded-lg">
              <InlineLoader />
            </div>
          </div>

          {/* Large Loader */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-lg font-semibold mb-4">Large Loader</h2>
            <div className="h-64 flex items-center justify-center border-2 border-gray-100 rounded-lg">
              <LottieLoader loading size="large" message="Processing..." />
            </div>
          </div>

          {/* Child-Friendly Loader */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-lg font-semibold mb-4">Child-Friendly Loader</h2>
            <div className="h-64 flex items-center justify-center border-2 border-gray-100 rounded-lg bg-gradient-to-br from-purple-50 to-pink-50">
              <ChildLoader message="Almost there! 🌟" />
            </div>
          </div>

          {/* Overlay Loader Demo */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-lg font-semibold mb-4">Page Overlay Loader</h2>
            <p className="text-sm text-gray-600 mb-4">
              Click to see a full-page overlay loader with blur effect
            </p>
            <button
              onClick={handleOverlayDemo}
              className="px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors"
            >
              Show Overlay Loader
            </button>
            <PageLoader message="Loading page..." />
          </div>

          {/* Data Loader Demo */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-lg font-semibold mb-4">Data Loader</h2>
            <p className="text-sm text-gray-600 mb-4">
              Click to simulate data fetching
            </p>
            <button
              onClick={handleDataDemo}
              className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors mb-4"
            >
              Fetch Data
            </button>
            {showData && (
              <div className="h-32 flex items-center justify-center border-2 border-gray-100 rounded-lg">
                <DataLoader message="Fetching insights..." />
              </div>
            )}
            {!showData && (
              <div className="h-32 flex items-center justify-center border-2 border-gray-100 rounded-lg">
                <p className="text-gray-500">Data will appear here</p>
              </div>
            )}
          </div>
        </div>

        {/* Usage Examples */}
        <div className="mt-8 bg-white rounded-lg shadow-md p-6">
          <h2 className="text-lg font-semibold mb-4">Usage Examples</h2>
          <pre className="bg-gray-900 text-gray-100 p-4 rounded-lg overflow-x-auto text-sm">
{`// Basic usage
import { LottieLoader } from '@/components/shared/LottieLoader'

<LottieLoader loading={isLoading} message="Loading..." />

// Page overlay
import { PageLoader } from '@/components/shared/LottieLoader'

<PageLoader message="Loading dashboard..." />

// Inline small loader
import { InlineLoader } from '@/components/shared/LottieLoader'

<InlineLoader />

// Custom Lottie animation
<LottieLoader
  loading={true}
  src="your-lottie-url-here"
  size="large"
  overlay
  blur
/>`}
          </pre>
        </div>

        {/* Overlay Demo */}
        {showOverlay && (
          <PageLoader message="Loading amazing content..." />
        )}
      </div>
    </div>
  )
}