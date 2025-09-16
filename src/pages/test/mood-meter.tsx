import { useSearchParams } from 'react-router-dom'
import { MoodMeter } from '@/components/child/mood-meter/MoodMeter'
import { generateMockChildId } from '@/utils/wellbeing/mock-data'

export default function MoodMeterTestPage() {
  const [searchParams] = useSearchParams()
  const childId = searchParams.get('childId') || generateMockChildId()

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 p-8">
      <div className="max-w-4xl mx-auto space-y-6">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">Mood Meter Test</h1>
          <p className="text-gray-600">Testing with Child ID: {childId}</p>
        </div>
        
        <MoodMeter 
          childId={childId}
          showSelectionTime={true}
          onComplete={(mood) => {
            console.log('Mood completed:', mood)
            alert(`Mood saved: ${mood}`)
          }}
        />
      </div>
    </div>
  )
}