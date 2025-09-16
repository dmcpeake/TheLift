import { useSearchParams } from 'react-router-dom'
import { WellbeingWheel } from '@/components/child/wellbeing-wheel/WellbeingWheel'
import { generateMockChildId } from '@/utils/wellbeing/mock-data'

export default function WellbeingWheelTestPage() {
  const [searchParams] = useSearchParams()
  const childId = searchParams.get('childId') || generateMockChildId()

  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 to-blue-50 p-8">
      <div className="max-w-4xl mx-auto space-y-6">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">Wellbeing Wheel Test</h1>
          <p className="text-gray-600">Testing with Child ID: {childId}</p>
        </div>
        
        <WellbeingWheel 
          childId={childId}
          onComplete={() => {
            console.log('Wellbeing Wheel completed')
            alert('Wellbeing Wheel saved successfully!')
          }}
        />
      </div>
    </div>
  )
}