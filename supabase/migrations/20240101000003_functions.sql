-- Function to handle new user signup
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, name, role)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'name', split_part(new.email, '@', 1)),
    coalesce(new.raw_user_meta_data->>'role', 'Practitioner')
  );
  return new;
end;
$$ language plpgsql security definer;

-- Trigger for new user signup
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Function to create a new organisation with initial admin user
create or replace function public.create_organisation_with_admin(
  org_name text,
  org_type text,
  org_email text,
  admin_email text,
  admin_name text,
  admin_password text,
  subscription_plan text default 'essential',
  max_children integer default 50,
  max_practitioners integer default 5
)
returns json as $$
declare
  new_org_id uuid;
  new_user_id uuid;
  result json;
begin
  -- Create organisation
  insert into public.organisations (name, type, email, subscription_plan, max_children, max_practitioners)
  values (org_name, org_type, org_email, subscription_plan, max_children, max_practitioners)
  returning id into new_org_id;
  
  -- Create admin user in auth.users (this would typically be done via Supabase Auth API)
  -- For now, we'll return the organisation ID and expect external user creation
  
  result := json_build_object(
    'organisation_id', new_org_id,
    'organisation_name', org_name,
    'admin_email', admin_email,
    'message', 'Organisation created. Admin user must be created via Supabase Auth.'
  );
  
  return result;
end;
$$ language plpgsql security definer;

-- Function to assign user to organisation
create or replace function public.assign_user_to_organisation(
  user_id uuid,
  organisation_id uuid,
  user_role text default 'Practitioner'
)
returns boolean as $$
begin
  update public.profiles
  set org_id = organisation_id, role = user_role
  where id = user_id;
  
  return found;
end;
$$ language plpgsql security definer;

-- Function to create child with username/PIN
create or replace function public.create_child_account(
  child_email text,
  child_name text,
  child_username text,
  child_pin text,
  practitioner_id uuid,
  organisation_id uuid,
  parent_name text default null,
  parent_email text default null,
  consent_given boolean default false
)
returns json as $$
declare
  new_child_id uuid;
  result json;
begin
  -- Create auth user for child (simplified - would use Supabase Auth API in practice)
  -- For now, we'll create the profile directly and handle auth separately
  
  new_child_id := gen_random_uuid();
  
  -- Create profile
  insert into public.profiles (id, email, name, role, org_id)
  values (new_child_id, child_email, child_name, 'Child', organisation_id);
  
  -- Create child record
  insert into public.children (
    id, first_name, primary_practitioner_id, 
    parent_guardian_name, parent_guardian_email, consent_given
  )
  values (
    new_child_id, child_name, practitioner_id,
    parent_name, parent_email, consent_given
  );
  
  -- Store username/PIN in a separate table for custom auth
  -- This would typically be in a secure key-value store
  
  result := json_build_object(
    'child_id', new_child_id,
    'username', child_username,
    'pin', child_pin,
    'message', 'Child account created successfully'
  );
  
  return result;
end;
$$ language plpgsql security definer;

-- Function to validate child credentials
create or replace function public.validate_child_credentials(
  username text,
  pin text
)
returns json as $$
declare
  child_record record;
  result json;
begin
  -- This would typically check against a secure store
  -- For now, we'll use a simple approach
  
  result := json_build_object(
    'valid', false,
    'message', 'Invalid credentials'
  );
  
  return result;
end;
$$ language plpgsql security definer;

-- Function to generate wellbeing report for a child
create or replace function public.generate_child_wellbeing_report(
  child_id uuid,
  start_date date default (current_date - interval '30 days'),
  end_date date default current_date
)
returns json as $$
declare
  child_info record;
  session_count integer;
  avg_mood numeric;
  sticker_count integer;
  recent_alerts integer;
  result json;
begin
  -- Get child information
  select c.first_name, c.year_group, c.class_name, p.name as practitioner_name
  into child_info
  from public.children c
  left join public.profiles p on c.primary_practitioner_id = p.id
  where c.id = child_id;
  
  -- Get session statistics
  select count(*), avg(overall_mood)
  into session_count, avg_mood
  from public.wellbeing_sessions
  where child_id = child_id
  and started_at between start_date and end_date
  and status = 'completed';
  
  -- Get sticker count
  select count(*)
  into sticker_count
  from public.stickers_earned
  where child_id = child_id
  and earned_at between start_date and end_date;
  
  -- Get recent alerts
  select count(*)
  into recent_alerts
  from public.alerts
  where child_id = child_id
  and created_at between start_date and end_date
  and severity in ('high', 'urgent');
  
  result := json_build_object(
    'child_name', child_info.first_name,
    'year_group', child_info.year_group,
    'class_name', child_info.class_name,
    'practitioner_name', child_info.practitioner_name,
    'report_period', json_build_object(
      'start_date', start_date,
      'end_date', end_date
    ),
    'statistics', json_build_object(
      'total_sessions', coalesce(session_count, 0),
      'average_mood', coalesce(round(avg_mood, 2), 0),
      'stickers_earned', coalesce(sticker_count, 0),
      'recent_alerts', coalesce(recent_alerts, 0)
    )
  );
  
  return result;
end;
$$ language plpgsql security definer;

-- Function to award sticker to child
create or replace function public.award_sticker(
  child_id uuid,
  sticker_type text,
  sticker_name text,
  earned_for text,
  session_id uuid default null
)
returns boolean as $$
begin
  insert into public.stickers_earned (
    child_id, sticker_type, sticker_name, earned_for, session_id
  )
  values (
    child_id, sticker_type, sticker_name, earned_for, session_id
  );
  
  return true;
exception
  when others then
    return false;
end;
$$ language plpgsql security definer;

-- Function to create alert
create or replace function public.create_alert(
  child_id uuid,
  alert_type text,
  severity text,
  title text,
  description text,
  session_id uuid default null,
  response_id uuid default null
)
returns uuid as $$
declare
  new_alert_id uuid;
begin
  insert into public.alerts (
    child_id, alert_type, severity, title, description, session_id, response_id
  )
  values (
    child_id, alert_type, severity, title, description, session_id, response_id
  )
  returning id into new_alert_id;
  
  return new_alert_id;
end;
$$ language plpgsql security definer;