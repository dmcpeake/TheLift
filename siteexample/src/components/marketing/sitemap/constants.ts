import { 
  Home, 
  Users, 
  UserCheck, 
  Baby, 
  Shield,
  Settings,
  Heart,
  User,
  Building
} from 'lucide-react'

export const SITEMAP_SECTIONS = {
  MARKETING: {
    title: 'Marketing & Public Pages',
    icon: Home,
    pages: [
      { name: 'Home', path: '/' },
      { name: 'About', path: '/about' },
      { name: 'How It Works', path: '/how-it-works' },
      { name: 'Pricing', path: '/pricing' },
      { name: 'Contact', path: '/contact' },
      { name: 'Legal', path: '/legal' },
      { name: 'Privacy', path: '/legal/privacy' },
      { name: 'Terms', path: '/legal/terms' }
    ]
  },

  AUTHENTICATION: {
    title: 'Authentication Flow',
    icon: UserCheck,
    flows: [
      { name: 'Unified Login', path: '/login', description: 'Child, Practitioner, Group Contact', style: 'blue' },
      { name: 'Admin Login', path: '/admin/login', description: 'Account level only', style: 'red' },
      { name: 'Unauthorised', path: '/unauthorized', description: '', style: 'gray' }
    ]
  },

  ADMIN: {
    title: 'Admin Dashboard Flow (Account Role)',
    icon: Shield,
    mainPage: { name: 'Admin Dashboard', path: '/admin' },
    subPages: [
      { name: 'Create Client', path: '/admin/clients/new' },
      { name: 'Client Details', path: '/admin/clients/:id' },
      { name: 'Edit Client', path: '/admin/clients/:id/edit' }
    ]
  },

  PRACTITIONER: {
    title: 'Practitioner & Group Contact Flow',
    icon: Users,
    mainPage: { name: 'Practitioner Dashboard', path: '/dashboard' },
    childManagement: {
      title: 'Child Management',
      pages: [
        { name: 'Add Child', path: '/children/add' },
        { name: 'Bulk Import', path: '/children/bulk-import' },
        { name: 'Child Profile', path: '/children/:id' }
      ]
    },
    groupContactOnly: {
      title: 'Group Contact Only (Admin Functions)',
      pages: [
        { name: 'Invite Practitioner', path: '/invite/practitioner' },
        { name: 'Manage Practitioners', path: '/practitioners' },
        { name: 'Practitioner Management', path: '/practitioners/:id/manage' }
      ]
    },
    sharedProfile: { name: 'User Profile', path: '/profile', description: 'All authenticated users' }
  },

  CHILD: {
    title: 'Child Experience Flow',
    icon: Baby,
    onboarding: { name: 'Child Onboarding', path: '/child/onboarding' },
    home: { name: 'Child Home', path: '/child/home' },
    checkinFlow: {
      title: 'Wellbeing Check-in Flow',
      steps: [
        { name: 'Wellbeing Wheel', path: '/child/check-in/wheel', step: 'Step 1' },
        { name: 'My Garden', path: '/child/check-in/garden', step: 'Step 2' },
        { name: 'Wrap Up', path: '/child/check-in/wrap-up', step: 'Step 3' }
      ]
    },
    additionalFeatures: {
      title: 'Additional Child Features',
      pages: [
        { name: 'Sticker Book', path: '/child/stickers' },
        { name: 'Community', path: '/child/community' }
      ]
    }
  },

  ROLES: {
    title: 'User Roles & Access Summary',
    icon: Settings,
    roles: [
      {
        name: 'Account',
        icon: Shield,
        color: 'red',
        permissions: [
          'Admin dashboard',
          'Client management',
          'Full platform oversight',
          'Separate login flow'
        ]
      },
      {
        name: 'Group Contact',
        icon: Building,
        color: 'orange',
        permissions: [
          'All practitioner features',
          'Invite practitioners',
          'Manage team',
          'Organisation admin'
        ]
      },
      {
        name: 'Practitioner',
        icon: User,
        color: 'blue',
        permissions: [
          'Child management',
          'Wellbeing monitoring',
          'Data entry & review',
          'Limited admin access'
        ]
      },
      {
        name: 'Child',
        icon: Heart,
        color: 'pink',
        permissions: [
          'Wellbeing check-ins',
          'Interactive activities',
          'Sticker rewards',
          'Safe community features'
        ]
      }
    ]
  }
}