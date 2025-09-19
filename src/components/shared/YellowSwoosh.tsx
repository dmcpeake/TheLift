import React, { useEffect, useState } from 'react'

interface YellowSwooshProps {
  /** Minimum bottom spacing when using absolute positioning */
  minBottomOffset?: number
  /** Z-index for the swoosh */
  zIndex?: number
  /** Children to render inside the swoosh */
  children?: React.ReactNode
}

export function YellowSwoosh({ minBottomOffset = 20, zIndex = 999, children }: YellowSwooshProps) {
  const [useFixed, setUseFixed] = useState(true)

  useEffect(() => {
    const checkContentHeight = () => {
      const documentHeight = document.documentElement.scrollHeight
      const windowHeight = window.innerHeight

      // Use fixed positioning if content fits in viewport with some buffer
      // Use absolute positioning if content is taller than viewport
      setUseFixed(documentHeight <= windowHeight + 100)
    }

    // Check on mount
    checkContentHeight()

    // Check on resize
    window.addEventListener('resize', checkContentHeight)

    // Check when content changes (using MutationObserver)
    const observer = new MutationObserver(checkContentHeight)
    observer.observe(document.body, {
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ['style', 'class']
    })

    return () => {
      window.removeEventListener('resize', checkContentHeight)
      observer.disconnect()
    }
  }, [])

  const swooshStyle = useFixed
    ? {
        position: 'fixed' as const,
        bottom: 0,
        left: 0,
        right: 0,
        height: '100px',
        backgroundColor: '#f7d145',
        zIndex
      }
    : {
        position: 'absolute' as const,
        bottom: `-${minBottomOffset}px`,
        left: 0,
        right: 0,
        height: '100px',
        backgroundColor: '#f7d145',
        zIndex
      }

  return (
    <div style={swooshStyle}>
      {/* Top wave with depth effect */}
      <svg style={{
        position: 'absolute',
        top: '-80px',
        left: 0,
        width: '100%',
        height: '80px'
      }} viewBox="0 0 1440 400" preserveAspectRatio="none">
        {/* Main wave fill */}
        <path d="M0,200 C480,400 960,0 1440,200 L1440,400 L0,400 Z" fill="#f7d145"/>
        {/* Border with varied bottom edge only */}
        <path d="M0,200 C480,400 960,0 1440,200 L1440,400 C1020,-120 400,480 0,360 Z" fill="#fae568" opacity="0.6"/>
      </svg>

      {/* Render children if any */}
      {children}
    </div>
  )
}