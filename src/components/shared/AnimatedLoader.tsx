import React from 'react'
import { motion } from 'framer-motion'

interface AnimatedLoaderProps {
  message?: string
  size?: 'small' | 'medium' | 'large'
  variant?: 'dots' | 'spinner' | 'pulse'
  color?: string
}

export function AnimatedLoader({
  message,
  size = 'medium',
  variant = 'dots',
  color = '#157fe3'
}: AnimatedLoaderProps) {
  const sizeClasses = {
    small: 'scale-75',
    medium: 'scale-100',
    large: 'scale-125'
  }

  const renderDots = () => (
    <div className="flex space-x-2">
      {[0, 1, 2, 3].map(i => (
        <motion.div
          key={i}
          className="h-3 w-3 rounded-full"
          style={{ backgroundColor: color }}
          animate={{
            y: [0, -10, 0],
            opacity: [0.3, 1, 0.3]
          }}
          transition={{
            duration: 1.2,
            repeat: Infinity,
            delay: i * 0.15,
            ease: "easeInOut"
          }}
        />
      ))}
    </div>
  )

  const renderSpinner = () => (
    <motion.div
      className="rounded-full border-4"
      style={{
        width: size === 'small' ? 32 : size === 'large' ? 64 : 48,
        height: size === 'small' ? 32 : size === 'large' ? 64 : 48,
        borderColor: `${color}20`,
        borderTopColor: color
      }}
      animate={{ rotate: 360 }}
      transition={{
        duration: 1,
        repeat: Infinity,
        ease: "linear"
      }}
    />
  )

  const renderPulse = () => (
    <div className="relative">
      <motion.div
        className="rounded-full"
        style={{
          width: size === 'small' ? 32 : size === 'large' ? 64 : 48,
          height: size === 'small' ? 32 : size === 'large' ? 64 : 48,
          backgroundColor: color
        }}
        animate={{
          scale: [1, 1.2, 1],
          opacity: [0.7, 0.3, 0.7]
        }}
        transition={{
          duration: 1.5,
          repeat: Infinity,
          ease: "easeInOut"
        }}
      />
      <motion.div
        className="absolute inset-0 rounded-full"
        style={{ backgroundColor: color }}
        animate={{
          scale: [0.8, 1.4, 0.8],
          opacity: [0.5, 0, 0.5]
        }}
        transition={{
          duration: 1.5,
          repeat: Infinity,
          ease: "easeInOut"
        }}
      />
    </div>
  )

  return (
    <div className={`flex flex-col items-center justify-center ${sizeClasses[size]}`}>
      {variant === 'dots' && renderDots()}
      {variant === 'spinner' && renderSpinner()}
      {variant === 'pulse' && renderPulse()}

      {message && (
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="mt-4 text-sm font-medium text-gray-600"
        >
          {message}
        </motion.p>
      )}
    </div>
  )
}

// Preset loaders for common use cases
export function PageAnimatedLoader({ message = "Loading..." }: { message?: string }) {
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-white/80 backdrop-blur-sm">
      <AnimatedLoader variant="spinner" size="large" message={message} />
    </div>
  )
}

export function DataAnimatedLoader({ message = "Fetching data..." }: { message?: string }) {
  return <AnimatedLoader variant="dots" size="medium" message={message} />
}

export function InlineAnimatedLoader() {
  return <AnimatedLoader variant="dots" size="small" />
}