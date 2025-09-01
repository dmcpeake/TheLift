# The Lift - Database Schema Documentation

## Overview

The Lift uses Supabase (PostgreSQL) as its primary database with Row Level Security (RLS) enabled for all tables to ensure proper data isolation and security. The schema supports a multi-tenant architecture with role-based access control for different user types.

## User Roles

- **Account**: Platform administrators with full system access
- **GroupContact**: Organization administrators who can manage practitioners and settings
- **Practitioner**: Teachers, counselors, psychologists who work with children
- **Child**: End users aged 5-11 who complete wellbeing activities

## Core Tables

### 1. profiles
Extends Supabase Auth users with additional profile information.

```sql
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  name TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('Account', 'GroupContact', 'Practitioner', 'Child')),
  org_id UUID REFERENCES organisations(id) ON DELETE SET NULL,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'pending', 'suspended')),
  avatar_url TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Users can view their own profile
CREATE POLICY "Users can view own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

-- Users can update their own profile (except role and org_id)
CREATE POLICY "Users can update own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

-- GroupContacts can view profiles in their organization
CREATE POLICY "GroupContacts can view org profiles" ON profiles
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p 
      WHERE p.id = auth.uid() 
      AND p.role = 'GroupContact' 
      AND p.org_id = profiles.org_id
    )
  );

-- Account can view all profiles
CREATE POLICY "Account can view all profiles" ON profiles
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p 
      WHERE p.id = auth.uid() 
      AND p.role = 'Account'
    )
  );
```

### 2. organisations
Represents schools, clinics, hospitals, and other client organisations.

```sql
CREATE TABLE organisations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('school-primary', 'school-secondary', 'academy-trust', 'clinic-private', 'nhs-trust', 'hospital', 'charity', 'other')),
  address_line_1 TEXT,
  address_line_2 TEXT,
  city TEXT,
  postcode TEXT,
  country TEXT DEFAULT 'UK',
  phone TEXT,
  email TEXT,
  website TEXT,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'trial', 'suspended')),
  subscription_plan TEXT DEFAULT 'essential' CHECK (subscription_plan IN ('essential', 'professional', 'enterprise')),
  max_children INTEGER DEFAULT 50,
  max_practitioners INTEGER DEFAULT 5,
  settings JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE organisations ENABLE ROW LEVEL SECURITY;

-- Users can view their own organisation
CREATE POLICY "Users can view own organisation" ON organisations
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p 
      WHERE p.id = auth.uid() 
      AND p.org_id = organisations.id
    )
  );

-- GroupContacts can update their organisation
CREATE POLICY "GroupContacts can update own organisation" ON organisations
  FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM profiles p 
      WHERE p.id = auth.uid() 
      AND p.role = 'GroupContact' 
      AND p.org_id = organisations.id
    )
  );

-- Account can manage all organisations
CREATE POLICY "Account can manage all organisations" ON organisations
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM profiles p 
      WHERE p.id = auth.uid() 
      AND p.role = 'Account'
    )
  );
```

### 3. children
Child users with additional safeguarding and parental consent information.

```sql
CREATE TABLE children (
  id UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
  first_name TEXT NOT NULL,
  date_of_birth DATE,
  year_group TEXT,
  class_name TEXT,
  primary_practitioner_id UUID REFERENCES profiles(id),
  parent_guardian_name TEXT,
  parent_guardian_email TEXT,
  parent_guardian_phone TEXT,
  consent_given BOOLEAN NOT NULL DEFAULT FALSE,
  consent_date TIMESTAMPTZ,
  consent_type TEXT CHECK (consent_type IN ('verbal', 'written', 'digital')),
  safeguarding_notes TEXT,
  additional_notes TEXT,
  avatar_character TEXT DEFAULT 'default',
  preferences JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE children ENABLE ROW LEVEL SECURITY;

-- Children can view their own record
CREATE POLICY "Children can view own record" ON children
  FOR SELECT USING (auth.uid() = id);

-- Practitioners can view children in their organisation
CREATE POLICY "Practitioners can view org children" ON children
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p1, profiles p2
      WHERE p1.id = auth.uid() 
      AND p1.role IN ('Practitioner', 'GroupContact')
      AND p2.id = children.id
      AND p1.org_id = p2.org_id
    )
  );

-- Practitioners can update children in their organisation
CREATE POLICY "Practitioners can update org children" ON children
  FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM profiles p1, profiles p2
      WHERE p1.id = auth.uid() 
      AND p1.role IN ('Practitioner', 'GroupContact')
      AND p2.id = children.id
      AND p1.org_id = p2.org_id
    )
  );
```

