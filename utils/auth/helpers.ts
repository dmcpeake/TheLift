import { User, UserProfile, UserRole, UserMode } from './types'
import { supabaseUrl } from '../supabase/info'

export async function fetchUserProfile(
  accessToken: string, 
  userId: string, 
  email: string
): Promise<User> {
  try {
    const response = await fetch(`${supabaseUrl}/functions/v1/make-server-a1855b25/users/profile`, {
      headers: {
        'Authorization': `Bearer ${accessToken}`,
        'Content-Type': 'application/json'
      }
    })
    
    if (response.ok) {
      const profileData = await response.json()
      
      const profile: UserProfile = {
        id: userId,
        email: email,
        name: profileData.name || email.split('@')[0],
        role: profileData.role || 'Practitioner',
        org_id: profileData.org_id,
        status: profileData.status || 'active',
        avatar_url: profileData.avatar_url
      }
      
      return {
        id: userId,
        email: email,
        access_token: accessToken,
        profile: profile
      }
    } else {
      throw new Error('Failed to fetch user profile')
    }
  } catch (error) {
    console.error('Error fetching user profile:', error)
    
    const profile: UserProfile = {
      id: userId,
      email: email,
      name: email.split('@')[0],
      role: 'Practitioner',
      status: 'active'
    }
    
    return {
      id: userId,
      email: email,
      access_token: accessToken,
      profile: profile
    }
  }
}

export function getNavigationPathForRole(role: UserRole): string {
  switch (role) {
    case 'Account':
      return '/admin'
    case 'Child':
      return '/child/home'
    default:
      return '/dashboard'
  }
}

export function getDefaultModeForRole(role: UserRole): UserMode {
  return role === 'Account' ? 'admin' : 'practitioner'
}