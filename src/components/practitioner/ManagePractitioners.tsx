import React, { useState, useEffect, useContext } from 'react'
import { Link } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Alert, AlertDescription } from '../ui/alert'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { 
  Users, 
  UserPlus, 
  Mail,
  Phone,
  Calendar,
  AlertTriangle,
  CheckCircle,
  Clock,
  Settings
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
  invitedDate: string
  lastLogin?: string
  childrenCount: number
  children?: Child[]
}

interface ManagePractitionersData {
  practitioners: Practitioner[]
  stats: {
    totalPractitioners: number
    activePractitioners: number
    pendingInvitations: number
  }
}

export function ManagePractitioners() {
  const { user } = useContext(AuthContext)
  const [data, setData] = useState<ManagePractitionersData | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    fetchPractitionersData()
  }, [])

  const fetchPractitionersData = async () => {
    // Demo mode - load demo data when no user is authenticated
    if (!user) {
      setData({
        practitioners: [
          {
            id: 'demo-pract-1',
            name: 'Sarah Johnson',
            email: 'sarah.j@demo-school.com',
            role: 'Practitioner',
            status: 'active',
            lastLogin: '2024-03-15T10:30:00Z',
            assignedChildren: 8,
            inviteStatus: 'accepted'
          },
          {
            id: 'demo-pract-2',
            name: 'Mike Rodriguez',
            email: 'mike.r@demo-school.com',
            role: 'Practitioner',
            status: 'active',
            lastLogin: '2024-03-14T16:45:00Z',
            assignedChildren: 4,
            inviteStatus: 'accepted'
          }
        ],
        stats: {
          totalPractitioners: 2,
          activePractitioners: 2,
          pendingInvites: 0
        }
      })
      setLoading(false)
      return
    }

    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()

      // Always use demo data for now
      setData({
        practitioners: [
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
              { id: 'child-5', name: 'Lily Davis', status: 'fine' },
              { id: 'child-6', name: 'Max Taylor', status: 'needs_attention' },
              { id: 'child-7', name: 'Chloe Wilson', status: 'fine' },
              { id: 'child-8', name: 'Ryan Clarke', status: 'fine' }
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
              { id: 'child-11', name: 'Grace Lee', status: 'needs_attention' },
              { id: 'child-12', name: 'Lucas Smith', status: 'fine' }
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
            children: [
              { id: 'child-13', name: 'Maya Patel', status: 'fine' },
              { id: 'child-14', name: 'Jack Murphy', status: 'flagged' },
              { id: 'child-15', name: 'Zoe Garcia', status: 'fine' }
            ]
          }
        ],
        stats: {
          totalPractitioners: 4,
          activePractitioners: 3,
          pendingInvitations: 1
        }
      })
      
      if (sessionError || !session?.access_token) {
        
      }
    } catch (error) {
      console.error('Error fetching practitioners data:', error)
    } finally {
      setLoading(false)
    }
  }

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'active':
        return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Active</Badge>
      case 'pending':
        return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Pending</Badge>
      default:
        return <Badge variant="outline">Unknown</Badge>
    }
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'active':
        return <CheckCircle className="h-4 w-4 text-gray-600" />
      case 'pending':
        return <Clock className="h-4 w-4 text-gray-600" />
      default:
        return <AlertTriangle className="h-4 w-4 text-gray-600" />
    }
  }

  const getDaysAgo = (dateString: string) => {
    const date = new Date(dateString)
    const today = new Date()
    const diffTime = Math.abs(today.getTime() - date.getTime())
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    
    if (diffDays === 1) return 'Today'
    if (diffDays === 2) return 'Yesterday'
    return `${diffDays - 1} days ago`
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
              <BreadcrumbPage>Practitioners</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">
                Manage Practitioners
              </h1>

            </div>
            <div className="flex gap-3">
              <Link to="/invite/practitioner">
                <Button>
                  <UserPlus className="h-4 w-4 mr-2" />
                  Invite Practitioner
                </Button>
              </Link>
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

        {/* Stats */}
        {data && (
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Practitioners</CardTitle>
                <Users className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{data.stats?.totalPractitioners || 0}</div>
                <p className="text-xs text-muted-foreground">
                  In your organisation
                </p>
              </CardContent>
            </Card>

            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Active</CardTitle>
                <CheckCircle className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{data.stats?.activePractitioners || 0}</div>
                <p className="text-xs text-muted-foreground">
                  Currently using the platform
                </p>
              </CardContent>
            </Card>

            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Pending Invitations</CardTitle>
                <Clock className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{data.stats?.pendingInvitations || 0}</div>
                <p className="text-xs text-muted-foreground">
                  Awaiting response
                </p>
              </CardContent>
            </Card>
          </div>
        )}

        {/* Practitioners List */}
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="h-5 w-5" />
              Practitioners
            </CardTitle>
            <CardDescription>
              Manage practitioners who have access to your organisation
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {data?.practitioners?.map((practitioner) => (
                <div key={practitioner.id} className="flex items-center justify-between p-4 border rounded-lg">
                  <div className="flex items-center gap-4">
                    <div className="flex items-center gap-2">
                      {getStatusIcon(practitioner.status)}
                    </div>
                    <div className="flex-1">
                      <div className="flex items-center gap-3 mb-1">
                        <h4 className="font-medium">{practitioner.name}</h4>
                        {getStatusBadge(practitioner.status)}
                      </div>
                      <div className="space-y-1">
                        <div className="flex items-center gap-2 text-sm text-gray-600">
                          <Mail className="h-4 w-4" />
                          {practitioner.email}
                        </div>
                        {practitioner.phone && (
                          <div className="flex items-center gap-2 text-sm text-gray-600">
                            <Phone className="h-4 w-4" />
                            {practitioner.phone}
                          </div>
                        )}
                        <div className="flex items-center gap-4 text-sm text-gray-600">
                          <div className="flex items-center gap-1">
                            <Calendar className="h-4 w-4" />
                            Invited {getDaysAgo(practitioner.invitedDate)}
                          </div>
                          {practitioner.lastLogin && (
                            <div>
                              Last login: {getDaysAgo(practitioner.lastLogin)}
                            </div>
                          )}
                          <div>
                            {practitioner.childrenCount} children
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div className="flex items-center gap-2">
                    <Button variant="outline" size="sm" asChild>
                      <Link to={`/practitioners/${practitioner.id}/manage`} className="flex items-center gap-2">
                        <Settings className="h-4 w-4" />
                        Manage
                      </Link>
                    </Button>
                  </div>
                </div>
              ))}

              {(!data?.practitioners || data.practitioners.length === 0) && (
                <div className="text-center py-8">
                  <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                  <h3 className="text-lg font-medium text-gray-900 mb-2">No practitioners yet</h3>
                  <p className="text-gray-600 mb-4">
                    Start by inviting practitioners to join your organisation.
                  </p>
                  <Link to="/invite/practitioner">
                    <Button>
                      <UserPlus className="h-4 w-4 mr-2" />
                      Invite Your First Practitioner
                    </Button>
                  </Link>
                </div>
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}