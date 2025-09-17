import React from 'react'
import { Routes, Route, Navigate, useLocation } from 'react-router-dom'
import { AuthContext } from '../utils/auth/context'
import { ProtectedRoute } from '../components/auth/ProtectedRoute'
import { Navigation } from '../components/shared/Navigation'

// Auth Components
import { UnifiedLoginPage } from '../components/auth/UnifiedLoginPage'

// Marketing Components  
import { MarketingHome } from '../components/marketing/MarketingHome'
import { About } from '../components/marketing/About'
import { HowItWorks } from '../components/marketing/HowItWorks'
import { Pricing } from '../components/marketing/Pricing'
import { Contact } from '../components/marketing/Contact'
import { Waitlist } from '../components/marketing/Waitlist'
import { Legal } from '../components/marketing/Legal'
import { Sitemap } from '../components/marketing/Sitemap'

// Practitioner Components
import { PractitionerDashboard } from '../components/practitioner/PractitionerDashboard'
import { AddChild } from '../components/practitioner/AddChild'
import { EditChild } from '../components/practitioner/EditChild'
import { BulkImportChildren } from '../components/practitioner/BulkImportChildren'
import { ChildProfile } from '../components/practitioner/ChildProfile'
import { InvitePractitioner } from '../components/practitioner/InvitePractitioner'
import { ManagePractitioners } from '../components/practitioner/ManagePractitioners'
import { PractitionerManagement } from '../components/practitioner/PractitionerManagement'
import { UserProfile } from '../components/shared/UserProfile'

// Child Components
import { ChildHome } from '../components/child/ChildHome'
import { ChildOnboarding } from '../components/child/ChildOnboarding'
import { BreathingRoute } from '../components/breathing/BreathingRoute'
import { WellbeingWheel } from '../components/child/WellbeingWheel'
import { MyGarden } from '../components/child/MyGarden'
import { WrapUp } from '../components/child/WrapUp'
import { StickerBook } from '../components/child/StickerBook'
import { Community } from '../components/child/Community'

// Admin Components
import { AdminDashboard } from '../components/admin/AdminDashboard'
import { AdminLoginPage } from '../components/admin/AdminLoginPage'
import { CreateClient } from '../components/admin/CreateClient'
import { ClientDetails } from '../components/admin/ClientDetails'
import { EditClient } from '../components/admin/EditClient'
import { WaitlistManagement } from '../components/admin/WaitlistManagement'

// Test Components (for designer testing)
import { PrototypesPage } from '../components/prototypes/PrototypesPage'
import { DataHierarchy } from '../components/prototypes/DataHierarchy'
import { CheckinProgressViz } from '../components/analytics/CheckinProgressViz'

// Check-in Flow Components
import { CheckInHome } from '../components/checkin/CheckInHome'
import { CheckInFlow } from '../components/checkin/CheckInFlow'

