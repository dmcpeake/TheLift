# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Development Commands

### Core Development
- **Start development server**: `npm run dev` (runs on port 3000)
- **Build for production**: `npm run build` (outputs to `build/` directory)

### Testing & Linting
No test or lint commands currently configured. Consider adding ESLint and test runner (Jest/Vitest).

## Tech Stack

- **Frontend**: React 18 with TypeScript, Vite + SWC
- **Styling**: Tailwind CSS with Radix UI primitives (shadcn/ui patterns)
- **Database/Auth**: Supabase (PostgreSQL + Auth)
- **Routing**: React Router v6
- **State Management**: React Context API for auth
- **Animation**: Framer Motion and Lottie React

## Key Architectural Patterns

### Multi-Role Platform
Three user types with distinct experiences:
1. **Account (Admin)**: `/admin/*` routes - platform administrators
2. **GroupContact/Practitioner**: `/dashboard`, `/children/*` - organization staff
3. **Child**: `/child/*` routes - end users (no navigation bar, focused UI)

### Authentication Flow
- `AuthContext` in `src/App.tsx` manages centralized auth
- `ProtectedRoute` component handles role-based routing
- Auto-redirect on login based on role
- Multi-mode support for users with multiple roles

### Component Organization
- `components/admin/` - Admin-specific components
- `components/practitioner/` - Practitioner management
- `components/child/` - Child app components
- `components/analytics/` - Analytics and visualization
- `components/shared/` - Reusable cross-role components
- `components/auth/` - Authentication components

### Supabase Integration
- Edge functions: `supabase/functions/server/`
- Migrations: `supabase/migrations/`
- Client: `src/utils/supabase/client.ts`
- Deploy edge functions: `supabase functions deploy <name>` (requires `supabase login`)

## Database Schema

**IMPORTANT**: Always check current schema before database operations. Never assume table structures.

### Key Schema Details
- `profiles` table has FK to `auth.users(id)` - drop before test data imports
- All tables have RLS (Row Level Security) - disable for imports
- Foreign key order: organisations → profiles → checkin_sessions → tool usage tables
- Child profiles don't need auth.users entries if FK constraint is removed

### UUID Generation
- **ALWAYS use `gen_random_uuid()`** for all UUID fields
- Never use hardcoded UUID strings for new records

### Data Import Process
1. Disable RLS: `ALTER TABLE profiles DISABLE ROW LEVEL SECURITY;`
2. Drop FK: `ALTER TABLE profiles DROP CONSTRAINT IF EXISTS profiles_id_fkey;`
3. Import in order: organisations → profiles → sessions → tool usage
4. Re-enable security after import

## Test Data

### Organizations
- **The Rainbow School**: ID `61f8c1e3-29f1-4e3c-af8b-ffaff5c3a455` (type: school-primary)
- **Evelina Hospital**: ID `d3859fa2-4719-40db-8abf-9c6bf982272d` (type: hospital)
- **The Soke**: ID `0e233a3b-e007-4eae-a9a5-4586c59b2faf` (type: clinic-private)

### Children Distribution
- **Rainbow School**: Ava Davis, Lucas Williams, Oliver Johnson, Amelia Thompson, Jayden Martinez
- **Evelina Hospital**: Aisha Patel, Emma Thompson, Sophia Chen
- **The Soke**: Sebastian Clarke, Maya Rodriguez, Charlie Brown

### Test Data Details
- See `sql-combined/WELLBEING_WHEEL_README.md` for complete documentation
- 9 children with 12 weekly check-ins each (Jan-Mar 2025)
- 7 wellbeing categories per check-in
- Realistic narrative arcs for each child

## Wellbeing Wheel Analytics System

### Overview
Analytics system uses **Wellbeing Wheel check-in data** (7 life categories) instead of just mood data.

### 7 Wellbeing Categories
- **my_friends** (Friends) - Blue #3B82F6
- **my_work** (Work/School) - Purple #8B5CF6
- **my_health** (Health) - Red #EF4444
- **my_family** (Family) - Orange #F59E0B
- **my_fun_play** (Fun & Play) - Green #10B981
- **my_safety** (Safety) - Indigo #6366F1
- **my_emotions** (Emotions) - Pink #EC4899

