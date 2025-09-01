import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Input } from '../ui/input'
import { Alert, AlertDescription } from '../ui/alert'
import { Save, X, Mail, Phone, User, AlertTriangle } from 'lucide-react'
import { PractitionerWithAssignments, EditForm } from './types'

interface PractitionerDetailsFormProps {
  practitioner: PractitionerWithAssignments
  isEditing: boolean
  editForm: EditForm
  onEditChange: (form: EditForm) => void
  onStartEdit: () => void
  onSaveEdit: () => void
  onCancelEdit: () => void
}

export function PractitionerDetailsForm({
  practitioner,
  isEditing,
  editForm,
  onEditChange,
  onStartEdit,
  onSaveEdit,
  onCancelEdit
}: PractitionerDetailsFormProps) {
  // Check if email has been changed
  const emailChanged = isEditing && editForm.email !== practitioner.email

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="flex items-center gap-2">
            <User className="h-5 w-5" />
            Profile Details
          </CardTitle>
          {!isEditing ? (
            <Button variant="outline" size="sm" onClick={onStartEdit}>
              Edit Profile
            </Button>
          ) : (
            <div className="flex items-center gap-2">
              <Button variant="outline" size="sm" onClick={onCancelEdit}>
                <X className="h-4 w-4 mr-2" />
                Cancel
              </Button>
              <Button size="sm" onClick={onSaveEdit}>
                <Save className="h-4 w-4 mr-2" />
                Save Changes
              </Button>
            </div>
          )}
        </div>
      </CardHeader>
      <CardContent>
        <div className="space-y-6">
          {/* Email Change Warning */}
          {emailChanged && (
            <Alert>
              <AlertTriangle className="h-4 w-4" />
              <AlertDescription>
                <strong>Important:</strong> Changing the email address will update the practitioner's login credentials. 
                They will receive a verification email at the new address and may need to re-authenticate. 
                All existing data and settings will be preserved.
              </AlertDescription>
            </Alert>
          )}

          {/* Name Field */}
          <div>
            <label className="text-sm font-medium text-gray-700 mb-2 block">Full Name</label>
            {isEditing ? (
              <Input
                value={editForm.name}
                onChange={(e) => onEditChange({ ...editForm, name: e.target.value })}
                placeholder="Enter full name"
                className="max-w-md"
              />
            ) : (
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg max-w-md">
                <User className="h-4 w-4 text-gray-600" />
                <span className="font-medium">{practitioner.name}</span>
              </div>
            )}
          </div>
          
          {/* Email Field */}
          <div>
            <label className="text-sm font-medium text-gray-700 mb-2 block">Email Address</label>
            {isEditing ? (
              <div className="space-y-2">
                <Input
                  type="email"
                  value={editForm.email}
                  onChange={(e) => onEditChange({ ...editForm, email: e.target.value })}
                  placeholder="Enter email address"
                  className="max-w-md"
                />
                {emailChanged && (
                  <p className="text-sm text-gray-600">
                    Previous email: {practitioner.email}
                  </p>
                )}
              </div>
            ) : (
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg max-w-md">
                <Mail className="h-4 w-4 text-gray-600" />
                <span className="font-medium">{practitioner.email}</span>
              </div>
            )}
          </div>
          
          {/* Phone Field */}
          <div>
            <label className="text-sm font-medium text-gray-700 mb-2 block">Phone Number</label>
            {isEditing ? (
              <Input
                type="tel"
                value={editForm.phone}
                onChange={(e) => onEditChange({ ...editForm, phone: e.target.value })}
                placeholder="Enter phone number (optional)"
                className="max-w-md"
              />
            ) : (
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg max-w-md">
                <Phone className="h-4 w-4 text-gray-600" />
                <span className="font-medium">{practitioner.phone || 'Not provided'}</span>
              </div>
            )}
          </div>
        </div>
      </CardContent>
    </Card>
  )
}