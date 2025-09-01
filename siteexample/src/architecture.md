# The Lift - Application Architecture Documentation

## Project Overview

**The Lift** is a comprehensive wellbeing platform for children aged 5-11, designed with role-based access for practitioners, group contacts, children, and admin staff. The application uses a wireframe-like grayscale UI for base implementation, allowing for styling and branding to be applied later.

### Core Features
- Multi-role authentication system with custom child authentication
- Wellbeing tracking and assessment tools for children
- Practitioner dashboard for monitoring and data review
- Administrative client management system
- Safe community features for children
- Gamification through stickers and garden activities
- UK English spelling throughout
- Supabase backend integration

## Technical Stack

- **Frontend**: React + TypeScript + Tailwind CSS v4
- **Backend**: Supabase (PostgreSQL + Edge Functions + Auth + Storage)
- **Authentication**: Supabase Auth (adults) + Custom PIN system (children)
- **UI Components**: shadcn/ui with custom wireframe styling
- **State Management**: React Context API
- **Routing**: React Router v6

## User Roles & Authentication

### 1. Admin (Platform Administrators)
- **Login**: `/admin/login` (separate from other users)
- **Purpose**: Full platform oversight and client management
- **Navigation**: Admin-focused dashboard with client management tools
- **Permissions**: Complete platform access, client creation/management

### 2. GroupManager (Organisation Administrators)
- **Login**: `/login` (unified login)
- **Purpose**: Manage their organisation's practitioners and settings
- **Navigation**: Practitioner features + administrative functions
- **Permissions**: All practitioner features + team management + invite practitioners

### 3. Practitioner (Teachers, Counsellors, Psychologists)
- **Login**: `/login` (unified login)
- **Purpose**: Work directly with children, monitor wellbeing data
- **Navigation**: Child-focused dashboard with reporting tools
- **Permissions**: Child management, wellbeing monitoring, data entry/review

### 4. Child (End Users)
- **Login**: `/login` with username/PIN (custom authentication)
- **Purpose**: Complete wellbeing activities and interact with platform
- **Navigation**: Child-friendly interface with activity focus
- **Permissions**: Wellbeing check-ins, interactive activities, sticker rewards

## Database Schema

### Core Tables

#### profiles
Extends Supabase Auth users with additional profile information.
```sql
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  name TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('Account', 'GroupContact', 'Practitioner', 'Child')),
  org_id UUID REFERENCES organisations(id) ON DELETE SET NULL,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'pending', 'suspended')),
  avatar_url TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### organisations
Represents client organisations (schools, clinics, hospitals, etc.).
```sql
CREATE TABLE organisations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('school-primary', 'school-secondary', 'academy-trust', 'clinic-private', 'nhs-trust', 'hospital', 'charity', 'other')),
  address_line_1 TEXT,
  address_line_2 TEXT,
  city TEXT,
  postcode TEXT,
  country TEXT DEFAULT 'UK',
  phone TEXT,
  email TEXT,
  website TEXT,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'trial', 'suspended')),
  subscription_plan TEXT DEFAULT 'essential' CHECK (subscription_plan IN ('essential', 'professional', 'enterprise')),
  max_children INTEGER DEFAULT 50,
  max_practitioners INTEGER DEFAULT 5,
  settings JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### children
