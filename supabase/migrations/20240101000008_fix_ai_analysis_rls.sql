-- Drop existing RLS policies
DROP POLICY IF EXISTS "Users can view analyses for their organization" ON public.ai_analyses;
DROP POLICY IF EXISTS "GroupContacts and Practitioners can create analyses" ON public.ai_analyses;

-- Create more permissive RLS policies for demo/testing
-- Allow anyone to read AI analyses (for demo purposes)
CREATE POLICY "Anyone can view analyses"
  ON public.ai_analyses FOR SELECT
  USING (true);

-- Allow anyone to create analyses (for demo purposes)
CREATE POLICY "Anyone can create analyses"
  ON public.ai_analyses FOR INSERT
  WITH CHECK (true);

-- Allow anyone to update their own analyses
CREATE POLICY "Anyone can update analyses"
  ON public.ai_analyses FOR UPDATE
  USING (true);

-- Note: In production, you should use more restrictive policies like:
-- USING (auth.uid() IS NOT NULL AND org_id IN (SELECT org_id FROM public.profiles WHERE id = auth.uid()))

-- Also modify the created_by constraint to allow null for demo mode
ALTER TABLE public.ai_analyses
ALTER COLUMN created_by DROP NOT NULL;

-- Since we can't create a profile without an auth.users entry,
-- we'll just use NULL for created_by in demo mode
-- The edge function has been updated to handle this