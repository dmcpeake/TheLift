-- ====================================
-- DATABASE RECORD COUNTS
-- Shows all records imported from test data
-- ====================================

-- Summary counts by table
SELECT
    'checkin_sessions' as table_name,
    COUNT(*) as record_count
FROM public.checkin_sessions
UNION ALL
SELECT
    'mood_meter_usage',
    COUNT(*)
FROM public.mood_meter_usage
UNION ALL
SELECT
    'breathing_tool_usage',
    COUNT(*)
FROM public.breathing_tool_usage
UNION ALL
SELECT
    'emotion_grid_usage',
    COUNT(*)
FROM public.emotion_grid_usage
UNION ALL
SELECT
    'emotion_grid_feelings',
    COUNT(*)
FROM public.emotion_grid_feelings
UNION ALL
SELECT
    'wellbeing_wheel_usage',
    COUNT(*)
FROM public.wellbeing_wheel_usage
UNION ALL
SELECT
    'wellbeing_wheel_sections',
    COUNT(*)
FROM public.wellbeing_wheel_sections
UNION ALL
SELECT
    'profiles',
    COUNT(*)
FROM public.profiles
UNION ALL
SELECT
    'organisations',
    COUNT(*)
FROM public.organisations
ORDER BY table_name;

-- Detailed breakdown
SELECT '---' as separator;

-- Profile breakdown
SELECT
    role,
    COUNT(*) as count
FROM public.profiles
GROUP BY role
ORDER BY role;

SELECT '---' as separator;

-- Organization breakdown
SELECT
    name,
    type,
    (SELECT COUNT(*) FROM public.profiles WHERE org_id = o.id AND role = 'Child') as child_count,
    (SELECT COUNT(*) FROM public.profiles WHERE org_id = o.id AND role = 'Practitioner') as practitioner_count
FROM public.organisations o
ORDER BY name;

SELECT '---' as separator;

-- Session data by month
SELECT
    DATE_TRUNC('month', started_at) as month,
    COUNT(*) as session_count
FROM public.checkin_sessions
GROUP BY DATE_TRUNC('month', started_at)
ORDER BY month;

SELECT '---' as separator;

-- Grand totals
SELECT
    'GRAND TOTAL ALL RECORDS' as description,
    (
        (SELECT COUNT(*) FROM public.checkin_sessions) +
        (SELECT COUNT(*) FROM public.mood_meter_usage) +
        (SELECT COUNT(*) FROM public.breathing_tool_usage) +
        (SELECT COUNT(*) FROM public.emotion_grid_usage) +
        (SELECT COUNT(*) FROM public.emotion_grid_feelings) +
        (SELECT COUNT(*) FROM public.wellbeing_wheel_usage) +
        (SELECT COUNT(*) FROM public.wellbeing_wheel_sections) +
        (SELECT COUNT(*) FROM public.profiles) +
        (SELECT COUNT(*) FROM public.organisations)
    ) as total_records;