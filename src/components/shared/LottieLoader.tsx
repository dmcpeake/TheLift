import React from 'react'
import { DotLottieReact } from '@lottiefiles/dotlottie-react'
import { motion, AnimatePresence } from 'framer-motion'

interface LottieLoaderProps {
  /** Whether the loader is visible */
  loading?: boolean
  /** Optional message to display below the animation */
  message?: string
  /** Size of the loader container (default: 'medium') */
  size?: 'small' | 'medium' | 'large' | 'full'
  /** Whether to show as an overlay (default: false) */
  overlay?: boolean
  /** Whether to blur the background when overlay is true (default: true) */
  blur?: boolean
  /** Custom Lottie animation URL (optional) */
  src?: string
}

const sizeClasses = {
  small: 'w-24 h-24',
  medium: 'w-32 h-32',
  large: 'w-48 h-48',
  full: 'w-64 h-64'
}

export function LottieLoader({
  loading = true,
  message,
  size = 'medium',
  overlay = false,
  blur = true,
  src = "https://lottie.host/92361d67-00fd-4bcd-9a14-fdf621a5899d/QhGkVt5v81.lottie"
}: LottieLoaderProps) {
  const content = (
    <div className="flex flex-col items-center justify-center">
      <div className={sizeClasses[size]}>
        <DotLottieReact
          src={src}
          loop
          autoplay
        />
      </div>
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

  if (overlay) {
    return (
      <AnimatePresence>
        {loading && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.3 }}
            className={`fixed inset-0 z-50 flex items-center justify-center ${
              blur ? 'backdrop-blur-sm' : ''
            } bg-white/80`}
          >
            {content}
          </motion.div>
        )}
      </AnimatePresence>
    )
  }

  return (
    <AnimatePresence>
      {loading && (
        <motion.div
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
          exit={{ opacity: 0, scale: 0.9 }}
          transition={{ duration: 0.3 }}
          className="flex items-center justify-center p-4"
        >
          {content}
        </motion.div>
      )}
    </AnimatePresence>
  )
}

// Preset loaders for different use cases
export function PageLoader({ message = "Loading..." }: { message?: string }) {
  return <LottieLoader loading overlay size="large" message={message} />
}

export function DataLoader({ message = "Fetching data..." }: { message?: string }) {
  return <LottieLoader loading size="medium" message={message} />
}

export function InlineLoader() {
  return <LottieLoader loading size="small" />
}

// Child-friendly loader with playful animation
export function ChildLoader({ message = "Getting ready..." }: { message?: string }) {
  return (
    <LottieLoader
      loading
      size="large"
      message={message}
      // You can swap this with a more playful animation URL from LottieFiles
      src="https://lottie.host/92361d67-00fd-4bcd-9a14-fdf621a5899d/QhGkVt5v81.lottie"
    />
  )
}