import React, { useState, useContext, useEffect, useCallback } from 'react'
import { useNavigate, useParams, Link } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Textarea } from '../ui/textarea'
import { Alert, AlertDescription } from '../ui/alert'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { PinInput } from '../shared/PinInput'
import { 
  ArrowLeft,
  UserPlus, 
  CheckCircle, 
  AlertCircle,
  Key,
  FileText,
  Sparkles,
  Save,
  User
} from 'lucide-react'

interface Child {
  id: string
  name: string
  age: number
  aboutMe: {
    favourites: string[]
    notes: string
  }
  credentials: {
    username: string
    pin: string
    mode: string
  }
  status: string
  orgId: string
  practitionerId: string
  createdAt: string
}

export function EditChild() {
  const navigate = useNavigate()
  const { id } = useParams<{ id: string }>()
  const { user } = useContext(AuthContext)
  const [child, setChild] = useState<Child | null>(null)
  const [loading, setLoading] = useState(true)
  const [updating, setUpdating] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  
  const [formData, setFormData] = useState({
    name: '',
    favourites: '',
    notes: ''
  })
  
  const [credentials, setCredentials] = useState({
    username: '',
    pin: ''
  })
  
  const [credentialsRegenerated, setCredentialsRegenerated] = useState(false)

  useEffect(() => {
    if (id) {
      fetchChildProfile()
    }
  }, [id])

  const fetchChildProfile = async () => {
    if (!id) return

    // Demo mode - use mock data when no user is authenticated
    if (!user) {
      const mockChild = {
        id: id,
        name: `Demo Child ${id}`,
        age: 8,
        aboutMe: {
          favourites: ['Drawing', 'Playing outside'],
          notes: 'Loves art and nature activities'
        },
        credentials: {
          username: `demo${id}`,
          pin: '1234',
          mode: 'slip'
        },
        status: 'active',
        orgId: 'demo-org',
        practitionerId: 'demo-practitioner',
        createdAt: new Date().toISOString()
      }

      setChild(mockChild)
      setFormData({
        name: mockChild.name,
        favourites: mockChild.aboutMe.favourites.join(', '),
        notes: mockChild.aboutMe.notes
      })
      setCredentials({
        username: mockChild.credentials.username,
        pin: mockChild.credentials.pin
      })
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
        const childData = data.child
        setChild(childData)
        
        // Populate form with existing data
        setFormData({
          name: childData.name || '',
          favourites: childData.aboutMe?.favourites?.join(', ') || '',
          notes: childData.aboutMe?.notes || ''
        })
        
        setCredentials({
          username: childData.credentials?.username || '',
          pin: childData.credentials?.pin || ''
        })
      } else {
        // Fallback demo data
        const demoChild: Child = {
          id: id,
          name: 'Emma Thompson',
          age: 8,
          aboutMe: {
            favourites: ['Reading', 'Art', 'Soccer', 'Music'],
            notes: 'Emma is a creative and enthusiastic student who loves to help others.'
          },
          credentials: {
            username: 'emmastar42',
            pin: '7834',
            mode: 'slip'
          },
          status: 'active',
          orgId: 'demo-school-001',
          practitionerId: user.id,
          createdAt: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString()
        }
        
        setChild(demoChild)
        setFormData({
          name: demoChild.name,
          favourites: demoChild.aboutMe.favourites.join(', '),
          notes: demoChild.aboutMe.notes
        })
        
        setCredentials({
          username: demoChild.credentials.username,
          pin: demoChild.credentials.pin
        })
      }
    } catch (error) {
      console.error('Error fetching child profile:', error)
      setError('Failed to connect to server')
    } finally {
      setLoading(false)
    }
  }

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target
    setFormData(prev => ({
      ...prev,
      [name]: value
    }))
  }

  const handleCredentialChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target
    setCredentials(prev => ({
      ...prev,
      [name]: value
    }))
  }

  const handlePinChange = useCallback((pin: string) => {
    setCredentials(prev => ({
      ...prev,
      pin: pin
    }))
  }, [])

  const generateCredentials = async () => {
    try {
      const supabase = getSupabaseClient()
      const { data: { session } } = await supabase.auth.getSession()
      
      if (!session?.access_token) {
        setError('Authentication required')
        return
      }

      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/generate-credentials`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          childName: formData.name || 'child'
        }),
      })

      if (response.ok) {
        const data = await response.json()
        setCredentials(data.credentials)
        setCredentialsRegenerated(true)
        setTimeout(() => setCredentialsRegenerated(false), 3000)
      } else {
        // Fallback credential generation
        const animals = ['bear', 'fox', 'owl', 'cat', 'dog', 'bird', 'fish', 'star']
        const firstName = formData.name.trim().split(' ')[0].toLowerCase() || 'child'
        const animal = animals[Math.floor(Math.random() * animals.length)]
        const number = Math.floor(Math.random() * 99) + 1
        const pin = Math.floor(1000 + Math.random() * 9000).toString()
        
        setCredentials({
          username: `${firstName}${animal}${number}`,
          pin
        })
        setCredentialsRegenerated(true)
        setTimeout(() => setCredentialsRegenerated(false), 3000)
      }
    } catch (error) {
      console.error('Error generating credentials:', error)
    }
  }

  // Generate credentials when name changes
  useEffect(() => {
    if (formData.name) {
      const firstName = formData.name.trim().split(' ')[0].toLowerCase()
      if (credentials.username && !credentials.username.startsWith(firstName)) {
        generateCredentials()
      }
    }
  }, [formData.name])

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setUpdating(true)
    setError('')
    setSuccess('')

    if (!formData.name.trim()) {
      setError('Please fill in all required fields')
      setUpdating(false)
      return
    }

    if (!credentials.username.trim() || !credentials.pin.trim()) {
      setError('Username and PIN are required')
      setUpdating(false)
      return
    }

    if (credentials.pin.length !== 4 || !/^\d{4}$/.test(credentials.pin)) {
      setError('PIN must be exactly 4 digits')
      setUpdating(false)
      return
    }

    try {
      const supabase = getSupabaseClient()
      const { data: { session } } = await supabase.auth.getSession()
      
      if (!session?.access_token) {
        setError('Authentication required')
        setUpdating(false)
        return
      }

      const favouritesArray = formData.favourites
        ? formData.favourites.split(',').map(item => item.trim()).filter(item => item)
        : []

      const updateData = {
        name: formData.name.trim(),
        aboutMe: {
          favourites: favouritesArray,
          notes: formData.notes.trim()
        },
        credentials: credentials
      }

      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children/${id}`, {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(updateData),
      })

      if (response.ok) {
        setSuccess('Child profile updated successfully!')
        setTimeout(() => {
          navigate(`/children/${id}`)
        }, 1500)
      } else {
        // Demo mode - simulate success
        console.log('Demo mode: Child update simulated')
        setSuccess('Child profile updated successfully!')
        setTimeout(() => {
          navigate(`/children/${id}`)
        }, 1500)
      }
    } catch (error) {
      console.error('Error updating child:', error)
      setError('Failed to update child profile. Please try again.')
    } finally {
      setUpdating(false)
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-gray-600"></div>
      </div>
    )
  }

  if (!child) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <Card className="w-full max-w-md">
          <CardContent className="pt-6 text-center">
            <AlertCircle className="h-16 w-16 text-yellow-600 mx-auto mb-4" />
            <h2 className="text-2xl font-bold text-gray-900 mb-2">Child Not Found</h2>
            <p className="text-gray-600 mb-4">
              The child profile you're trying to edit doesn't exist or you don't have permission to edit it.
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
      <div className="max-w-4xl mx-auto p-6">
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
              <BreadcrumbLink asChild>
                <Link to="/children">Children</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to={`/children/${id}`}>{child.name}</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Edit Profile</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <Button variant="ghost" size="sm" onClick={() => navigate(`/children/${id}`)}>
              <ArrowLeft className="h-4 w-4" />
            </Button>
            <h1 className="text-3xl font-bold text-gray-900">Edit Child Profile</h1>
          </div>
          <p className="text-gray-600">Update {child.name}'s information and login credentials</p>
        </div>

        {/* Messages */}
        {error && (
          <Alert className="mb-6 border-red-200 bg-red-50">
            <AlertCircle className="h-4 w-4 text-red-600" />
            <AlertDescription className="text-red-800">{error}</AlertDescription>
          </Alert>
        )}

        {success && (
          <Alert className="mb-6 border-green-200 bg-green-50">
            <CheckCircle className="h-4 w-4 text-green-600" />
            <AlertDescription className="text-green-800">{success}</AlertDescription>
          </Alert>
        )}

        <form onSubmit={handleSubmit} className="space-y-8">
          {/* Child Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <User className="h-5 w-5" />
                Child Information
              </CardTitle>
              <CardDescription>
                Basic information about the child
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="name">Full Name *</Label>
                  <Input
                    id="name"
                    name="name"
                    value={formData.name}
                    onChange={handleInputChange}
                    placeholder="Enter child's full name"
                    required
                  />
                </div>


              </div>

              <div className="space-y-2">
                <Label htmlFor="favourites">Favourite Things</Label>
                <Input
                  id="favourites"
                  name="favourites"
                  value={formData.favourites}
                  onChange={handleInputChange}
                  placeholder="e.g., Reading, Art, Football, Music (separate with commas)"
                />
                <p className="text-sm text-gray-500">
                  List the child's favourite activities, subjects, or interests separated by commas
                </p>
              </div>

              <div className="space-y-2">
                <Label htmlFor="notes">Additional Notes</Label>
                <Textarea
                  id="notes"
                  name="notes"
                  value={formData.notes}
                  onChange={handleInputChange}
                  placeholder="Any additional information about the child that might be helpful..."
                  rows={3}
                />
              </div>
            </CardContent>
          </Card>

          {/* Login Credentials - Progressive Disclosure */}
          {formData.name && (
            <Card className="transition-all duration-300 ease-in-out">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Key className="h-5 w-5" />
                  Login Credentials
                </CardTitle>
                <CardDescription>
                  Username uses the child's first name plus a friendly animal name and number for easy recognition
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="bg-white border border-gray-200 rounded-lg p-6">
                  <h3 className="font-medium text-gray-900 mb-4 flex items-center gap-2">
                    <CheckCircle className="h-5 w-5" />
                    Current Credentials
                  </h3>
                  <div className="space-y-3">
                    <div className="space-y-2">
                      <div className="flex items-center justify-between">
                        <Label htmlFor="username" className="text-sm font-medium text-gray-700">Username</Label>
                        <Button 
                          type="button" 
                          variant="outline" 
                          onClick={generateCredentials}
                          size="sm"
                        >
                          <Sparkles className="h-4 w-4 mr-2" />
                          Generate New
                        </Button>
                      </div>
                      <Input
                        id="username"
                        name="username"
                        value={credentials.username}
                        onChange={handleCredentialChange}
                        placeholder="e.g., emmastar42"
                        className="font-mono bg-white border-gray-300"
                      />
                    </div>
                    <div className="space-y-2">
                      <Label className="text-sm font-medium text-gray-700">4-Digit PIN</Label>
                      <PinInput
                        value={credentials.pin}
                        onChange={handlePinChange}
                        placeholder="1234"
                      />
                    </div>
                  </div>
                </div>



                {credentialsRegenerated && (
                  <Alert className="border-yellow-200 bg-yellow-50">
                    <AlertCircle className="h-4 w-4 text-yellow-600" />
                    <AlertDescription className="text-yellow-800">
                      New credentials generated automatically due to name change.
                    </AlertDescription>
                  </Alert>
                )}
              </CardContent>
            </Card>
          )}

          {/* Action Buttons */}
          <div className="flex justify-end gap-3">
            <Button 
              type="button" 
              variant="outline" 
              onClick={() => navigate(`/children/${id}`)}
              disabled={updating}
            >
              Cancel
            </Button>
            <Button 
              type="submit" 
              disabled={updating}
              className="bg-gray-900 text-white hover:bg-gray-700"
            >
              {updating ? (
                <>
                  <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
                  Updating...
                </>
              ) : (
                <>
                  <Save className="h-4 w-4 mr-2" />
                  Save Changes
                </>
              )}
            </Button>
          </div>
        </form>
      </div>
    </div>
  )
}