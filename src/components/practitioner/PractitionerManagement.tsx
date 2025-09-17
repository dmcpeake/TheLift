import React, { useState, useEffect, useContext } from 'react'
import { Link, useParams, useNavigate } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { getSupabaseClient } from '../../utils/supabase/client'
import { Button } from '../ui/button'
import { Alert, AlertDescription } from '../ui/alert'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { ArrowLeft, AlertTriangle, Trash2, Send } from 'lucide-react'
import { PractitionerWithAssignments, EditForm } from './types'
import { DEMO_PRACTITIONER_DATA } from './practitionerData'
import { projectId } from '../../utils/supabase/info'
import { PractitionerStatsCards } from './PractitionerStatsCards'
import { PractitionerDetailsForm } from './PractitionerDetailsForm'
import { AssignedChildrenList } from './AssignedChildrenList'

export function PractitionerManagement() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { user } = useContext(AuthContext)
  const [practitioner, setPractitioner] = useState<PractitionerWithAssignments | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [resendLoading, setResendLoading] = useState(false)
  const [isEditing, setIsEditing] = useState(false)
  const [editForm, setEditForm] = useState<EditForm>({
    name: '',
    email: '',
    phone: ''
  })

  useEffect(() => {
    fetchPractitionerData()
  }, [id])

  const fetchPractitionerData = async () => {
    if (!user || !id) return

    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()

      const practitionerData = DEMO_PRACTITIONER_DATA[id]
      
      if (practitionerData) {
        setPractitioner(practitionerData)
        setEditForm({
          name: practitionerData.name,
          email: practitionerData.email,
          phone: practitionerData.phone || ''
        })
      } else {
        setError('Practitioner not found')
      }
      
      if (sessionError || !session?.access_token) {
        
      }
    } catch (error) {
      console.error('Error fetching practitioner data:', error)
      setError('Failed to load practitioner data')
    } finally {
      setLoading(false)
    }
  }

  const handleResendInvitation = async () => {
    setResendLoading(true)
    try {
      console.log('Resending invitation to:', practitioner?.email)
      await new Promise(resolve => setTimeout(resolve, 1000))
      alert('Invitation resent successfully!')
    } catch (error) {
      console.error('Error resending invitation:', error)
      alert('Failed to resend invitation')
    } finally {
      setResendLoading(false)
    }
  }

  const handleSaveEdit = async () => {
    try {
      console.log('Saving practitioner details:', editForm)
      
      // Check if email has changed
      const emailChanged = practitioner && editForm.email !== practitioner.email
      
      if (emailChanged) {
        // Get current user's access token for reauthentication
        const supabase = getSupabaseClient()
        const { data: { session } } = await supabase.auth.getSession()
        if (!session?.access_token) {
          alert('Authentication required. Please log in again.')
          return
        }

        // Handle email change via API (using same pattern as admin)
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/practitioners/${id}/email`, {
          method: 'PUT',
          headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            newEmail: editForm.email,
            reason: 'Profile update via practitioner management'
          })
        })

        if (!response.ok) {
          const error = await response.json()
          console.error('Failed to update email:', error)
          alert(`Failed to update email address: ${error.error || 'Please try again.'}`)
          return
        }

        const emailResult = await response.json()
        console.log('Email update result:', emailResult)
        
        // Show success message with verification info
        if (emailResult.requiresVerification) {
          alert(`Email updated successfully! The practitioner will need to verify their new email address (${emailResult.newEmail}) before they can log in.`)
        } else {
          alert('Email updated successfully!')
        }
      }

      // Update practitioner data (simulate API call for demo)
      await new Promise(resolve => setTimeout(resolve, 500))
      
      if (practitioner) {
        setPractitioner({
          ...practitioner,
          name: editForm.name,
          email: editForm.email,
          phone: editForm.phone
        })
      }
      
      setIsEditing(false)
      
      // Show appropriate success message
      if (!emailChanged) {
        alert('Profile updated successfully!')
      }
    } catch (error) {
      console.error('Error updating practitioner:', error)
      alert('Failed to update profile. Please try again.')
    }
  }

  const handleCancelEdit = () => {
    if (practitioner) {
      setEditForm({
        name: practitioner.name,
        email: practitioner.email,
        phone: practitioner.phone || ''
      })
    }
    setIsEditing(false)
  }

  const handleReassignMultiple = async (childIds: string[], newPractitionerId: string) => {
    try {
      const newPractitionerName = practitioner?.availablePractitioners.find(
        p => p.id === newPractitionerId
      )?.name

      console.log('Reassigning children:', childIds, 'to practitioner:', newPractitionerId)
      await new Promise(resolve => setTimeout(resolve, 1000))
      
      if (practitioner) {
        const updatedChildren = practitioner.children.filter(child => !childIds.includes(child.id))
        setPractitioner({
          ...practitioner,
          children: updatedChildren,
          childrenCount: updatedChildren.length
        })
      }
      
      const message = childIds.length === 1 
        ? `Child reassigned to ${newPractitionerName} successfully!`
        : `${childIds.length} children reassigned to ${newPractitionerName} successfully!`
      
      alert(message)
    } catch (error) {
      console.error('Error reassigning children:', error)
      alert('Failed to reassign children')
    }
  }

  const handleDeletePractitioner = () => {
    if (practitioner?.childrenCount > 0) {
      alert('Cannot delete practitioner with assigned children. Please reassign all children first.')
      return
    }
    
    if (confirm(`Are you sure you want to delete ${practitioner?.name}? This action cannot be undone.`)) {
      console.log('Deleting practitioner:', id)
      alert('Practitioner deleted successfully!')
      navigate('/dashboard')
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-gray-600"></div>
      </div>
    )
  }

  if (!practitioner) {
    return (
      <div className="min-h-screen bg-gray-50">
        <div className="max-w-7xl mx-auto p-6">
          <div className="text-center py-12">
            <AlertTriangle className="h-12 w-12 text-gray-400 mx-auto mb-4" />
            <h1 className="text-2xl font-bold text-gray-900 mb-2">Practitioner Not Found</h1>
            <p className="text-gray-600 mb-4">The practitioner you're looking for doesn't exist.</p>
            <Link to="/dashboard">
              <Button>
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back to Dashboard
              </Button>
            </Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto p-6">
        {/* Breadcrumb Navigation */}
        <Breadcrumb className="mb-6">
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to="/dashboard">Dashboard</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Manage {practitioner.name}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center justify-between">
            <h1 className="text-3xl font-bold text-gray-900">
              Manage {practitioner.name}
            </h1>
            <div className="flex items-center gap-3">
              {practitioner.status === 'pending' && (
                <Button 
                  variant="outline"
                  onClick={handleResendInvitation}
                  disabled={resendLoading}
                >
                  {resendLoading ? (
                    <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-gray-600 mr-2"></div>
                  ) : (
                    <Send className="h-4 w-4 mr-2" />
                  )}
                  {resendLoading ? 'Sending...' : 'Resend Invitation'}
                </Button>
              )}
              <Button 
                variant="outline" 
                onClick={handleDeletePractitioner}
                className="text-red-600 border-red-200 hover:bg-red-50"
                disabled={practitioner.childrenCount > 0}
              >
                <Trash2 className="h-4 w-4 mr-2" />
                Delete Practitioner
              </Button>
            </div>
          </div>
        </div>

        {error && (
          <Alert className="mb-6 border-gray-200 bg-gray-50">
            <AlertTriangle className="h-4 w-4 text-gray-600" />
            <AlertDescription className="text-gray-800">
              {error}
            </AlertDescription>
          </Alert>
        )}

        <div className="space-y-6">
          {/* Stats Cards */}
          <PractitionerStatsCards practitioner={practitioner} />

          {/* Profile Details */}
          <PractitionerDetailsForm
            practitioner={practitioner}
            isEditing={isEditing}
            editForm={editForm}
            onEditChange={setEditForm}
            onStartEdit={() => setIsEditing(true)}
            onSaveEdit={handleSaveEdit}
            onCancelEdit={handleCancelEdit}
          />

          {/* Assigned Children */}
          <AssignedChildrenList
            practitioner={practitioner}
            onReassignMultiple={handleReassignMultiple}
          />
        </div>
      </div>
    </div>
  )
}