-- Delete Existing Session Data for Clean Import
-- This script removes all check-in data from Jan-Mar 2025
-- to prepare for importing the complete journeys SQL

-- First, show counts before deletion
DO $$
DECLARE
    session_count INTEGER;
    mood_count INTEGER;
    breathing_count INTEGER;
    emotion_grid_count INTEGER;
    wellbeing_count INTEGER;
BEGIN
    -- Count existing records
    SELECT COUNT(*) INTO session_count FROM public.checkin_sessions
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    SELECT COUNT(*) INTO mood_count FROM public.mood_meter_usage
    WHERE selected_at >= '2025-01-01' AND selected_at <= '2025-03-31';

    SELECT COUNT(*) INTO breathing_count FROM public.breathing_tool_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    SELECT COUNT(*) INTO emotion_grid_count FROM public.emotion_grid_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    SELECT COUNT(*) INTO wellbeing_count FROM public.wellbeing_wheel_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    -- Log counts
    RAISE NOTICE 'Records to be deleted:';
    RAISE NOTICE '  Check-in sessions: %', session_count;
    RAISE NOTICE '  Mood meter entries: %', mood_count;
    RAISE NOTICE '  Breathing tool entries: %', breathing_count;
    RAISE NOTICE '  Emotion grid entries: %', emotion_grid_count;
    RAISE NOTICE '  Wellbeing wheel entries: %', wellbeing_count;
END $$;

-- Delete emotion_grid_feelings first (has foreign key to emotion_grid_usage)
DELETE FROM public.emotion_grid_feelings
WHERE emotion_grid_id IN (
    SELECT id FROM public.emotion_grid_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

-- Delete wellbeing_wheel_sections (has foreign key to wellbeing_wheel_usage)
DELETE FROM public.wellbeing_wheel_sections
WHERE wellbeing_wheel_usage_id IN (
    SELECT id FROM public.wellbeing_wheel_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

-- Delete tool usage data (references checkin_sessions)
DELETE FROM public.mood_meter_usage
WHERE selected_at >= '2025-01-01' AND selected_at <= '2025-03-31';

DELETE FROM public.breathing_tool_usage
WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

DELETE FROM public.emotion_grid_usage
WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

DELETE FROM public.wellbeing_wheel_usage
WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

-- Finally, delete the sessions themselves
DELETE FROM public.checkin_sessions
WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

-- Also delete any orphaned records that might have wrong dates but belong to Jan-Mar sessions
-- Delete by session_id references
DELETE FROM public.mood_meter_usage
WHERE session_id IN (
    SELECT id FROM public.checkin_sessions
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

DELETE FROM public.breathing_tool_usage
WHERE session_id IN (
    SELECT id FROM public.checkin_sessions
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

DELETE FROM public.emotion_grid_usage
WHERE session_id IN (
    SELECT id FROM public.checkin_sessions
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

DELETE FROM public.wellbeing_wheel_usage
WHERE session_id IN (
    SELECT id FROM public.checkin_sessions
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

-- Verify deletion
DO $$
DECLARE
    session_count INTEGER;
    mood_count INTEGER;
    breathing_count INTEGER;
    emotion_grid_count INTEGER;
    wellbeing_count INTEGER;
BEGIN
    -- Count remaining records
    SELECT COUNT(*) INTO session_count FROM public.checkin_sessions
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    SELECT COUNT(*) INTO mood_count FROM public.mood_meter_usage
    WHERE selected_at >= '2025-01-01' AND selected_at <= '2025-03-31';

    SELECT COUNT(*) INTO breathing_count FROM public.breathing_tool_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    SELECT COUNT(*) INTO emotion_grid_count FROM public.emotion_grid_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    SELECT COUNT(*) INTO wellbeing_count FROM public.wellbeing_wheel_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

    -- Log results
    RAISE NOTICE '';
    RAISE NOTICE 'Deletion complete. Remaining records:';
    RAISE NOTICE '  Check-in sessions: %', session_count;
    RAISE NOTICE '  Mood meter entries: %', mood_count;
    RAISE NOTICE '  Breathing tool entries: %', breathing_count;
    RAISE NOTICE '  Emotion grid entries: %', emotion_grid_count;
    RAISE NOTICE '  Wellbeing wheel entries: %', wellbeing_count;

    IF session_count = 0 AND mood_count = 0 AND breathing_count = 0 AND emotion_grid_count = 0 AND wellbeing_count = 0 THEN
        RAISE NOTICE '';
        RAISE NOTICE '✅ Database is clean and ready for import!';
    ELSE
        RAISE WARNING '⚠️ Some records remain. You may need to check for data outside Jan-Mar 2025 date range.';
    END IF;
END $$;