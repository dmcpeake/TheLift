import React from 'react'

interface YellowSwooshProps {
  /** Z-index for the swoosh */
  zIndex?: number
  /** Children to render inside the swoosh */
  children?: React.ReactNode
}

export function YellowSwoosh({ zIndex = 999, children }: YellowSwooshProps) {
  return (
    <div style={{
      position: 'fixed',
      bottom: 0,
      left: 0,
      right: 0,
      height: '120px',
      backgroundColor: '#f7d145',
      zIndex
    }}>
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