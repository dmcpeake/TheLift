-- Fix RLS policies to allow anon role to read emotion and mood data
-- This will allow the edge function to access the data without service role key

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Allow anon read emotion_grid_usage" ON public.emotion_grid_usage;
DROP POLICY IF EXISTS "Allow anon read mood_meter_usage" ON public.mood_meter_usage;
DROP POLICY IF EXISTS "Allow anon read emotion_grid_feelings" ON public.emotion_grid_feelings;
DROP POLICY IF EXISTS "Allow anon read emotion_grid_usage_feelings" ON public.emotion_grid_usage_feelings;

-- Create new policies allowing anonymous read access
CREATE POLICY "Allow anon read emotion_grid_usage"
ON public.emotion_grid_usage
FOR SELECT
TO anon
USING (true);

CREATE POLICY "Allow anon read mood_meter_usage"
ON public.mood_meter_usage
FOR SELECT
TO anon
USING (true);

CREATE POLICY "Allow anon read emotion_grid_feelings"
ON public.emotion_grid_feelings
FOR SELECT
TO anon
USING (true);

CREATE POLICY "Allow anon read emotion_grid_usage_feelings"
ON public.emotion_grid_usage_feelings
FOR SELECT
TO anon
USING (true);

-- Verify the policies were created
SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual
FROM pg_policies
WHERE tablename IN ('emotion_grid_usage', 'mood_meter_usage', 'emotion_grid_feelings', 'emotion_grid_usage_feelings')
ORDER BY tablename, policyname;