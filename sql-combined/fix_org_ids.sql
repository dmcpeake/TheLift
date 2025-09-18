-- Fix org_id mismatches in all data tables
-- This updates all session and tool usage data to use the correct org_id from the child's profile

-- 1. Update checkin_sessions
UPDATE public.checkin_sessions cs
SET org_id = p.org_id
FROM public.profiles p
WHERE cs.child_id = p.id
AND cs.org_id != p.org_id;

-- 2. Update mood_meter_usage
UPDATE public.mood_meter_usage m
SET org_id = p.org_id
FROM public.profiles p
WHERE m.child_id = p.id
AND m.org_id != p.org_id;

-- 3. Update breathing_tool_usage
UPDATE public.breathing_tool_usage b
SET org_id = p.org_id
FROM public.profiles p
WHERE b.child_id = p.id
AND b.org_id != p.org_id;

-- 4. Update emotion_grid_usage
UPDATE public.emotion_grid_usage e
SET org_id = p.org_id
FROM public.profiles p
WHERE e.child_id = p.id
AND e.org_id != p.org_id;

-- 5. Update wellbeing_wheel_usage
UPDATE public.wellbeing_wheel_usage w
SET org_id = p.org_id
FROM public.profiles p
WHERE w.child_id = p.id
AND w.org_id != p.org_id;

-- Verify the fix
SELECT 'After Fix - Matching org_ids:' as status, COUNT(*) as count
FROM public.mood_meter_usage m
JOIN public.profiles p ON m.child_id = p.id
WHERE m.org_id = p.org_id
UNION ALL
SELECT 'After Fix - Mismatched org_ids:', COUNT(*)
FROM public.mood_meter_usage m
JOIN public.profiles p ON m.child_id = p.id
WHERE m.org_id != p.org_id;