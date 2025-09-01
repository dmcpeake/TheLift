import React, { useState, useEffect, useContext } from 'react'
import { useParams, Link, useNavigate } from 'react-router-dom'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { Save } from 'lucide-react'
import { Client, ClientFormData } from './types'
import { SAMPLE_CLIENTS } from './constants'
import { ClientFormFields } from './ClientFormFields'
import { ClientManagementActions } from './ClientManagementActions'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'

export function EditClient() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { user } = useContext(AuthContext)
  const supabase = getSupabaseClient()
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [actionLoading, setActionLoading] = useState<string | null>(null)
  const [formData, setFormData] = useState<ClientFormData>({
    name: '',
    type: 'group',
    contactName: '',
    contactEmail: '',
    seatsAllocated: 0,
    expiryDate: ''
  })
  const [client, setClient] = useState<Client | null>(null)

  useEffect(() => {
    // Simulate loading and finding client by id
    setTimeout(() => {
      const foundClient = SAMPLE_CLIENTS.find(c => c.id === id)
      if (foundClient) {
        setClient(foundClient)
        setFormData({
          name: foundClient.name,
          type: foundClient.type,
          contactName: foundClient.contactName,
          contactEmail: foundClient.contactEmail,
          seatsAllocated: foundClient.seatsAllocated,
          expiryDate: foundClient.expiryDate
        })
      }
      setLoading(false)
    }, 500)
  }, [id])

  const handleInputChange = (field: string, value: string | number) => {
    setFormData(prev => ({
      ...prev,
      [field]: value
    }))
  }

  const handleSave = async () => {
    setSaving(true)
    
    try {
      // Check if email has changed
      const emailChanged = client && formData.contactEmail !== client.contactEmail
      
      if (emailChanged) {
        // Get current user's access token
        const { data: { session } } = await supabase.auth.getSession()
        if (!session?.access_token) {
          alert('Authentication required. Please log in again.')
          setSaving(false)
          return
        }

        // Handle email change via API
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/admin/clients/${id}/email`, {
          method: 'PUT',
          headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            newEmail: formData.contactEmail,
            reason: 'Administrative update via client management'
          })
        })

        if (!response.ok) {
          const error = await response.json()
          console.error('Failed to update email:', error)
          alert(`Failed to update email address: ${error.error || 'Please try again.'}`)
          setSaving(false)
          return
        }

        const emailResult = await response.json()
        console.log('Email update result:', emailResult)
        
        // Show success message
        if (emailResult.requiresVerification) {
          alert(`Email updated successfully! The client will need to verify their new email address (${emailResult.newEmail}) before they can log in.`)
        } else {
          alert('Email updated successfully!')
        }
      }

      // Update other client data
      console.log('Saving client data:', formData)
      
      // Simulate API call for other data
      setTimeout(() => {
        setSaving(false)
        // Navigate back to client details
        navigate(`/admin/clients/${id}`)
      }, 1000)
      
    } catch (error) {
      console.error('Error saving client:', error)
      alert('Failed to save changes. Please try again.')
      setSaving(false)
    }
  }

  const handleDeactivate = async () => {
    setActionLoading('deactivate')
    
    // Simulate API call
    setTimeout(() => {
      console.log('Deactivating client:', id)
      setActionLoading(null)
      navigate('/admin')
    }, 1000)
  }

  const handleArchive = async () => {
    setActionLoading('archive')
    
    // Simulate API call
    setTimeout(() => {
      console.log('Archiving client:', id)
      setActionLoading(null)
      navigate('/admin')
    }, 1000)
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-4 border-gray-400 border-t-transparent mx-auto mb-4"></div>
          <p className="text-lg text-gray-700">Loading client...</p>
        </div>
      </div>
    )
  }

  if (!client) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Client Not Found</h2>
          <p className="text-gray-600 mb-6">The requested client could not be found.</p>
          <Link to="/admin">
            <Button>
              Back to Admin
            </Button>
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Breadcrumb Navigation */}
        <Breadcrumb className="mb-6">
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to="/admin">Dashboard</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to={`/admin/clients/${id}`}>{client?.name || 'Client'}</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Edit</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Edit Client</h1>
        </div>

        {/* Form */}
        <Card className="mb-8">
          <CardContent className="pt-6">
            <ClientFormFields 
              formData={formData}
              onInputChange={handleInputChange}
              originalEmail={client?.contactEmail}
              isEditing={true}
            />

            {/* Action Buttons */}
            <div className="flex items-center justify-between pt-6 border-t mt-6">
              <div className="flex gap-3">
                <Link to={`/admin/clients/${id}`}>
                  <Button variant="outline">Cancel</Button>
                </Link>
                <Button onClick={handleSave} disabled={saving}>
                  {saving ? (
                    <>
                      <div className="animate-spin rounded-full h-4 w-4 border-2 border-white border-t-transparent mr-2"></div>
                      Saving...
                    </>
                  ) : (
                    <>
                      <Save className="h-4 w-4 mr-2" />
                      Save Changes
                    </>
                  )}
                </Button>
              </div>
              
              <div className="text-sm text-gray-600">
                Changes will be applied immediately
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Client Management Actions */}
        <ClientManagementActions
          actionLoading={actionLoading}
          onDeactivate={handleDeactivate}
          onArchive={handleArchive}
        />
      </div>
    </div>
  )
}