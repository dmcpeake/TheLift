-- Quick debug - simple queries

-- 1. Check organizations exist
SELECT COUNT(*) as org_count FROM public.organisations;

-- 2. Check children exist
SELECT COUNT(*) as child_count FROM public.profiles WHERE role = 'Child';

-- 3. Check mood data exists
SELECT COUNT(*) as mood_count FROM public.mood_meter_usage;

-- 4. Sample one child with data
SELECT
    p.name as child_name,
    p.org_id,
    COUNT(m.id) as mood_readings
FROM public.profiles p
LEFT JOIN public.mood_meter_usage m ON m.child_id = p.id
WHERE p.role = 'Child'
GROUP BY p.name, p.org_id
LIMIT 5;

-- 5. Check org names
SELECT id, name FROM public.organisations LIMIT 5;