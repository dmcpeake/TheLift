import React, { useState, useEffect, useContext } from 'react'
import { Link, useParams, useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Alert, AlertDescription } from '../ui/alert'
import { Label } from '../ui/label'
import { Checkbox } from '../ui/checkbox'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { 
  ArrowLeft,
  AlertTriangle,
  CheckCircle,
  Users,
  Trash2,
  ArrowLeftRight,
  UserCheck
} from 'lucide-react'

interface Child {
  id: string
  name: string
  status: 'fine' | 'needs_attention' | 'flagged'
}

interface Practitioner {
  id: string
  name: string
  email: string
  phone?: string
  status: 'active' | 'pending'
  childrenCount: number
  children?: Child[]
}

export function DeletePractitioner() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { user } = useContext(AuthContext)
  const [practitioner, setPractitioner] = useState<Practitioner | null>(null)
  const [allPractitioners, setAllPractitioners] = useState<Practitioner[]>([])
  const [loading, setLoading] = useState(true)
  const [deleting, setDeleting] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [deleteConfirmed, setDeleteConfirmed] = useState(false)
  
  // Optional reassignment state
  const [reassignments, setReassignments] = useState<Record<string, string>>({})
  const [reassignAllTo, setReassignAllTo] = useState<string>('unassigned')

  useEffect(() => {
    fetchData()
  }, [id])

  const fetchData = async () => {
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
          childrenCount: 8,
          children: [
            { id: 'child-1', name: 'Emma Thompson', status: 'fine' as const },
            { id: 'child-2', name: 'James Wilson', status: 'needs_attention' as const },
            { id: 'child-3', name: 'Sophie Chen', status: 'flagged' as const },
            { id: 'child-4', name: 'Oliver Brown', status: 'fine' as const },
            { id: 'child-5', name: 'Lily Davis', status: 'fine' as const },
            { id: 'child-6', name: 'Max Taylor', status: 'needs_attention' as const },
            { id: 'child-7', name: 'Chloe Wilson', status: 'fine' as const },
            { id: 'child-8', name: 'Ryan Clarke', status: 'fine' as const }
          ]
        },
        'pract-2': {
          id: 'pract-2',
          name: 'Michael Chen',
          email: 'michael.chen@demoschool.com',
          phone: '+44 7700 900124',
          status: 'active' as const,
          childrenCount: 4,
          children: [
            { id: 'child-9', name: 'Alice Johnson', status: 'fine' as const },
            { id: 'child-10', name: 'Ben Williams', status: 'fine' as const },
            { id: 'child-11', name: 'Grace Lee', status: 'needs_attention' as const },
            { id: 'child-12', name: 'Lucas Smith', status: 'fine' as const }
          ]
        },
        'pract-3': {
          id: 'pract-3',
          name: 'Emma Williams',
          email: 'emma.williams@demoschool.com',
          status: 'pending' as const,
          childrenCount: 0,
          children: []
        },
        'pract-4': {
          id: 'pract-4',
          name: 'David Brown',
          email: 'david.brown@demoschool.com',
          phone: '+44 7700 900125',
          status: 'active' as const,
          childrenCount: 3,
          children: [
            { id: 'child-13', name: 'Maya Patel', status: 'fine' as const },
            { id: 'child-14', name: 'Jack Murphy', status: 'flagged' as const },
            { id: 'child-15', name: 'Zoe Garcia', status: 'fine' as const }
          ]
        }
      }

      const practitionerData = demoData[id as keyof typeof demoData]
      const allPractitionersData = Object.values(demoData).filter(p => p.id !== id && p.status === 'active')
      
      if (practitionerData) {
        setPractitioner(practitionerData)
        setAllPractitioners(allPractitionersData)
      } else {
        setError('Practitioner not found')
      }
      
      if (sessionError || !session?.access_token) {
        
      }
    } catch (error) {
      console.error('Error fetching data:', error)
      setError('Failed to load data')
    } finally {
      setLoading(false)
    }
  }

  const handleReassignment = (childId: string, newPractitionerId: string) => {
    setReassignments(prev => ({
      ...prev,
      [childId]: newPractitionerId
    }))
  }

  const handleReassignAll = (practitionerId: string) => {
    setReassignAllTo(practitionerId)
    
    if (practitioner?.children) {
      const newReassignments: Record<string, string> = {}
      practitioner.children.forEach(child => {
        newReassignments[child.id] = practitionerId
      })
      setReassignments(newReassignments)
    }
  }

  const handleDelete = async () => {
    if (!practitioner || !deleteConfirmed) return
    
    setDeleting(true)
    setError('')
    setSuccess('')
    
    try {
      console.log('Deleting practitioner:', practitioner.id, 'with reassignments:', reassignments)
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 2000))
      
      setSuccess('Practitioner deleted successfully!')
      
      // Navigate back after a brief delay
      setTimeout(() => {
        navigate('/practitioners')
      }, 1500)
    } catch (error) {
      console.error('Error deleting practitioner:', error)
      setError('Failed to delete practitioner')
    } finally {
      setDeleting(false)
    }
  }

  const hasChildren = practitioner?.childrenCount > 0
  const assignedChildrenCount = Object.values(reassignments).filter(value => value && value !== 'unassigned').length
  const unassignedChildrenCount = hasChildren ? (practitioner?.children?.length || 0) - assignedChildrenCount : 0

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
        <div className="max-w-4xl mx-auto p-6">
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
      <div className="max-w-4xl mx-auto p-6">
        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center gap-4 mb-4">
            <Link to={`/practitioners/${practitioner.id}`}>
              <Button variant="outline" size="sm">
                <ArrowLeft className="h-4 w-4" />
              </Button>
            </Link>
            <div className="flex items-center gap-2">
              <AlertTriangle className="h-6 w-6 text-red-600" />
              <h1 className="text-3xl font-bold text-gray-900">Delete Practitioner</h1>
            </div>
          </div>
          <p className="text-gray-600">
            This action cannot be undone. Please review the details below before proceeding.
          </p>
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
          {/* Practitioner Summary */}
          <Card className="border-red-200">
            <CardHeader>
              <CardTitle className="text-red-600">Delete: {practitioner.name}</CardTitle>
              <CardDescription>
                This practitioner will be permanently removed from the system
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                <p><span className="font-medium">Email:</span> {practitioner.email}</p>
                {practitioner.phone && <p><span className="font-medium">Phone:</span> {practitioner.phone}</p>}
                <p><span className="font-medium">Status:</span> {practitioner.status}</p>
                <p><span className="font-medium">Assigned Children:</span> {practitioner.childrenCount}</p>
              </div>
            </CardContent>
          </Card>

          {/* Optional Child Reassignment */}
          {hasChildren && (
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <ArrowLeftRight className="h-5 w-5" />
                  Reassign Children (Optional)
                </CardTitle>
                <CardDescription>
                  You can optionally reassign children to other practitioners. Any children not reassigned will be moved to "Unassigned".
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                {/* Reassign All Option */}
                {allPractitioners.length > 0 && (
                  <div className="bg-white border border-gray-200 rounded-lg p-4 shadow-sm">
                    <div className="flex items-center gap-3 mb-3">
                      <UserCheck className="h-5 w-5 text-gray-700" />
                      <Label className="font-medium text-gray-900">Reassign All Children To:</Label>
                    </div>
                    <div className="flex items-center gap-3">
                      <div className="flex-1">
                        <Select 
                          value={reassignAllTo} 
                          onValueChange={handleReassignAll}
                          disabled={deleting}
                        >
                          <SelectTrigger className="bg-white">
                            <SelectValue placeholder="Choose practitioner for all children..." />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="unassigned">Leave all unassigned</SelectItem>
                            {allPractitioners.map((p) => (
                              <SelectItem key={p.id} value={p.id}>
                                {p.name} ({p.childrenCount} children)
                              </SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                      </div>
                    </div>
                    <p className="text-sm text-gray-600 mt-3">
                      This will assign all {practitioner.children?.length || 0} children to the selected practitioner. 
                      You can still override individual assignments below.
                    </p>
                  </div>
                )}

                {/* Individual Child Assignments */}
                <div>
                  <Label className="text-sm font-medium text-gray-700 mb-3 block">
                    Individual Assignments:
                  </Label>
                  <div className="space-y-3">
                    {practitioner.children?.map((child) => (
                      <div key={child.id} className="flex items-center justify-between p-3 border rounded-lg">
                        <div className="flex items-center gap-3">
                          <div className="w-8 h-8 bg-gray-100 rounded-full flex items-center justify-center">
                            <span className="text-sm text-gray-600">{child.name.charAt(0)}</span>
                          </div>
                          <div>
                            <span className="font-medium">{child.name}</span>
                          </div>
                        </div>
                        
                        <div className="w-64">
                          <Select 
                            value={reassignments[child.id] || 'unassigned'} 
                            onValueChange={(value) => handleReassignment(child.id, value)}
                            disabled={deleting}
                          >
                            <SelectTrigger>
                              <SelectValue placeholder="Leave unassigned" />
                            </SelectTrigger>
                            <SelectContent>
                              <SelectItem value="unassigned">Leave unassigned</SelectItem>
                              {allPractitioners.map((p) => (
                                <SelectItem key={p.id} value={p.id}>
                                  {p.name} ({p.childrenCount} children)
                                </SelectItem>
                              ))}
                            </SelectContent>
                          </Select>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                {allPractitioners.length === 0 && (
                  <Alert className="border-gray-200 bg-gray-50">
                    <AlertTriangle className="h-4 w-4 text-gray-600" />
                    <AlertDescription className="text-gray-800">
                      No other active practitioners available for reassignment. All children will be moved to "Unassigned".
                    </AlertDescription>
                  </Alert>
                )}

                {assignedChildrenCount > 0 && (
                  <Alert className="border-green-200 bg-green-50">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    <AlertDescription className="text-green-800">
                      {assignedChildrenCount} children will be reassigned to other practitioners.
                    </AlertDescription>
                  </Alert>
                )}
              </CardContent>
            </Card>
          )}

          {/* What Will Happen */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Users className="h-5 w-5" />
                What Will Happen
              </CardTitle>
              <CardDescription>
                When you delete this practitioner, the following actions will be taken:
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-gray-400 rounded-full mt-2"></div>
                  <div>
                    <p className="font-medium">Practitioner account will be deleted</p>
                    <p className="text-gray-600">All account data and access will be permanently removed</p>
                  </div>
                </div>
                
                {hasChildren && (
                  <>
                    {assignedChildrenCount > 0 && (
                      <div className="flex items-start gap-3">
                        <div className="w-2 h-2 bg-green-500 rounded-full mt-2"></div>
                        <div>
                          <p className="font-medium">{assignedChildrenCount} children will be reassigned</p>
                          <p className="text-gray-600">These children will be transferred to their selected practitioners</p>
                        </div>
                      </div>
                    )}
                    
                    {unassignedChildrenCount > 0 && (
                      <div className="flex items-start gap-3">
                        <div className="w-2 h-2 bg-gray-400 rounded-full mt-2"></div>
                        <div>
                          <p className="font-medium">{unassignedChildrenCount} children will be moved to "Unassigned"</p>
                          <p className="text-gray-600">These can be reassigned to practitioners later from the children list</p>
                        </div>
                      </div>
                    )}
                  </>
                )}
                
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-gray-400 rounded-full mt-2"></div>
                  <div>
                    <p className="font-medium">Historical data will be preserved</p>
                    <p className="text-gray-600">Child wellbeing records and check-ins will remain intact</p>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Warning */}
          <Alert className="border-red-200 bg-red-50">
            <AlertTriangle className="h-4 w-4 text-red-600" />
            <AlertDescription className="text-red-800">
              <strong>Warning:</strong> This action cannot be undone. The practitioner account will be permanently deleted and cannot be recovered.
            </AlertDescription>
          </Alert>

          {/* Confirmation */}
          <Card className="border-red-200">
            <CardHeader>
              <CardTitle className="text-red-600">Confirm Deletion</CardTitle>
              <CardDescription>
                Please confirm that you understand the consequences of this action
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="flex items-center space-x-2">
                <Checkbox
                  id="confirm-delete"
                  checked={deleteConfirmed}
                  onCheckedChange={setDeleteConfirmed}
                  disabled={deleting}
                />
                <Label htmlFor="confirm-delete" className="text-red-600 font-medium">
                  I understand this action cannot be undone and I want to permanently delete {practitioner.name}
                </Label>
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-between">
            <Link to={`/practitioners/${practitioner.id}`}>
              <Button variant="outline" disabled={deleting}>
                Cancel
              </Button>
            </Link>
            
            <Button 
              onClick={handleDelete}
              disabled={!deleteConfirmed || deleting}
              className="bg-red-600 hover:bg-red-700 text-white"
            >
              {deleting ? (
                <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
              ) : (
                <Trash2 className="h-4 w-4 mr-2" />
              )}
              {deleting ? 'Deleting...' : 'Delete Practitioner'}
            </Button>
          </div>
        </div>
      </div>
    </div>
  )
}