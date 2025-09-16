import { useSearchParams } from 'react-router-dom'
import { BreathingTool } from '@/components/child/breathing-tool/BreathingTool'
import { generateMockChildId } from '@/utils/wellbeing/mock-data'

export default function BreathingToolTestPage() {
  const [searchParams] = useSearchParams()
  const childId = searchParams.get('childId') || generateMockChildId()

  return (
    <div className="min-h-screen bg-gradient-to-br from-cyan-50 to-blue-50 p-8">
      <div className="max-w-4xl mx-auto space-y-6">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">Breathing Tool Test</h1>
          <p className="text-gray-600">Testing with Child ID: {childId}</p>
        </div>
        
        <BreathingTool 
          childId={childId}
          onComplete={() => {
            console.log('Breathing session completed')
            alert('Breathing session saved successfully!')
          }}
        />
      </div>
    </div>
  )
}