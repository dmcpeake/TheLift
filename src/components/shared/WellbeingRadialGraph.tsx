import React from 'react'
import Lottie from 'lottie-react'

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
}

export function WellbeingRadialGraph({ sections, size = 400, theoAnimation }: WellbeingRadialGraphProps) {
  // Map section names to their positions (clockwise from top)
  const sectionOrder = [
    'Family & Friends',
    'School & Learning',
    'Health & Body',
    'Emotions & Feelings',
    'Fun & Hobbies',
    'Safety & Security',
    'Growth & Goals'
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

  const centerX = size / 2
  const centerY = size / 2
  const maxRadius = size * 0.4
  const minRadius = size * 0.08
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
        }
      `}</style>
      <div className="radial-graph-container relative">
        <svg width={size} height={size} style={{ backgroundColor: 'white', borderRadius: '50%' }}>
        {/* Background circle */}
        <circle
          cx={centerX}
          cy={centerY}
          r={maxRadius}
          fill="white"
          stroke="#d1d5db"
          strokeWidth="2"
        />

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
                stroke="#d1d5db"
                strokeWidth="1"
                className="transition-all duration-300 hover:opacity-90"
              />
            )
          })
        })}

        {/* Section labels with curved text */}
        <defs>
          {segments.map((segment, index) => {
            const labelRadius = maxRadius + 35
            const startAngleRad = ((segment.startAngle + 5) * Math.PI) / 180 // Add 5 degrees offset for better centering
            const endAngleRad = ((segment.endAngle - 5) * Math.PI) / 180 // Subtract 5 degrees offset

            const x1 = centerX + labelRadius * Math.cos(startAngleRad)
            const y1 = centerY + labelRadius * Math.sin(startAngleRad)
            const x2 = centerX + labelRadius * Math.cos(endAngleRad)
            const y2 = centerY + labelRadius * Math.sin(endAngleRad)

            const midAngle = (segment.startAngle + segment.endAngle) / 2
            const isFlipped = midAngle > 90 && midAngle < 270

            return (
              <path
                key={`textpath-${index}`}
                id={`textpath-${index}`}
                d={`M ${isFlipped ? x2 : x1} ${isFlipped ? y2 : y1} A ${labelRadius} ${labelRadius} 0 0 ${isFlipped ? 0 : 1} ${isFlipped ? x1 : x2} ${isFlipped ? y1 : y2}`}
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

        {/* Center circle */}
        <circle
          cx={centerX}
          cy={centerY}
          r={minRadius}
          fill="white"
          stroke="#374151"
          strokeWidth="2"
        />
        </svg>

        {/* Theo animation in center */}
        {theoAnimation && (
          <div
            className="absolute"
            style={{
              left: '50%',
              top: '50%',
              transform: 'translate(-50%, -50%)',
              width: minRadius * 2,
              height: minRadius * 2,
              borderRadius: '50%',
              zIndex: 10
            }}
          >
            <Lottie
              animationData={theoAnimation}
              loop={true}
              autoplay={true}
              style={{ width: '100%', height: '100%' }}
            />
          </div>
        )}

        {/* Dashed outer ring - same as mood meter */}
        <div
          className="radial-graph-outer-ring"
          style={{
            width: size + 45,
            height: size + 45,
            zIndex: 5
          }}
        >
          <div
            style={{
              width: '100%',
              height: '100%',
              borderRadius: '50%',
              border: '3px dashed #e6b6b6',
              animation: 'spin 120s linear infinite'
            }}
          />
        </div>
      </div>
    </div>
  )
}