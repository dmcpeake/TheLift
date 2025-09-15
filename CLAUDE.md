# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Core Development
- **Start development server**: `npm run dev` (runs on port 3000)
- **Build for production**: `npm run build` (outputs to `build/` directory)

### Testing & Linting
No test or lint commands are currently configured in package.json. Consider adding:
- ESLint configuration for TypeScript/React linting
- Test runner (Jest, Vitest, or React Testing Library)

## Architecture Overview

### Tech Stack
- **Frontend Framework**: React 18 with TypeScript
- **Build Tool**: Vite with SWC for fast compilation
- **Styling**: Tailwind CSS with custom component library
- **UI Components**: Radix UI primitives with shadcn/ui patterns
- **Database/Auth**: Supabase (PostgreSQL + Auth)
- **Routing**: React Router v6
- **State Management**: React Context API for auth state
- **Animation**: Framer Motion and Lottie React

### Application Structure

The application is a multi-role platform with three distinct user types:
1. **Account (Admin)**: Platform administrators who manage clients
2. **GroupContact/Practitioner**: Organization administrators and practitioners who manage children
3. **Child**: End users who interact with wellbeing features

### Key Architectural Patterns

#### Authentication Flow
- Centralized auth management through `AuthContext` in `src/App.tsx`
- Role-based routing with `ProtectedRoute` component
- Automatic role detection and navigation on login
- Supabase Auth integration with custom profile fetching

#### Routing Strategy
- Marketing pages: Public routes at root level
- Admin routes: `/admin/*` with Account role protection
- Practitioner routes: `/dashboard`, `/children/*`, `/practitioners/*`
- Child app routes: `/child/*` with distinct UI (no navigation bar)

#### Supabase Integration
- Edge functions in `supabase/functions/server/` handle backend logic
- Database migrations in `supabase/migrations/`
- Client initialization in `src/utils/supabase/client.ts`
- Test user initialization on app startup

#### Component Organization
- `components/admin/`: Admin-specific components
- `components/practitioner/`: Practitioner management components
- `components/child/`: Child app components
- `components/marketing/`: Public-facing marketing pages
- `components/shared/`: Reusable components across roles
- `components/auth/`: Authentication-related components

### Important Implementation Details

#### Multi-Mode Support
The app supports mode switching for users with multiple roles (admin/practitioner modes) through the `currentMode` state and `toggleMode` function in AuthContext.

#### Child App Experience
Child routes (`/child/*`) have a distinct UI without the standard navigation bar, providing a focused experience for younger users.

#### Role-Based Navigation
After login, users are automatically redirected based on their role:
- Account → `/admin`
- GroupContact/Practitioner → `/dashboard`
- Child → `/child/home` or `/child/onboarding`

#### Test Data Initialization
The app automatically initializes test users on startup via the `/server/auth/init-test-users` edge function.