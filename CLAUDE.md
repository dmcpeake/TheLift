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

### Avatar Colors Not Displaying (Fixed 2025-09-22, Updated 2025-09-25)

**Issue**: Avatar colors in `/test/analytics` (ChildSummaryAnalytics.tsx) were displaying as gray instead of their configured colors. Additionally, avatar colors were changing when filtering by organization.

**Root Cause**:
1. CSS cascade issue where global/wireframe styles were overriding Tailwind color classes with gray (#6b7280)
2. Avatar colors were based on array index, which changed when filtering by organization

**Solution**:
1. Implemented inline styles for avatar background colors to bypass CSS specificity issues
2. Changed avatar color assignment from array index to child ID hash for consistency across filters
3. All 18 avatar colors now display correctly and remain consistent regardless of organization filter

**CRITICAL**: Avatar background colors MUST use inline `style={{ backgroundColor }}` NOT Tailwind classes. This prevents global CSS from overriding colors.

**Files Updated**:
- `src/components/analytics/ChildSummaryAnalytics.tsx` - Avatar rendering now uses:
  - Inline styles with `bgColorMap` object mapping Tailwind class names to hex colors
  - `getAvatarStyle(child.id)` using ID hash instead of array index
  - Debug logging to track color assignment in console

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

**Organizations Created** (Updated 2025-09-26):
- The Soke (id: '0e233a3b-e007-4eae-a9a5-4586c59b2faf')
- The Rainbow School (id: '61f8c1e3-29f1-4e3c-af8b-ffaff5c3a455', type: 'school-primary') - formerly Westfield Primary School
- Evelina Hospital (id: 'd3859fa2-4719-40db-8abf-9c6bf982272d', type: 'hospital')

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

### Current Child Distribution (Updated 2025-09-26)

**Actual Children in Database**:
- **The Rainbow School (formerly Westfield Primary):** Ava Davis, Lucas Williams, Oliver Johnson, Amelia Thompson, Jayden Martinez
- **Evelina Hospital (formerly St. Mary's Hospital):** Aisha Patel, Emma Thompson, Sophia Chen
- **The Soke:** (New organization - children to be added)
- **Wellmind Children's Clinic:** Charlie Brown, Maya Rodriguez, Sebastian Clarke (if still exists)

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

### 5. Wellbeing Wheel Data Generation (2025-01-08, Updated 2025-10-09)

**Status**: Partially completed - Rainbow School and Evelina Hospital have data. The Soke children need data.

**Overview**: Creating comprehensive wellbeing wheel check-in data for all children across 12 weeks (Jan 3 - Mar 28, 2025).

**Requirements**:
- 12 weekly check-ins per child (every Friday)
- 7 sections per check-in: my_friends, my_work, my_health, my_family, my_fun_play, my_safety, my_emotions
- 1-4 scoring scale (wellbeing wheel uses 1-4, NOT 1-5)
- Realistic text responses in each child's voice
- Child-specific patterns

**Schema Requirements** (CRITICAL):
```sql
-- wellbeing_wheel_usage table requires:
INSERT INTO wellbeing_wheel_usage (
  id, child_id, org_id, session_id, started_at, completed_at,
  overall_score, sections_completed, total_sections_completed,
  completion_status, created_at, updated_at
)

-- wellbeing_wheel_sections table requires:
INSERT INTO wellbeing_wheel_sections (
  id, wellbeing_wheel_id, child_id, section_name, mood_level,
  mood_numeric, text_response, text_response_length,
  completed_at, created_at
)
```

**Completed Files**:
- `sql-combined/wellbeing_wheel_complete_data.sql` - ✅ Rainbow School (Jayden Martinez, Amelia Thompson, Ava Davis, Lucas Williams, Oliver Johnson)
- `sql-combined/wellbeing_wheel_evelina_hospital.sql` - ✅ Evelina Hospital (Emma Thompson, Aisha Patel, Sophia Chen)

**Pending Files**:
- `sql-combined/wellbeing_wheel_the_soke.sql` - ⏳ PENDING (Sebastian Clarke, Maya Rodriguez, Charlie Brown)

**Organizations**:
- **The Rainbow School**: ID `61f8c1e3-29f1-4e3c-af8b-ffaff5c3a455` (type: school-primary)
- **Evelina Hospital**: ID `d3859fa2-4719-40db-8abf-9c6bf982272d` (type: hospital)
- **The Soke**: ID `0e233a3b-e007-4eae-a9a5-4586c59b2faf` (type: clinic-private) - formerly Wellmind Children's Clinic

**Child Patterns**:
1. **Jayden Martinez** (Rainbow School): Declining pattern 2.0 → 1.3 → 2.1 (bullying, family issues)
2. **Amelia Thompson** (Rainbow School): Stable-struggling 2.8-3.2 (anxiety, perfectionism)
3. **Ava Davis** (Rainbow School): Similar to Amelia, stable-struggling pattern
4. **Lucas Williams** (Rainbow School): Positive, stable ~3.4 average
5. **Oliver Johnson** (Rainbow School): Very positive ~3.3 average
6. **Emma Thompson** (Evelina Hospital): Trauma recovery 2.5 → 3.7
7. **Aisha Patel** (Evelina Hospital): Chronic illness management
8. **Sophia Chen** (Evelina Hospital): Hospital patient recovery
9. **Sebastian Clarke** (The Soke): ⏳ NEEDS PATTERN
10. **Maya Rodriguez** (The Soke): ⏳ NEEDS PATTERN
11. **Charlie Brown** (The Soke): ⏳ NEEDS PATTERN

**Prompt for Creating The Soke Wellbeing Wheel Data**:
```
I need to create wellbeing wheel check-in data for The Soke children (Sebastian Clarke, Maya Rodriguez, Charlie Brown).

IMPORTANT: The wellbeing wheel uses a 1-4 scale, NOT 1-5.

Organization Details:
- Name: The Soke
- ID: 0e233a3b-e007-4eae-a9a5-4586c59b2faf
- Type: clinic-private (mental health clinic)

Children (you'll need to look up their IDs in the profiles table):
1. Sebastian Clarke
2. Maya Rodriguez
3. Charlie Brown

Requirements:
- 12 weekly check-ins per child (Fridays: Jan 3, 10, 17, 24, 31, Feb 7, 14, 21, 28, Mar 7, 14, 21, 2025)
- 7 sections per check-in: my_friends, my_work, my_health, my_family, my_fun_play, my_safety, my_emotions
- 1-4 scoring scale (1=struggling, 2=okay, 3=good, 4=thriving)
- Realistic text responses reflecting mental health clinic context
- Child-specific patterns appropriate for therapy clients

Create realistic wellbeing patterns for each child that would be typical for young people receiving mental health support at a private clinic. Consider:
- Building therapeutic relationships over time
- Gradual improvements with occasional setbacks
- Mental health challenges appropriate for their ages
- Therapy-related progress indicators

Output: SQL file `sql-combined/wellbeing_wheel_the_soke.sql` following the exact schema format used in the other wellbeing wheel files.
```

### 6. Adding New Test Children to Database (IMPORTANT PROCESS)

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

## Wellbeing Wheel Analytics Implementation (2025-01-08)

### Overview
The analytics system has been updated to use **Wellbeing Wheel check-in data** instead of Mood Meter data as the primary data source. This provides richer insights across 7 life categories instead of just overall mood.

### Core Components

#### 1. WellbeingWheelHeatmap Component
**File**: `src/components/analytics/WellbeingWheelHeatmap.tsx`

**Purpose**: Interactive heatmap showing wellbeing check-ins over time with category drill-down

**Features**:
- Shows up to 10 most recent check-ins as columns (oldest→newest, left to right)
- Date headers in stacked format (Month / Day)
- Clickable cells with selection state
- Selected check-in highlighted with blue gradient + shadow
- Full-width responsive design
- Hover tooltips with category details

**Usage**:
```tsx
<WellbeingWheelHeatmap
  checkIns={checkInHistory[child.id]}
  selectedCheckInId={selectedCheckInIds[child.id]}
  onCheckInSelect={(checkInId) => setSelectedCheckInIds({...prev, [child.id]: checkInId})}
/>
```

#### 2. WellbeingWheelOverviewCard Component
**File**: `src/components/analytics/WellbeingWheelOverviewCard.tsx`

**Purpose**: Dashboard card showing aggregated wellbeing wheel statistics

**Features**:
- Summary stats: total check-ins, average score, children needing support
- Expandable drill-down with category summaries
- Individual child trends with bar charts showing all 7 categories
- Color-coded by category
- Filters by organization and date range

**Data Sources**:
- `wellbeing_wheel_usage` table (overall scores)
- `wellbeing_wheel_sections` table (category-specific scores)

#### 3. Child Details Card Redesign
**File**: `src/components/analytics/ChildSummaryAnalytics.tsx` (lines 1273-1377)

**Major Changes**:
- Replaced "Latest Check-ins" with interactive "Check-in Details"
- Auto-selects most recent check-in on child expansion
- Overall Wellbeing bar (colored by mood meter scale)
- Category-specific progress bars (7 categories)
- Removed emoticons, kept Lucide icons only
- Min-height matches AI section for visual consistency

**Category Definitions** (lines 21-30):
```typescript
const WELLBEING_CATEGORIES = {
  my_friends: { label: 'Friends', color: '#3B82F6', icon: Users, emoji: '👥' },
  my_work: { label: 'Work/School', color: '#8B5CF6', icon: Briefcase, emoji: '📚' },
  my_health: { label: 'Health', color: '#EF4444', icon: HeartPulse, emoji: '❤️' },
  my_family: { label: 'Family', color: '#F59E0B', icon: Home, emoji: '🏠' },
  my_fun_play: { label: 'Fun & Play', color: '#10B981', icon: Laugh, emoji: '🎨' },
  my_safety: { label: 'Safety', color: '#6366F1', icon: Shield, emoji: '🛡️' },
  my_emotions: { label: 'Emotions', color: '#EC4899', icon: Brain, emoji: '💭' }
}
```

#### 4. Data Loading Pattern
**File**: `src/components/analytics/ChildSummaryAnalytics.tsx` (lines 432-487)

**Implementation**:
```typescript
// Fetches wellbeing wheel check-ins with sections
const { data: wellbeingWheelData } = await supabase
  .from('wellbeing_wheel_usage')
  .select('id, child_id, session_id, completed_at, overall_score')
  .eq('child_id', childId)
  .order('completed_at', { ascending: false })
  .limit(10)

// For each check-in, fetch the 7 category sections
for (const wheel of wellbeingWheelData) {
  const { data: sections } = await supabase
    .from('wellbeing_wheel_sections')
    .select('section_name, mood_numeric, text_response')
    .eq('wellbeing_wheel_id', wheel.id)
}
```

**Auto-Selection** (lines 165-176):
```typescript
// Auto-select most recent check-in when data loads
useEffect(() => {
  if (expandedChild && checkInHistory[expandedChild]) {
    const checkIns = checkInHistory[expandedChild]
    if (checkIns.length > 0 && !selectedCheckInIds[expandedChild]) {
      const mostRecent = checkIns[0]
      setSelectedCheckInIds(prev => ({...prev, [expandedChild]: mostRecent.id}))
    }
  }
}, [checkInHistory, expandedChild])
```

### 5. "Over Time" Tab - Multi-Child Heatmaps
**File**: `src/components/analytics/WellbeingTreemap.tsx` (lines 379-490)

**Major Overhaul**:
- Replaced mood meter heatmaps with wellbeing wheel category heatmaps
- Shows **all children** in selected organization simultaneously
- Compact format: 7 category rows per child
- Time period: Jan-Mar 2025
- Color-coded cells (Red→Orange→Yellow→Green for scores 1-4)

**Smart Trend Detection**:
- **Declining indicator** (orange, TrendingDown icon): Categories dropping ≥1 point over last 3 check-ins
- **Concern indicator** (red, AlertTriangle icon): Categories scoring ≤2 in most recent check-in
- Alerts shown in child header for quick scanning

**Data Loading** (lines 132-172):
```typescript
useEffect(() => {
  const loadWellbeingData = async () => {
    for (const child of children) {
      const { data: wheelData } = await supabase
        .from('wellbeing_wheel_usage')
        .select('id, completed_at, overall_score')
        .eq('child_id', child.id)
        .gte('completed_at', '2025-01-01')
        .lte('completed_at', '2025-03-31')
        .order('completed_at', { ascending: true })

      // Fetch sections for each check-in...
    }
  }

  if (children.length > 0 && activeTab === 'over-time') {
    loadWellbeingData()
  }
}, [children, activeTab])
```

### 6. AI Prompts Updated for Wellbeing Wheel
**Files**:
- `supabase/functions/analyze-qualitative-data-optimized/prompts/teacher.md`
- `supabase/functions/analyze-qualitative-data-optimized/prompts/clinic.md`
- `supabase/functions/analyze-qualitative-data-optimized/prompts/hospital.md`

**Key Changes**:
- Prompts now reference all 7 wellbeing categories explicitly
- Ask AI to analyze patterns across categories
- Request cross-category insights (e.g., how Family impacts Work/School)
- Focus on category-specific strengths and support needs

**Example from teacher.md**:
```markdown
Looking at {child_name}'s wellbeing wheel data, help me understand:

**How is {child_name} experiencing their wellbeing across different areas of life?**
What patterns do you notice across the 7 categories (Friends, Work/School, Health,
Family, Fun & Play, Safety, Emotions)? Which areas are consistently strong? Which
areas show challenges or declining trends? How do these different areas connect and
influence each other?
```

### 7. Compare Children Modal (In Progress)
**File**: `src/components/analytics/comparison/ComparisonView.tsx`

**Status**: Props infrastructure updated
- Added `wellbeingData` prop to ComparisonView
- Passed wellbeing wheel data to all visualization components (Radar, Heatmap, Scatter, Timeline)
- Individual visualization components need updates to display 7 categories

**Next Steps**:
- Update ChildRadarComparison to show 7 category axes instead of just mood
- Update other comparison visualizations to use wellbeing categories

### Key Color Schemes

**Mood Meter Colors** (1-4 scale for wellbeing wheel):
```typescript
const MOOD_COLORS = {
  1: '#EF4444',  // Red - Very Sad
  2: '#F97316',  // Orange - Sad
  3: '#FCD34D',  // Yellow - OK
  4: '#10B981'   // Green - Happy
}
```

**Wellbeing Category Colors**:
- Friends: Blue (#3B82F6)
- Work/School: Purple (#8B5CF6)
- Health: Red (#EF4444)
- Family: Orange (#F59E0B)
- Fun & Play: Green (#10B981)
- Safety: Indigo (#6366F1)
- Emotions: Pink (#EC4899)

### Database Schema

**wellbeing_wheel_usage table**:
- `id` (UUID, primary key)
- `child_id` (UUID, FK to profiles)
- `org_id` (UUID, FK to organisations)
- `session_id` (UUID, FK to checkin_sessions)
- `started_at`, `completed_at` (timestamps)
- `overall_score` (numeric, average of 7 category scores)
- `sections_completed` (text array)
- `total_sections_completed` (integer, should be 7)
- `completion_status` (text, 'completed')

**wellbeing_wheel_sections table**:
- `id` (UUID, primary key)
- `wellbeing_wheel_id` (UUID, FK to wellbeing_wheel_usage)
- `child_id` (UUID, FK to profiles)
- `section_name` (text: my_friends, my_work, my_health, my_family, my_fun_play, my_safety, my_emotions)
- `mood_level` (text: very_sad, sad, ok, happy)
- `mood_numeric` (integer: 1-4)
- `text_response` (text, child's qualitative response)
- `text_response_length` (integer)
- `completed_at`, `created_at` (timestamps)

### Testing Data
- See `sql-combined/WELLBEING_WHEEL_README.md` for complete test data documentation
- 9 children with 12 weekly check-ins each (Jan-Mar 2025)
- Each check-in has 7 sections with scores and text responses
- Realistic narrative arcs (declining, stable, improving patterns)

### Routes for Testing
- `/test/analytics` - Main analytics page with child cards and wellbeing wheel heatmaps
- Click "Compare Children" to see comparison modal (visualizations in progress)
- Click "Over Time" tab to see multi-child category heatmaps with trend indicators

## "Over Time" Tab Implementation (2025-10-09)

### Overview
The "Over Time" tab in `/test/analytics` provides a comprehensive view of all children's wellbeing data in a compact matrix format with expandable historical timelines.

### Design Pattern: Matrix + Expandable Timeline

**Default View - Latest Scores Matrix**:
- Header row with 7 category icons (Friends, Work, Health, Family, Fun, Safety, Emotions)
- Child names listed vertically down the left (180px fixed width)
- Latest wellbeing score shown for each child × category combination
- Color-coded boxes (1-4 scale): Red → Orange → Yellow → Green
- Compact spacing (`space-y-1`, `gap-2`, `p-2`) to maximize data density

**Expanded View - Historical Timeline**:
- Click child row to expand full 12-week history
- Shows all 7 categories as rows
- Time flows left→right (Jan → Feb → Mar)
- Color-coded cells with scores displayed
- Overall wellbeing row at bottom
- Beautiful tooltips on hover (see below)

### Data Preloading Architecture

**Problem Solved**: Original implementation loaded wellbeing data on-demand when clicking "Over Time" tab, causing blank states and loading delays.

**Solution - Batch Preload on Initial Page Load**:

1. **New Loading Stage** (6th stage):
   - Added "Loading wellbeing wheel data" to initial loading sequence
   - Shows in progress bar with other stages

2. **Batch Query Function** (`loadAllWellbeingWheelData`):
   ```typescript
   // Single query for ALL check-ins (Jan-Mar 2025)
   const { data: wellbeingWheelData } = await supabase
     .from('wellbeing_wheel_usage')
     .select('id, child_id, completed_at, overall_score')
     .in('child_id', childIds)
     .gte('completed_at', '2025-01-01')
     .lte('completed_at', '2025-03-31')

   // Batch query for ALL sections
   const { data: allSections } = await supabase
     .from('wellbeing_wheel_sections')
     .select('wellbeing_wheel_id, section_name, mood_numeric, text_response')
     .in('wellbeing_wheel_id', wheelIds)
   ```

3. **Data Flow**:
   - `ChildSummaryAnalytics` loads data upfront → stores in `wellbeingWheelData` state
   - Passed as `preloadedWellbeingData` prop to `WellbeingTreemap`
   - "Over Time" tab displays instantly with no loading

**Files Modified**:
- `src/components/analytics/ChildSummaryAnalytics.tsx`:
  - Added `wellbeingWheelData` state
  - Added `loadAllWellbeingWheelData()` function
  - Added 6th loading stage
  - Passes data to WellbeingTreemap

- `src/components/analytics/WellbeingTreemap.tsx`:
  - Added `preloadedWellbeingData` prop
  - Removed `useEffect` data loading hook
  - Uses preloaded data directly

### Enhanced Wellbeing Tooltips

**Component**: `src/components/analytics/WellbeingTooltip.tsx`

**Built With**: Radix UI Tooltip (@radix-ui/react-tooltip)

**Visual Design**:
- **Border**: Color-coded to match wellbeing category
- **Header Section**:
  - Category dot (colored circle) + category name
  - Calendar icon + check-in date
- **Score Badge**:
  - Large color-coded pill (1-4 scale)
  - Descriptive label:
    - 1 = "Struggling" (Red #EF4444)
    - 2 = "Finding it hard" (Orange #F97316)
    - 3 = "OK" (Yellow #FCD34D)
    - 4 = "Doing well" (Green #10B981)
- **Text Response**:
  - Gradient background (blue-to-purple, `from-blue-50 to-purple-50`)
  - Message icon
  - Child's words in italics with quotes
  - Border for definition

**Applied To**:
- ✅ Summary row cells (latest scores)
- ✅ Expanded timeline cells (historical scores)
- Only renders when `text_response` exists

**Animation**:
- Smooth fade-in + zoom animation
- `data-[state=closed]:fade-out` on close
- 200ms delay before appearing

**Example Usage**:
```tsx
<WellbeingTooltip
  date="Jan 24"
  categoryName="Friends"
  categoryColor="#3B82F6"
  score={3}
  textResponse="i had fun playing with my friends today"
>
  <div className="w-7 h-7 rounded bg-yellow-400">3</div>
</WellbeingTooltip>
```

**Why This Matters**:
- Brings children's voices to the forefront
- Makes qualitative data instantly accessible
- No need to expand cards to read responses
- Practitioners can quickly scan and understand context

### UI Specifications

**Grid Layout**:
```css
gridTemplateColumns: '180px repeat(7, 1fr)'
```

**Spacing**:
- Between rows: `space-y-1` (4px)
- Grid gaps: `gap-2` (8px)
- Padding: `p-2` (8px)

**Score Boxes**:
- Summary row: `w-7 h-7` (28px × 28px)
- Expanded timeline: `h-10` (40px height)
- Font: `text-xs font-bold`

**Category Icons**:
- Size: `h-3 w-3` (12px)
- Color: Matches category color scheme
- Positioned next to labels in header

**Cursor States**:
- Summary row: `cursor-pointer` (entire row clickable)
- Score cells with tooltips: `cursor-help`
- Expanded cells: `hover:ring-2 hover:ring-blue-400`

### Performance Optimizations

1. **Batch Queries**:
   - Single query for all check-ins (not per-child)
   - Single query for all sections (not per-check-in)
   - Reduces database round trips from N×M to 2

2. **Client-Side Grouping**:
   - Group sections by `wellbeing_wheel_id` in memory
   - Fast lookups using Record<string, any[]>

3. **Conditional Tooltips**:
   - Only wraps cells that have `text_response`
   - Reduces DOM nodes for empty data

### Key Constants

```typescript
const WELLBEING_COLORS = {
  my_friends: '#3B82F6',
  my_work: '#8B5CF6',
  my_health: '#EF4444',
  my_family: '#F59E0B',
  my_fun_play: '#10B981',
  my_safety: '#6366F1',
  my_emotions: '#EC4899'
}

const CATEGORY_LABELS = {
  my_friends: 'Friends',
  my_work: 'Work',
  my_health: 'Health',
  my_family: 'Family',
  my_fun_play: 'Fun',
  my_safety: 'Safety',
  my_emotions: 'Emotions'
}

const MOOD_COLORS = {
  1: '#EF4444',  // Red
  2: '#F97316',  // Orange
  3: '#FCD34D',  // Yellow
  4: '#10B981'   // Green
}
```

### Testing Checklist

When testing "Over Time" tab:
- ✅ Matrix loads instantly (no loading spinner)
- ✅ All children show latest scores
- ✅ Click child expands timeline view
- ✅ Historical data shows all 12 weeks
- ✅ Hover tooltips appear with rich formatting
- ✅ Tooltips show child's text responses
- ✅ Colors match category/score properly
- ✅ Expand/collapse animation smooth
- ✅ No console errors
- ✅ Data persists when switching tabs