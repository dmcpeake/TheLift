import React, { useState } from 'react'
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from '../ui/dialog'
import { Button } from '../ui/button'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Alert, AlertDescription } from '../ui/alert'
import { UserX, AlertTriangle } from 'lucide-react'

interface Practitioner {
  id: string
  name: string
  email: string
  childrenCount: number
}

interface BulkReassignDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  selectedChildren: string[]
  childrenNames: string[]
  practitioners: Practitioner[]
  onConfirm: (practitionerId: string) => void
  loading: boolean
}

export function BulkReassignDialog({ 
  open, 
  onOpenChange, 
  selectedChildren, 
  childrenNames,
  practitioners, 
  onConfirm, 
  loading 
}: BulkReassignDialogProps) {
  const [selectedPractitioner, setSelectedPractitioner] = useState<string>('')

  const handleConfirm = () => {
    if (selectedPractitioner) {
      onConfirm(selectedPractitioner)
    }
  }

  const handleOpenChange = (newOpen: boolean) => {
    if (!loading) {
      onOpenChange(newOpen)
      if (!newOpen) {
        setSelectedPractitioner('')
      }
    }
  }

  const selectedPractitionerData = (practitioners || []).find(p => p.id === selectedPractitioner)

  return (
    <Dialog open={open} onOpenChange={handleOpenChange}>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle className="flex items-center gap-2">
            <UserX className="h-5 w-5" />
            Reassign Children
          </DialogTitle>
          <DialogDescription>
            Reassign {(selectedChildren || []).length} selected children to a different practitioner.
          </DialogDescription>
        </DialogHeader>

        <div className="space-y-4">
          {/* Selected children summary */}
          <div className="p-3 bg-gray-50 rounded-lg">
            <p className="text-sm font-medium text-gray-900 mb-2">
              Children to reassign ({(selectedChildren || []).length}):
            </p>
            <div className="text-sm text-gray-600 max-h-32 overflow-y-auto">
              {(childrenNames || []).length > 3 ? (
                <>
                  {(childrenNames || []).slice(0, 3).join(', ')}
                  <span className="text-gray-500"> and {(childrenNames || []).length - 3} more</span>
                </>
              ) : (
                (childrenNames || []).join(', ')
              )}
            </div>
          </div>

          {/* Practitioner selection */}
          <div className="space-y-2">
            <label className="text-sm font-medium text-gray-900">
              Assign to Practitioner
            </label>
            <Select 
              value={selectedPractitioner} 
              onValueChange={setSelectedPractitioner}
              disabled={loading}
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select a practitioner" />
              </SelectTrigger>
              <SelectContent>
                {(practitioners || []).map((practitioner) => (
                  <SelectItem key={practitioner.id} value={practitioner.id}>
                    <div className="flex flex-col">
                      <span>{practitioner.name}</span>
                      <span className="text-xs text-gray-500">
                        {practitioner.email} • {practitioner.childrenCount} children
                      </span>
                    </div>
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          {/* Confirmation info */}
          {selectedPractitionerData && (
            <Alert>
              <AlertTriangle className="h-4 w-4" />
              <AlertDescription>
                {(selectedChildren || []).length} children will be reassigned to {selectedPractitionerData.name}. 
                This action will update their practitioner assignment immediately.
              </AlertDescription>
            </Alert>
          )}

          {/* Action buttons */}
          <div className="flex justify-end gap-2 pt-4">
            <Button 
              variant="outline" 
              onClick={() => handleOpenChange(false)}
              disabled={loading}
            >
              Cancel
            </Button>
            <Button 
              onClick={handleConfirm}
              disabled={!selectedPractitioner || loading}
            >
              {loading ? 'Reassigning...' : 'Reassign Children'}
            </Button>
          </div>
        </div>
      </DialogContent>
    </Dialog>
  )
}