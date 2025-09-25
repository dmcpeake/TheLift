import React, { useState, useEffect } from 'react'
import Lottie from 'lottie-react'
import { YellowSwoosh } from '../shared/YellowSwoosh'

import BlushingShaded from '../../assets/animations/Blushing_Shaded.json'
import HappyShaded from '../../assets/animations/Happy_Shaded.json'
import MehShaded from '../../assets/animations/Meh_Shaded.json'
import SadTearShaded from '../../assets/animations/Sad_Tear_Shaded.json'
import CryingShaded from '../../assets/animations/Crying_Shaded.json'

interface MoodData {
  mood_level: string
  mood_numeric: number
  selected_at: string
  time_to_select_seconds: number
}

interface MoodMeterProps {
  onComplete?: (data: MoodData) => void
  showNextButton?: boolean
  onSelectionMade?: () => void
  onSelectionRemoved?: () => void
  hideDebugInfo?: boolean
  triggerCompletion?: boolean
  initialData?: any
}

export function MoodMeter({ onComplete, showNextButton = false, onSelectionMade, onSelectionRemoved, hideDebugInfo = false, triggerCompletion = false, initialData }: MoodMeterProps = {}) {
  const [selectedMood, setSelectedMood] = useState<MoodData | null>(null)
  const [hoveredMood, setHoveredMood] = useState<string | null>(null)
  const [startTime] = useState(Date.now())
  const [rotationOffset, setRotationOffset] = useState(0)
  const [buttonAnimationKey, setButtonAnimationKey] = useState(0)

  // Initialize with existing data if available
  useEffect(() => {
    if (initialData && !selectedMood) {
      setSelectedMood(initialData)

      // Restore the rotation to position the selected mood at the top
      const moodIndex = moods.findIndex(mood => mood.level === initialData.mood_level)
      if (moodIndex !== -1) {
        const targetRotation = -moodIndex * 72 // Each segment is 72 degrees
        setRotationOffset(targetRotation)
      }

      onSelectionMade?.()
    }
  }, [initialData, onSelectionMade, selectedMood])

  // Trigger button animation when mood is selected
  useEffect(() => {
    if (selectedMood && showNextButton) {
      setButtonAnimationKey(prev => prev + 1)
    }
  }, [selectedMood, showNextButton])

  // Handle external trigger for completion
  useEffect(() => {
    if (triggerCompletion && selectedMood) {
      onComplete?.(selectedMood)
    }
  }, [triggerCompletion, selectedMood, onComplete])

  const moods = [
    { animation: BlushingShaded, level: 'very_happy', numeric: 5, color: '#95c5c8' },
    { animation: HappyShaded, level: 'happy', numeric: 4, color: '#caded0' },
    { animation: MehShaded, level: 'ok', numeric: 3, color: '#f8d678' },
    { animation: SadTearShaded, level: 'sad', numeric: 2, color: '#e38d3b' },
    { animation: CryingShaded, level: 'very_sad', numeric: 1, color: '#e38bac' }
  ]

  const handleMoodSelect = (mood: typeof moods[0], index: number) => {
    // If clicking the already selected mood, unselect it (allow changing choice)
    if (selectedMood?.mood_level === mood.level) {
      setSelectedMood(null)
      setRotationOffset(0) // Reset to default position
      onSelectionRemoved?.()
      return
    }

    const timeToSelect = Math.round((Date.now() - startTime) / 1000)

    const data: MoodData = {
      mood_level: mood.level,
      mood_numeric: mood.numeric,
      selected_at: new Date().toISOString(),
      time_to_select_seconds: timeToSelect
    }

    console.log('🎯 MOOD METER DATA:', data)
    setSelectedMood(data)

    // Calculate rotation to bring selected segment to top
    const targetRotation = -index * 72 // Each segment is 72 degrees
    setRotationOffset(targetRotation)

    onSelectionMade?.()
  }

  return (
    <>
      <style jsx>{`
        @keyframes moodCircleExpand {
          0% {
            width: 56px;
            border-radius: 28px;
          }
          100% {
            width: 140px;
            border-radius: 28px;
          }
        }
        @keyframes moodTextFadeIn {
          0% {
            opacity: 0;
          }
          60% {
            opacity: 0;
          }
          100% {
            opacity: 1;
          }
        }
      `}</style>
      <style jsx>{`
        @media (max-width: 768px) {
          .mood-meter-title-mobile {
            font-size: 28px !important;
            line-height: 1.2 !important;
            margin-top: -55px !important;
          }
          .mood-meter-container {
            width: calc(100vw - 40px) !important;
            height: calc(100vw - 40px) !important;
            max-width: 360px !important;
            max-height: 360px !important;
          }
          .mood-meter-outer-ring {
            width: calc((100vw - 40px) * 0.90625) !important;
            height: calc((100vw - 40px) * 0.90625) !important;
            max-width: 326px !important;
            max-height: 326px !important;
          }
          .mood-meter-doughnut {
            padding: 40px !important;
          }
          .mood-meter-outer-ring {
            display: none !important;
          }
          .mood-meter-doughnut foreignObject {
            transform-origin: center !important;
          }
        }
        @media (max-width: 768px) {
          .yellow-swoosh-mobile-hide {
            display: none !important;
          }
        }
      `}</style>

      {/* Centered title like breathing exercise */}
      <div className="text-center" style={{ marginTop: '20px', marginBottom: '1rem' }}>
        <h1 className="mood-meter-title-mobile text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
          <span className="hidden md:inline">How would you describe your mood?</span>
          <span className="md:hidden">Select your mood</span>
        </h1>
      </div>

      <div className="flex flex-col items-center">
        <div className="mb-6 w-full max-w-2xl">
          <div className="flex justify-center">
            {/* Breathing circle container - 480px like breathing circle */}
            <div className="mood-meter-container relative" style={{ width: '480px', height: '480px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>


              {/* Clean doughnut with 5 segments */}
              <div className="mood-meter-doughnut" style={{ position: 'absolute', left: '50%', top: '50%', transform: `translate(-50%, -50%) rotate(${rotationOffset}deg)`, zIndex: 4, transition: 'transform 0.8s ease-in-out', padding: '30px' }}>
                <svg width="400" height="400" style={{ overflow: 'visible' }}>
                  {moods.map((mood, index) => {
                    const isSelected = selectedMood?.mood_level === mood.level
                    const centerX = 200
                    const centerY = 200
                    const outerRadius = isSelected ? 170 : 165
                    const innerRadius = isSelected ? 80 : 85
                    const segmentAngle = 72 // 72 degrees per segment
                    // Calculate angles with no gaps - offset by half segment to center first segment at top
                    const startAngle = (index * segmentAngle) - 90 - (segmentAngle / 2)
                    const endAngle = startAngle + segmentAngle

                    const startAngleRad = (startAngle * Math.PI) / 180
                    const endAngleRad = (endAngle * Math.PI) / 180

                    // Calculate path points
                    const x1 = centerX + outerRadius * Math.cos(startAngleRad)
                    const y1 = centerY + outerRadius * Math.sin(startAngleRad)
                    const x2 = centerX + outerRadius * Math.cos(endAngleRad)
                    const y2 = centerY + outerRadius * Math.sin(endAngleRad)
                    const x3 = centerX + innerRadius * Math.cos(endAngleRad)
                    const y3 = centerY + innerRadius * Math.sin(endAngleRad)
                    const x4 = centerX + innerRadius * Math.cos(startAngleRad)
                    const y4 = centerY + innerRadius * Math.sin(startAngleRad)

                    const pathData = [
                      `M ${x1} ${y1}`,
                      `A ${outerRadius} ${outerRadius} 0 0 1 ${x2} ${y2}`,
                      `L ${x3} ${y3}`,
                      `A ${innerRadius} ${innerRadius} 0 0 0 ${x4} ${y4}`,
                      'Z'
                    ].join(' ')

                    return (
                      <path
                        key={mood.level}
                        d={pathData}
                        fill={mood.color}
                        fillOpacity={isSelected ? 1.0 : 0.8}
                        stroke={isSelected ? `${mood.color}AA` : 'none'}
                        strokeWidth={isSelected ? 1 : 0}
                        className="cursor-pointer transition-all duration-300"
                        style={{
                          filter: isSelected ? 'drop-shadow(0 5px 10px rgba(0, 0, 0, 0.25))' : undefined
                        }}
                        onMouseEnter={(e) => {
                          e.currentTarget.style.fillOpacity = '1.0'
                          setHoveredMood(mood.level)
                        }}
                        onMouseLeave={(e) => {
                          e.currentTarget.style.fillOpacity = isSelected ? '1.0' : '0.8'
                          setHoveredMood(null)
                        }}
                        onClick={() => handleMoodSelect(mood, index)}
                      />
                    )
                  })}


                  {/* Lottie animations positioned on segments */}
                  {moods.map((mood, index) => {
                    const segmentAngle = 72
                    const angle = (index * segmentAngle) - 90 // Center of each segment, with first segment centered at top
                    const radius = 125 // Middle of the doughnut ring
                    const x = 200 + radius * Math.cos((angle * Math.PI) / 180)
                    const y = 200 + radius * Math.sin((angle * Math.PI) / 180)

                    return (
                      <foreignObject
                        key={`animation-${mood.level}`}
                        x={x - 35}
                        y={y - 35}
                        width="70"
                        height="70"
                        className="cursor-pointer"
                        onClick={() => handleMoodSelect(mood, index)}
                        onMouseEnter={() => setHoveredMood(mood.level)}
                        onMouseLeave={() => setHoveredMood(null)}
                      >
                        <div style={{
                          width: '70px',
                          height: '70px',
                          pointerEvents: 'none',
                          transform: `rotate(${-rotationOffset}deg)`,
                          transformOrigin: 'center center',
                          transition: 'transform 0.8s ease-in-out'
                        }}>
                          <Lottie
                            animationData={mood.animation}
                            loop={true}
                            autoplay={true}
                            style={{
                              width: '100%',
                              height: '100%',
                              filter: 'drop-shadow(0 2px 8px rgba(0, 0, 0, 0.15))'
                            }}
                          />
                        </div>
                      </foreignObject>
                    )
                  })}
                </svg>
              </div>

              {/* Center text that doesn't rotate */}
              <div
                className="absolute inset-0 flex items-center justify-center"
                style={{ pointerEvents: 'none' }}
              >
                <div className="text-center transition-opacity duration-300">
                  {hoveredMood ? (
                    <span className="text-lg font-medium text-gray-700 capitalize">
                      {hoveredMood.replace('_', ' ')}
                    </span>
                  ) : selectedMood ? (
                    <span className="text-lg font-medium text-gray-800 capitalize">
                      {selectedMood.mood_level.replace('_', ' ')}
                    </span>
                  ) : (
                    <span className="text-base text-gray-500">
                      Choose
                    </span>
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>

        {selectedMood && !hideDebugInfo && (
          <div className="mt-6 max-w-2xl">
            <h3 className="text-lg font-semibold mb-2">📊 Data Captured:</h3>
            <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-sm">
              {JSON.stringify(selectedMood, null, 2)}
            </pre>
            <p className="text-xs text-gray-500 mt-2">
              ✅ This data would be sent to: /api/mood-meter
            </p>
          </div>
        )}
      </div>


      {showNextButton && selectedMood && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center" style={{ zIndex: 1000 }}>
          <button
            key={`mood-next-${buttonAnimationKey}`}
            onClick={() => onComplete?.(selectedMood)}
            style={{
              width: '140px',
              height: '56px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              borderRadius: '28px',
              backgroundColor: '#3a7ddc',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
              border: 'none',
              cursor: 'pointer',
              transition: 'background-color 0.3s ease',
              color: 'white',
              fontSize: '16px',
              fontWeight: '600',
              animation: 'moodCircleExpand 0.4s ease-out'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.backgroundColor = '#1066c2'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.backgroundColor = '#3a7ddc'
            }}
            aria-label="Emotions"
          >
            <span style={{ animation: 'moodTextFadeIn 0.4s ease-out' }}>
              NEXT
            </span>
          </button>
        </div>
      )}

      {/* Yellow swoosh section at bottom */}
      <div className="yellow-swoosh-mobile-hide">
        <YellowSwoosh />
      </div>
    </>
  )
}