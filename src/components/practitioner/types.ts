export interface Child {
  id: string
  name: string
  status: 'fine' | 'needs_attention' | 'flagged'
  lastCheckIn: string
}

export interface Practitioner {
  id: string
  name: string
  email: string
  phone?: string
  status: 'active' | 'pending'
  invitedDate: string
  lastLogin?: string
  childrenCount: number
  children: Child[]
}

export interface PractitionerWithAssignments extends Practitioner {
  availablePractitioners: {
    id: string
    name: string
  }[]
}

export interface EditForm {
  name: string
  email: string
  phone: string
}