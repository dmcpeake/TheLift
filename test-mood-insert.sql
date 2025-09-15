-- Test SQL to verify mood_meter_usage table structure
-- Run this in Supabase SQL editor to test

-- First, create a test org if it doesn't exist
INSERT INTO organisations (id, name, type, status)
VALUES ('test-org-001', 'Test Organization', 'other', 'active')
ON CONFLICT (id) DO NOTHING;

-- Create a test child profile if it doesn't exist
INSERT INTO profiles (id, email, name, role, org_id, status)
VALUES (
  'test-child-001',
  'testchild@example.com',
  'Test Child',
  'Child',
  'test-org-001',
  'active'
)
ON CONFLICT (id) DO NOTHING;

-- Create a test session
INSERT INTO checkin_sessions (
  child_id,
  org_id,
  status,
  tools_completed
)
VALUES (
  'test-child-001',
  'test-org-001',
  'in_progress',
  ARRAY[]::text[]
)
RETURNING id;

-- Use the session ID from above in this query
-- Replace 'YOUR_SESSION_ID' with the actual ID returned
INSERT INTO mood_meter_usage (
  session_id,
  child_id,
  org_id,
  mood_level,  -- NOT mood_label
  mood_numeric,  -- NOT mood_value
  time_to_select_seconds,  -- NOT selection_time_ms
  was_skipped
)
VALUES (
  'YOUR_SESSION_ID',  -- Replace with actual session ID
  'test-child-001',
  'test-org-001',
  'happy',
  4,
  5,
  false
)
RETURNING *;