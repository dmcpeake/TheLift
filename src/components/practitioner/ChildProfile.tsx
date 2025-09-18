import React, { useState, useEffect, useContext } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Badge } from '../ui/badge'
import { Alert, AlertDescription } from '../ui/alert'

import { Progress } from '../ui/progress'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { Pagination, PaginationContent, PaginationEllipsis, PaginationItem, PaginationLink, PaginationNext, PaginationPrevious } from '../ui/pagination'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Input } from '../ui/input'

import { 
  ArrowLeft, 
  Activity, 
  AlertTriangle,
  BookOpen,
  Settings,
  BarChart3,
  Key,
  Copy,
  CheckCircle,
  FileText,
  Filter,
  Calendar,
  CalendarIcon
} from 'lucide-react'
import { Popover, PopoverContent, PopoverTrigger } from '../ui/popover'
import { Calendar as CalendarComponent } from '../ui/calendar'

interface Child {
  id: string
  name: string
  age: number
  status: 'fine' | 'needs_attention' | 'flagged'
  totalCheckIns: number
  currentStreak: number
  orgId: string
  practitionerId: string
  createdAt: string
  aboutMe: {
    favourites: string[]
    notes: string
  }
  credentials: {
    username: string
    pin: string
    mode: string
  }
  recentCheckIns: CheckIn[]
}

interface CheckIn {
  id: string
  childId: string
  createdAt: string
  startingMood: number
  wheel: {
    [key: string]: number
  }
  wrapUpMood: number
  stickerAwarded: string
  status: 'fine' | 'needs_attention' | 'flagged'
}

