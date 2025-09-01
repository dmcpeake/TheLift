# The Lift - Complete Application Recreation Prompt

## Application Overview
You are recreating "The Lift" - a comprehensive wellbeing platform for children with sophisticated role-based access control. This is a production-ready multipage React application that will be deployed to Vercel with a fresh Supabase backend integration.

## Core Architecture & Purpose
The Lift is designed to support children's wellbeing through structured digital interactions, with four distinct user roles each having specific permissions and interfaces:

### User Roles & Access Patterns
1. **Admin Staff** - Full system access for client account management
2. **Practitioners** - Manage assigned children and wellbeing data  
3. **Group Contacts** - Limited administrative access for their client organisation
4. **Children** - Simplified interface for wellbeing activities and data entry

### Key Technical Requirements
- **Deployment**: Vercel with new Supabase account setup
- **Authentication**: Dual system - standard Supabase auth for adults, custom username/PIN system for children
- **Backend**: Supabase integration for user management, seat allocation tracking, children's wellbeing data storage
- **Frontend**: React with TypeScript, Tailwind CSS v4, shadcn/ui components
- **Routing**: React Router with role-based protected routes
- **Data Management**: Supabase Edge Functions with Hono web server architecture

## Design System & UI Patterns

### Visual Design
- **Wireframe aesthetic**: Grayscale colour scheme throughout (see globals.css overrides)
- **Typography**: 14px base font size, medium weight for headings/labels, normal weight for body text
- **Spacing**: Consistent use of Tailwind spacing classes
- **Components**: shadcn/ui base components with custom styling

### UX Patterns
- **Navigation principle**: "Manage" buttons in list views link to dedicated pages, NOT modal dialogs
- **Minimalist approach**: Implement only essential features initially - no unnecessary elements
- **Responsive design**: Mobile-first approach with desktop considerations
- **UK English**: All UI text uses British spelling (organisation, colour, centre, etc.)
- **Terminology**: "Client" instead of "organisation" throughout the interface

### Key UI Components
- Admin dashboard with client management capabilities
- Practitioner dashboard with children assignment and management
- Child-friendly interface with wellbeing activities
- Role-switching capability for users with multiple permissions
- Comprehensive navigation system with role-based routing

## Authentication Architecture

### Standard Authentication (Adults)
- Supabase Auth for Admin, Practitioners, Group Contacts
- JWT-based session management
- Role-based redirects after login (/admin/login for admin, /login for others)
- User profile data stored with role and client association

### Child Authentication System
- **Custom implementation**: Username/PIN validation instead of Supabase Auth
- **Storage**: Child credentials stored in backend key-value store
- **Validation**: Server-side PIN verification with rate limiting
- **Session**: Custom session management for child users
- **Security**: PIN-based access with simplified UX for young users

## Backend Integration

### Supabase Setup Required
The application requires these Supabase features to be configured:
- **Auth**: Email/password authentication for adult users
- **Database**: PostgreSQL with custom tables for user profiles, client data, children data
- **Edge Functions**: Hono web server running on Supabase Functions
- **Storage**: File storage for any uploaded content (if needed)
- **Row Level Security**: Proper RLS policies for data protection

### Server Architecture
- **Edge Function Location**: `/supabase/functions/server/`
- **Framework**: Hono web server with TypeScript
- **CORS**: Open CORS headers required
- **Logging**: Console logging for debugging
- **Routes**: All prefixed with `/make-server-a1855b25/`
- **Key-Value Store**: Pre-built utility for data persistence

### API Endpoints (Expected)
```
POST /make-server-a1855b25/auth/init-test-users
POST /make-server-a1855b25/auth/child-login
GET  /make-server-a1855b25/debug/child-data
GET  /make-server-a1855b25/users/profile
POST /make-server-a1855b25/users/create
PUT  /make-server-a1855b25/users/update
GET  /make-server-a1855b25/children/list
POST /make-server-a1855b25/children/create
PUT  /make-server-a1855b25/children/update
```

## File Structure & Organisation

