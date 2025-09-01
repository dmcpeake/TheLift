-- Insert test organisations only (no user profiles that depend on auth.users)
insert into public.organisations (id, name, type, email, status, subscription_plan, max_children, max_practitioners)
values 
  (
    '11111111-1111-1111-1111-111111111111',
    'Sunnydale Primary School',
    'school-primary',
    'admin@sunnydale.edu',
    'active',
    'professional',
    100,
    15
  ),
  (
    '22222222-2222-2222-2222-222222222222',
    'Riverside Clinic',
    'clinic-private',
    'info@riversideclinic.com',
    'active',
    'enterprise',
    200,
    25
  ),
  (
    '33333333-3333-3333-3333-333333333333',
    'Demo School',
    'school-secondary',
    'demo@school.edu',
    'trial',
    'essential',
    50,
    5
  ) 
on conflict (id) do nothing;