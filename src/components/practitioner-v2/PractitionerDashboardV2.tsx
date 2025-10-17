import React, { useState, useEffect, useContext } from 'react'
import { Link } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Alert, AlertDescription } from '../ui/alert'
import { Badge } from '../ui/badge'
import { Checkbox } from '../ui/checkbox'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { BulkReassignDialog } from '../practitioner/BulkReassignDialog'
import { BulkArchiveDialog } from '../practitioner/BulkArchiveDialog'
import { PageLoader } from '../shared/LottieLoader'
import {
  Users,
  UserPlus,
  AlertTriangle,
  Plus,
  UserCheck,
  Shield,
  Search,
  Filter,
  Settings,
  Archive,
  UserX,
  MoreHorizontal,
  Download
} from 'lucide-react'

interface DashboardStats {
  totalChildren: number
  myChildren?: number
  activeChildren: number
  needsAttention: number
  flaggedChildren: number
  archivedChildren: number
  totalPractitioners?: number
  activePractitioners?: number
  pendingInvites?: number
  usedSeats: number
  totalSeats: number
}

interface Child {
  id: string
  name: string
  lastCheckIn: string
  status: 'fine' | 'needs_attention' | 'flagged'
  practitioner?: string
  practitionerId?: string
  username?: string
  accessPin?: string
}

interface Practitioner {
  id: string
  name: string
  email: string
  phone?: string
  status: 'active' | 'pending'
  invitedDate: string
  lastLogin?: string
  childrenCount: number
  children?: {
    id: string
    name: string
    status: 'fine' | 'needs_attention' | 'flagged'
  }[]
}