### 4. wellbeing_sessions
Individual wellbeing check-in sessions completed by children.

```sql
CREATE TABLE wellbeing_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  session_type TEXT NOT NULL CHECK (session_type IN ('daily_checkin', 'weekly_review', 'monthly_assessment')),
  status TEXT NOT NULL DEFAULT 'in_progress' CHECK (status IN ('in_progress', 'completed', 'abandoned')),
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ,
  duration_seconds INTEGER,
  activities_completed TEXT[] DEFAULT '{}',
  overall_mood INTEGER CHECK (overall_mood BETWEEN 1 AND 5),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE wellbeing_sessions ENABLE ROW LEVEL SECURITY;

-- Children can manage their own sessions
CREATE POLICY "Children can manage own sessions" ON wellbeing_sessions
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM children c
      WHERE c.id = auth.uid() 
      AND c.id = wellbeing_sessions.child_id
    )
  );

-- Practitioners can view sessions for children in their organisation
CREATE POLICY "Practitioners can view org sessions" ON wellbeing_sessions
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p, children c
      WHERE p.id = auth.uid() 
      AND p.role IN ('Practitioner', 'GroupContact')
      AND c.id = wellbeing_sessions.child_id
      AND p.org_id = c.org_id
    )
  );
```

### 5. wellbeing_responses
Individual responses to wellbeing activities within sessions.

```sql
CREATE TABLE wellbeing_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL REFERENCES wellbeing_sessions(id) ON DELETE CASCADE,
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  activity_type TEXT NOT NULL CHECK (activity_type IN ('mood_wheel', 'emotion_wheel', 'garden_activity', 'reflection_question', 'worry_space')),
  question_key TEXT NOT NULL,
  question_text TEXT,
  response_type TEXT NOT NULL CHECK (response_type IN ('scale', 'multiple_choice', 'text', 'emoji', 'drawing')),
  response_value JSONB NOT NULL,
  response_score INTEGER,
  flags TEXT[] DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE wellbeing_responses ENABLE ROW LEVEL SECURITY;

-- Children can create responses for their own sessions
CREATE POLICY "Children can create own responses" ON wellbeing_responses
  FOR INSERT WITH CHECK (
    EXISTS (
      SELECT 1 FROM wellbeing_sessions ws
      WHERE ws.id = wellbeing_responses.session_id 
      AND ws.child_id = auth.uid()
    )
  );

-- Children can view their own responses
CREATE POLICY "Children can view own responses" ON wellbeing_responses
  FOR SELECT USING (
    child_id = auth.uid()
  );

-- Practitioners can view responses for children in their organization
CREATE POLICY "Practitioners can view org responses" ON wellbeing_responses
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p, children c
      WHERE p.id = auth.uid() 
      AND p.role IN ('Practitioner', 'GroupContact')
      AND c.id = wellbeing_responses.child_id
      AND p.org_id = c.org_id
    )
  );
```

### 6. garden_items
Items children can place in their digital garden.

```sql
CREATE TABLE garden_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  item_type TEXT NOT NULL CHECK (item_type IN ('flower', 'tree', 'decoration', 'character')),
  item_name TEXT NOT NULL,
  item_category TEXT,
  position_x INTEGER DEFAULT 0,
  position_y INTEGER DEFAULT 0,
  size_scale DECIMAL DEFAULT 1.0,
  rotation INTEGER DEFAULT 0,
  color_scheme TEXT,
  is_unlocked BOOLEAN DEFAULT TRUE,
  unlock_condition TEXT,
  earned_at TIMESTAMPTZ,
  placed_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE garden_items ENABLE ROW LEVEL SECURITY;

-- Children can manage their own garden items
CREATE POLICY "Children can manage own garden items" ON garden_items
  FOR ALL USING (child_id = auth.uid());

-- Practitioners can view garden items for children in their organization
CREATE POLICY "Practitioners can view org garden items" ON garden_items
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p, children c
      WHERE p.id = auth.uid() 
      AND p.role IN ('Practitioner', 'GroupContact')
      AND c.id = garden_items.child_id
      AND p.org_id = c.org_id
    )
  );
```

### 7. stickers_earned
Stickers and rewards earned by children for completing activities.

