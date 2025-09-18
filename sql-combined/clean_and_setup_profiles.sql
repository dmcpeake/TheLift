-- ====================================
-- CLEAN AND SETUP PROFILES
-- This ensures exactly 30 children + 3 practitioners
-- ====================================

-- First, delete ALL existing test data
DELETE FROM public.profiles
WHERE name IN (
    -- Practitioners
    'Dr. Sarah Mitchell', 'Ms. Emily Roberts', 'Dr. James Chen',
    -- Children
    'Emma Thompson', 'Aisha Patel', 'Oliver Chen', 'Sarah Williams', 'Marcus Johnson',
    'Isabella Rodriguez', 'Noah Kim', 'Zara Ahmed', 'Ethan Davis', 'Maya Sharma',
    'Chloe King', 'Liam Johnson', 'Emma Davis', 'Noah Wilson', 'Olivia Brown',
    'William Taylor', 'Sophia Martinez', 'James Anderson', 'Isabella Thomas', 'Benjamin Jackson',
    'Mia White', 'Lucas Harris', 'Charlotte Martin', 'Henry Thompson', 'Amelia Garcia',
    'Alexander Rodriguez', 'Harper Lewis', 'Michael Lee', 'Evelyn Walker', 'Daniel Hall'
);

-- Delete and recreate organizations
DELETE FROM public.organisations WHERE name IN ('St. Mary''s Hospital', 'Westfield Primary School', 'Mindful Wellness Clinic');

-- Create organizations
INSERT INTO public.organisations (id, name, type, status, created_at, updated_at)
VALUES
    (gen_random_uuid(), 'St. Mary''s Hospital', 'hospital', 'active', now(), now()),
    (gen_random_uuid(), 'Westfield Primary School', 'school-primary', 'active', now(), now()),
    (gen_random_uuid(), 'Mindful Wellness Clinic', 'clinic-private', 'active', now(), now());

-- Create exactly 3 practitioners
INSERT INTO public.profiles (id, name, email, role, org_id, status, created_at, updated_at)
VALUES
    (gen_random_uuid(), 'Dr. Sarah Mitchell', 'sarah.mitchell@hospital.com', 'Practitioner',
     (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Ms. Emily Roberts', 'emily.roberts@school.edu', 'Practitioner',
     (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Dr. James Chen', 'james.chen@clinic.com', 'Practitioner',
     (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now());

-- Create exactly 30 children (10 per organization)
-- Hospital children (10)
INSERT INTO public.profiles (id, name, role, org_id, status, created_at, updated_at)
VALUES
    (gen_random_uuid(), 'Emma Thompson', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Aisha Patel', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Oliver Chen', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Sarah Williams', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Marcus Johnson', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Isabella Rodriguez', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Noah Kim', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Zara Ahmed', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Ethan Davis', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now()),
    (gen_random_uuid(), 'Maya Sharma', 'Child', (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 'active', now(), now());

-- School children (10)
INSERT INTO public.profiles (id, name, role, org_id, status, created_at, updated_at)
VALUES
    (gen_random_uuid(), 'Chloe King', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Liam Johnson', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Emma Davis', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Noah Wilson', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Olivia Brown', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'William Taylor', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Sophia Martinez', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'James Anderson', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Isabella Thomas', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now()),
    (gen_random_uuid(), 'Benjamin Jackson', 'Child', (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 'active', now(), now());

-- Clinic children (10)
INSERT INTO public.profiles (id, name, role, org_id, status, created_at, updated_at)
VALUES
    (gen_random_uuid(), 'Mia White', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Lucas Harris', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Charlotte Martin', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Henry Thompson', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Amelia Garcia', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Alexander Rodriguez', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Harper Lewis', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Michael Lee', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Evelyn Walker', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now()),
    (gen_random_uuid(), 'Daniel Hall', 'Child', (SELECT id FROM public.organisations WHERE name = 'Mindful Wellness Clinic'), 'active', now(), now());

-- ====================================
-- VERIFICATION
-- Should show: 3 orgs, 3 practitioners, 30 children, 33 total
-- ====================================
SELECT 'Test Organizations:' as category, COUNT(*) as count
FROM public.organisations WHERE name IN ('St. Mary''s Hospital', 'Westfield Primary School', 'Mindful Wellness Clinic')
UNION ALL
SELECT 'Practitioners:', COUNT(*) FROM public.profiles WHERE role = 'Practitioner'
    AND name IN ('Dr. Sarah Mitchell', 'Ms. Emily Roberts', 'Dr. James Chen')
UNION ALL
SELECT 'Children:', COUNT(*) FROM public.profiles WHERE role = 'Child'
    AND name IN ('Emma Thompson', 'Aisha Patel', 'Oliver Chen', 'Sarah Williams', 'Marcus Johnson',
    'Isabella Rodriguez', 'Noah Kim', 'Zara Ahmed', 'Ethan Davis', 'Maya Sharma',
    'Chloe King', 'Liam Johnson', 'Emma Davis', 'Noah Wilson', 'Olivia Brown',
    'William Taylor', 'Sophia Martinez', 'James Anderson', 'Isabella Thomas', 'Benjamin Jackson',
    'Mia White', 'Lucas Harris', 'Charlotte Martin', 'Henry Thompson', 'Amelia Garcia',
    'Alexander Rodriguez', 'Harper Lewis', 'Michael Lee', 'Evelyn Walker', 'Daniel Hall')
UNION ALL
SELECT 'Total Test Profiles:', COUNT(*) FROM public.profiles
WHERE name IN (
    'Dr. Sarah Mitchell', 'Ms. Emily Roberts', 'Dr. James Chen',
    'Emma Thompson', 'Aisha Patel', 'Oliver Chen', 'Sarah Williams', 'Marcus Johnson',
    'Isabella Rodriguez', 'Noah Kim', 'Zara Ahmed', 'Ethan Davis', 'Maya Sharma',
    'Chloe King', 'Liam Johnson', 'Emma Davis', 'Noah Wilson', 'Olivia Brown',
    'William Taylor', 'Sophia Martinez', 'James Anderson', 'Isabella Thomas', 'Benjamin Jackson',
    'Mia White', 'Lucas Harris', 'Charlotte Martin', 'Henry Thompson', 'Amelia Garcia',
    'Alexander Rodriguez', 'Harper Lewis', 'Michael Lee', 'Evelyn Walker', 'Daniel Hall'
);