### Scoring Scale
- Wellbeing wheel uses **1-4 scale** (NOT 1-5)
- 1 = Struggling (Red #EF4444)
- 2 = Finding it hard (Orange #F97316)
- 3 = OK (Yellow #FCD34D)
- 4 = Doing well (Green #10B981)

### Database Tables

**wellbeing_wheel_usage**:
- Stores overall check-in metadata
- Fields: id, child_id, org_id, session_id, started_at, completed_at, overall_score
- `overall_score` = average of 7 category scores

**wellbeing_wheel_sections**:
- Stores individual category responses
- Fields: id, wellbeing_wheel_id, child_id, section_name, mood_numeric, text_response
- 7 rows per check-in (one per category)

### Key Components

#### WellbeingWheelHeatmap
**File**: `src/components/analytics/WellbeingWheelHeatmap.tsx`

Interactive calendar heatmap showing up to 10 recent check-ins with clickable dates and category drill-down.

#### WellbeingTooltip
**File**: `src/components/analytics/WellbeingTooltip.tsx`

Radix UI tooltips showing category details, scores, and child's text responses on hover. Only renders when `text_response` exists.

#### ChildSummaryAnalytics
**File**: `src/components/analytics/ChildSummaryAnalytics.tsx`

Main analytics page at `/test/analytics`. Features:
- Expandable child cards with avatar colors (use inline styles, NOT Tailwind classes)
- Wellbeing heatmap integration
- Check-in details with 7 category progress bars
- AI insights with skeleton loading states

### Data Loading Pattern

```typescript
// Fetch wellbeing wheel check-ins
const { data: wellbeingWheelData } = await supabase
  .from('wellbeing_wheel_usage')
  .select('id, child_id, completed_at, overall_score')
  .eq('child_id', childId)
  .order('completed_at', { ascending: false })
  .limit(10)

// Fetch category sections for each check-in
for (const wheel of wellbeingWheelData) {
  const { data: sections } = await supabase
    .from('wellbeing_wheel_sections')
    .select('section_name, mood_numeric, text_response')
    .eq('wellbeing_wheel_id', wheel.id)
}
```

### Batch Preloading (Performance)
- `loadAllWellbeingWheelData()` in ChildSummaryAnalytics
- Single query for all check-ins (Jan-Mar 2025)
- Single query for all sections
- Reduces DB round trips from N×M to 2
- Data passed as `preloadedWellbeingData` prop to child components

## Analytics Tabs

### 🔍 Weekly Overview (formerly "Over Time")
**File**: `src/components/analytics/WellbeingTreemap.tsx` (lines 379-490)

**Matrix View**:
- Header row with 7 category icons
- Child names in left column (180px fixed width)
- Latest scores for each child × category
- Color-coded cells (1-4 scale)

**Expanded Timeline**:
- Click child row to expand 12-week history
- 7 category rows + overall wellbeing row
- Time flows left→right (Jan → Feb → Mar)
- Hover tooltips with text responses

**Grid Layout**: `gridTemplateColumns: '180px repeat(7, 1fr)'`

### 📊 Data Viz (formerly "Priorities")
**File**: `src/components/analytics/WellbeingTreemap.tsx` (lines 323-831)

**Treemap Visualization**:
- Color-coded squares for all children
- Size based on support urgency
- Clickable squares expand detail card below

**Expandable Detail Card**:
- Framer Motion animation
- Two-column layout: check-in data (left) + AI insights (right)
- WellbeingWheelHeatmap with 10 recent check-ins
- Category progress bars with emojis
- AI analysis with skeleton loading states

**Critical Implementation**:
- Clear old data before loading new child (lines 217-220)
- Prevents visual confusion during transitions

## AI Analysis System

### Organization-Specific Prompts
**Location**: `supabase/functions/analyze-qualitative-data-optimized/prompts/`

Three prompt files:
- `teacher.md` - For school organizations (type: school-primary, school-secondary)
- `clinic.md` - For mental health clinics (type: clinic-private)
- `hospital.md` - For medical facilities (type: hospital)

### SEND-Aware Language
All prompts use:
- Person-first language (child's name, not labels)
- Strengths-based framing
- Support-oriented questions
- Neurodiversity celebration
- Professional + family-friendly terminology

### Edge Function
**Name**: `analyze-qualitative-data-optimized`

**Input**:
```json
{
  "childId": "uuid",
  "dateRange": "all",
  "analysisType": "comprehensive"
}
```

**Response Structure**:
- summary (Wellbeing Overview)
- concerns (Areas for Additional Support)
- strengths (Positive Indicators)
- recommendations

**Deployment**: Deploy via Supabase dashboard or `npx supabase functions deploy analyze-qualitative-data-optimized`

### AI Insights Loading
- Uses `AIInsightsSkeleton` component during loading
- Skeleton shows for both cached and non-cached insights
- Smooth transition to actual content
- Location: `src/components/shared/AIInsightsSkeleton.tsx`

## Word Cloud Feature (PENDING)

### Frontend: Complete
**Component**: `src/components/analytics/WordCloudCard.tsx`
- Uses `@isoterik/react-word-cloud` package
- Child selector dropdown
- Loading/empty/error states

### Backend: Pending
**Edge Function**: `generate-word-cloud` (TO BE CREATED)
- Extract themes from wellbeing text responses
- Use Anthropic API for keyword extraction
- Return words with frequency scores (1-100)
- Cache results for common queries

**Priority**: HIGH - Required for Data Viz tab completion

See CLAUDE-ARCHIVE.md for full edge function specification.

## Wellbeing Wheel Data Generation

### Status
- ✅ Rainbow School - 5 children with 12 weekly check-ins
- ✅ Evelina Hospital - 3 children with 12 weekly check-ins
- ⏳ The Soke - 3 children **PENDING**

### Requirements
- 12 weekly check-ins per child (Fridays: Jan 3 - Mar 21, 2025)
- 7 sections per check-in
- 1-4 scoring scale
- Realistic text responses in child's voice
- Organization-appropriate context (school/hospital/clinic)

### Schema Template

```sql
DO $$
DECLARE
    v_child_id UUID;
    v_session_id UUID;
    v_wheel_id UUID;
BEGIN
    -- Get child ID
    SELECT id INTO v_child_id FROM profiles WHERE name = 'Child Name';

    -- Create check-in session
    INSERT INTO checkin_sessions (...)
    RETURNING id INTO v_session_id;

    -- Create wellbeing wheel usage
    INSERT INTO wellbeing_wheel_usage (...)
    RETURNING id INTO v_wheel_id;

    -- Insert 7 category sections
    INSERT INTO wellbeing_wheel_sections (...) VALUES
      (gen_random_uuid(), v_wheel_id, v_child_id, 'my_friends', ...),
      -- repeat for all 7 categories
END $$;
```

## Important Implementation Notes

### Avatar Colors
**CRITICAL**: Avatar background colors MUST use inline `style={{ backgroundColor }}` NOT Tailwind classes. Global CSS overrides Tailwind classes with gray.

**Implementation**:
```typescript
const getAvatarStyle = (childId: string) => {
  // Hash child ID for consistent color assignment
  const hash = childId.split('').reduce((acc, char) => acc + char.charCodeAt(0), 0)
  const colorIndex = hash % 18
  return { backgroundColor: bgColorMap[colorIndex] }
}
```

### Date Field Usage
- Use `selected_at` for `mood_meter_usage` table
- Use `started_at` for `wellbeing_sessions` and `wellbeing_wheel_usage` tables
- Never use `created_at` for date display (shows insert time, not event time)

### Data Clearing Pattern
When switching between children in UI, always clear old data first:
```typescript
setDetailCheckInHistory([])
setDetailAIInsights(undefined)
setSelectedDetailCheckInId(undefined)
```

### Test Pages
- `/test/analytics` - Main analytics page with child cards
- `/test/loading-indicators` - Loading component showcase

## For More Details

- **Historical fixes**: See `CLAUDE-ARCHIVE.md`
- **Test data documentation**: See `sql-combined/WELLBEING_WHEEL_README.md`
- **Deployment**: Supabase Dashboard at https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc
