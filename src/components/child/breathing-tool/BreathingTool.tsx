import { useState, useEffect, useRef } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { Button } from '../../ui/button'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../../ui/select'
import { Play, Pause, RotateCcw, CheckCircle } from 'lucide-react'
import { saveBreathingTool } from '../../../utils/wellbeing/database-helpers'
import { cn } from '@/components/ui/utils'

interface BreathingPattern {
  id: string
  name: string
  inhale: number
  hold: number
  exhale: number
  description: string
}

const breathingPatterns: BreathingPattern[] = [
  { id: '4-7-8', name: '4-7-8 Breathing', inhale: 4, hold: 7, exhale: 8, description: 'Calming and relaxing' },
  { id: 'box', name: 'Box Breathing', inhale: 4, hold: 4, exhale: 4, description: 'Focus and clarity' },
  { id: 'belly', name: 'Belly Breathing', inhale: 5, hold: 2, exhale: 5, description: 'Deep relaxation' },
  { id: '5-5-5', name: 'Equal Breathing', inhale: 5, hold: 5, exhale: 5, description: 'Balance and harmony' }
]

interface BreathingToolProps {
  childId: string
  sessionId?: string
  onComplete?: () => void
}

export function BreathingTool({ childId, sessionId, onComplete }: BreathingToolProps) {
  const [selectedPattern, setSelectedPattern] = useState<BreathingPattern>(breathingPatterns[0])
  const [isRunning, setIsRunning] = useState(false)
  const [isPaused, setIsPaused] = useState(false)
  const [currentPhase, setCurrentPhase] = useState<'inhale' | 'hold' | 'exhale' | 'ready'>('ready')
  const [countdown, setCountdown] = useState(0)
  const [cyclesCompleted, setCyclesCompleted] = useState(0)
  const [sessionDuration, setSessionDuration] = useState(0)
  const [isSaving, setIsSaving] = useState(false)
  const [saved, setSaved] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [buttonAnimationKey, setButtonAnimationKey] = useState(0)
  
  const intervalRef = useRef<NodeJS.Timeout>()
  const startTimeRef = useRef<number>()
  const durationIntervalRef = useRef<NodeJS.Timeout>()

  // Trigger button animation when conditions change
  useEffect(() => {
    setButtonAnimationKey(prev => prev + 1)
  }, [isRunning, saved])

  useEffect(() => {
    if (isRunning && !isPaused) {
      runBreathingCycle()
    } else {
      if (intervalRef.current) {
        clearInterval(intervalRef.current)
      }
    }
    
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current)
      if (durationIntervalRef.current) clearInterval(durationIntervalRef.current)
    }
  }, [isRunning, isPaused, currentPhase, selectedPattern])

  const runBreathingCycle = () => {
    let timeLeft = 0
    let nextPhase: typeof currentPhase = 'ready'
    
    switch (currentPhase) {
      case 'ready':
        nextPhase = 'inhale'
        timeLeft = selectedPattern.inhale
        break
      case 'inhale':
        nextPhase = 'hold'
        timeLeft = selectedPattern.hold
        break
      case 'hold':
        nextPhase = 'exhale'
        timeLeft = selectedPattern.exhale
        break
      case 'exhale':
        nextPhase = 'inhale'
        timeLeft = selectedPattern.inhale
        setCyclesCompleted(prev => prev + 1)
        break
    }
    
    setCurrentPhase(nextPhase)
    setCountdown(timeLeft)
    
    if (intervalRef.current) clearInterval(intervalRef.current)
    
    intervalRef.current = setInterval(() => {
      setCountdown(prev => {
        if (prev <= 1) {
          return 0
        }
        return prev - 1
      })
    }, 1000)
  }

  const handleStart = () => {
    setIsRunning(true)
    setIsPaused(false)
    setSaved(false)
    setCurrentPhase('ready')
    setCyclesCompleted(0)
    setSessionDuration(0)
    startTimeRef.current = Date.now()
    
    durationIntervalRef.current = setInterval(() => {
      setSessionDuration(Math.floor((Date.now() - (startTimeRef.current || Date.now())) / 1000))
    }, 1000)
  }

  const handlePause = () => {
    setIsPaused(!isPaused)
  }

  const handleStop = async () => {
    setIsRunning(false)
    setIsPaused(false)
    setCurrentPhase('ready')
    setCountdown(0)
    
    if (intervalRef.current) clearInterval(intervalRef.current)
    if (durationIntervalRef.current) clearInterval(durationIntervalRef.current)
    
    if (cyclesCompleted > 0 && !saved) {
      await saveSession()
    }
  }

  const handleReset = () => {
    setIsRunning(false)
    setIsPaused(false)
    setCurrentPhase('ready')
    setCountdown(0)
    setCyclesCompleted(0)
    setSessionDuration(0)
    setSaved(false)
    
    if (intervalRef.current) clearInterval(intervalRef.current)
    if (durationIntervalRef.current) clearInterval(durationIntervalRef.current)
  }

  const saveSession = async () => {
    if (cyclesCompleted === 0) return
    
    setIsSaving(true)
    setError(null)
    
    try {
      await saveBreathingTool(
        childId,
        sessionDuration,
        cyclesCompleted,
        selectedPattern.name,
        sessionId
      )
      setSaved(true)
      if (onComplete) {
        onComplete()
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to save session')
    } finally {
      setIsSaving(false)
    }
  }

  const getPhaseColor = () => {
    switch (currentPhase) {
      case 'inhale': return 'bg-blue-500'
      case 'hold': return 'bg-purple-500'
      case 'exhale': return 'bg-green-500'
      default: return 'bg-gray-300'
    }
  }

  const getPhaseInstruction = () => {
    switch (currentPhase) {
      case 'inhale': return 'Breathe In'
      case 'hold': return 'Hold'
      case 'exhale': return 'Breathe Out'
      default: return 'Ready to start'
    }
  }

  const circleScale = isRunning && !isPaused ? (currentPhase === 'inhale' ? 1.3 : currentPhase === 'exhale' ? 0.7 : 1) : 1

  return (
    <>
      <style jsx>{`
        @keyframes breathingToolExpand {
          0% {
            width: 80px;
            min-width: 80px;
          }
          100% {
            width: 120px;
            min-width: 120px;
          }
        }
        @keyframes breathingToolTextFadeIn {
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
      <Card className="w-full max-w-2xl mx-auto">
      <CardHeader>
        <CardTitle className="text-2xl text-center">Breathing Exercise</CardTitle>
      </CardHeader>
      <CardContent className="space-y-6">
        {!isRunning && (
          <div className="space-y-4">
            <div>
              <label className="text-sm font-medium mb-2 block">Choose your breathing pattern:</label>
              <Select
                value={selectedPattern.id}
                onValueChange={(value) => {
                  const pattern = breathingPatterns.find(p => p.id === value)
                  if (pattern) setSelectedPattern(pattern)
                }}
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  {breathingPatterns.map(pattern => (
                    <SelectItem key={pattern.id} value={pattern.id}>
                      <div>
                        <div className="font-medium">{pattern.name}</div>
                        <div className="text-xs text-gray-500">{pattern.description}</div>
                      </div>
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
            
            <div className="p-4 bg-blue-50 rounded-lg">
              <p className="text-sm font-medium mb-2">Pattern: {selectedPattern.name}</p>
              <p className="text-xs text-gray-600">
                Breathe in for {selectedPattern.inhale}s, hold for {selectedPattern.hold}s, breathe out for {selectedPattern.exhale}s
              </p>
            </div>
          </div>
        )}

        <div className="flex flex-col items-center justify-center py-8">
          <div className="relative">
            <div
              className={cn(
                "w-32 h-32 rounded-full transition-all duration-1000 flex items-center justify-center",
                getPhaseColor(),
                isRunning && !isPaused && "animate-pulse"
              )}
              style={{
                transform: `scale(${circleScale})`,
                transition: currentPhase === 'inhale' ? `transform ${selectedPattern.inhale}s ease-out` :
                          currentPhase === 'exhale' ? `transform ${selectedPattern.exhale}s ease-in` :
                          'transform 0.5s ease-in-out'
              }}
            >
              <div className="text-white text-center">
                <div className="text-3xl font-bold">{countdown || ''}</div>
                {isRunning && (
                  <div className="text-xs mt-1">{getPhaseInstruction()}</div>
                )}
              </div>
            </div>
          </div>
          
          {isRunning && (
            <div className="mt-8 text-center space-y-2">
              <p className="text-lg font-medium">{getPhaseInstruction()}</p>
              <p className="text-sm text-gray-600">Cycles: {cyclesCompleted}</p>
              <p className="text-xs text-gray-500">Duration: {Math.floor(sessionDuration / 60)}:{(sessionDuration % 60).toString().padStart(2, '0')}</p>
            </div>
          )}
        </div>

        <div className="flex justify-center gap-3">
          {!isRunning ? (
            <>
              <Button
                key={`start-${buttonAnimationKey}`}
                onClick={handleStart}
                className="min-w-[120px]"
                style={{
                  animation: 'breathingToolExpand 0.4s ease-out'
                }}
              >
                <Play className="mr-2 h-4 w-4" style={{ animation: 'breathingToolTextFadeIn 0.4s ease-out' }} />
                <span style={{ animation: 'breathingToolTextFadeIn 0.4s ease-out' }}>
                  Start
                </span>
              </Button>
              {saved && (
                <Button
                  key={`new-session-${buttonAnimationKey}`}
                  onClick={handleReset}
                  variant="outline"
                  style={{
                    animation: 'breathingToolExpand 0.4s ease-out'
                  }}
                >
                  <RotateCcw className="mr-2 h-4 w-4" style={{ animation: 'breathingToolTextFadeIn 0.4s ease-out' }} />
                  <span style={{ animation: 'breathingToolTextFadeIn 0.4s ease-out' }}>
                    New Session
                  </span>
                </Button>
              )}
            </>
          ) : (
            <>
              <Button onClick={handlePause} variant="outline">
                {isPaused ? <Play className="mr-2 h-4 w-4" /> : <Pause className="mr-2 h-4 w-4" />}
                {isPaused ? 'Resume' : 'Pause'}
              </Button>
              <Button onClick={handleStop} variant="destructive">
                Stop & Save
              </Button>
            </>
          )}
        </div>

        {saved && (
          <div className="p-4 bg-green-50 rounded-lg text-center">
            <CheckCircle className="h-5 w-5 text-green-600 mx-auto mb-2" />
            <p className="text-sm font-medium text-green-700">Session saved successfully!</p>
            <p className="text-xs text-green-600 mt-1">
              {cyclesCompleted} cycles completed in {Math.floor(sessionDuration / 60)}:{(sessionDuration % 60).toString().padStart(2, '0')}
            </p>
          </div>
        )}

        {error && (
          <div className="p-4 bg-red-50 rounded-lg">
            <p className="text-sm text-red-600">Error: {error}</p>
          </div>
        )}
      </CardContent>
    </Card>
    </>
  )
}