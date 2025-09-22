import React, { useState, useEffect, useContext } from 'react'
import { PageLoader } from '../shared/LottieLoader'
import { Link } from 'react-router-dom'
import { AuthContext } from '../../App'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Alert, AlertDescription } from '../ui/alert'
import { Input } from '../ui/input'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { 
  Building2, 
  Users, 
  UserCheck, 
  TrendingUp, 
  Plus,
  Calendar,
  AlertTriangle,
  CheckCircle,
  BarChart3,
  Activity,
  Baby,
  Search,
  Filter,
  Mail,
  Phone,
  MapPin,
  Edit,
  MoreHorizontal
} from 'lucide-react'

interface ChildProfile {
  id: string
  name: string
  age: number
  status: 'active' | 'inactive' | 'needs_attention'
  lastCheckIn: string
  totalCheckIns: number
  practitionerId: string
  practitionerName: string
}

interface Practitioner {
  id: string
  name: string
  email: string
  status: 'active' | 'inactive' | 'pending'
  joinDate: string
  childrenCount: number
  lastActive: string
  orgId: string
}

interface Client {
  id: string
  name: string
  type: 'group' | 'practitioner'
  contactName: string
  contactEmail: string
  seatsAllocated: number
  seatsUsed: number
  status: 'active' | 'expired'
  createdDate: string
  lastActivity: string
  practitioners: Practitioner[]
  children: ChildProfile[]
}

