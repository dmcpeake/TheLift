-- Quick Delete - Remove all Jan-Mar 2025 data
-- Run this in Supabase SQL Editor

-- Delete in correct order (child tables first, respecting foreign keys)

-- 1. Delete emotion_grid_feelings (references emotion_grid_usage)
DELETE FROM public.emotion_grid_feelings
WHERE emotion_grid_id IN (
    SELECT id FROM public.emotion_grid_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

-- 2. Delete wellbeing_wheel_sections (references wellbeing_wheel_usage via wellbeing_wheel_id)
DELETE FROM public.wellbeing_wheel_sections
WHERE wellbeing_wheel_id IN (
    SELECT id FROM public.wellbeing_wheel_usage
    WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
);

-- 3. Delete tool usage tables (all reference checkin_sessions via session_id)
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

-- 4. Finally delete the checkin_sessions themselves
DELETE FROM public.checkin_sessions
WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';

-- Show remaining counts
SELECT 'Sessions' as table_name, COUNT(*) as count FROM checkin_sessions WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31'
UNION ALL
SELECT 'Mood Meter', COUNT(*) FROM mood_meter_usage WHERE selected_at >= '2025-01-01' AND selected_at <= '2025-03-31'
UNION ALL
SELECT 'Emotion Grid', COUNT(*) FROM emotion_grid_usage WHERE started_at >= '2025-01-01' AND started_at <= '2025-03-31';