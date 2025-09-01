import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle, AlertDialogTrigger } from '../ui/alert-dialog'
import { Archive, XCircle } from 'lucide-react'

interface ClientManagementActionsProps {
  actionLoading: string | null
  onDeactivate: () => void
  onArchive: () => void
}

export function ClientManagementActions({ actionLoading, onDeactivate, onArchive }: ClientManagementActionsProps) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Client Management</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {/* Deactivate */}
          <AlertDialog>
            <AlertDialogTrigger asChild>
              <Button variant="outline" className="w-full" disabled={actionLoading !== null}>
                {actionLoading === 'deactivate' ? (
                  <>
                    <div className="animate-spin rounded-full h-4 w-4 border-2 border-gray-600 border-t-transparent mr-2"></div>
                    Deactivating...
                  </>
                ) : (
                  <>
                    <XCircle className="h-4 w-4 mr-2" />
                    Deactivate Client
                  </>
                )}
              </Button>
            </AlertDialogTrigger>
            <AlertDialogContent>
              <AlertDialogHeader>
                <AlertDialogTitle>Deactivate Client</AlertDialogTitle>
                <AlertDialogDescription>
                  This will temporarily disable access for this client and all their practitioners and children. 
                  The client can be reactivated later and all data will be preserved. Are you sure you want to continue?
                </AlertDialogDescription>
              </AlertDialogHeader>
              <AlertDialogFooter>
                <AlertDialogCancel>Cancel</AlertDialogCancel>
                <AlertDialogAction onClick={onDeactivate}>
                  Deactivate Client
                </AlertDialogAction>
              </AlertDialogFooter>
            </AlertDialogContent>
          </AlertDialog>

          {/* Archive */}
          <AlertDialog>
            <AlertDialogTrigger asChild>
              <Button variant="outline" className="w-full" disabled={actionLoading !== null}>
                {actionLoading === 'archive' ? (
                  <>
                    <div className="animate-spin rounded-full h-4 w-4 border-2 border-gray-600 border-t-transparent mr-2"></div>
                    Archiving...
                  </>
                ) : (
                  <>
                    <Archive className="h-4 w-4 mr-2" />
                    Archive Client
                  </>
                )}
              </Button>
            </AlertDialogTrigger>
            <AlertDialogContent>
              <AlertDialogHeader>
                <AlertDialogTitle>Archive Client</AlertDialogTitle>
                <AlertDialogDescription>
                  This will move the client to archived status, hiding them from the main client list. 
                  All practitioners, children, and their data will be preserved and the client can be restored later. Are you sure you want to continue?
                </AlertDialogDescription>
              </AlertDialogHeader>
              <AlertDialogFooter>
                <AlertDialogCancel>Cancel</AlertDialogCancel>
                <AlertDialogAction onClick={onArchive}>
                  Archive Client
                </AlertDialogAction>
              </AlertDialogFooter>
            </AlertDialogContent>
          </AlertDialog>
        </div>

        <div className="mt-4 p-4 bg-gray-50 rounded-lg">
          <h4 className="font-medium text-gray-900 mb-2">Action Descriptions</h4>
          <div className="space-y-1 text-sm text-gray-600">
            <p><strong>Deactivate:</strong> Temporarily disables access for client, practitioners, and children. Can be reversed and all data is preserved.</p>
            <p><strong>Archive:</strong> Hides client from main list but preserves all data for practitioners and children. Can be restored later.</p>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}