```sql
CREATE TABLE stickers_earned (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  sticker_type TEXT NOT NULL,
  sticker_name TEXT NOT NULL,
  sticker_description TEXT,
  earned_for TEXT NOT NULL,
  session_id UUID REFERENCES wellbeing_sessions(id),
  earned_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE stickers_earned ENABLE ROW LEVEL SECURITY;

-- Children can view their own stickers
CREATE POLICY "Children can view own stickers" ON stickers_earned
  FOR SELECT USING (child_id = auth.uid());

-- System can award stickers
CREATE POLICY "System can award stickers" ON stickers_earned
  FOR INSERT WITH CHECK (true);

-- Practitioners can view stickers for children in their organization
CREATE POLICY "Practitioners can view org stickers" ON stickers_earned
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p, children c
      WHERE p.id = auth.uid() 
      AND p.role IN ('Practitioner', 'GroupContact')
      AND c.id = stickers_earned.child_id
      AND p.org_id = c.org_id
    )
  );
```

### 8. alerts
System-generated alerts for concerning responses or patterns.

```sql
CREATE TABLE alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id UUID NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  alert_type TEXT NOT NULL CHECK (alert_type IN ('safeguarding', 'wellbeing_decline', 'engagement_drop', 'positive_change')),
  severity TEXT NOT NULL CHECK (severity IN ('low', 'medium', 'high', 'urgent')),
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  trigger_data JSONB,
  session_id UUID REFERENCES wellbeing_sessions(id),
  response_id UUID REFERENCES wellbeing_responses(id),
  status TEXT NOT NULL DEFAULT 'unread' CHECK (status IN ('unread', 'acknowledged', 'resolved', 'escalated')),
  acknowledged_by UUID REFERENCES profiles(id),
  acknowledged_at TIMESTAMPTZ,
  resolved_by UUID REFERENCES profiles(id),
  resolved_at TIMESTAMPTZ,
  resolution_notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE alerts ENABLE ROW LEVEL SECURITY;

-- Practitioners can view alerts for children in their organization
CREATE POLICY "Practitioners can view org alerts" ON alerts
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p, children c
      WHERE p.id = auth.uid() 
      AND p.role IN ('Practitioner', 'GroupContact')
      AND c.id = alerts.child_id
      AND p.org_id = c.org_id
    )
  );

-- Practitioners can update alerts for children in their organization
CREATE POLICY "Practitioners can update org alerts" ON alerts
  FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM profiles p, children c
      WHERE p.id = auth.uid() 
      AND p.role IN ('Practitioner', 'GroupContact')
      AND c.id = alerts.child_id
      AND p.org_id = c.org_id
    )
  );
```

### 9. invitations
Invitations sent to new practitioners to join organizations.

```sql
CREATE TABLE invitations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  org_id UUID NOT NULL REFERENCES organisations(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('Practitioner', 'GroupContact')),
  invited_by UUID NOT NULL REFERENCES profiles(id),
  invitation_token TEXT NOT NULL UNIQUE,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'accepted', 'expired', 'revoked')),
  expires_at TIMESTAMPTZ NOT NULL DEFAULT (NOW() + INTERVAL '7 days'),
  accepted_at TIMESTAMPTZ,
  accepted_by UUID REFERENCES profiles(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS Policies
ALTER TABLE invitations ENABLE ROW LEVEL SECURITY;

-- GroupContacts can manage invitations for their organization
CREATE POLICY "GroupContacts can manage org invitations" ON invitations
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM profiles p 
      WHERE p.id = auth.uid() 
      AND p.role = 'GroupContact' 
      AND p.org_id = invitations.org_id
    )
  );

-- Account can view all invitations
CREATE POLICY "Account can view all invitations" ON invitations
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p 
      WHERE p.id = auth.uid() 
      AND p.role = 'Account'
    )
  );
```

### 10. kv_store_a1855b25
Pre-existing key-value store for flexible data storage.

```sql
-- This table already exists per the system documentation
CREATE TABLE kv_store_a1855b25 (
  key TEXT PRIMARY KEY,
  value JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Used for:
-- - Application settings and configuration
-- - Temporary data storage
-- - Feature flags
-- - Cache for computed values
-- - Analytics and metrics storage
```

## Views and Functions

