import { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'

// 7 sections as specified in requirements
const WELLBEING_SECTIONS = [
  { id: 'my_friends', label: 'My Friends', emoji: '👥' },
  { id: 'my_work', label: 'My Work', emoji: '📚' },
  { id: 'my_health', label: 'My Health', emoji: '💪' },
  { id: 'my_family', label: 'My Family', emoji: '👨‍👩‍👧‍👦' },
  { id: 'my_fun_play', label: 'My Fun & Play', emoji: '🎮' },
  { id: 'my_safety', label: 'My Safety', emoji: '🛡️' },
  { id: 'my_emotions', label: 'My Emotions', emoji: '❤️' }
]

const scoreOptions = [
  { value: 1, emoji: '😢', label: 'Very Bad', color: 'bg-red-500' },
  { value: 2, emoji: '😔', label: 'Bad', color: 'bg-orange-500' },
  { value: 3, emoji: '😐', label: 'Okay', color: 'bg-yellow-500' },
  { value: 4, emoji: '😊', label: 'Good', color: 'bg-green-500' },
  { value: 5, emoji: '😄', label: 'Great', color: 'bg-blue-500' }
]

interface SectionScore {
  score: number
  notes: string
}

export default function WellbeingWheelFullPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0)
  const [sectionScores, setSectionScores] = useState<Record<string, SectionScore>>({})
  const [currentScore, setCurrentScore] = useState<number | null>(null)
  const [currentNotes, setCurrentNotes] = useState('')
  const [showSummary, setShowSummary] = useState(false)
  const [isSaving, setIsSaving] = useState(false)
  const [isRecording, setIsRecording] = useState(false)
  
  const childId = user?.id || 'demo_child'
  const currentSection = WELLBEING_SECTIONS[currentSectionIndex]
  const isLastSection = currentSectionIndex === WELLBEING_SECTIONS.length - 1

  const handleScoreSelect = (score: number) => {
    setCurrentScore(score)
  }

  const handleSaveSection = () => {
    if (!currentScore) return
    
    setSectionScores(prev => ({
      ...prev,
      [currentSection.id]: { score: currentScore, notes: currentNotes }
    }))
    
    if (isLastSection) {
      setShowSummary(true)
    } else {
      setCurrentSectionIndex(prev => prev + 1)
      setCurrentScore(null)
      setCurrentNotes('')
    }
  }

  const handlePrevious = () => {
    if (currentSectionIndex > 0) {
      const prevSection = WELLBEING_SECTIONS[currentSectionIndex - 1]
      const prevData = sectionScores[prevSection.id]
      if (prevData) {
        setCurrentScore(prevData.score)
        setCurrentNotes(prevData.notes)
      }
      setCurrentSectionIndex(prev => prev - 1)
    }
  }

  const toggleRecording = () => {
    setIsRecording(!isRecording)
    if (!isRecording) {
      // Mock speech-to-text - in real implementation would use Web Speech API
      setCurrentNotes(prev => prev + ' [Voice recording started...]')
      
      // Simulate speech recognition after 3 seconds
      setTimeout(() => {
        setCurrentNotes(prev => prev.replace(' [Voice recording started...]', ' I think this area is going pretty well for me.'))
        setIsRecording(false)
      }, 3000)
    } else {
      setCurrentNotes(prev => prev.replace(' [Voice recording started...]', ' [Recording stopped]'))
    }
  }

  const handleComplete = async () => {
    setIsSaving(true)
    
    try {
      const supabase = getSupabaseClient()
      const overallScore = Object.values(sectionScores).reduce((sum, s) => sum + s.score, 0) / WELLBEING_SECTIONS.length
      
      // Step 1: Save to wellbeing_wheel_usage table
      const { data: usageData, error: usageError } = await supabase
        .from('wellbeing_wheel_usage')
        .insert({
          child_id: childId,
          session_id: null, // Would be actual session ID in real implementation
          completed_at: new Date().toISOString(),
          overall_score: overallScore
        })
        .select()
        .single()
      
      if (usageError) throw usageError
      
      // Step 2: Save to wellbeing_wheel_sections table
      const sectionsData = Object.entries(sectionScores).map(([sectionId, data]) => ({
        usage_id: usageData.id,
        section_name: sectionId,
        score: data.score,
        notes: data.notes || null
      }))
      
      const { error: sectionsError } = await supabase
        .from('wellbeing_wheel_sections')
        .insert(sectionsData)
      
      if (sectionsError) throw sectionsError
      
      console.log('Successfully saved wellbeing wheel to database')
      alert('Wellbeing Wheel completed and saved!')
      navigate('/child/check-in?from=wellbeing-wheel&completed=true')
      
    } catch (err) {
      console.error('Database error:', err)
      alert('Failed to save wellbeing data. Please try again.')
    } finally {
      setIsSaving(false)
    }
  }

  // Visual wheel component
  const renderWheel = () => {
    const centerX = 150
    const centerY = 150
    const radius = 100
    const angleStep = (2 * Math.PI) / WELLBEING_SECTIONS.length
    
    return (
      <div className="flex justify-center mb-8">
        <svg width="300" height="300" className="mx-auto">
          {WELLBEING_SECTIONS.map((section, index) => {
            const startAngle = index * angleStep - Math.PI / 2
            const endAngle = (index + 1) * angleStep - Math.PI / 2
            const score = sectionScores[section.id]?.score || 0
            
            const x1 = centerX + radius * Math.cos(startAngle)
            const y1 = centerY + radius * Math.sin(startAngle)
            const x2 = centerX + radius * Math.cos(endAngle)
            const y2 = centerY + radius * Math.sin(endAngle)
            
            const innerRadius = radius * (score / 5)
            const ix1 = centerX + innerRadius * Math.cos(startAngle)
            const iy1 = centerY + innerRadius * Math.sin(startAngle)
            const ix2 = centerX + innerRadius * Math.cos(endAngle)
            const iy2 = centerY + innerRadius * Math.sin(endAngle)
            
            const midAngle = (startAngle + endAngle) / 2
            const textX = centerX + (radius + 25) * Math.cos(midAngle)
            const textY = centerY + (radius + 25) * Math.sin(midAngle)
            
            const fillColor = score > 0 ? scoreOptions[score - 1].color.replace('bg-', '') : 'gray-200'
            
            return (
              <g key={section.id}>
                {/* Outer circle segment */}
                <path
                  d={`M ${centerX} ${centerY} L ${x1} ${y1} A ${radius} ${radius} 0 0 1 ${x2} ${y2} Z`}
                  fill="#e5e7eb"
                  stroke="#d1d5db"
                  strokeWidth="2"
                />
                {/* Filled segment based on score */}
                {score > 0 && (
                  <path
                    d={`M ${centerX} ${centerY} L ${ix1} ${iy1} A ${innerRadius} ${innerRadius} 0 0 1 ${ix2} ${iy2} Z`}
                    className={fillColor}
                    fillOpacity="0.8"
                  />
                )}
                {/* Section emoji */}
                <text
                  x={textX}
                  y={textY}
                  textAnchor="middle"
                  className="text-xl"
                  dominantBaseline="middle"
                >
                  {section.emoji}
                </text>
              </g>
            )
          })}
          {/* Center circle */}
          <circle
            cx={centerX}
            cy={centerY}
            r="8"
            fill="#6b7280"
          />
        </svg>
      </div>
    )
  }

  if (showSummary) {
    const overallScore = Object.values(sectionScores).reduce((sum, s) => sum + s.score, 0) / WELLBEING_SECTIONS.length
    
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 p-4 sm:p-8">
        <div className="max-w-3xl mx-auto">
          <div className="bg-white rounded-lg shadow-lg p-8">
            <div className="text-center mb-8">
              <h1 className="text-3xl font-bold text-gray-800 mb-4">Your Wellbeing Wheel</h1>
              <p className="text-xl text-gray-600">
                Overall wellbeing score: <span className="font-bold text-blue-600">{overallScore.toFixed(1)}/5</span>
              </p>
            </div>

            {renderWheel()}

            <div className="space-y-4 mb-8">
              {WELLBEING_SECTIONS.map(section => {
                const data = sectionScores[section.id]
                if (!data) return null
                
                return (
                  <div key={section.id} className="flex items-start gap-4 p-4 bg-gray-50 rounded-lg">
                    <span className="text-3xl">{section.emoji}</span>
                    <div className="flex-1">
                      <div className="flex items-center justify-between mb-2">
                        <span className="font-semibold text-gray-800">{section.label}</span>
                        <div className="flex items-center gap-2">
                          <span className="text-2xl">{scoreOptions[data.score - 1].emoji}</span>
                          <span className="text-sm font-medium text-gray-600">
                            {data.score}/5
                          </span>
                        </div>
                      </div>
                      {data.notes && (
                        <p className="text-sm text-gray-600 italic">"{data.notes}"</p>
                      )}
                    </div>
                  </div>
                )
              })}
            </div>

            <div className="text-center">
              <button
                onClick={handleComplete}
                disabled={isSaving}
                className="bg-green-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:bg-green-700 disabled:bg-green-400 transition-colors"
              >
                {isSaving ? 'Saving...' : '✓ Complete Wellbeing Check'}
              </button>
            </div>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 p-4 sm:p-8">
      <div className="max-w-2xl mx-auto">
        <div className="bg-white rounded-lg shadow-lg p-8">
          {/* Header with progress */}
          <div className="text-center mb-8">
            <h1 className="text-3xl font-bold text-gray-800 mb-4">Wellbeing Wheel</h1>
            <div className="flex items-center justify-center gap-4 mb-4">
              <span className="text-sm font-medium text-gray-600">
                Section {currentSectionIndex + 1} of {WELLBEING_SECTIONS.length}
              </span>
              <div className="w-32 bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-green-600 h-2 rounded-full transition-all duration-300"
                  style={{ width: `${((currentSectionIndex + 1) / WELLBEING_SECTIONS.length) * 100}%` }}
                />
              </div>
            </div>
          </div>

          {/* Current section */}
          <div className="text-center mb-8">
            <div className="text-6xl mb-4">{currentSection.emoji}</div>
            <h2 className="text-2xl font-bold text-gray-800 mb-2">{currentSection.label}</h2>
            <p className="text-gray-600">How is this area of your life going?</p>
          </div>

          {/* Score selection */}
          <div className="grid grid-cols-5 gap-3 mb-6">
            {scoreOptions.map((option) => (
              <button
                key={option.value}
                onClick={() => handleScoreSelect(option.value)}
                className={`flex flex-col items-center justify-center p-4 rounded-lg transition-all ${
                  currentScore === option.value 
                    ? `${option.color} text-white ring-4 ring-offset-2 ring-blue-400 scale-105`
                    : "bg-gray-100 hover:bg-gray-200 hover:scale-105"
                }`}
              >
                <span className="text-3xl mb-2">{option.emoji}</span>
                <span className={`text-xs font-medium ${
                  currentScore === option.value ? "text-white" : "text-gray-700"
                }`}>
                  {option.label}
                </span>
              </button>
            ))}
          </div>

          {/* Optional notes with speech-to-text */}
          <div className="space-y-3 mb-6">
            <label className="block text-sm font-medium text-gray-700">
              Any thoughts about {currentSection.label.toLowerCase()}? (Optional)
            </label>
            <textarea
              value={currentNotes}
              onChange={(e) => setCurrentNotes(e.target.value.slice(0, 200))}
              placeholder="Share your thoughts... or use voice input"
              className="w-full h-20 p-3 border-2 border-gray-200 rounded-lg resize-none focus:border-green-400 focus:outline-none"
              maxLength={200}
            />
            <div className="flex justify-between items-center">
              <div className="flex items-center gap-3">
                <button
                  onClick={toggleRecording}
                  className={`flex items-center gap-2 px-4 py-2 rounded-lg border transition-colors ${
                    isRecording 
                      ? "bg-red-50 border-red-300 text-red-700" 
                      : "bg-gray-50 border-gray-300 text-gray-700 hover:bg-gray-100"
                  }`}
                >
                  {isRecording ? '🎤' : '🎙️'}
                  {isRecording ? 'Recording...' : 'Voice Input'}
                </button>
                {isRecording && (
                  <span className="text-sm text-red-600 animate-pulse">● Recording...</span>
                )}
              </div>
              <p className="text-xs text-gray-500">
                {currentNotes.length}/200 characters
              </p>
            </div>
          </div>

          {/* Navigation */}
          <div className="flex justify-between items-center">
            <button
              onClick={handlePrevious}
              disabled={currentSectionIndex === 0}
              className="bg-gray-300 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-400 disabled:bg-gray-200 disabled:text-gray-400 transition-colors"
            >
              ← Previous
            </button>
            
            <button
              onClick={handleSaveSection}
              disabled={!currentScore}
              className="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 disabled:bg-gray-300 transition-colors"
            >
              {isLastSection ? 'Finish' : 'Next →'}
            </button>
          </div>

          {/* Back navigation */}
          <div className="text-center mt-8 pt-6 border-t">
            <button 
              onClick={() => navigate('/child/check-in')}
              className="text-gray-500 hover:text-gray-700 transition-colors"
            >
              ← Back to Check-in Hub
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}