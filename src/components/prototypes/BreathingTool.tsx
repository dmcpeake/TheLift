import React, { useState, useEffect, useRef } from 'react'

interface BreathingData {
  pattern: string
  duration_seconds: number
  cycles_completed: number
  started_at: string
  completed_at: string
  interruptions: number
}

export function BreathingTool() {
  const [isActive, setIsActive] = useState(false)
  const [seconds, setSeconds] = useState(0)
  const [cycles, setCycles] = useState(0)
  const [selectedPattern, setSelectedPattern] = useState('box')
  const [phase, setPhase] = useState('inhale')
  const [interruptions, setInterruptions] = useState(0)
  const [finalData, setFinalData] = useState<BreathingData | null>(null)
  const startTimeRef = useRef<string>('')

  const patterns = [
    { id: 'box', name: 'Box Breathing', description: '4-4-4-4', icon: '📦' },
    { id: '478', name: '4-7-8 Breathing', description: '4-7-8', icon: '😴' },
    { id: 'belly', name: 'Belly Breathing', description: '3-2-5', icon: '🫁' },
    { id: 'quick', name: 'Quick Calm', description: '2-2-2', icon: '⚡' }
  ]

  const phaseColors = {
    inhale: 'bg-blue-500',
    hold: 'bg-purple-500',
    exhale: 'bg-green-500',
    pause: 'bg-gray-500'
  }

  useEffect(() => {
    let interval: NodeJS.Timeout | null = null

    if (isActive) {
      interval = setInterval(() => {
        setSeconds(seconds => seconds + 1)

        // Simulate cycle counting (every 10 seconds for demo)
        if ((seconds + 1) % 10 === 0) {
          setCycles(c => c + 1)
        }

        // Simulate phase changes
        const phaseOrder = ['inhale', 'hold', 'exhale', 'pause']
        const currentIndex = phaseOrder.indexOf(phase)
        if ((seconds + 1) % 3 === 0) {
          setPhase(phaseOrder[(currentIndex + 1) % 4])
        }
      }, 1000)
    } else if (!isActive && seconds !== 0) {
      if (interval) clearInterval(interval)
    }

    return () => {
      if (interval) clearInterval(interval)
    }
  }, [isActive, seconds, phase])

  const handleStart = () => {
    setIsActive(true)
    setSeconds(0)
    setCycles(0)
    setPhase('inhale')
    setInterruptions(0)
    startTimeRef.current = new Date().toISOString()
    setFinalData(null)

    console.log('🌬️ BREATHING SESSION STARTED:', {
      pattern: selectedPattern,
      started_at: startTimeRef.current
    })
  }

  const handlePause = () => {
    setIsActive(false)
    setInterruptions(interruptions + 1)
    console.log('⏸️ BREATHING SESSION PAUSED')
  }

  const handleResume = () => {
    setIsActive(true)
    console.log('▶️ BREATHING SESSION RESUMED')
  }

  const handleStop = () => {
    setIsActive(false)

    const data: BreathingData = {
      pattern: patterns.find(p => p.id === selectedPattern)?.name || selectedPattern,
      duration_seconds: seconds,
      cycles_completed: cycles,
      started_at: startTimeRef.current,
      completed_at: new Date().toISOString(),
      interruptions: interruptions
    }

    console.log('🎯 BREATHING SESSION COMPLETE:', data)
    setFinalData(data)
  }

  const handleReset = () => {
    setIsActive(false)
    setSeconds(0)
    setCycles(0)
    setPhase('inhale')
    setInterruptions(0)
    setFinalData(null)
  }

  const formatTime = (totalSeconds: number) => {
    const mins = Math.floor(totalSeconds / 60)
    const secs = totalSeconds % 60
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`
  }

  return (
    <div className="p-6 bg-white rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-4">Breathing Tool Prototype</h2>

      {!finalData ? (
        <>
          {/* Pattern Selection */}
          {!isActive && seconds === 0 && (
            <div className="mb-6">
              <h3 className="text-lg font-semibold mb-3">Select a breathing pattern:</h3>
              <div className="grid grid-cols-2 gap-3">
                {patterns.map((pattern) => (
                  <button
                    key={pattern.id}
                    onClick={() => setSelectedPattern(pattern.id)}
                    className={`p-3 rounded-lg border-2 transition-all ${
                      selectedPattern === pattern.id
                        ? 'border-blue-500 bg-blue-50'
                        : 'border-gray-200 hover:border-gray-300'
                    }`}
                  >
                    <div className="flex items-center gap-2">
                      <span className="text-2xl">{pattern.icon}</span>
                      <div className="text-left">
                        <p className="font-medium">{pattern.name}</p>
                        <p className="text-xs text-gray-500">{pattern.description}</p>
                      </div>
                    </div>
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* Active Session Display */}
          {(isActive || seconds > 0) && (
            <div className="mb-6">
              <div className="text-center mb-4">
                <div className="text-5xl font-bold mb-2">{formatTime(seconds)}</div>
                <div className="text-gray-600">
                  Pattern: {patterns.find(p => p.id === selectedPattern)?.name}
                </div>
              </div>

              {/* Breathing Indicator */}
              <div className="flex justify-center mb-4">
                <div className={`w-32 h-32 rounded-full flex items-center justify-center text-white font-bold text-xl transition-all ${phaseColors[phase as keyof typeof phaseColors]}`}>
                  {phase.toUpperCase()}
                </div>
              </div>

              {/* Stats */}
              <div className="grid grid-cols-3 gap-4 text-center mb-4">
                <div>
                  <p className="text-2xl font-bold">{cycles}</p>
                  <p className="text-xs text-gray-500">Cycles</p>
                </div>
                <div>
                  <p className="text-2xl font-bold">{interruptions}</p>
                  <p className="text-xs text-gray-500">Pauses</p>
                </div>
                <div>
                  <p className="text-2xl font-bold">{Math.round(seconds / 60)}</p>
                  <p className="text-xs text-gray-500">Minutes</p>
                </div>
              </div>
            </div>
          )}

          {/* Control Buttons */}
          <div className="flex gap-3 justify-center">
            {!isActive && seconds === 0 ? (
              <button
                onClick={handleStart}
                className="px-8 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600 font-semibold"
              >
                Start Breathing
              </button>
            ) : isActive ? (
              <>
                <button
                  onClick={handlePause}
                  className="px-6 py-2 bg-yellow-500 text-white rounded-lg hover:bg-yellow-600"
                >
                  Pause
                </button>
                <button
                  onClick={handleStop}
                  className="px-6 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600"
                >
                  Stop & Save
                </button>
              </>
            ) : (
              <>
                <button
                  onClick={handleResume}
                  className="px-6 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600"
                >
                  Resume
                </button>
                <button
                  onClick={handleStop}
                  className="px-6 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600"
                >
                  Stop & Save
                </button>
                <button
                  onClick={handleReset}
                  className="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600"
                >
                  Reset
                </button>
              </>
            )}
          </div>
        </>
      ) : (
        <div>
          <h3 className="text-lg font-semibold mb-2">✅ Session Complete!</h3>
          <div className="mb-4 p-4 bg-blue-50 rounded-lg">
            <p className="text-lg">Great job! You breathed for <strong>{formatTime(finalData.duration_seconds)}</strong></p>
          </div>
          <h4 className="font-medium mb-2">📊 Data Captured:</h4>
          <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-sm mb-4">
            {JSON.stringify(finalData, null, 2)}
          </pre>
          <p className="text-xs text-gray-500 mb-4">
            ✅ This data would be sent to: /api/breathing-sessions
          </p>
          <button
            onClick={handleReset}
            className="px-6 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600"
          >
            Start New Session
          </button>
        </div>
      )}
    </div>
  )
}