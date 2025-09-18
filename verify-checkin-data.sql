-- Check recent mood_meter_usage data for Felix Baker and other children
-- This will show you what's actually in your database

-- Felix Baker's recent check-ins
SELECT
    child_id,
    created_at,
    mood_level,
    mood_numeric,
    notes,
    'Felix Baker' as child_name
FROM mood_meter_usage
WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02'
ORDER BY created_at DESC
LIMIT 5;

-- Check if ANY children have mood data
SELECT
    child_id,
    COUNT(*) as check_in_count,
    AVG(mood_numeric) as avg_mood,
    MIN(created_at) as first_checkin,
    MAX(created_at) as last_checkin
FROM mood_meter_usage
GROUP BY child_id
ORDER BY check_in_count DESC
LIMIT 10;

-- Sample of actual recent mood entries across all children
SELECT
    m.child_id,
    p.full_name,
    m.created_at,
    m.mood_level,
    m.mood_numeric,
    m.notes
FROM mood_meter_usage m
LEFT JOIN profiles p ON p.id = m.child_id
ORDER BY m.created_at DESC
LIMIT 20;