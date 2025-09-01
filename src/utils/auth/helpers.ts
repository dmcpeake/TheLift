import { projectId } from '../supabase/info'
import { User } from './types'

export const fetchUserProfile = async (accessToken: string, userId: string, userEmail: string): Promise<User> => {
  try {
    const response = await fetch(`https://${projectId}.supabase.co/functions/v1/server/auth/profile`, {
      headers: {
        'Authorization': `Bearer ${accessToken}`,
        'Content-Type': 'application/json',
      },
    })

    if (response.ok) {
      const userData = await response.json()
      // Map old LiftStaff role to new Account role for backwards compatibility
      if (userData.profile?.role === 'LiftStaff') {
        userData.profile.role = 'Account'
      }
      return userData
    } else {
      console.warn('Server unavailable, using fallback profile')
      return createFallbackUser(userId, userEmail)
    }
  } catch (error) {
    console.error('Error fetching profile, using fallback:', error)
    return createFallbackUser(userId, userEmail)
  }
}

export const createFallbackUser = (userId: string, userEmail: string): User => {
  // Assign role based on email for test users
  let fallbackRole: User['profile']['role'] = 'Practitioner'
  if (userEmail === 'admin@thelift.com') {
    fallbackRole = 'Account'
  } else if (userEmail === 'contact@demoschool.com') {
    fallbackRole = 'GroupContact'
  } else if (userEmail === 'child@demoschool.com') {
    fallbackRole = 'Child'
  }
  
  return {
    id: userId,
    email: userEmail,
    profile: {
      id: userId,
      name: userEmail.split('@')[0] || 'User',
      role: fallbackRole,
      orgId: 'default-org',
      status: 'active'
    }
  }
}

export const getNavigationPathForRole = (role: User['profile']['role']): string => {
  switch (role) {
    case 'Account':
      return '/admin'
    case 'GroupContact':
    case 'Practitioner':
      return '/dashboard'
    case 'Child':
      return '/child/home'
    default:
      return '/dashboard'
  }
}

export const getDefaultModeForRole = (role: User['profile']['role']): 'admin' | 'practitioner' => {
  switch (role) {
    case 'Account':
      return 'admin'
    case 'GroupContact':
      return 'practitioner'
    case 'Practitioner':
      return 'practitioner'
    case 'Child':
      return 'admin' // Not relevant for children
    default:
      return 'admin'
  }
}