import { useSearchParams } from 'react-router-dom'
import { CheckInFlow } from '@/components/child/check-in-flow/CheckInFlow'
import { generateMockChildId } from '@/utils/wellbeing/mock-data'

export default function CheckInFlowTestPage() {
  const [searchParams] = useSearchParams()
  const childId = searchParams.get('childId') || generateMockChildId()

  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-50 to-purple-50 p-8">
      <div className="max-w-5xl mx-auto space-y-6">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">Complete Check-In Flow Test</h1>
          <p className="text-gray-600">Testing with Child ID: {childId}</p>
        </div>
        
        <CheckInFlow 
          childId={childId}
          sessionType="as_needed"
          onComplete={() => {
            console.log('Check-in flow completed')
            alert('Check-in session completed successfully!')
          }}
        />
      </div>
    </div>
  )
}