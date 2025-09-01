import React, { useState } from 'react'
import { Button } from '../ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Badge } from '../ui/badge'
import { AlertCircle, User, Users, UserCheck, Shield, Copy, RefreshCw, CheckCircle, XCircle, Info } from 'lucide-react'
import { Alert, AlertDescription } from '../ui/alert'
import { projectId, publicAnonKey } from '../../utils/supabase/info'

interface TestAccount {
  email: string
  role: string
  description: string
}

const testAccounts: TestAccount[] = [
  { 
    email: 'admin@thelift.com', 
    role: 'LiftStaff', 
    description: 'Lift Admin - Client provisioning and management' 
  },
  { 
    email: 'contact@demoschool.com', 
    role: 'GroupContact', 
    description: 'Group Contact - Organization management and practitioner invites' 
  },
  { 
    email: 'practitioner@demoschool.com', 
    role: 'Practitioner', 
    description: 'Practitioner - Child management and check-in monitoring' 
  },
  { 
    email: 'child@demoschool.com', 
    role: 'Child', 
    description: 'Child - Wellbeing check-ins and activities' 
  }
]

const getRoleIcon = (role: string) => {
  switch (role) {
    case 'LiftStaff': return <Shield className="h-4 w-4" />
    case 'GroupContact': return <Users className="h-4 w-4" />
    case 'Practitioner': return <UserCheck className="h-4 w-4" />
    case 'Child': return <User className="h-4 w-4" />
    default: return <User className="h-4 w-4" />
  }
}

const getRoleColor = (role: string) => {
  switch (role) {
    case 'LiftStaff': return 'bg-red-100 text-red-800 border-red-200'
    case 'GroupContact': return 'bg-blue-100 text-blue-800 border-blue-200'
    case 'Practitioner': return 'bg-green-100 text-green-800 border-green-200'
    case 'Child': return 'bg-purple-100 text-purple-800 border-purple-200'
    default: return 'bg-gray-100 text-gray-800 border-gray-200'
  }
}