Child users with safeguarding and consent information.
```sql
CREATE TABLE children (
  id UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
  first_name TEXT NOT NULL,
  date_of_birth DATE,
  year_group TEXT,
  class_name TEXT,
  primary_practitioner_id UUID REFERENCES profiles(id),
  parent_guardian_name TEXT,
  parent_guardian_email TEXT,
  parent_guardian_phone TEXT,
  consent_given BOOLEAN NOT NULL DEFAULT FALSE,
  consent_date TIMESTAMPTZ,
  consent_type TEXT CHECK (consent_type IN ('verbal', 'written', 'digital')),
  safeguarding_notes TEXT,
  additional_notes TEXT,
  avatar_character TEXT DEFAULT 'default',
  preferences JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### wellbeing_sessions
Individual wellbeing check-in sessions completed by children.
```sql
CREATE TABLE wellbeing_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  session_type TEXT NOT NULL CHECK (session_type IN ('daily_checkin', 'weekly_review', 'monthly_assessment')),
  status TEXT NOT NULL DEFAULT 'in_progress' CHECK (status IN ('in_progress', 'completed', 'abandoned')),
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ,
  duration_seconds INTEGER,
  activities_completed TEXT[] DEFAULT '{}',
  overall_mood INTEGER CHECK (overall_mood BETWEEN 1 AND 5),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### wellbeing_responses
Individual responses to wellbeing activities within sessions.
```sql
CREATE TABLE wellbeing_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL REFERENCES wellbeing_sessions(id) ON DELETE CASCADE,
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  activity_type TEXT NOT NULL CHECK (activity_type IN ('mood_wheel', 'emotion_wheel', 'garden_activity', 'reflection_question', 'worry_space')),
  question_key TEXT NOT NULL,
  question_text TEXT,
  response_type TEXT NOT NULL CHECK (response_type IN ('scale', 'multiple_choice', 'text', 'emoji', 'drawing')),
  response_value JSONB NOT NULL,
  response_score INTEGER,
  flags TEXT[] DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### garden_items
Items children can place in their digital garden.
```sql
CREATE TABLE garden_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  item_type TEXT NOT NULL CHECK (item_type IN ('flower', 'tree', 'decoration', 'character')),
  item_name TEXT NOT NULL,
  item_category TEXT,
  position_x INTEGER DEFAULT 0,
  position_y INTEGER DEFAULT 0,
  size_scale DECIMAL DEFAULT 1.0,
  rotation INTEGER DEFAULT 0,
  color_scheme TEXT,
  is_unlocked BOOLEAN DEFAULT TRUE,
  unlock_condition TEXT,
  earned_at TIMESTAMPTZ,
  placed_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### stickers_earned
Stickers and rewards earned by children for completing activities.
```sql
CREATE TABLE stickers_earned (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  sticker_type TEXT NOT NULL,
  sticker_name TEXT NOT NULL,
  sticker_description TEXT,
  earned_for TEXT NOT NULL,
  session_id UUID REFERENCES wellbeing_sessions(id),
  earned_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### alerts
System-generated alerts for concerning responses or patterns.
```sql
CREATE TABLE alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  alert_type TEXT NOT NULL CHECK (alert_type IN ('safeguarding', 'wellbeing_decline', 'engagement_drop', 'positive_change')),
  severity TEXT NOT NULL CHECK (severity IN ('low', 'medium', 'high', 'urgent')),
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  trigger_data JSONB,
  session_id UUID REFERENCES wellbeing_sessions(id),
  response_id UUID REFERENCES wellbeing_responses(id),
  status TEXT NOT NULL DEFAULT 'unread' CHECK (status IN ('unread', 'acknowledged', 'resolved', 'escalated')),
  acknowledged_by UUID REFERENCES profiles(id),
  acknowledged_at TIMESTAMPTZ,
  resolved_by UUID REFERENCES profiles(id),
  resolved_at TIMESTAMPTZ,
  resolution_notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

