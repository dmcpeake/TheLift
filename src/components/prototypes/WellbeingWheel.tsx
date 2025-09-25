import React, { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import Lottie from 'lottie-react'
import { YellowSwoosh } from '../shared/YellowSwoosh'
import BlushingShaded from '../../assets/animations/Blushing_Shaded.json'
import HappyShaded from '../../assets/animations/Happy_Shaded.json'
import MehShaded from '../../assets/animations/Meh_Shaded.json'
import SadTearShaded from '../../assets/animations/Sad_Tear_Shaded.json'
import CryingShaded from '../../assets/animations/Crying_Shaded.json'

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
  skipped?: boolean
  hasCompletedSections?: boolean
}

interface WellbeingWheelProps {
  onComplete?: (data: WheelData) => void
  showNextButton?: boolean
  onSelectionMade?: () => void
  hideDebugInfo?: boolean
  triggerCompletion?: boolean
  initialData?: any
  onPartialSave?: (data: any) => void
}

export function WellbeingWheel({ onComplete, showNextButton = false, onSelectionMade, hideDebugInfo = false, triggerCompletion = false, initialData, onPartialSave }: WellbeingWheelProps = {}) {
  const navigate = useNavigate()
  const [sections, setSections] = useState<Record<string, SectionData>>({})
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0)
  const [finalData, setFinalData] = useState<WheelData | null>(null)
  const [startTime] = useState(Date.now())
  const [showingTextInput, setShowingTextInput] = useState<string | null>(null)
  const [isListening, setIsListening] = useState(false)
  const [rotationOffset, setRotationOffset] = useState(0)
  const [currentSlide, setCurrentSlide] = useState(0)
  const scrollContainerRef = useRef<HTMLDivElement>(null)
  const [isDragging, setIsDragging] = useState(false)
  const [startX, setStartX] = useState(0)
  const [scrollLeft, setScrollLeft] = useState(0)
  const [hasMovedMouse, setHasMovedMouse] = useState(false)
  const [hoveredMood, setHoveredMood] = useState<string | null>(null)
  const [hasSavedCurrentSection, setHasSavedCurrentSection] = useState(false)
  const [editingNotes, setEditingNotes] = useState<string>('')
  const [buttonAnimationKey, setButtonAnimationKey] = useState(0)

  // Reset saved status when section changes
  useEffect(() => {
    setHasSavedCurrentSection(false)
  }, [currentSectionIndex])

  // Trigger button animation when save/next conditions change
  // Only check mood_level changes, not notes changes
  useEffect(() => {
    const currentSection = wheelSections[currentSectionIndex]
    const isCurrentSectionCompleted = sections[currentSection?.id]?.mood_level
    const allSectionsCompleted = Object.keys(sections).length === wheelSections.length
    const shouldShowSaveButton = isCurrentSectionCompleted && !hasSavedCurrentSection
    const shouldShowNextButton = allSectionsCompleted

    if (shouldShowSaveButton || shouldShowNextButton) {
      setButtonAnimationKey(prev => prev + 1)
    }
  }, [
    // Only depend on mood_level values, not the entire sections object
    Object.keys(sections).map(key => sections[key]?.mood_level).join(','),
    currentSectionIndex,
    hasSavedCurrentSection
  ])

  // Initialize with existing data if available
  useEffect(() => {
    if (initialData) {
      if (initialData.sections && initialData.sections.length > 0) {
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
  }, [initialData])

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
    { animation: BlushingShaded, level: 'very_happy', numeric: 5, color: '#95c5c8' },
    { animation: HappyShaded, level: 'happy', numeric: 4, color: '#caded0' },
    { animation: MehShaded, level: 'ok', numeric: 3, color: '#f8d678' },
    { animation: SadTearShaded, level: 'sad', numeric: 2, color: '#e38d3b' },
    { animation: CryingShaded, level: 'very_sad', numeric: 1, color: '#e38bac' }
  ]

  const totalSlides = Math.ceil(wheelSections.length / 3) // 3 cards per slide on mobile

  const scrollToSlide = (slideIndex: number) => {
    if (scrollContainerRef.current) {
      const slideWidth = 3 * (140 + 10) // 3 cards × (140px width + 10px gap)
      const scrollPosition = slideIndex * slideWidth
      scrollContainerRef.current.scrollTo({
        left: scrollPosition,
        behavior: 'smooth'
      })
      setCurrentSlide(slideIndex)
    }
  }

  const handlePrevSlide = () => {
    const newIndex = Math.max(0, currentSlide - 1)
    scrollToSlide(newIndex)
  }

  const handleNextSlide = () => {
    const newIndex = Math.min(totalSlides - 1, currentSlide + 1)
    scrollToSlide(newIndex)
  }

  // Touch/Mouse drag handlers
  const handleMouseDown = (e: React.MouseEvent) => {
    setIsDragging(true)
    setHasMovedMouse(false)
    setStartX(e.pageX - (scrollContainerRef.current?.offsetLeft || 0))
    setScrollLeft(scrollContainerRef.current?.scrollLeft || 0)
  }

  const handleTouchStart = (e: React.TouchEvent) => {
    setIsDragging(true)
    setStartX(e.touches[0].pageX - (scrollContainerRef.current?.offsetLeft || 0))
    setScrollLeft(scrollContainerRef.current?.scrollLeft || 0)
  }

  const handleMouseMove = (e: React.MouseEvent) => {
    if (!isDragging || !scrollContainerRef.current) return
    e.preventDefault()
    setHasMovedMouse(true)
    const x = e.pageX - (scrollContainerRef.current.offsetLeft || 0)
    const walk = (x - startX) * 1
    scrollContainerRef.current.scrollLeft = scrollLeft - walk
  }

  const handleTouchMove = (e: React.TouchEvent) => {
    if (!isDragging || !scrollContainerRef.current) return
    const x = e.touches[0].pageX - (scrollContainerRef.current.offsetLeft || 0)
    const walk = (x - startX) * 1
    scrollContainerRef.current.scrollLeft = scrollLeft - walk
  }

  const handleMouseUp = () => {
    setIsDragging(false)
    // Only snap to slide if we actually dragged
    if (hasMovedMouse && scrollContainerRef.current) {
      const slideWidth = 3 * (140 + 10)
      const newSlide = Math.round(scrollContainerRef.current.scrollLeft / slideWidth)
      setCurrentSlide(Math.max(0, Math.min(totalSlides - 1, newSlide)))
    }
    setHasMovedMouse(false)
  }

  const handleTouchEnd = () => {
    setIsDragging(false)
    // Snap to nearest slide
    if (scrollContainerRef.current) {
      const slideWidth = 3 * (140 + 10)
      const newSlide = Math.round(scrollContainerRef.current.scrollLeft / slideWidth)
      setCurrentSlide(Math.max(0, Math.min(totalSlides - 1, newSlide)))
    }
  }

  const selectMood = (sectionId: string, mood: typeof moods[0], index: number) => {
    // If clicking the already selected mood, unselect it
    if (sections[sectionId]?.mood_level === mood.level) {
      setSections(prev => {
        const newSections = { ...prev }
        delete newSections[sectionId]

        // Save partial data after deselection
        if (onPartialSave) {
          const sectionsArray = Object.values(newSections)
          onPartialSave({
            sections: sectionsArray,
            overall_score: sectionsArray.length > 0 ? sectionsArray.reduce((sum, s) => sum + s.mood_numeric, 0) / sectionsArray.length : 0,
            completed_sections: sectionsArray.length,
            completed_at: new Date().toISOString(),
            time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000)
          })
        }

        return newSections
      })
      setRotationOffset(0) // Reset to default position
      setHasSavedCurrentSection(false) // Reset saved status on deselection
      return
    }

    const section = wheelSections.find(s => s.id === sectionId)!
    const data: SectionData = {
      name: section.name,
      mood_level: mood.level,
      mood_numeric: mood.numeric,
      notes: sections[sectionId]?.notes || editingNotes || '' // Restore editing notes or preserve existing
    }

    setSections(prev => {
      const newSections = { ...prev, [sectionId]: data }

      // Save partial data after selection
      if (onPartialSave) {
        const sectionsArray = Object.values(newSections)
        onPartialSave({
          sections: sectionsArray,
          overall_score: sectionsArray.reduce((sum, s) => sum + s.mood_numeric, 0) / sectionsArray.length,
          completed_sections: sectionsArray.length,
          completed_at: new Date().toISOString(),
          time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000)
        })
      }

      // Only signal selection made when all 7 areas are completed
      if (Object.keys(newSections).length === wheelSections.length) {
        onSelectionMade?.()
      }
      return newSections
    })
    console.log(`🎯 WELLBEING WHEEL SECTION DATA - ${section.name}:`, data)

    // Calculate rotation to bring selected segment to top
    const targetRotation = -index * 72 // Each segment is 72 degrees
    setRotationOffset(targetRotation)

    // Reset saved status when a new selection is made
    setHasSavedCurrentSection(false)

    // Clear editing notes since they're now incorporated
    setEditingNotes('')

    // Don't show text input automatically anymore - selection stays on doughnut
  }

  const editSection = (sectionId: string) => {
    // Store the current section's notes for restoration
    const currentSectionData = sections[sectionId]
    if (currentSectionData?.notes) {
      setEditingNotes(currentSectionData.notes)
    } else {
      setEditingNotes('')
    }

    // Temporarily remove the section to show the wheel again
    setSections(prev => {
      const newSections = { ...prev }
      delete newSections[sectionId]
      return newSections
    })

    // Make it the current active question
    const index = wheelSections.findIndex(s => s.id === sectionId)
    setCurrentSectionIndex(index)
    setShowingTextInput(null) // Hide any open text input
    setRotationOffset(0) // Reset rotation to show all options
    setHasSavedCurrentSection(false)
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

  const scrollToActiveCard = (sectionIndex: number) => {
    if (scrollContainerRef.current) {
      const cardWidth = 140 + 10 // card width + gap
      const containerWidth = scrollContainerRef.current.clientWidth
      const cardPosition = sectionIndex * cardWidth

      // Calculate if we need to scroll to keep the card in view
      const currentScroll = scrollContainerRef.current.scrollLeft
      const cardStart = cardPosition - 20 // Account for padding
      const cardEnd = cardPosition + 140 + 20 // Card width + padding

      if (cardStart < currentScroll) {
        // Card is to the left of view, scroll left
        scrollContainerRef.current.scrollTo({
          left: cardStart - 60,
          behavior: 'smooth'
        })
      } else if (cardEnd > currentScroll + containerWidth) {
        // Card is to the right of view, scroll right
        scrollContainerRef.current.scrollTo({
          left: cardEnd - containerWidth + 60,
          behavior: 'smooth'
        })
      }
    }
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
        // Reset rotation for unrated section
        setRotationOffset(0)
        // Auto-scroll to keep the new active card in view
        setTimeout(() => scrollToActiveCard(targetIndex), 100)
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
      <style jsx>{`
        @media (max-width: 768px) {
          .wellbeing-title-mobile {
            font-size: 28px !important;
            line-height: 1.2 !important;
            margin-top: -55px !important;
          }
          .wellbeing-title-desktop {
            display: none !important;
          }
          .wellbeing-title-mobile-text {
            display: block !important;
          }
        }
        @media (min-width: 769px) {
          .wellbeing-title-mobile-text {
            display: none !important;
          }
        }
        @media (max-width: 768px) {
          .yellow-swoosh-mobile-hide {
            display: none !important;
          }
          .wellbeing-text-input {
            top: 60px !important;
          }
          .wellbeing-text-input .relative {
            margin-left: 20px !important;
            margin-right: 20px !important;
          }
          .wellbeing-title-container {
            margin-top: 20px;
          }
          /* Prevent zoom on input focus - set font-size to 16px minimum */
          .wellbeing-textarea {
            font-size: 16px !important;
            /* Prevent viewport manipulation on focus */
            touch-action: manipulation;
            -webkit-text-size-adjust: 100%;
          }
        }
      `}</style>

      {/* Centered title like breathing exercise */}
      <div className="text-center wellbeing-title-container" style={{ marginBottom: '2rem' }}>
        <h1 className="wellbeing-title-mobile wellbeing-title-desktop text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em' }}>
          {currentSection ? `How are you feeling about your ${currentSection.name}` : 'How do you feel about these areas of your life?'}
        </h1>
        <h1 className="wellbeing-title-mobile wellbeing-title-mobile-text text-gray-900 mb-2" style={{ fontSize: '30px', fontWeight: 600, letterSpacing: '0.02em', display: 'none' }}>
          {currentSection ? 'How are you feeling about' : 'How do you feel about these areas of your life?'}
        </h1>
      </div>

      {!finalData ? (
        <div>
          {/* Topic navigation cards */}
          <div className="relative">
            <style>{`
              @media (min-width: 1280px) {
                .wellbeing-categories {
                  justify-content: center !important;
                  min-width: auto !important;
                }
                .wellbeing-slider-nav {
                  display: none !important;
                }
              }
              @keyframes fadeInDelayed {
                from { opacity: 0; }
                to { opacity: 1; }
              }
              @keyframes circleExpand {
                0% {
                  width: 56px;
                  border-radius: 28px;
                }
                100% {
                  width: 140px;
                  border-radius: 28px;
                }
              }
              @keyframes textFadeIn {
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


            <div
              ref={scrollContainerRef}
              className="wellbeing-scroll-container overflow-x-auto"
              style={{
                paddingBottom: '20px',
                cursor: isDragging ? 'grabbing' : (window.innerWidth >= 1280 ? 'default' : 'grab'),
                userSelect: window.innerWidth >= 1280 ? 'auto' : 'none',
                WebkitUserSelect: window.innerWidth >= 1280 ? 'auto' : 'none',
                msUserSelect: window.innerWidth >= 1280 ? 'auto' : 'none'
              }}
              onMouseDown={window.innerWidth >= 1280 ? undefined : handleMouseDown}
              onMouseMove={window.innerWidth >= 1280 ? undefined : handleMouseMove}
              onMouseUp={window.innerWidth >= 1280 ? undefined : handleMouseUp}
              onMouseLeave={window.innerWidth >= 1280 ? undefined : handleMouseUp}
              onTouchStart={window.innerWidth >= 1280 ? undefined : handleTouchStart}
              onTouchMove={window.innerWidth >= 1280 ? undefined : handleTouchMove}
              onTouchEnd={window.innerWidth >= 1280 ? undefined : handleTouchEnd}
            >

              <div className="flex wellbeing-categories" style={{
                paddingLeft: '20px',
                paddingRight: '20px',
                minWidth: '1000px',
                gap: '10px'
              }}>
            {wheelSections.map((section, index) => {
              const isActive = currentSectionIndex === index
              const isCompleted = sections[section.id]?.mood_level
              const completedMood = moods.find(m => m.level === sections[section.id]?.mood_level)

              // Icon mapping for each section
              const getIcon = (sectionId: string) => {
                switch (sectionId) {
                  case 'family':
                    return (
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="m22 21-2-2"/>
                        <path d="m16 16 2 2"/>
                        <circle cx="18" cy="12" r="3"/>
                      </svg>
                    )
                  case 'school':
                    return (
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
                        <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/>
                      </svg>
                    )
                  case 'health':
                    return (
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.29 1.51 4.04 3 5.5Z"/>
                        <path d="M12 5L8 21l4-7 4 7-4-16"/>
                      </svg>
                    )
                  case 'emotions':
                    return (
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <circle cx="12" cy="12" r="10"/>
                        <path d="M8 14s1.5 2 4 2 4-2 4-2"/>
                        <line x1="9" y1="9" x2="9.01" y2="9"/>
                        <line x1="15" y1="9" x2="15.01" y2="9"/>
                      </svg>
                    )
                  case 'fun':
                    return (
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <polygon points="12,2 15.09,8.26 22,9.27 17,14.14 18.18,21.02 12,17.77 5.82,21.02 7,14.14 2,9.27 8.91,8.26"/>
                      </svg>
                    )
                  case 'safety':
                    return (
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10"/>
                      </svg>
                    )
                  case 'growth':
                    return (
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <polyline points="22,12 18,12 15,21 9,3 6,12 2,12"/>
                      </svg>
                    )
                  default:
                    return null
                }
              }

              return (
                <button
                  key={section.id}
                  onClick={(e) => {
                    // Only handle click if we haven't moved the mouse (not dragging)
                    if (!hasMovedMouse) {
                      setCurrentSectionIndex(index)

                      // Reset rotation if switching to an unrated section
                      if (!isCompleted) {
                        setRotationOffset(0)
                      }

                      if (isCompleted) {
                        editSection(section.id)
                      }

                      // Auto-scroll to keep the clicked card in view
                      setTimeout(() => scrollToActiveCard(index), 100)
                    }
                  }}
                  className={`relative rounded-lg flex flex-col items-center gap-2 px-3 py-3 text-sm transition-all ${
                    isActive ? 'font-medium' :
                    isCompleted ? 'hover:text-blue-700 cursor-pointer' :
                    'hover:text-blue-700 cursor-pointer'
                  }`}
                  style={{
                    borderRadius: '4px',
                    width: '140px',
                    minWidth: '140px',
                    backgroundColor: isCompleted && completedMood ? `${completedMood.color}33` : 'white',
                    border: isCompleted && completedMood ? `2px solid ${completedMood.color}` :
                           isActive ? '2px solid #e87e67' : '2px solid #3b82f6',
                    boxShadow: isActive ? '0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06)' :
                              '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                    color: isCompleted ? '#1f2937' : isActive ? '#e87e67' : '#3b82f6',
                    pointerEvents: 'auto'
                  }}
                  disabled={false}
                >
                  {/* Reset X icon for completed cards */}
                  {isCompleted && completedMood && (
                    <div className="absolute" style={{ top: '5px', right: '5px', zIndex: 10 }}>
                      <div
                        className="w-5 h-5 rounded-full flex items-center justify-center"
                        style={{
                          fontSize: '14px',
                          color: 'white',
                          backgroundColor: completedMood.color,
                          paddingBottom: '2px'
                        }}
                      >
                        ×
                      </div>
                    </div>
                  )}

                  {/* Icon circle */}
                  {isCompleted && completedMood ? (
                    <div className="flex items-center justify-center" style={{
                      width: '40px',
                      height: '40px',
                      minWidth: '40px',
                      minHeight: '40px'
                    }}>
                      <Lottie
                        animationData={completedMood.animation}
                        loop={true}
                        autoplay={true}
                        style={{
                          width: '40px',
                          height: '40px',
                          filter: 'drop-shadow(0 1px 2px rgba(0, 0, 0, 0.15))'
                        }}
                      />
                    </div>
                  ) : (
                    <div className="rounded-full flex items-center justify-center transition-all" style={{
                      width: '40px',
                      height: '40px',
                      backgroundColor: isActive ? '#e87e671a' : '#3b82f61a',
                      color: isActive ? '#e87e67' : '#3b82f6'
                    }}>
                      {getIcon(section.id)}
                    </div>
                  )}

                  {/* Text */}
                  <div className="text-center">
                    <span className="font-semibold" style={{ fontSize: '11px', lineHeight: '1.2', color: isCompleted ? '#1f2937' : isActive ? '#e87e67' : '#3b82f6' }}>{section.name}</span>
                  </div>
                </button>
              )
            })}
            {/* Spacer to add gap after last card */}
            <div style={{ width: '20px', flexShrink: 0 }}></div>
              </div>
            </div>

          </div>

        <div className="max-w-4xl mx-auto px-4 relative">
          {/* Pills removed - replaced with topic navigation */}
            {false && completedCount > 0 && (
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
                        <span className="emoji-icon text-lg">
                        {mood && (
                          <div style={{ width: '20px', height: '20px' }}>
                            <Lottie
                              animationData={mood.animation}
                              loop={true}
                              autoplay={true}
                              style={{ width: '100%', height: '100%' }}
                            />
                          </div>
                        )}
                      </span>
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

          {/* Current question section - properly stacked */}
          {currentSection && (
            <div className="text-center">

              {/* Container for mood wheel and text input - same size */}
              <div className="flex justify-center mb-8" style={{ marginTop: '-20px' }}>
                <div className="relative" style={{ width: '360px', height: '360px' }}>

                  {/* Mood doughnut selector - fades out when mood is selected */}
                  <div
                    className="absolute inset-0 transition-all duration-500"
                    style={{
                      opacity: sections[currentSection.id]?.mood_level ? 0 : 1,
                      transform: sections[currentSection.id]?.mood_level ? 'scale(0.8)' : 'scale(1)',
                      pointerEvents: sections[currentSection.id]?.mood_level ? 'none' : 'auto',
                      transitionDelay: sections[currentSection.id]?.mood_level ? '0.7s' : '0s'
                    }}
                  >
                    <div style={{ position: 'absolute', left: '50%', top: '50%', transform: `translate(-50%, -50%) rotate(${rotationOffset}deg)`, zIndex: 4, transition: 'transform 0.8s ease-in-out' }}>
                    <svg width="360" height="360" style={{ overflow: 'visible' }}>
                      {moods.map((mood, index) => {
                        const isSelected = sections[currentSection.id]?.mood_level === mood.level
                        const centerX = 180
                        const centerY = 180
                        const outerRadius = isSelected ? 150 : 145
                        const innerRadius = isSelected ? 70 : 75
                        const segmentAngle = 72 // 72 degrees per segment
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
                            onClick={() => selectMood(currentSection.id, mood, index)}
                          />
                        )
                      })}

                      {/* Lottie animations positioned on segments */}
                      {moods.map((mood, index) => {
                        const segmentAngle = 72
                        const angle = (index * segmentAngle) - 90
                        const radius = 110
                        const x = 180 + radius * Math.cos((angle * Math.PI) / 180)
                        const y = 180 + radius * Math.sin((angle * Math.PI) / 180)

                        return (
                          <foreignObject
                            key={`animation-${mood.level}`}
                            x={x - 35}
                            y={y - 35}
                            width="70"
                            height="70"
                            className="cursor-pointer"
                            onClick={() => selectMood(currentSection.id, mood, index)}
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
                      <div className="text-center">
                        {hoveredMood ? (
                          <span className="text-lg font-medium text-gray-800 capitalize">
                            {hoveredMood.replace('_', ' ')}
                          </span>
                        ) : sections[currentSection.id]?.mood_level ? (
                          <span className="text-lg font-medium text-gray-800 capitalize">
                            {sections[currentSection.id].mood_level.replace('_', ' ')}
                          </span>
                        ) : (
                          <span className="text-base text-gray-500">
                            Choose
                          </span>
                        )}
                      </div>
                    </div>
                  </div>

                  {/* Text input - fades in when mood is selected */}
                  {sections[currentSection.id]?.mood_level && (
                    <div
                      className="wellbeing-text-input"
                      style={{
                        opacity: 0,
                        animation: 'fadeInDelayed 0.3s ease-in-out 1.5s forwards',
                        position: 'absolute',
                        top: '40px',
                        left: 0,
                        right: 0,
                        display: 'flex',
                        justifyContent: 'center'
                      }}
                    >
                      <div className="w-full max-w-sm">
                        <h3 className="text-lg font-medium text-gray-800 mb-4 text-center">
                          Why are you feeling {sections[currentSection.id]?.mood_level?.replace('_', ' ')}?
                        </h3>
                        <div className="relative">
                          <textarea
                            value={sections[currentSection.id]?.notes || ''}
                            onChange={(e) => updateNotes(currentSection.id, e.target.value.slice(0, 500))}
                            placeholder="Note down your thoughts (optional)"
                            className="w-full pr-14 border rounded-lg h-32 resize-none wellbeing-textarea"
                            style={{ paddingTop: '3rem', paddingBottom: '3rem', paddingLeft: '0.75rem', paddingRight: '3.5rem', lineHeight: '1.5' }}
                            maxLength={500}
                            onFocus={() => {
                              // Store current scroll position on mobile BEFORE keyboard appears
                              if (window.innerWidth <= 768) {
                                // Store the position before any scrolling happens
                                (window as any).wellbeingTextareaScrollY = window.scrollY;
                              }
                            }}
                            onBlur={() => {
                              // Restore scroll position when keyboard closes on mobile
                              if (window.innerWidth <= 768) {
                                const originalScrollY = (window as any).wellbeingTextareaScrollY;
                                if (originalScrollY !== undefined) {
                                  // Longer delay to wait for keyboard to fully close
                                  setTimeout(() => {
                                    window.scrollTo(0, originalScrollY);
                                    delete (window as any).wellbeingTextareaScrollY;
                                  }, 300);
                                }
                              }
                            }}
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
                      </div>
                    </div>
                  )}

                </div>
              </div>
            </div>
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

      {/* Fixed bottom button - always show to allow proceeding without completing all sections */}
      {!finalData && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center items-center" style={{ zIndex: 1000, gap: '20px' }}>
          {/* Back Button */}
          <button
            onClick={() => {
              // Navigate back to emotions page (step 1)
              navigate('/checkin/flow/emotions')
            }}
            style={{
              backgroundColor: 'white',
              border: '2px solid #3a7ddc',
              borderRadius: '50%',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '56px',
              height: '56px',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
              transition: 'all 0.3s ease'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.backgroundColor = '#f8fafc'
              e.currentTarget.style.borderColor = '#2e6bc7'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.backgroundColor = 'white'
              e.currentTarget.style.borderColor = '#3a7ddc'
            }}
            aria-label="Go back to emotions"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
              <polyline points="15,18 9,12 15,6"></polyline>
            </svg>
          </button>

          {/* Dynamic Button Logic */}
          {(() => {
            const currentSection = wheelSections[currentSectionIndex]
            const isCurrentSectionCompleted = sections[currentSection?.id]?.mood_level
            const allSectionsCompleted = Object.keys(sections).length === wheelSections.length

            // Show blue NEXT button if all sections are completed
            if (allSectionsCompleted) {
              return (
                <button
                  key={`next-${buttonAnimationKey}`}
                  onClick={() => {
                    completeWheel()
                  }}
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
                    animation: 'circleExpand 0.4s ease-out'
                  }}
                  onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2e6bc7'}
                  onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3a7ddc'}
                  aria-label="Continue to chart"
                >
                  <span style={{ animation: 'textFadeIn 0.4s ease-out' }}>
                    NEXT
                  </span>
                </button>
              )
            }

            // Show SAVE button if current section has rating but hasn't been saved yet
            if (isCurrentSectionCompleted && !hasSavedCurrentSection) {
              return (
                <button
                  key={`save-${buttonAnimationKey}`}
                  onClick={() => {
                    // Mark as saved and advance to next section
                    setHasSavedCurrentSection(true)

                    // Find next unrated section (including deselected ones)
                    let targetIndex = -1

                    // First, try to find an unrated section starting from the next index
                    for (let i = currentSectionIndex + 1; i < wheelSections.length; i++) {
                      if (!sections[wheelSections[i].id]) {
                        targetIndex = i
                        break
                      }
                    }

                    // If no unrated section found after current, check from the beginning
                    if (targetIndex === -1) {
                      for (let i = 0; i < currentSectionIndex; i++) {
                        if (!sections[wheelSections[i].id]) {
                          targetIndex = i
                          break
                        }
                      }
                    }

                    if (targetIndex !== -1) {
                      // Advance to next unrated section
                      setCurrentSectionIndex(targetIndex)
                      setRotationOffset(0)
                      setHasSavedCurrentSection(false) // Reset saved status for new section
                      setTimeout(() => scrollToActiveCard(targetIndex), 100)
                    }
                  }}
                  style={{
                    width: '140px',
                    height: '56px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    borderRadius: '28px',
                    backgroundColor: 'white',
                    boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                    border: '2px solid #3a7ddc',
                    cursor: 'pointer',
                    transition: 'background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease',
                    color: '#3a7ddc',
                    fontSize: '16px',
                    fontWeight: '600',
                    animation: 'circleExpand 0.4s ease-out'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.backgroundColor = '#f8fafc'
                    e.currentTarget.style.borderColor = '#2e6bc7'
                    e.currentTarget.style.color = '#2e6bc7'
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.backgroundColor = 'white'
                    e.currentTarget.style.borderColor = '#3a7ddc'
                    e.currentTarget.style.color = '#3a7ddc'
                  }}
                  aria-label="Save and continue"
                >
                  <span style={{ animation: 'textFadeIn 0.4s ease-out' }}>
                    SAVE
                  </span>
                </button>
              )
            }


            // No button shown by default
            return null
          })()}

          {/* Skip Button */}
          <button
            onClick={() => {
              // If user has completed any sections, send those; otherwise send empty data with skip flag
              const completedSections = Object.values(sections)
              onComplete?.({
                sections: completedSections,
                overall_score: completedSections.length > 0 ? completedSections.reduce((sum, s) => sum + s.mood_numeric, 0) / completedSections.length : 0,
                completed_sections: completedSections.length,
                completed_at: new Date().toISOString(),
                time_to_complete_seconds: Math.round((Date.now() - startTime) / 1000),
                skipped: true,
                hasCompletedSections: completedSections.length > 0
              })
            }}
            style={{
              backgroundColor: 'white',
              border: '2px solid #3a7ddc',
              borderRadius: '50%',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '56px',
              height: '56px',
              boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
              transition: 'all 0.3s ease'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.backgroundColor = '#f8fafc'
              e.currentTarget.style.borderColor = '#2e6bc7'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.backgroundColor = 'white'
              e.currentTarget.style.borderColor = '#3a7ddc'
            }}
            aria-label="Skip to completion"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#3a7ddc' }}>
              <polyline points="9,18 15,12 9,6"></polyline>
            </svg>
          </button>
        </div>
      )}

      {/* Remove the old completion button since we merged the logic above */}
      {false && !finalData && allCompleted && (
        <div className="fixed bottom-0 left-0 right-0 p-8 flex justify-center" style={{ zIndex: 1000 }}>
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

      {/* Yellow swoosh section at bottom */}
      <div className="yellow-swoosh-mobile-hide">
        <YellowSwoosh />
      </div>
    </>
  )
}