export function TestCredentials() {
  const [isInitializing, setIsInitializing] = useState(false)
  const [isTesting, setIsTesting] = useState(false)
  const [initResult, setInitResult] = useState<any>(null)
  const [healthResult, setHealthResult] = useState<any>(null)
  const [copied, setCopied] = useState<string | null>(null)

  const testServerHealth = async () => {
    setIsTesting(true)
    setHealthResult(null)

    try {
      console.log('Testing server health...')
      const response = await fetch(`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/health`, {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${publicAnonKey}`,
        },
      })

      const result = await response.json()
      console.log('Health check response:', result)
      
      setHealthResult({
        success: response.ok,
        status: response.status,
        data: result,
        message: response.ok ? 'Server is running correctly' : 'Server error detected'
      })
    } catch (error) {
      console.error('Health check failed:', error)
      setHealthResult({ 
        success: false, 
        error: 'Failed to connect to server. The edge function may not be deployed.',
        details: error.message
      })
    } finally {
      setIsTesting(false)
    }
  }

  const initializeTestUsers = async () => {
    setIsInitializing(true)
    setInitResult(null)

    try {
      console.log('Initializing test users...')
      const url = `https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/auth/init-test-users`
      console.log('Making request to:', url)
      
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${publicAnonKey}`,
        },
      })

      console.log('Response status:', response.status)
      const result = await response.json()
      console.log('Response data:', result)
      
      setInitResult({
        ...result,
        httpStatus: response.status,
        success: response.ok && result.success
      })
    } catch (error) {
      console.error('Failed to initialize test users:', error)
      setInitResult({ 
        success: false, 
        error: 'Failed to initialize test users. Please check the server connection.',
        details: error.message
      })
    } finally {
      setIsInitializing(false)
    }
  }

  const copyToClipboard = async (text: string, type: string) => {
    try {
      await navigator.clipboard.writeText(text)
      setCopied(type)
      setTimeout(() => setCopied(null), 2000)
    } catch (error) {
      console.error('Failed to copy to clipboard:', error)
    }
  }

  return (
    <div className="space-y-6">
      {/* Server Status Check */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Info className="h-5 w-5 text-blue-600" />
            Server Status
          </CardTitle>
          <CardDescription>
            Check if the Supabase edge function is running properly before initializing test users.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <Button 
            onClick={testServerHealth} 
            disabled={isTesting}
            variant="outline"
            className="w-full"
          >
            {isTesting ? (
              <>
                <RefreshCw className="h-4 w-4 mr-2 animate-spin" />
                Testing Server...
              </>
            ) : (
              <>
                <CheckCircle className="h-4 w-4 mr-2" />
                Test Server Health
              </>
            )}
          </Button>

          {healthResult && (
            <Alert className={healthResult.success ? 'border-green-200 bg-green-50' : 'border-red-200 bg-red-50'}>
              {healthResult.success ? (
                <CheckCircle className="h-4 w-4 text-green-600" />
              ) : (
                <XCircle className="h-4 w-4 text-red-600" />
              )}
              <AlertDescription className={healthResult.success ? 'text-green-800' : 'text-red-800'}>
                <div>
                  <p className="font-medium">{healthResult.message}</p>
                  {healthResult.success && healthResult.data && (
                    <div className="mt-2 text-xs space-y-1">
                      <p>Status: {healthResult.data.status}</p>
                      <p>Message: {healthResult.data.message}</p>
                      <p>Time: {healthResult.data.timestamp}</p>
                    </div>
                  )}
                  {!healthResult.success && (
                    <div className="mt-2 text-xs">
                      <p>Error: {healthResult.error}</p>
                      {healthResult.details && <p>Details: {healthResult.details}</p>}
                      {healthResult.status && <p>HTTP Status: {healthResult.status}</p>}
                    </div>
                  )}
                </div>
              </AlertDescription>
            </Alert>
          )}
        </CardContent>
      </Card>

      {/* Test User Initialization */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <AlertCircle className="h-5 w-5 text-blue-600" />
            Test Credentials Setup
          </CardTitle>
          <CardDescription>
            Initialize test credentials for The Lift application. Use these accounts to test different user roles and workflows.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <Button 
            onClick={initializeTestUsers} 
            disabled={isInitializing || (healthResult && !healthResult.success)}
            className="w-full"
          >
            {isInitializing ? (
              <>
                <RefreshCw className="h-4 w-4 mr-2 animate-spin" />
                Initializing Test Users...
              </>
            ) : (
              'Initialize Test Users'
            )}
          </Button>

          {!healthResult?.success && healthResult !== null && (
            <Alert className="border-yellow-200 bg-yellow-50">
              <AlertCircle className="h-4 w-4 text-yellow-600" />
              <AlertDescription className="text-yellow-800">
                Please test server health first to ensure the edge function is running.
              </AlertDescription>
            </Alert>
          )}

          {initResult && (
            <Alert className={initResult.success ? 'border-green-200 bg-green-50' : 'border-red-200 bg-red-50'}>
              {initResult.success ? (
                <CheckCircle className="h-4 w-4 text-green-600" />
              ) : (
                <XCircle className="h-4 w-4 text-red-600" />
              )}
              <AlertDescription className={initResult.success ? 'text-green-800' : 'text-red-800'}>
                <div>
                  <p className="font-medium">{initResult.success ? initResult.message : initResult.error}</p>
                  {initResult.users && (
                    <div className="mt-2 space-y-1">
                      {initResult.users.map((user: any, index: number) => (
                        <div key={index} className="flex items-center gap-2 text-xs">
                          <Badge variant="outline" className="text-xs">
                            {user.status}
                          </Badge>
                          {user.email} ({user.role})
                        </div>
                      ))}
                    </div>
                  )}
                  {!initResult.success && (
                    <div className="mt-2 text-xs">
                      {initResult.details && <p>Details: {initResult.details}</p>}
                      {initResult.httpStatus && <p>HTTP Status: {initResult.httpStatus}</p>}
                      <p className="mt-1 font-medium">Troubleshooting:</p>
                      <ul className="list-disc list-inside ml-2 space-y-0.5">
                        <li>Make sure the Supabase edge function is deployed</li>
                        <li>Check that SUPABASE_SERVICE_ROLE_KEY is set correctly</li>
                        <li>Verify the project ID and API keys</li>
                      </ul>
                    </div>
                  )}
                </div>
              </AlertDescription>
            </Alert>
          )}
        </CardContent>
      </Card>

      {/* Test Accounts Display */}
      <Card>
        <CardHeader>
          <CardTitle>Test Accounts</CardTitle>
          <CardDescription>
            Use these credentials to test different user roles. The password for all accounts is: <code className="bg-gray-100 px-1 rounded">TestLift2024!</code>
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid gap-4 md:grid-cols-2">
            {testAccounts.map((account, index) => (
              <Card key={index} className="border-2">
                <CardContent className="p-4">
                  <div className="flex items-start justify-between mb-3">
                    <div className="flex items-center gap-2">
                      {getRoleIcon(account.role)}
                      <Badge className={getRoleColor(account.role)}>
                        {account.role}
                      </Badge>
                    </div>
                  </div>
                  
                  <div className="space-y-2">
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-medium">Email:</span>
                      <div className="flex items-center gap-1">
                        <code className="text-sm bg-gray-100 px-2 py-1 rounded">
                          {account.email}
                        </code>
                        <Button
                          variant="ghost"
                          size="sm"
                          onClick={() => copyToClipboard(account.email, `email-${index}`)}
                          className="h-6 w-6 p-0"
                        >
                          <Copy className="h-3 w-3" />
                        </Button>
                        {copied === `email-${index}` && (
                          <span className="text-xs text-green-600">Copied!</span>
                        )}
                      </div>
                    </div>
                    
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-medium">Password:</span>
                      <div className="flex items-center gap-1">
                        <code className="text-sm bg-gray-100 px-2 py-1 rounded">
                          TestLift2024!
                        </code>
                        <Button
                          variant="ghost"
                          size="sm"
                          onClick={() => copyToClipboard('TestLift2024!', `password-${index}`)}
                          className="h-6 w-6 p-0"
                        >
                          <Copy className="h-3 w-3" />
                        </Button>
                        {copied === `password-${index}` && (
                          <span className="text-xs text-green-600">Copied!</span>
                        )}
                      </div>
                    </div>
                  </div>
                  
                  <p className="text-sm text-gray-600 mt-3">
                    {account.description}
                  </p>
                </CardContent>
              </Card>
            ))}
          </div>
          
          <div className="mt-6 p-4 bg-blue-50 rounded-lg border border-blue-200">
            <div className="flex items-start gap-2">
              <AlertCircle className="h-4 w-4 text-blue-600 mt-0.5" />
              <div className="text-sm text-blue-800">
                <p className="font-medium mb-1">Usage Instructions:</p>
                <ol className="list-decimal list-inside space-y-1 ml-2">
                  <li>First test server health to ensure the edge function is running</li>
                  <li>Click "Initialize Test Users" to create the accounts in Supabase</li>
                  <li>Use the credentials above to sign in via the login page</li>
                  <li>Each role provides access to different features and pages</li>
                  <li>Test the complete user journey from admin to child interactions</li>
                </ol>
              </div>
            </div>
          </div>

          <div className="mt-4 p-4 bg-gray-50 rounded-lg border border-gray-200">
            <div className="text-sm text-gray-700">
              <p className="font-medium mb-1">Debug Information:</p>
              <p>Project ID: <code className="bg-white px-1 rounded">{projectId}</code></p>
              <p>Server URL: <code className="bg-white px-1 rounded">{`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25`}</code></p>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}