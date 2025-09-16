import { useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { CheckInFlow } from '../../components/child/check-in-flow/CheckInFlow'

export default function ChildCheckInPage() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  
  const childId = user?.id || 'demo_child'

  const handleComplete = () => {
    // Navigate back to home after completion
    navigate('/child/home')
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 p-4 sm:p-8">
      <div className="max-w-5xl mx-auto">
        <CheckInFlow 
          childId={childId}
          sessionType="as_needed"
          onComplete={handleComplete}
        />
      </div>
    </div>
  )
}