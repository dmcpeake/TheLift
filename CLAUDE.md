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

## Known Issues & Debugging Notes

### Avatar Colors Not Displaying (As of 2025-01-17)

**Issue**: Avatar colors in `/test/analytics` (ChildSummaryAnalytics.tsx) display as gray instead of their configured colors.

**Status**: Partially working - only bg-red-500 (6th child) and bg-teal-500 (5th child) show colors, all others render as gray (#6b7280).

**Investigation Summary**:
1. **Classes are correctly assigned**: Debug logs confirm each avatar gets proper Tailwind classes (bg-blue-500, bg-green-500, etc.)
2. **Tailwind configuration is correct**:
   - All color classes are in the safelist in `tailwind.config.js`
   - Tailwind CSS v3 is properly installed with PostCSS
3. **Wireframe CSS partially disabled**: Found and commented out wireframe overrides in `src/styles/globals.css` (lines 200-490) but issue persists
4. **Issue reproduces locally**: Confirmed not a Vercel deployment issue - happens in local build too

**Files Checked**:
- `src/components/analytics/ChildSummaryAnalytics.tsx` - Avatar rendering logic (lines 456-485)
- `src/styles/globals.css` - Contains wireframe CSS that may still be applying
- `tailwind.config.js` - Safelist includes all avatar colors
- `postcss.config.js` - Properly configured with Tailwind

**Next Debugging Steps**:
1. **Inspect computed styles in DevTools**: Find which CSS rule is actually applying the gray color
2. **Check CSS cascade**: Look for other !important rules or higher specificity selectors
3. **Verify @layer utilities block**: The wireframe CSS uses @layer which may not be fully commented
4. **Test with inline styles**: Try style={{ backgroundColor: 'rgb(59, 130, 246)' }} to confirm it's CSS issue
5. **Check build output**: Inspect the actual CSS file generated to see if colors are present
6. **Search for #6b7280**: This specific gray color must be defined somewhere that's overriding the avatars

**Temporary Workaround**: Consider using inline styles or CSS-in-JS for avatar colors until root cause is found.

### Date Handling in Analytics (Fixed 2025-09-18)

**Issue**: Dates in mood/wellbeing data were showing as September 2025 instead of the actual check-in dates (Jan-Apr 2025).

**Root Cause**: The code was using `created_at` field (when record was inserted) instead of `selected_at` field (when mood was actually recorded).

**Solution**: Updated all queries and components to use:
- `selected_at` for `mood_meter_usage` table
- `started_at` for `wellbeing_sessions` table

**Files Updated**:
- `src/components/analytics/ChildSummaryAnalytics.tsx` - Changed queries to order by `selected_at`
- `src/components/analytics/MoodHeatmap.tsx` - Updated to use `selected_at` for date display
- `supabase/functions/analyze-qualitative-data-optimized/index.ts` - Fixed date field references

### AI Analysis Organization-Specific Prompts (2025-09-18)

**Implementation**: Created role-specific prompts for AI analysis based on organization type.

**Database Structure**:
- Table: `organisations` (note British spelling)
- Column: `type` (values: 'school-primary', 'school-secondary', 'clinic-private', 'hospital', etc.)
- Organizations must exist in DB for proper org type detection

**Prompt Files**:
- `supabase/functions/analyze-qualitative-data-optimized/prompts/teacher.md` - For school organizations
- `supabase/functions/analyze-qualitative-data-optimized/prompts/clinic.md` - For mental health clinics
- `supabase/functions/analyze-qualitative-data-optimized/prompts/hospital.md` - For medical facilities

**Edge Function Updates**:
1. Detects org type from `organisations` table
2. Maps specific types to categories (e.g., 'school-primary' → 'school')
3. Loads appropriate prompt file based on org type
4. Replaces `{child_name}` placeholders with actual child's first name
5. Returns debug info in response for troubleshooting

**Key Implementation Details**:
- System prompts explicitly instruct AI to use child's name
- User prompts include reinforcement to avoid generic terms like "the student"
- Debug info shows: orgType, promptFile, childName, systemPromptType

### Mood Heatmap Color Fix (2025-09-18)

**Issue**: Mood colors showing as gray instead of red-to-green gradient.

**Solution**: Replaced Tailwind classes with inline styles to bypass CSS purging issues.

**Color Mapping**:
- Mood 1: Red (#ef4444)
- Mood 2: Orange (#fb923c)
- Mood 3: Yellow (#fbbf24)
- Mood 4: Light Green (#34d399)
- Mood 5: Green (#10b981)

**File**: `src/components/analytics/MoodHeatmap.tsx` - Now uses inline `style` prop instead of Tailwind classes

### Edge Function Deployment

**Important**: Edge function changes require manual deployment to Supabase.

**Deployment Methods**:
1. Via Supabase Dashboard (Upload through web interface)
2. Via CLI (requires login):
   ```bash
   supabase login
   npx supabase functions deploy analyze-qualitative-data-optimized
   ```

**Note**: The `./deploy-optimized-edge-function.sh` script requires authentication and won't work without `supabase login`.

### Test Data Setup

**Organizations Created**:
- Westfield Primary School (id: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', type: 'school-primary')
- St. Mary's Hospital (id: '7eab219a-7c83-406c-a6b2-75ed44de715b', type: 'hospital')

**Important**: Children profiles must have valid `org_id` linking to existing organization for proper analysis.