import React, { useState, useEffect, useContext } from 'react'
import { Link, useParams, useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Alert, AlertDescription } from '../ui/alert'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { 
  ArrowLeft,
  AlertTriangle,
  CheckCircle,
  Save
} from 'lucide-react'

interface Practitioner {
  id: string
  name: string
  email: string
  phone?: string
  status: 'active' | 'pending'
  invitedDate: string
  lastLogin?: string
  childrenCount: number
}

export function EditPractitioner() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { user } = useContext(AuthContext)
  const [practitioner, setPractitioner] = useState<Practitioner | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  
  // Form state
  const [editForm, setEditForm] = useState({
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

      // Demo data - normally would fetch from server
      const demoData = {
        'pract-1': {
          id: 'pract-1',
          name: 'Sarah Johnson',
          email: 'sarah.johnson@demoschool.com',
          phone: '+44 7700 900123',
          status: 'active' as const,
          invitedDate: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
          lastLogin: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
          childrenCount: 8
        },
        'pract-2': {
          id: 'pract-2',
          name: 'Michael Chen',
          email: 'michael.chen@demoschool.com',
          phone: '+44 7700 900124',
          status: 'active' as const,
          invitedDate: new Date(Date.now() - 45 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
          lastLogin: new Date(Date.now() - 1 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
          childrenCount: 4
        },
        'pract-3': {
          id: 'pract-3',
          name: 'Emma Williams',
          email: 'emma.williams@demoschool.com',
          status: 'pending' as const,
          invitedDate: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
          childrenCount: 0
        },
        'pract-4': {
          id: 'pract-4',
          name: 'David Brown',
          email: 'david.brown@demoschool.com',
          phone: '+44 7700 900125',
          status: 'active' as const,
          invitedDate: new Date(Date.now() - 90 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
          lastLogin: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
          childrenCount: 3
        }
      }

      const practitionerData = demoData[id as keyof typeof demoData]
      
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
        setError('Using demo data - server connection unavailable')
      }
    } catch (error) {
      console.error('Error fetching practitioner data:', error)
      setError('Failed to load practitioner data')
    } finally {
      setLoading(false)
    }
  }

  const handleSave = async () => {
    if (!practitioner) return
    
    setSaving(true)
    setError('')
    setSuccess('')
    
    try {
      console.log('Updating practitioner:', practitioner.id, editForm)
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 1500))
      
      setSuccess('Practitioner details updated successfully!')
      
      // Navigate back after a brief delay
      setTimeout(() => {
        navigate(`/practitioners/${practitioner.id}`)
      }, 1500)
    } catch (error) {
      console.error('Error updating practitioner:', error)
      setError('Failed to update practitioner details')
    } finally {
      setSaving(false)
    }
  }

  const handleSendPasswordReset = async () => {
    if (!practitioner) return
    
    setSaving(true)
    setError('')
    setSuccess('')
    
    try {
      console.log('Sending password reset to:', practitioner.email)
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 1000))
      setSuccess(`Password reset link sent to ${practitioner.email}`)
    } catch (error) {
      console.error('Error sending password reset:', error)
      setError('Failed to send password reset')
    } finally {
      setSaving(false)
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
            <Link to="/practitioners">
              <Button>
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back to Practitioners
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
              <BreadcrumbLink asChild>
                <Link to="/practitioners">Practitioners</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to={`/practitioners/${practitioner.id}`}>{practitioner.name}</Link>
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
          <h1 className="text-3xl font-bold text-gray-900">Edit Practitioner</h1>
        </div>

        {error && (
          <Alert className="mb-6 border-red-200 bg-red-50">
            <AlertTriangle className="h-4 w-4 text-red-600" />
            <AlertDescription className="text-red-800">
              {error}
            </AlertDescription>
          </Alert>
        )}

        {success && (
          <Alert className="mb-6 border-green-200 bg-green-50">
            <CheckCircle className="h-4 w-4 text-green-600" />
            <AlertDescription className="text-green-800">
              {success}
            </AlertDescription>
          </Alert>
        )}

        <div className="grid gap-6">
          {/* Edit Form */}
          <Card>
            <CardHeader>
              <CardTitle>Account Details</CardTitle>

            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <Label htmlFor="name">Name</Label>
                <Input
                  id="name"
                  value={editForm.name}
                  onChange={(e) => setEditForm(prev => ({ ...prev, name: e.target.value }))}
                  placeholder="Full name"
                  disabled={saving}
                />
              </div>
              
              <div>
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  type="email"
                  value={editForm.email}
                  onChange={(e) => setEditForm(prev => ({ ...prev, email: e.target.value }))}
                  placeholder="email"
                  disabled={saving}
                />
              </div>
              
              <div>
                <Label htmlFor="phone">Phone (Optional)</Label>
                <Input
                  id="phone"
                  value={editForm.phone}
                  onChange={(e) => setEditForm(prev => ({ ...prev, phone: e.target.value }))}
                  placeholder="+44 7700 900000"
                  disabled={saving}
                />
              </div>
            </CardContent>
          </Card>

          {/* Password Reset */}
          <Card>
            <CardHeader>
              <CardTitle>Password Management</CardTitle>

            </CardHeader>
            <CardContent>
              <Button 
                variant="outline" 
                onClick={handleSendPasswordReset}
                disabled={saving}
                className="w-full"
              >
                {saving ? 'Sending...' : 'Send Password Reset Link'}
              </Button>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-between">
            <Link to={`/practitioners/${practitioner.id}`}>
              <Button variant="outline" disabled={saving}>
                Cancel
              </Button>
            </Link>
            
            <Button onClick={handleSave} disabled={saving}>
              {saving ? (
                <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
              ) : (
                <Save className="h-4 w-4 mr-2" />
              )}
              {saving ? 'Saving...' : 'Save Changes'}
            </Button>
          </div>
        </div>
      </div>
    </div>
  )
}