### 1. Child Progress Summary View
```sql
CREATE VIEW child_progress_summary AS
SELECT 
  c.id,
  c.first_name,
  c.org_id,
  COUNT(ws.id) as total_sessions,
  COUNT(CASE WHEN ws.status = 'completed' THEN 1 END) as completed_sessions,
  AVG(ws.overall_mood) as average_mood,
  COUNT(se.id) as total_stickers,
  MAX(ws.completed_at) as last_session_date,
  COUNT(CASE WHEN a.severity IN ('high', 'urgent') AND a.status = 'unread' THEN 1 END) as urgent_alerts
FROM children c
LEFT JOIN wellbeing_sessions ws ON c.id = ws.child_id
LEFT JOIN stickers_earned se ON c.id = se.child_id
LEFT JOIN alerts a ON c.id = a.child_id
GROUP BY c.id, c.first_name, c.org_id;
```

### 2. Organization Usage Stats View
```sql
CREATE VIEW organization_usage_stats AS
SELECT 
  o.id,
  o.name,
  COUNT(DISTINCT c.id) as active_children,
  COUNT(DISTINCT p.id) as active_practitioners,
  COUNT(DISTINCT ws.id) as total_sessions_this_month,
  AVG(ws.overall_mood) as average_mood_this_month
FROM organizations o
LEFT JOIN profiles p ON o.id = p.org_id AND p.role IN ('Practitioner', 'GroupContact')
LEFT JOIN children c ON o.id = c.org_id
LEFT JOIN wellbeing_sessions ws ON c.id = ws.child_id 
  AND ws.created_at >= date_trunc('month', CURRENT_DATE)
GROUP BY o.id, o.name;
```

### 3. Auto-increment Function for Child IDs
```sql
CREATE OR REPLACE FUNCTION generate_child_display_id()
RETURNS TRIGGER AS $$
BEGIN
  -- Generate a simple incremental ID for display purposes
  NEW.display_id = COALESCE(
    (SELECT MAX(display_id) + 1 FROM children WHERE org_id = NEW.org_id), 
    1
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_child_display_id
  BEFORE INSERT ON children
  FOR EACH ROW
  EXECUTE FUNCTION generate_child_display_id();
```

## Indexes

```sql
-- Performance indexes
CREATE INDEX idx_profiles_org_id ON profiles(org_id);
CREATE INDEX idx_profiles_role ON profiles(role);
CREATE INDEX idx_children_org_id ON children(org_id);
CREATE INDEX idx_children_practitioner ON children(primary_practitioner_id);
CREATE INDEX idx_wellbeing_sessions_child_date ON wellbeing_sessions(child_id, created_at DESC);
CREATE INDEX idx_wellbeing_responses_session ON wellbeing_responses(session_id);
CREATE INDEX idx_alerts_child_status ON alerts(child_id, status);
CREATE INDEX idx_alerts_severity_created ON alerts(severity, created_at DESC);
CREATE INDEX idx_invitations_token ON invitations(invitation_token);
CREATE INDEX idx_invitations_email_status ON invitations(email, status);

-- Full-text search indexes
CREATE INDEX idx_children_search ON children USING gin(to_tsvector('english', first_name || ' ' || COALESCE(class_name, '')));
CREATE INDEX idx_organizations_search ON organizations USING gin(to_tsvector('english', name));
```

## Data Security & Compliance

### GDPR Compliance
- All tables include `created_at` and `updated_at` timestamps for audit trails
- Personal data is minimized (children only store first name, not full name)
- Explicit consent tracking in the `children` table
- Ability to export all data for a child or organization
- Soft delete capabilities for data retention requirements

### Child Protection
- Automated alert generation for concerning responses
- Safeguarding notes field for practitioners
- Parental consent tracking and validation
- Role-based access ensuring only authorized users can view child data

### Row Level Security (RLS)
- All tables have RLS enabled
- Policies ensure users can only access data within their organization
- Children can only access their own data
- Account have administrative access across all organisations

## Backup and Migration Strategy

### Automated Backups
- Daily full database backups
- Point-in-time recovery enabled
- Backup retention: 30 days for daily, 12 months for monthly

### Data Migration
- Standardized import/export procedures for organizations
- Data validation scripts for ensuring integrity
- Rollback procedures for failed migrations

## Monitoring and Analytics

### Performance Monitoring
- Query performance tracking
- Connection pool monitoring
- Database size and growth tracking

### Usage Analytics
- Session completion rates
- User engagement metrics
- Feature adoption tracking
- Wellbeing trend analysis

This schema provides a robust foundation for The Lift platform while ensuring data security, compliance, and scalability for growth from small schools to large health systems.