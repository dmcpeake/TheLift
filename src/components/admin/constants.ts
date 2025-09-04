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
  },
  {
    id: 'org-3',
    name: 'Dr. Amanda Foster',
    type: 'practitioner',
    contactName: 'Amanda Foster',
    contactEmail: 'amanda.foster@therapy.com',
    seatsAllocated: 25,
    seatsUsed: 18,
    status: 'active',
    expiryDate: '2025-02-20',
    createdDate: '2024-02-20',
    lastActivity: '2024-08-20'
  },
  {
    id: 'org-4',
    name: 'Emily Carter Counseling',
    type: 'practitioner',
    contactName: 'Emily Carter',
    contactEmail: 'emily.carter@counseling.com',
    seatsAllocated: 30,
    seatsUsed: 0,
    status: 'expired',
    expiryDate: '2024-06-15',
    createdDate: '2024-01-01',
    lastActivity: '2024-06-10'
  },
  {
    id: 'org-5',
    name: 'Marcus Thompson Therapy',
    type: 'practitioner',
    contactName: 'Marcus Thompson',
    contactEmail: 'marcus.thompson@therapy.com',
    seatsAllocated: 20,
    seatsUsed: 0,
    status: 'deactivated',
    expiryDate: '2024-12-31',
    createdDate: '2024-05-10',
    lastActivity: '2024-07-15'
  },
  {
    id: 'org-6',
    name: 'Riverside Elementary School',
    type: 'group',
    contactName: 'Jennifer Martinez',
    contactEmail: 'jennifer.martinez@riverside-elementary.edu',
    seatsAllocated: 200,
    seatsUsed: 156,
    status: 'active',
    expiryDate: '2025-04-30',
    createdDate: '2024-04-30',
    lastActivity: '2024-08-23'
  }
]