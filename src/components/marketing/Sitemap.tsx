import React from 'react'
import { Link } from 'react-router-dom'
import { Button } from '../ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { MarketingNavigation } from './MarketingNavigation'
import { 
  Home, Users, UserCheck, Baby, Shield, Settings, ArrowRight, 
  FileText, PlusCircle, Edit, Trash, Archive, UserPlus, 
  BarChart, BookOpen, Star, Sticker, MessageCircle,
  Download, Upload, RotateCcw, Key, LogIn, LogOut
} from 'lucide-react'

interface PageNode {
  name: string
  route: string
  icon?: React.ReactNode
  description?: string
  children?: PageNode[]
  connectedTo?: string[]
}

interface FlowConnection {
  from: string
  to: string
  label?: string
  condition?: string
}

const PageBox: React.FC<{ 
  page: PageNode, 
  bgColor?: string, 
  showConnections?: boolean,
  connections?: string[]
}> = ({ page, bgColor = "bg-white", showConnections = false, connections = [] }) => (
  <div className={`border-2 border-gray-300 rounded-lg p-3 ${bgColor} relative`}>
    <div className="flex items-center gap-2 mb-1">
      {page.icon}
      <div className="font-medium text-sm">{page.name}</div>
    </div>
    <div className="text-xs text-gray-500 mb-1">{page.route}</div>
    {page.description && (
      <div className="text-xs text-gray-600 italic">{page.description}</div>
    )}
    {showConnections && connections.length > 0 && (
      <div className="mt-2 text-xs text-blue-600">
        <div className="font-medium">Connects to:</div>
        {connections.map((conn, idx) => (
          <div key={idx} className="flex items-center gap-1">
            <ArrowRight className="h-3 w-3" />
            {conn}
          </div>
        ))}
      </div>
    )}
  </div>
)

