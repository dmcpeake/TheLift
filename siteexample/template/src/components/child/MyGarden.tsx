import React, { useState, useEffect } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Progress } from '../ui/progress'
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '../ui/dialog'
import { Textarea } from '../ui/textarea'
import { Label } from '../ui/label'
import { 
  Droplets, 
  Flower, 
  Sun, 
  Sparkles, 
  ArrowRight,
  ArrowLeft,
  Star,
  Heart,
  Leaf,
  Gift,
  Users,
  BookOpen,
  Gamepad2,
  Music,
  Palette,
  Zap,
  X
} from 'lucide-react'

const dailyQuotes = [
  "You are braver than you believe, stronger than you seem, and smarter than you think.",
  "Every feeling you have is valid and important.",
  "Small steps every day lead to big changes.",
  "You have the power to make today amazing!",
  "Being kind to yourself is just as important as being kind to others.",
  "Your feelings are like weather - they come and go, and that's perfectly normal.",
  "You are enough, exactly as you are right now.",
  "Every challenge is a chance to grow stronger.",
  "Your smile can light up someone else's day!"
]

const dailyJokes = [
  "Why don't scientists trust atoms? Because they make up everything!",
  "What do you call a bear with no teeth? A gummy bear!",
  "Why did the scarecrow win an award? He was outstanding in his field!",
  "What do you call a sleeping bull? A bulldozer!",
  "Why don't eggs tell jokes? They'd crack each other up!",
  "What do you call a fish wearing a bowtie? Sofishticated!",
  "Why did the math book look so sad? Because it had too many problems!",
  "What do you call a dinosaur that crashes his car? Tyrannosaurus Wrecks!"
]

const dailyFacts = [
  "Did you know? Laughing for 15 minutes burns as many calories as walking for 10 minutes!",
  "Fun fact: Your brain uses about 20% of your body's energy - that's why thinking hard can make you tired!",
  "Amazing: When you smile, your brain releases happy chemicals called endorphins!",
  "Cool fact: Butterflies taste with their feet - just like how we can 'taste' emotions!",
  "Did you know? Trees can live for thousands of years by staying connected to their roots!",
  "Fun fact: Dolphins have names for each other, just like people do!",
  "Amazing: Your heart beats about 100,000 times every single day!",
  "Cool fact: Bees communicate by dancing - they have their own special language!"
]

interface Plant {
  id: string
  name: string
  emoji: string
  growthStage: number // 1-4 (seed, sprout, growing, bloomed)
  waterLevel: number // 0-100
  needsWater: boolean
  color: string
}

interface WateringEvent {
  id: string
  category: string
  description: string
  icon: React.ComponentType<any>
  examples: string[]
}

interface WateringEntry {
  plantId: string
  plantName: string
  event: string
  customText?: string
  timestamp: Date
}

interface GardenState {
  plants: Plant[]
  totalWatered: number
  newPlantsToday: string[]
  wateringEntries: WateringEntry[]
}

