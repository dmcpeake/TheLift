# CLAUDE-ARCHIVE.md

Historical issues, fixes, and detailed implementation notes that have been resolved.

## Avatar Colors Not Displaying (Fixed 2025-09-22, Updated 2025-09-25)

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

## Date Handling in Analytics (Fixed 2025-09-18)

**Issue**: Dates in mood/wellbeing data were showing as September 2025 instead of the actual check-in dates (Jan-Apr 2025).

**Root Cause**: The code was using `created_at` field (when record was inserted) instead of `selected_at` field (when mood was actually recorded).

**Solution**: Updated all queries and components to use:
- `selected_at` for `mood_meter_usage` table
- `started_at` for `wellbeing_sessions` table

**Files Updated**:
- `src/components/analytics/ChildSummaryAnalytics.tsx` - Changed queries to order by `selected_at`
- `src/components/analytics/MoodHeatmap.tsx` - Updated to use `selected_at` for date display
- `supabase/functions/analyze-qualitative-data-optimized/index.ts` - Fixed date field references

## Mood Heatmap Color Fix (2025-09-18)

**Issue**: Mood colors showing as gray instead of red-to-green gradient.

**Solution**: Replaced Tailwind classes with inline styles to bypass CSS purging issues.

**Color Mapping**:
- Mood 1: Red (#ef4444)
- Mood 2: Orange (#fb923c)
- Mood 3: Yellow (#fbbf24)
- Mood 4: Light Green (#34d399)
- Mood 5: Green (#10b981)

**File**: `src/components/analytics/MoodHeatmap.tsx` - Now uses inline `style` prop instead of Tailwind classes

## Rollback: Individual Child Cards Restoration (2025-10-11)

**Issue**: Attempted to modify the Weekly Overview tab with new features (overall score column, urgent attention indicators, expandable views), but multiple implementation attempts resulted in incorrect styling and layout that didn't match the existing design patterns.

**User Feedback**:
- "What the heck is that. The styling is completely wrong. Also the columns and rows are the back to front."
- "Nearly. Look at the text sizes and alignment in the live version though."
- "No. Just no. Are you able to roll back the code changes to this time yesterday but keep the new tab titles?"

**Solution**: Rolled back `ChildSummaryAnalytics.tsx` to commit `b77900a` (before the "Update ChildSummaryAnalytics.tsx" commit).

**Command Used**:
```bash
git checkout b77900a -- src/components/analytics/ChildSummaryAnalytics.tsx
```

**What Was Restored**:
- Full children list section with expandable cards below the Weekly Overview table
- Avatar display with color mapping
- Mood indicators (Current, Average, Trend)
- Expandable sections showing:
  - Wellbeing Wheel Category Heatmap
  - Check-in Details with category breakdowns
  - AI Insights with loading animations

**What Was Preserved**:
- Tab title changes in `WellbeingTreemap.tsx`:
  - "🔍 Weekly Overview" (formerly "Over Time")
  - "📊 Data Viz" (formerly "Priorities")

**Lessons Learned**:
1. When modifying existing UI components, always check the live version first to understand the current design patterns
2. Use git history to identify working states before attempting major modifications
3. Preserve intentional changes (like tab titles) when rolling back other changes
4. When in doubt, revert to known working code rather than attempting multiple fixes

## AI Insights Loading UX Improvements (2025-10-11)

**Issue**: When clicking different treemap cells to switch between children, the AI insights "Support Insights" section did not display a loading indicator. This created a jarring UX where content appeared instantly without visual feedback, especially when switching to children with cached insights.

**Root Cause**:
- The `loadAIInsights` function had an early return if insights were already cached
- The UI was using a complex progress bar overlay that only showed during actual API calls
- When switching to a child with cached insights, `loadingInsights[childId]` was never set to true

**Solution Implemented**:

1. **Import Added** (ChildSummaryAnalytics.tsx:12):
```typescript
import { AIInsightsSkeleton } from '../shared/AIInsightsSkeleton'
```

2. **Conditional Rendering** (ChildSummaryAnalytics.tsx:1525-1527):
```typescript
{/* Show skeleton loader when loading */}
{loadingInsights[child.id] ? (
  <AIInsightsSkeleton />
) : (
  <div className="space-y-4">
    {/* AI insights content */}
  </div>
)}
```

3. **Removed Code**:
- Removed the entire progress bar overlay section (previously at lines 1664-1705)
- The overlay used blur effects and absolute positioning
- This approach wasn't showing when switching to children with cached insights

**Files Modified**:
- `src/components/analytics/ChildSummaryAnalytics.tsx` - Added AIInsightsSkeleton import and conditional rendering
- `src/components/shared/AIInsightsSkeleton.tsx` - Pre-existing component with animated placeholders

## Recent UI Improvements (2025-09-19)

### Dynamic Loading Indicators
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

### Analytics Improvements

#### Check-in History Filtering
- **Latest Check-ins section** now filters out entries with "No notes available"
- Only displays check-ins with actual qualitative data (mood notes, feelings explanations, wellbeing scores)
- Shows "No check-ins with notes available" when all entries lack meaningful notes
- Implementation in `loadCheckInHistory` function and display logic in `ChildSummaryAnalytics.tsx`

#### AI Insights Text Formatting
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

## SEND-Sensitive Language Implementation (2025-09-22)

**Overview**: Comprehensively updated the analytics system to use SEND-aware, person-first, and strengths-based language throughout all components and AI prompts.

### Interface Language Updates
- **Changed "declining" trends to "developing"** - reframes challenges as growth opportunities
- **Updated "Child Wellbeing Summary" to "Wellbeing Support Overview"** - focuses on support rather than assessment
- **Replaced "Areas of Concern" with "Areas for Additional Support"** - removes deficit language
- **Changed "Insights" to "Support Insights"** - emphasizes supportive purpose
- **Updated "Executive Summary" to "Wellbeing Overview"** - more accessible language
- **Modified loading message** from "Analyzing child's wellbeing data" to "Understanding wellbeing patterns"
- **Color coding changes**: Developing trends now use amber instead of red to reduce alarm

### AI Prompt Redesign
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

## Critical Support Alert System (2025-09-22)

- Children with average mood < 2.5 are flagged with red alerts
- Three severity levels: CRITICAL (≤1.5), SEVERE (1.5-2.0), HIGH (2.0-2.5)
- Visual indicators include red borders, pulsing icons, and "URGENT SUPPORT" badges
- Critical children automatically sorted to top of lists
- Component: `src/components/analytics/CriticalSupportAlert.tsx`

## Enhanced Comparison Visualizations (2025-09-22)

- **Radar Chart**: Moved legend to left side with vertical layout
- **Timeline Chart**: Added mood emoticons on Y-axis (1😢 2😟 3😐 4😊 5😄)
- **Heatmap**: Fixed date range to show actual data period instead of future dates
- All visualizations now properly load mood history for all children

## AI Insights Improvements (2025-09-22)

- **Text Formatting**: Fixed bullet point detection for various formats ("- ", " - ")
- **Field Name Cleanup**: Converts technical names (moodTrend → mood trend)
- **Sentence Capitalization**: Properly capitalizes sentences and children's names
- **Executive Summary**: Now displays ALL bullet points, not just partial content

## Lottie Loader Implementation (2025-09-22)

- Installed `@lottiefiles/dotlottie-react` package
- Created `src/components/shared/LottieLoader.tsx` with multiple variants
- Deployed across all major loading states in the app
- Fixed duplicate loader issue by removing progress animation state updates
