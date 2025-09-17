import React, { useState, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AuthContext } from '../../utils/auth/context'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Textarea } from '../ui/textarea'
import { Alert, AlertDescription } from '../ui/alert'
import { Badge } from '../ui/badge'
import { Switch } from '../ui/switch'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../ui/tabs'
import { 
  Settings as SettingsIcon, 
  User, 
  Building2, 
  Bell, 
  Shield, 
  Key,
  AlertCircle,
  CheckCircle,
  Mail,
  Phone,
  Calendar,
  Users
} from 'lucide-react'

export function Settings() {
  const { user, logout } = useContext(AuthContext)
  const navigate = useNavigate()
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState('')
  const [error, setError] = useState('')

  const [profileData, setProfileData] = useState({
    name: user?.profile.name || '',
    email: user?.email || '',
    phone: '',
    bio: ''
  })

  const [notifications, setNotifications] = useState({
    emailCheckIns: true,
    emailSafeguarding: true,
    emailWeekly: false,
    pushSafeguarding: true,
    pushCheckIns: false
  })

  const [clientInfo] = useState({
    name: 'Demo Elementary School',
    contactEmail: 'contact@demoschool.com',
    seatsTotal: 50,
    seatsUsed: 12,
    contractEnd: '2024-12-31',
    status: 'active'
  })

  const handleProfileChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target
    setProfileData(prev => ({ ...prev, [name]: value }))
  }

  const handleNotificationChange = (key: string, value: boolean) => {
    setNotifications(prev => ({ ...prev, [key]: value }))
  }

  const handleProfileSave = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')
    setSuccess('')

    try {
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 1000))
      setSuccess('Profile updated successfully!')
      setTimeout(() => setSuccess(''), 3000)
    } catch (error) {
      setError('Failed to update profile. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleNotificationSave = async () => {
    setLoading(true)
    setError('')
    setSuccess('')

    try {
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 1000))
      setSuccess('Notification preferences updated!')
      setTimeout(() => setSuccess(''), 3000)
    } catch (error) {
      setError('Failed to update notifications. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleLogout = async () => {
    await logout()
    navigate('/login')
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-6xl mx-auto p-6">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Settings</h1>
          <p className="text-gray-600 mt-2">
            Manage your account, preferences, and client settings.
          </p>
        </div>

        {(success || error) && (
          <Alert className={`mb-6 ${success ? 'border-green-200 bg-green-50' : 'border-red-200 bg-red-50'}`}>
            {success ? (
              <CheckCircle className="h-4 w-4 text-green-600" />
            ) : (
              <AlertCircle className="h-4 w-4 text-red-600" />
            )}
            <AlertDescription className={success ? 'text-green-800' : 'text-red-800'}>
              {success || error}
            </AlertDescription>
          </Alert>
        )}

        <Tabs defaultValue="profile" className="space-y-6">
          <TabsList className="grid w-full grid-cols-4">
            <TabsTrigger value="profile">Profile</TabsTrigger>
            <TabsTrigger value="notifications">Notifications</TabsTrigger>
            <TabsTrigger value="organization">Client</TabsTrigger>
            <TabsTrigger value="security">Security</TabsTrigger>
          </TabsList>

          {/* Profile Tab */}
          <TabsContent value="profile" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <User className="h-5 w-5" />
                  Profile Information
                </CardTitle>
                <CardDescription>
                  Update your personal information and preferences.
                </CardDescription>
              </CardHeader>
              <CardContent>
                <form onSubmit={handleProfileSave} className="space-y-6">
                  <div className="flex items-center gap-6 mb-6">
                    <div className="w-20 h-20 bg-gradient-to-r from-blue-400 to-purple-500 rounded-full flex items-center justify-center">
                      <span className="text-white text-2xl font-medium">
                        {user?.profile.name.charAt(0) || 'U'}
                      </span>
                    </div>
                    <div>
                      <h3 className="text-lg font-medium">{user?.profile.name}</h3>
                      <p className="text-gray-600">{user?.profile.role}</p>
                      <Badge className="mt-1 bg-green-100 text-green-800 border-green-200">
                        Active
                      </Badge>
                    </div>
                  </div>

                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div className="space-y-2">
                      <Label htmlFor="name">Full Name</Label>
                      <Input
                        id="name"
                        name="name"
                        value={profileData.name}
                        onChange={handleProfileChange}
                        placeholder="Your full name"
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="email">Email Address</Label>
                      <Input
                        id="email"
                        name="email"
                        type="email"
                        value={profileData.email}
                        onChange={handleProfileChange}
                        placeholder="your.email"
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="phone">Phone Number</Label>
                      <Input
                        id="phone"
                        name="phone"
                        value={profileData.phone}
                        onChange={handleProfileChange}
                        placeholder="+1 (555) 123-4567"
                      />
                    </div>
                    <div className="space-y-2">
                      <Label>Role</Label>
                      <Input
                        value={user?.profile.role || ''}
                        disabled
                        className="bg-gray-50"
                      />
                      <p className="text-sm text-gray-500">
                        Contact your administrator to change your role.
                      </p>
                    </div>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="bio">Bio (Optional)</Label>
                    <Textarea
                      id="bio"
                      name="bio"
                      value={profileData.bio}
                      onChange={handleProfileChange}
                      placeholder="Tell us a bit about yourself..."
                      rows={3}
                    />
                  </div>

                  <Button type="submit" disabled={loading}>
                    {loading ? 'Saving...' : 'Save Changes'}
                  </Button>
                </form>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Notifications Tab */}
          <TabsContent value="notifications" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Bell className="h-5 w-5" />
                  Notification Preferences
                </CardTitle>
                <CardDescription>
                  Choose how you want to be notified about important events.
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div>
                  <h4 className="font-medium mb-4">Email Notifications</h4>
                  <div className="space-y-4">
                    <div className="flex items-center justify-between">
                      <div>
                        <Label>Daily Check-in Summary</Label>
                        <p className="text-sm text-gray-600">
                          Receive a daily summary of children's check-ins
                        </p>
                      </div>
                      <Switch
                        checked={notifications.emailCheckIns}
                        onCheckedChange={(checked) => handleNotificationChange('emailCheckIns', checked)}
                      />
                    </div>
                    <div className="flex items-center justify-between">
                      <div>
                        <Label>Safeguarding Alerts</Label>
                        <p className="text-sm text-gray-600">
                          Immediate alerts for children flagged for safeguarding
                        </p>
                      </div>
                      <Switch
                        checked={notifications.emailSafeguarding}
                        onCheckedChange={(checked) => handleNotificationChange('emailSafeguarding', checked)}
                      />
                    </div>
                    <div className="flex items-center justify-between">
                      <div>
                        <Label>Weekly Reports</Label>
                        <p className="text-sm text-gray-600">
                          Weekly wellbeing reports and analytics
                        </p>
                      </div>
                      <Switch
                        checked={notifications.emailWeekly}
                        onCheckedChange={(checked) => handleNotificationChange('emailWeekly', checked)}
                      />
                    </div>
                  </div>
                </div>

                <div>
                  <h4 className="font-medium mb-4">Push Notifications</h4>
                  <div className="space-y-4">
                    <div className="flex items-center justify-between">
                      <div>
                        <Label>Safeguarding Alerts</Label>
                        <p className="text-sm text-gray-600">
                          Immediate push notifications for urgent safeguarding matters
                        </p>
                      </div>
                      <Switch
                        checked={notifications.pushSafeguarding}
                        onCheckedChange={(checked) => handleNotificationChange('pushSafeguarding', checked)}
                      />
                    </div>
                    <div className="flex items-center justify-between">
                      <div>
                        <Label>Check-in Reminders</Label>
                        <p className="text-sm text-gray-600">
                          Reminders when children haven't checked in recently
                        </p>
                      </div>
                      <Switch
                        checked={notifications.pushCheckIns}
                        onCheckedChange={(checked) => handleNotificationChange('pushCheckIns', checked)}
                      />
                    </div>
                  </div>
                </div>

                <Button onClick={handleNotificationSave} disabled={loading}>
                  {loading ? 'Saving...' : 'Save Preferences'}
                </Button>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Client Tab */}
          <TabsContent value="organization" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Building2 className="h-5 w-5" />
                  Client Information
                </CardTitle>
                <CardDescription>
                  View your client details and contract information.
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="space-y-4">
                    <div>
                      <Label className="text-sm font-medium text-gray-700">Client Name</Label>
                      <p className="text-lg">{clientInfo.name}</p>
                    </div>
                    <div>
                      <Label className="text-sm font-medium text-gray-700">Contact Email</Label>
                      <p className="flex items-center gap-2">
                        <Mail className="h-4 w-4 text-gray-400" />
                        {clientInfo.contactEmail}
                      </p>
                    </div>
                    <div>
                      <Label className="text-sm font-medium text-gray-700">Status</Label>
                      <div className="flex items-center gap-2">
                        <Badge className="bg-green-100 text-green-800 border-green-200">
                          {clientInfo.status}
                        </Badge>
                      </div>
                    </div>
                  </div>

                  <div className="space-y-4">
                    <div>
                      <Label className="text-sm font-medium text-gray-700">Seat Usage</Label>
                      <div className="flex items-center gap-3">
                        <Users className="h-4 w-4 text-gray-400" />
                        <span className="text-lg">
                          {clientInfo.seatsUsed} / {clientInfo.seatsTotal}
                        </span>
                      </div>
                      <div className="w-full bg-gray-200 rounded-full h-2 mt-2">
                        <div 
                          className="bg-blue-600 h-2 rounded-full" 
                          style={{ width: `${(clientInfo.seatsUsed / clientInfo.seatsTotal) * 100}%` }}
                        ></div>
                      </div>
                    </div>
                    <div>
                      <Label className="text-sm font-medium text-gray-700">Contract End Date</Label>
                      <p className="flex items-center gap-2">
                        <Calendar className="h-4 w-4 text-gray-400" />
                        {new Date(clientInfo.contractEnd).toLocaleDateString()}
                      </p>
                    </div>
                  </div>
                </div>

                {user?.profile.role === 'GroupContact' && (
                  <Alert className="border-blue-200 bg-blue-50">
                    <Shield className="h-4 w-4 text-blue-600" />
                    <AlertDescription className="text-blue-800">
                      As a Group Contact, you can manage client settings and invite new practitioners. 
                      Contact Lift support for contract modifications or seat upgrades.
                    </AlertDescription>
                  </Alert>
                )}
              </CardContent>
            </Card>
          </TabsContent>

          {/* Security Tab */}
          <TabsContent value="security" className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Key className="h-5 w-5" />
                  Security & Account
                </CardTitle>
                <CardDescription>
                  Manage your account security and access settings.
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="space-y-4">
                  <div className="p-4 border rounded-lg">
                    <h4 className="font-medium mb-2">Password</h4>
                    <p className="text-sm text-gray-600 mb-3">
                      Change your password to keep your account secure.
                    </p>
                    <Button variant="outline">
                      Change Password
                    </Button>
                  </div>

                  <div className="p-4 border rounded-lg">
                    <h4 className="font-medium mb-2">Two-Factor Authentication</h4>
                    <p className="text-sm text-gray-600 mb-3">
                      Add an extra layer of security to your account.
                    </p>
                    <Badge variant="outline" className="mb-3">Coming Soon</Badge>
                    <br />
                    <Button variant="outline" disabled>
                      Enable 2FA
                    </Button>
                  </div>

                  <div className="p-4 border rounded-lg">
                    <h4 className="font-medium mb-2">Session Management</h4>
                    <p className="text-sm text-gray-600 mb-3">
                      View and manage your active sessions across devices.
                    </p>
                    <div className="bg-gray-50 p-3 rounded border text-sm">
                      <p><strong>Current Session:</strong> {new Date().toLocaleString()}</p>
                      <p><strong>Device:</strong> {navigator.userAgent.includes('Mobile') ? 'Mobile' : 'Desktop'}</p>
                      <p><strong>Location:</strong> Demo Environment</p>
                    </div>
                  </div>

                  <div className="p-4 border rounded-lg border-red-200 bg-red-50">
                    <h4 className="font-medium mb-2 text-red-900">Sign Out</h4>
                    <p className="text-sm text-red-700 mb-3">
                      Sign out of your account on this device.
                    </p>
                    <Button variant="destructive" onClick={handleLogout}>
                      Sign Out
                    </Button>
                  </div>
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}