export function MyGarden() {
  const navigate = useNavigate()
  const location = useLocation()
  const { wellbeingScores, awardedSticker, avgScore } = location.state || {}

  const [gardenState, setGardenState] = useState<GardenState>({
    plants: [
      {
        id: '1',
        name: 'Happiness Flower',
        emoji: '🌸',
        growthStage: 3,
        waterLevel: 60,
        needsWater: true,
        color: 'from-pink-400 to-rose-500'
      },
      {
        id: '2', 
        name: 'Sunshine Daisy',
        emoji: '🌼',
        growthStage: 2,
        waterLevel: 80,
        needsWater: false,
        color: 'from-yellow-400 to-orange-400'
      },
      {
        id: '3',
        name: 'Friendship Tree',
        emoji: '🌳',
        growthStage: 4,
        waterLevel: 90,
        needsWater: false,
        color: 'from-green-400 to-green-600'
      },
      {
        id: '4',
        name: 'Magic Rose',
        emoji: '🌹',
        growthStage: 1,
        waterLevel: 20,
        needsWater: true,
        color: 'from-red-400 to-pink-500'
      }
    ],
    totalWatered: 0,
    newPlantsToday: [],
    wateringEntries: []
  })

  const [selectedPlant, setSelectedPlant] = useState<string | null>(null)
  const [wateringAnimation, setWateringAnimation] = useState<string | null>(null)
  const [showPlantReward, setShowPlantReward] = useState(false)
  const [showStickerReward, setShowStickerReward] = useState(false)
  const [dailyContent, setDailyContent] = useState({ quote: '', fact: '', joke: '' })
  const [showWateringDialog, setShowWateringDialog] = useState(false)
  const [plantToWater, setPlantToWater] = useState<Plant | null>(null)
  const [selectedEvent, setSelectedEvent] = useState<string>('')
  const [customEventText, setCustomEventText] = useState('')

  // Get today's daily content
  useEffect(() => {
    const today = new Date().getDate()
    setDailyContent({
      quote: dailyQuotes[today % dailyQuotes.length],
      fact: dailyFacts[today % dailyFacts.length],
      joke: dailyJokes[today % dailyJokes.length]
    })
    
    // Show sticker reward if we have one
    if (awardedSticker) {
      setTimeout(() => setShowStickerReward(true), 1000)
    }
  }, [])

  const wateringEvents: WateringEvent[] = [
    {
      id: 'social',
      category: 'Social Connection',
      description: 'Spending time with friends, family, or pets',
      icon: Users,
      examples: ['Played with friends', 'Had dinner with family', 'Cuddled my pet', 'Called grandma']
    },
    {
      id: 'learning',
      category: 'Learning & Growth',
      description: 'Learning something new or practicing skills',
      icon: BookOpen,
      examples: ['Read a good book', 'Learned something new', 'Practised piano', 'Did homework well']
    },
    {
      id: 'play',
      category: 'Play & Fun',
      description: 'Having fun, playing games, or being silly',
      icon: Gamepad2,
      examples: ['Played my favourite game', 'Had a fun day out', 'Laughed with friends', 'Built something cool']
    },
    {
      id: 'creative',
      category: 'Creative Expression',
      description: 'Art, music, writing, or creative activities',
      icon: Palette,
      examples: ['Drew a picture', 'Sang my favourite song', 'Wrote in my journal', 'Made something beautiful']
    },
    {
      id: 'active',
      category: 'Being Active',
      description: 'Physical activity, sports, or movement',
      icon: Zap,
      examples: ['Went for a walk', 'Played football', 'Danced to music', 'Rode my bike']
    },
    {
      id: 'music',
      category: 'Music & Sound',
      description: 'Listening to music or making sounds',
      icon: Music,
      examples: ['Listened to happy music', 'Sang loudly', 'Played an instrument', 'Heard birds singing']
    }
  ]

  const getStickerEmoji = (sticker: string) => {
    const stickerMap = {
      'rainbow': '🌈',
      'sun': '☀️',
      'flower': '🌸',
      'heart': '💖',
      'star': '⭐',
      'butterfly': '🦋',
      'tree': '🌳',
      'cloud': '☁️'
    }
    return stickerMap[sticker] || '⭐'
  }

  useEffect(() => {
    // Add new plants based on wellbeing scores
    if (wellbeingScores && Object.keys(wellbeingScores).length > 0) {
      const calculatedAvgScore = Object.values(wellbeingScores).reduce((a: number, b: number) => a + b, 0) / Object.keys(wellbeingScores).length
      const scoreToUse = avgScore || calculatedAvgScore
      
      if (scoreToUse >= 4) {
        // High wellbeing - chance for new special plant
        if (Math.random() > 0.6) {
          const newPlant: Plant = {
            id: Date.now().toString(),
            name: 'Confidence Star',
            emoji: '⭐',
            growthStage: 1,
            waterLevel: 100,
            needsWater: false,
            color: 'from-purple-400 to-blue-500'
          }
          
          setGardenState(prev => ({
            ...prev,
            plants: [...prev.plants, newPlant],
            newPlantsToday: [...prev.newPlantsToday, newPlant.name]
          }))
          setShowPlantReward(true)
          setTimeout(() => setShowPlantReward(false), 4000)
        }
      }
    }
  }, [wellbeingScores, avgScore])

  const openWateringDialog = (plant: Plant) => {
    setPlantToWater(plant)
    setSelectedEvent('')
    setCustomEventText('')
    setShowWateringDialog(true)
  }

  const waterPlant = () => {
    if (!plantToWater || (!selectedEvent && !customEventText.trim())) return

    const eventText = selectedEvent || customEventText.trim()
    
    setWateringAnimation(plantToWater.id)
    
    // Record the watering entry
    const entry: WateringEntry = {
      plantId: plantToWater.id,
      plantName: plantToWater.name,
      event: eventText,
      customText: selectedEvent ? undefined : customEventText.trim(),
      timestamp: new Date()
    }
    
    setTimeout(() => {
      setGardenState(prev => ({
        ...prev,
        plants: prev.plants.map(plant => 
          plant.id === plantToWater.id 
            ? { 
                ...plant, 
                waterLevel: Math.min(100, plant.waterLevel + 30),
                needsWater: false,
                growthStage: plant.waterLevel < 50 ? Math.min(4, plant.growthStage + 1) : plant.growthStage
              }
            : plant
        ),
        totalWatered: prev.totalWatered + 1,
        wateringEntries: [...prev.wateringEntries, entry]
      }))
      setWateringAnimation(null)
      setShowWateringDialog(false)
      setPlantToWater(null)
      setSelectedEvent('')
      setCustomEventText('')
    }, 1000)
  }

  const getPlantStageEmoji = (plant: Plant) => {
    if (wateringAnimation === plant.id) {
      return '💧'
    }
    
    switch (plant.growthStage) {
      case 1: return '🌱' // Seed/Sprout
      case 2: return plant.emoji + '🌿' // Growing
      case 3: return plant.emoji // Bloomed
      case 4: return plant.emoji + '✨' // Fully grown
      default: return plant.emoji
    }
  }

  const getGrowthLabel = (stage: number) => {
    const labels = ['Sprouting', 'Growing', 'Blooming', 'Magnificent!']
    return labels[stage - 1] || 'Growing'
  }

  const plantsNeedingWater = gardenState.plants.filter(plant => plant.needsWater).length
  const totalPlants = gardenState.plants.length

  const hasCheckedInToday = () => {
    // Check if user has completed wellbeing scores (indicating they've done today's check-in)
    return wellbeingScores && Object.keys(wellbeingScores).length > 0
  }

  const handleNext = () => {
    navigate('/child/check-in/wrap-up', { 
      state: { 
        wellbeingScores,
        awardedSticker,
        avgScore,
        dailyContent,
        gardenActivity: {
          plantsWatered: gardenState.totalWatered,
          newPlants: gardenState.newPlantsToday,
          wateringEntries: gardenState.wateringEntries
        }
      }
    })
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b p-4">
        <div className="max-w-6xl mx-auto">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h1>Daily Check-in: My Magical Garden 🌻</h1>
              <p className="text-gray-600 mt-1">Step 2 of 3 - Take care of your plants by watering them!</p>
            </div>
            <Badge className="bg-gray-100 text-gray-800">
              {totalPlants} Plants Growing
            </Badge>
          </div>
          
          {/* Overall Check-in Progress */}
          <div className="flex items-center gap-4">
            <span className="text-sm text-gray-600">Check-in Progress:</span>
            <div className="flex gap-2">
              <div className="w-8 h-2 bg-gray-500 rounded-full flex items-center justify-center">
                <span className="text-xs text-white">✓</span>
              </div>
              <div className="w-8 h-2 bg-gray-500 rounded-full scale-125"></div>
              <div className="w-8 h-2 bg-gray-300 rounded-full"></div>
            </div>
            <span className="text-sm text-gray-600">Garden Care</span>
          </div>
        </div>
      </div>

      <div className="max-w-6xl mx-auto p-6">
        {/* Sticker Reward */}
        {showStickerReward && awardedSticker && (
          <Card className="bg-gray-600 text-white border-0 shadow-xl mb-6 animate-bounce">
            <CardContent className="p-6 text-center">
              <div className="text-6xl mb-4">{getStickerEmoji(awardedSticker)}</div>
              <h2>Sticker Earned!</h2>
              <p className="text-lg">You've earned a special {awardedSticker} sticker for sharing your feelings!</p>
              <Button 
                onClick={() => setShowStickerReward(false)}
                className="mt-4 bg-white text-gray-800 hover:bg-gray-100"
              >
                <Gift className="h-4 w-4 mr-2" />
                Collect Sticker
              </Button>
            </CardContent>
          </Card>
        )}

        {/* New Plant Reward */}
        {showPlantReward && (
          <Card className="bg-gray-600 text-white border-0 shadow-xl mb-6 animate-bounce">
            <CardContent className="p-6 text-center">
              <Star className="h-12 w-12 mx-auto mb-4" />
              <h2>Amazing News!</h2>
              <p className="text-lg">Your positive feelings helped a new plant grow in your garden! 🌟</p>
            </CardContent>
          </Card>
        )}

        {/* Garden Stats */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <Card className="bg-white border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-600">
                <Droplets className="h-5 w-5" />
                Plants Watered Today
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl mb-2">
                {gardenState.totalWatered}
              </div>
              <p className="text-gray-600">Keep them happy!</p>
            </CardContent>
          </Card>

          <Card className="bg-white border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-600">
                <Sun className="h-5 w-5" />
                Need Water
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl mb-2">
                {plantsNeedingWater}
              </div>
              <p className="text-gray-600">Thirsty plants</p>
            </CardContent>
          </Card>

          <Card className="bg-white border-0 shadow-lg">
            <CardHeader className="pb-3">
              <CardTitle className="flex items-center gap-2 text-gray-600">
                <Leaf className="h-5 w-5" />
                Garden Health
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-3xl mb-2">
                {Math.round(((totalPlants - plantsNeedingWater) / totalPlants) * 100)}%
              </div>
              <Progress 
                value={((totalPlants - plantsNeedingWater) / totalPlants) * 100} 
                className="h-2"
              />
            </CardContent>
          </Card>
        </div>

        {/* Garden Grid */}
        <Card className="bg-white border-0 shadow-xl mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-gray-700">
              <Flower className="h-6 w-6" />
              Your Beautiful Garden
            </CardTitle>
          </CardHeader>
          <CardContent className="p-8">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
              {gardenState.plants.map((plant) => (
                <div
                  key={plant.id}
                  className={`
                    relative p-6 rounded-2xl border-2 cursor-pointer transition-all transform hover:scale-105
                    ${selectedPlant === plant.id 
                      ? 'border-gray-400 shadow-lg scale-105' 
                      : 'border-gray-200 hover:border-gray-300'
                    }
                    ${plant.needsWater ? 'bg-red-50' : 'bg-gray-50'}
                  `}
                  onClick={() => setSelectedPlant(plant.id)}
                >
                  {/* Plant Display */}
                  <div className="text-center">
                    <div className={`text-6xl mb-3 ${wateringAnimation === plant.id ? 'animate-bounce' : ''}`}>
                      {getPlantStageEmoji(plant)}
                    </div>
                    <h3 className="text-gray-800 mb-2">{plant.name}</h3>
                    <Badge className={`mb-3 ${plant.needsWater ? 'bg-red-100 text-red-700' : 'bg-gray-100 text-gray-700'}`}>
                      {getGrowthLabel(plant.growthStage)}
                    </Badge>
                    
                    {/* Water Level */}
                    <div className="mb-3">
                      <div className="flex justify-between text-xs text-gray-600 mb-1">
                        <span>Water</span>
                        <span>{plant.waterLevel}%</span>
                      </div>
                      <Progress value={plant.waterLevel} className="h-2" />
                    </div>

                    {/* Water Button */}
                    {plant.needsWater && (
                      <Button
                        onClick={(e) => {
                          e.stopPropagation()
                          openWateringDialog(plant)
                        }}
                        disabled={wateringAnimation === plant.id}
                        className="w-full bg-gray-500 hover:bg-gray-600 text-white"
                      >
                        {wateringAnimation === plant.id ? (
                          <>
                            <div className="animate-spin rounded-full h-4 w-4 border-2 border-white border-t-transparent mr-2" />
                            Watering...
                          </>
                        ) : (
                          <>
                            <Droplets className="h-4 w-4 mr-2" />
                            Water Me!
                          </>
                        )}
                      </Button>
                    )}
                  </div>

                  {/* New Plant Indicator */}
                  {gardenState.newPlantsToday.includes(plant.name) && (
                    <div className="absolute -top-2 -right-2 w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center animate-pulse">
                      <Star className="h-3 w-3 text-white" />
                    </div>
                  )}
                </div>
              ))}
            </div>
          </CardContent>
        </Card>



        {/* Recent Watering Activities */}
        {gardenState.wateringEntries.length > 0 && (
          <Card className="bg-white border-0 shadow-lg mb-8">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-gray-700">
                <Heart className="h-5 w-5" />
                Today's Good Things
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                {gardenState.wateringEntries.slice(-3).map((entry, index) => (
                  <div key={index} className="flex items-start gap-3 p-3 bg-gray-50 rounded-lg">
                    <div className="text-2xl">{gardenState.plants.find(p => p.id === entry.plantId)?.emoji || '🌱'}</div>
                    <div className="flex-1">
                      <p className="text-gray-800">{entry.event}</p>
                      <p className="text-sm text-gray-600">Watered {entry.plantName}</p>
                    </div>
                  </div>
                ))}
              </div>
              {gardenState.wateringEntries.length > 3 && (
                <p className="text-sm text-gray-500 text-center mt-3">
                  ...and {gardenState.wateringEntries.length - 3} more good things today!
                </p>
              )}
            </CardContent>
          </Card>
        )}



        {/* Navigation - Always show if user has completed wellbeing check-in */}
        {hasCheckedInToday() && (
          <div className="flex justify-between items-center">
            <Button 
              variant="outline" 
              onClick={() => navigate('/child/check-in/wheel')}
              className="bg-white hover:bg-gray-50 px-6"
            >
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back to Feelings
            </Button>

            <div className="text-center">
              <p className="text-gray-600 text-sm mb-2">Ready to continue?</p>
              <p className="text-xs text-gray-500">
                {gardenState.totalWatered > 0 
                  ? `You've watered ${gardenState.totalWatered} plant${gardenState.totalWatered === 1 ? '' : 's'} today!`
                  : 'You can water plants now or skip to finish your check-in'
                }
              </p>
            </div>

            <Button 
              onClick={handleNext}
              className="bg-gray-600 hover:bg-gray-700 text-white px-6"
            >
              Continue Check-in
              <ArrowRight className="h-4 w-4 ml-2" />
            </Button>
          </div>
        )}

        {/* Prompt if no check-in completed yet */}
        {!hasCheckedInToday() && (
          <Card className="bg-gray-100 border-0 shadow-lg">
            <CardContent className="p-6 text-center">
              <Heart className="h-8 w-8 text-gray-600 mx-auto mb-4" />
              <h3 className="text-lg text-gray-800 mb-2">Complete Your Feelings Check-in First</h3>
              <p className="text-gray-700 mb-4">
                You need to share how you're feeling today before you can tend to your garden.
              </p>
              <Button 
                onClick={() => navigate('/child/check-in/wheel')}
                className="bg-gray-600 hover:bg-gray-700 text-white"
              >
                <ArrowLeft className="h-4 w-4 mr-2" />
                Go to Feelings Check-in
              </Button>
            </CardContent>
          </Card>
        )}
      </div>

      {/* Watering Event Dialog */}
      <Dialog open={showWateringDialog} onOpenChange={setShowWateringDialog}>
        <DialogContent className="max-w-2xl max-h-[80vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              <Droplets className="h-6 w-6 text-gray-600" />
              Water {plantToWater?.name} 🌱
            </DialogTitle>
            <p className="text-gray-600">
              Share something positive from today! Each good thing you share helps your plants grow stronger and more beautiful.
            </p>
          </DialogHeader>

          <div className="space-y-6 mt-6">
            {/* Event Categories */}
            <div>
              <Label className="text-base mb-4 block">Choose what made today special:</Label>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {wateringEvents.map((event) => {
                  const IconComponent = event.icon
                  return (
                    <button
                      key={event.id}
                      onClick={() => setSelectedEvent(event.category)}
                      className={`
                        p-4 rounded-lg border-2 text-left transition-all hover:scale-[1.02]
                        ${selectedEvent === event.category
                          ? 'border-gray-500 bg-gray-50 shadow-md'
                          : 'border-gray-200 hover:border-gray-300'
                        }
                      `}
                    >
                      <div className="flex items-start gap-3">
                        <IconComponent className="h-5 w-5 text-gray-600 mt-0.5" />
                        <div>
                          <h4 className="text-gray-800 mb-1">{event.category}</h4>
                          <p className="text-sm text-gray-600">{event.description}</p>
                        </div>
                      </div>
                    </button>
                  )
                })}
              </div>
            </div>

            {/* Selected Event Examples */}
            {selectedEvent && (
              <div className="bg-gray-50 p-4 rounded-lg">
                <Label className="text-sm text-gray-600 mb-2 block">Examples for {selectedEvent}:</Label>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-2">
                  {wateringEvents
                    .find(e => e.category === selectedEvent)
                    ?.examples.map((example, index) => (
                      <div key={index} className="text-sm text-gray-700 bg-white p-2 rounded border">
                        "{example}"
                      </div>
                    ))}
                </div>
              </div>
            )}

            {/* Custom Text Option */}
            <div>
              <Label className="text-base mb-2 block">Or tell us in your own words:</Label>
              <Textarea
                value={customEventText}
                onChange={(e) => {
                  setCustomEventText(e.target.value)
                  if (e.target.value.trim()) {
                    setSelectedEvent('')
                  }
                }}
                placeholder="Something good that happened today..."
                className="min-h-[100px] text-base"
              />
            </div>

            {/* Action Buttons */}
            <div className="flex gap-3 pt-4">
              <Button
                variant="outline"
                onClick={() => setShowWateringDialog(false)}
                className="flex-1"
              >
                <X className="h-4 w-4 mr-2" />
                Cancel
              </Button>
              <Button
                onClick={waterPlant}
                disabled={!selectedEvent && !customEventText.trim()}
                className="flex-1 bg-gray-600 hover:bg-gray-700 text-white"
              >
                <Droplets className="h-4 w-4 mr-2" />
                Water Plant!
              </Button>
            </div>
          </div>
        </DialogContent>
      </Dialog>
    </div>
  )
}