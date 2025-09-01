import React, { useState, useEffect, useContext } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { AuthContext } from '../../App'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '../ui/breadcrumb'
import { 
  ArrowLeft, 
  FileText,
  Download,
  Printer
} from 'lucide-react'

export function ChildReport() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const { user } = useContext(AuthContext)
  const [childName, setChildName] = useState('Emma Thompson') // Demo data

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
              <BreadcrumbLink asChild>
                <Link to={`/children/${id}`}>{childName}</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>Report</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>

        {/* Header */}
        <div className="mb-8">
          <div className="flex items-start justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">Wellbeing Report</h1>
              <p className="text-gray-600 mt-2">Comprehensive report for {childName}</p>
            </div>
            <div className="flex gap-3">
              <Button variant="outline">
                <Download className="h-4 w-4 mr-2" />
                Download PDF
              </Button>
              <Button variant="outline">
                <Printer className="h-4 w-4 mr-2" />
                Print Report
              </Button>
              <Button variant="outline" onClick={() => navigate(`/children/${id}`)}>
                <ArrowLeft className="h-4 w-4 mr-2" />
                Back to Profile
              </Button>
            </div>
          </div>
        </div>

        {/* Main Content */}
        <div className="space-y-6">
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <FileText className="h-5 w-5" />
                Report Generation
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="text-center py-12">
                <FileText className="h-16 w-16 text-gray-400 mx-auto mb-4" />
                <h3 className="text-xl font-medium text-gray-900 mb-2">Report Coming Soon</h3>
                <p className="text-gray-600 mb-6">
                  The comprehensive wellbeing report feature is currently in development.
                </p>
                <div className="bg-gray-50 p-6 rounded-lg max-w-2xl mx-auto text-left">
                  <h4 className="font-medium text-gray-900 mb-3">Planned Report Features:</h4>
                  <ul className="text-sm text-gray-700 space-y-2">
                    <li>• Wellbeing trends and patterns over time</li>
                    <li>• Check-in frequency and consistency analysis</li>
                    <li>• Emotional wellbeing wheel breakdowns</li>
                    <li>• Garden activity engagement metrics</li>
                    <li>• Sticker collection and achievement progress</li>
                    <li>• Personalised insights and recommendations</li>
                    <li>• Printable PDF format for sharing</li>
                    <li>• Date range filtering and comparison tools</li>
                  </ul>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}