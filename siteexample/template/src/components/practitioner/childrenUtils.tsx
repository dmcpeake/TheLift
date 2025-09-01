import React from 'react'
import { Badge } from '../ui/badge'
import { Child } from './childrenData'

export const getStatusBadge = (status: string) => {
  switch (status) {
    case 'fine':
      return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Fine</Badge>
    case 'needs_attention':
      return <Badge className="bg-gray-100 text-gray-800 border-gray-200">Needs Attention</Badge>
    case 'flagged':
      return <Badge className="bg-red-100 text-red-800 border-red-200">Flagged</Badge>
    default:
      return <Badge variant="outline">Unknown</Badge>
  }
}

export const filterChildren = (
  children: Child[],
  searchTerm: string,
  statusFilter: string,
  practitionerFilter: string
) => {
  return children.filter(child => {
    const matchesSearch = child.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         (child.practitioner && child.practitioner.toLowerCase().includes(searchTerm.toLowerCase()))
    const matchesStatus = statusFilter === 'all' || child.status === statusFilter
    const matchesPractitioner = practitionerFilter === 'all' ||
                               (practitionerFilter === 'unassigned' && child.practitioner === 'Unassigned') ||
                               child.practitionerId === practitionerFilter
    
    return matchesSearch && matchesStatus && matchesPractitioner
  })
}

export const getUniquePractitioners = (children: Child[]) => {
  return Array.from(new Set(children
    .filter(child => child.practitioner)
    .map(child => ({ id: child.practitionerId || 'unassigned', name: child.practitioner! }))
    .concat({ id: 'unassigned', name: 'Unassigned' })))
}