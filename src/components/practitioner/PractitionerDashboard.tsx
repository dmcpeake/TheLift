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
  Download,
  Gift,
  Star,
  Trash2
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
  lastCheckInDate?: Date
  level?: number
  status: 'fine' | 'needs_attention' | 'flagged'
  practitioner?: string
  practitionerId?: string
  username?: string
  accessPin?: string
  rewards?: Record<string, string>
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
  const [showRewardModal, setShowRewardModal] = useState(false)
  const [selectedChildForReward, setSelectedChildForReward] = useState<Child | null>(null)
  const [rewardText, setRewardText] = useState('')
  const [rewardLevel, setRewardLevel] = useState<number>(1)
  const [rewardModalTab, setRewardModalTab] = useState<'add-reward' | 'rewards-offered'>('add-reward')
  const itemsPerPage = 20

  const isGroupContact = user?.profile.role === 'GroupContact'
  const isAdminMode = isGroupContact && currentMode === 'admin'
  const isPractitionerMode = !isGroupContact || currentMode === 'practitioner'

  // Helper function to format relative time
  const formatRelativeTime = (dateString: string): string => {
    const now = new Date()
    const past = new Date(dateString)
    const diffMs = now.getTime() - past.getTime()
    const diffMins = Math.floor(diffMs / 60000)
    const diffHours = Math.floor(diffMs / 3600000)
    const diffDays = Math.floor(diffMs / 86400000)

    if (diffMins < 1) return '1min ago'
    if (diffMins < 60) return `${diffMins}min ago`
    if (diffHours < 24) return `${diffHours}hr ago`
    return `${diffDays} day${diffDays > 1 ? 's' : ''} ago`
  }

  // Helper function to open reward modal
  const handleOpenRewardModal = (child: Child) => {
    setSelectedChildForReward(child)
    setRewardText('')
    setRewardLevel(1)
    setRewardModalTab('add-reward')
    setShowRewardModal(true)
  }

  // Helper function to save rewards
  const handleSaveRewards = () => {
    if (!selectedChildForReward || !rewardText.trim()) return

    const updatedChild = {
      ...selectedChildForReward,
      rewards: {
        ...selectedChildForReward.rewards,
        [`level${rewardLevel}`]: rewardText.trim()
      }
    }

    setChildren(prev => prev.map(child =>
      child.id === selectedChildForReward.id ? updatedChild : child
    ))

    // Update the selected child reference and clear fields for next reward
    setSelectedChildForReward(updatedChild)
    setRewardText('')
    setRewardLevel(1)
  }

  // Helper function to delete a reward
  const handleDeleteReward = (levelKey: string) => {
    if (!selectedChildForReward) return

    const updatedRewards = { ...selectedChildForReward.rewards }
    delete updatedRewards[levelKey]

    const updatedChild = {
      ...selectedChildForReward,
      rewards: updatedRewards
    }

    setChildren(prev => prev.map(child =>
      child.id === selectedChildForReward.id ? updatedChild : child
    ))

    setSelectedChildForReward(updatedChild)
  }

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
          lastCheckInDate: new Date(Date.now() - 2 * 60 * 60 * 1000),
          level: 7,
          status: 'fine',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        },
        {
          id: 'demo-2',
          name: 'James Wilson',
          lastCheckIn: '1 day ago',
          lastCheckInDate: new Date(Date.now() - 24 * 60 * 60 * 1000),
          level: 3,
          status: 'needs_attention',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        },
        {
          id: 'demo-3',
          name: 'Sophie Chen',
          lastCheckIn: '3 hours ago',
          lastCheckInDate: new Date(Date.now() - 3 * 60 * 60 * 1000),
          level: 12,
          status: 'fine',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        },
        {
          id: 'demo-4',
          name: 'Oliver Brown',
          lastCheckIn: '4 hours ago',
          lastCheckInDate: new Date(Date.now() - 4 * 60 * 60 * 1000),
          level: 5,
          status: 'fine',
          practitioner: 'Demo Practitioner',
          practitionerId: 'demo-pract-1'
        },
        {
          id: 'demo-5',
          name: 'Lily Davis',
          lastCheckIn: '2 days ago',
          lastCheckInDate: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000),
          level: 15,
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
                        <div style={{ flex: 1 }}>
                          <div style={{ fontWeight: 600, fontSize: '16px', color: '#1f2937', marginBottom: '4px' }}>
                            {child.name}
                          </div>
                          <div style={{ fontSize: '14px', color: '#6b7280', display: 'flex', alignItems: 'center' }}>
                            <span style={{ width: '180px', flexShrink: 0 }}>
                              Checked in: {child.lastCheckInDate ? formatRelativeTime(child.lastCheckInDate.toISOString()) : child.lastCheckIn}
                            </span>
                            {child.level !== undefined && (
                              <>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '6px', width: '100px', flexShrink: 0 }}>
                                  <Star
                                    size={14}
                                    style={{
                                      color: '#F97316',
                                      fill: '#F97316'
                                    }}
                                  />
                                  <span>Level {child.level}</span>
                                </div>
                                <button
                                  onClick={(e) => {
                                    e.preventDefault()
                                    e.stopPropagation()
                                    handleOpenRewardModal(child)
                                  }}
                                  style={{
                                    color: '#147fe3',
                                    background: 'none',
                                    border: 'none',
                                    padding: 0,
                                    cursor: 'pointer',
                                    fontSize: '14px',
                                    fontWeight: 500,
                                    textDecoration: 'underline'
                                  }}
                                  onMouseEnter={(e) => e.currentTarget.style.color = '#1166cc'}
                                  onMouseLeave={(e) => e.currentTarget.style.color = '#147fe3'}
                                >
                                  Rewards
                                </button>
                              </>
                            )}
                          </div>
                        </div>
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
                              // Save child's rewards to sessionStorage for profile page
                              if (child.rewards) {
                                sessionStorage.setItem('currentChildRewards', JSON.stringify(child.rewards))
                              } else {
                                sessionStorage.removeItem('currentChildRewards')
                              }
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

        {/* Reward Modal */}
        {showRewardModal && selectedChildForReward && (
          <div
            className="fixed inset-0 flex items-center justify-center"
            style={{
              zIndex: 9999,
              backgroundColor: 'rgba(0, 0, 0, 0.8)'
            }}
            onClick={() => setShowRewardModal(false)}
          >
            <div
              className="bg-white rounded-lg max-w-2xl w-full mx-4 relative"
              onClick={(e) => e.stopPropagation()}
              style={{ height: '500px', display: 'flex', flexDirection: 'column', padding: '2rem' }}
            >
              {/* Tabs */}
              <div style={{ marginBottom: '1.5rem', flexShrink: 0 }}>
                <div style={{ display: 'flex', borderBottom: '2px solid #e5e7eb' }}>
                  <button
                    onClick={() => setRewardModalTab('add-reward')}
                    style={{
                      flex: 1,
                      padding: '12px 16px',
                      fontSize: '16px',
                      fontWeight: 600,
                      color: rewardModalTab === 'add-reward' ? '#147fe3' : '#6b7280',
                      borderBottom: rewardModalTab === 'add-reward' ? '2px solid #147fe3' : '2px solid transparent',
                      backgroundColor: 'transparent',
                      border: 'none',
                      cursor: 'pointer',
                      marginBottom: '-2px',
                      transition: 'all 0.2s'
                    }}
                  >
                    Add reward
                  </button>
                  <button
                    onClick={() => setRewardModalTab('rewards-offered')}
                    style={{
                      flex: 1,
                      padding: '12px 16px',
                      fontSize: '16px',
                      fontWeight: 600,
                      color: rewardModalTab === 'rewards-offered' ? '#147fe3' : '#6b7280',
                      borderBottom: rewardModalTab === 'rewards-offered' ? '2px solid #147fe3' : '2px solid transparent',
                      backgroundColor: 'transparent',
                      border: 'none',
                      cursor: 'pointer',
                      marginBottom: '-2px',
                      transition: 'all 0.2s'
                    }}
                  >
                    Rewards offered ({selectedChildForReward.rewards ? Object.keys(selectedChildForReward.rewards).length : 0})
                  </button>
                </div>
              </div>

              {/* Tab Content - Scrollable Area */}
              <div style={{ flex: 1, overflowY: 'auto', marginBottom: '1rem' }}>
                {rewardModalTab === 'add-reward' ? (
                  <div className="space-y-6">
                    {/* Level Selector */}
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-2">
                        Level
                      </label>
                      <select
                        value={rewardLevel}
                        onChange={(e) => setRewardLevel(Number(e.target.value))}
                        className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        style={{ fontSize: '16px' }}
                      >
                        {Array.from({ length: 20 }, (_, i) => i + 1).map((level) => (
                          <option key={level} value={level}>
                            Level {level}
                          </option>
                        ))}
                      </select>
                    </div>

                    {/* Reward Text */}
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-2">
                        Reward
                      </label>
                      <input
                        type="text"
                        value={rewardText}
                        onChange={(e) => {
                          if (e.target.value.length <= 50) {
                            setRewardText(e.target.value)
                          }
                        }}
                        placeholder="Enter reward text"
                        className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        maxLength={50}
                        style={{ fontSize: '16px' }}
                      />
                      <p className="text-sm text-gray-500 mt-1">
                        {rewardText.length}/50 characters
                      </p>
                    </div>
                  </div>
                ) : (
                  <div style={{ height: '100%' }}>
                    {selectedChildForReward.rewards && Object.keys(selectedChildForReward.rewards).length > 0 ? (
                      <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                        {Object.entries(selectedChildForReward.rewards).map(([levelKey, rewardText]) => (
                          <div
                            key={levelKey}
                            style={{
                              display: 'flex',
                              alignItems: 'center',
                              justifyContent: 'space-between',
                              padding: '16px',
                              backgroundColor: '#f9fafb',
                              borderRadius: '8px',
                              border: '1px solid #e5e7eb'
                            }}
                          >
                            <div style={{ flex: 1 }}>
                              <div style={{ fontSize: '14px', color: '#6b7280', marginBottom: '4px', fontWeight: 500 }}>
                                {levelKey.replace('level', 'Level ')}
                              </div>
                              <div style={{ fontSize: '16px', color: '#1f2937' }}>
                                {rewardText}
                              </div>
                            </div>
                            <button
                              onClick={() => handleDeleteReward(levelKey)}
                              style={{
                                padding: '8px',
                                backgroundColor: 'transparent',
                                border: 'none',
                                cursor: 'pointer',
                                color: '#ef4444',
                                transition: 'color 0.2s'
                              }}
                              onMouseEnter={(e) => e.currentTarget.style.color = '#dc2626'}
                              onMouseLeave={(e) => e.currentTarget.style.color = '#ef4444'}
                            >
                              <Trash2 size={20} />
                            </button>
                          </div>
                        ))}
                      </div>
                    ) : (
                      <div style={{ textAlign: 'center', padding: '40px 20px', color: '#6b7280', height: '100%', display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
                        <p>No rewards have been added yet.</p>
                        <p style={{ fontSize: '14px', marginTop: '8px' }}>
                          Switch to "Add reward" tab to create rewards.
                        </p>
                      </div>
                    )}
                  </div>
                )}
              </div>

              {/* Action Footer */}
              <div style={{ paddingTop: '1rem', borderTop: '1px solid #e5e7eb', flexShrink: 0 }}>
                <div className="flex items-center">
                  <button
                    onClick={() => setShowRewardModal(false)}
                    className="flex-1 font-medium transition-colors text-center"
                    style={{ fontSize: '16px', color: '#2563eb' }}
                    onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                    onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                  >
                    CLOSE
                  </button>
                  {rewardModalTab === 'add-reward' && (
                    <>
                      <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>
                      <button
                        onClick={handleSaveRewards}
                        className="flex-1 font-medium transition-colors text-center"
                        style={{ fontSize: '16px', color: '#2563eb' }}
                        onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
                        onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
                      >
                        SAVE
                      </button>
                    </>
                  )}
                </div>
              </div>
            </div>
          </div>
        )}

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