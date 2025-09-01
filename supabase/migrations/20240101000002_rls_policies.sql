-- Enable Row Level Security on all tables
alter table public.organisations enable row level security;
alter table public.profiles enable row level security;
alter table public.children enable row level security;
alter table public.wellbeing_sessions enable row level security;
alter table public.wellbeing_responses enable row level security;
alter table public.garden_items enable row level security;
alter table public.stickers_earned enable row level security;
alter table public.alerts enable row level security;
alter table public.invitations enable row level security;

-- Helper function to get user role
create or replace function public.get_user_role(user_id uuid)
returns text as $$
begin
  return (select role from public.profiles where id = user_id);
end;
$$ language plpgsql security definer;

-- Helper function to get user organisation
create or replace function public.get_user_org(user_id uuid)
returns uuid as $$
begin
  return (select org_id from public.profiles where id = user_id);
end;
$$ language plpgsql security definer;

-- ORGANISATIONS POLICIES
-- Account role can see all organisations
create policy "Account users can view all organisations"
  on public.organisations for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Account role can manage all organisations
create policy "Account users can manage all organisations"
  on public.organisations for all
  using (public.get_user_role(auth.uid()) = 'Account');

-- Other roles can only see their own organisation
create policy "Users can view own organisation"
  on public.organisations for select
  using (
    public.get_user_role(auth.uid()) in ('GroupContact', 'Practitioner') 
    and id = public.get_user_org(auth.uid())
  );

-- PROFILES POLICIES
-- Account role can see all profiles
create policy "Account users can view all profiles"
  on public.profiles for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Account role can manage all profiles
create policy "Account users can manage all profiles"
  on public.profiles for all
  using (public.get_user_role(auth.uid()) = 'Account');

-- Users can view their own profile
create policy "Users can view own profile"
  on public.profiles for select
  using (auth.uid() = id);

-- Users can update their own profile
create policy "Users can update own profile"
  on public.profiles for update
  using (auth.uid() = id);

-- GroupContact and Practitioner can see profiles in their organisation
create policy "Organisation users can view org profiles"
  on public.profiles for select
  using (
    public.get_user_role(auth.uid()) in ('GroupContact', 'Practitioner')
    and org_id = public.get_user_org(auth.uid())
  );

-- GroupContact can manage practitioners in their organisation
create policy "GroupContact can manage org practitioners"
  on public.profiles for all
  using (
    public.get_user_role(auth.uid()) = 'GroupContact'
    and org_id = public.get_user_org(auth.uid())
    and role in ('Practitioner', 'Child')
  );

-- CHILDREN POLICIES
-- Account can see all children
create policy "Account users can view all children"
  on public.children for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Practitioners can see children in their organisation
create policy "Practitioners can view org children"
  on public.children for select
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.profiles 
      where id = public.children.id 
      and org_id = public.get_user_org(auth.uid())
    )
  );

-- Practitioners can manage children in their organisation
create policy "Practitioners can manage org children"
  on public.children for all
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.profiles 
      where id = public.children.id 
      and org_id = public.get_user_org(auth.uid())
    )
  );

-- Children can view their own data
create policy "Children can view own data"
  on public.children for select
  using (
    public.get_user_role(auth.uid()) = 'Child'
    and auth.uid() = id
  );

-- WELLBEING SESSIONS POLICIES
-- Account can see all sessions
create policy "Account users can view all sessions"
  on public.wellbeing_sessions for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Practitioners can see sessions for children in their organisation
create policy "Practitioners can view org children sessions"
  on public.wellbeing_sessions for select
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.children c
      join public.profiles p on c.id = p.id
      where c.id = public.wellbeing_sessions.child_id
      and p.org_id = public.get_user_org(auth.uid())
    )
  );

-- Children can see their own sessions
create policy "Children can view own sessions"
  on public.wellbeing_sessions for select
  using (
    public.get_user_role(auth.uid()) = 'Child'
    and child_id = auth.uid()
  );

-- Children can create their own sessions
create policy "Children can create own sessions"
  on public.wellbeing_sessions for insert
  with check (
    public.get_user_role(auth.uid()) = 'Child'
    and child_id = auth.uid()
  );

