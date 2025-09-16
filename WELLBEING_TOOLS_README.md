# Wellbeing Tools - React Prototypes Documentation

## Overview
Complete React prototype implementation of 4 wellbeing tools with full Supabase database integration for The Lift project.

## Components Created

### 1. Database Types (`src/types/database.ts`)
Complete TypeScript type definitions for all wellbeing-related database tables:
- `checkin_sessions` - Main session tracking
- `mood_meter_usage` - Mood tracking data
- `emotion_grid_usage` - Emotion selection sessions
- `emotion_grid_feelings` - Individual emotion selections
- `wellbeing_wheel_usage` - Wheel assessment sessions
- `wellbeing_wheel_sections` - Individual section scores
- `breathing_tool_usage` - Breathing exercise tracking
- `child_profile_scores` - Aggregated child metrics

### 2. Wellbeing Tools

#### Mood Meter (`src/components/child/mood-meter/MoodMeter.tsx`)
- 5-option mood selector (very_sad → very_happy)
- Visual emoji feedback
- Selection time tracking
- Database persistence
- Real-time visual feedback

#### Emotion Grid (`src/components/child/emotion-grid/EmotionGrid.tsx`)
- 3-step process flow
- 36 emotions in 4 categories
- Max 3 emotion selections
- Story input with 500 char limit
- Speech-to-text placeholder
- Progress tracking

#### Wellbeing Wheel (`src/components/child/wellbeing-wheel/WellbeingWheel.tsx`)
- 7 life sections assessment
- Visual wheel representation
- Optional notes per section
- Overall score calculation
- SVG-based circular visualization

#### Breathing Tool (`src/components/child/breathing-tool/BreathingTool.tsx`)
- 4 breathing patterns
- Real-time animation
- Cycle counting
- Duration tracking
- Pause/resume functionality

### 3. Check-In Flow Orchestrator (`src/components/child/check-in-flow/CheckInFlow.tsx`)
- Tool selection in any order
- Progress tracking
- Session management
- Completion status
- Profile score updates

### 4. Admin/Debug Interface (`src/components/admin/wellbeing-debug/WellbeingDebug.tsx`)
Features:
- Data generator for all tools
- Database viewer
- Mock data creation
- SQL query interface
- Tool testing launcher
- Data cleanup utilities

### 5. Utility Functions

#### Database Helpers (`src/utils/wellbeing/database-helpers.ts`)
- Session creation/management
- Data persistence for all tools
- Profile score calculations
- Data aggregation functions

#### Mock Data Generators (`src/utils/wellbeing/mock-data.ts`)
- Random data generation
- Test scenarios
- Bulk data creation
- Data cleanup functions

## Test Routes

Access the tools at these URLs:

### Individual Tools
- `/test/mood-meter` - Mood Meter standalone
- `/test/emotion-grid` - Emotion Grid standalone
- `/test/wellbeing-wheel` - Wellbeing Wheel standalone
- `/test/breathing-tool` - Breathing Tool standalone
- `/test/check-in-flow` - Complete check-in flow
- `/test/admin-debug` - Admin debug interface

### URL Parameters
All test routes accept a `childId` parameter:
```
/test/mood-meter?childId=test_child_123
```

## Usage Examples

### Basic Component Usage
```tsx
import { MoodMeter } from '@/components/child/mood-meter/MoodMeter'

<MoodMeter 
  childId="child_123"
  sessionId="session_456" // optional
  onComplete={(mood) => console.log('Selected:', mood)}
  showSelectionTime={true}
/>
```

### Complete Check-In Flow
```tsx
import { CheckInFlow } from '@/components/child/check-in-flow/CheckInFlow'

<CheckInFlow 
  childId="child_123"
  sessionType="morning" // or 'afternoon', 'evening', 'as_needed'
  onComplete={() => console.log('Session complete')}
/>
```

### Database Operations
```tsx
import { saveMoodMeter, createCheckinSession } from '@/utils/wellbeing/database-helpers'

// Create a new session
const session = await createCheckinSession('child_123', 'morning')

// Save mood data
await saveMoodMeter('child_123', 'happy', 2500, session.id)
```

## Designer Testing Features

### Admin Debug Interface (`/test/admin-debug`)
1. **Data Generator Tab**
   - Generate test child IDs
   - Create mock data for each tool
   - Generate complete check-in sessions
   - Clear all data for a child

2. **Data Viewer Tab**
   - Browse all database tables
   - Filter by child ID
   - Real-time data refresh
   - JSON export capability

3. **Tool Tester Tab**
   - Launch individual tools
   - Pre-populate with test data
   - Quick access buttons

4. **SQL Query Tab**
   - Execute custom queries
   - View raw database results

### Mock Data Generation
```tsx
import { generateMockCheckInData } from '@/utils/wellbeing/mock-data'

const mockData = generateMockCheckInData()
// Returns: childId, mood, emotions, story, wellbeingScores, breathing data
```

## Database Schema Requirements

The components expect these Supabase tables to exist:
- checkin_sessions
- mood_meter_usage
- emotion_grid_usage
- emotion_grid_feelings
- feeling_definitions
- wellbeing_wheel_usage
- wellbeing_wheel_sections
- breathing_tool_usage
- child_profile_scores

## Key Features

### For Designers
- Visual feedback for all interactions
- Real-time data persistence
- Easy data reset/cleanup
- Mock data generation
- Testing without authentication

### For Developers
- Full TypeScript support
- Modular component architecture
- Reusable utility functions
- Error handling throughout
- Loading states included

## Component Props

### MoodMeter
- `childId` (required): Child identifier
- `sessionId` (optional): Session tracking
- `onComplete` (optional): Completion callback
- `showSelectionTime` (optional): Display timing

### EmotionGrid
- `childId` (required): Child identifier
- `sessionId` (optional): Session tracking
- `onComplete` (optional): Completion callback

### WellbeingWheel
- `childId` (required): Child identifier
- `sessionId` (optional): Session tracking
- `onComplete` (optional): Completion callback

### BreathingTool
- `childId` (required): Child identifier
- `sessionId` (optional): Session tracking
- `onComplete` (optional): Completion callback

### CheckInFlow
- `childId` (required): Child identifier
- `sessionType` (optional): Session type
- `onComplete` (optional): Completion callback

## Next Steps

1. **Database Setup**: Ensure all required tables exist in Supabase
2. **RLS Policies**: Configure row-level security as needed
3. **UI Refinement**: Designer can refine visual elements
4. **Integration**: Connect to authentication system
5. **Analytics**: Add telemetry and tracking

## Testing Workflow

1. Navigate to `/test/admin-debug`
2. Generate a new child ID
3. Use "Generate Complete Session" to create test data
4. Open individual tools to test functionality
5. View generated data in "Data Viewer" tab
6. Clear data when done testing

## Notes
- All components use Tailwind CSS for styling
- Radix UI components for accessibility
- Framer Motion ready for animations
- Fully responsive design
- Error handling included throughout