import React from 'react'
// import { useNavigate } from 'react-router-dom'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'

export function ChildHome() {
  // const navigate = useNavigate()

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-100 to-gray-200">
      <header className="bg-white shadow-sm">
        <div className="max-w-4xl mx-auto py-4 px-4 flex justify-between items-center">
          <div className="flex items-center space-x-3">
            <div className="text-3xl">🌟</div>
            <div>
              <h1 className="text-xl font-medium text-gray-900">Hello!</h1>
              <p className="text-sm text-gray-600">Ready for today's activities?</p>
            </div>
          </div>
          <div className="text-sm text-gray-600">
            {new Date().toLocaleDateString('en-GB', { 
              weekday: 'long',
              day: 'numeric',
              month: 'long'
            })}
          </div>
        </div>
      </header>
      
      <main className="max-w-4xl mx-auto py-6 px-4">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
          <Card className="cursor-pointer hover:shadow-lg transition-shadow border-2 border-dashed border-gray-300 hover:border-gray-400">
            <CardHeader className="text-center">
              <div className="text-6xl mb-2">🎯</div>
              <CardTitle className="text-xl">Daily Check-in</CardTitle>
            </CardHeader>
            <CardContent className="text-center">
              <p className="text-gray-600 mb-4">
                How are you feeling today? Let's check in together!
              </p>
              <Button className="w-full text-lg py-3">
                Start Check-in ✨
              </Button>
            </CardContent>
          </Card>
          
          <Card className="cursor-pointer hover:shadow-lg transition-shadow">
            <CardHeader className="text-center">
              <div className="text-6xl mb-2">🌱</div>
              <CardTitle className="text-xl">My Garden</CardTitle>
            </CardHeader>
            <CardContent className="text-center">
              <p className="text-gray-600 mb-4">
                Visit your special garden and see what's growing!
              </p>
              <Button variant="outline" className="w-full text-lg py-3">
                Visit Garden 🌿
              </Button>
            </CardContent>
          </Card>
          
          <Card className="cursor-pointer hover:shadow-lg transition-shadow">
            <CardHeader className="text-center">
              <div className="text-6xl mb-2">⭐</div>
              <CardTitle className="text-xl">Sticker Book</CardTitle>
            </CardHeader>
            <CardContent className="text-center">
              <p className="text-gray-600 mb-4">
                Look at all the amazing stickers you've earned!
              </p>
              <div className="bg-gray-100 rounded-lg p-2 mb-4">
                <span className="text-sm text-gray-600">24 stickers collected!</span>
              </div>
              <Button variant="outline" className="w-full text-lg py-3">
                View Collection 📚
              </Button>
            </CardContent>
          </Card>
          
          <Card className="cursor-pointer hover:shadow-lg transition-shadow">
            <CardHeader className="text-center">
              <div className="text-6xl mb-2">👥</div>
              <CardTitle className="text-xl">Community</CardTitle>
            </CardHeader>
            <CardContent className="text-center">
              <p className="text-gray-600 mb-4">
                See positive messages from other children!
              </p>
              <Button variant="outline" className="w-full text-lg py-3">
                Visit Community 🏡
              </Button>
            </CardContent>
          </Card>
        </div>
        
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center space-x-2">
                <span className="text-2xl">📈</span>
                <span>Your Progress</span>
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                <div>
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-sm">This Week's Check-ins</span>
                    <span className="text-sm text-gray-600">3/7</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2">
                    <div className="bg-gray-600 h-2 rounded-full" style={{ width: '43%' }}></div>
                  </div>
                </div>
                
                <div className="grid grid-cols-3 gap-2 text-center">
                  <div className="bg-gray-100 rounded-lg p-2">
                    <div className="text-lg font-medium">12</div>
                    <div className="text-xs text-gray-600">Sessions</div>
                  </div>
                  <div className="bg-gray-100 rounded-lg p-2">
                    <div className="text-lg font-medium">24</div>
                    <div className="text-xs text-gray-600">Stickers</div>
                  </div>
                  <div className="bg-gray-100 rounded-lg p-2">
                    <div className="text-lg font-medium">15</div>
                    <div className="text-xs text-gray-600">Garden Items</div>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>
          
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center space-x-2">
                <span className="text-2xl">💝</span>
                <span>Encouragement</span>
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="bg-gray-100 rounded-lg p-4 text-center">
                <p className="text-gray-700 mb-2">
                  "You're doing amazingly well! Keep up the great work with your check-ins."
                </p>
                <p className="text-sm text-gray-600">— Your Practitioner</p>
              </div>
              
              <div className="mt-4 text-center">
                <p className="text-sm text-gray-600">
                  Remember: Every small step counts! 🌟
                </p>
              </div>
            </CardContent>
          </Card>
        </div>
      </main>
    </div>
  )
}