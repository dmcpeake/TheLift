-- Debug why analytics page is showing blank

-- 1. Check organizations
SELECT 'Organizations:' as info;
SELECT id, name, type FROM public.organisations ORDER BY name;

-- 2. Check children with their org associations
SELECT 'Children by Organization:' as info;
SELECT
    p.id,
    p.name,
    p.role,
    p.org_id,
    o.name as org_name
FROM public.profiles p
LEFT JOIN public.organisations o ON p.org_id = o.id
WHERE p.role = 'Child'
ORDER BY o.name, p.name
LIMIT 10;

-- 3. Check if we have mood data
SELECT 'Recent Mood Data:' as info;
SELECT
    m.child_id,
    p.name as child_name,
    m.mood_numeric,
    m.selected_at,
    m.org_id,
    o.name as org_name
FROM public.mood_meter_usage m
JOIN public.profiles p ON m.child_id = p.id
LEFT JOIN public.organisations o ON m.org_id = o.id
ORDER BY m.selected_at DESC
LIMIT 10;

-- 4. Check emotion grid data
SELECT 'Recent Emotion Grid Data:' as info;
SELECT
    e.child_id,
    p.name as child_name,
    e.completed_at,
    e.explanation_text
FROM public.emotion_grid_usage e
JOIN public.profiles p ON e.child_id = p.id
ORDER BY e.completed_at DESC
LIMIT 5;

-- 5. Check session counts by child
SELECT 'Session Counts by Child:' as info;
SELECT
    p.name as child_name,
    COUNT(DISTINCT cs.id) as total_sessions,
    COUNT(DISTINCT m.id) as mood_readings,
    COUNT(DISTINCT e.id) as emotion_grids
FROM public.profiles p
LEFT JOIN public.checkin_sessions cs ON cs.child_id = p.id
LEFT JOIN public.mood_meter_usage m ON m.child_id = p.id
LEFT JOIN public.emotion_grid_usage e ON e.child_id = p.id
WHERE p.role = 'Child'
GROUP BY p.name
ORDER BY total_sessions DESC
LIMIT 10;