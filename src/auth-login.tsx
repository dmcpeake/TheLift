import React from 'react'
import ReactDOM from 'react-dom/client'
import AuthLogin from '../components/auth/LoginPage'
import '../styles/globals.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <AuthLogin />
  </React.StrictMode>,
)