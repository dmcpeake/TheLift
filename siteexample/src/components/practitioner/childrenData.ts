export interface Child {
  id: string
  name: string
  lastCheckIn: string
  status: 'fine' | 'needs_attention' | 'flagged'
  practitioner?: string
  practitionerId?: string
}

export const adminModeChildren: Child[] = [
  {
    id: 'child-1',
    name: 'Emma Thompson',
    lastCheckIn: '2 hours ago',
    status: 'fine',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-2',
    name: 'James Wilson',
    lastCheckIn: '1 day ago',
    status: 'needs_attention',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-3',
    name: 'Sophie Chen',
    lastCheckIn: '4 hours ago',
    status: 'flagged',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-4',
    name: 'Oliver Brown',
    lastCheckIn: '3 hours ago',
    status: 'fine',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-5',
    name: 'Lily Davis',
    lastCheckIn: '1 day ago',
    status: 'fine',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-6',
    name: 'Max Taylor',
    lastCheckIn: '2 days ago',
    status: 'needs_attention',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-7',
    name: 'Chloe Wilson',
    lastCheckIn: '1 day ago',
    status: 'fine',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-8',
    name: 'Ryan Clarke',
    lastCheckIn: '5 hours ago',
    status: 'fine',
    practitioner: 'Sarah Johnson',
    practitionerId: 'pract-1'
  },
  {
    id: 'child-9',
    name: 'Alice Johnson',
    lastCheckIn: '3 hours ago',
    status: 'fine',
    practitioner: 'Michael Chen',
    practitionerId: 'pract-2'
  },
  {
    id: 'child-10',
    name: 'Ben Williams',
    lastCheckIn: '1 day ago',
    status: 'fine',
    practitioner: 'Michael Chen',
    practitionerId: 'pract-2'
  },
  {
    id: 'child-11',
    name: 'Grace Lee',
    lastCheckIn: '2 days ago',
    status: 'needs_attention',
    practitioner: 'Michael Chen',
    practitionerId: 'pract-2'
  },
  {
    id: 'child-12',
    name: 'Lucas Smith',
    lastCheckIn: '6 hours ago',
    status: 'fine',
    practitioner: 'Michael Chen',
    practitionerId: 'pract-2'
  },
  {
    id: 'child-13',
    name: 'Maya Patel',
    lastCheckIn: '4 hours ago',
    status: 'fine',
    practitioner: 'David Brown',
    practitionerId: 'pract-4'
  },
  {
    id: 'child-14',
    name: 'Jack Murphy',
    lastCheckIn: '1 day ago',
    status: 'flagged',
    practitioner: 'David Brown',
    practitionerId: 'pract-4'
  },
  {
    id: 'child-15',
    name: 'Zoe Garcia',
    lastCheckIn: '2 hours ago',
    status: 'fine',
    practitioner: 'David Brown',
    practitionerId: 'pract-4'
  },
  {
    id: 'child-16',
    name: 'Tom Wilson',
    lastCheckIn: 'Never',
    status: 'needs_attention',
    practitioner: 'Unassigned'
  },
  {
    id: 'child-17',
    name: 'Sarah Davis',
    lastCheckIn: 'Never',
    status: 'fine',
    practitioner: 'Unassigned'
  }
]

export const practitionerModeChildren: Child[] = [
  {
    id: 'child-1',
    name: 'Emma Thompson',
    lastCheckIn: '2 hours ago',
    status: 'fine'
  },
  {
    id: 'child-2',
    name: 'James Wilson',
    lastCheckIn: '1 day ago',
    status: 'needs_attention'
  },
  {
    id: 'child-3',
    name: 'Sophie Chen',
    lastCheckIn: '4 hours ago',
    status: 'flagged'
  },
  {
    id: 'child-4',
    name: 'Oliver Brown',
    lastCheckIn: '3 hours ago',
    status: 'fine'
  },
  {
    id: 'child-5',
    name: 'Lily Davis',
    lastCheckIn: '1 day ago',
    status: 'fine'
  },
  {
    id: 'child-6',
    name: 'Max Taylor',
    lastCheckIn: '2 days ago',
    status: 'needs_attention'
  },
  {
    id: 'child-7',
    name: 'Chloe Wilson',
    lastCheckIn: '1 day ago',
    status: 'fine'
  },
  {
    id: 'child-8',
    name: 'Ryan Clarke',
    lastCheckIn: '5 hours ago',
    status: 'fine'
  }
]