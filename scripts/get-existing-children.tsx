import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://zxhmwywypzrykqkubzll.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp4aG13eXd5cHpyeWtxa3ViemxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ0NTE5ODYsImV4cCI6MjA1MDAyNzk4Nn0.Tg0OSZNnF9wpV7RAsq3FCylCQCXeeInUE1eLzdHGLKQ'

const supabase = createClient(supabaseUrl, supabaseAnonKey)

async function getExistingChildren() {
  console.log('Fetching existing child profiles from database...\n')

  // Get existing child profiles
  const { data: children, error } = await supabase
    .from('profiles')
    .select('id, name, role, org_id')
    .eq('role', 'Child')
    .order('name')

  if (error) {
    console.error('Error fetching children:', error)
    return
  }

  console.log(`Found ${children?.length || 0} existing child profiles:\n`)

  if (children && children.length > 0) {
    // Group by org_id
    const byOrg: Record<string, any[]> = {}
    children.forEach(child => {
      const orgId = child.org_id || 'no-org'
      if (!byOrg[orgId]) byOrg[orgId] = []
      byOrg[orgId].push(child)
    })

    // Display grouped
    Object.entries(byOrg).forEach(([orgId, orgChildren]) => {
      console.log(`\nOrganization ${orgId}:`)
      orgChildren.forEach(child => {
        console.log(`  - ${child.id}: ${child.name}`)
      })
    })

    // Create mapping for our known children
    console.log('\n\n=== MAPPING FOR SQL UPDATES ===\n')
    console.log('const CHILD_ID_MAPPING = {')
    console.log('  // Map our test data names to existing profile IDs')

    // Known child names from our test data
    const testChildNames = [
      'Emma Thompson', 'Aisha Patel', 'Oliver Chen', 'Sarah Williams',
      'Marcus Johnson', 'Isabella Rodriguez', 'Noah Kim', 'Zara Ahmed',
      'Ethan Davis', 'Maya Sharma', 'Chloe King', 'Liam Johnson',
      'Emma Davis', 'Noah Wilson', 'Olivia Brown', 'William Taylor',
      'Sophia Martinez', 'James Anderson', 'Isabella Thomas', 'Benjamin Jackson'
    ]

    testChildNames.forEach(testName => {
      const existing = children.find(c => c.name === testName)
      if (existing) {
        console.log(`  '${testName}': '${existing.id}',`)
      }
    })
    console.log('}')
  }
}

getExistingChildren()
  .then(() => process.exit(0))
  .catch(error => {
    console.error('Error:', error)
    process.exit(1)
  })