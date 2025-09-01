import React from 'react'
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from '../ui/dialog'
import { Button } from '../ui/button'
import { Alert, AlertDescription } from '../ui/alert'
import { Archive, AlertTriangle, RotateCcw } from 'lucide-react'

interface BulkArchiveDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  selectedChildren: string[]
  childrenNames: string[]
  onConfirm: () => void
  loading: boolean
}

export function BulkArchiveDialog({ 
  open, 
  onOpenChange, 
  selectedChildren, 
  childrenNames,
  onConfirm, 
  loading 
}: BulkArchiveDialogProps) {
  const handleOpenChange = (newOpen: boolean) => {
    if (!loading) {
      onOpenChange(newOpen)
    }
  }

  return (
    <Dialog open={open} onOpenChange={handleOpenChange}>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle className="flex items-center gap-2">
            <Archive className="h-5 w-5" />
            Archive Children
          </DialogTitle>
          <DialogDescription>
            Archive {(selectedChildren || []).length} selected children. They can be restored later.
          </DialogDescription>
        </DialogHeader>

        <div className="space-y-4">
          {/* Selected children summary */}
          <div className="p-3 bg-gray-50 rounded-lg">
            <p className="text-sm font-medium text-gray-900 mb-2">
              Children to archive ({(selectedChildren || []).length}):
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

          {/* Warning message */}
          <Alert>
            <RotateCcw className="h-4 w-4" />
            <AlertDescription>
              Archived children will be moved to the archived list and won't appear in the main children view. 
              You can restore them later from the archived children section.
            </AlertDescription>
          </Alert>

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
              variant="destructive"
              onClick={onConfirm}
              disabled={loading}
              className="flex items-center gap-2"
            >
              {loading ? (
                'Archiving...'
              ) : (
                <>
                  <Archive className="h-4 w-4" />
                  Archive Children
                </>
              )}
            </Button>
          </div>
        </div>
      </DialogContent>
    </Dialog>
  )
}