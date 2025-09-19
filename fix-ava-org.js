const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = 'https://krwlgxqafwaxtkuafwjn.supabase.co';
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtyd2xneHFhZndheHRrdWFmd2puIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUzOTM1NzUsImV4cCI6MjA0MDk2OTU3NX0.1e5Vh-Cz-s7dW8rUVnMgLNqZItQ6X9N9YApkVaN0B-g';
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtyd2xneHFhZndheHRrdWFmd2puIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcyNTM5MzU3NSwiZXhwIjoyMDQwOTY5NTc1fQ.QQT-_kCja59oOFLpkONpfQC3UJZYaEA_6Xl-dGzqw7I';

// Use service key for admin operations
const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function fixAvaOrganization() {
  console.log('Starting Ava Davis organization fix...\n');

  try {
    // First, get the organization IDs
    const { data: orgs, error: orgError } = await supabase
      .from('organisations')
      .select('id, name')
      .in('name', ['Westfield Primary School', 'Wellmind Children\'s Clinic']);

    if (orgError) throw orgError;

    const westfield = orgs.find(o => o.name === 'Westfield Primary School');
    const wellmind = orgs.find(o => o.name === 'Wellmind Children\'s Clinic');

    if (!westfield || !wellmind) {
      console.error('Could not find required organizations');
      return;
    }

    console.log(`Found Westfield Primary School: ${westfield.id}`);
    console.log(`Found Wellmind Children's Clinic: ${wellmind.id}\n`);

    // Get Ava's profile
    const { data: avaProfile, error: avaError } = await supabase
      .from('profiles')
      .select('id, name, org_id')
      .eq('name', 'Ava Davis')
      .single();

    if (avaError || !avaProfile) {
      console.error('Could not find Ava Davis profile');
      return;
    }

    console.log(`Found Ava Davis: ${avaProfile.id}`);
    console.log(`Current org_id: ${avaProfile.org_id}\n`);

    // Update Ava's profile
    const { error: profileError } = await supabase
      .from('profiles')
      .update({ org_id: westfield.id })
      .eq('id', avaProfile.id);

    if (profileError) throw profileError;
    console.log('✓ Updated Ava\'s profile organization');

    // Update checkin_sessions
    const { error: sessionsError } = await supabase
      .from('checkin_sessions')
      .update({ org_id: westfield.id })
      .eq('child_id', avaProfile.id);

    if (sessionsError) throw sessionsError;
    console.log('✓ Updated checkin_sessions');

    // Update mood_meter_usage
    const { error: moodError } = await supabase
      .from('mood_meter_usage')
      .update({ org_id: westfield.id })
      .eq('child_id', avaProfile.id);

    if (moodError) throw moodError;
    console.log('✓ Updated mood_meter_usage');

    // Update emotion_grid_usage
    const { error: emotionError } = await supabase
      .from('emotion_grid_usage')
      .update({ org_id: westfield.id })
      .eq('child_id', avaProfile.id);

    if (emotionError) throw emotionError;
    console.log('✓ Updated emotion_grid_usage');

    // Update wellbeing_wheel_usage
    const { error: wellbeingError } = await supabase
      .from('wellbeing_wheel_usage')
      .update({ org_id: westfield.id })
      .eq('child_id', avaProfile.id);

    if (wellbeingError) throw wellbeingError;
    console.log('✓ Updated wellbeing_wheel_usage');

    // Update breathing_tool_usage
    const { error: breathingError } = await supabase
      .from('breathing_tool_usage')
      .update({ org_id: westfield.id })
      .eq('child_id', avaProfile.id);

    if (breathingError) throw breathingError;
    console.log('✓ Updated breathing_tool_usage\n');

    // Verify the final state
    console.log('Verifying final organization assignments:\n');

    const { data: allChildren, error: verifyError } = await supabase
      .from('profiles')
      .select('name, organisations(name)')
      .eq('role', 'Child')
      .order('name');

    if (verifyError) throw verifyError;

    // Group by organization
    const byOrg = {};
    allChildren.forEach(child => {
      const orgName = child.organisations?.name || 'No organization';
      if (!byOrg[orgName]) byOrg[orgName] = [];
      byOrg[orgName].push(child.name);
    });

    // Display results
    Object.keys(byOrg).sort().forEach(orgName => {
      console.log(`${orgName} (${byOrg[orgName].length} children):`);
      byOrg[orgName].forEach(name => {
        console.log(`  - ${name}`);
      });
      console.log();
    });

    console.log('✅ Successfully moved Ava Davis to Westfield Primary School!');

  } catch (error) {
    console.error('Error:', error);
  }
}

fixAvaOrganization();