export function ChildProfile() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { user } = useContext(AuthContext)
  const [child, setChild] = useState<Child | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [copiedItem, setCopiedItem] = useState<string | null>(null)
  
  // Pagination and filtering state
  const [currentPage, setCurrentPage] = useState(1)
  const [dateFromFilter, setDateFromFilter] = useState('')
  const [dateToFilter, setDateToFilter] = useState('')

  const [checkInStatusFilter, setCheckInStatusFilter] = useState('all')
  const itemsPerPage = 5

  useEffect(() => {
    if (id) {
      fetchChildProfile()
    }
  }, [id])

  const fetchChildProfile = async () => {
    if (!id) return

    // Demo mode - use mock data when no user is authenticated
    if (!user) {
      const mockCheckIns = [
        {
          id: 'checkin-1',
          childId: id,
          createdAt: new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString(),
          startingMood: 7,
          wheel: { happy: 8, calm: 6, confident: 7, energetic: 5 },
          wrapUpMood: 8,
          stickerAwarded: 'star',
          status: 'fine' as const
        },
        {
          id: 'checkin-2',
          childId: id,
          createdAt: new Date(Date.now() - 48 * 60 * 60 * 1000).toISOString(),
          startingMood: 4,
          wheel: { happy: 3, calm: 2, confident: 4, energetic: 6 },
          wrapUpMood: 6,
          stickerAwarded: 'heart',
          status: 'needs_attention' as const
        }
      ]

      const mockChild = {
        id: id,
        name: `Demo Child ${id}`,
        age: 8,
        status: 'fine' as const,
        totalCheckIns: 15,
        currentStreak: 3,
        orgId: 'demo-org',
        practitionerId: 'demo-practitioner',
        createdAt: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString(),
        aboutMe: {
          favourites: ['Drawing', 'Playing outside', 'Reading'],
          notes: 'Enjoys creative activities and outdoor play'
        },
        credentials: {
          username: `demo${id}`,
          pin: '1234',
          mode: 'slip'
        },
        recentCheckIns: mockCheckIns
      }

      setChild(mockChild)
      setLoading(false)
      return
    }

    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()

      if (sessionError || !session?.access_token) {
        setError('No valid session found')
        setLoading(false)
        return
      }

      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/${id}`, {
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
      })

      if (response.ok) {
        const data = await response.json()
        setChild(data.child)
      } else {
        // Fallback demo data
        const demoChild: Child = {
          id: id,
          name: 'Emma Thompson',
          age: 8,
          status: 'fine',
          totalCheckIns: 15,
          currentStreak: 4,
          orgId: 'demo-school-001',
          practitionerId: user.id,
          createdAt: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString(),
          aboutMe: {
            favourites: ['Reading', 'Art', 'Soccer', 'Music'],
            notes: 'Emma is a creative and enthusiastic student who loves to help others.'
          },
          credentials: {
            username: 'emmastar42',
            pin: '7834',
            mode: 'slip'
          },
          recentCheckIns: [
            {
              id: 'checkin-1',
              childId: id,
              createdAt: new Date(Date.now() - 1 * 24 * 60 * 60 * 1000).toISOString(),
              startingMood: 3,
              wheel: {
                happy: 4,
                safe: 5,
                supported: 4,
                excited: 3,
                confident: 4
              },
              wrapUpMood: 4,
              stickerAwarded: 'star',
              status: 'fine'
            },
            {
              id: 'checkin-2',
              childId: id,
              createdAt: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString(),
              startingMood: 2,
              wheel: {
                happy: 3,
                safe: 5,
                supported: 3,
                excited: 2,
                confident: 3
              },
              wrapUpMood: 3,
              stickerAwarded: 'heart',
              status: 'needs_attention'
            },
            {
              id: 'checkin-3',
              childId: id,
              createdAt: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000).toISOString(),
              startingMood: 4,
              wheel: {
                happy: 5,
                safe: 4,
                supported: 5,
                excited: 4,
                confident: 5
              },
              wrapUpMood: 5,
              stickerAwarded: 'rainbow',
              status: 'fine'
            },
            {
              id: 'checkin-4',
              childId: id,
              createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000).toISOString(),
              startingMood: 2,
              wheel: {
                happy: 2,
                safe: 4,
                supported: 3,
                excited: 2,
                confident: 2
              },
              wrapUpMood: 3,
              stickerAwarded: 'flower',
              status: 'flagged'
            },
            {
              id: 'checkin-5',
              childId: id,
              createdAt: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString(),
              startingMood: 3,
              wheel: {
                happy: 4,
                safe: 5,
                supported: 4,
                excited: 3,
                confident: 3
              },
              wrapUpMood: 4,
              stickerAwarded: 'butterfly',
              status: 'fine'
            },
            {
              id: 'checkin-6',
              childId: id,
              createdAt: new Date(Date.now() - 10 * 24 * 60 * 60 * 1000).toISOString(),
              startingMood: 4,
              wheel: {
                happy: 3,
                safe: 5,
                supported: 4,
                excited: 4,
                confident: 4
              },
              wrapUpMood: 4,
              stickerAwarded: 'sun',
              status: 'needs_attention'
            },
            {
              id: 'checkin-7',
              childId: id,
              createdAt: new Date(Date.now() - 14 * 24 * 60 * 60 * 1000).toISOString(),
              startingMood: 3,
              wheel: {
                happy: 4,
                safe: 4,
                supported: 3,
                excited: 3,
                confident: 4
              },
              wrapUpMood: 4,
              stickerAwarded: 'tree',
              status: 'fine'
            }
          ]
        }
        setChild(demoChild)
        // 
      }
    } catch (error) {
      console.error('Error fetching child profile:', error)
      // Always provide fallback demo data if any error occurs
      const demoChild: Child = {
        id: id,
        name: 'Emma Thompson',
        age: 8,
        status: 'fine',
        totalCheckIns: 15,
        currentStreak: 4,
        orgId: 'demo-school-001',
        practitionerId: user.id,
        createdAt: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString(),
        aboutMe: {
          favourites: ['Reading', 'Art', 'Soccer', 'Music'],
          notes: 'Emma is a creative and enthusiastic student who loves to help others.'
        },
        credentials: {
          username: 'emmastar42',
          pin: '7834',
          mode: 'slip'
        },
        recentCheckIns: [
          {
            id: 'checkin-1',
            childId: id,
            createdAt: new Date(Date.now() - 1 * 24 * 60 * 60 * 1000).toISOString(),
            startingMood: 3,
            wheel: {
              happy: 4,
              safe: 5,
              supported: 4,
              excited: 3,
              confident: 4
            },
            wrapUpMood: 4,
            stickerAwarded: 'star',
            status: 'fine'
          },
          {
            id: 'checkin-2',
            childId: id,
            createdAt: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString(),
            startingMood: 2,
            wheel: {
              happy: 3,
              safe: 5,
              supported: 3,
              excited: 2,
              confident: 3
            },
            wrapUpMood: 3,
            stickerAwarded: 'heart',
            status: 'needs_attention'
          }
        ]
      }
      setChild(demoChild)
    } finally {
      setLoading(false)
    }
  }

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'needs_attention':
        return <Badge className="bg-yellow-100 text-yellow-800 border-yellow-200">Needs Attention</Badge>
      case 'flagged':
        return <Badge className="bg-red-100 text-red-800 border-red-200">Flagged for Review</Badge>
      default:
        return <Badge variant="outline">Unknown</Badge>
    }
  }

  const getCheckInStatusBadge = (status: 'fine' | 'needs_attention' | 'flagged') => {
    switch (status) {
      case 'fine':
        return <Badge className="bg-green-100 text-green-800 border-green-200">Fine</Badge>
      case 'needs_attention':
        return <Badge className="bg-yellow-100 text-yellow-800 border-yellow-200">Needs Attention</Badge>
      case 'flagged':
        return <Badge className="bg-red-100 text-red-800 border-red-200">Flagged</Badge>
      default:
        return <Badge variant="outline">Unknown</Badge>
    }
  }

  const getWellbeingScore = (checkIn: CheckIn) => {
    const scores = Object.values(checkIn.wheel)
    return Math.round((scores.reduce((a, b) => a + b, 0) / scores.length) * 20) // Convert to percentage
  }

  const getAverageWellbeing = () => {
    if (!child?.recentCheckIns.length) return 0
    const scores = child.recentCheckIns.map(checkIn => getWellbeingScore(checkIn))
    return Math.round(scores.reduce((a, b) => a + b, 0) / scores.length)
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      weekday: 'short',
      month: 'short', 
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })
  }

  const handleCopy = async (text: string, itemType: string) => {
    try {
      await navigator.clipboard.writeText(text)
      setCopiedItem(itemType)
      setTimeout(() => setCopiedItem(null), 2000)
    } catch (err) {
      console.error('Failed to copy:', err)
    }
  }

  // Filter check-ins based on date range and status
  const getFilteredCheckIns = () => {
    if (!child?.recentCheckIns) return []

    let filtered = [...child.recentCheckIns]

    // Date range filter
    if (dateFromFilter) {
      const fromDate = new Date(dateFromFilter)
      filtered = filtered.filter(checkIn => new Date(checkIn.createdAt) >= fromDate)
    }
    if (dateToFilter) {
      const toDate = new Date(dateToFilter)
      toDate.setHours(23, 59, 59, 999) // Include the entire day
      filtered = filtered.filter(checkIn => new Date(checkIn.createdAt) <= toDate)
    }

    // Status filter based on check-in status
    if (checkInStatusFilter !== 'all') {
      filtered = filtered.filter(checkIn => checkIn.status === checkInStatusFilter)
    }

    return filtered.sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
  }

  // Get paginated check-ins
  const getPaginatedCheckIns = () => {
    const filtered = getFilteredCheckIns()
    const startIndex = (currentPage - 1) * itemsPerPage
    const endIndex = startIndex + itemsPerPage
    return filtered.slice(startIndex, endIndex)
  }

  // Get total pages
  const getTotalPages = () => {
    const filtered = getFilteredCheckIns()
    return Math.ceil(filtered.length / itemsPerPage)
  }

  // Reset pagination when filters change
  const handleFilterChange = () => {
    setCurrentPage(1)
  }

  const formatDisplayDate = (date: Date | undefined) => {
    if (!date) return 'Pick a date'
    return date.toLocaleDateString('en-GB', { 
      day: '2-digit', 
      month: 'short', 
      year: 'numeric' 
    })
  }

  const handleFromDateSelect = (date: Date | undefined) => {
    if (date) {
      setDateFromFilter(date.toISOString().split('T')[0])
    } else {
      setDateFromFilter('')
    }
    handleFilterChange()
  }

  const handleToDateSelect = (date: Date | undefined) => {
    if (date) {
      setDateToFilter(date.toISOString().split('T')[0])
    } else {
      setDateToFilter('')
    }
    handleFilterChange()
  }

  const getDateFromString = (dateString: string): Date | undefined => {
    if (!dateString) return undefined
    return new Date(dateString + 'T00:00:00')
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-blue-600"></div>
      </div>
    )
  }

  if (!child) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <Card className="w-full max-w-md">
          <CardContent className="pt-6 text-center">
            <AlertTriangle className="h-16 w-16 text-yellow-600 mx-auto mb-4" />
            <h2 className="text-2xl font-bold text-gray-900 mb-2">Child Not Found</h2>
            <p className="text-gray-600 mb-4">
              The child profile you're looking for doesn't exist or you don't have permission to view it.
            </p>
            <Button onClick={() => navigate('/children')}>
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back to Children
            </Button>
          </CardContent>
        </Card>
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
              <BreadcrumbPage>{child.name}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <div className="flex items-start justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">{child.name}</h1>

            </div>
            <div className="flex gap-3">
              <Button variant="outline" onClick={() => navigate(`/children/${id}/edit`)}>
                <Settings className="h-4 w-4 mr-2" />
                Edit Profile
              </Button>
              <Button variant="outline" onClick={() => navigate(`/children/${id}/report`)}>
                <BarChart3 className="h-4 w-4 mr-2" />
                View Report
              </Button>
              <Button 
                className="bg-gray-900 text-white hover:bg-gray-700"
                onClick={() => navigate('/child/check-in/wheel')}
              >
                <Activity className="h-4 w-4 mr-2" />
                Check In
              </Button>
            </div>
          </div>
        </div>

        {/* Demo data warning removed for wireframe experience */}

        {/* Main Content */}
        <div className="space-y-6">
          {/* About Me */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <BookOpen className="h-5 w-5" />
                About {child.name}
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="space-y-6">
                {child.aboutMe.favourites.length > 0 && (
                  <div>
                    <h4 className="font-medium mb-2">Favourite Things</h4>
                    <div className="flex flex-wrap gap-2">
                      {child.aboutMe.favourites.map((favourite, index) => (
                        <Badge key={index} variant="outline" className="bg-gray-100 text-gray-800 border-gray-200">
                          {favourite}
                        </Badge>
                      ))}
                    </div>
                  </div>
                )}
                
                {child.aboutMe.notes && (
                  <div>
                    <h4 className="font-medium mb-2">Notes</h4>
                    <p className="text-gray-600">{child.aboutMe.notes}</p>
                  </div>
                )}
              </div>

              <div>
                <h4 className="font-medium mb-3 flex items-center gap-2">
                  <Key className="h-4 w-4" />
                  Login Credentials
                </h4>
                <div className="bg-gray-50 border border-gray-200 rounded-lg p-4">
                  <div className="grid md:grid-cols-2 gap-4 mb-3">
                    <div className="bg-white p-3 rounded border">
                      <div className="flex items-center justify-between mb-1">
                        <label className="text-sm font-medium text-gray-700">Username</label>
                        <button 
                          onClick={() => handleCopy(child.credentials.username, 'username')}
                          className="text-xs text-gray-500 hover:text-gray-700 flex items-center gap-1"
                        >
                          {copiedItem === 'username' ? (
                            <>
                              <CheckCircle className="h-3 w-3" />
                              Copied!
                            </>
                          ) : (
                            <>
                              <Copy className="h-3 w-3" />
                              Copy
                            </>
                          )}
                        </button>
                      </div>
                      <p className="font-mono text-gray-900">{child.credentials.username}</p>
                    </div>
                    <div className="bg-white p-3 rounded border">
                      <div className="flex items-center justify-between mb-1">
                        <label className="text-sm font-medium text-gray-700">4-Digit PIN</label>
                        <button 
                          onClick={() => handleCopy(child.credentials.pin, 'pin')}
                          className="text-xs text-gray-500 hover:text-gray-700 flex items-center gap-1"
                        >
                          {copiedItem === 'pin' ? (
                            <>
                              <CheckCircle className="h-3 w-3" />
                              Copied!
                            </>
                          ) : (
                            <>
                              <Copy className="h-3 w-3" />
                              Copy
                            </>
                          )}
                        </button>
                      </div>
                      <p className="font-mono text-gray-900">{child.credentials.pin}</p>
                    </div>
                  </div>

                </div>
              </div>
            </CardContent>
          </Card>

          {/* Check-in History */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <CardTitle className="flex items-center gap-2">
                  <BarChart3 className="h-5 w-5" />
                  Check-in History
                </CardTitle>

              </div>
            </CardHeader>
            <CardContent>
              {/* Filters */}
              <div className="mb-6 space-y-4">
                <div className="flex items-center gap-2 mb-3">
                  <Filter className="h-4 w-4 text-gray-600" />
                  <span className="text-sm font-medium text-gray-700">Filters</span>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div className="space-y-2">
                    <label className="text-sm font-medium text-gray-700">From Date</label>
                    <Popover>
                      <PopoverTrigger asChild>
                        <Button
                          variant="outline"
                          className="w-full justify-start text-left font-normal"
                        >
                          <CalendarIcon className="mr-2 h-4 w-4" />
                          {formatDisplayDate(getDateFromString(dateFromFilter))}
                        </Button>
                      </PopoverTrigger>
                      <PopoverContent className="w-auto p-0" align="start">
                        <CalendarComponent
                          mode="single"
                          selected={getDateFromString(dateFromFilter)}
                          onSelect={handleFromDateSelect}
                          disabled={(date) =>
                            date > new Date() || date < new Date('1900-01-01')
                          }
                        />
                      </PopoverContent>
                    </Popover>
                  </div>
                  
                  <div className="space-y-2">
                    <label className="text-sm font-medium text-gray-700">To Date</label>
                    <Popover>
                      <PopoverTrigger asChild>
                        <Button
                          variant="outline"
                          className="w-full justify-start text-left font-normal"
                        >
                          <CalendarIcon className="mr-2 h-4 w-4" />
                          {formatDisplayDate(getDateFromString(dateToFilter))}
                        </Button>
                      </PopoverTrigger>
                      <PopoverContent className="w-auto p-0" align="start">
                        <CalendarComponent
                          mode="single"
                          selected={getDateFromString(dateToFilter)}
                          onSelect={handleToDateSelect}
                          disabled={(date) =>
                            date > new Date() || date < new Date('1900-01-01')
                          }
                        />
                      </PopoverContent>
                    </Popover>
                  </div>
                  
                  <div className="space-y-2">
                    <label className="text-sm font-medium text-gray-700">Status</label>
                    <Select 
                      value={checkInStatusFilter} 
                      onValueChange={(value) => {
                        setCheckInStatusFilter(value)
                        handleFilterChange()
                      }}
                    >
                      <SelectTrigger>
                        <SelectValue placeholder="All" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="all">All</SelectItem>
                        <SelectItem value="fine">Fine</SelectItem>
                        <SelectItem value="needs_attention">Needs Attention</SelectItem>
                        <SelectItem value="flagged">Flagged</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                </div>
              </div>

              {getFilteredCheckIns().length === 0 ? (
                <div className="text-center py-8">
                  <Activity className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                  <h3 className="text-lg font-medium text-gray-900 mb-2">No check-ins found</h3>
                  <p className="text-gray-600">Try adjusting your filters to see more results.</p>
                </div>
              ) : (
                <>
                  <div className="space-y-4 mb-6">
                    {getPaginatedCheckIns().map((checkIn) => (
                      <div key={checkIn.id} className="border rounded-lg p-4">
                        <div className="mb-4 flex items-center justify-between">
                          <h4 className="font-medium">{formatDate(checkIn.createdAt)}</h4>
                          {getCheckInStatusBadge(checkIn.status)}
                        </div>

                        <div className="space-y-6">
                          {/* Starting Mood */}
                          <div>
                            <h5 className="font-medium mb-3">Starting Mood</h5>
                            <div className="flex items-center justify-start">
                              <div className="relative w-16 h-16">
                                <svg className="w-16 h-16 transform -rotate-90" viewBox="0 0 36 36">
                                  <path
                                    className="text-gray-200"
                                    stroke="currentColor"
                                    strokeWidth="3"
                                    fill="none"
                                    d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                  />
                                  <path
                                    className="text-gray-600"
                                    stroke="currentColor"
                                    strokeWidth="3"
                                    strokeLinecap="round"
                                    fill="none"
                                    strokeDasharray={`${checkIn.startingMood * 20}, 100`}
                                    d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                  />
                                </svg>
                                <div className="absolute inset-0 flex items-center justify-center">
                                  <div className="text-center">
                                    <div className="text-sm font-medium text-gray-900">{(checkIn.startingMood / 5 * 100).toFixed(0)}%</div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          {/* Wellbeing Wheel */}
                          <div>
                            <h5 className="font-medium mb-3">Wellbeing Wheel</h5>
                            <div className="space-y-2">
                              {Object.entries(checkIn.wheel).map(([emotion, score]) => (
                                <div key={emotion} className="flex items-center gap-3">
                                  <span className="text-sm font-medium capitalize w-20">{emotion}</span>
                                  <div className="flex-1">
                                    <Progress value={score * 20} className="h-2" />
                                  </div>
                                  <span className="text-sm text-gray-600 w-8">{score}/5</span>
                                </div>
                              ))}
                            </div>
                          </div>

                          {/* Ending Mood */}
                          <div>
                            <h5 className="font-medium mb-3">Ending Mood</h5>
                            <div className="flex items-center justify-start">
                              <div className="relative w-16 h-16">
                                <svg className="w-16 h-16 transform -rotate-90" viewBox="0 0 36 36">
                                  <path
                                    className="text-gray-200"
                                    stroke="currentColor"
                                    strokeWidth="3"
                                    fill="none"
                                    d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                  />
                                  <path
                                    className="text-gray-600"
                                    stroke="currentColor"
                                    strokeWidth="3"
                                    strokeLinecap="round"
                                    fill="none"
                                    strokeDasharray={`${checkIn.wrapUpMood * 20}, 100`}
                                    d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                  />
                                </svg>
                                <div className="absolute inset-0 flex items-center justify-center">
                                  <div className="text-center">
                                    <div className="text-sm font-medium text-gray-900">{(checkIn.wrapUpMood / 5 * 100).toFixed(0)}%</div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>

                  {/* Pagination */}
                  {getTotalPages() > 1 && (
                    <div className="flex justify-center">
                      <Pagination>
                        <PaginationContent>
                          <PaginationItem>
                            <PaginationPrevious 
                              onClick={() => setCurrentPage(Math.max(1, currentPage - 1))}
                              className={currentPage === 1 ? 'pointer-events-none opacity-50' : 'cursor-pointer'}
                            />
                          </PaginationItem>
                          
                          {Array.from({ length: getTotalPages() }, (_, i) => i + 1).map((page) => (
                            <PaginationItem key={page}>
                              <PaginationLink
                                onClick={() => setCurrentPage(page)}
                                isActive={currentPage === page}
                                className="cursor-pointer"
                              >
                                {page}
                              </PaginationLink>
                            </PaginationItem>
                          ))}
                          
                          <PaginationItem>
                            <PaginationNext 
                              onClick={() => setCurrentPage(Math.min(getTotalPages(), currentPage + 1))}
                              className={currentPage === getTotalPages() ? 'pointer-events-none opacity-50' : 'cursor-pointer'}
                            />
                          </PaginationItem>
                        </PaginationContent>
                      </Pagination>
                    </div>
                  )}
                </>
              )}
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}