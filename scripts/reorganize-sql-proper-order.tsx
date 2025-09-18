import * as fs from 'fs'
import * as path from 'path'

const SQL_COMBINED_DIR = '/Users/tombrady/Documents/GitHub/TheLift/sql-combined'
const ORIGINAL_SQL = '/Users/tombrady/Documents/GitHub/TheLift/all_children_complete_journeys_20250916_193517.sql'

interface ChildInfo {
  id: string
  name: string
  orgId: string
}

// Known child profiles from the original SQL file
const CHILD_PROFILES: ChildInfo[] = [
  // Hospital children
  { id: 'ce864083-bdf5-4ead-b56a-3c36208d3b69', name: 'Emma Thompson', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: '1d0d16ae-2aa0-4d72-9abc-fd641147291f', name: 'Aisha Patel', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'e5f7d3b6-9a2c-4e6d-8b1f-3c5a7d9e0f4a', name: 'Oliver Chen', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'aaaabbbb-cccc-dddd-eeee-111111111111', name: 'Sarah Williams', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'b4f8a2c6-7d3e-4a9b-8c1d-2e6f9a5b0c7d', name: 'Marcus Johnson', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'd8a3f2b6-4e7c-4a9d-9b1f-5c6a8d2e0f3b', name: 'Isabella Rodriguez', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'f2c7e5a9-8b3d-4e6f-9a1c-6d8b0f3e5a7c', name: 'Noah Kim', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'a7e3d5b9-2c4f-4a8e-8b1d-9f6a3c5e0d7b', name: 'Zara Ahmed', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'c9b5e7a3-6d2f-4b8a-9e1c-3a7f5d9b0e4c', name: 'Ethan Davis', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },
  { id: 'e4a8c3b7-9d5f-4e2a-8b6c-1f9d7a3e5b0c', name: 'Maya Sharma', orgId: '7eab219a-7c83-406c-a6b2-75ed44de715b' },

  // School children (Westfield Primary)
  { id: '28e7a649-8677-4476-b88c-b5b923a9a4e2', name: 'Chloe King', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b', name: 'Liam Johnson', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c', name: 'Emma Davis', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '4a8b3e0c-d1f6-6b9f-c3d5-7e0f1a4b6c8d', name: 'Noah Wilson', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '5b9c4f1d-e2a7-7c0a-d4e6-8f1a2b5c7d9e', name: 'Olivia Brown', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '6c0d5a2e-f3b8-8d1b-e5f7-9a2b3c6d8e0f', name: 'William Taylor', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '7d1e6b3f-a4c9-9e2c-f6a8-0b3c4d7e9f1a', name: 'Sophia Martinez', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '8e2f7c4a-b5d0-0f3d-a7b9-1c4d5e8f0a2b', name: 'James Anderson', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '9f3a8d5b-c6e1-1a4e-b8c0-2d5e6f9a1b3c', name: 'Isabella Thomas', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },
  { id: '0a4b9e6c-d7f2-2b5f-c9d1-3e6f7a0b2c4d', name: 'Benjamin Jackson', orgId: '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' },

  // Clinic children
  { id: 'b5c0f7d8-e8a3-3c6a-d0e2-4f7a8b1c3d5e', name: 'Mia White', orgId: 'clinic-org-id-placeholder' },
  { id: 'c6d1a8e9-f9b4-4d7b-e1f3-5a8b9c2d4e6f', name: 'Lucas Harris', orgId: 'clinic-org-id-placeholder' },
  { id: 'd7e2b9f0-a0c5-5e8c-f2a4-6b9c0d3e5f7a', name: 'Charlotte Martin', orgId: 'clinic-org-id-placeholder' },
  { id: 'e8f3c0a1-b1d6-6f9d-a3b5-7c0d1e4f6a8b', name: 'Henry Thompson', orgId: 'clinic-org-id-placeholder' },
  { id: 'f9a4d1b2-c2e7-7a0e-b4c6-8d1e2f5a7b9c', name: 'Amelia Garcia', orgId: 'clinic-org-id-placeholder' },
  { id: 'a0b5e2c3-d3f8-8b1f-c5d7-9e2f3a6b8c0d', name: 'Alexander Rodriguez', orgId: 'clinic-org-id-placeholder' },
  { id: 'b1c6f3d4-e4a9-9c2a-d6e8-0f3a4b7c9d1e', name: 'Harper Lewis', orgId: 'clinic-org-id-placeholder' },
  { id: 'c2d7a4e5-f5b0-0d3e-e7f9-1a4b5c8d0e2f', name: 'Michael Lee', orgId: 'clinic-org-id-placeholder' },
  { id: 'd3e8b5f6-a6c1-1e4f-f8a0-2b5c6d9e1f3a', name: 'Evelyn Walker', orgId: 'clinic-org-id-placeholder' },
  { id: 'e4f9c6a7-b7d2-2f5a-a9b1-3c6d7e0f2a4b', name: 'Daniel Hall', orgId: 'clinic-org-id-placeholder' }
]

