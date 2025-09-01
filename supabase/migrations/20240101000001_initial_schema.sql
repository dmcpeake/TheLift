-- Enable necessary extensions
create extension if not exists "uuid-ossp";

-- Create organisations table first (referenced by other tables)
create table public.organisations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  type text not null check (type in ('school-primary', 'school-secondary', 'academy-trust', 'clinic-private', 'nhs-trust', 'hospital', 'charity', 'other')),
  address_line_1 text,
  address_line_2 text,
  city text,
  postcode text,
  country text default 'UK',
  phone text,
  email text,
  website text,
  status text not null default 'active' check (status in ('active', 'inactive', 'trial', 'suspended')),
  subscription_plan text default 'essential' check (subscription_plan in ('essential', 'professional', 'enterprise')),
  max_children integer default 50,
  max_practitioners integer default 5,
  settings jsonb default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Create profiles table (extends auth.users)
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null,
  name text not null,
  role text not null check (role in ('Account', 'GroupContact', 'Practitioner', 'Child')),
  org_id uuid references public.organisations(id) on delete set null,
  status text not null default 'active' check (status in ('active', 'inactive', 'pending', 'suspended')),
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Create children table
create table public.children (
  id uuid primary key references public.profiles(id) on delete cascade,
  first_name text not null,
  date_of_birth date,
  year_group text,
  class_name text,
  primary_practitioner_id uuid references public.profiles(id),
  parent_guardian_name text,
  parent_guardian_email text,
  parent_guardian_phone text,
  consent_given boolean not null default false,
  consent_date timestamptz,
  consent_type text check (consent_type in ('verbal', 'written', 'digital')),
  safeguarding_notes text,
  additional_notes text,
  avatar_character text default 'default',
  preferences jsonb default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Create wellbeing_sessions table
create table public.wellbeing_sessions (
  id uuid primary key default gen_random_uuid(),
  child_id uuid not null references public.children(id) on delete cascade,
  session_type text not null check (session_type in ('daily_checkin', 'weekly_review', 'monthly_assessment')),
  status text not null default 'in_progress' check (status in ('in_progress', 'completed', 'abandoned')),
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  duration_seconds integer,
  activities_completed text[] default '{}',
  overall_mood integer check (overall_mood between 1 and 5),
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Create wellbeing_responses table
create table public.wellbeing_responses (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.wellbeing_sessions(id) on delete cascade,
  child_id uuid not null references public.children(id) on delete cascade,
  activity_type text not null check (activity_type in ('mood_wheel', 'emotion_wheel', 'garden_activity', 'reflection_question', 'worry_space')),
  question_key text not null,
  question_text text,
  response_type text not null check (response_type in ('scale', 'multiple_choice', 'text', 'emoji', 'drawing')),
  response_value jsonb not null,
  response_score integer,
  flags text[] default '{}',
  created_at timestamptz not null default now()
);

-- Create garden_items table
create table public.garden_items (
  id uuid primary key default gen_random_uuid(),
  child_id uuid not null references public.children(id) on delete cascade,
  item_type text not null check (item_type in ('flower', 'tree', 'decoration', 'character')),
  item_name text not null,
  item_category text,
  position_x integer default 0,
  position_y integer default 0,
  size_scale decimal default 1.0,
  rotation integer default 0,
  color_scheme text,
  is_unlocked boolean default true,
  unlock_condition text,
  earned_at timestamptz,
  placed_at timestamptz default now(),
  created_at timestamptz not null default now()
);

-- Create stickers_earned table
create table public.stickers_earned (
  id uuid primary key default gen_random_uuid(),
  child_id uuid not null references public.children(id) on delete cascade,
  sticker_type text not null,
  sticker_name text not null,
  sticker_description text,
  earned_for text not null,
  session_id uuid references public.wellbeing_sessions(id),
  earned_at timestamptz not null default now()
);

-- Create alerts table
create table public.alerts (
  id uuid primary key default gen_random_uuid(),
  child_id uuid not null references public.children(id) on delete cascade,
  alert_type text not null check (alert_type in ('safeguarding', 'wellbeing_decline', 'engagement_drop', 'positive_change')),
  severity text not null check (severity in ('low', 'medium', 'high', 'urgent')),
  title text not null,
  description text not null,
  trigger_data jsonb,
  session_id uuid references public.wellbeing_sessions(id),
  response_id uuid references public.wellbeing_responses(id),
  status text not null default 'unread' check (status in ('unread', 'acknowledged', 'resolved', 'escalated')),
  acknowledged_by uuid references public.profiles(id),
  acknowledged_at timestamptz,
  resolved_by uuid references public.profiles(id),
  resolved_at timestamptz,
  resolution_notes text,
  created_at timestamptz not null default now()
);

-- Create invitations table
create table public.invitations (
  id uuid primary key default gen_random_uuid(),
  org_id uuid not null references public.organisations(id) on delete cascade,
  email text not null,
  role text not null check (role in ('Practitioner', 'GroupContact')),
  invited_by uuid not null references public.profiles(id),
  invitation_token text not null unique,
  status text not null default 'pending' check (status in ('pending', 'accepted', 'expired', 'revoked')),
  expires_at timestamptz not null default (now() + interval '7 days'),
  accepted_at timestamptz,
  accepted_by uuid references public.profiles(id),
  created_at timestamptz not null default now()
);

-- Create indexes for better performance
create index idx_profiles_org_id on public.profiles(org_id);
create index idx_profiles_role on public.profiles(role);
create index idx_children_practitioner on public.children(primary_practitioner_id);
create index idx_wellbeing_sessions_child on public.wellbeing_sessions(child_id);
create index idx_wellbeing_responses_session on public.wellbeing_responses(session_id);
create index idx_wellbeing_responses_child on public.wellbeing_responses(child_id);
create index idx_garden_items_child on public.garden_items(child_id);
create index idx_stickers_child on public.stickers_earned(child_id);
create index idx_alerts_child on public.alerts(child_id);
create index idx_alerts_status on public.alerts(status);
create index idx_invitations_token on public.invitations(invitation_token);
create index idx_invitations_email on public.invitations(email);

-- Create updated_at trigger function
create or replace function public.handle_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

-- Apply updated_at triggers to relevant tables
create trigger handle_updated_at_organisations
  before update on public.organisations
  for each row execute procedure public.handle_updated_at();

create trigger handle_updated_at_profiles
  before update on public.profiles
  for each row execute procedure public.handle_updated_at();

create trigger handle_updated_at_children
  before update on public.children
  for each row execute procedure public.handle_updated_at();

create trigger handle_updated_at_wellbeing_sessions
  before update on public.wellbeing_sessions
  for each row execute procedure public.handle_updated_at();