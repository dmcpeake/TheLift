import React from 'react'
import { useNavigate } from 'react-router-dom'
import { BreathingCircles } from './BreathingCircles'

export function BreathingRoute() {
  const navigate = useNavigate()

  const handleComplete = () => {
    // Navigate to the wellbeing wheel after breathing exercise
    navigate('/child/check-in/wheel')
  }

  const handleExit = (reason: 'skip' | 'close') => {
    if (reason === 'skip') {
      // If skipped, still go to wellbeing wheel
      navigate('/child/check-in/wheel')
    } else {
      // If closed, go back to home
      navigate('/child/home')
    }
  }

  return (
    <BreathingCircles
      cycles={5}
      muted={false} // Default to sound on for child experience
      captions={true}
      onComplete={handleComplete}
      onExit={handleExit}
    />
  )
}