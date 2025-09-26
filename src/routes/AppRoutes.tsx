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
import { StatusPage } from '../components/marketing/StatusPage'

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
import { WellbeingSuccessPage } from '../pages/WellbeingSuccessPage'
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
import CheckinProgressViz from '../components/analytics/CheckinProgressViz'
import { LottieLoaderDemo } from '../pages/test/LottieLoaderDemo'

// Check-in Flow Components
import { CheckInHome } from '../components/checkin/CheckInHome'
import { CheckInFlow } from '../components/checkin/CheckInFlow'
import { GardenPage } from '../pages/GardenPage'

export function AppRoutes() {
  const { user } = React.useContext(AuthContext)
  const location = useLocation()
  
  // Determine if we're in a child-specific route (more specific matching)
  const isChildApp = location.pathname.startsWith('/child/') || location.pathname === '/child/onboarding' || location.pathname.startsWith('/checkin/')
  const isMarketingApp = ['/', '/about', '/how-it-works', '/pricing', '/contact', '/waitlist', '/legal', '/sitemap', '/status'].some(path =>
    location.pathname === path || location.pathname.startsWith('/legal')
  )
  const isAuthApp = ['/login', '/admin/login'].includes(location.pathname)
  
  // Show navigation for demo mode - always show on admin/dashboard routes
  const showNavigation = !isChildApp && !isMarketingApp && !isAuthApp
  
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
        <Route path="/status" element={<StatusPage />} />
        <Route path="/legal" element={<Legal />} />
        <Route path="/legal/terms" element={<Legal section="terms" />} />
        <Route path="/legal/privacy" element={<Legal section="privacy" />} />
        <Route path="/sitemap" element={<Sitemap />} />
        
        {/* Auth Routes */}
        <Route path="/login" element={<UnifiedLoginPage />} />
        
        {/* Practitioner/GroupContact Routes - Demo accessible */}
        <Route path="/dashboard" element={<PractitionerDashboard />} />
        
        {/* Child management routes - Demo accessible */}
        <Route path="/children/add" element={<AddChild />} />
        <Route path="/children/bulk-import" element={<BulkImportChildren />} />
        <Route path="/children/:id" element={<ChildProfile />} />
        <Route path="/children/:id/edit" element={<EditChild />} />
        
        {/* Practitioner management routes - Demo accessible */}
        <Route path="/invite/practitioner" element={<InvitePractitioner />} />
        <Route path="/practitioners" element={<ManagePractitioners />} />
        <Route path="/practitioners/:id/manage" element={<PractitionerManagement />} />
        <Route path="/profile" element={<UserProfile />} />
        
        {/* Child Routes - Demo accessible */}
        <Route path="/child/onboarding" element={<ChildOnboarding />} />
        <Route path="/child/home" element={<ChildHome />} />
        <Route path="/child/breathing" element={<BreathingRoute />} />
        <Route path="/child/check-in/wheel" element={<WellbeingWheel />} />
        <Route path="/child/check-in/success" element={<WellbeingSuccessPage />} />
        <Route path="/child/check-in/garden" element={<MyGarden />} />
        <Route path="/child/check-in/wrap-up" element={<WrapUp />} />
        <Route path="/child/stickers" element={<StickerBook />} />
        <Route path="/child/community" element={<Community />} />
        
        {/* Admin Routes - Demo accessible */}
        <Route path="/admin/login" element={<AdminLoginPage />} />

        <Route path="/admin" element={<AdminDashboard />} />
        
        <Route path="/admin/clients/new" element={<CreateClient />} />
        <Route path="/admin/clients/:id" element={<ClientDetails />} />
        <Route path="/admin/clients/:id/edit" element={<EditClient />} />
        <Route path="/admin/waitlist" element={<WaitlistManagement />} />

        {/* Check-in Flow Routes - Public access for prototypes */}
        <Route path="/checkin/home" element={<CheckInHome />} />
        <Route path="/checkin/flow/:step" element={<CheckInFlow />} />
        <Route path="/checkin/garden" element={<GardenPage />} />

        {/* Prototypes Route - No authentication required */}
        <Route path="/prototypes" element={<PrototypesPage />} />
        <Route path="/test/data-hierarchy" element={<DataHierarchy />} />
        <Route path="/test/analytics" element={<CheckinProgressViz />} />
        <Route path="/test/lottie-loader" element={<LottieLoaderDemo />} />

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