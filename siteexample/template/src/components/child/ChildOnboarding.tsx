import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Badge } from '../ui/badge'
import { 
  Sparkles, 
  Heart, 
  Star, 
  Smile, 
  ArrowRight, 
  Check,
  Palette,
  User
} from 'lucide-react'

export function ChildOnboarding() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [currentStep, setCurrentStep] = useState(1)
  const [loading, setLoading] = useState(false)

  const [onboardingData, setOnboardingData] = useState({
    favoriteColor: '',
    favoriteAnimals: [] as string[],
    interests: [] as string[],
    avatarStyle: 'gradient'
  })

  const colors = [
    { name: 'Blue', value: 'blue', bg: 'bg-blue-400' },
    { name: 'Purple', value: 'purple', bg: 'bg-purple-400' },
    { name: 'Pink', value: 'pink', bg: 'bg-pink-400' },
    { name: 'Green', value: 'green', bg: 'bg-green-400' },
    { name: 'Yellow', value: 'yellow', bg: 'bg-yellow-400' },
    { name: 'Orange', value: 'orange', bg: 'bg-orange-400' }
  ]

  const animals = [
    '🐶 Dog', '🐱 Cat', '🐰 Rabbit', '🦋 Butterfly', 
    '🐸 Frog', '🐧 Penguin', '🦄 Unicorn', '🐢 Turtle',
    '🦊 Fox', '🐨 Koala', '🐵 Monkey', '🐺 Wolf'
  ]

  const interests = [
    '🎨 Art', '📚 Reading', '🎵 Music', '⚽ Sports',
    '🎮 Games', '🧩 Puzzles', '🔬 Science', '🌱 Nature',
    '🍳 Cooking', '📷 Photography', '💃 Dancing', '🎭 Drama'
  ]

  const handleColorSelect = (color: string) => {
    setOnboardingData(prev => ({ ...prev, favoriteColor: color }))
  }

  const handleAnimalToggle = (animal: string) => {
    setOnboardingData(prev => ({
      ...prev,
      favoriteAnimals: prev.favoriteAnimals.includes(animal)
        ? prev.favoriteAnimals.filter(a => a !== animal)
        : [...prev.favoriteAnimals, animal].slice(0, 3) // Max 3 animals
    }))
  }

  const handleInterestToggle = (interest: string) => {
    setOnboardingData(prev => ({
      ...prev,
      interests: prev.interests.includes(interest)
        ? prev.interests.filter(i => i !== interest)
        : [...prev.interests, interest].slice(0, 4) // Max 4 interests
    }))
  }

  const handleComplete = async () => {
    setLoading(true)
    try {
      // Simulate saving onboarding data
      await new Promise(resolve => setTimeout(resolve, 1500))
      
      // Navigate to child home
      navigate('/child/home')
    } catch (error) {
      console.error('Error completing onboarding:', error)
    } finally {
      setLoading(false)
    }
  }

  const getProgressPercentage = () => {
    return (currentStep / 4) * 100
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-100 via-purple-50 to-pink-100">
      <div className="max-w-2xl mx-auto p-6">
        {/* Progress Header */}
        <div className="mb-8">
          <div className="flex items-center justify-between mb-4">
            <h1 className="text-2xl font-bold text-gray-800">Welcome to The Lift! ✨</h1>
            <Badge className="bg-blue-100 text-blue-800">
              Step {currentStep} of 4
            </Badge>
          </div>
          <div className="w-full bg-gray-200 rounded-full h-3">
            <div 
              className="bg-gradient-to-r from-blue-500 to-purple-600 h-3 rounded-full transition-all duration-500"
              style={{ width: `${getProgressPercentage()}%` }}
            />
          </div>
        </div>

        {/* Step 1: Welcome */}
        {currentStep === 1 && (
          <Card className="bg-white/80 backdrop-blur-sm border-0 shadow-xl">
            <CardContent className="p-8 text-center">
              <div className="w-24 h-24 bg-gradient-to-r from-blue-400 to-purple-500 rounded-full flex items-center justify-center mx-auto mb-6">
                <Sparkles className="h-12 w-12 text-white" />
              </div>
              <h2 className="text-3xl font-bold text-gray-800 mb-4">
                Hi {user?.profile.name}! 👋
              </h2>
              <p className="text-lg text-gray-600 mb-8">
                I'm so excited you're here! Let's set up your profile so I can learn more about you. 
                This will help make your experience extra special!
              </p>
              <Button 
                onClick={() => setCurrentStep(2)}
                className="bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white px-8 py-3 text-lg rounded-full shadow-lg transform hover:scale-105 transition-all"
              >
                Let's Get Started!
                <ArrowRight className="h-5 w-5 ml-2" />
              </Button>
            </CardContent>
          </Card>
        )}

        {/* Step 2: Favorite Color */}
        {currentStep === 2 && (
          <Card className="bg-white/80 backdrop-blur-sm border-0 shadow-xl">
            <CardHeader className="text-center">
              <div className="w-16 h-16 bg-gradient-to-r from-pink-400 to-purple-500 rounded-full flex items-center justify-center mx-auto mb-4">
                <Palette className="h-8 w-8 text-white" />
              </div>
              <CardTitle className="text-2xl text-gray-800">What's Your Favorite Color?</CardTitle>
              <p className="text-gray-600">Choose the color that makes you happiest!</p>
            </CardHeader>
            <CardContent className="p-8">
              <div className="grid grid-cols-3 gap-4 mb-8">
                {colors.map((color) => (
                  <button
                    key={color.value}
                    onClick={() => handleColorSelect(color.value)}
                    className={`
                      ${color.bg} rounded-lg p-4 text-white font-bold text-lg shadow-lg 
                      transform transition-all hover:scale-105 hover:shadow-xl
                      ${onboardingData.favoriteColor === color.value ? 'ring-4 ring-white ring-offset-2' : ''}
                    `}
                  >
                    {color.name}
                    {onboardingData.favoriteColor === color.value && (
                      <Check className="h-5 w-5 mx-auto mt-2" />
                    )}
                  </button>
                ))}
              </div>
              <div className="flex justify-between">
                <Button 
                  variant="outline" 
                  onClick={() => setCurrentStep(1)}
                  className="px-6"
                >
                  Back
                </Button>
                <Button 
                  onClick={() => setCurrentStep(3)}
                  disabled={!onboardingData.favoriteColor}
                  className="bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white px-6"
                >
                  Next
                  <ArrowRight className="h-4 w-4 ml-2" />
                </Button>
              </div>
            </CardContent>
          </Card>
        )}

        {/* Step 3: Favorite Animals */}
        {currentStep === 3 && (
          <Card className="bg-white/80 backdrop-blur-sm border-0 shadow-xl">
            <CardHeader className="text-center">
              <div className="w-16 h-16 bg-gradient-to-r from-green-400 to-blue-500 rounded-full flex items-center justify-center mx-auto mb-4">
                <Heart className="h-8 w-8 text-white" />
              </div>
              <CardTitle className="text-2xl text-gray-800">Pick Your Favorite Animals!</CardTitle>
              <p className="text-gray-600">Choose up to 3 animals you love the most</p>
            </CardHeader>
            <CardContent className="p-8">
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3 mb-8">
                {animals.map((animal) => (
                  <button
                    key={animal}
                    onClick={() => handleAnimalToggle(animal)}
                    className={`
                      p-4 rounded-lg border-2 text-lg font-medium transition-all transform hover:scale-105
                      ${onboardingData.favoriteAnimals.includes(animal) 
                        ? 'bg-green-100 border-green-400 text-green-800' 
                        : 'bg-white border-gray-200 text-gray-700 hover:border-green-300'
                      }
                    `}
                  >
                    {animal}
                    {onboardingData.favoriteAnimals.includes(animal) && (
                      <Check className="h-4 w-4 mx-auto mt-1" />
                    )}
                  </button>
                ))}
              </div>
              <p className="text-center text-sm text-gray-500 mb-6">
                Selected: {onboardingData.favoriteAnimals.length}/3
              </p>
              <div className="flex justify-between">
                <Button 
                  variant="outline" 
                  onClick={() => setCurrentStep(2)}
                  className="px-6"
                >
                  Back
                </Button>
                <Button 
                  onClick={() => setCurrentStep(4)}
                  disabled={onboardingData.favoriteAnimals.length === 0}
                  className="bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white px-6"
                >
                  Next
                  <ArrowRight className="h-4 w-4 ml-2" />
                </Button>
              </div>
            </CardContent>
          </Card>
        )}

        {/* Step 4: Interests */}
        {currentStep === 4 && (
          <Card className="bg-white/80 backdrop-blur-sm border-0 shadow-xl">
            <CardHeader className="text-center">
              <div className="w-16 h-16 bg-gradient-to-r from-yellow-400 to-orange-500 rounded-full flex items-center justify-center mx-auto mb-4">
                <Star className="h-8 w-8 text-white" />
              </div>
              <CardTitle className="text-2xl text-gray-800">What Do You Love to Do?</CardTitle>
              <p className="text-gray-600">Tell us about your favorite activities!</p>
            </CardHeader>
            <CardContent className="p-8">
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3 mb-8">
                {interests.map((interest) => (
                  <button
                    key={interest}
                    onClick={() => handleInterestToggle(interest)}
                    className={`
                      p-4 rounded-lg border-2 text-lg font-medium transition-all transform hover:scale-105
                      ${onboardingData.interests.includes(interest) 
                        ? 'bg-yellow-100 border-yellow-400 text-yellow-800' 
                        : 'bg-white border-gray-200 text-gray-700 hover:border-yellow-300'
                      }
                    `}
                  >
                    {interest}
                    {onboardingData.interests.includes(interest) && (
                      <Check className="h-4 w-4 mx-auto mt-1" />
                    )}
                  </button>
                ))}
              </div>
              <p className="text-center text-sm text-gray-500 mb-6">
                Selected: {onboardingData.interests.length}/4
              </p>
              <div className="flex justify-between">
                <Button 
                  variant="outline" 
                  onClick={() => setCurrentStep(3)}
                  className="px-6"
                >
                  Back
                </Button>
                <Button 
                  onClick={handleComplete}
                  disabled={loading || onboardingData.interests.length === 0}
                  className="bg-gradient-to-r from-green-500 to-blue-600 hover:from-green-600 hover:to-blue-700 text-white px-8"
                >
                  {loading ? (
                    <>
                      <div className="animate-spin rounded-full h-4 w-4 border-2 border-white border-t-transparent mr-2" />
                      Setting Up...
                    </>
                  ) : (
                    <>
                      <Sparkles className="h-4 w-4 mr-2" />
                      Complete Setup!
                    </>
                  )}
                </Button>
              </div>
            </CardContent>
          </Card>
        )}

        {/* Fun Footer Message */}
        <div className="mt-8 text-center">
          <p className="text-gray-600 italic">
            "Every day is a new adventure when you understand your feelings!" 🌟
          </p>
        </div>
      </div>
    </div>
  )
}