export function Sitemap() {
  const marketingPages: PageNode[] = [
    { name: "Marketing Home", route: "/", icon: <Home className="h-4 w-4" />, description: "Landing page with value proposition" },
    { name: "About", route: "/about", icon: <FileText className="h-4 w-4" />, description: "Company information and mission" },
    { name: "How It Works", route: "/how-it-works", icon: <BookOpen className="h-4 w-4" />, description: "Platform explanation" },
    { name: "Pricing", route: "/pricing", icon: <Star className="h-4 w-4" />, description: "Subscription plans and pricing" },
    { name: "Contact", route: "/contact", icon: <MessageCircle className="h-4 w-4" />, description: "Contact form and support" },
    { name: "Legal", route: "/legal", icon: <Shield className="h-4 w-4" />, description: "Terms, privacy, policies" },
    { name: "Sitemap", route: "/sitemap", icon: <BarChart className="h-4 w-4" />, description: "This comprehensive map" }
  ]

  const authPages: PageNode[] = [
    { name: "Unified Login", route: "/login", icon: <LogIn className="h-4 w-4" />, description: "Role-based login selector" },
    { name: "Admin Login", route: "/admin/login", icon: <Shield className="h-4 w-4" />, description: "Admin authentication" },
    { name: "Child Login", route: "/child/login", icon: <Key className="h-4 w-4" />, description: "Username/PIN authentication" },
    { name: "Signup", route: "/signup", icon: <UserPlus className="h-4 w-4" />, description: "New user registration" },
    { name: "Dashboard Redirect", route: "/dashboard", icon: <ArrowRight className="h-4 w-4" />, description: "Role-based routing hub" }
  ]

  const adminPages: PageNode[] = [
    { name: "Admin Dashboard", route: "/admin", icon: <Shield className="h-4 w-4" />, description: "Overview and metrics" },
    { name: "Clients List", route: "/admin/clients", icon: <Users className="h-4 w-4" />, description: "All client accounts" },
    { name: "Create Client", route: "/admin/clients/new", icon: <PlusCircle className="h-4 w-4" />, description: "Onboard new client" },
    { name: "Client Details", route: "/admin/clients/:id", icon: <FileText className="h-4 w-4" />, description: "Client overview and stats" },
    { name: "Edit Client", route: "/admin/clients/:id/edit", icon: <Edit className="h-4 w-4" />, description: "Modify client settings" },
    { name: "Client Management", route: "/admin/clients/:id/manage", icon: <Settings className="h-4 w-4" />, description: "Bulk actions and tools" }
  ]

  const practitionerPages: PageNode[] = [
    { name: "Practitioner Dashboard", route: "/practitioner", icon: <Users className="h-4 w-4" />, description: "Overview and quick actions" },
    { name: "Children List", route: "/practitioner/children", icon: <Baby className="h-4 w-4" />, description: "Assigned children overview" },
    { name: "Add Child", route: "/practitioner/children/new", icon: <PlusCircle className="h-4 w-4" />, description: "Register new child" },
    { name: "Child Profile", route: "/practitioner/children/:id", icon: <FileText className="h-4 w-4" />, description: "Child details and progress" },
    { name: "Edit Child", route: "/practitioner/children/:id/edit", icon: <Edit className="h-4 w-4" />, description: "Update child information" },
    { name: "Child Report", route: "/practitioner/children/:id/report", icon: <BarChart className="h-4 w-4" />, description: "Wellbeing data analysis" },
    { name: "Bulk Import", route: "/practitioner/children/import", icon: <Upload className="h-4 w-4" />, description: "CSV child data upload" },
    { name: "Archived Children", route: "/practitioner/children/archived", icon: <Archive className="h-4 w-4" />, description: "Inactive child records" },
    { name: "Manage Practitioners", route: "/practitioner/team", icon: <Users className="h-4 w-4" />, description: "Team member oversight" },
    { name: "Invite Practitioner", route: "/practitioner/team/invite", icon: <UserPlus className="h-4 w-4" />, description: "Add team member" },
    { name: "Edit Practitioner", route: "/practitioner/team/:id/edit", icon: <Edit className="h-4 w-4" />, description: "Modify colleague details" },
    { name: "Reassign Children", route: "/practitioner/children/reassign", icon: <RotateCcw className="h-4 w-4" />, description: "Transfer child assignments" },
    { name: "Settings", route: "/practitioner/settings", icon: <Settings className="h-4 w-4" />, description: "Profile and preferences" }
  ]

  const childPages: PageNode[] = [
    { name: "Child Home", route: "/child/home", icon: <Home className="h-4 w-4" />, description: "Welcome dashboard" },
    { name: "Child Onboarding", route: "/child/onboarding", icon: <UserPlus className="h-4 w-4" />, description: "First-time setup" },
    { name: "Wellbeing Wheel", route: "/child/check-in/wheel", icon: <BarChart className="h-4 w-4" />, description: "Emotion check-in tool" },
    { name: "My Garden", route: "/child/check-in/garden", icon: <Star className="h-4 w-4" />, description: "Progress visualisation" },
    { name: "Sticker Book", route: "/child/stickers", icon: <Sticker className="h-4 w-4" />, description: "Achievement collection" },
    { name: "Community", route: "/child/community", icon: <MessageCircle className="h-4 w-4" />, description: "Peer interaction space" },
    { name: "Wrap Up", route: "/child/wrap-up", icon: <BookOpen className="h-4 w-4" />, description: "Session completion" }
  ]

  const sharedPages: PageNode[] = [
    { name: "User Profile", route: "/profile", icon: <Users className="h-4 w-4" />, description: "Account settings (all roles)" },
    { name: "Navigation", route: "/*", icon: <ArrowRight className="h-4 w-4" />, description: "Role-based menu system" },
    { name: "Protected Route", route: "/protected/*", icon: <Shield className="h-4 w-4" />, description: "Authentication wrapper" }
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />
      
      <div className="max-w-7xl mx-auto p-6">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-4">Complete Application Architecture</h1>
          <p className="text-gray-600 mb-4">
            Comprehensive sitemap showing all features, flows, and connections for The Lift platform
          </p>
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <h3 className="font-medium text-blue-900 mb-2">Architecture Overview</h3>
            <div className="text-sm text-blue-800 space-y-1">
              <div>• Role-based authentication with separate child login system</div>
              <div>• 4 user types: Admin (Account), Group Admin, Practitioner, Child</div>
              <div>• UK English terminology throughout ("Client" for organisations)</div>
              <div>• Wireframe-style UI with minimal grayscale design</div>
              <div>• Supabase backend with separate child credential validation</div>
            </div>
          </div>
        </div>

        {/* Marketing & Public Pages */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Home className="h-5 w-5" />
              Marketing & Public Pages
            </CardTitle>
            <p className="text-sm text-gray-600">Unauthenticated public content and marketing flows</p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-4 lg:grid-cols-7 gap-4">
              {marketingPages.map((page, idx) => (
                <PageBox key={idx} page={page} bgColor="bg-green-50" />
              ))}
            </div>
            <div className="mt-4 p-3 bg-gray-100 rounded">
              <h4 className="font-medium text-sm mb-2">Flow Connections:</h4>
              <div className="text-xs text-gray-600 space-y-1">
                <div>• All pages → Unified Login (via CTA buttons)</div>
                <div>• Marketing Home → About, How It Works, Pricing</div>
                <div>• Contact → Support ticket creation</div>
                <div>• All pages → Legal (footer links)</div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Authentication Flow */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <UserCheck className="h-5 w-5" />
              Authentication & Role Routing
            </CardTitle>
            <p className="text-sm text-gray-600">Login flows and role-based dashboard routing</p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-5 gap-4 mb-4">
              {authPages.map((page, idx) => (
                <PageBox key={idx} page={page} bgColor="bg-blue-50" />
              ))}
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="p-3 bg-gray-100 rounded">
                <h4 className="font-medium text-sm mb-2">Authentication Flow:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>1. Unified Login → Role selection</div>
                  <div>2a. Admin → Admin Login (Supabase auth)</div>
                  <div>2b. Practitioner/Group Admin → Admin Login</div>
                  <div>2c. Child → Child Login (username/PIN)</div>
                  <div>3. Dashboard → Role-based routing</div>
                </div>
              </div>
              <div className="p-3 bg-gray-100 rounded">
                <h4 className="font-medium text-sm mb-2">Role Routing Logic:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>• Account → /admin</div>
                  <div>• Group Admin → /practitioner (admin mode)</div>
                  <div>• Practitioner → /practitioner</div>
                  <div>• Child → /child/home</div>
                  <div>• Mode toggle for Group Admin role</div>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Admin Dashboard Flow */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Shield className="h-5 w-5" />
              Admin Dashboard Flow
            </CardTitle>
            <p className="text-sm text-gray-600">Client account management and system administration</p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-6 gap-4 mb-4">
              {adminPages.map((page, idx) => (
                <PageBox key={idx} page={page} bgColor="bg-red-50" />
              ))}
            </div>
            <div className="p-3 bg-gray-100 rounded">
              <h4 className="font-medium text-sm mb-2">Admin User Journey:</h4>
              <div className="text-xs text-gray-600 space-y-1">
                <div>• Dashboard → View platform metrics and client summary</div>
                <div>• Clients List → Browse all client accounts with "Manage" buttons</div>
                <div>• Create Client → Onboard new client with account type selection</div>
                <div>• Client Details → View client stats, seat usage, practitioner count</div>
                <div>• Edit Client → Modify client settings and configurations</div>
                <div>• Client Management → Bulk operations, seat adjustments, deactivation</div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Practitioner Flow */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="h-5 w-5" />
              Practitioner Dashboard Flow
            </CardTitle>
            <p className="text-sm text-gray-600">Child management, team coordination, and wellbeing tracking</p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-4 lg:grid-cols-6 gap-4 mb-4">
              {practitionerPages.slice(0, 6).map((page, idx) => (
                <PageBox key={idx} page={page} bgColor="bg-purple-50" />
              ))}
            </div>
            <div className="grid grid-cols-1 md:grid-cols-4 lg:grid-cols-7 gap-4 mb-4">
              {practitionerPages.slice(6).map((page, idx) => (
                <PageBox key={idx + 6} page={page} bgColor="bg-purple-50" />
              ))}
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="p-3 bg-gray-100 rounded">
                <h4 className="font-medium text-sm mb-2">Child Management Flow:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>• Dashboard → Quick stats and recent activity</div>
                  <div>• Children List → View assigned children with "Manage" buttons</div>
                  <div>• Add Child → Individual registration with login credentials</div>
                  <div>• Child Profile → Progress tracking and intervention notes</div>
                  <div>• Child Report → Wellbeing data analysis and trends</div>
                  <div>• Bulk Import → CSV upload for multiple children</div>
                </div>
              </div>
              <div className="p-3 bg-gray-100 rounded">
                <h4 className="font-medium text-sm mb-2">Team Management Flow:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>• Manage Practitioners → Team member oversight</div>
                  <div>• Invite Practitioner → Email invitations with role assignment</div>
                  <div>• Edit Practitioner → Update colleague permissions</div>
                  <div>• Reassign Children → Transfer child assignments between practitioners</div>
                  <div>• Archived Children → Access to inactive records</div>
                  <div>• Settings → Profile and notification preferences</div>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Child Experience Flow */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Baby className="h-5 w-5" />
              Child Experience Flow
            </CardTitle>
            <p className="text-sm text-gray-600">Interactive wellbeing tools and progress tracking for children</p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-4 lg:grid-cols-7 gap-4 mb-4">
              {childPages.map((page, idx) => (
                <PageBox key={idx} page={page} bgColor="bg-yellow-50" />
              ))}
            </div>
            <div className="p-3 bg-gray-100 rounded">
              <h4 className="font-medium text-sm mb-2">Child User Journey:</h4>
              <div className="text-xs text-gray-600 space-y-1">
                <div>• Child Login → Username/PIN authentication (separate from Supabase)</div>
                <div>• Child Home → Welcome dashboard with activity options</div>
                <div>• Onboarding → First-time setup and introduction (new users only)</div>
                <div>• Wellbeing Wheel → Interactive emotion check-in tool</div>
                <div>• My Garden → Visual progress representation with growth elements</div>
                <div>• Sticker Book → Achievement collection and reward system</div>
                <div>• Community → Safe peer interaction and sharing</div>
                <div>• Wrap Up → Session completion and reflection prompts</div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Shared Components */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Settings className="h-5 w-5" />
              Shared Components & Navigation
            </CardTitle>
            <p className="text-sm text-gray-600">Cross-role functionality and navigation systems</p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
              {sharedPages.map((page, idx) => (
                <PageBox key={idx} page={page} bgColor="bg-gray-100" />
              ))}
            </div>
            <div className="p-3 bg-gray-100 rounded">
              <h4 className="font-medium text-sm mb-2">Navigation Patterns:</h4>
              <div className="text-xs text-gray-600 space-y-1">
                <div>• Role-based menu systems with appropriate feature access</div>
                <div>• "Manage" buttons in list views → dedicated action pages (not modals)</div>
                <div>• Consistent breadcrumb navigation for deep page structures</div>
                <div>• Mode toggle for Group Admin users (admin ↔ practitioner views)</div>
                <div>• Protected routes with authentication checks for all secured areas</div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Data Flow & Backend Integration */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <BarChart className="h-5 w-5" />
              Data Flow & Backend Architecture
            </CardTitle>
            <p className="text-sm text-gray-600">Supabase integration patterns and data management</p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="p-3 bg-blue-50 rounded">
                <h4 className="font-medium text-sm mb-2">Authentication Systems:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>• Standard Supabase Auth: Admin, Group Admin, Practitioner</div>
                  <div>• Custom Child Auth: Username/PIN validation via server</div>
                  <div>• Role-based permissions and access control</div>
                  <div>• Session management and automatic logout routing</div>
                </div>
              </div>
              <div className="p-3 bg-green-50 rounded">
                <h4 className="font-medium text-sm mb-2">Data Storage Patterns:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>• Client accounts and seat allocation tracking</div>
                  <div>• Practitioner profiles and team relationships</div>
                  <div>• Child profiles with separate credential storage</div>
                  <div>• Wellbeing data collection and progress tracking</div>
                </div>
              </div>
              <div className="p-3 bg-purple-50 rounded">
                <h4 className="font-medium text-sm mb-2">API Endpoints:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>• /auth/* - Authentication and user management</div>
                  <div>• /admin/* - Client management operations</div>
                  <div>• /practitioner/* - Child and team management</div>
                  <div>• /child/* - Wellbeing data collection</div>
                </div>
              </div>
              <div className="p-3 bg-orange-50 rounded">
                <h4 className="font-medium text-sm mb-2">Key Features:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <div>• Bulk operations (import, archive, reassign)</div>
                  <div>• Real-time progress tracking</div>
                  <div>• Role-based dashboards with relevant metrics</div>
                  <div>• Secure child data handling with privacy controls</div>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Navigation Footer */}
        <div className="text-center border-t border-gray-200 pt-8">
          <div className="mb-4">
            <p className="text-sm text-gray-600 mb-2">
              This comprehensive sitemap covers all {marketingPages.length + authPages.length + adminPages.length + practitionerPages.length + childPages.length + sharedPages.length} pages and components across the platform.
            </p>
            <p className="text-xs text-gray-500">
              Use this as a reference for offline architecture planning and development coordination.
            </p>
          </div>
          <Link to="/">
            <Button variant="outline" className="mr-4">
              Return to Home
            </Button>
          </Link>
          <Link to="/contact">
            <Button>
              Contact Support
            </Button>
          </Link>
        </div>
      </div>
    </div>
  )
}