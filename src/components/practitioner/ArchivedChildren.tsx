import React, { useState, useEffect, useContext } from 'react'
import { Link } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId } from '../../utils/supabase/info'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Alert, AlertDescription } from '../ui/alert'
import { Badge } from '../ui/badge'
import { Checkbox } from '../ui/checkbox'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { 
  Archive, 
  Search, 
  RotateCcw,
  AlertTriangle
} from 'lucide-react'

interface ArchivedChild {
  id: string
  name: string
  status: 'archived'
  practitioner?: string
  practitionerId?: string
  archivedAt: string
  archivedBy: string
  lastCheckIn?: string
}

export function ArchivedChildren() {
  const { user } = useContext(AuthContext)
  const [archivedChildren, setArchivedChildren] = useState<ArchivedChild[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedChildren, setSelectedChildren] = useState<string[]>([])
  const [restoreLoading, setRestoreLoading] = useState(false)

  useEffect(() => {
    fetchArchivedChildren()
  }, [user])

  const fetchArchivedChildren = async () => {
    if (!user) return

    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()
      
      if (session?.access_token) {
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/archived`, {
          headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
          },
        })

        if (response.ok) {
          const data = await response.json()
          setArchivedChildren(data.archivedChildren || [])
          setError('') // Clear any previous errors
        } else {
          const errorData = await response.text()
          console.error('Server response error:', response.status, errorData)
          throw new Error(`Server error: ${response.status} - ${errorData}`)
        }
      } else {
        // Demo data fallback
        setArchivedChildren([
          {
            id: 'archived-1',
            name: 'Thomas Anderson',
            status: 'archived',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1',
            archivedAt: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000).toISOString(),
            archivedBy: 'admin-1',
            lastCheckIn: '1 week ago'
          },
          {
            id: 'archived-2',
            name: 'Katie Brown',
            status: 'archived',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2',
            archivedAt: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString(),
            archivedBy: 'admin-1',
            lastCheckIn: '2 weeks ago'
          }
        ])
        
      }
    } catch (error) {
      console.error('Error fetching archived children:', error)
      setError(`Failed to load archived children: ${error.message || error.toString()}`)
    } finally {
      setLoading(false)
    }
  }

  const handleSelectAll = () => {
    if (selectedChildren.length === filteredChildren.length) {
      setSelectedChildren([])
    } else {
      setSelectedChildren(filteredChildren.map(child => child.id))
    }
  }

  const handleSelectChild = (childId: string) => {
    setSelectedChildren(prev => 
      prev.includes(childId)
        ? prev.filter(id => id !== childId)
        : [...prev, childId]
    )
  }

  const handleBulkRestore = async () => {
    if (selectedChildren.length === 0) return
    
    setRestoreLoading(true)
    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()
      
      if (session?.access_token) {
        // Restore each child individually
        const restorePromises = selectedChildren.map(async (childId) => {
          const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/restore/${childId}`, {
            method: 'POST',
            headers: {
              'Authorization': `Bearer ${session.access_token}`,
              'Content-Type': 'application/json',
            },
          })

          if (!response.ok) {
            throw new Error(`Failed to restore child ${childId}`)
          }
        })

        await Promise.all(restorePromises)
        
        // Remove restored children from local state
        setArchivedChildren(prev => prev.filter(child => !selectedChildren.includes(child.id)))
        setSelectedChildren([])
        
        // Show success message
        alert(`Successfully restored ${selectedChildren.length} children`)
      } else {
        // Demo mode fallback
        setArchivedChildren(prev => prev.filter(child => !selectedChildren.includes(child.id)))
        setSelectedChildren([])
        alert(`Successfully restored ${selectedChildren.length} children`)
      }
    } catch (error) {
      console.error('Error restoring children:', error)
      alert('Failed to restore children')
    } finally {
      setRestoreLoading(false)
    }
  }

  const handleRestoreSingle = async (childId: string) => {
    setRestoreLoading(true)
    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()
      
      if (session?.access_token) {
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/restore/${childId}`, {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
          },
        })

        if (response.ok) {
          // Remove restored child from local state
          setArchivedChildren(prev => prev.filter(child => child.id !== childId))
          alert('Child restored successfully')
        } else {
          throw new Error('Failed to restore child')
        }
      } else {
        // Demo mode fallback
        setArchivedChildren(prev => prev.filter(child => child.id !== childId))
        alert('Child restored successfully')
      }
    } catch (error) {
      console.error('Error restoring child:', error)
      alert('Failed to restore child')
    } finally {
      setRestoreLoading(false)
    }
  }

  const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    return date.toLocaleDateString('en-GB', {
      day: 'numeric',
      month: 'short',
      year: 'numeric'
    })
  }

  const filteredChildren = archivedChildren.filter(child => 
    child.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    (child.practitioner && child.practitioner.toLowerCase().includes(searchTerm.toLowerCase()))
  )

  const isAllSelected = filteredChildren.length > 0 && selectedChildren.length === filteredChildren.length
  const isSomeSelected = selectedChildren.length > 0

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-gray-600"></div>
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
              <BreadcrumbPage>Archived Children</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">
              Archived Children
            </h1>
            <p className="text-gray-600 mt-2">
              View and restore archived children.
            </p>
          </div>
        </div>

        {error && (
          <Alert className="mb-6 border-red-200 bg-red-50">
            <AlertTriangle className="h-4 w-4 text-red-600" />
            <AlertDescription className="text-red-800">
              {error}
            </AlertDescription>
          </Alert>
        )}

        {/* Archived Children Section */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <CardTitle className="flex items-center gap-2">
                <Archive className="h-5 w-5" />
                Archived Children ({filteredChildren.length})
              </CardTitle>
              <div className="flex items-center gap-3">
                <div className="flex items-center gap-2">
                  <Search className="h-4 w-4 text-gray-500" />
                  <Input
                    placeholder="Search archived children..."
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="w-64"
                  />
                </div>
              </div>
            </div>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {filteredChildren.length === 0 ? (
                <div className="text-center py-8 text-gray-500">
                  {archivedChildren.length === 0 ? 
                    'No archived children found.' : 
                    'No archived children match your search.'
                  }
                </div>
              ) : (
                <>
                  {/* Bulk Actions Header */}
                  <div className="flex items-center justify-between p-4 bg-gray-50 rounded-lg border">
                    <div className="flex items-center gap-3">
                      <Checkbox
                        checked={isAllSelected}
                        onCheckedChange={handleSelectAll}
                        aria-label="Select all archived children"
                      />
                      <span className="text-sm font-medium">
                        {isSomeSelected ? (
                          `${selectedChildren.length} of ${filteredChildren.length} selected`
                        ) : (
                          'Select all'
                        )}
                      </span>
                    </div>
                    
                    {isSomeSelected && (
                      <Button
                        variant="outline"
                        size="sm"
                        onClick={handleBulkRestore}
                        disabled={restoreLoading}
                        className="flex items-center gap-1 text-blue-600 hover:text-blue-700 border-blue-200 hover:border-blue-300"
                      >
                        <RotateCcw className="h-4 w-4" />
                        Restore ({selectedChildren.length})
                      </Button>
                    )}
                  </div>

                  {/* Archived Children List */}
                  {filteredChildren.map((child) => (
                    <div key={child.id} className="flex items-center justify-between p-4 border rounded-lg bg-gray-50">
                      <div className="flex items-center gap-4">
                        <Checkbox
                          checked={selectedChildren.includes(child.id)}
                          onCheckedChange={() => handleSelectChild(child.id)}
                          aria-label={`Select ${child.name}`}
                        />
                        <div className="flex-1">
                          <div className="flex items-center gap-3 mb-1">
                            <h4 className="font-medium">{child.name}</h4>
                            <Badge variant="outline" className="text-gray-600 border-gray-300 bg-gray-100">
                              Archived
                            </Badge>
                          </div>
                          <div className="space-y-1">
                            <div className="text-sm text-gray-600">
                              Archived on: {formatDate(child.archivedAt)}
                            </div>
                            {child.practitioner && (
                              <div className="text-sm text-gray-600">
                                Last practitioner: {child.practitioner}
                              </div>
                            )}
                            {child.lastCheckIn && (
                              <div className="text-sm text-gray-600">
                                Last check-in: {child.lastCheckIn}
                              </div>
                            )}
                          </div>
                        </div>
                      </div>
                      
                      <div className="flex items-center gap-2">
                        <Button 
                          variant="outline" 
                          size="sm"
                          onClick={() => handleRestoreSingle(child.id)}
                          disabled={restoreLoading}
                          className="flex items-center gap-1 text-blue-600 hover:text-blue-700 border-blue-200 hover:border-blue-300"
                        >
                          <RotateCcw className="h-4 w-4" />
                          Restore
                        </Button>
                      </div>
                    </div>
                  ))}
                </>
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}