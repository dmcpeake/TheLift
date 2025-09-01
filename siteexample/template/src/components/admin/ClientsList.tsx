import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Input } from '../ui/input'
import { 
  Users, 
  Search, 
  Plus, 
  Building, 
  User, 
  Baby,
  Calendar,
  TrendingUp,
  AlertTriangle,
  CheckCircle,
  Eye,
  Edit
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
  status: 'active' | 'expired' | 'deactivated' | 'archived'
  expiryDate: string
  createdDate: string
  lastActivity: string
  archivedDate?: string
  practitioners: Practitioner[]
  children: ChildProfile[]
}

export function ClientsList() {
  const [clients, setClients] = useState<Client[]>([])
  const [searchTerm, setSearchTerm] = useState('')
  const [filterType, setFilterType] = useState<'all' | 'practitioners' | 'individual' | 'archived'>('all')
  const [loading, setLoading] = useState(true)

  // Sample data
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
      expiryDate: '2025-01-15',
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
      expiryDate: '2025-03-10',
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
      expiryDate: '2025-05-20',
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
      name: 'Emily Carter Counseling',
      type: 'practitioner',
      contactName: 'Emily Carter',
      contactEmail: 'emily@cartercounseling.com',
      seatsAllocated: 15,
      seatsUsed: 12,
      status: 'expired',
      expiryDate: '2024-07-01',
      createdDate: '2024-07-01',
      lastActivity: '2024-08-21',
      practitioners: [
        {
          id: 'prac-7',
          name: 'Emily Carter',
          email: 'emily@cartercounseling.com',
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
      status: 'deactivated',
      expiryDate: '2025-04-15',
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
      name: 'Green Valley Academy',
      type: 'group',
      contactName: 'Jennifer Smith',
      contactEmail: 'jennifer.smith@greenvalley.edu',
      seatsAllocated: 100,
      seatsUsed: 45,
      status: 'archived',
      expiryDate: '2024-12-31',
      createdDate: '2023-09-01',
      lastActivity: '2024-06-15',
      archivedDate: '2024-07-01',
      practitioners: [
        {
          id: 'prac-9',
          name: 'Jennifer Smith',
          email: 'jennifer.smith@greenvalley.edu',
          status: 'inactive',
          joinDate: '2023-09-01',
          childrenCount: 25,
          lastActive: '2024-06-15',
          orgId: 'org-6'
        },
        {
          id: 'prac-10',
          name: 'Robert Davis',
          email: 'robert.davis@greenvalley.edu',
          status: 'inactive',
          joinDate: '2023-10-15',
          childrenCount: 20,
          lastActive: '2024-06-10',
          orgId: 'org-6'
        }
      ],
      children: [
        { id: 'child-19', name: 'River A.', age: 7, status: 'inactive', lastCheckIn: '2024-06-14', totalCheckIns: 35, practitionerId: 'prac-9', practitionerName: 'Jennifer Smith' },
        { id: 'child-20', name: 'Sage B.', age: 8, status: 'inactive', lastCheckIn: '2024-06-15', totalCheckIns: 28, practitionerId: 'prac-9', practitionerName: 'Jennifer Smith' },
        { id: 'child-21', name: 'Dakota C.', age: 6, status: 'inactive', lastCheckIn: '2024-06-10', totalCheckIns: 22, practitionerId: 'prac-10', practitionerName: 'Robert Davis' }
      ]
    }
  ]

  useEffect(() => {
    // Simulate loading
    setTimeout(() => {
      setClients(sampleClients)
      setLoading(false)
    }, 500)
  }, [])

  const filteredClients = clients.filter(client => {
    const matchesSearch = client.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         client.contactName.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         client.contactEmail.toLowerCase().includes(searchTerm.toLowerCase())
    
    let matchesFilter = false
    
    switch (filterType) {
      case 'all':
        // Show all clients except archived
        matchesFilter = client.status !== 'archived'
        break
      case 'practitioners':
        // Show group clients that are not archived
        matchesFilter = client.type === 'group' && client.status !== 'archived'
        break
      case 'individual':
        // Show individual practitioners that are not archived
        matchesFilter = client.type === 'practitioner' && client.status !== 'archived'
        break
      case 'archived':
        // Show only archived clients
        matchesFilter = client.status === 'archived'
        break
      default:
        matchesFilter = client.status !== 'archived'
    }
    
    return matchesSearch && matchesFilter
  })

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'active':
        return <Badge className="bg-gray-100 text-gray-800">Active</Badge>
      case 'expired':
        return <Badge className="bg-red-100 text-red-800">Expired</Badge>
      case 'deactivated':
        return <Badge className="bg-gray-100 text-gray-800">Deactivated</Badge>
      case 'archived':
        return <Badge className="bg-gray-100 text-gray-800">Archived</Badge>
      default:
        return null
    }
  }

  const getUtilizationColor = (percentage: number) => {
    if (percentage >= 90) return 'text-red-600'
    if (percentage >= 70) return 'text-yellow-600'
    return 'text-green-600'
  }

  // Calculate stats excluding archived clients
  const activeClients = clients.filter(client => client.status !== 'archived')
  
  const totalStats = {
    totalClients: activeClients.length,
    totalPractitioners: activeClients.reduce((sum, client) => sum + client.practitioners.length, 0),
    totalChildren: activeClients.reduce((sum, client) => sum + client.children.length, 0),
    totalSeatsAllocated: activeClients.reduce((sum, client) => sum + client.seatsAllocated, 0),
    totalSeatsUsed: activeClients.reduce((sum, client) => sum + client.seatsUsed, 0)
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-4 border-gray-400 border-t-transparent mx-auto mb-4"></div>
          <p className="text-lg text-gray-700">Loading clients...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="flex items-center justify-between mb-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">Client Management</h1>
            <p className="text-gray-600 mt-1">Manage clients, practitioners, and their allocated seats</p>
          </div>
          <Link to="/admin/clients/new">
            <Button>
              <Plus className="h-4 w-4 mr-2" />
              Add Client
            </Button>
          </Link>
        </div>

        {/* Stats Overview */}
        <div className="grid grid-cols-1 md:grid-cols-5 gap-6 mb-8">
          <Card>
            <CardContent className="p-6">
              <div className="flex items-center">
                <Building className="h-8 w-8 text-gray-600" />
                <div className="ml-4">
                  <p className="text-sm font-medium text-gray-600">Clients</p>
                  <p className="text-2xl font-bold text-gray-900">{totalStats.totalClients}</p>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="p-6">
              <div className="flex items-center">
                <User className="h-8 w-8 text-gray-600" />
                <div className="ml-4">
                  <p className="text-sm font-medium text-gray-600">Practitioners</p>
                  <p className="text-2xl font-bold text-gray-900">{totalStats.totalPractitioners}</p>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="p-6">
              <div className="flex items-center">
                <Baby className="h-8 w-8 text-gray-600" />
                <div className="ml-4">
                  <p className="text-sm font-medium text-gray-600">Children</p>
                  <p className="text-2xl font-bold text-gray-900">{totalStats.totalChildren}</p>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="p-6">
              <div className="flex items-center">
                <Users className="h-8 w-8 text-gray-600" />
                <div className="ml-4">
                  <p className="text-sm font-medium text-gray-600">Seats Allocated</p>
                  <p className="text-2xl font-bold text-gray-900">{totalStats.totalSeatsAllocated}</p>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="p-6">
              <div className="flex items-center">
                <TrendingUp className="h-8 w-8 text-gray-600" />
                <div className="ml-4">
                  <p className="text-sm font-medium text-gray-600">Utilization</p>
                  <p className={`text-2xl font-bold ${getUtilizationColor((totalStats.totalSeatsUsed / totalStats.totalSeatsAllocated) * 100)}`}>
                    {Math.round((totalStats.totalSeatsUsed / totalStats.totalSeatsAllocated) * 100)}%
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Filters */}
        <Card className="mb-6">
          <CardContent className="p-6">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                <Input
                  placeholder="Search by client name, contact, or email..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
              <div className="flex gap-2">
                <Button
                  variant={filterType === 'all' ? 'default' : 'outline'}
                  onClick={() => setFilterType('all')}
                >
                  All Clients
                </Button>
                <Button
                  variant={filterType === 'practitioners' ? 'default' : 'outline'}
                  onClick={() => setFilterType('practitioners')}
                >
                  Practitioners
                </Button>
                <Button
                  variant={filterType === 'individual' ? 'default' : 'outline'}
                  onClick={() => setFilterType('individual')}
                >
                  Individual Practitioners
                </Button>
                <Button
                  variant={filterType === 'archived' ? 'default' : 'outline'}
                  onClick={() => setFilterType('archived')}
                >
                  Archived
                </Button>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Clients List */}
        <div className="space-y-6">
          {filteredClients.map((client) => {
            const utilizationPercentage = (client.seatsUsed / client.seatsAllocated) * 100
            
            return (
              <Card key={client.id} className="shadow-sm hover:shadow-md transition-shadow">
                <CardHeader>
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-4">
                      <div className={`w-12 h-12 rounded-full flex items-center justify-center ${
                        client.type === 'group' ? 'bg-gray-100' : 'bg-gray-100'
                      }`}>
                        {client.type === 'group' ? (
                          <Building className="h-6 w-6 text-gray-600" />
                        ) : (
                          <User className="h-6 w-6 text-gray-600" />
                        )}
                      </div>
                      <div>
                        <CardTitle className="text-xl">{client.name}</CardTitle>
                        <p className="text-gray-600">{client.contactName} • {client.contactEmail}</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      {getStatusBadge(client.status)}
                      <Link to={`/admin/clients/${client.id}`}>
                        <Button variant="outline" size="sm">
                          <Eye className="h-4 w-4 mr-2" />
                          {client.status === 'archived' ? 'Manage' : 'View Details'}
                        </Button>
                      </Link>
                      {client.status !== 'archived' && (
                        <Link to={`/admin/clients/${client.id}/edit`}>
                          <Button variant="outline" size="sm">
                            <Edit className="h-4 w-4 mr-2" />
                            Edit
                          </Button>
                        </Link>
                      )}
                    </div>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                    {/* Seat Utilization */}
                    <div>
                      <h4 className="font-medium text-gray-900 mb-2">Seat Utilization</h4>
                      <div className="flex items-center gap-2 mb-1">
                        <span className={`text-lg font-bold ${getUtilizationColor(utilizationPercentage)}`}>
                          {client.seatsUsed}/{client.seatsAllocated}
                        </span>
                        <span className="text-sm text-gray-500">
                          ({Math.round(utilizationPercentage)}%)
                        </span>
                      </div>
                      <div className="w-full bg-gray-200 rounded-full h-2">
                        <div
                          className={`h-2 rounded-full ${
                            utilizationPercentage >= 90 ? 'bg-red-500' :
                            utilizationPercentage >= 70 ? 'bg-yellow-500' : 'bg-green-500'
                          }`}
                          style={{ width: `${Math.min(utilizationPercentage, 100)}%` }}
                        />
                      </div>
                    </div>

                    {/* Practitioners */}
                    <div>
                      <h4 className="font-medium text-gray-900 mb-2">Practitioners</h4>
                      <div className="flex items-center gap-2 mb-1">
                        <User className="h-4 w-4 text-gray-500" />
                        <span className="text-lg font-bold text-gray-900">{client.practitioners.length}</span>
                      </div>

                    </div>

                    {/* Children */}
                    <div>
                      <h4 className="font-medium text-gray-900 mb-2">Children</h4>
                      <div className="flex items-center gap-2 mb-1">
                        <Baby className="h-4 w-4 text-gray-500" />
                        <span className="text-lg font-bold text-gray-900">{client.children.length}</span>
                      </div>

                    </div>

                    {/* Last Activity / Archived Date */}
                    <div>
                      <h4 className="font-medium text-gray-900 mb-2">
                        {client.status === 'archived' ? 'Archived Date' : 'Last Activity'}
                      </h4>
                      <div className="flex items-center gap-2 mb-1">
                        <Calendar className="h-4 w-4 text-gray-500" />
                        <span className="text-sm text-gray-900">
                          {client.status === 'archived' && client.archivedDate 
                            ? new Date(client.archivedDate).toLocaleDateString()
                            : new Date(client.lastActivity).toLocaleDateString()
                          }
                        </span>
                      </div>

                    </div>
                  </div>


                </CardContent>
              </Card>
            )
          })}
        </div>

        {filteredClients.length === 0 && (
          <Card>
            <CardContent className="p-12 text-center">
              <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
              <h3 className="text-lg font-medium text-gray-900 mb-2">No clients found</h3>
              <p className="text-gray-600 mb-4">
                {searchTerm ? 'Try adjusting your search criteria' : 
                 filterType === 'archived' ? 'No archived clients found' : 
                 'Get started by adding your first client'}
              </p>
              {filterType !== 'archived' && (
                <Link to="/admin/clients/new">
                  <Button>
                    <Plus className="h-4 w-4 mr-2" />
                    Add Client
                  </Button>
                </Link>
              )}
            </CardContent>
          </Card>
        )}
      </div>
    </div>
  )
}