### Frontend Structure
```
/components/
  /admin/          - Admin-specific components and pages
  /auth/           - Authentication pages and utilities
  /child/          - Child-specific interface components
  /practitioner/   - Practitioner dashboard and management
  /shared/         - Reusable components across roles
  /ui/             - shadcn/ui base components (DO NOT MODIFY)
/routes/           - React Router configuration
/utils/            - Authentication helpers, Supabase client
/styles/           - Global CSS with wireframe overrides
```

### Backend Structure
```
/supabase/functions/server/
  index.tsx        - Main Hono server setup
  admin.tsx        - Admin-specific API routes
  kv_store.tsx     - Key-value storage utility (PROTECTED)
```

## Critical Implementation Details

### Environment Variables Required
```
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

### Authentication Flow
1. **App initialization**: Initialize test users and child data
2. **Session check**: Verify existing Supabase sessions on app load
3. **Role-based routing**: Navigate to appropriate dashboard based on user role
4. **Mode switching**: Allow users with multiple roles to switch contexts
5. **Logout handling**: Clear sessions and redirect to appropriate login page

### Child-Specific Features
- **Onboarding**: Initial setup flow for new children
- **Wellbeing Wheel**: Interactive wellbeing assessment tool
- **My Garden**: Personal space for children
- **Sticker Book**: Achievement/reward system
- **Community**: Social features (age-appropriate)
- **Wrap Up**: Session conclusion activities

### Data Management Patterns
- **User profiles**: Stored with role and client association
- **Child data**: Wellbeing assessments, progress tracking, achievements
- **Client management**: Seat allocation, user limits, billing information
- **Practitioner assignment**: Children assigned to specific practitioners
- **Archive functionality**: Soft delete patterns for children and users

## Development Guidelines

### Code Quality
- **TypeScript**: Strict typing throughout
- **Component structure**: Single responsibility principle
- **Error handling**: Comprehensive error boundaries and user feedback
- **Performance**: Lazy loading for route components
- **Testing**: Consider test utilities for critical authentication flows

### Security Considerations
- **Authentication**: Proper JWT validation and refresh
- **Authorization**: Role-based access control on all routes
- **Child protection**: Enhanced security for child user data
- **Data validation**: Server-side validation for all inputs
- **Rate limiting**: Protection against brute force attacks

### Deployment Preparation
- **Environment setup**: All required environment variables
- **Database migration**: Initial schema and test data creation
- **Function deployment**: Supabase Edge Functions properly configured
- **Domain configuration**: Proper CORS and domain settings
- **Monitoring**: Basic logging and error tracking

## Expected User Flows

### Admin Flow
1. Login at `/admin/login`
2. View clients list with management options
3. Create/edit client accounts with seat allocation
4. Manage user roles and permissions
5. Monitor system usage and billing

### Practitioner Flow
1. Login at `/login`
2. View assigned children dashboard
3. Add/edit child profiles and wellbeing data
4. Generate reports and track progress
5. Manage settings and preferences

### Child Flow
1. Login with username/PIN at child-specific login
2. Complete onboarding if first-time user
3. Engage with wellbeing activities
4. Track progress in personal garden
5. Collect achievements and stickers

## Success Criteria
The recreated application should:
- ✅ Authenticate all user types correctly
- ✅ Display appropriate dashboards for each role
- ✅ Handle role switching for multi-role users
- ✅ Maintain wireframe aesthetic throughout
- ✅ Persist data correctly in Supabase backend
- ✅ Deploy successfully to Vercel
- ✅ Handle child authentication securely
- ✅ Follow established UI patterns consistently

## Files to Reference
When recreating, carefully examine:
- `/App.tsx` - Main application setup and authentication logic
- `/styles/globals.css` - Design system and wireframe overrides
- `/Guidelines.md` - Any specific development guidelines
- `/architecture.md` - Technical architecture decisions
- File structure above for component organisation patterns

Remember: Start with core authentication and routing, then build out each role's interface systematically. Maintain the minimalist approach and only implement essential features initially.