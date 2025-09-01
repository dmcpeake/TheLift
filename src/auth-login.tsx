import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import './index.css'
import { UnifiedLoginPage } from './components/auth/UnifiedLoginPage'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter>
      <UnifiedLoginPage />
    </BrowserRouter>
  </React.StrictMode>,
)