#### invitations
Invitations sent to new practitioners to join organisations.
```sql
CREATE TABLE invitations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  org_id UUID NOT NULL REFERENCES organisations(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('Practitioner', 'GroupContact')),
  invited_by UUID NOT NULL REFERENCES profiles(id),
  invitation_token TEXT NOT NULL UNIQUE,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'accepted', 'expired', 'revoked')),
  expires_at TIMESTAMPTZ NOT NULL DEFAULT (NOW() + INTERVAL '7 days'),
  accepted_at TIMESTAMPTZ,
  accepted_by UUID REFERENCES profiles(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

## Application Sitemap & Page Content

### Marketing Pages (Public Access)

#### Home Page (`/`)
**Component**: `MarketingHome`
**Layout**: Clean landing page with structured sections
**Content**:
- **Hero Section**: Large heading "Transform Children's Wellbeing" with subtitle about digital platform for schools and clinics
- **Product Overview**: Three-column feature grid explaining child activities, practitioner insights, and administrative control
- **Benefits Section**: Statistics and testimonials showcasing platform effectiveness
- **Pricing Preview**: Brief overview of subscription tiers with "View Pricing" CTA
- **Footer**: Contact information, legal links, and social media

#### About Page (`/about`)
**Component**: `About`
**Layout**: Professional company information page
**Content**:
- **Company Story**: Mission statement and founding principles
- **Team Section**: Key team members with photos and roles
- **Values**: Core company values and commitment to child safety
- **Contact Information**: Office locations and contact details

#### How It Works (`/how-it-works`)
**Component**: `HowItWorks`
**Layout**: Step-by-step process explanation
**Content**:
- **Overview**: Platform introduction for different user types
- **For Schools**: Step-by-step implementation process
- **For Practitioners**: Daily workflow and tools explanation
- **For Children**: Activity flow and engagement features
- **Safety & Compliance**: Data protection and safeguarding measures

#### Pricing (`/pricing`)
**Component**: `Pricing`
**Layout**: Pricing cards with feature comparison
**Content**:
- **Essential Plan**: £XX/month - Basic features for small organisations
- **Professional Plan**: £XX/month - Advanced features and reporting
- **Enterprise Plan**: Custom pricing - Full platform with customisation
- **Feature Comparison Table**: Detailed feature breakdown by plan
- **Contact CTA**: "Book a Demo" and "Contact Sales" buttons

#### Contact (`/contact`)
**Component**: `Contact`
**Layout**: Contact form with office information
**Content**:
- **Contact Form**: Name, email, organisation, message fields
- **Office Locations**: Main office address and satellite locations
- **Support Information**: Support hours and response times
- **Demo Booking**: Calendar integration for demo scheduling

#### Legal Hub (`/legal`)
**Component**: `Legal`
**Layout**: Legal document navigation hub
**Content**:
- **Privacy Policy Link**: GDPR-compliant privacy documentation
- **Terms of Service Link**: Platform usage terms and conditions
- **Data Processing Agreement**: B2B data handling agreements
- **Safeguarding Policy**: Child protection and safety measures

#### Sitemap (`/sitemap`)
**Component**: `Sitemap`
**Layout**: Interactive navigation overview
**Content**:
- **Role-based Flow Diagrams**: Visual representation of user journeys
- **Page Hierarchy**: Complete site structure with descriptions
- **Feature Overview**: Comprehensive platform capability list

### Authentication Flow

#### Unified Login (`/login`)
**Component**: `UnifiedLoginPage`
**Layout**: Tabbed interface for different user types
**Content**:
- **Child Login Tab**: 
  - Username input field (large, child-friendly)
  - PIN input component (4-digit numerical)
  - "Sign In" button with child-friendly styling
  - Help text for forgotten credentials
- **Adult Login Tab**:
  - Email input field
  - Password input field
  - "Remember me" checkbox
  - "Forgot password?" link
  - "Sign In" button
- **New User Section**: "Don't have an account? Contact your administrator"

#### Admin Login (`/admin/login`)
**Component**: `AdminLoginPage`
**Layout**: Simple, professional login form
**Content**:
- **Admin Branding**: "The Lift Admin Portal" heading
- **Email Input**: Professional email validation
- **Password Input**: Secure password requirements
- **"Admin Sign In" Button**: Prominent primary button
- **Security Notice**: Information about admin access restrictions

### Admin Flow (Account Role Only)

#### Admin Dashboard (`/admin`)
**Component**: `AdminDashboard`
**Layout**: Overview dashboard with statistics and client list
**Content**:
- **Header**: "Admin Dashboard" with user profile dropdown
- **Statistics Cards**: 
  - Total Clients count
  - Active Users count
  - Monthly Revenue figure
  - Support Tickets count
- **Client Overview Table**: 
  - Organisation name, type, status, users count, subscription plan
  - "Manage" button for each client (links to client details)
- **Recent Activity Feed**: Latest client activities and system events
- **Quick Actions Section**: 
  - "Add New Client" button (links to `/admin/clients/new`)
  - "View All Clients" button
  - "System Settings" button

#### Create Client (`/admin/clients/new`)
**Component**: `CreateClient`
**Layout**: Multi-step form with progress indicators
**Content**:
- **Step 1 - Organisation Details**:
  - Organisation name (required)
  - Organisation type dropdown (school-primary, clinic-private, etc.)
  - Complete address fields (address line 1, line 2, city, postcode)
  - Contact information (phone, email, website)
- **Step 2 - Subscription & Limits**:
  - Subscription plan selection (Essential, Professional, Enterprise)
  - Maximum children limit slider
  - Maximum practitioners limit slider
- **Step 3 - Account Type Selection**:
  - Radio buttons for "Group Admin" or "Practitioner"
  - Explanation text for each option
- **Step 4 - Initial User**:
  - First user's name, email
  - Role confirmation based on account type selection
- **Actions**: "Previous", "Next", "Cancel", "Create Client" buttons

#### Client Details (`/admin/clients/:id`)
**Component**: `ClientDetails`
**Layout**: Detailed client overview with management options
**Content**:
- **Client Header**: Organisation name, type, status badge
- **Contact Information Panel**: Address, phone, email, website
- **Subscription Details Panel**: Current plan, billing cycle, next payment
- **Usage Statistics Panel**: 
  - Children count vs limit
  - Practitioners count vs limit
  - Storage usage
  - Activity metrics
- **User List Table**: All users within organisation with roles and status
- **Management Actions**:
  - "Edit Details" button (links to edit page)
  - "Manage Subscription" button
  - "Suspend Client" button (with confirmation)
  - "Delete Client" button (with confirmation)
- **Activity Log**: Recent client-related activities

#### Edit Client (`/admin/clients/:id/edit`)
**Component**: `EditClient`
**Layout**: Form pre-populated with existing client data
**Content**:
- **Organisation Information**: Editable fields matching create form
- **Subscription Management**: Plan changes and limit adjustments
- **Status Changes**: Active/Suspended toggle with reason field
- **Billing Information**: Payment method and billing address updates
- **Actions**: "Save Changes", "Cancel" buttons

### Practitioner Flow (Practitioner & GroupContact Roles)

#### Practitioner Dashboard (`/dashboard`)
**Component**: `PractitionerDashboard`
**Layout**: Overview dashboard with child-focused metrics
**Content**:
- **Header**: "Dashboard" with user profile and organisation name
- **Statistics Cards**:
  - Assigned Children count
  - Pending Check-ins count
  - Alerts Requiring Attention count
  - Completed Sessions This Week count
- **Quick Actions Tiles**:
  - "Add New Child" (large tile with plus icon)
  - "Bulk Import Children" (utility tile)
  - "View All Children" (navigation tile)
  - "Manage Practitioners" (GroupContact only)
- **Recent Activity Panel**: Latest child activities and completions
- **Alerts Panel**: High-priority alerts requiring immediate attention
- **Children Overview Table**: 
  - Child name, last activity, overall progress, alert status
  - "View Profile" button for each child

#### Add Child (`/children/add`)
**Component**: `AddChild`
**Layout**: Multi-step child registration form
**Content**:
- **Step 1 - Child Information**:
  - First name (required)
  - Date of birth (date picker)
  - Year group dropdown
  - Class name text input
- **Step 2 - Parent/Guardian Details**:
  - Parent/guardian name (required)
  - Contact email
  - Contact phone number
  - Relationship to child dropdown
- **Step 3 - Consent & Safeguarding**:
  - Consent given checkbox (required)
  - Consent type radio buttons (verbal, written, digital)
  - Consent date picker
  - Safeguarding notes textarea
  - Additional notes textarea
- **Step 4 - Account Setup**:
  - Username generation (auto-generated, editable)
  - PIN generation (4-digit, auto-generated, regenerate button)
  - Primary practitioner assignment dropdown
- **Actions**: "Previous", "Next", "Cancel", "Add Child" buttons

#### Bulk Import Children (`/children/bulk-import`)
**Component**: `BulkImportChildren`
**Layout**: File upload interface with validation
**Content**:
- **Instructions Panel**: Step-by-step import process explanation
- **Template Download**: "Download CSV Template" button with sample data
- **File Upload Area**: Drag-and-drop zone with file selection
- **Validation Panel**: File format validation and error reporting
- **Preview Table**: Shows parsed data before final import
- **Import Settings**:
  - Default practitioner assignment
  - Consent handling options
  - Duplicate handling rules
- **Actions**: "Upload File", "Validate Data", "Import Children", "Cancel"

#### Child Profile (`/children/:id`)
**Component**: `ChildProfile`
**Layout**: Comprehensive child overview with activity history
**Content**:
- **Child Header**: Name, age, year group, primary practitioner
- **Quick Stats Cards**:
  - Total Sessions Completed
  - Current Mood Trend
  - Stickers Earned
  - Garden Items Unlocked
- **Wellbeing Timeline**: Chronological list of completed sessions
- **Activity Progress**:
  - Wellbeing wheel completions graph
  - Garden activity engagement chart
  - Sticker collection progress
- **Alerts & Notes Panel**: Active alerts and practitioner notes
- **Parent/Guardian Information**: Contact details and consent status
- **Management Actions**:
  - "Edit Details" button
  - "Add Note" button
  - "Archive Child" button
  - "Generate Report" button

#### Invite Practitioner (`/invite/practitioner`) - GroupContact Only
**Component**: `InvitePractitioner`
**Layout**: Simple invitation form
**Content**:
- **Invitation Form**:
  - Email address input (required)
  - Role selection (Practitioner/GroupContact)
  - Personal message textarea (optional)
- **Bulk Invitation Section**:
  - CSV upload for multiple invitations
  - Template download link
- **Pending Invitations Table**: 
  - Email, role, sent date, status, actions
  - "Resend" and "Revoke" buttons
- **Actions**: "Send Invitation", "Upload CSV", "Cancel"

#### Manage Practitioners (`/practitioners`) - GroupContact Only
**Component**: `ManagePractitioners`
**Layout**: Table view with practitioner management options
**Content**:
- **Header**: "Manage Practitioners" with "Invite New Practitioner" button
- **Practitioners Table**:
  - Name, email, role, status, children assigned, last active
  - "Manage" button for each practitioner
- **Filters & Search**:
  - Role filter dropdown
  - Status filter (active/inactive)
  - Search by name or email
- **Bulk Actions**:
  - Select multiple practitioners
  - Bulk status changes
  - Bulk role assignments

#### Settings (`/settings`)
**Component**: `Settings`
**Layout**: Tabbed settings interface
**Content**:
- **Organisation Settings Tab** (GroupContact only):
  - Organisation name and details
  - Contact information updates
  - Subscription plan information
- **Notification Settings Tab**:
  - Email notification preferences
  - Alert thresholds configuration
  - Report frequency settings
- **Security Tab**:
  - Password change form
  - Two-factor authentication setup
  - Session management
- **Preferences Tab**:
  - Dashboard layout preferences
  - Default views and filters
  - Accessibility options

### Child Flow (Child Role Only)

#### Child Onboarding (`/child/onboarding`)
**Component**: `ChildOnboarding`
**Layout**: Interactive welcome sequence
**Content**:
- **Welcome Screen**: Animated character greeting with "Welcome to The Lift!"
- **Avatar Selection**: Grid of character options for child to choose
- **Name Confirmation**: "Hi [First Name]! Is this you?" with confirmation
- **Tutorial Introduction**: Simple explanation of platform activities
- **Garden Setup**: Initial garden creation with starter items
- **Completion**: "You're ready to start!" with confetti animation

#### Child Home (`/child/home`)
**Component**: `ChildHome`
**Layout**: Tile-based dashboard with large, colourful buttons
**Content**:
- **Header**: Child's name with avatar and current day/time
- **Activity Tiles** (large buttons):
  - "Daily Check-in" (primary CTA if not completed today)
  - "My Garden" (shows preview of current garden)
  - "Sticker Book" (shows recent stickers earned)
  - "Community" (safe community features)
- **Progress Section**:
  - Weekly check-in progress bar
  - Recent stickers earned carousel
  - Achievement badges display
- **Encouragement Panel**: Positive messaging and activity suggestions

#### Wellbeing Check-in Flow (Sequential Steps)

##### Step 1: Wellbeing Wheel (`/child/check-in/wheel`)
**Component**: `WellbeingWheel`
**Layout**: Large circular interface with emotion selection
**Content**:
- **Instruction**: "How are you feeling today?" with friendly character guide
- **Emotion Wheel**: Large circular interface with emotion categories
- **Mood Scale**: 5-point scale with emoji faces (sad to happy)
- **Simple Questions**: 2-3 age-appropriate questions about feelings
- **Navigation**: "Next" button (disabled until selections made)

##### Step 2: My Garden (`/child/check-in/garden`)
**Component**: `MyGarden`
**Layout**: Interactive garden interface
**Content**:
- **Garden View**: Visual representation of child's garden
- **Reflection Questions**: Simple questions about goals and achievements
- **Garden Activity**: Option to place new items or tend existing ones
- **Growth Tracking**: Visual representation of garden growth over time
- **Navigation**: "Previous" and "Next" buttons

##### Step 3: Wrap Up (`/child/check-in/wrap-up`)
**Component**: `WrapUp`
**Layout**: Completion celebration with rewards
**Content**:
- **Completion Message**: "Well done! You've completed your check-in!"
- **Sticker Reward**: Display of sticker earned for completion
- **Garden Reward**: New garden item unlocked
- **Progress Update**: Updated progress bars and achievements
- **Home Navigation**: "Return to Home" button

#### Sticker Book (`/child/stickers`)
**Component**: `StickerBook`
**Layout**: Grid layout showing sticker collection
**Content**:
- **Header**: "My Sticker Book" with collection progress
- **Sticker Grid**:
  - Earned stickers (full colour/brightness)
  - Locked stickers (greyed out with unlock conditions)
  - Sticker descriptions on tap/click
- **Categories**: Different sticker types (feelings, activities, achievements)
- **Progress Tracking**: "X of Y stickers collected" indicators

#### Community (`/child/community`)
**Component**: `Community`
**Layout**: Safe, moderated community interface
**Content**:
- **Positive Message Board**: Encouraging messages from other children
- **Community Challenges**: Group activities and goals
- **Sharing Options**: Safe ways to share garden or sticker achievements
- **Encouragement Tools**: Ways to send positive messages to others
- **Safety Reminders**: Age-appropriate safety guidelines

## UI/UX Design Patterns

### Wireframe Styling
- **Colour Scheme**: Grayscale-only (#ffffff to #111827)
- **Typography**: Clean, readable fonts with consistent sizing
- **Components**: Minimal, functional design without decorative elements
- **Layout**: Grid-based, responsive design patterns
- **Interactive Elements**: Clear hover states and focus indicators

### Navigation Patterns
- **Admin**: Top navigation bar with user profile dropdown
- **Practitioner**: Sidebar navigation with collapsible sections
- **Child**: Bottom tab navigation with large, friendly icons
- **Breadcrumbs**: Used for multi-step forms and deep navigation

### UI Conventions
- **"Manage" Buttons**: Consistent pattern linking to dedicated management pages
- **Status Indicators**: Colour-coded badges for user status, subscription status, etc.
- **Progress Indicators**: Used throughout child activities and multi-step forms
- **Alert System**: Consistent alert styling across all user roles

### Child-Specific Design
- **Large Touch Targets**: Minimum 44px for easy interaction
- **Simple Language**: Age-appropriate terminology and instructions
- **Visual Feedback**: Animations and celebrations for completed actions
- **Safety Features**: No direct messaging, moderated content

## Authentication Architecture

### Adult Authentication (Supabase Auth)
- Standard email/password authentication
- Role-based redirections after login
- Session management with refresh tokens
- Password reset functionality

### Child Authentication (Custom System)
- Username/PIN combination (no email required)
- PIN stored securely in database
- Custom session management
- Simplified login process for young users

### Route Protection
- `ProtectedRoute` component wraps private routes
- Role-based access control for sensitive areas
- Automatic redirections based on user permissions

## Backend Architecture

### Supabase Edge Functions (`/supabase/functions/server/`)
- **index.tsx**: Main server entry point with CORS configuration
- **admin.tsx**: Admin-specific endpoints for client management
- Server routes prefixed with `/make-server-a1855b25`

### Key Endpoints
- `POST /auth/init-test-users`: Initialize test users for development
- `GET /debug/child-data`: Development endpoint for data verification
- Admin client management endpoints (create, read, update, delete)

### Data Storage Strategy
- **User Profiles**: Stored in `profiles` table
- **Wellbeing Data**: Structured in `wellbeing_sessions` and `wellbeing_responses`
- **File Storage**: Supabase Storage for any uploaded files
- **KV Store**: Flexible key-value storage for configuration and temporary data

## Security & Compliance

### Data Protection
- GDPR-compliant data handling
- Parental consent tracking for all children
- Safeguarding notes and alert system
- Secure data deletion capabilities

### Child Safety
- No direct communication between children
- Moderated community features
- Age-appropriate content and interactions
- Safeguarding alert system for concerning responses

### Access Control
- Row Level Security (RLS) on all tables
- Role-based permissions at database level
- Secure session management
- API endpoint protection

## Development Setup

### Required Environment Variables
- `SUPABASE_URL`: Supabase project URL
- `SUPABASE_ANON_KEY`: Public anonymous key
- `SUPABASE_SERVICE_ROLE_KEY`: Service role key (server-side only)

### Test Data
- System automatically initializes test users on startup
- Test children with sample wellbeing data
- Test practitioners and organisations

### Key Components Directory Structure
```
/components
  /admin         # Account role components
  /auth          # Authentication components  
  /child         # Child role components
  /practitioner  # Practitioner/GroupContact components
  /shared        # Cross-role shared components
  /ui            # shadcn/ui components
```

## Implementation Notes

### UK English Spelling
- All UI text uses UK English spelling (colour, organisation, programme, etc.)
- Date formats follow UK conventions (DD/MM/YYYY)
- Currency displayed in British Pounds (£)

### Minimal Implementation Principle
- Start with minimal viable features
- Avoid unnecessary complexity in initial implementation
- Don't add unneccesary emoticons or subtext to titles or headings 
- Build iteratively based on user feedback
- Maintain clean, readable code structure

### Responsive Design
- Mobile-first approach for child interfaces
- Desktop-optimised for admin and practitioner tools
- Consistent behaviour across device sizes

This architecture provides the foundation for a comprehensive wellbeing platform that can be built iteratively while maintaining security, usability, and compliance with child safety requirements.