export function AdminDashboard() {
  const { user } = useContext(AuthContext)
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')
  const [statusFilter, setStatusFilter] = useState('all')
  const [typeFilter, setTypeFilter] = useState('all')
  const [stats, setStats] = useState({
    totalClients: 0,
    activeClients: 0,
    totalPractitioners: 0,
    activePractitioners: 0,
    totalChildren: 0,
    activeChildren: 0,
    totalSeatsAllocated: 0,
    totalSeatsUsed: 0,
    utilisationRate: 0,
    childrenNeedingAttention: 0
  })

  // Use the same sample data as ClientsList
  const sampleClients: Client[] = [
    {
      id: 'org-1',
      name: 'Sunshine Primary School',
      type: 'group',
      contactName: 'Sarah Thompson',
      contactEmail: 'sarah.thompson@sunshine-primary.edu',
      seatsAllocated: 150,
      seatsUsed: 124,
      status: 'active',
      createdDate: '2024-01-15',
      lastActivity: '2024-08-22',
      practitioners: [
        {
          id: 'prac-1',
          name: 'Emma Wilson',
          email: 'emma.wilson@sunshine-primary.edu',
          status: 'active',
          joinDate: '2024-01-20',
          childrenCount: 25,
          lastActive: '2024-08-22',
          orgId: 'org-1'
        },
        {
          id: 'prac-2',
          name: 'Michael Chen',
          email: 'michael.chen@sunshine-primary.edu',
          status: 'active',
          joinDate: '2024-02-01',
          childrenCount: 28,
          lastActive: '2024-08-21',
          orgId: 'org-1'
        },
        {
          id: 'prac-3',
          name: 'Lisa Rodriguez',
          email: 'lisa.rodriguez@sunshine-primary.edu',
          status: 'active',
          joinDate: '2024-02-15',
          childrenCount: 22,
          lastActive: '2024-08-22',
          orgId: 'org-1'
        }
      ],
      children: [
        { id: 'child-1', name: 'Alex M.', age: 8, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 45, practitionerId: 'prac-1', practitionerName: 'Emma Wilson' },
        { id: 'child-2', name: 'Sophie L.', age: 7, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 52, practitionerId: 'prac-1', practitionerName: 'Emma Wilson' },
        { id: 'child-3', name: 'Jamie K.', age: 9, status: 'needs_attention', lastCheckIn: '2024-08-20', totalCheckIns: 38, practitionerId: 'prac-1', practitionerName: 'Emma Wilson' },
        { id: 'child-4', name: 'Riley P.', age: 6, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 41, practitionerId: 'prac-2', practitionerName: 'Michael Chen' },
        { id: 'child-5', name: 'Taylor B.', age: 8, status: 'active', lastCheckIn: '2024-08-21', totalCheckIns: 36, practitionerId: 'prac-2', practitionerName: 'Michael Chen' },
        { id: 'child-6', name: 'Jordan S.', age: 7, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 48, practitionerId: 'prac-3', practitionerName: 'Lisa Rodriguez' },
        { id: 'child-7', name: 'Casey W.', age: 9, status: 'inactive', lastCheckIn: '2024-08-18', totalCheckIns: 29, practitionerId: 'prac-3', practitionerName: 'Lisa Rodriguez' }
      ]
    },
    {
      id: 'org-2',
      name: 'Westfield Community Centre',
      type: 'group',
      contactName: 'David Johnson',
      contactEmail: 'david.johnson@westfield-community.org',
      seatsAllocated: 80,
      seatsUsed: 67,
      status: 'active',
      createdDate: '2024-03-10',
      lastActivity: '2024-08-22',
      practitioners: [
        {
          id: 'prac-4',
          name: 'Rachel Green',
          email: 'rachel.green@westfield-community.org',
          status: 'active',
          joinDate: '2024-03-15',
          childrenCount: 18,
          lastActive: '2024-08-22',
          orgId: 'org-2'
        },
        {
          id: 'prac-5',
          name: 'James Murphy',
          email: 'james.murphy@westfield-community.org',
          status: 'active',
          joinDate: '2024-04-01',
          childrenCount: 15,
          lastActive: '2024-08-21',
          orgId: 'org-2'
        }
      ],
      children: [
        { id: 'child-8', name: 'Morgan D.', age: 6, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 28, practitionerId: 'prac-4', practitionerName: 'Rachel Green' },
        { id: 'child-9', name: 'Avery T.', age: 8, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 31, practitionerId: 'prac-4', practitionerName: 'Rachel Green' },
        { id: 'child-10', name: 'Quinn R.', age: 7, status: 'active', lastCheckIn: '2024-08-21', totalCheckIns: 24, practitionerId: 'prac-5', practitionerName: 'James Murphy' },
        { id: 'child-11', name: 'Sage H.', age: 9, status: 'needs_attention', lastCheckIn: '2024-08-19', totalCheckIns: 19, practitionerId: 'prac-5', practitionerName: 'James Murphy' }
      ]
    },
    {
      id: 'org-3',
      name: 'Dr. Amanda Foster',
      type: 'practitioner',
      contactName: 'Dr. Amanda Foster',
      contactEmail: 'amanda.foster@psychology-clinic.com',
      seatsAllocated: 25,
      seatsUsed: 18,
      status: 'active',
      createdDate: '2024-05-20',
      lastActivity: '2024-08-22',
      practitioners: [
        {
          id: 'prac-6',
          name: 'Dr. Amanda Foster',
          email: 'amanda.foster@psychology-clinic.com',
          status: 'active',
          joinDate: '2024-05-20',
          childrenCount: 18,
          lastActive: '2024-08-22',
          orgId: 'org-3'
        }
      ],
      children: [
        { id: 'child-12', name: 'River N.', age: 8, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 15, practitionerId: 'prac-6', practitionerName: 'Dr. Amanda Foster' },
        { id: 'child-13', name: 'Phoenix L.', age: 6, status: 'active', lastCheckIn: '2024-08-21', totalCheckIns: 12, practitionerId: 'prac-6', practitionerName: 'Dr. Amanda Foster' },
        { id: 'child-14', name: 'Rowan C.', age: 9, status: 'active', lastCheckIn: '2024-08-22', totalCheckIns: 18, practitionerId: 'prac-6', practitionerName: 'Dr. Amanda Foster' }
      ]
    },
    {
      id: 'org-4',
      name: 'Emily Carter Counselling',
      type: 'practitioner',
      contactName: 'Emily Carter',
      contactEmail: 'emily@cartercounselling.com',
      seatsAllocated: 15,
      seatsUsed: 12,
      status: 'expired',
      createdDate: '2024-07-01',
      lastActivity: '2024-08-21',
      practitioners: [
        {
          id: 'prac-7',
          name: 'Emily Carter',
          email: 'emily@cartercounselling.com',
          status: 'active',
          joinDate: '2024-07-01',
          childrenCount: 12,
          lastActive: '2024-08-21',
          orgId: 'org-4'
        }
      ],
      children: [
        { id: 'child-15', name: 'Sky M.', age: 7, status: 'active', lastCheckIn: '2024-08-21', totalCheckIns: 8, practitionerId: 'prac-7', practitionerName: 'Emily Carter' },
        { id: 'child-16', name: 'Ocean P.', age: 8, status: 'active', lastCheckIn: '2024-08-21', totalCheckIns: 6, practitionerId: 'prac-7', practitionerName: 'Emily Carter' }
      ]
    },
    {
      id: 'org-5',
      name: 'Marcus Thompson Therapy',
      type: 'practitioner',
      contactName: 'Marcus Thompson',
      contactEmail: 'marcus@thompson-therapy.co.uk',
      seatsAllocated: 20,
      seatsUsed: 8,
      status: 'expired',
      createdDate: '2024-04-15',
      lastActivity: '2024-07-30',
      practitioners: [
        {
          id: 'prac-8',
          name: 'Marcus Thompson',
          email: 'marcus@thompson-therapy.co.uk',
          status: 'expired',
          joinDate: '2024-04-15',
          childrenCount: 8,
          lastActive: '2024-07-30',
          orgId: 'org-5'
        }
      ],
      children: [
        { id: 'child-17', name: 'Luna G.', age: 6, status: 'inactive', lastCheckIn: '2024-07-25', totalCheckIns: 14, practitionerId: 'prac-8', practitionerName: 'Marcus Thompson' },
        { id: 'child-18', name: 'Atlas F.', age: 9, status: 'inactive', lastCheckIn: '2024-07-28', totalCheckIns: 11, practitionerId: 'prac-8', practitionerName: 'Marcus Thompson' }
      ]
    },
    {
      id: 'org-6',
      name: 'Riverside School Archive',
      type: 'group',
      contactName: 'Jennifer Adams',
      contactEmail: 'jennifer.adams@riverside-archive.edu',
      seatsAllocated: 100,
      seatsUsed: 0,
      status: 'archived',
      createdDate: '2023-09-15',
      lastActivity: '2024-03-30',
      practitioners: [],
      children: []
    },
    {
      id: 'org-7',
      name: 'Dr. Sarah Mitchell Archive',
      type: 'practitioner',
      contactName: 'Dr. Sarah Mitchell',
      contactEmail: 'sarah.mitchell@archive-therapy.com',
      seatsAllocated: 30,
      seatsUsed: 0,
      status: 'archived',
      createdDate: '2023-12-01',
      lastActivity: '2024-05-15',
      practitioners: [],
      children: []
    }
  ]

  const recentActivity = [
    {
      id: '1',
      type: 'client_added',
      message: 'New client "Sunshine Primary School" was added',
      timestamp: '2024-08-22T10:30:00Z',
      status: 'success'
    },
    {
      id: '2',
      type: 'child_attention',
      message: 'Child Jamie K. requires attention - low wellbeing scores',
      timestamp: '2024-08-22T09:15:00Z',
      status: 'warning'
    },
    {
      id: '3',
      type: 'practitioner_added',
      message: 'Emma Wilson joined as practitioner',
      timestamp: '2024-08-21T16:45:00Z',
      status: 'success'
    },
    {
      id: '4',
      type: 'seat_utilisation',
      message: 'Westfield Community Centre at 84% seat utilisation',
      timestamp: '2024-08-21T14:20:00Z',
      status: 'info'
    }
  ]

  // Filter clients based on search and filters
  const filteredClients = sampleClients.filter(client => {
    const matchesSearch = client.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         client.contactName.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         client.contactEmail.toLowerCase().includes(searchTerm.toLowerCase())
    
    // Exclude archived clients from "all" - they should only appear when explicitly selected
    const matchesStatus = statusFilter === 'all' 
      ? client.status !== 'archived' 
      : client.status === statusFilter
    const matchesType = typeFilter === 'all' || client.type === typeFilter
    
    return matchesSearch && matchesStatus && matchesType
  })

  useEffect(() => {
    // Calculate stats from sample data
    const calculateStats = () => {
      const totalClients = sampleClients.length
      const activeClients = sampleClients.filter(client => client.status === 'active').length
      
      const allPractitioners = sampleClients.flatMap(client => client.practitioners)
      const totalPractitioners = allPractitioners.length
      const activePractitioners = allPractitioners.filter(p => p.status === 'active').length
      
      const allChildren = sampleClients.flatMap(client => client.children)
      const totalChildren = allChildren.length
      const activeChildren = allChildren.filter(c => c.status === 'active').length
      const childrenNeedingAttention = allChildren.filter(c => c.status === 'needs_attention').length
      
      const totalSeatsAllocated = sampleClients.reduce((sum, client) => sum + client.seatsAllocated, 0)
      const totalSeatsUsed = sampleClients.reduce((sum, client) => sum + client.seatsUsed, 0)
      const utilisationRate = totalSeatsAllocated > 0 ? Math.round((totalSeatsUsed / totalSeatsAllocated) * 100) : 0

      setStats({
        totalClients,
        activeClients,
        totalPractitioners,
        activePractitioners,
        totalChildren,
        activeChildren,
        totalSeatsAllocated,
        totalSeatsUsed,
        utilisationRate,
        childrenNeedingAttention
      })
      
      setLoading(false)
    }

    // Simulate loading delay
    setTimeout(calculateStats, 500)
  }, [])

  const getActivityIcon = (type: string) => {
    switch (type) {
      case 'client_added':
        return <Building2 className="h-4 w-4" />
      case 'child_attention':
        return <AlertTriangle className="h-4 w-4" />
      case 'practitioner_added':
        return <UserCheck className="h-4 w-4" />
      case 'seat_utilisation':
        return <TrendingUp className="h-4 w-4" />
      default:
        return <Activity className="h-4 w-4" />
    }
  }

  const getActivityStatusColor = (status: string) => {
    switch (status) {
      case 'success':
        return 'text-green-600 bg-green-50'
      case 'warning':
        return 'text-yellow-600 bg-yellow-50'
      case 'error':
        return 'text-red-600 bg-red-50'
      default:
        return 'text-blue-600 bg-blue-50'
    }
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-GB', {
      day: 'numeric',
      month: 'short',
      year: 'numeric'
    })
  }

  const getStatusBadgeStyle = (status: string) => {
    switch (status) {
      case 'active':
        return 'bg-green-100 text-green-800 border-green-200'
      case 'expired':
        return 'bg-red-100 text-red-800 border-red-200'
      case 'archived':
        return 'bg-gray-100 text-gray-600 border-gray-300'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  const getTypeBadgeStyle = (type: string) => {
    switch (type) {
      case 'group':
        return 'bg-blue-100 text-blue-800 border-blue-200'
      case 'practitioner':
        return 'bg-purple-100 text-purple-800 border-purple-200'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  if (loading) {
    return <PageLoader message="Loading admin dashboard..." />
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="flex items-center justify-between mb-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
          </div>
          <Link to="/admin/clients/new">
            <Button className="bg-blue-600 hover:bg-blue-700">
              <Plus className="h-4 w-4 mr-2" />
              Add Client
            </Button>
          </Link>
        </div>

        {/* Stats Grid */}
        <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-4 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Clients</CardTitle>
              <Building2 className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.totalClients}</div>
              <p className="text-xs text-muted-foreground">
                {stats.activeClients} active
              </p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Practitioners</CardTitle>
              <Users className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.totalPractitioners}</div>
              <p className="text-xs text-muted-foreground">
                {stats.activePractitioners} active
              </p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Children</CardTitle>
              <Baby className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.totalChildren}</div>
              <p className="text-xs text-muted-foreground">
                {stats.activeChildren} active
              </p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Seat Utilisation</CardTitle>
              <TrendingUp className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.utilisationRate}%</div>
              <p className="text-xs text-muted-foreground">
                {stats.totalSeatsUsed} of {stats.totalSeatsAllocated} seats
              </p>
            </CardContent>
          </Card>
        </div>

        {/* Client Management */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <div>
                <h2 className="text-2xl font-bold text-gray-900">
                  {statusFilter === 'archived' ? 'Archived Clients' : 'Clients'}
                </h2>
                {statusFilter === 'archived' && (
                  <p className="text-sm text-gray-600 mt-1">
                    Viewing archived clients
                  </p>
                )}
              </div>
            </div>
            
            {/* Search and Filters */}
            <div className="flex flex-col md:flex-row gap-4 pt-4">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-gray-400" />
                <Input
                  placeholder="Search clients, contacts..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
              <div className="flex gap-2">
                <Select value={statusFilter} onValueChange={setStatusFilter}>
                  <SelectTrigger className="w-32">
                    <SelectValue placeholder="Status" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Status</SelectItem>
                    <SelectItem value="active">Active</SelectItem>
                    <SelectItem value="expired">Expired</SelectItem>
                    <SelectItem value="archived">Archived</SelectItem>
                  </SelectContent>
                </Select>
                
                <Select value={typeFilter} onValueChange={setTypeFilter}>
                  <SelectTrigger className="w-32">
                    <SelectValue placeholder="Type" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Types</SelectItem>
                    <SelectItem value="group">Group</SelectItem>
                    <SelectItem value="practitioner">Practitioner</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
          </CardHeader>
          
          <CardContent>
            <div className="space-y-4">
              {filteredClients.length === 0 ? (
                <div className="text-center py-8">
                  <Building2 className="h-12 w-12 text-gray-300 mx-auto mb-4" />
                  <p className="text-gray-500">No clients found matching your criteria</p>
                </div>
              ) : (
                filteredClients.map((client) => (
                  <div key={client.id} className="bg-white border border-gray-200 rounded-xl shadow-sm hover:shadow-md transition-all duration-200">
                    {/* Header Section */}
                    <div className="p-6">
                      <div className="flex items-start justify-between">
                        <div className="flex-1">
                          <h3 className="text-xl font-semibold text-gray-900 mb-3">{client.name}</h3>
                          <div className="flex items-center gap-3 mb-4">
                            <Badge className={getTypeBadgeStyle(client.type)}>
                              {client.type === 'group' ? 'Group' : 'Practitioner'}
                            </Badge>
                            <Badge className={getStatusBadgeStyle(client.status)}>
                              {client.status}
                            </Badge>
                          </div>
                          
                          {/* Contact Information */}
                          <div className="space-y-2">
                            <div className="text-sm text-gray-600">
                              <span className="font-medium text-gray-700">Contact:</span> {client.contactName}
                            </div>
                            <div className="text-sm text-gray-600">
                              <span className="font-medium text-gray-700">Email:</span> {client.contactEmail}
                            </div>
                          </div>
                        </div>
                        
                        <Link to={`/admin/clients/${client.id}`}>
                          <Button variant="outline" size="sm" className="ml-4">
                            <Edit className="h-4 w-4 mr-2" />
                            Manage
                          </Button>
                        </Link>
                      </div>
                    </div>

                    {/* Statistics */}
                    <div className="bg-gray-50 px-6 py-5 rounded-b-xl border-t border-gray-100">
                      <div className="grid grid-cols-3 gap-8">
                        <div className="text-center">
                          <div className="text-2xl font-semibold text-gray-900 mb-1">
                            {client.type === 'group' ? client.practitioners.length : '1'}
                          </div>
                          <div className="text-sm font-medium text-gray-600">
                            {client.type === 'group' ? 'Practitioners' : 'Practitioner'}
                          </div>
                        </div>
                        <div className="text-center">
                          <div className="text-2xl font-semibold text-gray-900 mb-1">{client.children.length}</div>
                          <div className="text-sm font-medium text-gray-600">Children</div>
                        </div>
                        <div className="text-center">
                          <div className="text-2xl font-semibold text-gray-900 mb-1">
                            {client.seatsAllocated > 0 ? Math.round((client.seatsUsed / client.seatsAllocated) * 100) : 0}%
                          </div>
                          <div className="text-sm font-medium text-gray-600">Seat Utilisation</div>
                        </div>
                      </div>
                    </div>
                  </div>
                ))
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}