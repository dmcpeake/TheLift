-- Create organizations for existing profiles
-- Based on the org_ids already assigned to profiles

-- School organization for Felix Baker and other children
INSERT INTO organizations (id, name, org_type, created_at, updated_at)
VALUES
  ('5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'Westfield Primary School', 'school', NOW(), NOW()),
  ('7eab219a-7c83-406c-a6b2-75ed44de715b', 'St. Mary''s Hospital', 'hospital', NOW(), NOW()),
  ('9c2d4f87-3e1b-4a6d-b8e9-1f3a5c7d9e2b', 'Mindwell Child Psychology Clinic', 'clinic', NOW(), NOW())
ON CONFLICT (id) DO UPDATE
SET
  name = EXCLUDED.name,
  org_type = EXCLUDED.org_type,
  updated_at = NOW();

-- Update any profiles without org_id to use the school by default
UPDATE profiles
SET org_id = '5f910546-8bdc-44ca-b776-fdd5eb5cccd9'
WHERE org_id IS NULL AND role = 'Child';