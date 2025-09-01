import React, { useState, useContext, useCallback, useEffect } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { AuthContext } from '../../App'
import { projectId, publicAnonKey } from '../../utils/supabase/info'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Textarea } from '../ui/textarea'
import { Alert, AlertDescription } from '../ui/alert'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { 
  UserPlus, 
  CheckCircle, 
  AlertCircle,
  Upload,
  FileText,
  Download,
  Users
} from 'lucide-react'

interface ChildData {
  name: string
  username: string
  pin: string
}

interface ProcessingResult {
  success: ChildData[]
  errors: string[]
}

interface Practitioner {
  id: string
  name: string
  email: string
  status: 'active' | 'pending'
  childrenCount: number
}

export function BulkImportChildren() {
  const navigate = useNavigate()
  const { user, currentMode } = useContext(AuthContext)
  const [dragActive, setDragActive] = useState(false)
  const [textInput, setTextInput] = useState('')
  const [processing, setProcessing] = useState(false)
  const [results, setResults] = useState<ProcessingResult | null>(null)
  const [practitioners, setPractitioners] = useState<Practitioner[]>([])
  const [selectedPractitioner, setSelectedPractitioner] = useState<string>('unassigned')

  const isGroupContact = user?.profile.role === 'GroupContact'
  const isAdminMode = isGroupContact && currentMode === 'admin'

  // Generate unique username
  const generateUsername = (name: string): string => {
    // Extract first name only
    const firstName = name.trim().split(' ')[0].toLowerCase().replace(/[^a-z]/g, '') || 'child'
    const randomSuffix = Math.floor(1000 + Math.random() * 9000)
    return `${firstName}${randomSuffix}`
  }

  // Generate 4-digit PIN
  const generatePin = (): string => {
    return Math.floor(1000 + Math.random() * 9000).toString()
  }

  // Fetch practitioners when in admin mode
  useEffect(() => {
    if (isAdminMode) {
      // Demo practitioners data - same as used in AddChild and PractitionerDashboard
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

  // Parse names from text (handles various formats)
  const parseNames = (text: string): string[] => {
    return text
      .split(/[\n,;]/)
      .map(name => name.trim())
      .filter(name => name.length > 0)
      .filter(name => name.split(' ').length >= 2) // Ensure first and last name
  }

  // Parse CSV content
  const parseCSV = (csvContent: string): string[] => {
    const lines = csvContent.split('\n')
    const names: string[] = []
    
    for (const line of lines) {
      const trimmedLine = line.trim()
      if (!trimmedLine) continue
      
      // Handle CSV with or without quotes
      const values = trimmedLine.split(',').map(val => val.trim().replace(/^"|"$/g, ''))
      
      if (values.length >= 2) {
        // Assume first two columns are first name and last name
        const fullName = `${values[0]} ${values[1]}`.trim()
        if (fullName.split(' ').length >= 2) {
          names.push(fullName)
        }
      } else if (values.length === 1 && values[0].includes(' ')) {
        // Single column with full name
        names.push(values[0])
      }
    }
    
    return names
  }

  // Handle file upload
  const handleFileUpload = async (file: File) => {
    const text = await file.text()
    let names: string[] = []
    
    if (file.name.endsWith('.csv')) {
      names = parseCSV(text)
    } else {
      names = parseNames(text)
    }
    
    await processChildren(names)
  }

  // Handle drag and drop
  const handleDrag = useCallback((e: React.DragEvent) => {
    e.preventDefault()
    e.stopPropagation()
    if (e.type === "dragenter" || e.type === "dragover") {
      setDragActive(true)
    } else if (e.type === "dragleave") {
      setDragActive(false)
    }
  }, [])

  const handleDrop = useCallback(async (e: React.DragEvent) => {
    e.preventDefault()
    e.stopPropagation()
    setDragActive(false)
    
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      await handleFileUpload(e.dataTransfer.files[0])
    }
  }, [])

  // Process children creation
  const processChildren = async (names: string[]) => {
    if (names.length === 0) {
      setResults({ success: [], errors: ['No valid names found. Please ensure each line contains both first and last name.'] })
      return
    }

    setProcessing(true)
    const success: ChildData[] = []
    const errors: string[] = []

    try {
      // Get user session for authentication
      const { getSupabaseClient } = await import('../../utils/supabase/client')
      const supabase = getSupabaseClient()
      const { data: { session } } = await supabase.auth.getSession()

      if (!session?.access_token) {
        setResults({ success: [], errors: ['No valid session found. Please refresh the page and try again.'] })
        setProcessing(false)
        return
      }

      for (const name of names) {
        try {
          const username = generateUsername(name)
          const pin = generatePin()

          const response = await fetch(`https://${projectId}.supabase.co/functions/v1/make-server-a1855b25/children`, {
            method: 'POST',
            headers: {
              'Authorization': `Bearer ${session.access_token}`,
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({
              name,
              aboutMe: { favourites: [], notes: '' },
              credentialsMode: 'slip',
              credentials: { username, pin },
              practitionerId: selectedPractitioner === 'unassigned' ? null : selectedPractitioner
            }),
          })

          if (response.ok) {
            const data = await response.json()
            // Use server-validated credentials if available
            const finalCredentials = data.credentials || { username, pin }
            success.push({ 
              name, 
              username: finalCredentials.username, 
              pin: finalCredentials.pin 
            })
          } else {
            const errorData = await response.json().catch(() => ({ error: 'Unknown error' }))
            errors.push(`${name}: ${errorData.error || 'Failed to create account'}`)
          }
        } catch (error) {
          errors.push(`${name}: ${error instanceof Error ? error.message : 'Unknown error'}`)
        }
      }
    } catch (error) {
      errors.push(`Authentication error: ${error instanceof Error ? error.message : 'Unknown error'}`)
    }

    setResults({ success, errors })
    setProcessing(false)
  }

  // Handle text input processing
  const handleTextProcess = async () => {
    const names = parseNames(textInput)
    await processChildren(names)
  }



  // Download credentials as CSV
  const downloadCredentials = () => {
    if (!results?.success.length) return
    
    const csvContent = [
      'Name,Username,Access PIN',
      ...results.success.map(child => `"${child.name}","${child.username}","${child.pin}"`)
    ].join('\n')
    
    const blob = new Blob([csvContent], { type: 'text/csv' })
    const url = window.URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    const today = new Date().toISOString().split('T')[0]
    a.download = `child-credentials-${today}.csv`
    a.click()
    window.URL.revokeObjectURL(url)
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
            <BreadcrumbPage>Bulk Import</BreadcrumbPage>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Bulk Import Children</h1>

        </div>

        {!results && (
          <div className="space-y-6">
            {/* File Upload Section */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Upload className="h-5 w-5" />
                  Upload File
                </CardTitle>
                <CardDescription>
                  Upload a CSV file or text file containing children's names. Each line should contain the child's full name.
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  <div
                    className={`border-2 border-dashed rounded-lg p-8 text-center transition-colors ${
                      dragActive ? 'border-gray-400 bg-gray-50' : 'border-gray-300'
                    }`}
                    onDragEnter={handleDrag}
                    onDragLeave={handleDrag}
                    onDragOver={handleDrag}
                    onDrop={handleDrop}
                  >
                    <FileText className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                    <p className="text-gray-600 mb-4">
                      Drag and drop a file here, or click to select
                    </p>
                    <div className="flex justify-center">
                      <input
                        type="file"
                        accept=".csv,.txt"
                        onChange={(e) => e.target.files?.[0] && handleFileUpload(e.target.files[0])}
                        className="hidden"
                        id="file-upload"
                      />
                      <Button
                        type="button"
                        variant="outline"
                        onClick={() => document.getElementById('file-upload')?.click()}
                        className="flex items-center gap-2"
                      >
                        <Upload className="h-4 w-4" />
                        Choose File
                      </Button>
                    </div>
                    <p className="text-sm text-gray-500 mt-2">
                      Supports .csv and .txt files
                    </p>
                  </div>


                </div>
              </CardContent>
            </Card>

            {/* Text Input Section */}
            <Card>
              <CardHeader>
                <CardTitle>Or Paste Names</CardTitle>
              </CardHeader>
              <CardContent>
                <Textarea
                  id="names"
                  value={textInput}
                  onChange={(e) => setTextInput(e.target.value)}
                  placeholder="Emma Thompson&#10;James Wilson&#10;Sarah Davis&#10;..."
                  rows={8}
                  className="resize-none"
                />
              </CardContent>
            </Card>

            {/* Assignment and Processing Section */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <UserPlus className="h-5 w-5" />
                  Process Children
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                {/* Practitioner Assignment - Admin Mode Only */}
                {isAdminMode && (
                  <div className="space-y-2">
                    <Label htmlFor="practitioner">Assign All Children To (Optional)</Label>
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

                <Button 
                  onClick={handleTextProcess}
                  disabled={!textInput.trim() || processing}
                  className="w-full"
                >
                  {processing ? 'Processing...' : 'Process'}
                </Button>
              </CardContent>
            </Card>

            {/* Example Format */}

          </div>
        )}

        {/* Results Section */}
        {results && (
          <div className="space-y-6">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <CheckCircle className="h-5 w-5 text-green-600" />
                  Import Results
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                {results.success.length > 0 && (
                  <div>
                    <h3 className="font-medium text-green-600 mb-3">
                      Successfully created: {results.success.length} children accounts
                    </h3>
                  </div>
                )}

                {results.errors.length > 0 && (
                  <div>
                    <h3 className="font-medium text-red-600 mb-3">
                      Errors: {results.errors.length}
                    </h3>
                    <div className="bg-red-50 border border-red-200 rounded p-4 space-y-1 max-h-32 overflow-y-auto">
                      {results.errors.map((error, index) => (
                        <div key={index} className="text-sm text-red-700">
                          {error}
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                <div className="flex gap-3 pt-4">
                  {results.success.length > 0 && (
                    <Button variant="outline" onClick={downloadCredentials}>
                      <Download className="h-4 w-4 mr-2" />
                      Download Credentials
                    </Button>
                  )}
                  <Button onClick={() => navigate('/dashboard')}>
                    Done
                  </Button>
                </div>
              </CardContent>
            </Card>
          </div>
        )}
      </div>
    </div>
  )
}