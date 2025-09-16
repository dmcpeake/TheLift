import { useSearchParams } from 'react-router-dom'
import { EmotionGrid } from '@/components/child/emotion-grid/EmotionGrid'
import { generateMockChildId } from '@/utils/wellbeing/mock-data'

export default function EmotionGridTestPage() {
  const [searchParams] = useSearchParams()
  const childId = searchParams.get('childId') || generateMockChildId()

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 to-pink-50 p-8">
      <div className="max-w-4xl mx-auto space-y-6">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">Emotion Grid Test</h1>
          <p className="text-gray-600">Testing with Child ID: {childId}</p>
        </div>
        
        <EmotionGrid 
          childId={childId}
          onComplete={() => {
            console.log('Emotion Grid completed')
            alert('Emotion Grid saved successfully!')
          }}
        />
      </div>
    </div>
  )
}