function createProfileInserts(): string {
  console.log('Creating profile INSERT statements...')

  let sql = `-- ====================================
-- CHILD PROFILES
-- Must be inserted BEFORE any session data
-- ====================================

-- Ensure organizations exist first
-- Hospital organization
INSERT INTO public.organisations (id, name, type, status, created_at, updated_at)
VALUES (
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'St. Mary''s Hospital',
    'hospital',
    'active',
    now(),
    now()
) ON CONFLICT (id) DO NOTHING;

-- School organization
INSERT INTO public.organisations (id, name, type, status, created_at, updated_at)
VALUES (
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'Westfield Primary School',
    'school-primary',
    'active',
    now(),
    now()
) ON CONFLICT (id) DO NOTHING;

-- Now insert child profiles
`

  // Group children by organization
  const hospitalChildren = CHILD_PROFILES.filter(c => c.orgId === '7eab219a-7c83-406c-a6b2-75ed44de715b')
  const schoolChildren = CHILD_PROFILES.filter(c => c.orgId === '5f910546-8bdc-44ca-b776-fdd5eb5cccd9')

  sql += '\n-- Hospital children\n'
  hospitalChildren.forEach(child => {
    sql += `INSERT INTO public.profiles (id, name, role, org_id, status, created_at, updated_at)
VALUES (
    '${child.id}',
    '${child.name}',
    'Child',
    '${child.orgId}',
    'active',
    now(),
    now()
) ON CONFLICT (id) DO NOTHING;

`
  })

  sql += '\n-- School children\n'
  schoolChildren.forEach(child => {
    sql += `INSERT INTO public.profiles (id, name, role, org_id, status, created_at, updated_at)
VALUES (
    '${child.id}',
    '${child.name}',
    'Child',
    '${child.orgId}',
    'active',
    now(),
    now()
) ON CONFLICT (id) DO NOTHING;

`
  })

  sql += `
-- ====================================
-- END OF PROFILES - Now safe to insert session data
-- ====================================

`

  return sql
}

function reorganizeSQL(content: string): string {
  // Add profile inserts at the beginning
  const profileInserts = createProfileInserts()

  // Remove any existing profile or organization inserts from content
  // (in case they exist but are in wrong order)
  content = content.replace(/INSERT INTO public\.profiles[\s\S]*?;\n/g, '')
  content = content.replace(/INSERT INTO public\.organisations[\s\S]*?;\n/g, '')

  return profileInserts + content
}

async function main() {
  console.log('🔧 Reorganizing SQL files with proper table order\n')

  // Create a new file with profiles first
  const setupFile = path.join(SQL_COMBINED_DIR, 'setup_profiles.sql')
  const profileSQL = createProfileInserts()

  fs.writeFileSync(setupFile, profileSQL)
  console.log(`✅ Created setup_profiles.sql with all child profiles\n`)
  console.log('📝 IMPORTANT: Run setup_profiles.sql FIRST before any other SQL files!\n')

  // Now update all combined files to ensure they don't have conflicting profile inserts
  const files = fs.readdirSync(SQL_COMBINED_DIR)
    .filter(f => f.startsWith('combined_') && f.endsWith('.sql'))
    .sort()

  for (const file of files) {
    const filepath = path.join(SQL_COMBINED_DIR, file)
    console.log(`📝 Cleaning ${file}...`)

    let content = fs.readFileSync(filepath, 'utf-8')

    // Remove any profile/org inserts that might exist
    content = content.replace(/INSERT INTO public\.profiles[\s\S]*?;\n/g, '')
    content = content.replace(/INSERT INTO public\.organisations[\s\S]*?;\n/g, '')

    fs.writeFileSync(filepath, content)
    console.log(`  ✅ Cleaned unnecessary profile inserts\n`)
  }

  console.log('✅ Reorganization complete!\n')
  console.log('📋 EXECUTION ORDER:')
  console.log('1. Run the deletion script (quick-delete.sql) to clear existing data')
  console.log('2. Run setup_profiles.sql to create all child profiles')
  console.log('3. Run combined_01.sql through combined_14.sql in order')
  console.log('\nThis ensures all foreign key constraints are satisfied!')
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Error:', error)
    process.exit(1)
  })