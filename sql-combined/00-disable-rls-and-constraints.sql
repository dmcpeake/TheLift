-- ====================================
-- DISABLE ALL RLS AND REMOVE AUTH CONSTRAINTS
-- Run this FIRST before any data import
-- ====================================

-- Drop the foreign key constraint from profiles to auth.users
ALTER TABLE public.profiles
DROP CONSTRAINT IF EXISTS profiles_id_fkey;

-- Disable RLS on all tables
ALTER TABLE IF EXISTS public.profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.organisations DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.checkin_sessions DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.mood_meter_usage DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.breathing_tool_usage DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.emotion_grid_usage DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.emotion_grid_feelings DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.wellbeing_wheel_usage DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.wellbeing_wheel_sections DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.ai_analyses DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.child_profile_scores DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.feeling_definitions DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.invitations DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS public.waitlist DISABLE ROW LEVEL SECURITY;

-- Drop all RLS policies (if any exist)
DO $$
DECLARE
    pol record;
BEGIN
    FOR pol IN
        SELECT schemaname, tablename, policyname
        FROM pg_policies
        WHERE schemaname = 'public'
    LOOP
        EXECUTE format('DROP POLICY IF EXISTS %I ON %I.%I',
            pol.policyname, pol.schemaname, pol.tablename);
    END LOOP;
END $$;

-- Grant full permissions to authenticated and anon roles
GRANT ALL ON ALL TABLES IN SCHEMA public TO authenticated, anon;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO authenticated, anon;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO authenticated, anon;

-- ====================================
-- READY FOR DATA IMPORT
-- ====================================