export function AppRoutes() {
  const { user } = React.useContext(AuthContext)
  const location = useLocation()
  
  // Determine if we're in a child-specific route (more specific matching)
  const isChildApp = location.pathname.startsWith('/child/') || location.pathname === '/child/onboarding' || location.pathname.startsWith('/checkin/')
  const isMarketingApp = ['/', '/about', '/how-it-works', '/pricing', '/contact', '/waitlist', '/legal', '/sitemap'].some(path =>
    location.pathname === path || location.pathname.startsWith('/legal')
  )
  const isAuthApp = ['/login', '/admin/login'].includes(location.pathname)
  
  // Show navigation for authenticated users on non-child, non-marketing, and non-auth routes
  const showNavigation = user && !isChildApp && !isMarketingApp && !isAuthApp
  
  return (
    <div className="min-h-screen bg-gray-50">
      {showNavigation && <Navigation />}
      
      <Routes>
        {/* Marketing Routes */}
        <Route path="/" element={<MarketingHome />} />
        <Route path="/about" element={<About />} />
        <Route path="/how-it-works" element={<HowItWorks />} />
        <Route path="/pricing" element={<Pricing />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/waitlist" element={<Waitlist />} />
        <Route path="/legal" element={<Legal />} />
        <Route path="/legal/terms" element={<Legal section="terms" />} />
        <Route path="/legal/privacy" element={<Legal section="privacy" />} />
        <Route path="/sitemap" element={<Sitemap />} />
        
        {/* Auth Routes */}
        <Route path="/login" element={<UnifiedLoginPage />} />
        
        {/* Practitioner/GroupContact Routes */}
        <Route path="/dashboard" element={
          <ProtectedRoute allowedRoles={['Practitioner', 'GroupContact']}>
            <PractitionerDashboard />
          </ProtectedRoute>
        } />
        
        {/* Child management routes */}
        <Route path="/children/add" element={
          <ProtectedRoute allowedRoles={['Practitioner', 'GroupContact']}>
            <AddChild />
          </ProtectedRoute>
        } />
        
        <Route path="/children/bulk-import" element={
          <ProtectedRoute allowedRoles={['Practitioner', 'GroupContact']}>
            <BulkImportChildren />
          </ProtectedRoute>
        } />
        
        <Route path="/children/:id" element={
          <ProtectedRoute allowedRoles={['Practitioner', 'GroupContact']}>
            <ChildProfile />
          </ProtectedRoute>
        } />
        
        <Route path="/children/:id/edit" element={
          <ProtectedRoute allowedRoles={['Practitioner', 'GroupContact']}>
            <EditChild />
          </ProtectedRoute>
        } />
        
        {/* Admin-only routes for GroupContact */}
        <Route path="/invite/practitioner" element={
          <ProtectedRoute allowedRoles={['GroupContact']}>
            <InvitePractitioner />
          </ProtectedRoute>
        } />
        
        <Route path="/practitioners" element={
          <ProtectedRoute allowedRoles={['GroupContact']}>
            <ManagePractitioners />
          </ProtectedRoute>
        } />
        
        <Route path="/practitioners/:id/manage" element={
          <ProtectedRoute allowedRoles={['GroupContact']}>
            <PractitionerManagement />
          </ProtectedRoute>
        } />

        <Route path="/profile" element={
          <ProtectedRoute allowedRoles={['Account', 'GroupContact', 'Practitioner', 'Child']}>
            <UserProfile />
          </ProtectedRoute>
        } />
        
        {/* Child Routes */}
        <Route path="/child/onboarding" element={
          <ProtectedRoute allowedRoles={['Child']}>
            <ChildOnboarding />
          </ProtectedRoute>
        } />
        
        <Route path="/child/home" element={
          <ProtectedRoute allowedRoles={['Child']}>
            <ChildHome />
          </ProtectedRoute>
        } />
        
        <Route path="/child/breathing" element={
          <ProtectedRoute allowedRoles={['Child', 'Practitioner', 'GroupContact']}>
            <BreathingRoute />
          </ProtectedRoute>
        } />
        
        <Route path="/child/check-in/wheel" element={
          <ProtectedRoute allowedRoles={['Child', 'Practitioner', 'GroupContact']}>
            <WellbeingWheel />
          </ProtectedRoute>
        } />
        
        <Route path="/child/check-in/garden" element={
          <ProtectedRoute allowedRoles={['Child', 'Practitioner', 'GroupContact']}>
            <MyGarden />
          </ProtectedRoute>
        } />
        
        <Route path="/child/check-in/wrap-up" element={
          <ProtectedRoute allowedRoles={['Child', 'Practitioner', 'GroupContact']}>
            <WrapUp />
          </ProtectedRoute>
        } />
        
        <Route path="/child/stickers" element={
          <ProtectedRoute allowedRoles={['Child']}>
            <StickerBook />
          </ProtectedRoute>
        } />
        
        <Route path="/child/community" element={
          <ProtectedRoute allowedRoles={['Child']}>
            <Community />
          </ProtectedRoute>
        } />
        
        {/* Admin Routes */}
        <Route path="/admin/login" element={<AdminLoginPage />} />
        
        <Route path="/admin" element={
          <ProtectedRoute allowedRoles={['Account']}>
            <AdminDashboard />
          </ProtectedRoute>
        } />
        
        <Route path="/admin/clients/new" element={
          <ProtectedRoute allowedRoles={['Account']}>
            <CreateClient />
          </ProtectedRoute>
        } />
        
        <Route path="/admin/clients/:id" element={
          <ProtectedRoute allowedRoles={['Account']}>
            <ClientDetails />
          </ProtectedRoute>
        } />
        
        <Route path="/admin/clients/:id/edit" element={
          <ProtectedRoute allowedRoles={['Account']}>
            <EditClient />
          </ProtectedRoute>
        } />
        
        <Route path="/admin/waitlist" element={
          <ProtectedRoute allowedRoles={['Account']}>
            <WaitlistManagement />
          </ProtectedRoute>
        } />

        {/* Check-in Flow Routes - Public access for prototypes */}
        <Route path="/checkin/home" element={<CheckInHome />} />
        <Route path="/checkin/flow/:step" element={<CheckInFlow />} />

        {/* Prototypes Route - No authentication required */}
        <Route path="/prototypes" element={<PrototypesPage />} />
        <Route path="/test/data-hierarchy" element={<DataHierarchy />} />
        <Route path="/test/analytics" element={<CheckinProgressViz />} />

        {/* Unauthorized route */}
        <Route path="/unauthorized" element={
          <div className="min-h-screen flex items-center justify-center bg-gray-50">
            <div className="text-center">
              <h1 className="text-2xl font-bold text-gray-900 mb-4">Access Denied</h1>
              <p className="text-gray-600 mb-4">You don't have permission to access this page.</p>
              <button 
                onClick={() => window.history.back()} 
                className="bg-gray-900 text-white px-4 py-2 rounded hover:bg-gray-700"
              >
                Go Back
              </button>
            </div>
          </div>
        } />
        
        {/* Catch all route */}
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
    </div>
  )
}