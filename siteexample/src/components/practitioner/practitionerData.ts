import { PractitionerWithAssignments } from './types'

export const DEMO_PRACTITIONER_DATA: Record<string, PractitionerWithAssignments> = {
  'pract-1': {
    id: 'pract-1',
    name: 'Sarah Johnson',
    email: 'sarah.johnson@demoschool.com',
    phone: '+44 7700 900123',
    status: 'active',
    invitedDate: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
    lastLogin: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
    childrenCount: 8,
    children: [
      { id: 'child-1', name: 'Emma Thompson', status: 'fine', lastCheckIn: '2 hours ago' },
      { id: 'child-2', name: 'James Wilson', status: 'needs_attention', lastCheckIn: '1 day ago' },
      { id: 'child-3', name: 'Sophie Chen', status: 'flagged', lastCheckIn: '4 hours ago' },
      { id: 'child-4', name: 'Oliver Brown', status: 'fine', lastCheckIn: '3 hours ago' },
      { id: 'child-5', name: 'Lily Davis', status: 'fine', lastCheckIn: '1 day ago' },
      { id: 'child-6', name: 'Max Taylor', status: 'needs_attention', lastCheckIn: '2 days ago' },
      { id: 'child-7', name: 'Chloe Wilson', status: 'fine', lastCheckIn: '1 day ago' },
      { id: 'child-8', name: 'Ryan Clarke', status: 'fine', lastCheckIn: '5 hours ago' }
    ],
    availablePractitioners: [
      { id: 'pract-2', name: 'Michael Chen' },
      { id: 'pract-4', name: 'David Brown' }
    ]
  },
  'pract-2': {
    id: 'pract-2',
    name: 'Michael Chen',
    email: 'michael.chen@demoschool.com',
    phone: '+44 7700 900124',
    status: 'active',
    invitedDate: new Date(Date.now() - 45 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
    lastLogin: new Date(Date.now() - 1 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
    childrenCount: 4,
    children: [
      { id: 'child-9', name: 'Alice Johnson', status: 'fine', lastCheckIn: '3 hours ago' },
      { id: 'child-10', name: 'Ben Williams', status: 'fine', lastCheckIn: '1 day ago' },
      { id: 'child-11', name: 'Grace Lee', status: 'needs_attention', lastCheckIn: '2 days ago' },
      { id: 'child-12', name: 'Lucas Smith', status: 'fine', lastCheckIn: '3 hours ago' }
    ],
    availablePractitioners: [
      { id: 'pract-1', name: 'Sarah Johnson' },
      { id: 'pract-4', name: 'David Brown' }
    ]
  },
  'pract-3': {
    id: 'pract-3',
    name: 'Emma Williams',
    email: 'emma.williams@demoschool.com',
    status: 'pending',
    invitedDate: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
    childrenCount: 0,
    children: [],
    availablePractitioners: [
      { id: 'pract-1', name: 'Sarah Johnson' },
      { id: 'pract-2', name: 'Michael Chen' },
      { id: 'pract-4', name: 'David Brown' }
    ]
  },
  'pract-4': {
    id: 'pract-4',
    name: 'David Brown',
    email: 'david.brown@demoschool.com',
    phone: '+44 7700 900125',
    status: 'active',
    invitedDate: new Date(Date.now() - 90 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
    lastLogin: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
    childrenCount: 3,
    children: [
      { id: 'child-13', name: 'Maya Patel', status: 'fine', lastCheckIn: '1 day ago' },
      { id: 'child-14', name: 'Jack Murphy', status: 'flagged', lastCheckIn: '4 hours ago' },
      { id: 'child-15', name: 'Zoe Garcia', status: 'fine', lastCheckIn: '2 days ago' }
    ],
    availablePractitioners: [
      { id: 'pract-1', name: 'Sarah Johnson' },
      { id: 'pract-2', name: 'Michael Chen' }
    ]
  }
}