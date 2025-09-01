import React, { useState, useContext } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { AuthContext } from '../../App'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Textarea } from '../ui/textarea'
import { Alert, AlertDescription } from '../ui/alert'
import { Badge } from '../ui/badge'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { 
  ArrowLeft, 
  UserPlus, 
  Mail, 
  CheckCircle, 
  AlertCircle,
  Send,
  Users,
  Shield,
  Clock
} from 'lucide-react'
import { RadioGroup, RadioGroupItem } from '../ui/radio-group'

export function InvitePractitioner() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)
  const [error, setError] = useState('')

  const [formData, setFormData] = useState({
    email: '',
    name: '',
    role: 'Practitioner', // Default to Practitioner
    message: ''
  })

  const [sentInvites, setSentInvites] = useState<Array<{
    email: string
    name: string
    role: string
    sentAt: string
  }>>([])

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target
    setFormData(prev => ({
      ...prev,
      [name]: value
    }))
  }

  const handleRoleChange = (value: string) => {
    setFormData(prev => ({
      ...prev,
      role: value
    }))
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')

    try {
      // For now, we'll simulate the invitation process since email functionality
      // would require additional email service setup
      
      // Simulate API call delay
      await new Promise(resolve => setTimeout(resolve, 1500))

      // Add to sent invites list
      const newInvite = {
        email: formData.email,
        name: formData.name,
        role: formData.role,
        sentAt: new Date().toISOString()
      }

      setSentInvites(prev => [newInvite, ...prev])

      // Reset form
      setFormData({
        email: '',
        name: '',
        role: 'Practitioner',
        message: ''
      })

      setSuccess(true)
      setTimeout(() => setSuccess(false), 5000)

    } catch (error) {
      console.error('Error sending invitation:', error)
      setError('Failed to send invitation. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const getRoleBadge = (role: string) => {
    switch (role) {
      case 'Practitioner':
        return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Practitioner</Badge>
      case 'GroupContact':
        return <Badge className="bg-gray-200 text-gray-800 border-gray-300">Group Admin</Badge>
      default:
        return <Badge variant="outline">{role}</Badge>
    }
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })
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
              <BreadcrumbPage>Invite Practitioner</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Invite Practitioner</h1>
        </div>

        <div>
          {/* Invitation Form */}
          <div>
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <UserPlus className="h-5 w-5" />
                  Send Invitation
                </CardTitle>

              </CardHeader>
              <CardContent>
                {success && (
                  <Alert className="mb-6 border-green-200 bg-green-50">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    <AlertDescription className="text-green-800">
                      Invitation sent successfully!
                    </AlertDescription>
                  </Alert>
                )}

                {error && (
                  <Alert className="mb-6 border-red-200 bg-red-50">
                    <AlertCircle className="h-4 w-4 text-red-600" />
                    <AlertDescription className="text-red-800">{error}</AlertDescription>
                  </Alert>
                )}

                <form onSubmit={handleSubmit} className="space-y-6">
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="email">Email Address *</Label>
                      <Input
                        id="email"
                        name="email"
                        type="email"
                        value={formData.email}
                        onChange={handleInputChange}
                        placeholder="practitioner@example.com"
                        required
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="name">Full Name *</Label>
                      <Input
                        id="name"
                        name="name"
                        value={formData.name}
                        onChange={handleInputChange}
                        placeholder="Dr. Sarah Johnson"
                        required
                      />
                    </div>
                  </div>

                  <div className="space-y-3">
                    <Label>Access Level *</Label>
                    <RadioGroup 
                      value={formData.role} 
                      onValueChange={handleRoleChange}
                      className="grid grid-cols-1 md:grid-cols-2 gap-3"
                    >
                      <div className="relative">
                        <RadioGroupItem value="Practitioner" id="practitioner" className="sr-only" />
                        <Label 
                          htmlFor="practitioner" 
                          className={`cursor-pointer block p-4 border-2 rounded-lg transition-all ${
                            formData.role === 'Practitioner' 
                              ? 'border-gray-900 bg-gray-50' 
                              : 'border-gray-200 bg-white hover:border-gray-300'
                          }`}
                        >
                          <div className="flex items-start gap-3">
                            <Users className="h-5 w-5 text-gray-600 mt-0.5" />
                            <div>
                              <div className="font-medium text-gray-900">Practitioner</div>
                              <div className="text-sm text-gray-500 mt-1">Default access</div>
                            </div>
                          </div>
                        </Label>
                      </div>
                      
                      <div className="relative">
                        <RadioGroupItem value="GroupContact" id="groupcontact" className="sr-only" />
                        <Label 
                          htmlFor="groupcontact" 
                          className={`cursor-pointer block p-4 border-2 rounded-lg transition-all ${
                            formData.role === 'GroupContact' 
                              ? 'border-gray-900 bg-gray-50' 
                              : 'border-gray-200 bg-white hover:border-gray-300'
                          }`}
                        >
                          <div className="flex items-start gap-3">
                            <Shield className="h-5 w-5 text-gray-600 mt-0.5" />
                            <div>
                              <div className="font-medium text-gray-900">Group Admin</div>
                              <div className="text-sm text-gray-500 mt-1">Group admin access</div>
                            </div>
                          </div>
                        </Label>
                      </div>
                    </RadioGroup>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="message">Personal Message (Optional)</Label>
                    <Textarea
                      id="message"
                      name="message"
                      value={formData.message}
                      onChange={handleInputChange}
                      placeholder="Hi! I'd like to invite you to join our team on The Lift platform to help support our children's wellbeing..."
                      rows={4}
                    />

                  </div>

                  <Button type="submit" disabled={loading} className="w-full">
                    {loading ? (
                      <>
                        <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
                        Sending Invitation...
                      </>
                    ) : (
                      <>
                        <Send className="h-4 w-4 mr-2" />
                        Send Invitation
                      </>
                    )}
                  </Button>
                </form>
              </CardContent>
            </Card>
          </div>
        </div>


      </div>
    </div>
  )
}