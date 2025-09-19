-- Remove all children profiles that have no check-in sessions

-- First, show which children will be deleted
SELECT 'Children to be deleted (no check-in sessions):' as info;
SELECT
    p.name as child_name,
    o.name as org_name
FROM public.profiles p
JOIN public.organisations o ON p.org_id = o.id
LEFT JOIN public.checkin_sessions cs ON cs.child_id = p.id
WHERE p.role = 'Child'
AND cs.id IS NULL
ORDER BY o.name, p.name;

-- Delete children with no check-in sessions
DELETE FROM public.profiles
WHERE role = 'Child'
AND id NOT IN (
    SELECT DISTINCT child_id
    FROM public.checkin_sessions
);

-- Verify the deletion
SELECT 'Remaining children after cleanup:' as info;
SELECT
    o.name as org_name,
    COUNT(p.id) as child_count
FROM public.organisations o
LEFT JOIN public.profiles p ON p.org_id = o.id AND p.role = 'Child'
GROUP BY o.name
ORDER BY o.name;

-- Show all remaining children
SELECT 'All remaining children with data:' as info;
SELECT
    p.name as child_name,
    o.name as org_name,
    COUNT(cs.id) as sessions
FROM public.profiles p
JOIN public.organisations o ON p.org_id = o.id
LEFT JOIN public.checkin_sessions cs ON cs.child_id = p.id
WHERE p.role = 'Child'
GROUP BY p.name, o.name
ORDER BY o.name, p.name;