-- Children can update their own sessions
create policy "Children can update own sessions"
  on public.wellbeing_sessions for update
  using (
    public.get_user_role(auth.uid()) = 'Child'
    and child_id = auth.uid()
  );

-- WELLBEING RESPONSES POLICIES
-- Account can see all responses
create policy "Account users can view all responses"
  on public.wellbeing_responses for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Practitioners can see responses for children in their organisation
create policy "Practitioners can view org children responses"
  on public.wellbeing_responses for select
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.children c
      join public.profiles p on c.id = p.id
      where c.id = public.wellbeing_responses.child_id
      and p.org_id = public.get_user_org(auth.uid())
    )
  );

-- Children can see their own responses
create policy "Children can view own responses"
  on public.wellbeing_responses for select
  using (
    public.get_user_role(auth.uid()) = 'Child'
    and child_id = auth.uid()
  );

-- Children can create their own responses
create policy "Children can create own responses"
  on public.wellbeing_responses for insert
  with check (
    public.get_user_role(auth.uid()) = 'Child'
    and child_id = auth.uid()
  );

-- GARDEN ITEMS POLICIES
-- Account can see all garden items
create policy "Account users can view all garden items"
  on public.garden_items for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Practitioners can see garden items for children in their organisation
create policy "Practitioners can view org children garden items"
  on public.garden_items for select
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.children c
      join public.profiles p on c.id = p.id
      where c.id = public.garden_items.child_id
      and p.org_id = public.get_user_org(auth.uid())
    )
  );

-- Children can manage their own garden items
create policy "Children can manage own garden items"
  on public.garden_items for all
  using (
    public.get_user_role(auth.uid()) = 'Child'
    and child_id = auth.uid()
  );

-- STICKERS POLICIES
-- Account can see all stickers
create policy "Account users can view all stickers"
  on public.stickers_earned for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Practitioners can see stickers for children in their organisation
create policy "Practitioners can view org children stickers"
  on public.stickers_earned for select
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.children c
      join public.profiles p on c.id = p.id
      where c.id = public.stickers_earned.child_id
      and p.org_id = public.get_user_org(auth.uid())
    )
  );

-- Children can see their own stickers
create policy "Children can view own stickers"
  on public.stickers_earned for select
  using (
    public.get_user_role(auth.uid()) = 'Child'
    and child_id = auth.uid()
  );

-- System can award stickers (for server functions)
create policy "System can award stickers"
  on public.stickers_earned for insert
  with check (true);

-- ALERTS POLICIES
-- Account can see all alerts
create policy "Account users can view all alerts"
  on public.alerts for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- Practitioners can see alerts for children in their organisation
create policy "Practitioners can view org alerts"
  on public.alerts for select
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.children c
      join public.profiles p on c.id = p.id
      where c.id = public.alerts.child_id
      and p.org_id = public.get_user_org(auth.uid())
    )
  );

-- Practitioners can manage alerts for children in their organisation
create policy "Practitioners can manage org alerts"
  on public.alerts for update
  using (
    public.get_user_role(auth.uid()) in ('Practitioner', 'GroupContact')
    and exists (
      select 1 from public.children c
      join public.profiles p on c.id = p.id
      where c.id = public.alerts.child_id
      and p.org_id = public.get_user_org(auth.uid())
    )
  );

-- System can create alerts (for server functions)
create policy "System can create alerts"
  on public.alerts for insert
  with check (true);

-- INVITATIONS POLICIES
-- Account can see all invitations
create policy "Account users can view all invitations"
  on public.invitations for select
  using (public.get_user_role(auth.uid()) = 'Account');

-- GroupContact can manage invitations for their organisation
create policy "GroupContact can manage org invitations"
  on public.invitations for all
  using (
    public.get_user_role(auth.uid()) = 'GroupContact'
    and org_id = public.get_user_org(auth.uid())
  );

-- Anyone can view invitation by token (for acceptance)
create policy "Anyone can view invitation by token"
  on public.invitations for select
  using (true);