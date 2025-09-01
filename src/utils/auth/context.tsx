import React from 'react'
import { AuthContextType } from './types'

export const AuthContext = React.createContext<AuthContextType>({
  user: null,
  setUser: () => {},
  loading: true,
  logout: () => {},
  currentMode: 'admin',
  toggleMode: () => {}
})