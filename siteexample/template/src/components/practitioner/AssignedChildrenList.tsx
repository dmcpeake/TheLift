import React, { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Checkbox } from '../ui/checkbox'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Users, ArrowLeftRight } from 'lucide-react'
import { PractitionerWithAssignments } from './types'
import { getChildStatusBadge } from './practitionerUtils'

interface AssignedChildrenListProps {
  practitioner: PractitionerWithAssignments
  onReassignMultiple: (childIds: string[], newPractitionerId: string) => void
}

export function AssignedChildrenList({ 
  practitioner, 
  onReassignMultiple 
}: AssignedChildrenListProps) {
  const [selectedChildren, setSelectedChildren] = useState<Set<string>>(new Set())
  const [bulkReassignTarget, setBulkReassignTarget] = useState<string>('')

  // Reset selection when practitioner changes
  useEffect(() => {
    setSelectedChildren(new Set())
    setBulkReassignTarget('')
  }, [practitioner.id])

  const handleSelectChild = (childId: string, checked: boolean) => {
    const newSelected = new Set(selectedChildren)
    if (checked) {
      newSelected.add(childId)
    } else {
      newSelected.delete(childId)
    }
    setSelectedChildren(newSelected)
  }

  const handleSelectAll = (checked: boolean) => {
    if (checked) {
      setSelectedChildren(new Set(practitioner.children.map(child => child.id)))
    } else {
      setSelectedChildren(new Set())
    }
  }

  const handleBulkReassign = () => {
    if (selectedChildren.size === 0 || !bulkReassignTarget) return
    
    const selectedIds = Array.from(selectedChildren)
    onReassignMultiple(selectedIds, bulkReassignTarget)
    
    // Reset selection after reassignment
    setSelectedChildren(new Set())
    setBulkReassignTarget('')
  }

  const allChildrenSelected = practitioner.children.length > 0 && selectedChildren.size === practitioner.children.length
  const someChildrenSelected = selectedChildren.size > 0 && selectedChildren.size < practitioner.children.length

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <div>
            <CardTitle className="flex items-center gap-2">
              <Users className="h-5 w-5" />
              Assigned Children ({practitioner.childrenCount})
            </CardTitle>
            <CardDescription>
              {practitioner.childrenCount > 0 
                ? 'Select children to reassign individually or in bulk'
                : 'No children currently assigned to this practitioner'
              }
            </CardDescription>
          </div>
          
          {practitioner.children.length > 0 && (
            <div className="flex items-center gap-2">
              <div className="flex items-center gap-2">
                <Checkbox
                  checked={allChildrenSelected}
                  onCheckedChange={handleSelectAll}
                  ref={(el) => {
                    if (el) {
                      el.indeterminate = someChildrenSelected
                    }
                  }}
                />
                <span className="text-sm text-gray-600">
                  Select All ({selectedChildren.size}/{practitioner.children.length})
                </span>
              </div>
            </div>
          )}
        </div>
        
        {/* Bulk Actions */}
        {selectedChildren.size > 0 && (
          <div className="flex items-center gap-3 pt-3 border-t">
            <span className="text-sm font-medium">
              {selectedChildren.size} selected:
            </span>
            <Select value={bulkReassignTarget} onValueChange={setBulkReassignTarget}>
              <SelectTrigger className="w-48">
                <div className="flex items-center gap-2">
                  <ArrowLeftRight className="h-4 w-4" />
                  <span>Reassign to...</span>
                </div>
              </SelectTrigger>
              <SelectContent>
                {practitioner.availablePractitioners.map((availablePractitioner) => (
                  <SelectItem key={availablePractitioner.id} value={availablePractitioner.id}>
                    {availablePractitioner.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
            <Button 
              onClick={handleBulkReassign}
              disabled={!bulkReassignTarget}
              size="sm"
            >
              Reassign Selected
            </Button>
            <Button 
              variant="outline" 
              size="sm"
              onClick={() => setSelectedChildren(new Set())}
            >
              Clear Selection
            </Button>
          </div>
        )}
      </CardHeader>
      <CardContent>
        {practitioner.children.length > 0 ? (
          <div className="space-y-4">
            {practitioner.children.map((child) => (
              <div key={child.id} className="flex items-center gap-4 p-4 border rounded-lg">
                <Checkbox
                  checked={selectedChildren.has(child.id)}
                  onCheckedChange={(checked) => handleSelectChild(child.id, checked === true)}
                />
                <div className="flex-1">
                  <div className="flex items-center gap-3 mb-1">
                    <h4 className="font-medium">{child.name}</h4>
                    {getChildStatusBadge(child.status)}
                  </div>
                  <p className="text-sm text-gray-600">Last check-in: {child.lastCheckIn}</p>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="text-center py-8">
            <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
            <h3 className="text-lg font-medium text-gray-900 mb-2">No children assigned</h3>
            <p className="text-gray-600">
              This practitioner doesn't have any children assigned yet.
            </p>
          </div>
        )}
      </CardContent>
    </Card>
  )
}