export function PractitionerDashboardV2() {
  const { user, currentMode } = useContext(AuthContext)
  const [stats, setStats] = useState<DashboardStats | null>(null)

  const [children, setChildren] = useState<Child[]>([])
  const [practitioners, setPractitioners] = useState<Practitioner[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [searchTerm, setSearchTerm] = useState('')
  const [statusFilter, setStatusFilter] = useState<string>('all')
  const [practitionerFilter, setPractitionerFilter] = useState<string>('all')
  const [currentPage, setCurrentPage] = useState(1)
  const [selectedChildren, setSelectedChildren] = useState<string[]>([])
  const [bulkActionLoading, setBulkActionLoading] = useState(false)
  const [selectedOrg, setSelectedOrg] = useState<string>('all')
  
  const downloadCredentials = () => {
    const selectedChildrenData = children.filter(child => selectedChildren.includes(child.id))
    
    // Create CSV content
    const csvHeaders = ['Name', 'Username', 'Access PIN']
    const csvRows = selectedChildrenData.map(child => [
      child.name,
      child.username || `${child.name.toLowerCase().replace(/\s+/g, '')}${child.id.slice(-4)}`,
      child.accessPin || Math.floor(1000 + Math.random() * 9000).toString()
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
  const [showReassignDialog, setShowReassignDialog] = useState(false)
  const [showArchiveDialog, setShowArchiveDialog] = useState(false)
  const itemsPerPage = 20

  const isGroupContact = user?.profile.role === 'GroupContact'
  const isAdminMode = isGroupContact && currentMode === 'admin'
  const isPractitionerMode = !isGroupContact || currentMode === 'practitioner'

  useEffect(() => {
    fetchDashboardData()
  }, [user, currentMode])

  const fetchDashboardData = async () => {
    // Demo mode - load demo data when no user is authenticated
    if (!user) {
      setStats({
        totalChildren: 12,
        activeChildren: 10,
        needsAttention: 2,
        flaggedChildren: 0,
        archivedChildren: 2,
        usedSeats: 12,
        totalSeats: 25
      })

      setChildren([
        {
          id: 'demo-1',
          name: 'Emma Thompson',
          lastCheckIn: '2 hours ago',
          status: 'fine',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        },
        {
          id: 'demo-2',
          name: 'James Wilson',
          lastCheckIn: '1 day ago',
          status: 'needs_attention',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        },
        {
          id: 'demo-3',
          name: 'Sophie Chen',
          lastCheckIn: '3 hours ago',
          status: 'fine',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        }
      ])

      setLoading(false)
      return
    }

    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()

      // Demo data based on current mode
      if (isAdminMode) {
        // Admin view - see all children and practitioners
        setStats({
          totalChildren: 22,
          activeChildren: 18,
          needsAttention: 3,
          flaggedChildren: 1,
          archivedChildren: 4,
          totalPractitioners: 4,
          activePractitioners: 3,
          pendingInvites: 1,
          usedSeats: 22,
          totalSeats: 50
        })

        // All children for admin mode
        setChildren([
          {
            id: 'child-1',
            name: 'Emma Thompson',
            lastCheckIn: '2 hours ago',
            status: 'fine',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-2',
            name: 'James Wilson',
            lastCheckIn: '1 day ago',
            status: 'needs_attention',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-3',
            name: 'Sophie Chen',
            lastCheckIn: '4 hours ago',
            status: 'flagged',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-4',
            name: 'Oliver Brown',
            lastCheckIn: '3 hours ago',
            status: 'fine',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-5',
            name: 'Lily Davis',
            lastCheckIn: '1 day ago',
            status: 'fine',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-6',
            name: 'Max Taylor',
            lastCheckIn: '2 days ago',
            status: 'needs_attention',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-7',
            name: 'Chloe Wilson',
            lastCheckIn: '1 day ago',
            status: 'fine',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-8',
            name: 'Ryan Clarke',
            lastCheckIn: '5 hours ago',
            status: 'fine',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-9',
            name: 'Alice Johnson',
            lastCheckIn: '3 hours ago',
            status: 'fine',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2'
          },
          {
            id: 'child-10',
            name: 'Ben Williams',
            lastCheckIn: '1 day ago',
            status: 'fine',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2'
          },
          {
            id: 'child-11',
            name: 'Grace Lee',
            lastCheckIn: '2 days ago',
            status: 'needs_attention',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2'
          },
          {
            id: 'child-12',
            name: 'Lucas Smith',
            lastCheckIn: '3 hours ago',
            status: 'fine',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2'
          },
          {
            id: 'child-13',
            name: 'Maya Patel',
            lastCheckIn: '1 day ago',
            status: 'fine',
            practitioner: 'David Brown',
            practitionerId: 'pract-4'
          },
          {
            id: 'child-14',
            name: 'Jack Murphy',
            lastCheckIn: '4 hours ago',
            status: 'flagged',
            practitioner: 'David Brown',
            practitionerId: 'pract-4'
          },
          {
            id: 'child-15',
            name: 'Zoe Garcia',
            lastCheckIn: '2 days ago',
            status: 'fine',
            practitioner: 'David Brown',
            practitionerId: 'pract-4'
          },
          {
            id: 'child-16',
            name: 'Noah Clarke',
            lastCheckIn: '1 day ago',
            status: 'fine',
            practitioner: 'David Brown',
            practitionerId: 'pract-4'
          },
          {
            id: 'child-17',
            name: 'Isabella Martinez',
            lastCheckIn: '3 days ago',
            status: 'needs_attention',
            practitioner: 'David Brown',
            practitionerId: 'pract-4'
          },
          {
            id: 'child-18',
            name: 'Ethan Johnson',
            lastCheckIn: '5 hours ago',
            status: 'fine',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-19',
            name: 'Ava Wilson',
            lastCheckIn: '2 days ago',
            status: 'fine',
            practitioner: 'Sarah Johnson',
            practitionerId: 'pract-1'
          },
          {
            id: 'child-20',
            name: 'Mason Brown',
            lastCheckIn: '1 day ago',
            status: 'fine',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2'
          },
          {
            id: 'child-21',
            name: 'Charlotte Davis',
            lastCheckIn: '6 hours ago',
            status: 'fine',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2'
          },
          {
            id: 'child-22',
            name: 'William Taylor',
            lastCheckIn: '3 days ago',
            status: 'fine',
            practitioner: 'Michael Chen',
            practitionerId: 'pract-2'
          }
        ])

        // All practitioners for admin mode
        setPractitioners([
          {
            id: 'pract-1',
            name: 'Sarah Johnson',
            email: 'sarah.johnson@demoschool.com',
            phone: '+44 7700 900123',
            status: 'active',
            invitedDate: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            lastLogin: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            childrenCount: 8,
            children: [
              { id: 'child-1', name: 'Emma Thompson', status: 'fine' },
              { id: 'child-2', name: 'James Wilson', status: 'needs_attention' },
              { id: 'child-3', name: 'Sophie Chen', status: 'flagged' },
              { id: 'child-4', name: 'Oliver Brown', status: 'fine' },
            ]
          },
          {
            id: 'pract-2',
            name: 'Michael Chen',
            email: 'michael.chen@demoschool.com',
            phone: '+44 7700 900124',
            status: 'active',
            invitedDate: new Date(Date.now() - 45 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            lastLogin: new Date(Date.now() - 1 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            childrenCount: 12,
            children: [
              { id: 'child-9', name: 'Alice Johnson', status: 'fine' },
              { id: 'child-10', name: 'Ben Williams', status: 'fine' },
            ]
          },
          {
            id: 'pract-3',
            name: 'Emma Williams',
            email: 'emma.williams@demoschool.com',
            status: 'pending',
            invitedDate: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            childrenCount: 0,
            children: []
          },
          {
            id: 'pract-4',
            name: 'David Brown',
            email: 'david.brown@demoschool.com',
            phone: '+44 7700 900125',
            status: 'active',
            invitedDate: new Date(Date.now() - 90 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            lastLogin: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            childrenCount: 5,
            children: []
          }
        ])

      } else {
        // Practitioner view - see only assigned children
        setStats({
          totalChildren: 8,
          myChildren: 8,
          activeChildren: 6,
          needsAttention: 1,
          flaggedChildren: 1,
          archivedChildren: 2,
          usedSeats: 8,
          totalSeats: 50
        })

        const practitionerChildren = [
          {
            id: 'child-1',
            name: 'Emma Thompson',
            lastCheckIn: '2 hours ago',
            status: 'fine' as const
          },
          {
            id: 'child-2',
            name: 'James Wilson',
            lastCheckIn: '1 day ago',
            status: 'needs_attention' as const
          },
          {
            id: 'child-3',
            name: 'Sophie Chen',
            lastCheckIn: '4 hours ago',
            status: 'flagged' as const
          },
          {
            id: 'child-4',
            name: 'Oliver Brown',
            lastCheckIn: '3 hours ago',
            status: 'fine' as const
          },
          {
            id: 'child-5',
            name: 'Lily Davis',
            lastCheckIn: '1 day ago',
            status: 'fine' as const
          },
          {
            id: 'child-6',
            name: 'Max Taylor',
            lastCheckIn: '2 days ago',
            status: 'needs_attention' as const
          },
          {
            id: 'child-7',
            name: 'Chloe Wilson',
            lastCheckIn: '1 day ago',
            status: 'fine' as const
          },
          {
            id: 'child-8',
            name: 'Ryan Clarke',
            lastCheckIn: '5 hours ago',
            status: 'fine' as const
          }
        ]
        setChildren(practitionerChildren)
      }

      if (sessionError || !session?.access_token) {
        
      }
    } catch (error) {
      console.error('Error fetching dashboard data:', error)
      setError('Failed to load dashboard data')
    } finally {
      setLoading(false)
    }
  }

  const filteredChildren = children.filter(child => {
    const matchesSearch = child.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         (child.practitioner && child.practitioner.toLowerCase().includes(searchTerm.toLowerCase()))
    const matchesStatus = statusFilter === 'all' || child.status === statusFilter
    const matchesPractitioner = practitionerFilter === 'all' || 
                               (practitionerFilter === 'unassigned' && child.practitioner === 'Unassigned') ||
                               child.practitionerId === practitionerFilter
    
    return matchesSearch && matchesStatus && matchesPractitioner
  })

  // Reset to first page when filters change
  useEffect(() => {
    setCurrentPage(1)
  }, [searchTerm, statusFilter, practitionerFilter])

  // Calculate pagination for children
  const totalPages = Math.ceil(filteredChildren.length / itemsPerPage)
  const startIndex = (currentPage - 1) * itemsPerPage
  const endIndex = startIndex + itemsPerPage
  const currentChildren = filteredChildren.slice(startIndex, endIndex)
  
  const handlePageChange = (page: number) => {
    setCurrentPage(page)
  }

  // Create unique practitioners by deduplicating on practitioner ID first
  const practitionerMap = new Map<string, string>()
  children
    .filter(child => child.practitioner && child.practitionerId)
    .forEach(child => {
      if (!practitionerMap.has(child.practitionerId!)) {
        practitionerMap.set(child.practitionerId!, child.practitioner!)
      }
    })
  
  const uniquePractitioners = Array.from(practitionerMap.entries()).map(([id, name]) => ({
    id,
    name
  }))

  // Bulk selection handlers
  const handleSelectAll = () => {
    if (selectedChildren.length === currentChildren.length) {
      setSelectedChildren([])
    } else {
      setSelectedChildren(currentChildren.map(child => child.id))
    }
  }

  const handleSelectChild = (childId: string) => {
    setSelectedChildren(prev => 
      prev.includes(childId)
        ? prev.filter(id => id !== childId)
        : [...prev, childId]
    )
  }

  const handleBulkArchive = async () => {
    if (selectedChildren.length === 0) return
    
    setBulkActionLoading(true)
    try {
      // Call server to archive children
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()
      
      if (session?.access_token) {
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/bulk-archive`, {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ childrenIds: selectedChildren })
        })

        if (response.ok) {
          // Remove archived children from local state
          setChildren(prev => prev.filter(child => !selectedChildren.includes(child.id)))
          setSelectedChildren([])
          setShowArchiveDialog(false)
          
          // Show success message
          alert(`Successfully archived ${selectedChildren.length} children`)
        } else {
          const errorData = await response.json()
          throw new Error(errorData.error || 'Failed to archive children')
        }
      } else {
        // Fallback for demo mode
        setChildren(prev => prev.filter(child => !selectedChildren.includes(child.id)))
        setSelectedChildren([])
        setShowArchiveDialog(false)
        alert(`Successfully archived ${selectedChildren.length} children`)
      }
    } catch (error) {
      console.error('Error archiving children:', error)
      alert('Failed to archive children')
    } finally {
      setBulkActionLoading(false)
    }
  }

  const handleBulkReassign = async (newPractitionerId: string) => {
    if (selectedChildren.length === 0) return
    
    setBulkActionLoading(true)
    try {
      // Call server to reassign children
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()
      
      if (session?.access_token) {
        const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/bulk-reassign`, {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ 
            childrenIds: selectedChildren, 
            newPractitionerId 
          })
        })

        if (response.ok) {
          const result = await response.json()
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
        } else {
          const errorData = await response.json()
          throw new Error(errorData.error || 'Failed to reassign children')
        }
      } else {
        // Fallback for demo mode
        const newPractitionerName = practitioners.find(p => p.id === newPractitionerId)?.name || 'Unknown'
        setChildren(prev => prev.map(child => 
          selectedChildren.includes(child.id)
            ? { ...child, practitionerId: newPractitionerId, practitioner: newPractitionerName }
            : child
        ))
        setSelectedChildren([])
        setShowReassignDialog(false)
        alert(`Successfully reassigned ${selectedChildren.length} children to ${newPractitionerName}`)
      }
    } catch (error) {
      console.error('Error reassigning children:', error)
      alert('Failed to reassign children')
    } finally {
      setBulkActionLoading(false)
    }
  }

  const isAllSelected = currentChildren.length > 0 && selectedChildren.length === currentChildren.length
  const isSomeSelected = selectedChildren.length > 0

  // Get selected children names for dialogs
  const selectedChildrenNames = (children || [])
    .filter(child => selectedChildren.includes(child.id))
    .map(child => child.name)

  if (loading) {
    return <PageLoader message="Loading dashboard..." />
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto p-6">
        {/* Breadcrumb Navigation */}
        <Breadcrumb className="mb-6">
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbPage>Dashboard</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">
                {isAdminMode ? 'Manage Users' : 'My Children'}
              </h1>
            </div>


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

        {/* Quick Actions Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <div>
                  {isAdminMode ? (
                    <>
                      <p className="text-sm font-medium text-gray-600">Seats</p>
                      <p className="text-2xl font-bold text-gray-900">
                        {stats?.usedSeats || 0}/{stats?.totalSeats || 0}
                      </p>
                    </>
                  ) : (
                    <>
                      <p className="text-sm font-medium text-gray-600">Children</p>
                      <p className="text-2xl font-bold text-gray-900">
                        {stats?.totalChildren || 0}
                      </p>
                    </>
                  )}
                </div>
                <Users className="h-8 w-8 text-gray-400" />
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm font-medium text-gray-600">Need Attention</p>
                  <p className="text-2xl font-bold text-gray-900">
                    {stats?.needsAttention || 0}
                  </p>
                </div>
                <AlertTriangle className="h-8 w-8 text-gray-400" />
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm font-medium text-gray-600">Flagged</p>
                  <p className="text-2xl font-bold text-gray-900">
                    {stats?.flaggedChildren || 0}
                  </p>
                </div>
                <Shield className="h-8 w-8 text-gray-400" />
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm font-medium text-gray-600">
                    <Link to="/children/archived" className="hover:underline">
                      Archived
                    </Link>
                  </p>
                  <p className="text-2xl font-bold text-gray-900">
                    {stats?.archivedChildren || 0}
                  </p>
                </div>
                <Archive className="h-8 w-8 text-gray-400" />
              </div>
            </CardContent>
          </Card>
        </div>

        <div className="grid grid-cols-1 gap-6">
          {/* Practitioners Section - Admin Mode Only */}
          {isAdminMode && (
            <Card>
              <CardHeader className="pb-0">
                <div className="flex items-center justify-between">
                  <CardTitle className="text-lg font-bold">
                    Practitioners
                  </CardTitle>
                  <Button size="sm" asChild>
                    <Link to="/invite/practitioner" className="flex items-center gap-2">
                      <UserPlus className="h-4 w-4" />
                      Add Practitioner
                    </Link>
                  </Button>
                </div>
              </CardHeader>
              <CardContent className="p-0">
                <div className="mt-4 mx-5">
                  <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
                    {practitioners.map((practitioner, index) => (
                      <Link 
                        key={practitioner.id} 
                        to={`/practitioners/${practitioner.id}/manage`}
                        className={`flex items-center justify-between hover:bg-gray-50 px-6 py-4 transition-colors ${
                          index < practitioners.length - 1 ? 'border-b border-gray-200' : ''
                        }`}
                      >
                        <div className="flex items-center space-x-4">
                          <div>
                            <p className="font-medium text-gray-900">{practitioner.name}</p>
                            <p className="text-sm text-gray-500">{practitioner.childrenCount} children</p>
                          </div>
                        </div>
                        <div className="flex items-center space-x-2">

                        </div>
                      </Link>
                    ))}
                  </div>
                </div>
              </CardContent>
            </Card>
          )}

          {/* Children Section - Both Modes */}
          <Card>
            <CardHeader className="pb-4">
              <div className="flex items-center justify-between">
                <CardTitle className="text-lg font-bold">
                  {isAdminMode ? 'All Children' : 'Assigned to me'}
                </CardTitle>
                <div className="flex items-center gap-2">
                  <Button variant="outline" size="sm" asChild>
                    <Link to="/children/bulk-import">
                      <UserPlus className="h-4 w-4 mr-2" />
                      Bulk Import
                    </Link>
                  </Button>
                  <Button size="sm" asChild>
                    <Link to="/children/add">
                      <Plus className="h-4 w-4 mr-2" />
                      Add Child
                    </Link>
                  </Button>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              {/* Search and Filters */}
              <div className="flex flex-col md:flex-row gap-4">
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
                  checked={isAllSelected}
                  onCheckedChange={handleSelectAll}
                />
                <span className="text-sm text-gray-600">
                  Select all on this page ({currentChildren.length})
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
                      onClick={() => setShowReassignDialog(true)}
                      disabled={bulkActionLoading}
                    >
                      <UserX className="h-4 w-4 mr-2" />
                      Reassign ({selectedChildren.length})
                    </Button>
                  )}
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setShowArchiveDialog(true)}
                    disabled={bulkActionLoading}
                  >
                    <Archive className="h-4 w-4 mr-2" />
                    Archive ({selectedChildren.length})
                  </Button>
                </div>
              )}

              {/* Children List */}
              <div className="border rounded-lg">
                {currentChildren.length === 0 ? (
                  <div className="text-center py-8 text-gray-500">
                    {searchTerm || statusFilter !== 'all' || practitionerFilter !== 'all' 
                      ? 'No children match your search criteria.' 
                      : 'No children found.'
                    }
                  </div>
                ) : (
                  <div className="divide-y divide-gray-200">
                    {currentChildren.map((child, index) => (
                      <div 
                        key={child.id} 
                        className="flex items-center justify-between py-4 px-6 hover:bg-gray-50 transition-colors"
                      >
                        <div className="flex items-center gap-3 flex-1">
                          <Checkbox 
                            checked={selectedChildren.includes(child.id)}
                            onCheckedChange={() => handleSelectChild(child.id)}
                            onClick={(e) => e.stopPropagation()}
                          />
                          <Link 
                            to={`/children/${child.id}`}
                            className="flex-1 flex items-center justify-between group"
                          >
                            <div>
                              <div className="font-medium text-gray-900 group-hover:text-gray-700">{child.name}</div>
                              <div className="text-sm text-gray-500">
                                Last check-in: {child.lastCheckIn}
                                {isAdminMode && child.practitioner && (
                                  <span> • Practitioner: {child.practitioner}</span>
                                )}
                              </div>
                            </div>
                            <div>
                              <Badge 
                                variant={
                                  child.status === 'fine' ? 'outline' :
                                  child.status === 'needs_attention' ? 'secondary' : 'destructive'
                                }
                              >
                                {child.status === 'fine' ? 'Fine' :
                                 child.status === 'needs_attention' ? 'Needs Attention' : 'Flagged'}
                              </Badge>
                            </div>
                          </Link>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>

              {/* Pagination */}
              {totalPages > 1 && (
                <div className="flex items-center justify-between">
                  <div className="text-sm text-gray-500">
                    Showing {startIndex + 1}-{Math.min(endIndex, filteredChildren.length)} of {filteredChildren.length} children
                  </div>
                  <div className="flex gap-2">
                    <Button 
                      variant="outline" 
                      size="sm" 
                      onClick={() => handlePageChange(currentPage - 1)}
                      disabled={currentPage === 1}
                    >
                      Previous
                    </Button>
                    {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
                      <Button
                        key={page}
                        variant={page === currentPage ? "default" : "outline"}
                        size="sm"
                        onClick={() => handlePageChange(page)}
                      >
                        {page}
                      </Button>
                    ))}
                    <Button 
                      variant="outline" 
                      size="sm" 
                      onClick={() => handlePageChange(currentPage + 1)}
                      disabled={currentPage === totalPages}
                    >
                      Next
                    </Button>
                  </div>
                </div>
              )}

              {/* Selected items info */}
              {selectedChildren.length > 0 && (
                <div className="p-4 border-t border-gray-200 bg-gray-50">
                  <div className="flex items-center justify-between">
                    <span className="text-sm text-gray-700">
                      {selectedChildren.length} children selected
                    </span>
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
        </div>

        {/* Bulk Action Dialogs */}
        <BulkReassignDialog
          open={showReassignDialog}
          onOpenChange={setShowReassignDialog}
          selectedChildren={selectedChildrenNames}
          practitioners={practitioners}
          onConfirm={handleBulkReassign}
          loading={bulkActionLoading}
        />

        <BulkArchiveDialog
          open={showArchiveDialog}
          onOpenChange={setShowArchiveDialog}
          selectedChildren={selectedChildrenNames}
          onConfirm={handleBulkArchive}
          loading={bulkActionLoading}
        />
      </div>
    </div>
  )
}