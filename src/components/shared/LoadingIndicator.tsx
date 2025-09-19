import React, { useEffect, useState } from 'react'

interface LoadingIndicatorProps {
  progress?: number // 0-100
  message?: string
  subMessage?: string
  size?: 'small' | 'medium' | 'large'
  variant?: 'spinner' | 'bar' | 'dots' | 'pulse'
  color?: string
  showPercentage?: boolean
  steps?: { current: number; total: number }
}

export function LoadingIndicator({
  progress,
  message = 'Loading...',
  subMessage,
  size = 'medium',
  variant = 'spinner',
  color = 'blue',
  showPercentage = true,
  steps
}: LoadingIndicatorProps) {
  const [animationFrame, setAnimationFrame] = useState(0)
  const [estimatedProgress, setEstimatedProgress] = useState(0)

  // Auto-increment progress if not provided (simulated progress)
  useEffect(() => {
    if (progress === undefined) {
      const timer = setInterval(() => {
        setEstimatedProgress(prev => {
          if (prev >= 90) return prev // Cap at 90% until real completion
          return prev + Math.random() * 10
        })
      }, 500)
      return () => clearInterval(timer)
    }
  }, [progress])

  // Animation frame for dots
  useEffect(() => {
    if (variant === 'dots') {
      const timer = setInterval(() => {
        setAnimationFrame(prev => (prev + 1) % 4)
      }, 300)
      return () => clearInterval(timer)
    }
  }, [variant])

  const actualProgress = progress ?? estimatedProgress

  const sizeClasses = {
    small: { spinner: 'h-8 w-8', container: 'scale-75' },
    medium: { spinner: 'h-12 w-12', container: 'scale-100' },
    large: { spinner: 'h-16 w-16', container: 'scale-125' }
  }

  const colorClasses = {
    blue: 'border-blue-500 bg-blue-500 text-blue-500',
    green: 'border-green-500 bg-green-500 text-green-500',
    purple: 'border-purple-500 bg-purple-500 text-purple-500',
    red: 'border-red-500 bg-red-500 text-red-500',
    yellow: 'border-yellow-500 bg-yellow-500 text-yellow-500'
  }

  const renderSpinner = () => (
    <div className="relative">
      <svg
        className={`${sizeClasses[size].spinner} animate-spin`}
        viewBox="0 0 100 100"
      >
        {/* Background circle */}
        <circle
          cx="50"
          cy="50"
          r="40"
          stroke="currentColor"
          strokeWidth="8"
          fill="none"
          className="opacity-20"
        />
        {/* Progress circle */}
        <circle
          cx="50"
          cy="50"
          r="40"
          stroke="currentColor"
          strokeWidth="8"
          fill="none"
          strokeDasharray={`${actualProgress * 2.51327} 251.327`}
          strokeLinecap="round"
          className={`${colorClasses[color]} transition-all duration-300`}
          style={{
            transform: 'rotate(-90deg)',
            transformOrigin: '50% 50%'
          }}
        />
      </svg>
      {showPercentage && progress !== undefined && (
        <div className="absolute inset-0 flex items-center justify-center">
          <span className="text-sm font-semibold">{Math.round(actualProgress)}%</span>
        </div>
      )}
    </div>
  )

  const renderProgressBar = () => (
    <div className="w-full max-w-xs">
      <div className="h-3 bg-gray-200 rounded-full overflow-hidden">
        <div
          className={`h-full ${colorClasses[color]} transition-all duration-500 ease-out rounded-full`}
          style={{
            width: `${actualProgress}%`,
            background: `linear-gradient(90deg,
              ${color === 'blue' ? '#3B82F6' : ''} 0%,
              ${color === 'blue' ? '#60A5FA' : ''} 100%)`
          }}
        >
          <div className="h-full bg-white/20 animate-pulse" />
        </div>
      </div>
      {showPercentage && (
        <div className="mt-2 text-center text-sm font-medium text-gray-600">
          {Math.round(actualProgress)}%
        </div>
      )}
    </div>
  )

  const renderDots = () => (
    <div className="flex space-x-2">
      {[0, 1, 2, 3].map(i => (
        <div
          key={i}
          className={`h-3 w-3 rounded-full ${colorClasses[color]} transition-all duration-300`}
          style={{
            opacity: animationFrame === i ? 1 : 0.3,
            transform: animationFrame === i ? 'scale(1.3)' : 'scale(1)'
          }}
        />
      ))}
    </div>
  )

  const renderPulse = () => (
    <div className="relative">
      <div className={`${sizeClasses[size].spinner} rounded-full ${colorClasses[color]} animate-pulse`}>
        <div className="absolute inset-0 rounded-full animate-ping opacity-75"
             style={{ backgroundColor: `${color === 'blue' ? '#3B82F6' : ''}` }} />
      </div>
    </div>
  )

  const renderVariant = () => {
    switch (variant) {
      case 'bar':
        return renderProgressBar()
      case 'dots':
        return renderDots()
      case 'pulse':
        return renderPulse()
      default:
        return renderSpinner()
    }
  }

  return (
    <div className={`flex flex-col items-center justify-center space-y-4 ${sizeClasses[size].container}`}>
      {renderVariant()}

      {message && (
        <div className="text-center">
          <p className="text-gray-700 font-medium">{message}</p>
          {subMessage && (
            <p className="text-gray-500 text-sm mt-1">{subMessage}</p>
          )}
        </div>
      )}

      {steps && (
        <div className="text-sm text-gray-600">
          Step {steps.current} of {steps.total}
        </div>
      )}
    </div>
  )
}

// Enhanced loading component with data loading stages
export function DataLoadingIndicator({
  stages,
  currentStage
}: {
  stages: Array<{ name: string; status: 'pending' | 'loading' | 'complete' | 'error' }>
  currentStage: number
}) {
  const progress = (currentStage / stages.length) * 100

  return (
    <div className="flex flex-col items-center justify-center p-8">
      <LoadingIndicator
        variant="spinner"
        progress={progress}
        message={stages[currentStage]?.name || 'Loading...'}
        showPercentage={true}
        size="large"
      />

      <div className="mt-8 w-full max-w-md">
        {stages.map((stage, index) => (
          <div key={index} className="flex items-center mb-3">
            <div className={`
              w-6 h-6 rounded-full flex items-center justify-center mr-3 transition-all
              ${stage.status === 'complete' ? 'bg-green-500' : ''}
              ${stage.status === 'loading' ? 'bg-blue-500 animate-pulse' : ''}
              ${stage.status === 'error' ? 'bg-red-500' : ''}
              ${stage.status === 'pending' ? 'bg-gray-300' : ''}
            `}>
              {stage.status === 'complete' && (
                <svg className="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              )}
              {stage.status === 'loading' && (
                <div className="w-3 h-3 bg-white rounded-full animate-ping" />
              )}
              {stage.status === 'error' && (
                <svg className="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              )}
            </div>
            <span className={`
              text-sm
              ${stage.status === 'complete' ? 'text-green-600 font-medium' : ''}
              ${stage.status === 'loading' ? 'text-blue-600 font-medium' : ''}
              ${stage.status === 'error' ? 'text-red-600 font-medium' : ''}
              ${stage.status === 'pending' ? 'text-gray-400' : ''}
            `}>
              {stage.name}
            </span>
          </div>
        ))}
      </div>
    </div>
  )
}