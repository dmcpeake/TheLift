import React from 'react'
import { BREATHING_TECHNIQUES } from './techniques'
import { Settings, X } from 'lucide-react'

interface TechniqueSelectorProps {
  selectedId: string
  onSelect: (id: string) => void
  isOpen: boolean
  onToggle: () => void
}

export function TechniqueSelector({ 
  selectedId, 
  onSelect, 
  isOpen, 
  onToggle 
}: TechniqueSelectorProps) {
  const selected = BREATHING_TECHNIQUES.find(t => t.id === selectedId)

  return (
    <>
      {/* Settings Button - Top Right */}
      <button
        onClick={onToggle}
        className="breathing-settings-button"
        style={{
          position: 'fixed',
          right: '24px',
          top: '150px', // 50px under the progress header (10px lower)
          zIndex: 1001,
          width: '56px',
          height: '56px',
          background: 'transparent',
          border: 'none',
          cursor: 'pointer',
          transition: 'all 0.3s ease',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}
        aria-label={isOpen ? 'Close settings' : 'Open settings'}
      >
        {isOpen ? (
          <X style={{ width: '24px', height: '24px', color: '#3a7ddc' }} />
        ) : (
          <Settings style={{ width: '24px', height: '24px', color: '#3a7ddc' }} />
        )}
      </button>

      {/* Cards Dropdown */}
      {isOpen && (
        <div
          className="technique-cards"
          style={{
            position: 'fixed',
            right: '24px',
            top: '220px', // Below the settings button
            zIndex: 1000,
            display: 'flex',
            flexDirection: 'column',
            gap: '12px',
            maxWidth: '320px'
          }}
        >
            {BREATHING_TECHNIQUES.filter(t => t.id !== 'test').map(technique => {
              const isSelected = technique.id === selectedId
              return (
                <button
                  key={technique.id}
                  onClick={() => onSelect(technique.id)}
                  style={{
                    padding: '1rem',
                    borderRadius: '12px',
                    border: `2px solid ${isSelected ? '#3b82f6' : 'transparent'}`,
                    background: isSelected
                      ? 'rgba(255, 255, 255, 0.9)'
                      : 'rgba(255, 255, 255, 0.85)',
                    backdropFilter: 'blur(10px)',
                    cursor: 'pointer',
                    textAlign: 'left',
                    transition: 'all 0.2s ease',
                    width: '280px',
                    boxShadow: '0 4px 20px rgba(0,0,0,0.1)'
                  }}
                  onMouseEnter={e => {
                    if (!isSelected) {
                      e.currentTarget.style.background = 'rgba(255, 255, 255, 0.95)'
                      e.currentTarget.style.transform = 'scale(1.02)'
                    }
                  }}
                  onMouseLeave={e => {
                    if (!isSelected) {
                      e.currentTarget.style.background = 'rgba(255, 255, 255, 0.85)'
                      e.currentTarget.style.transform = 'scale(1)'
                    }
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'flex-start' }}>
                    <div style={{ flex: 1 }}>
                      <h3 style={{
                        fontSize: '1rem',
                        fontWeight: '600',
                        color: '#1f2937',
                        marginBottom: '0.25rem'
                      }}>
                        {technique.name}
                      </h3>
                      <p style={{
                        fontSize: '0.875rem',
                        color: '#6b7280',
                        lineHeight: '1.4',
                        whiteSpace: 'nowrap',
                        overflow: 'hidden',
                        textOverflow: 'ellipsis'
                      }}>
                        {technique.description}
                      </p>
                    </div>
                  </div>
                </button>
              )
            })}
        </div>
      )}
    </>
  )
}