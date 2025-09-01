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
  ArrowLeftRight
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

export function ReassignChildren() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { user } = useContext(AuthContext)
  const [practitioner, setPractitioner] = useState<Practitioner | null>(null)
  const [allPractitioners, setAllPractitioners] = useState<Practitioner[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  
  // Form state
  const [selectedChildren, setSelectedChildren] = useState<string[]>([])
  const [reassignTo, setReassignTo] = useState('')

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
        setError('Using demo data - server connection unavailable')
      }
    } catch (error) {
      console.error('Error fetching data:', error)
      setError('Failed to load data')
    } finally {
      setLoading(false)
    }
  }

  const handleChildSelection = (childId: string, checked: boolean) => {
    if (checked) {
      setSelectedChildren(prev => [...prev, childId])
    } else {
      setSelectedChildren(prev => prev.filter(id => id !== childId))
    }
  }

  const handleSelectAllChildren = (checked: boolean) => {
    if (checked && practitioner?.children) {
      setSelectedChildren(practitioner.children.map(c => c.id))
    } else {
      setSelectedChildren([])
    }
  }

  const handleReassign = async () => {
    if (!practitioner || selectedChildren.length === 0 || !reassignTo) return
    
    setSaving(true)
    setError('')
    setSuccess('')
    
    try {
      console.log('Reassigning children:', selectedChildren, 'to:', reassignTo)
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 2000))
      
      setSuccess(`${selectedChildren.length} children reassigned successfully!`)
      
      // Navigate back after a brief delay
      setTimeout(() => {
        navigate(`/practitioners/${practitioner.id}`)
      }, 1500)
    } catch (error) {
      console.error('Error reassigning children:', error)
      setError('Failed to reassign children')
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

  if (!practitioner.children || practitioner.children.length === 0) {
    return (
      <div className="min-h-screen bg-gray-50">
        <div className="max-w-4xl mx-auto p-6">
          <div className="mb-8">
            <div className="flex items-center gap-4 mb-4">
              <Link to={`/practitioners/${practitioner.id}`}>
                <Button variant="outline" size="sm">
                  <ArrowLeft className="h-4 w-4" />
                </Button>
              </Link>
              <h1 className="text-3xl font-bold text-gray-900">Reassign Children</h1>
            </div>
          </div>
          
          <div className="text-center py-12">
            <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
            <h2 className="text-2xl font-bold text-gray-900 mb-2">No Children to Reassign</h2>
            <p className="text-gray-600 mb-4">{practitioner.name} has no children assigned.</p>
            <Link to={`/practitioners/${practitioner.id}`}>
              <Button>
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back to Practitioner
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
            <h1 className="text-3xl font-bold text-gray-900">Reassign Children</h1>
          </div>
          <p className="text-gray-600">
            Reassign children from {practitioner.name} to another practitioner
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
          {/* Select Children */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Users className="h-5 w-5" />
                Select Children to Reassign
              </CardTitle>
              <CardDescription>
                Choose which children you want to reassign to another practitioner
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              {/* Select All */}
              <div className="flex items-center space-x-2 p-3 bg-gray-50 rounded-lg">
                <Checkbox
                  id="select-all"
                  checked={selectedChildren.length === practitioner.children?.length}
                  onCheckedChange={handleSelectAllChildren}
                  disabled={saving}
                />
                <Label htmlFor="select-all" className="font-medium">
                  Select All Children ({practitioner.children?.length || 0})
                </Label>
              </div>

              {/* Children List */}
              <div className="space-y-2 max-h-60 overflow-y-auto">
                {practitioner.children?.map((child) => (
                  <div key={child.id} className="flex items-center space-x-3 p-3 border rounded-lg">
                    <Checkbox
                      id={child.id}
                      checked={selectedChildren.includes(child.id)}
                      onCheckedChange={(checked) => handleChildSelection(child.id, checked)}
                      disabled={saving}
                    />
                    <div className="flex-1">
                      <Label htmlFor={child.id} className="font-medium">{child.name}</Label>
                    </div>
                  </div>
                ))}
              </div>

              {selectedChildren.length > 0 && (
                <Alert className="border-gray-200 bg-gray-50">
                  <AlertTriangle className="h-4 w-4 text-gray-600" />
                  <AlertDescription className="text-gray-800">
                    {selectedChildren.length} children selected for reassignment
                  </AlertDescription>
                </Alert>
              )}
            </CardContent>
          </Card>

          {/* Select Target Practitioner */}
          {selectedChildren.length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Assign To</CardTitle>
                <CardDescription>
                  Choose which practitioner will receive the selected children
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div>
                  <Label>Target Practitioner</Label>
                  <Select value={reassignTo} onValueChange={setReassignTo} disabled={saving}>
                    <SelectTrigger>
                      <SelectValue placeholder="Select practitioner..." />
                    </SelectTrigger>
                    <SelectContent>
                      {allPractitioners.map((p) => (
                        <SelectItem key={p.id} value={p.id}>
                          {p.name} ({p.childrenCount} children)
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>

                {allPractitioners.length === 0 && (
                  <Alert className="border-red-200 bg-red-50 mt-4">
                    <AlertTriangle className="h-4 w-4 text-red-600" />
                    <AlertDescription className="text-red-800">
                      No other active practitioners available for reassignment
                    </AlertDescription>
                  </Alert>
                )}
              </CardContent>
            </Card>
          )}

          {/* Actions */}
          <div className="flex justify-between">
            <Link to={`/practitioners/${practitioner.id}`}>
              <Button variant="outline" disabled={saving}>
                Cancel
              </Button>
            </Link>
            
            <Button 
              onClick={handleReassign}
              disabled={selectedChildren.length === 0 || !reassignTo || saving || allPractitioners.length === 0}
            >
              {saving ? (
                <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
              ) : (
                <ArrowLeftRight className="h-4 w-4 mr-2" />
              )}
              {saving ? 'Reassigning...' : `Reassign ${selectedChildren.length} Children`}
            </Button>
          </div>
        </div>
      </div>
    </div>
  )
}