import { Client } from './types'

export const SAMPLE_CLIENTS: Client[] = [
  {
    id: 'org-1',
    name: 'Sunshine Primary School',
    type: 'group',
    contactName: 'Sarah Thompson',
    contactEmail: 'sarah.thompson@sunshine-primary.edu',
    seatsAllocated: 150,
    seatsUsed: 124,
    status: 'active',
    expiryDate: '2025-01-15',
    createdDate: '2024-01-15',
    lastActivity: '2024-08-22'
  },
  {
    id: 'org-2',
    name: 'Westfield Community Centre',
    type: 'group',
    contactName: 'David Johnson',
    contactEmail: 'david.johnson@westfield-community.org',
    seatsAllocated: 80,
    seatsUsed: 67,
    status: 'active',
    expiryDate: '2025-03-10',
    createdDate: '2024-03-10',
    lastActivity: '2024-08-22'
  }
]