import React from 'react'
import { Routes, Route, Navigate } from 'react-router-dom'
import { ProtectedRoute } from './ProtectedRoute'
import { UnifiedLoginPage } from '../components/auth/UnifiedLoginPage'
import { AdminLoginPage } from '../components/auth/AdminLoginPage'
import { AdminDashboard } from '../components/admin/AdminDashboard'
import { CreateClient } from '../components/admin/CreateClient'
import { ClientDetails } from '../components/admin/ClientDetails'
import { PractitionerDashboard } from '../components/practitioner/PractitionerDashboard'
import { AddChild } from '../components/practitioner/AddChild'
import { ChildProfile } from '../components/practitioner/ChildProfile'
import { ChildHome } from '../components/child/ChildHome'
import { ChildOnboarding } from '../components/child/ChildOnboarding'

export function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<Navigate to="/login" replace />} />
      <Route path="/login" element={<UnifiedLoginPage />} />
      <Route path="/admin/login" element={<AdminLoginPage />} />
      
      <Route path="/admin" element={
        <ProtectedRoute requiredRole="Account">
          <AdminDashboard />
        </ProtectedRoute>
      } />
      
      <Route path="/admin/clients/new" element={
        <ProtectedRoute requiredRole="Account">
          <CreateClient />
        </ProtectedRoute>
      } />
      
      <Route path="/admin/clients/:id" element={
        <ProtectedRoute requiredRole="Account">
          <ClientDetails />
        </ProtectedRoute>
      } />
      
      <Route path="/dashboard" element={
        <ProtectedRoute requiredRoles={['Practitioner', 'GroupContact']}>
          <PractitionerDashboard />
        </ProtectedRoute>
      } />
      
      <Route path="/children/add" element={
        <ProtectedRoute requiredRoles={['Practitioner', 'GroupContact']}>
          <AddChild />
        </ProtectedRoute>
      } />
      
      <Route path="/children/:id" element={
        <ProtectedRoute requiredRoles={['Practitioner', 'GroupContact']}>
          <ChildProfile />
        </ProtectedRoute>
      } />
      
      <Route path="/child/onboarding" element={
        <ProtectedRoute requiredRole="Child">
          <ChildOnboarding />
        </ProtectedRoute>
      } />
      
      <Route path="/child/home" element={
        <ProtectedRoute requiredRole="Child">
          <ChildHome />
        </ProtectedRoute>
      } />
    </Routes>
  )
}