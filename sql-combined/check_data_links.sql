-- Check data relationships

-- 1. Which org do children belong to?
SELECT
    o.name as org_name,
    COUNT(p.id) as child_count
FROM public.organisations o
LEFT JOIN public.profiles p ON p.org_id = o.id AND p.role = 'Child'
GROUP BY o.name
ORDER BY o.name;

-- 2. Sample children with their orgs
SELECT
    p.name as child_name,
    o.name as org_name,
    p.org_id
FROM public.profiles p
LEFT JOIN public.organisations o ON p.org_id = o.id
WHERE p.role = 'Child'
ORDER BY p.name
LIMIT 10;

-- 3. Check if mood data org_ids match profile org_ids
SELECT
    COUNT(*) as matching_org_mood_records
FROM public.mood_meter_usage m
JOIN public.profiles p ON m.child_id = p.id
WHERE m.org_id = p.org_id;

-- 4. Count mismatched org_ids
SELECT
    COUNT(*) as mismatched_org_mood_records
FROM public.mood_meter_usage m
JOIN public.profiles p ON m.child_id = p.id
WHERE m.org_id != p.org_id;