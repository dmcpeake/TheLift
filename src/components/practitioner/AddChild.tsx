import React, { useState, useContext, useEffect, useCallback } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { AuthContext } from '../../App'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Alert, AlertDescription } from '../ui/alert'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { PinInput } from '../shared/PinInput'
import { 
  UserPlus, 
  CheckCircle, 
  AlertCircle,
  Key,
  FileText,
  Sparkles,
  Users
} from 'lucide-react'

interface Practitioner {
  id: string
  name: string
  email: string
  status: 'active' | 'pending'
  childrenCount: number
}

export function AddChild() {
  const { user, currentMode } = useContext(AuthContext)
  const navigate = useNavigate()
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)
  const [error, setError] = useState('')
  const [credentialsRegenerated, setCredentialsRegenerated] = useState(false)
  const [practitioners, setPractitioners] = useState<Practitioner[]>([])
  const [selectedPractitioner, setSelectedPractitioner] = useState<string>('')

  const [formData, setFormData] = useState({
    name: '',
    aboutMe: {
      favourites: [] as string[],
      notes: ''
    }
  })

  const [credentials, setCredentials] = useState({
    username: '',
    pin: ''
  })

  const isGroupContact = user?.profile.role === 'GroupContact'
  const isAdminMode = isGroupContact && currentMode === 'admin'

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target
    if (name === 'notes') {
      setFormData(prev => ({
        ...prev,
        aboutMe: { ...prev.aboutMe, notes: value }
      }))
    } else {
      setFormData(prev => ({ ...prev, [name]: value }))
    }
  }

  const handleCredentialsChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target
    setCredentials(prev => ({ ...prev, [name]: value }))
  }

  const handlePinChange = useCallback((pin: string) => {
    setCredentials(prev => ({ ...prev, pin }))
  }, [])

  const generateCredentials = () => {
    const animals = ['bear', 'fox', 'owl', 'cat', 'dog', 'bird', 'fish', 'star']
    
    // Extract first name from full name, fallback to 'child' if no name entered yet
    const firstName = formData.name.trim().split(' ')[0].toLowerCase() || 'child'
    const animal = animals[Math.floor(Math.random() * animals.length)]
    const number = Math.floor(Math.random() * 99) + 1
    
    const username = `${firstName}${animal}${number}`
    const pin = Math.floor(1000 + Math.random() * 9000).toString()
    
    setCredentials({ username, pin })
  }

  // Fetch practitioners when in admin mode
  useEffect(() => {
    if (isAdminMode) {
      // Demo practitioners data - same as used in PractitionerDashboard
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
          childrenCount: 12
        },
        {
          id: 'pract-4',
          name: 'David Brown',
          email: 'david.brown@demoschool.com',
          status: 'active',
          childrenCount: 5
        }
      ])
    }
  }, [isAdminMode])

  // Generate credentials when name is provided
  useEffect(() => {
    // Only generate credentials if name is filled
    if (formData.name) {
      const firstName = formData.name.trim().split(' ')[0].toLowerCase()
      // Only regenerate if username doesn't start with the current first name
      if (!credentials.username.startsWith(firstName)) {
        generateCredentials()
      }
    }
  }, [formData.name])

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')
    setCredentialsRegenerated(false)

    try {
      const { data: { session } } = await user ? 
        (await import('../../utils/supabase/client')).getSupabaseClient().auth.getSession() :
        { data: { session: null } }

      if (!session?.access_token) {
        setError('No valid session found')
        return
      }

      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/children`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name: formData.name,
          aboutMe: formData.aboutMe,
          credentialsMode: 'slip',
          credentials: credentials,
          practitionerId: selectedPractitioner === 'unassigned' || !selectedPractitioner ? null : selectedPractitioner
        })
      })

      if (response.ok) {
        const data = await response.json()
        // Update credentials with the server-validated ones
        if (data.credentials) {
          // Check if credentials were changed by the server
          const originalUsername = credentials.username
          if (data.credentials.username !== originalUsername) {
            setCredentialsRegenerated(true)
          }
          setCredentials(data.credentials)
        }
        setSuccess(true)
        setTimeout(() => {
          navigate('/dashboard')
        }, 3000)
      } else {
        const errorData = await response.json()
        setError(errorData.error || 'Failed to add child')
      }
    } catch (error) {
      console.error('Error adding child:', error)
    } finally {
      setLoading(false)
    }
  }

  const canSubmit = formData.name && credentials.username && credentials.pin

  if (success) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <Card className="w-full max-w-md">
          <CardContent className="pt-6">
            <div className="text-center">
              <CheckCircle className="h-16 w-16 text-green-600 mx-auto mb-4" />
              <h2 className="text-2xl font-bold text-gray-900 mb-2">Child Added Successfully!</h2>
              <p className="text-gray-600 mb-4">
                {formData.name} has been registered successfully.
              </p>
              <div className="bg-gray-50 p-4 rounded-lg mb-4">
                <h3 className="font-medium text-gray-900 mb-2">Login Credentials</h3>
                <p className="text-sm text-gray-700">
                  <strong>Username:</strong> {credentials.username}
                </p>
                <div className="text-sm text-gray-700">
                  <strong>4-Digit PIN:</strong>
                  <div className="mt-1">
                    <PinInput
                      value={credentials.pin}
                      onChange={() => {}} // Read-only in success view
                      disabled={true}
                    />
                  </div>
                </div>
              </div>
              <p className="text-sm text-gray-500">
                Redirecting to dashboard...
              </p>
            </div>
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
              <BreadcrumbPage>Add New Child</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Add New Child</h1>
        </div>

        {error && (
          <Alert className="mb-6 border-red-200 bg-red-50">
            <AlertCircle className="h-4 w-4 text-red-600" />
            <AlertDescription className="text-red-800">{error}</AlertDescription>
          </Alert>
        )}

        <form onSubmit={handleSubmit} className="space-y-8">
          {/* Basic Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <UserPlus className="h-5 w-5" />
                Child Information
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="name">Child's Name *</Label>
                <Input
                  id="name"
                  name="name"
                  value={formData.name}
                  onChange={handleInputChange}
                  placeholder="e.g., Emma Thompson"
                  required
                />
              </div>

              {/* Practitioner Assignment - Admin Mode Only */}
              {isAdminMode && formData.name && (
                <div className="space-y-2 transition-all duration-300 ease-in-out">
                  <Label htmlFor="practitioner">Assign to Practitioner (Optional)</Label>
                  <Select value={selectedPractitioner} onValueChange={setSelectedPractitioner}>
                    <SelectTrigger>
                      <SelectValue placeholder="Leave unassigned or select practitioner" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="unassigned">
                        <div className="flex items-center gap-2">
                          <Users className="h-4 w-4 text-gray-400" />
                          Unassigned
                        </div>
                      </SelectItem>
                      {practitioners
                        .filter(p => p.status === 'active')
                        .map((practitioner) => (
                        <SelectItem key={practitioner.id} value={practitioner.id}>
                          <div className="flex items-center justify-between w-full">
                            <span>{practitioner.name}</span>
                            <span className="text-sm text-gray-500 ml-2">
                              {practitioner.childrenCount} children
                            </span>
                          </div>
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
              )}
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
                    Generated Credentials
                  </h3>
                  <div className="space-y-3">
                    <div className="bg-white p-3 rounded border">
                      <div className="flex items-center justify-between mb-1">
                        <Label className="text-sm font-medium text-gray-700">Username</Label>
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
                        value={credentials.username}
                        onChange={handleCredentialsChange}
                        name="username"
                        className="font-mono text-gray-900 bg-white border-gray-300"
                        placeholder="Enter username"
                        required
                      />
                    </div>
                    <div className="bg-white p-3 rounded border">
                      <Label className="text-sm font-medium text-gray-700">4-Digit PIN</Label>
                      <div className="mt-2">
                        <PinInput
                          value={credentials.pin}
                          onChange={handlePinChange}
                          placeholder="1234"
                        />
                      </div>
                    </div>
                  </div>
                </div>



                {credentialsRegenerated && (
                  <Alert className="border-yellow-200 bg-yellow-50">
                    <AlertCircle className="h-4 w-4 text-yellow-600" />
                    <AlertDescription className="text-yellow-800">
                      The username was already taken, so new credentials were generated automatically.
                    </AlertDescription>
                  </Alert>
                )}
              </CardContent>
            </Card>
          )}

          <div className="flex justify-end">
            <Button 
              type="submit" 
              disabled={loading || !canSubmit}
            >
              {loading ? 'Adding Child...' : 'Add Child'}
            </Button>
          </div>
        </form>
      </div>
    </div>
  )
}