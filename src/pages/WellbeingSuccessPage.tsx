import React, { useState, useEffect } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { ArrowRight } from 'lucide-react'
import Lottie from 'lottie-react'
import { WellbeingRadialGraph } from '../components/shared/WellbeingRadialGraph'

interface WellbeingSection {
  name: string
  mood_level: string
  mood_numeric: number
  notes?: string
}

export function WellbeingSuccessPage() {
  const navigate = useNavigate()
  const location = useLocation()
  const { sections } = location.state || { sections: [] }
  const [theoAnimation, setTheoAnimation] = useState(null)

  useEffect(() => {
    fetch('/theo-waving.json')
      .then(response => response.json())
      .then(data => setTheoAnimation(data))
      .catch(error => console.error('Error loading Theo animation:', error))
  }, [])

  const handleContinue = () => {
    navigate('/child/home')
  }

  return (
    <div className="min-h-screen bg-white">
      <div className="flex flex-col items-center p-8" style={{ paddingTop: '40px' }}>
        {/* Title */}
        <div className="text-center mb-4">
          <h1 className="text-4xl font-bold text-gray-800">
            Well done!
          </h1>
        </div>

        {/* Subtitle */}
        <div className="text-center mb-8">
          <p className="text-lg text-gray-600">
            You've completed your wheel
          </p>
        </div>

        {/* Radial Graph */}
        <div style={{ paddingTop: '50px', paddingBottom: '50px' }}>
          <WellbeingRadialGraph
            sections={sections}
            size={500}
            theoAnimation={theoAnimation}
          />
        </div>

        {/* Things you could try */}
        <div className="text-center max-w-md mx-auto mb-8">
          <p className="text-gray-700 mb-4">
            If you had a lower score on an area and want to feel better you could:
          </p>
          <hr className="border-t border-gray-300 mb-4" />
          <ul className="text-gray-700 text-left">
            <li className="flex items-start gap-2 py-2">
              <span className="text-gray-500">•</span>
              <span>list out the things that make you feel good</span>
            </li>
            <hr className="border-t border-dashed border-gray-300 my-2" />
            <li className="flex items-start gap-2 py-2">
              <span className="text-gray-500">•</span>
              <span>talk to a friend</span>
            </li>
            <hr className="border-t border-dashed border-gray-300 my-2" />
            <li className="flex items-start gap-2 py-2">
              <span className="text-gray-500">•</span>
              <span>talk to your adults or teachers for a bit more support</span>
            </li>
          </ul>
        </div>

        {/* DONE Button */}
        <div>
          <button
            onClick={handleContinue}
            className="px-8 py-4 text-white font-semibold rounded-full transition-all duration-200 shadow-lg hover:shadow-xl transform hover:scale-105"
            style={{
              backgroundColor: '#e87e67',
              color: 'white'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.backgroundColor = '#d86b4f'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.backgroundColor = '#e87e67'
            }}
          >
            DONE
          </button>
        </div>
      </div>
    </div>
  )
}