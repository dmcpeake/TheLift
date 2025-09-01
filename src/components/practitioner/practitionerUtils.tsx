import React from 'react'
import { Badge } from '../ui/badge'
import { CheckCircle, Clock, AlertTriangle } from 'lucide-react'

export const getStatusBadge = (status: string) => {
  switch (status) {
    case 'active':
      return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Active</Badge>
    case 'pending':
      return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Pending</Badge>
    default:
      return <Badge variant="outline">Unknown</Badge>
  }
}

export const getStatusIcon = (status: string) => {
  switch (status) {
    case 'active':
      return <CheckCircle className="h-4 w-4 text-gray-600" />
    case 'pending':
      return <Clock className="h-4 w-4 text-gray-600" />
    default:
      return <AlertTriangle className="h-4 w-4 text-gray-600" />
  }
}

export const getChildStatusBadge = (status: string) => {
  switch (status) {
    case 'fine':
      return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Fine</Badge>
    case 'needs_attention':
      return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Needs Attention</Badge>
    case 'flagged':
      return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Flagged</Badge>
    default:
      return <Badge variant="outline">Unknown</Badge>
  }
}

export const getDaysAgo = (dateString: string) => {
  const date = new Date(dateString)
  const today = new Date()
  const diffTime = Math.abs(today.getTime() - date.getTime())
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
  
  if (diffDays === 1) return 'Today'
  if (diffDays === 2) return 'Yesterday'
  return `${diffDays - 1} days ago`
}