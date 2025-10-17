import React, { useEffect, useState } from 'react'

interface PointsToastProps {
  points: number
  show: boolean
  onComplete: () => void
}

export function PointsToast({ points, show, onComplete }: PointsToastProps) {
  const [isVisible, setIsVisible] = useState(false)
  const [isFadingOut, setIsFadingOut] = useState(false)

  useEffect(() => {
    if (show) {
      setIsVisible(true)
      setIsFadingOut(false)

      // Start fade out after 1.7 seconds (before the full 2 seconds)
      const fadeOutTimer = setTimeout(() => {
        setIsFadingOut(true)
      }, 1700)

      // Remove toast after 2 seconds
      const removeTimer = setTimeout(() => {
        setIsVisible(false)
        onComplete()
      }, 2000)

      return () => {
        clearTimeout(fadeOutTimer)
        clearTimeout(removeTimer)
      }
    }
  }, [show, onComplete])

  if (!isVisible) return null

  return (
    <>
      <style>{`
        @keyframes pointsToastFadeIn {
          0% {
            opacity: 0;
            transform: translate(-50%, 20px);
          }
          100% {
            opacity: 1;
            transform: translate(-50%, 0);
          }
        }

        @keyframes pointsToastFadeOut {
          0% {
            opacity: 1;
            transform: translate(-50%, 0);
          }
          100% {
            opacity: 0;
            transform: translate(-50%, -20px);
          }
        }

        .points-toast {
          animation: pointsToastFadeIn 0.3s ease-out forwards;
        }

        .points-toast.fading-out {
          animation: pointsToastFadeOut 0.3s ease-in forwards;
        }
      `}</style>
      <div
        className={`points-toast ${isFadingOut ? 'fading-out' : ''}`}
        style={{
          position: 'fixed',
          top: '10px',
          left: '50%',
          transform: 'translateX(-50%)',
          zIndex: 10000,
          backgroundColor: 'rgba(255, 255, 255, 0.95)',
          backdropFilter: 'blur(16px)',
          WebkitBackdropFilter: 'blur(16px)',
          border: '2px solid #10B981',
          borderRadius: '4px',
          padding: '12px 24px',
          height: '60px',
          maxHeight: '60px',
          boxShadow: '0 8px 32px rgba(16, 185, 129, 0.3)',
          pointerEvents: 'none',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}
      >
        <div
          style={{
            fontSize: '16px',
            fontWeight: 700,
            color: '#10B981',
            textAlign: 'center',
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            lineHeight: '1'
          }}
        >
          <span style={{ fontSize: '18px' }}>🎉</span>
          <span>+{points} points!</span>
        </div>
      </div>
    </>
  )
}
