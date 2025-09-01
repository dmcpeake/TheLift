export interface Client {
  id: string
  name: string
  type: 'group' | 'practitioner'
  contactName: string
  contactEmail: string
  seatsAllocated: number
  seatsUsed: number
  status: 'active' | 'expired' | 'deactivated' | 'archived'
  expiryDate: string
  createdDate: string
  lastActivity: string
  phone?: string
  archivedDate?: string
  practitioners?: Practitioner[]
  children?: ChildProfile[]
}

export interface Practitioner {
  id: string
  name: string
  email: string
  status: 'active' | 'inactive' | 'pending'
  joinDate: string
  childrenCount: number
  lastActive: string
  orgId: string
}

export interface ChildProfile {
  id: string
  name: string
  age: number
  status: 'active' | 'inactive' | 'needs_attention'
  lastCheckIn: string
  totalCheckIns: number
  practitionerId: string
  practitionerName: string
}

export interface ClientFormData {
  name: string
  type: 'group' | 'practitioner'
  contactName: string
  contactEmail: string
  seatsAllocated: number
  expiryDate: string
}