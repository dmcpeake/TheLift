-- Check if Felix exists and what data he has
-- Felix Baker UUID: 0804f356-4551-4b5d-83a2-c3c787bdac02

-- 1. Check if Felix exists in profiles
SELECT id, full_name, role, org_id
FROM profiles
WHERE id = '0804f356-4551-4b5d-83a2-c3c787bdac02';

-- 2. Count emotion_grid_usage records for Felix
SELECT COUNT(*) as emotion_count
FROM emotion_grid_usage
WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02';

-- 3. Show sample emotion_grid_usage records
SELECT created_at, explanation_text
FROM emotion_grid_usage
WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02'
ORDER BY created_at DESC
LIMIT 5;

-- 4. Count mood_meter_usage records for Felix
SELECT COUNT(*) as mood_count
FROM mood_meter_usage
WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02';

-- 5. Show sample mood_meter_usage records
SELECT created_at, mood_numeric, notes
FROM mood_meter_usage
WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02'
ORDER BY created_at DESC
LIMIT 5;

-- 6. Check if there's ANY data in emotion_grid_usage table
SELECT COUNT(*) as total_emotion_records FROM emotion_grid_usage;

-- 7. Check if there's ANY data in mood_meter_usage table
SELECT COUNT(*) as total_mood_records FROM mood_meter_usage;