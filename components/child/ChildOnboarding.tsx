import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'

export function ChildOnboarding() {
  const [step, setStep] = useState(1)
  const [selectedAvatar, setSelectedAvatar] = useState('🌟')
  const navigate = useNavigate()

  const avatarOptions = ['🌟', '🌈', '🦋', '🌺', '🐛', '🌱', '🎨', '🎭']

  const handleNext = () => {
    if (step < 4) {
      setStep(step + 1)
    } else {
      navigate('/child/home')
    }
  }

  const handlePrevious = () => {
    if (step > 1) {
      setStep(step - 1)
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-100 to-gray-200 flex items-center justify-center p-4">
      <div className="max-w-md w-full">
        {step === 1 && (
          <Card className="text-center">
            <CardHeader>
              <div className="text-6xl mb-4">🌈</div>
              <CardTitle className="text-2xl">Welcome to The Lift!</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-gray-600 mb-6">
                Hi there! I'm so excited you're here. Let's set up your special space together!
              </p>
              <Button onClick={handleNext} className="w-full text-lg py-3">
                Let's Start! 🚀
              </Button>
            </CardContent>
          </Card>
        )}

        {step === 2 && (
          <Card className="text-center">
            <CardHeader>
              <CardTitle className="text-2xl">Choose Your Avatar</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-gray-600 mb-6">
                Pick your favourite character to represent you!
              </p>
              <div className="grid grid-cols-4 gap-4 mb-6">
                {avatarOptions.map((avatar) => (
                  <button
                    key={avatar}
                    onClick={() => setSelectedAvatar(avatar)}
                    className={`text-4xl p-4 rounded-lg border-2 transition-all ${
                      selectedAvatar === avatar
                        ? 'border-gray-500 bg-gray-100'
                        : 'border-gray-300 hover:border-gray-400'
                    }`}
                  >
                    {avatar}
                  </button>
                ))}
              </div>
              <div className="flex space-x-4">
                <Button variant="outline" onClick={handlePrevious} className="flex-1">
                  Back
                </Button>
                <Button onClick={handleNext} className="flex-1">
                  I Like This One!
                </Button>
              </div>
            </CardContent>
          </Card>
        )}

        {step === 3 && (
          <Card className="text-center">
            <CardHeader>
              <div className="text-6xl mb-4">{selectedAvatar}</div>
              <CardTitle className="text-2xl">Perfect Choice!</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-gray-600 mb-6">
                Your avatar looks amazing! Now let me tell you about the fun things you can do here.
              </p>
              <div className="space-y-4 text-left mb-6">
                <div className="flex items-center space-x-3">
                  <span className="text-2xl">🎯</span>
                  <span>Complete daily check-ins</span>
                </div>
                <div className="flex items-center space-x-3">
                  <span className="text-2xl">🌱</span>
                  <span>Grow your digital garden</span>
                </div>
                <div className="flex items-center space-x-3">
                  <span className="text-2xl">⭐</span>
                  <span>Collect stickers and rewards</span>
                </div>
                <div className="flex items-center space-x-3">
                  <span className="text-2xl">👥</span>
                  <span>Connect with friends safely</span>
                </div>
              </div>
              <div className="flex space-x-4">
                <Button variant="outline" onClick={handlePrevious} className="flex-1">
                  Back
                </Button>
                <Button onClick={handleNext} className="flex-1">
                  Sounds Great!
                </Button>
              </div>
            </CardContent>
          </Card>
        )}

        {step === 4 && (
          <Card className="text-center">
            <CardHeader>
              <div className="text-6xl mb-4">🎉</div>
              <CardTitle className="text-2xl">You're All Set!</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-gray-600 mb-6">
                Congratulations! Your special space is ready. Let's start your wellbeing journey!
              </p>
              <div className="bg-gray-100 rounded-lg p-4 mb-6">
                <div className="text-4xl mb-2">{selectedAvatar}</div>
                <p className="text-sm text-gray-600">This is you!</p>
              </div>
              <Button onClick={handleNext} className="w-full text-lg py-3">
                Enter My Space! ✨
              </Button>
            </CardContent>
          </Card>
        )}
      </div>
    </div>
  )
}