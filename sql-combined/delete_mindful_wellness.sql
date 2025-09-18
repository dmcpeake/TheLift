-- Check and delete Mindful Wellness Clinic if it has no data

-- First, check what's associated with this org
SELECT 'Checking Mindful Wellness Clinic data...' as status;

SELECT
    o.name as org_name,
    (SELECT COUNT(*) FROM public.profiles WHERE org_id = o.id) as profile_count,
    (SELECT COUNT(*) FROM public.checkin_sessions WHERE org_id = o.id) as session_count,
    (SELECT COUNT(*) FROM public.mood_meter_usage WHERE org_id = o.id) as mood_count
FROM public.organisations o
WHERE o.name = 'Mindful Wellness Clinic';

-- Delete profiles associated with this org (if any)
DELETE FROM public.profiles
WHERE org_id = (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic');

-- Delete the organization
DELETE FROM public.organisations
WHERE name = 'Mindful Wellness Clinic';

-- Verify deletion
SELECT 'After deletion - remaining orgs:' as status;
SELECT id, name, type FROM public.organisations ORDER BY name;