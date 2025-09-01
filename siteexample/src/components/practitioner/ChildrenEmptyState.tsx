import React from 'react'
import { Link } from 'react-router-dom'
import { Card, CardContent } from '../ui/card'
import { Button } from '../ui/button'
import { Users, Plus } from 'lucide-react'

interface ChildrenEmptyStateProps {
  searchTerm: string
  statusFilter: string
  practitionerFilter: string
  isAdminMode: boolean
}

export function ChildrenEmptyState({ 
  searchTerm, 
  statusFilter, 
  practitionerFilter, 
  isAdminMode 
}: ChildrenEmptyStateProps) {
  const hasFilters = searchTerm || statusFilter !== 'all' || practitionerFilter !== 'all'
  
  return (
    <div className="text-center py-12 px-6">
      <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
      <h3 className="text-xl font-semibold text-gray-900 mb-2">No children found</h3>
      <p className="text-gray-600 mb-6">
        {hasFilters
          ? 'Try adjusting your search or filter criteria'
          : isAdminMode 
            ? 'No children have been added to your organisation yet'
            : 'You don\'t have any children assigned to you yet'
        }
      </p>
      {!hasFilters && (
        <Link to="/children/new">
          <Button>
            <Plus className="h-4 w-4 mr-2" />
            Add First Child
          </Button>
        </Link>
      )}
    </div>
  )
}