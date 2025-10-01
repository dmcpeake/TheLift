import React, { useState, useEffect } from 'react'
import { Info } from 'lucide-react'

interface WellbeingSection {
  name: string
  mood_level: string
  mood_numeric: number
  notes?: string
}

interface WellbeingRadialGraphProps {
  sections: WellbeingSection[]
  size?: number
  theoAnimation?: any
  onCenterButtonClick?: () => void
}

export function WellbeingRadialGraph({ sections, size = 400, theoAnimation, onCenterButtonClick }: WellbeingRadialGraphProps) {
  const [actualSize, setActualSize] = useState(size)

  useEffect(() => {
    const checkScreenSize = () => {
      if (window.innerWidth <= 768) {
        setActualSize(330) // Increased from 300 to 330 for more space around labels
      } else {
        setActualSize(size)
      }
    }

    checkScreenSize()
    window.addEventListener('resize', checkScreenSize)
    return () => window.removeEventListener('resize', checkScreenSize)
  }, [size])
  // Map section names to their positions (clockwise from top)
  const sectionOrder = [
    'My friends',
    'My work',
    'My health',
    'My family',
    'My fun & play',
    'My safety',
    'My emotions'
  ]

  // Use mood level colors from wellbeing wheel (not section colors)
  const getMoodColor = (moodNumeric: number) => {
    switch (moodNumeric) {
      case 5: return '#95c5c8' // Very Happy - light blue/teal
      case 4: return '#caded0' // Happy - light green
      case 3: return '#f8d678' // OK - yellow
      case 2: return '#e38d3b' // Sad - orange
      case 1: return '#e38bac' // Very Sad - pink
      default: return '#d1d5db' // Default gray for no selection
    }
  }


  // Mood level colors (matching mood meter)
  const moodColors = {
    'very_sad': '#e38bac',    // Ring 1 (center)
    'sad': '#e38d3b',         // Ring 2
    'ok': '#f8d678',          // Ring 3
    'happy': '#caded0',       // Ring 4
    'very_happy': '#95c5c8'   // Ring 5 (outer)
  }

  const centerX = actualSize / 2
  const centerY = actualSize / 2
  const maxRadius = actualSize * 0.4
  const minRadius = actualSize * 0.08
  const ringWidth = (maxRadius - minRadius) / 5

  // Create 7 segments, each covering 360/7 = ~51.43 degrees
  const segmentAngle = 360 / 7
  const segments = sectionOrder.map((sectionName, index) => {
    const section = sections.find(s => s.name === sectionName)
    const startAngle = index * segmentAngle - 90 // Start from top (-90 degrees)
    const endAngle = startAngle + segmentAngle
    const moodLevel = section?.mood_numeric || 0

    return {
      name: sectionName,
      startAngle,
      endAngle,
      moodLevel,
      color: getMoodColor(moodLevel)
    }
  })

  // Create path for a segment at a specific ring
  const createSegmentPath = (startAngle: number, endAngle: number, innerRadius: number, outerRadius: number) => {
    const startAngleRad = (startAngle * Math.PI) / 180
    const endAngleRad = (endAngle * Math.PI) / 180

    const x1 = centerX + outerRadius * Math.cos(startAngleRad)
    const y1 = centerY + outerRadius * Math.sin(startAngleRad)
    const x2 = centerX + outerRadius * Math.cos(endAngleRad)
    const y2 = centerY + outerRadius * Math.sin(endAngleRad)
    const x3 = centerX + innerRadius * Math.cos(endAngleRad)
    const y3 = centerY + innerRadius * Math.sin(endAngleRad)
    const x4 = centerX + innerRadius * Math.cos(startAngleRad)
    const y4 = centerY + innerRadius * Math.sin(startAngleRad)

    const largeArcFlag = endAngle - startAngle > 180 ? 1 : 0

    return [
      `M ${x1} ${y1}`,
      `A ${outerRadius} ${outerRadius} 0 ${largeArcFlag} 1 ${x2} ${y2}`,
      `L ${x3} ${y3}`,
      `A ${innerRadius} ${innerRadius} 0 ${largeArcFlag} 0 ${x4} ${y4}`,
      'Z'
    ].join(' ')
  }

  return (
    <div className="flex flex-col items-center">
      <style>{`
        @keyframes spin {
          from { transform: rotate(0deg); }
          to { transform: rotate(360deg); }
        }
        .radial-graph-container {
          position: relative;
          border-radius: 50%;
        }
        .radial-graph-outer-ring {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          pointer-events: none;
        }
        @media (max-width: 768px) {
          .radial-graph-outer-ring {
            width: calc((100vw - 40px) * 0.90625) !important;
            height: calc((100vw - 40px) * 0.90625) !important;
            max-width: 326px !important;
            max-height: 326px !important;
          }
          .low-score-text {
            display: none !important;
          }
          .low-score-icon {
            display: inline-block !important;
          }
        }
        @media (min-width: 769px) {
          .low-score-text {
            display: block !important;
          }
          .low-score-icon {
            display: none !important;
          }
        }
      `}</style>
      <div className="radial-graph-container relative">
        <svg width={actualSize} height={actualSize} style={{ backgroundColor: 'white', borderRadius: '50%', border: '1px solid #e5e7eb', boxShadow: '0 1px 20px rgba(0, 0, 0, 0.1)' }}>
        {/* Background circle */}
        <circle
          cx={centerX}
          cy={centerY}
          r={maxRadius}
          fill="white"
          stroke="#e5e7eb"
          strokeWidth="1"
        />

        {/* Draw segment backgrounds first for segments with answers */}
        {segments.map((segment, segmentIndex) => {
          // Only draw background if segment has an answer (moodLevel > 0)
          if (segment.moodLevel > 0) {
            return (
              <path
                key={`background-${segmentIndex}`}
                d={createSegmentPath(segment.startAngle, segment.endAngle, minRadius, maxRadius)}
                fill={segment.color}
                fillOpacity={0.4}
                stroke="#e5e7eb"
                strokeWidth="1"
              />
            )
          }
          return null
        })}

        {/* Draw each segment */}
        {segments.map((segment, segmentIndex) => {
          // For each segment, draw 5 rings (very_sad to very_happy)
          return Array.from({ length: 5 }, (_, ringIndex) => {
            const innerRadius = minRadius + ringIndex * ringWidth
            const outerRadius = minRadius + (ringIndex + 1) * ringWidth
            const ringMoodLevel = ringIndex + 1 // 1=very_sad, 2=sad, 3=ok, 4=happy, 5=very_happy

            // Determine if this ring should be filled based on the section's mood level
            const shouldFill = segment.moodLevel >= ringMoodLevel
            const fillColor = shouldFill ? segment.color : '#f3f4f6'
            const opacity = shouldFill ? 0.8 : 0.3

            return (
              <path
                key={`${segmentIndex}-${ringIndex}`}
                d={createSegmentPath(segment.startAngle, segment.endAngle, innerRadius, outerRadius)}
                fill={fillColor}
                fillOpacity={opacity}
                stroke="#e5e7eb"
                strokeWidth="1"
                className="transition-all duration-300 hover:opacity-90"
              />
            )
          })
        })}

        {/* Section labels with curved text */}
        <defs>
          {segments.map((segment, index) => {
            const labelRadius = maxRadius + 20
            const startAngleRad = ((segment.startAngle + 5) * Math.PI) / 180 // Add 5 degrees offset for better centering
            const endAngleRad = ((segment.endAngle - 5) * Math.PI) / 180 // Subtract 5 degrees offset

            const x1 = centerX + labelRadius * Math.cos(startAngleRad)
            const y1 = centerY + labelRadius * Math.sin(startAngleRad)
            const x2 = centerX + labelRadius * Math.cos(endAngleRad)
            const y2 = centerY + labelRadius * Math.sin(endAngleRad)

            const midAngle = (segment.startAngle + segment.endAngle) / 2

            // Target specific segments that need text reversal based on their names
            const segmentName = segments[index]?.name || ''
            const shouldReverse = segmentName === 'My fun & play' ||
                                 segmentName === 'My health' ||
                                 segmentName === 'My family'

            return (
              <path
                key={`textpath-${index}`}
                id={`textpath-${index}`}
                d={shouldReverse
                  ? `M ${x2} ${y2} A ${labelRadius} ${labelRadius} 0 0 0 ${x1} ${y1}`
                  : `M ${x1} ${y1} A ${labelRadius} ${labelRadius} 0 0 1 ${x2} ${y2}`
                }
                fill="none"
                stroke="none"
              />
            )
          })}
        </defs>

        {segments.map((segment, index) => (
          <text
            key={`label-${index}`}
            className="text-xs font-medium fill-gray-700"
            textAnchor="middle"
            dominantBaseline="middle"
          >
            <textPath
              href={`#textpath-${index}`}
              startOffset="50%"
            >
              {segment.name}
            </textPath>
          </text>
        ))}


        {/* Center circle (invisible for positioning) */}
        <circle
          cx={centerX}
          cy={centerY}
          r={minRadius}
          fill="transparent"
          stroke="none"
        />
        </svg>

        {/* Center button or white circle */}
        {(() => {
          // Check if any section has sad (2) or very sad (1) mood
          const hasLowScore = sections.some(section => section.mood_numeric <= 2 && section.mood_numeric > 0)

          if (hasLowScore) {
            // Show the LOW SCORE button
            return (
              <div
                className="absolute"
                style={{
                  left: 'calc(50% + 1px)',
                  top: 'calc(50% + 1px)',
                  transform: 'translate(-50%, -50%)',
                  width: minRadius * 2,
                  height: minRadius * 2,
                  borderRadius: '50%',
                  zIndex: 10
                }}
              >
                <button
                  onClick={() => {
                    onCenterButtonClick?.()
                  }}
                  style={{
                    width: '100%',
                    height: '100%',
                    borderRadius: '50%',
                    backgroundColor: '#3a7ddc',
                    border: '2px solid white',
                    cursor: 'pointer',
                    boxShadow: '0 8px 32px rgba(0, 0, 0, 0.25)',
                    transition: 'all 0.3s ease'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.backgroundColor = '#2e6bc7'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.backgroundColor = '#3a7ddc'
                  }}
                  aria-label="Chart center button"
                >
                  <span className="low-score-text" style={{
                    color: 'white',
                    fontSize: '12px',
                    fontWeight: '600',
                    textAlign: 'center',
                    display: 'block',
                    lineHeight: '1.3'
                  }}>
                    LOW<br/>SCORE?
                  </span>
                  <span className="low-score-icon" style={{
                    color: 'white',
                    display: 'none',
                    textAlign: 'center',
                    marginTop: '7px'
                  }}>
                    <Info size={18} />
                  </span>
                </button>
              </div>
            )
          } else {
            // Show a flat white circle
            return (
              <div
                className="absolute"
                style={{
                  left: 'calc(50% + 1px)',
                  top: 'calc(50% + 1px)',
                  transform: 'translate(-50%, -50%)',
                  width: minRadius * 2,
                  height: minRadius * 2,
                  borderRadius: '50%',
                  backgroundColor: 'white',
                  border: '1px solid #e5e7eb',
                  zIndex: 10
                }}
              />
            )
          }
        })()}

      </div>
    </div>
  )
}