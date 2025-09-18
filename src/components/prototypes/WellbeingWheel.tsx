import React, { useState, useEffect } from 'react'

interface SectionData {
  name: string
  mood_level: string
  mood_numeric: number
  notes: string
}

interface WheelData {
  sections: SectionData[]
  overall_score: number
  completed_sections: number
  completed_at: string
  time_to_complete_seconds: number
}

interface WellbeingWheelProps {
  onComplete?: (data: WheelData) => void
  showNextButton?: boolean
  onSelectionMade?: () => void
  hideDebugInfo?: boolean
  triggerCompletion?: boolean
  initialData?: any
}

export function WellbeingWheel({ onComplete, showNextButton = false, onSelectionMade, hideDebugInfo = false, triggerCompletion = false, initialData }: WellbeingWheelProps = {}) {
  const [sections, setSections] = useState<Record<string, SectionData>>({})
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0)
  const [finalData, setFinalData] = useState<WheelData | null>(null)
  const [startTime] = useState(Date.now())
  const [showingTextInput, setShowingTextInput] = useState<string | null>(null)
  const [isListening, setIsListening] = useState(false)

  // Initialize with existing data if available
  useEffect(() => {
    if (initialData && Object.keys(sections).length === 0) {
      if (initialData.sections) {
        const sectionsMap: Record<string, SectionData> = {}
        initialData.sections.forEach((section: SectionData) => {
          // Find the section ID by matching the name
          const sectionDef = wheelSections.find(s => s.name === section.name)
          if (sectionDef) {
            sectionsMap[sectionDef.id] = section
          }
        })
        setSections(sectionsMap)
        if (Object.keys(sectionsMap).length > 0) {
          onSelectionMade?.()
        }
      }
    }
  }, [initialData, onSelectionMade])

  // Handle external trigger for completion
  useEffect(() => {
    if (triggerCompletion && Object.keys(sections).length > 0) {
      const completedSections = Object.values(sections).filter(section =>
        section.mood_level !== '' && section.mood_numeric > 0
      )

      if (completedSections.length > 0) {
        const overallScore = Math.round(
          completedSections.reduce((sum, section) => sum + section.mood_numeric, 0) / completedSections.length
        )

        const completionData: WheelData = {
          sections: completedSections,
          overall_score: overallScore,
          completed_sections: completedSections.length,
          completed_at: new Date().toISOString(),
          time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000)
        }

        onComplete?.(completionData)
      }
    }
  }, [triggerCompletion, sections, startTime, onComplete])

  const wheelSections = [
    { id: 'family', name: 'Family & Friends' },
    { id: 'school', name: 'School & Learning' },
    { id: 'health', name: 'Health & Body' },
    { id: 'emotions', name: 'Emotions & Feelings' },
    { id: 'fun', name: 'Fun & Hobbies' },
    { id: 'safety', name: 'Safety & Security' },
    { id: 'growth', name: 'Growth & Goals' }
  ]

  const moods = [
    { emoji: '😢', level: 'very_sad', numeric: 1, color: 'bg-red-500' },
    { emoji: '😞', level: 'sad', numeric: 2, color: 'bg-orange-500' },
    { emoji: '😐', level: 'neutral', numeric: 3, color: 'bg-yellow-500' },
    { emoji: '😊', level: 'happy', numeric: 4, color: 'bg-green-500' },
    { emoji: '😄', level: 'very_happy', numeric: 5, color: 'bg-blue-500' }
  ]

  const selectMood = (sectionId: string, mood: typeof moods[0]) => {
    const section = wheelSections.find(s => s.id === sectionId)!
    const data: SectionData = {
      name: section.name,
      mood_level: mood.level,
      mood_numeric: mood.numeric,
      notes: sections[sectionId]?.notes || '' // Preserve existing notes
    }

    setSections(prev => {
      const newSections = { ...prev, [sectionId]: data }
      // Only signal selection made when all 7 areas are completed
      if (Object.keys(newSections).length === wheelSections.length) {
        onSelectionMade?.()
      }
      return newSections
    })
    console.log(`🎯 WELLBEING WHEEL SECTION DATA - ${section.name}:`, data)

    // Show text input for this section
    setShowingTextInput(sectionId)
  }

  const editSection = (sectionId: string) => {
    // Remove the section from completed sections so it doesn't show as a pill
    setSections(prev => {
      const newSections = { ...prev }
      delete newSections[sectionId]
      return newSections
    })

    // Make it the current active question
    const index = wheelSections.findIndex(s => s.id === sectionId)
    setCurrentSectionIndex(index)
    setShowingTextInput(null) // Hide any open text input
  }

  const updateNotes = (sectionId: string, notes: string) => {
    setSections(prev => {
      const currentSection = prev[sectionId]
      if (currentSection) {
        return {
          ...prev,
          [sectionId]: { ...currentSection, notes }
        }
      }
      return prev
    })
  }

  const handleMicrophoneClick = (sectionId: string) => {
    if (!('webkitSpeechRecognition' in window) && !('SpeechRecognition' in window)) {
      alert('Speech recognition is not supported in your browser')
      return
    }

    const SpeechRecognition = (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition
    const recognition = new SpeechRecognition()

    recognition.continuous = false
    recognition.interimResults = false
    recognition.lang = 'en-US'

    recognition.onstart = () => {
      setIsListening(true)
    }

    recognition.onresult = (event: any) => {
      const transcript = event.results[0][0].transcript
      const currentNotes = sections[sectionId]?.notes || ''
      const newNotes = currentNotes + (currentNotes ? ' ' : '') + transcript
      updateNotes(sectionId, newNotes.slice(0, 500))
    }

    recognition.onerror = () => {
      setIsListening(false)
      alert('Speech recognition error. Please try again.')
    }

    recognition.onend = () => {
      setIsListening(false)
    }

    recognition.start()
  }

  const finishSection = (sectionId: string) => {
    setShowingTextInput(null)

    // Auto-advance to next section
    const nextIndex = wheelSections.findIndex(s => s.id === sectionId) + 1
    if (nextIndex < wheelSections.length) {
      // Find next unrated section or go to next in sequence
      let targetIndex = nextIndex
      while (targetIndex < wheelSections.length && sections[wheelSections[targetIndex].id]) {
        targetIndex++
      }
      if (targetIndex < wheelSections.length) {
        setCurrentSectionIndex(targetIndex)
      }
    }
  }

  const completeWheel = () => {
    const timeToComplete = Math.round((Date.now() - startTime) / 1000)
    const sectionArray = Object.values(sections)
    const overallScore = sectionArray.length > 0
      ? sectionArray.reduce((sum, s) => sum + s.mood_numeric, 0) / sectionArray.length
      : 0

    const data: WheelData = {
      sections: sectionArray,
      overall_score: Number(overallScore.toFixed(1)),
      completed_sections: sectionArray.length,
      completed_at: new Date().toISOString(),
      time_to_complete_seconds: timeToComplete
    }

    console.log('🎯 WELLBEING WHEEL COMPLETE DATA:', data)

    if (showNextButton && onComplete) {
      onComplete(data)
    } else {
      setFinalData(data)
    }
  }

  const reset = () => {
    setSections({})
    setCurrentSectionIndex(0)
    setFinalData(null)
  }

  const completedCount = Object.keys(sections).length
  const allCompleted = completedCount === wheelSections.length
  const currentSection = wheelSections[currentSectionIndex]

  return (
    <>
      {/* Centered title like breathing exercise */}
      <div className="text-center" style={{ marginTop: '40px', marginBottom: '2rem' }}>
        <h1 className="text-gray-900 mb-2" style={{ fontSize: '40px', fontWeight: 600, letterSpacing: '0.02em' }}>Wellbeing Wheel</h1>
        <p className="text-gray-600 text-lg">Rate each area of your life</p>
      </div>

      {!finalData ? (
        <div className="max-w-4xl mx-auto px-4 relative" style={{ minHeight: 'calc(100vh - 300px)' }}>
          {/* Completed sections as pills - fixed position */}
          <div className="absolute top-0 left-0 right-0">
            {completedCount > 0 && (
              <div className="flex flex-wrap gap-3 justify-center">
                {wheelSections.map((section) => {
                  const sectionData = sections[section.id]
                  if (!sectionData || section.id === currentSection?.id) return null

                  const mood = moods.find(m => m.level === sectionData.mood_level)
                  return (
                    <button
                      key={section.id}
                      onClick={() => editSection(section.id)}
                      className="flex items-center bg-white rounded-full transition-all"
                      style={{
                        height: '40px',
                        border: '1px solid #3a7ddc',
                        paddingLeft: '10px',
                        paddingRight: '2px', // 2px gap to right border
                        whiteSpace: 'nowrap'
                      }}
                      onMouseEnter={(e) => {
                        const emojiIcon = e.currentTarget.querySelector('.emoji-icon')
                        const editIcon = e.currentTarget.querySelector('.edit-icon')
                        const iconCircle = e.currentTarget.querySelector('.icon-circle')
                        if (emojiIcon && editIcon && iconCircle) {
                          emojiIcon.style.display = 'none'
                          editIcon.style.display = 'block'
                          iconCircle.style.backgroundColor = '#3a7ddc'
                          e.currentTarget.style.border = '2px solid #3a7ddc'
                        }
                      }}
                      onMouseLeave={(e) => {
                        const emojiIcon = e.currentTarget.querySelector('.emoji-icon')
                        const editIcon = e.currentTarget.querySelector('.edit-icon')
                        const iconCircle = e.currentTarget.querySelector('.icon-circle')
                        if (emojiIcon && editIcon && iconCircle) {
                          emojiIcon.style.display = 'block'
                          editIcon.style.display = 'none'
                          iconCircle.style.backgroundColor = 'rgba(58, 125, 220, 0.2)'
                          e.currentTarget.style.border = '1px solid #3a7ddc'
                        }
                      }}
                    >
                      <span className="text-sm font-medium flex-grow" style={{ color: '#3a7ddc', marginRight: '10px' }}>{section.name}</span>
                      <div
                        className="icon-circle flex items-center justify-center rounded-full transition-colors"
                        style={{
                          backgroundColor: 'rgba(58, 125, 220, 0.2)',
                          width: '32px',
                          height: '32px',
                          flexShrink: 0
                        }}
                      >
                        <span className="emoji-icon text-lg">{mood?.emoji}</span>
                        <svg
                          className="edit-icon w-4 h-4 text-white"
                          fill="none"
                          stroke="currentColor"
                          strokeWidth="2"
                          strokeLinecap="round"
                          strokeLinejoin="round"
                          viewBox="0 0 24 24"
                          style={{ display: 'none' }}
                        >
                          <path d="m18 2 4 4-14 14H4v-4L18 2z"/>
                          <path d="M14.5 5.5 18.5 9.5"/>
                        </svg>
                      </div>
                    </button>
                  )
                })}
              </div>
            )}
          </div>

          {/* Current question - positioned at same level as chevron tabs */}
          {!allCompleted && currentSection && (
            <>
              {/* Title positioned above the chevron level */}
              <div className="fixed left-1/2 top-1/2 transform -translate-x-1/2 text-center" style={{ marginTop: '-90px' }}>
                <h2 className="text-2xl font-semibold text-gray-900">{currentSection.name}</h2>
              </div>

              {/* Show mood selection if not showing text input, or show selected mood if showing text input */}
              {showingTextInput !== currentSection.id ? (
                <div className="fixed left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 flex gap-4 justify-center">
                  {moods.map((mood) => (
                    <button
                      key={mood.level}
                      onClick={() => selectMood(currentSection.id, mood)}
                      className="p-4 rounded-lg transition-all hover:scale-110 bg-gray-100 hover:bg-gray-200"
                    >
                      <span className="text-4xl">{mood.emoji}</span>
                    </button>
                  ))}
                </div>
              ) : (
                <>
                  {/* Rating options stay in original position - vertical center */}
                  <div className="fixed left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 flex gap-4 justify-center">
                    {moods.map((mood) => {
                      const isSelected = sections[currentSection.id]?.mood_level === mood.level
                      return (
                        <button
                          key={mood.level}
                          onClick={() => selectMood(currentSection.id, mood)}
                          className={`p-4 rounded-lg transition-all hover:scale-110 ${
                            isSelected
                              ? 'bg-blue-500 text-white ring-4 ring-blue-200 scale-110'
                              : 'bg-gray-100 hover:bg-gray-200'
                          }`}
                        >
                          <span className="text-4xl">{mood.emoji}</span>
                        </button>
                      )
                    })}
                  </div>

                  {/* Text input below the ratings */}
                  <div className="fixed left-1/2 transform -translate-x-1/2" style={{ top: 'calc(50% + 120px)', width: '600px' }}>
                    <div className="relative">
                      <textarea
                        value={sections[currentSection.id]?.notes || ''}
                        onChange={(e) => updateNotes(currentSection.id, e.target.value.slice(0, 500))}
                        placeholder="What's going well or could be better in this area? (optional)"
                        className="w-full p-3 border rounded-lg h-24 resize-none pr-16"
                        maxLength={500}
                      />
                      <button
                        onClick={() => handleMicrophoneClick(currentSection.id)}
                        className={`absolute top-1/2 right-3 transform -translate-y-1/2 rounded-full transition-colors ${
                          isListening ? 'bg-red-500 text-white' : 'bg-gray-100 hover:bg-gray-200 text-gray-600'
                        }`}
                        style={{
                          width: '40px',
                          height: '40px',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center'
                        }}
                        title="Voice input"
                        type="button"
                      >
                        {isListening ? (
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                            <rect x="6" y="4" width="12" height="16" rx="2"/>
                          </svg>
                        ) : (
                          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                            <path d="M12 2a3 3 0 0 0-3 3v6a3 3 0 0 0 6 0V5a3 3 0 0 0-3-3Z"/>
                            <path d="M19 10v1a7 7 0 0 1-14 0v-1"/>
                            <line x1="12" y1="19" x2="12" y2="23"/>
                            <line x1="8" y1="23" x2="16" y2="23"/>
                          </svg>
                        )}
                      </button>
                    </div>

                    <p className="text-xs text-gray-500 text-center mt-2">
                      {(sections[currentSection.id]?.notes || '').length}/500 characters
                    </p>

                    {/* Round next arrow button */}
                    <div className="flex justify-center mt-4">
                      <button
                        onClick={() => finishSection(currentSection.id)}
                        style={{
                          width: '56px',
                          height: '56px',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center',
                          borderRadius: '50%',
                          backgroundColor: '#3a7ddc',
                          boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                          border: 'none',
                          cursor: 'pointer',
                          transition: 'all 0.3s ease',
                          color: 'white'
                        }}
                        onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
                        onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
                        aria-label="Continue"
                      >
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                          <polyline points="9,18 15,12 9,6"></polyline>
                        </svg>
                      </button>
                    </div>
                  </div>
                </>
              )}
            </>
          )}


          {/* Debug info */}
          {!hideDebugInfo && completedCount > 0 && (
            <div className="mt-8 max-w-2xl mx-auto">
              <h3 className="text-lg font-semibold mb-2">📊 Data Captured:</h3>
              <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-sm">
                {JSON.stringify(Object.values(sections), null, 2)}
              </pre>
            </div>
          )}
        </div>
      ) : (
        <div className="max-w-4xl mx-auto px-4 text-center">
          <h3 className="text-lg font-semibold mb-2">✅ Complete!</h3>
          <div className="mb-4 p-4 bg-blue-50 rounded-lg max-w-lg mx-auto">
            <p className="text-2xl font-bold text-center">
              Overall Score: {finalData.overall_score}/5.0
            </p>
          </div>
          {!hideDebugInfo && (
            <div className="max-w-2xl mx-auto">
              <h4 className="font-medium mb-2">📊 Data Captured:</h4>
              <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-sm mb-4">
                {JSON.stringify(finalData, null, 2)}
              </pre>
              <p className="text-xs text-gray-500 mb-4">
                ✅ This data would be sent to: /api/wellbeing-wheel
              </p>
            </div>
          )}

          {!showNextButton && (
            <button
              onClick={reset}
              className="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600"
            >
              Start Over
            </button>
          )}
        </div>
      )}

      {/* Fixed bottom button - only show when all 7 areas completed */}
      {!finalData && allCompleted && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center z-1000">
          <button
            onClick={completeWheel}
            style={{
              width: '56px',
              height: '56px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              borderRadius: '50%',
              backgroundColor: '#e87e67', // Orange color
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
              border: 'none',
              cursor: 'pointer',
              transition: 'all 0.3s ease',
              color: 'white'
            }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#d86b4f'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#e87e67'}
            aria-label="Complete"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <polyline points="20,6 9,17 4,12"></polyline>
            </svg>
          </button>
        </div>
      )}
    </>
  )
}