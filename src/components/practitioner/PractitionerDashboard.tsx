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
import { BulkReassignDialog } from './BulkReassignDialog'
import { BulkArchiveDialog } from './BulkArchiveDialog'
import { PageLoader } from '../shared/LottieLoader'
import { YellowSwoosh } from '../shared/YellowSwoosh'
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

export function PractitionerDashboard() {
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
        },
        {
          id: 'demo-4',
          name: 'Oliver Brown',
          lastCheckIn: '4 hours ago',
          status: 'fine',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        },
        {
          id: 'demo-5',
          name: 'Lily Davis',
          lastCheckIn: '2 days ago',
          status: 'needs_attention',
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
    <>
      <style>{`
        .dashboard-white-bg {
          background-color: #ffffff !important;
        }
        body {
          background-color: #ffffff !important;
        }
      `}</style>
      <div className="min-h-screen dashboard-white-bg" style={{ paddingTop: '80px', position: 'relative' }}>
        <div className="max-w-7xl mx-auto p-6" style={{ paddingBottom: '120px' }}>
        {/* Header */}
        <div className="mb-8" style={{ marginTop: '10px' }}>
          <h1 className="text-3xl font-bold text-center" style={{ color: '#1f2937' }}>
            My Children
          </h1>
        </div>

        {error && (
          <Alert className="mb-6 border-red-200 bg-red-50">
            <AlertTriangle className="h-4 w-4 text-red-600" />
            <AlertDescription className="text-red-800">
              {error}
            </AlertDescription>
          </Alert>
        )}

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
          <div className="space-y-4">
            {/* Children List */}
            <div
              style={{
                backgroundColor: 'rgba(255, 255, 255, 0.6)',
                backdropFilter: 'blur(16px)',
                WebkitBackdropFilter: 'blur(16px)',
                border: '1px solid rgba(0, 0, 0, 0.1)',
                borderRadius: '16px',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.08)',
                overflow: 'hidden',
                marginBottom: '100px'
              }}
            >
                {currentChildren.length === 0 ? (
                  <div className="text-center py-8" style={{ color: '#6b7280' }}>
                    {searchTerm || statusFilter !== 'all' || practitionerFilter !== 'all'
                      ? 'No children match your search criteria.'
                      : 'No children found.'
                    }
                  </div>
                ) : (
                  <div>
                    {currentChildren.map((child, index) => (
                      <div
                        key={child.id}
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'space-between',
                          padding: '20px 24px',
                          borderBottom: index < currentChildren.length - 1 ? '1px solid rgba(0, 0, 0, 0.06)' : 'none',
                          transition: 'background-color 0.2s'
                        }}
                        onMouseEnter={(e) => e.currentTarget.style.backgroundColor = 'rgba(255, 255, 255, 0.8)'}
                        onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'transparent'}
                      >
                        <Link to={`/children/${child.id}`} style={{ flex: 1, textDecoration: 'none' }}>
                          <div style={{ fontWeight: 600, fontSize: '16px', color: '#1f2937', marginBottom: '4px' }}>
                            {child.name}
                          </div>
                          <div style={{ fontSize: '14px', color: '#6b7280' }}>
                            Last check-in: {child.lastCheckIn}
                          </div>
                        </Link>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                          <button
                            style={{
                              backgroundColor: 'white',
                              border: '2px solid #147fe3',
                              color: '#147fe3',
                              padding: '8px 24px',
                              borderRadius: '999px',
                              fontSize: '14px',
                              fontWeight: 600,
                              cursor: 'pointer',
                              transition: 'all 0.2s',
                              boxShadow: '0 2px 8px rgba(20, 127, 227, 0.1)'
                            }}
                            onClick={(e) => {
                              e.stopPropagation()
                              // Report button - no action for now
                            }}
                            onMouseEnter={(e) => {
                              e.currentTarget.style.backgroundColor = '#f0f7ff'
                            }}
                            onMouseLeave={(e) => {
                              e.currentTarget.style.backgroundColor = 'white'
                            }}
                          >
                            REPORT
                          </button>
                          <button
                            style={{
                              backgroundColor: '#147fe3',
                              border: '2px solid #147fe3',
                              color: 'white',
                              padding: '8px 24px',
                              borderRadius: '999px',
                              fontSize: '14px',
                              fontWeight: 600,
                              cursor: 'pointer',
                              transition: 'all 0.2s',
                              boxShadow: '0 2px 8px rgba(20, 127, 227, 0.2)'
                            }}
                            onClick={(e) => {
                              e.stopPropagation()
                              // Extract first name and save to sessionStorage
                              const firstName = child.name.split(' ')[0]
                              sessionStorage.setItem('userName', firstName)
                              window.location.href = '/checkin/onboarding'
                            }}
                            onMouseEnter={(e) => {
                              e.currentTarget.style.backgroundColor = '#1166cc'
                            }}
                            onMouseLeave={(e) => {
                              e.currentTarget.style.backgroundColor = '#147fe3'
                            }}
                          >
                            CHECK IN
                          </button>
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
          </div>
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

      {/* Yellow swoosh footer - hidden on mobile */}
      <div className="hidden md:block absolute bottom-0 left-0 right-0">
        <YellowSwoosh position="absolute" />
      </div>
    </div>
    </>
  )
}