import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../App'
import { getSupabaseClient } from '../../utils/supabase/client'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Alert, AlertDescription } from '../ui/alert'
import { Calendar } from '../ui/calendar'
import { Popover, PopoverContent, PopoverTrigger } from '../ui/popover'
import { RadioGroup, RadioGroupItem } from '../ui/radio-group'
import { ArrowLeft, CheckCircle, AlertCircle, CalendarIcon, Users, User } from 'lucide-react'
import { format } from 'date-fns'

export function CreateClient() {
  const { user } = useContext(AuthContext)
  const navigate = useNavigate()
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)
  const [error, setError] = useState('')

  const [formData, setFormData] = useState({
    name: '',
    contactEmail: '',
    contactName: '',
    seatsTotal: '',
    phone: '',
    accountType: 'group_admin'
  })
  
  const [contractEndDate, setContractEndDate] = useState<Date | undefined>()

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target
    setFormData(prev => ({
      ...prev,
      [name]: value
    }))
  }

  const handleAccountTypeChange = (value: string) => {
    setFormData(prev => ({
      ...prev,
      accountType: value
    }))
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')

    try {
      const supabase = getSupabaseClient()
      const { data: { session }, error: sessionError } = await supabase.auth.getSession()

      if (sessionError || !session?.access_token) {
        setError('No valid session found')
        setLoading(false)
        return
      }

      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/admin/clients`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name: formData.name,
          contactEmail: formData.contactEmail,
          contactName: formData.contactName,
          seatsTotal: formData.seatsTotal,
          contractEnd: contractEndDate ? format(contractEndDate, 'yyyy-MM-dd') : '',
          phone: formData.phone,
          accountType: formData.accountType
        })
      })

      if (response.ok) {
        setSuccess(true)
        setTimeout(() => {
          navigate('/admin')
        }, 2000)
      } else {
        const errorData = await response.json()
        setError(errorData.error || 'Failed to create client')
      }
    } catch (error) {
      console.error('Error creating client:', error)
      setError('Failed to connect to server')
    } finally {
      setLoading(false)
    }
  }

  if (success) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <Card className="w-full max-w-md">
          <CardContent className="pt-6">
            <div className="text-center">
              <CheckCircle className="h-16 w-16 text-green-600 mx-auto mb-4" />
              <h2 className="text-2xl font-bold text-gray-900 mb-2">Client Created!</h2>
              <p className="text-gray-600 mb-4">
                {formData.name} has been successfully set up on The Lift platform.
              </p>
              <p className="text-sm text-gray-500">
                Redirecting to admin dashboard...
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
        {/* Header */}
        <div className="mb-8">
          <Button 
            variant="outline" 
            onClick={() => navigate('/admin')}
            className="mb-4"
          >
            <ArrowLeft className="h-4 w-4 mr-2" />
            Back to Dashboard
          </Button>
          <h1 className="text-3xl font-bold text-gray-900">Create New Client</h1>
          <p className="text-gray-600 mt-2">
            Set up a new client with seat allocation and contract management.
          </p>
        </div>

        {error && (
          <Alert className="mb-6 border-red-200 bg-red-50">
            <AlertCircle className="h-4 w-4 text-red-600" />
            <AlertDescription className="text-red-800">{error}</AlertDescription>
          </Alert>
        )}

        <form onSubmit={handleSubmit} className="space-y-8">
          {/* Client Details */}
          <Card>
            <CardHeader>
              <CardTitle>
                Client Details
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="name">Client Name *</Label>
                  <Input
                    id="name"
                    name="name"
                    value={formData.name}
                    onChange={handleInputChange}
                    placeholder="e.g., Sunshine Elementary School"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="contactName">Primary Contact Name *</Label>
                  <Input
                    id="contactName"
                    name="contactName"
                    value={formData.contactName}
                    onChange={handleInputChange}
                    placeholder="e.g., Sarah Johnson"
                    required
                  />
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="contactEmail">Contact Email *</Label>
                  <Input
                    id="contactEmail"
                    name="contactEmail"
                    type="email"
                    value={formData.contactEmail}
                    onChange={handleInputChange}
                    placeholder="contact"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="phone">Phone Number</Label>
                  <Input
                    id="phone"
                    name="phone"
                    value={formData.phone}
                    onChange={handleInputChange}
                    placeholder="01234 567890"
                  />
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Account Type */}
          <Card>
            <CardHeader>
              <CardTitle>
                Account Type
              </CardTitle>
              <CardDescription>
                Choose the type of account that best describes this client
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <RadioGroup 
                value={formData.accountType} 
                onValueChange={handleAccountTypeChange}
              >
                <div className="flex items-center space-x-2 p-4 border border-gray-200 rounded-lg">
                  <RadioGroupItem value="group_admin" id="group_admin" />
                  <div className="flex items-center space-x-3 flex-1">
                    <div className="w-10 h-10 bg-gray-100 rounded-lg flex items-center justify-center">
                      <Users className="h-5 w-5 text-gray-700" />
                    </div>
                    <div>
                      <Label htmlFor="group_admin" className="cursor-pointer">Group Admin</Label>
                      <p className="text-sm text-gray-500 mt-1">
                        For schools, clinics or organisations managing multiple practitioners and children
                      </p>
                    </div>
                  </div>
                </div>
                
                <div className="flex items-center space-x-2 p-4 border border-gray-200 rounded-lg">
                  <RadioGroupItem value="practitioner" id="practitioner" />
                  <div className="flex items-center space-x-3 flex-1">
                    <div className="w-10 h-10 bg-gray-100 rounded-lg flex items-center justify-center">
                      <User className="h-5 w-5 text-gray-700" />
                    </div>
                    <div>
                      <Label htmlFor="practitioner" className="cursor-pointer">Practitioner</Label>
                      <p className="text-sm text-gray-500 mt-1">
                        For individual practitioners working directly with assigned children
                      </p>
                    </div>
                  </div>
                </div>
              </RadioGroup>

              <div className="bg-gray-50 border border-gray-200 rounded-lg p-4">
                <div>
                  <h4 className="text-sm font-medium text-gray-900">Account Type Information</h4>
                  <p className="text-sm text-gray-700 mt-1">
                    <strong>Group Admin:</strong> Full management capabilities including practitioner management, 
                    bulk operations, and administrative oversight.<br />
                    <strong>Practitioner:</strong> Focused on direct child engagement with streamlined tools 
                    for managing assigned children.
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Contract & Seat Allocation */}
          <Card>
            <CardHeader>
              <CardTitle>
                Contract & Seat Allocation
              </CardTitle>
              <CardDescription>
                Configure seat limits and contract terms
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="seatsTotal">Total Seats Allocated *</Label>
                  <Input
                    id="seatsTotal"
                    name="seatsTotal"
                    type="number"
                    value={formData.seatsTotal}
                    onChange={handleInputChange}
                    placeholder="50"
                    min="1"
                    required
                  />
                  <p className="text-sm text-gray-500">
                    Maximum number of children that can be registered
                  </p>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="contractEnd">Contract End Date *</Label>
                  <Popover>
                    <PopoverTrigger asChild>
                      <Button
                        variant="outline"
                        className="w-full justify-start text-left font-normal"
                      >
                        <CalendarIcon className="mr-2 h-4 w-4" />
                        {contractEndDate ? format(contractEndDate, 'PPP') : 'Select date'}
                      </Button>
                    </PopoverTrigger>
                    <PopoverContent className="w-auto p-0" align="start">
                      <Calendar
                        mode="single"
                        selected={contractEndDate}
                        onSelect={setContractEndDate}
                        disabled={(date) => date < new Date()}
                        initialFocus
                      />
                    </PopoverContent>
                  </Popover>
                  <p className="text-sm text-gray-500">
                    When the client's access expires
                  </p>
                </div>
              </div>

              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <div>
                  <h4 className="text-sm font-medium text-blue-900">Contract Information</h4>
                  <p className="text-sm text-blue-700 mt-1">
                    The contract will start immediately upon creation. The client will have 
                    full access to The Lift platform until the specified end date. Seat usage is 
                    tracked for billing purposes.
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-end space-x-4">
            <Button 
              type="button" 
              variant="outline" 
              onClick={() => navigate('/admin')}
            >
              Cancel
            </Button>
            <Button type="submit" disabled={loading || !contractEndDate}>
              {loading ? 'Creating...' : 'Create Client'}
            </Button>
          </div>
        </form>
      </div>
    </div>
  )
}