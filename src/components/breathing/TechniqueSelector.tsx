import React from 'react'
import { BREATHING_TECHNIQUES } from './techniques'
import { ChevronLeft, ChevronRight } from 'lucide-react'

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
      {/* Toggle Button */}
      <button
        onClick={onToggle}
        className="technique-toggle"
        style={{
          position: 'fixed',
          right: isOpen ? '320px' : '0',
          top: '50%',
          transform: 'translateY(-50%)',
          zIndex: 1001,
          padding: '1rem 0.5rem',
          background: 'rgba(255, 255, 255, 0.95)',
          border: 'none',
          borderTopLeftRadius: '1rem',
          borderBottomLeftRadius: '1rem',
          cursor: 'pointer',
          transition: 'right 0.3s ease',
          backdropFilter: 'blur(10px)',
          boxShadow: '-2px 0 10px rgba(0,0,0,0.1)'
        }}
      >
        {isOpen ? (
          <ChevronRight style={{ width: '24px', height: '24px', color: '#6b7280' }} />
        ) : (
          <ChevronLeft style={{ width: '24px', height: '24px', color: '#6b7280' }} />
        )}
      </button>

      {/* Sidebar */}
      <div
        className="technique-sidebar"
        style={{
          position: 'fixed',
          right: isOpen ? '0' : '-320px',
          top: '0',
          bottom: '0',
          width: '320px',
          background: 'rgba(255, 255, 255, 0.98)',
          backdropFilter: 'blur(20px)',
          transition: 'right 0.3s ease',
          zIndex: 1000,
          overflowY: 'auto',
          boxShadow: isOpen ? '-10px 0 30px rgba(0,0,0,0.1)' : 'none'
        }}
      >
        <div style={{ padding: '2rem 1.5rem' }}>
          <h2 style={{ 
            fontSize: '1.5rem', 
            fontWeight: '600',
            color: '#1f2937',
            marginBottom: '0.5rem'
          }}>
            Breathing Techniques
          </h2>
          <p style={{ 
            fontSize: '0.9rem', 
            color: '#6b7280',
            marginBottom: '1.5rem'
          }}>
            Choose a technique that works best for you
          </p>

          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
            {BREATHING_TECHNIQUES.map(technique => {
              const isSelected = technique.id === selectedId
              return (
                <button
                  key={technique.id}
                  onClick={() => onSelect(technique.id)}
                  style={{
                    padding: '1rem',
                    borderRadius: '0.75rem',
                    border: `2px solid ${isSelected ? technique.theme?.primaryColor : 'transparent'}`,
                    background: isSelected 
                      ? `linear-gradient(135deg, ${technique.theme?.primaryColor}20 0%, ${technique.theme?.secondaryColor}20 100%)`
                      : 'rgba(249, 250, 251, 0.8)',
                    cursor: 'pointer',
                    textAlign: 'left',
                    transition: 'all 0.2s ease',
                    transform: isSelected ? 'scale(1.02)' : 'scale(1)',
                    boxShadow: isSelected 
                      ? '0 4px 12px rgba(0,0,0,0.08)' 
                      : '0 2px 4px rgba(0,0,0,0.04)'
                  }}
                  onMouseEnter={e => {
                    if (!isSelected) {
                      e.currentTarget.style.background = 'rgba(243, 244, 246, 0.9)'
                      e.currentTarget.style.transform = 'scale(1.01)'
                    }
                  }}
                  onMouseLeave={e => {
                    if (!isSelected) {
                      e.currentTarget.style.background = 'rgba(249, 250, 251, 0.8)'
                      e.currentTarget.style.transform = 'scale(1)'
                    }
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.75rem' }}>
                    <span style={{ fontSize: '1.5rem' }}>{technique.theme?.icon}</span>
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
                        fontSize: '0.8rem', 
                        color: '#6b7280',
                        marginBottom: '0.5rem',
                        lineHeight: '1.4'
                      }}>
                        {technique.description}
                      </p>
                      <div style={{ 
                        fontSize: '0.75rem', 
                        color: '#9ca3af'
                      }}>
                        {technique.pace.in}s in • {technique.pace.hold}s hold • {technique.pace.out}s out
                        {technique.pace.holdAfter ? ` • ${technique.pace.holdAfter}s hold` : ''}
                      </div>
                    </div>
                  </div>
                </button>
              )
            })}
          </div>

          {/* Currently selected info */}
          {selected && (
            <div style={{
              marginTop: '1.5rem',
              padding: '1rem',
              borderRadius: '0.75rem',
              background: 'rgba(241, 245, 249, 0.8)',
              border: '1px solid rgba(226, 232, 240, 0.8)'
            }}>
              <p style={{ 
                fontSize: '0.85rem', 
                color: '#64748b',
                marginBottom: '0.25rem'
              }}>
                Currently practicing:
              </p>
              <p style={{ 
                fontSize: '1rem', 
                fontWeight: '600',
                color: '#1e293b'
              }}>
                {selected.theme?.icon} {selected.name}
              </p>
            </div>
          )}
        </div>
      </div>
    </>
  )
}