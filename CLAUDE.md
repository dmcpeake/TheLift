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

### Avatar Colors Not Displaying (Fixed 2025-09-22)

**Issue**: Avatar colors in `/test/analytics` (ChildSummaryAnalytics.tsx) were displaying as gray instead of their configured colors.

**Root Cause**: CSS cascade issue where wireframe styles were overriding Tailwind color classes with gray (#6b7280).

**Solution**: Implemented inline styles for avatar background colors to bypass CSS specificity issues. All 9 avatar colors now display correctly with their assigned colors (blue, green, purple, etc.).

**Files Updated**:
- `src/components/analytics/ChildSummaryAnalytics.tsx` - Avatar rendering now uses inline styles instead of Tailwind classes

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

### Database Schema

**IMPORTANT**: When making decisions about database operations in a new chat, ALWAYS ask for the current schema or reference it from the project. Never assume table structures or constraints.

**Key Schema Details**:
- The `profiles` table has a foreign key to `auth.users(id)` - this constraint needs to be dropped before importing test data
- All tables have RLS (Row Level Security) which should be disabled for test data imports
- Foreign key order: organisations → profiles → checkin_sessions → tool usage tables (mood_meter_usage, breathing_tool_usage, etc.)
- Child profiles do NOT need corresponding auth.users entries if the foreign key constraint is removed

**For Data Imports**:
1. First disable all RLS policies and drop the profiles → auth.users constraint
2. Import in order: organisations → profiles → sessions → tool usage data
3. Re-enable security after data is populated

**UUID Generation**:
- ALL UUIDs in SQL files should be generated using `gen_random_uuid()` function
- Never use hardcoded UUID strings for new records
- This ensures unique IDs and avoids duplicate key violations

### Current Child Distribution (2025-09-19)

**Actual Children in Database**:
- **St. Mary's Hospital (3):** Aisha Patel, Emma Thompson, Sophia Chen
- **Wellmind Children's Clinic (3):** Charlie Brown, Maya Rodriguez, Sebastian Clarke
- **Westfield Primary School (3):** Ava Davis, Lucas Williams, Oliver Johnson

**Note**: The synthetic data generator creates different child names than originally expected. The current 3-3-3 distribution was achieved by moving Sophia Chen from Westfield to St. Mary's Hospital.

### Recent UI Improvements (2025-09-19)

#### Dynamic Loading Indicators
- **Created LoadingIndicator component** (`src/components/shared/LoadingIndicator.tsx`)
  - Multiple variants: spinner, progress bar, animated dots, pulse
  - Real progress tracking with percentage display
  - Size options (small, medium, large) and customizable colors
  - Auto-incremented progress when actual progress isn't available

- **DataLoadingIndicator** for multi-stage loading
  - Shows individual loading stages with status indicators
  - Visual checkmarks for completed stages
  - Used in ChildSummaryAnalytics for tracking data fetch progress

- **Updated components** to use new loading system:
  - ChildSummaryAnalytics: Shows detailed loading stages (organizations → profiles → check-ins → mood history → analytics)
  - EmotionGridDashboard: Uses animated dots variant
  - PractitionerDashboard: Large spinner with context messages

#### Analytics Improvements

##### Check-in History Filtering
- **Latest Check-ins section** now filters out entries with "No notes available"
- Only displays check-ins with actual qualitative data (mood notes, feelings explanations, wellbeing scores)
- Shows "No check-ins with notes available" when all entries lack meaningful notes
- Implementation in `loadCheckInHistory` function and display logic in `ChildSummaryAnalytics.tsx`

##### AI Insights Text Formatting
- **Created cleanupText function** to fix underscore-separated strings from AI responses
- Automatically converts technical strings to readable text:
  - `declining_pattern` → `declining pattern`
  - `emotional_state` → `emotional state`
  - `check_in` → `check-in`
  - `self_esteem` → `self-esteem`
  - `peer_relationships` → `peer relationships`
  - `family_dynamics` → `family dynamics`
  - `school_performance` → `school performance`
  - `mental_health` → `mental health`
  - Generic pattern catches any `word_word` → `word word`
- Applied to all AI analysis text: summaries, bullet points, and recommendations
- Implementation in `src/components/analytics/ChildSummaryAnalytics.tsx`

#### Test Pages
- **Loading Indicators Demo**: `/test/loading-indicators` - showcases all loading variants and animations
- **Analytics Test**: `/test/analytics` - demonstrates child summary analytics with AI insights

### SEND-Sensitive Language Implementation (2025-09-22)

**Overview**: Comprehensively updated the analytics system to use SEND-aware, person-first, and strengths-based language throughout all components and AI prompts.

#### Interface Language Updates
- **Changed "declining" trends to "developing"** - reframes challenges as growth opportunities
- **Updated "Child Wellbeing Summary" to "Wellbeing Support Overview"** - focuses on support rather than assessment
- **Replaced "Areas of Concern" with "Areas for Additional Support"** - removes deficit language
- **Changed "Insights" to "Support Insights"** - emphasizes supportive purpose
- **Updated "Executive Summary" to "Wellbeing Overview"** - more accessible language
- **Modified loading message** from "Analyzing child's wellbeing data" to "Understanding wellbeing patterns"
- **Color coding changes**: Developing trends now use amber instead of red to reduce alarm

#### AI Prompt Redesign
All three organization-specific prompts updated with:
- **Person-first language**: Uses "{child_name}" consistently, avoids labels
- **Strengths-based framing**: Focuses on abilities, coping strategies, and positive attributes
- **Support-oriented questions**: Asks "how can we support" rather than "what's wrong"
- **Neurodiversity awareness**: Includes accommodation language and celebrates individual differences
- **SEND terminology**: Uses appropriate professional language (reasonable adjustments, person-centered approaches)

**Files Updated**:
- `src/components/analytics/ChildSummaryAnalytics.tsx` - Interface language and data presentation
- `supabase/functions/analyze-qualitative-data-optimized/prompts/teacher.md` - Educational context prompts
- `supabase/functions/analyze-qualitative-data-optimized/prompts/clinic.md` - Therapeutic context prompts
- `supabase/functions/analyze-qualitative-data-optimized/prompts/hospital.md` - Medical context prompts

**Key Principles Applied**:
- Person-first language ("child with autism" not "autistic child")
- Strengths-based approach (building on abilities)
- Support-focused rather than deficit-focused
- Neurodiversity celebration and accommodation
- Family-friendly terminology alongside professional accuracy

## Recent Updates (2025-09-22)

### 1. Added Critical Support Alert System
- Children with average mood < 2.5 are flagged with red alerts
- Three severity levels: CRITICAL (≤1.5), SEVERE (1.5-2.0), HIGH (2.0-2.5)
- Visual indicators include red borders, pulsing icons, and "URGENT SUPPORT" badges
- Critical children automatically sorted to top of lists
- Component: `src/components/analytics/CriticalSupportAlert.tsx`

### 2. Enhanced Comparison Visualizations
- **Radar Chart**: Moved legend to left side with vertical layout
- **Timeline Chart**: Added mood emoticons on Y-axis (1😢 2😟 3😐 4😊 5😄)
- **Heatmap**: Fixed date range to show actual data period instead of future dates
- All visualizations now properly load mood history for all children

### 3. AI Insights Improvements
- **Text Formatting**: Fixed bullet point detection for various formats ("- ", " - ")
- **Field Name Cleanup**: Converts technical names (moodTrend → mood trend)
- **Sentence Capitalization**: Properly capitalizes sentences and children's names
- **Executive Summary**: Now displays ALL bullet points, not just partial content

### 4. Lottie Loader Implementation
- Installed `@lottiefiles/dotlottie-react` package
- Created `src/components/shared/LottieLoader.tsx` with multiple variants
- Deployed across all major loading states in the app
- Fixed duplicate loader issue by removing progress animation state updates

### 5. Adding New Test Children to Database (IMPORTANT PROCESS)

**Example: Jayden Martinez Addition**

#### Step 1: JSON Data Structure
When you have child data in JSON format, it should include:
```json
{
  "profile": {
    "name": "Jayden Martinez",
    "org_id": "61f8c1e3-29f1-4e3c-af8b-ffaff5c3a455",
    "initials": "JM",
    "grade": "Year 5",
    "teacher": "Mrs. Davis"
  },
  "sessions": [
    {
      "started_at": "2025-01-09T09:15:00Z",
      "completed_at": "2025-01-09T09:25:00Z",
      "mood": {
        "numeric": 1,
        "label": "Very Sad",
        "notes": "i feel like nobody understands me"
      },
      "wellbeing": {...}
    }
  ]
}
```

#### Step 2: SQL Conversion Process
Convert JSON to SQL using this template (`sql-combined/jayden_martinez_data_final.sql`):

```sql
DO $$
DECLARE
    v_child_id UUID;
    v_session_id UUID;
BEGIN
    -- Create child profile
    INSERT INTO profiles (
        id, name, role, created_at, updated_at,
        initials, grade, teacher, org_id
    )
    VALUES (
        gen_random_uuid(),
        'Jayden Martinez',
        'child',
        NOW() - INTERVAL '4 months',
        NOW(),
        'JM',
        'Year 5',
        'Mrs. Davis',
        '61f8c1e3-29f1-4e3c-af8b-ffaff5c3a455'::UUID
    )
    RETURNING id INTO v_child_id;

    -- Create check-in session
    INSERT INTO checkin_sessions (
        id, child_id, started_at, completed_at,
        status, wants_adult_conversation
    )
    VALUES (
        gen_random_uuid(),
        v_child_id,
        '2025-01-09 09:15:00+00',
        '2025-01-09 09:25:00+00',
        'completed',
        true
    )
    RETURNING id INTO v_session_id;

    -- Add mood data
    INSERT INTO mood_meter_usage (
        id, session_id, child_id, selected_at,
        mood_numeric, mood_label, explanation_text
    )
    VALUES (
        gen_random_uuid(),
        v_session_id,
        v_child_id,
        '2025-01-09 09:16:00+00',
        1,
        'Very Sad',
        'i feel like nobody understands me'
    );

    -- Add wellbeing scores (if applicable)
    INSERT INTO wellbeing_sessions (...)
END $$;
```

#### Step 3: Import to Database
1. Ensure RLS is disabled: `ALTER TABLE profiles DISABLE ROW LEVEL SECURITY;`
2. Drop foreign key constraint if needed: `ALTER TABLE profiles DROP CONSTRAINT IF EXISTS profiles_id_fkey;`
3. Run the SQL file
4. Re-enable security after import

#### Key Points for Adding Test Data:
- **ALWAYS use `gen_random_uuid()`** for all UUID fields
- **Use DO blocks** for complex inserts with dependencies
- **Organization IDs must exist** (check organisations table)
- **Correct org_id for Westfield Primary**: `61f8c1e3-29f1-4e3c-af8b-ffaff5c3a455`
- **Session IDs link** mood_meter_usage → checkin_sessions → profiles
- **Timestamps should be realistic** (past dates for test data)
- EHCP and SEN Code of Practice alignment
- Westfield Primary School is now "The Rainbow School"