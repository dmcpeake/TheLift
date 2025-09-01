import React from 'react'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
import { Alert, AlertDescription } from '../ui/alert'
import { Building, User, AlertTriangle } from 'lucide-react'
import { ClientFormData } from './types'

interface ClientFormFieldsProps {
  formData: ClientFormData
  onInputChange: (field: string, value: string | number) => void
  originalEmail?: string
  isEditing?: boolean
}

export function ClientFormFields({ formData, onInputChange, originalEmail, isEditing = false }: ClientFormFieldsProps) {
  const emailChanged = isEditing && originalEmail && formData.contactEmail !== originalEmail

  return (
    <div className="space-y-6">
      {/* Email Change Warning */}
      {emailChanged && (
        <Alert>
          <AlertTriangle className="h-4 w-4" />
          <AlertDescription>
            <strong>Important:</strong> Changing the email address will update the client's login credentials. 
            They will receive a verification email at the new address and may need to re-authenticate. 
            All existing data and settings will be preserved.
          </AlertDescription>
        </Alert>
      )}

      {/* Basic Information */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="space-y-2">
          <Label htmlFor="name">Client Name</Label>
          <Input
            id="name"
            value={formData.name}
            onChange={(e) => onInputChange('name', e.target.value)}
            placeholder="Enter client name"
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="type">Client Type</Label>
          <Select 
            value={formData.type} 
            onValueChange={(value) => onInputChange('type', value)}
          >
            <SelectTrigger>
              <SelectValue placeholder="Select type" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="group">
                <div className="flex items-center gap-2">
                  <Building className="h-4 w-4" />
                  Group
                </div>
              </SelectItem>
              <SelectItem value="practitioner">
                <div className="flex items-center gap-2">
                  <User className="h-4 w-4" />
                  Practitioner
                </div>
              </SelectItem>
            </SelectContent>
          </Select>
        </div>
      </div>

      {/* Contact Information */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="space-y-2">
          <Label htmlFor="contactName">Contact Name</Label>
          <Input
            id="contactName"
            value={formData.contactName}
            onChange={(e) => onInputChange('contactName', e.target.value)}
            placeholder="Enter contact person name"
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="contactEmail">Contact Email</Label>
          <Input
            id="contactEmail"
            type="email"
            value={formData.contactEmail}
            onChange={(e) => onInputChange('contactEmail', e.target.value)}
            placeholder="Enter contact email address"
          />
        </div>
      </div>

      {/* Account Settings */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="space-y-2">
          <Label htmlFor="seatsAllocated">Seats Allocated</Label>
          <Input
            id="seatsAllocated"
            type="number"
            min="1"
            value={formData.seatsAllocated}
            onChange={(e) => onInputChange('seatsAllocated', parseInt(e.target.value) || 0)}
            placeholder="Enter number of seats"
          />
        </div>

        <div className="space-y-2">
          <Label htmlFor="expiryDate">Account Expiry Date</Label>
          <Input
            id="expiryDate"
            type="date"
            value={formData.expiryDate}
            onChange={(e) => onInputChange('expiryDate', e.target.value)}
          />
        </div>
      </div>
    </div>
  )
}