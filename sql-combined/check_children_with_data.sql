-- Check which children have check-in data

-- 1. Children in St. Mary's Hospital with their data counts
SELECT 'St. Marys Hospital Children:' as info;
SELECT
    p.name as child_name,
    p.id as child_id,
    o.name as org_name,
    COUNT(DISTINCT cs.id) as checkin_sessions,
    COUNT(DISTINCT m.id) as mood_readings,
    COUNT(DISTINCT e.id) as emotion_grids,
    COUNT(DISTINCT w.id) as wellbeing_wheels
FROM public.profiles p
JOIN public.organisations o ON p.org_id = o.id
LEFT JOIN public.checkin_sessions cs ON cs.child_id = p.id
LEFT JOIN public.mood_meter_usage m ON m.child_id = p.id
LEFT JOIN public.emotion_grid_usage e ON e.child_id = p.id
LEFT JOIN public.wellbeing_wheel_usage w ON w.child_id = p.id
WHERE p.role = 'Child'
AND o.name = 'St. Mary''s Hospital'
GROUP BY p.name, p.id, o.name
ORDER BY p.name;

-- 2. Children in Westfield Primary School with their data counts
SELECT 'Westfield Primary School Children:' as info;
SELECT
    p.name as child_name,
    p.id as child_id,
    o.name as org_name,
    COUNT(DISTINCT cs.id) as checkin_sessions,
    COUNT(DISTINCT m.id) as mood_readings,
    COUNT(DISTINCT e.id) as emotion_grids,
    COUNT(DISTINCT w.id) as wellbeing_wheels
FROM public.profiles p
JOIN public.organisations o ON p.org_id = o.id
LEFT JOIN public.checkin_sessions cs ON cs.child_id = p.id
LEFT JOIN public.mood_meter_usage m ON m.child_id = p.id
LEFT JOIN public.emotion_grid_usage e ON e.child_id = p.id
LEFT JOIN public.wellbeing_wheel_usage w ON w.child_id = p.id
WHERE p.role = 'Child'
AND o.name = 'Westfield Primary School'
GROUP BY p.name, p.id, o.name
ORDER BY p.name;

-- 3. Total children with NO data at all
SELECT 'Children with NO check-ins:' as info;
SELECT
    p.name as child_name,
    o.name as org_name
FROM public.profiles p
JOIN public.organisations o ON p.org_id = o.id
LEFT JOIN public.checkin_sessions cs ON cs.child_id = p.id
WHERE p.role = 'Child'
AND cs.id IS NULL
ORDER BY o.name, p.name;