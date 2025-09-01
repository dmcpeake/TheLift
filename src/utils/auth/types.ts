export interface User {
  id: string
  email: string
  profile: {
    id: string
    name: string
    role: 'Account' | 'GroupContact' | 'Practitioner' | 'Child'
    orgId?: string
    status: string
  }
}

export type UserMode = 'admin' | 'practitioner'

export interface AuthContextType {
  user: User | null
  setUser: (user: User | null) => void
  loading: boolean
  logout: () => void
  currentMode: UserMode
  toggleMode: () => void
}