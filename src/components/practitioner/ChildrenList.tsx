import React, { useState, useEffect, useContext } from 'react'
import { Link } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Alert, AlertDescription } from '../ui/alert'
import { Checkbox } from '../ui/checkbox'
import { 
  Search, 
  Plus, 
  Users, 
  AlertTriangle,
  Download,
  UserX,
  Archive
} from 'lucide-react'
import { Child, adminModeChildren, practitionerModeChildren } from './childrenData'
import { getStatusBadge, filterChildren, getUniquePractitioners } from './childrenUtils'
import { ChildrenEmptyState } from './ChildrenEmptyState'
import { BulkReassignDialog } from './BulkReassignDialog'
import { BulkArchiveDialog } from './BulkArchiveDialog'

export function ChildrenList() {
  const { user, currentMode } = useContext(AuthContext)
  const [children, setChildren] = useState<Child[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [searchTerm, setSearchTerm] = useState('')
  const [statusFilter, setStatusFilter] = useState<string>('all')
  const [practitionerFilter, setPractitionerFilter] = useState<string>('all')
  const [selectedChildren, setSelectedChildren] = useState<string[]>([])
  const [bulkActionLoading, setBulkActionLoading] = useState(false)
  const [showReassignDialog, setShowReassignDialog] = useState(false)
  const [showArchiveDialog, setShowArchiveDialog] = useState(false)
  const [practitioners, setPractitioners] = useState<any[]>([]) // For reassignment dialog

  const isGroupContact = user?.profile.role === 'GroupContact'
  const isAdminMode = isGroupContact && currentMode === 'admin'

  useEffect(() => {
    fetchChildren()
  }, [user, currentMode])

  const fetchChildren = async () => {
    if (!user) return

    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()

      // Demo data based on current mode
      if (isAdminMode) {
        setChildren(adminModeChildren)
        // Set practitioners data for admin mode
        setPractitioners([
          {
            id: 'pract-1',
            name: 'Sarah Johnson',
            email: 'sarah.johnson@demoschool.com',
            status: 'active',
            childrenCount: 8
          },
          {
            id: 'pract-2',
            name: 'Michael Chen',
            email: 'michael.chen@demoschool.com',
            status: 'active',
            childrenCount: 6
          },
          {
            id: 'pract-4',
            name: 'David Brown',
            email: 'david.brown@demoschool.com',
            status: 'active',
            childrenCount: 5
          }
        ])
      } else {
        setChildren(practitionerModeChildren)
        setPractitioners([]) // Practitioners don't need reassignment options for themselves
      }

      if (sessionError || !session?.access_token) {
        
      }
    } catch (error) {
      console.error('Error fetching children:', error)
      setError('Failed to load children data')
    } finally {
      setLoading(false)
    }
  }

  const filteredChildren = filterChildren(children, searchTerm, statusFilter, practitionerFilter)
  const uniquePractitioners = getUniquePractitioners(children)

  const downloadCredentials = async () => {
    const selectedChildrenData = children.filter(child => selectedChildren.includes(child.id))
    
    // Create CSV content
    const csvHeaders = ['Name', 'Username', 'Access PIN', 'Practitioner']
    const csvRows = selectedChildrenData.map(child => [
      child.name,
      `${child.name.toLowerCase().replace(/\s+/g, '')}${child.id.slice(-4)}`,
      Math.floor(1000 + Math.random() * 9000).toString(),
      child.practitioner || 'Unassigned'
    ])
    
    const csvContent = [
      csvHeaders.join(','),
      ...csvRows.map(row => row.map(cell => `"${cell}"`).join(','))
    ].join('\n')
    
    // Create and download file
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' })
    const link = document.createElement('a')
    const url = URL.createObjectURL(blob)
    link.setAttribute('href', url)
    link.setAttribute('download', `child-credentials-${new Date().toISOString().split('T')[0]}.csv`)
    link.style.visibility = 'hidden'
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
  }

  const handleBulkReassign = () => {
    if (isAdminMode && practitioners.length > 0) {
      setShowReassignDialog(true)
    } else {
      // For practitioner mode, show a message that they can't reassign
      alert('Only Group Admin users can reassign children to different practitioners')
    }
  }

  const handleBulkArchive = () => {
    setShowArchiveDialog(true)
  }

  const confirmBulkReassign = async (newPractitionerId: string) => {
    if (selectedChildren.length === 0) return
    
    setBulkActionLoading(true)
    try {
      const newPractitionerName = practitioners.find(p => p.id === newPractitionerId)?.name || 'Unknown'
      
      // Update children in local state
      setChildren(prev => prev.map(child => 
        selectedChildren.includes(child.id)
          ? { ...child, practitionerId: newPractitionerId, practitioner: newPractitionerName }
          : child
      ))
      setSelectedChildren([])
      setShowReassignDialog(false)
      
      // Show success message
      alert(`Successfully reassigned ${selectedChildren.length} children to ${newPractitionerName}`)
    } catch (error) {
      console.error('Error reassigning children:', error)
      alert('Failed to reassign children')
    } finally {
      setBulkActionLoading(false)
    }
  }

  const confirmBulkArchive = async () => {
    if (selectedChildren.length === 0) return
    
    setBulkActionLoading(true)
    try {
      // Remove archived children from local state
      setChildren(prev => prev.filter(child => !selectedChildren.includes(child.id)))
      setSelectedChildren([])
      setShowArchiveDialog(false)
      
      // Show success message
      alert(`Successfully archived ${selectedChildren.length} children`)
    } catch (error) {
      console.error('Error archiving children:', error)
      alert('Failed to archive children')
    } finally {
      setBulkActionLoading(false)
    }
  }

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
        {/* Header */}
        <div className="mb-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">
              {isAdminMode ? 'All Children' : 'My Children'}
            </h1>
            <p className="text-gray-600 mt-2">
              {isAdminMode 
                ? 'Manage all children across your organisation'
                : 'Manage and track your assigned children\'s wellbeing'
              }
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

        {/* Children Section */}
        <Card>
          <CardHeader className="pb-4 border-b border-gray-200">
            <div className="flex items-center justify-between mb-6">
              <CardTitle className="flex items-center gap-2">
                <Users className="h-5 w-5" />
                {isAdminMode ? 'All Children' : 'My Children'}
              </CardTitle>
              <div className="flex items-center space-x-4">
                <Link to="/children/bulk-import">
                  <Button variant="outline">
                    <Users className="h-4 w-4 mr-2" />
                    Bulk Import
                  </Button>
                </Link>
                <Link to="/children/new">
                  <Button>
                    <Plus className="h-4 w-4 mr-2" />
                    Add Child
                  </Button>
                </Link>
              </div>
            </div>
            
            {/* Search and Filters inside card */}
            <div className="flex flex-col md:flex-row gap-4 mb-6">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-gray-400" />
                <Input
                  placeholder={`Search children${isAdminMode ? '...' : '...'}`}
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
              <div className="flex gap-2">
                <Select value={statusFilter} onValueChange={setStatusFilter}>
                  <SelectTrigger className="w-32">
                    <SelectValue placeholder="All Status" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Status</SelectItem>
                    <SelectItem value="fine">Fine</SelectItem>
                    <SelectItem value="needs_attention">Needs Attention</SelectItem>
                    <SelectItem value="flagged">Flagged</SelectItem>
                  </SelectContent>
                </Select>

                {isAdminMode && (
                  <Select value={practitionerFilter} onValueChange={setPractitionerFilter}>
                    <SelectTrigger className="w-40">
                      <SelectValue placeholder="All Practitioners" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="all">All Practitioners</SelectItem>
                      {uniquePractitioners.map((practitioner) => (
                        <SelectItem key={practitioner.id} value={practitioner.id}>
                          {practitioner.name}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                )}
              </div>
            </div>

            {/* Select all option */}
            <div className="flex items-center gap-2">
              <Checkbox 
                checked={selectedChildren.length === filteredChildren.length && filteredChildren.length > 0}
                onCheckedChange={(checked) => {
                  if (checked) {
                    setSelectedChildren(filteredChildren.map(child => child.id))
                  } else {
                    setSelectedChildren([])
                  }
                }}
              />
              <span className="text-sm text-gray-600">
                Select all on this page ({filteredChildren.length})
              </span>
            </div>

            {/* Bulk Actions */}
            {selectedChildren.length > 0 && (
              <div className="flex items-center gap-2 mt-4 pt-4 border-t border-gray-200">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={downloadCredentials}
                  disabled={bulkActionLoading}
                >
                  <Download className="h-4 w-4 mr-2" />
                  Download Credentials ({selectedChildren.length})
                </Button>
{isAdminMode && (
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={handleBulkReassign}
                    disabled={bulkActionLoading}
                  >
                    <UserX className="h-4 w-4 mr-2" />
                    Reassign ({selectedChildren.length})
                  </Button>
                )}
                <Button
                  variant="outline"
                  size="sm"
                  onClick={handleBulkArchive}
                  disabled={bulkActionLoading}
                >
                  <Archive className="h-4 w-4 mr-2" />
                  Archive ({selectedChildren.length})
                </Button>
              </div>
            )}
          </CardHeader>
          <CardContent className="p-0">
            {filteredChildren.length === 0 ? (
              <ChildrenEmptyState 
                searchTerm={searchTerm}
                statusFilter={statusFilter}
                practitionerFilter={practitionerFilter}
                isAdminMode={isAdminMode}
              />
            ) : (
              <div className="divide-y divide-gray-200">
                {filteredChildren.map((child) => (
                  <div 
                    key={child.id} 
                    className="flex items-center justify-between py-4 px-6 hover:bg-gray-50 transition-colors"
                  >
                    <div className="flex items-center gap-3">
                      <Checkbox 
                        checked={selectedChildren.includes(child.id)}
                        onCheckedChange={(checked) => {
                          if (checked) {
                            setSelectedChildren([...selectedChildren, child.id])
                          } else {
                            setSelectedChildren(selectedChildren.filter(id => id !== child.id))
                          }
                        }}
                      />
                      <div>
                        <div className="font-medium text-gray-900">{child.name}</div>
                        <div className="text-sm text-gray-500">
                          Last check-in: {child.lastCheckIn}
                          {isAdminMode && child.practitioner && (
                            <span> • Practitioner: {child.practitioner}</span>
                          )}
                        </div>
                      </div>
                    </div>
                    <div>
                      {getStatusBadge(child.status)}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>

        {/* Bulk Action Dialogs */}
        {isAdminMode && (
          <>
            <BulkReassignDialog
              open={showReassignDialog}
              onOpenChange={setShowReassignDialog}
              selectedChildren={children.filter(child => selectedChildren.includes(child.id)).map(child => child.name)}
              practitioners={practitioners}
              onConfirm={confirmBulkReassign}
              loading={bulkActionLoading}
            />

            <BulkArchiveDialog
              open={showArchiveDialog}
              onOpenChange={setShowArchiveDialog}
              selectedChildren={children.filter(child => selectedChildren.includes(child.id)).map(child => child.name)}
              onConfirm={confirmBulkArchive}
              loading={bulkActionLoading}
            />
          </>
        )}

        {/* Archive Dialog for Practitioner Mode */}
        {!isAdminMode && (
          <BulkArchiveDialog
            open={showArchiveDialog}
            onOpenChange={setShowArchiveDialog}
            selectedChildren={children.filter(child => selectedChildren.includes(child.id)).map(child => child.name)}
            onConfirm={confirmBulkArchive}
            loading={bulkActionLoading}
          />
        )}
      </div>
    </div>
  )
}