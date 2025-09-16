import { useState, useEffect } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { Button } from '../../ui/button'
import { Textarea } from '../../ui/textarea'
import { Progress } from '../../ui/progress'
import { ChevronLeft, ChevronRight, CheckCircle } from 'lucide-react'
import { 
  createWellbeingWheelUsage,
  saveWellbeingWheelSection,
  completeWellbeingWheel
} from '../../../utils/wellbeing/database-helpers'
import { WELLBEING_SECTIONS, type WellbeingSectionName } from '../../../types/database'
import { cn } from '@/components/ui/utils'

interface SectionScore {
  score: number
  notes: string
}

interface WellbeingWheelProps {
  childId: string
  sessionId?: string
  onComplete?: () => void
}

const scoreOptions = [
  { value: 1, emoji: '😢', label: 'Very Bad', color: 'bg-red-500' },
  { value: 2, emoji: '😔', label: 'Bad', color: 'bg-orange-500' },
  { value: 3, emoji: '😐', label: 'Okay', color: 'bg-yellow-500' },
  { value: 4, emoji: '😊', label: 'Good', color: 'bg-green-500' },
  { value: 5, emoji: '😄', label: 'Great', color: 'bg-blue-500' }
]

export function WellbeingWheel({ childId, sessionId, onComplete }: WellbeingWheelProps) {
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0)
  const [sectionScores, setSectionScores] = useState<Record<WellbeingSectionName, SectionScore>>({} as any)
  const [currentScore, setCurrentScore] = useState<number | null>(null)
  const [currentNotes, setCurrentNotes] = useState('')
  const [usageId, setUsageId] = useState<string | null>(null)
  const [isSaving, setIsSaving] = useState(false)
  const [showSummary, setShowSummary] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const currentSection = WELLBEING_SECTIONS[currentSectionIndex]
  const isLastSection = currentSectionIndex === WELLBEING_SECTIONS.length - 1

  useEffect(() => {
    initializeUsage()
  }, [])

  const initializeUsage = async () => {
    try {
      const usage = await createWellbeingWheelUsage(childId, sessionId)
      setUsageId(usage.id)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to initialize')
    }
  }

  const handleScoreSelect = (score: number) => {
    setCurrentScore(score)
  }

  const handleSaveSection = async () => {
    if (!currentScore || !usageId) return
    
    setIsSaving(true)
    setError(null)
    
    try {
      await saveWellbeingWheelSection(
        usageId,
        currentSection.id,
        currentScore,
        currentNotes
      )
      
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
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to save section')
    } finally {
      setIsSaving(false)
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

  const handleComplete = async () => {
    if (!usageId) return
    
    setIsSaving(true)
    setError(null)
    
    try {
      await completeWellbeingWheel(usageId, sessionId)
      if (onComplete) {
        onComplete()
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to complete')
    } finally {
      setIsSaving(false)
    }
  }

  const renderWheel = () => {
    const centerX = 150
    const centerY = 150
    const radius = 100
    const angleStep = (2 * Math.PI) / WELLBEING_SECTIONS.length
    
    return (
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
          const textX = centerX + (radius + 20) * Math.cos(midAngle)
          const textY = centerY + (radius + 20) * Math.sin(midAngle)
          
          const fillColor = score > 0 ? scoreOptions[score - 1].color.replace('bg-', '') : 'gray'
          
          return (
            <g key={section.id}>
              <path
                d={`M ${centerX} ${centerY} L ${x1} ${y1} A ${radius} ${radius} 0 0 1 ${x2} ${y2} Z`}
                fill="none"
                stroke="#e5e7eb"
                strokeWidth="2"
              />
              {score > 0 && (
                <path
                  d={`M ${centerX} ${centerY} L ${ix1} ${iy1} A ${innerRadius} ${innerRadius} 0 0 1 ${ix2} ${iy2} Z`}
                  fill={`var(--${fillColor})`}
                  fillOpacity="0.6"
                  className={cn(fillColor)}
                />
              )}
              <text
                x={textX}
                y={textY}
                textAnchor="middle"
                className="text-xs font-medium fill-gray-700"
                dominantBaseline="middle"
              >
                {section.emoji}
              </text>
            </g>
          )
        })}
        <circle
          cx={centerX}
          cy={centerY}
          r="5"
          fill="#6b7280"
        />
      </svg>
    )
  }

  const renderSectionInput = () => (
    <div className="space-y-6">
      <div className="text-center">
        <div className="text-4xl mb-2">{currentSection.emoji}</div>
        <h3 className="text-xl font-semibold mb-2">{currentSection.label}</h3>
        <p className="text-sm text-gray-600">How is this area of your life going?</p>
      </div>

      <div className="grid grid-cols-5 gap-2">
        {scoreOptions.map((option) => (
          <button
            key={option.value}
            onClick={() => handleScoreSelect(option.value)}
            className={cn(
              "flex flex-col items-center justify-center p-3 rounded-lg transition-all",
              "hover:scale-110",
              currentScore === option.value 
                ? `${option.color} text-white ring-4 ring-offset-2 ring-blue-400 scale-110`
                : "bg-gray-100 hover:bg-gray-200"
            )}
          >
            <span className="text-2xl mb-1">{option.emoji}</span>
            <span className="text-xs font-medium">
              {option.label}
            </span>
          </button>
        ))}
      </div>

      <div className="space-y-2">
        <label className="text-sm font-medium text-gray-700">
          Any thoughts about {currentSection.label.toLowerCase()}? (Optional)
        </label>
        <Textarea
          value={currentNotes}
          onChange={(e) => setCurrentNotes(e.target.value)}
          placeholder="Share your thoughts..."
          className="min-h-[80px] resize-none"
          maxLength={200}
        />
        <p className="text-xs text-gray-500 text-right">
          {currentNotes.length}/200 characters
        </p>
      </div>

      <div className="flex justify-between items-center">
        <Button
          variant="outline"
          onClick={handlePrevious}
          disabled={currentSectionIndex === 0}
        >
          <ChevronLeft className="mr-2 h-4 w-4" />
          Previous
        </Button>
        
        <div className="text-sm text-gray-600">
          Section {currentSectionIndex + 1} of {WELLBEING_SECTIONS.length}
        </div>
        
        <Button
          onClick={handleSaveSection}
          disabled={!currentScore || isSaving}
        >
          {isSaving ? 'Saving...' : isLastSection ? 'Finish' : 'Next'}
          {!isLastSection && <ChevronRight className="ml-2 h-4 w-4" />}
        </Button>
      </div>
    </div>
  )

  const renderSummary = () => {
    const overallScore = Object.values(sectionScores).reduce((sum, s) => sum + s.score, 0) / WELLBEING_SECTIONS.length
    
    return (
      <div className="space-y-6">
        <div className="text-center">
          <h3 className="text-xl font-semibold mb-2">Your Wellbeing Wheel</h3>
          <p className="text-sm text-gray-600">Overall wellbeing score: {overallScore.toFixed(1)}/5</p>
        </div>

        {renderWheel()}

        <div className="space-y-3">
          {WELLBEING_SECTIONS.map(section => {
            const data = sectionScores[section.id]
            if (!data) return null
            
            return (
              <div key={section.id} className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                <span className="text-2xl">{section.emoji}</span>
                <div className="flex-1">
                  <div className="flex items-center justify-between">
                    <span className="font-medium text-sm">{section.label}</span>
                    <span className="text-sm">{scoreOptions[data.score - 1].emoji}</span>
                  </div>
                  {data.notes && (
                    <p className="text-xs text-gray-600 mt-1">{data.notes}</p>
                  )}
                </div>
              </div>
            )
          })}
        </div>

        <div className="flex justify-center">
          <Button
            onClick={handleComplete}
            disabled={isSaving}
            className="bg-green-600 hover:bg-green-700"
          >
            <CheckCircle className="mr-2 h-4 w-4" />
            {isSaving ? 'Completing...' : 'Complete Wellbeing Check'}
          </Button>
        </div>
      </div>
    )
  }

  return (
    <Card className="w-full max-w-2xl mx-auto">
      <CardHeader>
        <div className="space-y-4">
          <CardTitle className="text-2xl text-center">Wellbeing Wheel</CardTitle>
          {!showSummary && (
            <Progress 
              value={((currentSectionIndex + 1) / WELLBEING_SECTIONS.length) * 100} 
              className="w-full"
            />
          )}
        </div>
      </CardHeader>
      <CardContent>
        {error && (
          <div className="mb-4 p-3 bg-red-50 text-red-600 rounded-lg text-sm">
            {error}
          </div>
        )}
        
        {showSummary ? renderSummary() : renderSectionInput()}
      </CardContent>
    </Card>
  )
}