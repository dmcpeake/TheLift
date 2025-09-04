import React, { useState, useEffect, useContext } from 'react'
import { useParams, Link } from 'react-router-dom'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { Collapsible, CollapsibleContent, CollapsibleTrigger } from '../ui/collapsible'
import { 
  Building, 
  User, 
  Baby,
  Calendar,
  Mail,
  Phone,
  Users,
  TrendingUp,
  Edit,
  CheckCircle,
  XCircle,
  AlertCircle,
  RotateCcw,
  History,
  ChevronDown,
  ArrowLeft
} from 'lucide-react'
import { Client } from './types'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId } from '../../utils/supabase/info'

export function ClientDetails() {
  const { id } = useParams<{ id: string }>()
  const { user } = useContext(AuthContext)
  const supabase = getSupabaseClient()
  const [client, setClient] = useState<Client | null>(null)
  const [loading, setLoading] = useState(true)
  const [emailHistory, setEmailHistory] = useState<any[]>([])
  const [emailHistoryLoading, setEmailHistoryLoading] = useState(false)
  const [emailHistoryLoaded, setEmailHistoryLoaded] = useState(false)
  const [showEmailHistory, setShowEmailHistory] = useState(false)


  // Complete client data - matches ClientsList.tsx
  const sampleClients = [
    {
      id: 'org-1',
      name: 'Sunshine Primary School',
      type: 'group',
      contactName: 'Sarah Thompson',
      contactEmail: 'sarah.thompson@sunshine-primary.edu',
      phone: '01234 567890',
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
      phone: '01234 789012',
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
      phone: '01234 345678',
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
      phone: '01234 234567',
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
      phone: '01234 123456',
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
      phone: '01234 456789',
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
    // Simulate loading and finding client by id
    setTimeout(() => {
      const foundClient = sampleClients.find(c => c.id === id)
      setClient(foundClient || null)
      setLoading(false)
      
      // Check for email history after client loads
      if (foundClient) {
        checkEmailHistory()
      }
    }, 500)
  }, [id])

  const checkEmailHistory = async () => {
    if (!id || emailHistoryLoaded) return
    
    try {
      const { data: { session } } = await supabase.auth.getSession()
      if (!session?.access_token) return

      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/admin/clients/${id}/email-history`, {
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
      })

      if (response.ok) {
        const result = await response.json()
        setEmailHistory(result.history || [])
      }
    } catch (error) {
      console.error('Error checking email history:', error)
    } finally {
      setEmailHistoryLoaded(true)
    }
  }

  const fetchEmailHistory = async () => {
    if (!id || emailHistoryLoading) return
    
    setEmailHistoryLoading(true)
    try {
      const { data: { session } } = await supabase.auth.getSession()
      if (!session?.access_token) return

      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/admin/clients/${id}/email-history`, {
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
      })

      if (response.ok) {
        const result = await response.json()
        setEmailHistory(result.history || [])
      }
    } catch (error) {
      console.error('Error fetching email history:', error)
    } finally {
      setEmailHistoryLoading(false)
    }
  }

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
      case 'needs_attention':
        return <Badge className="bg-gray-100 text-gray-800">Needs Attention</Badge>
      case 'pending':
        return <Badge className="bg-gray-100 text-gray-800">Pending</Badge>
      default:
        return null
    }
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'active':
        return <CheckCircle className="h-4 w-4 text-gray-600" />
      case 'expired':
        return <XCircle className="h-4 w-4 text-gray-600" />
      case 'needs_attention':
        return <AlertCircle className="h-4 w-4 text-gray-600" />
      default:
        return <CheckCircle className="h-4 w-4 text-gray-600" />
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-4 border-blue-500 border-t-transparent mx-auto mb-4"></div>
          <p className="text-lg text-gray-700">Loading client details...</p>
        </div>
      </div>
    )
  }

  if (!client) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Client Not Found</h2>
          <p className="text-gray-600 mb-6">The requested client could not be found.</p>
          <Link to="/admin">
            <Button>
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back to Clients
            </Button>
          </Link>
        </div>
      </div>
    )
  }

  const utilisationPercentage = (client.seatsUsed / client.seatsAllocated) * 100

  const getManagementTitle = () => {
    if (client?.type === 'group') {
      return 'Manage Group'
    } else {
      return 'Manage Practitioner'
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Breadcrumb Navigation */}
        <Breadcrumb className="mb-6">
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to="/admin">Dashboard</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{client.name}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="flex items-center justify-between mb-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">{getManagementTitle()}</h1>
          </div>
          <div className="flex gap-2">
            {client.status === 'archived' ? (
              <Button>
                <RotateCcw className="h-4 w-4 mr-2" />
                Reactivate Client
              </Button>
            ) : (
              <Link to={`/admin/clients/${client.id}/edit`}>
                <Button>
                  <Edit className="h-4 w-4 mr-2" />
                  Edit
                </Button>
              </Link>
            )}
          </div>
        </div>

        {/* Client Overview */}
        <Card className="mb-8">
          <CardHeader>
            <div className="flex items-center justify-between">
              <div className="flex-1">
                <CardTitle className="text-2xl">{client.name}</CardTitle>
              </div>
              {getStatusBadge(client.status)}
            </div>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div>
                <h4 className="font-medium text-gray-900 mb-3">Contact Information</h4>
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <User className="h-4 w-4 text-gray-500" />
                    <span className="text-sm">{client.contactName}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Mail className="h-4 w-4 text-gray-500" />
                    <span className="text-sm">{client.contactEmail}</span>
                  </div>
                  {client.phone && (
                    <div className="flex items-center gap-2">
                      <Phone className="h-4 w-4 text-gray-500" />
                      <span className="text-sm">{client.phone}</span>
                    </div>
                  )}
                </div>
              </div>
              
              <div>
                <h4 className="font-medium text-gray-900 mb-3">Account Details</h4>
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <Calendar className="h-4 w-4 text-gray-500" />
                    <span className="text-sm">Created {new Date(client.createdDate).toLocaleDateString()}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <TrendingUp className="h-4 w-4 text-gray-500" />
                    <span className="text-sm">Last active {new Date(client.lastActivity).toLocaleDateString()}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Calendar className="h-4 w-4 text-gray-500" />
                    <span className="text-sm">Expires {new Date(client.expiryDate).toLocaleDateString()}</span>
                  </div>
                </div>
              </div>

              <div>
                <h4 className="font-medium text-gray-900 mb-3">Seat Utilisation</h4>
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <Users className="h-4 w-4 text-gray-500" />
                    <span className="text-sm">{client.seatsUsed} of {client.seatsAllocated} seats used</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2">
                    <div
                      className={`h-2 rounded-full ${
                        utilisationPercentage >= 90 ? 'bg-red-500' :
                        utilisationPercentage >= 70 ? 'bg-yellow-500' : 'bg-green-500'
                      }`}
                      style={{ width: `${Math.min(utilisationPercentage, 100)}%` }}
                    />
                  </div>
                  <span className="text-sm text-gray-600">{Math.round(utilisationPercentage)}% utilisation</span>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Practitioners */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle>Practitioners ({client.practitioners.length})</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {client.practitioners.map((practitioner) => (
                <div key={practitioner.id} className="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                  <div className="flex items-center">
                    <div>
                      <p className="font-medium">{practitioner.name}</p>
                      <p className="text-sm text-gray-600">{practitioner.email}</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-4">
                    <div className="text-right">
                      <p className="text-sm font-medium">{practitioner.childrenCount} children</p>
                      <p className="text-xs text-gray-600">Last active {new Date(practitioner.lastActive).toLocaleDateString()}</p>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Email History - Only show if there are email changes */}
        {emailHistoryLoaded && emailHistory.length > 0 && (
          <Card className="mb-8">
            <Collapsible 
              open={showEmailHistory} 
              onOpenChange={(open) => {
                setShowEmailHistory(open)
                if (open && !emailHistoryLoading) {
                  fetchEmailHistory()
                }
              }}
            >
              <CollapsibleTrigger asChild>
                <CardHeader className="cursor-pointer hover:bg-gray-50">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <History className="h-4 w-4" />
                      <CardTitle>Email Change History</CardTitle>
                    </div>
                    <ChevronDown className={`h-4 w-4 transition-transform ${showEmailHistory ? 'rotate-180' : ''}`} />
                  </div>
                </CardHeader>
              </CollapsibleTrigger>
              <CollapsibleContent>
                <CardContent>
                  {emailHistoryLoading ? (
                    <div className="text-center py-4">
                      <div className="animate-spin rounded-full h-6 w-6 border-2 border-gray-400 border-t-transparent mx-auto mb-2"></div>
                      <p className="text-sm text-gray-600">Loading email history...</p>
                    </div>
                  ) : (
                    <div className="space-y-3">
                      {emailHistory.map((change, index) => (
                        <div key={index} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                          <div>
                            <p className="text-sm font-medium">
                              {change.oldEmail} → {change.newEmail}
                            </p>
                            <p className="text-xs text-gray-600">
                              Changed by {change.adminEmail} • {new Date(change.timestamp).toLocaleString()}
                            </p>
                            {change.reason && (
                              <p className="text-xs text-gray-600 mt-1">Reason: {change.reason}</p>
                            )}
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                </CardContent>
              </CollapsibleContent>
            </Collapsible>
          </Card>
        )}

        {/* Children Overview */}
        <Card>
          <CardHeader>
            <CardTitle>Children Overview</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="text-center">
                <div className="flex items-center justify-center w-16 h-16 bg-gray-100 rounded-full mx-auto mb-3">
                  <Baby className="h-8 w-8 text-gray-600" />
                </div>
                <p className="text-2xl font-bold text-gray-900 mb-1">{client.children.length}</p>
                <p className="text-sm text-gray-600">Total Children</p>
              </div>
              
              <div className="text-center">
                <div className="flex items-center justify-center w-16 h-16 bg-gray-100 rounded-full mx-auto mb-3">
                  <CheckCircle className="h-8 w-8 text-gray-600" />
                </div>
                <p className="text-2xl font-bold text-gray-900 mb-1">
                  {client.children.filter(child => child.status === 'active').length}
                </p>
                <p className="text-sm text-gray-600">Active</p>
              </div>
              
              <div className="text-center">
                <div className="flex items-center justify-center w-16 h-16 bg-gray-100 rounded-full mx-auto mb-3">
                  <TrendingUp className="h-8 w-8 text-gray-600" />
                </div>
                <p className="text-2xl font-bold text-gray-900 mb-1">
                  {Math.round(client.children.reduce((sum, child) => sum + child.totalCheckIns, 0) / client.children.length) || 0}
                </p>
                <p className="text-sm text-gray-600">Avg Check-ins</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}