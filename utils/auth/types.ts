export type UserRole = 'Account' | 'GroupContact' | 'Practitioner' | 'Child'
export type UserMode = 'admin' | 'practitioner'

export interface UserProfile {
  id: string
  email: string
  name: string
  role: UserRole
  org_id?: string
  status: 'active' | 'inactive' | 'pending' | 'suspended'
  avatar_url?: string
}

export interface User {
  id: string
  email: string
  access_token: string
  profile: UserProfile
}

export interface AuthContextType {
  user: User | null
  setUser: (user: User | null) => void
  loading: boolean
  logout: () => Promise<void>
  currentMode: UserMode
  toggleMode: () => void
}