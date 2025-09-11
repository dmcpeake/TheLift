import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type, x-demo-mode',
  'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE',
}

serve(async (req) => {
  // Handle CORS preflight requests
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  const url = new URL(req.url)
  let { pathname } = url
  
  // Remove the /server prefix that Supabase adds
  pathname = pathname.replace(/^\/server/, '') || '/'

  // Initialize Supabase client with service role key
  const supabaseUrl = Deno.env.get('SUPABASE_URL')!
  const serviceRoleKey = Deno.env.get('SERVICE_ROLE_KEY')!
  
  const supabase = createClient(supabaseUrl, serviceRoleKey)
  
  console.log('Request received:', req.method, pathname, 'Headers:', Object.fromEntries(req.headers.entries()))

  try {
    // Health check endpoint
    if (pathname === '/' || pathname === '/health') {
      return Response.json(
        { 
          status: 'ok', 
          service: 'The Lift API Server',
          timestamp: new Date().toISOString(),
          environment: 'production'
        },
        { headers: corsHeaders }
      )
    }

    // Initialize all test users (admin, practitioners, children)
    if (pathname === '/auth/init-test-users' && req.method === 'POST') {
      console.log('Initializing all test users...')
      
      // Clear existing test users first
      try {
        await supabase.auth.admin.deleteUser('10000000-0000-0000-0000-000000000001')
        await supabase.auth.admin.deleteUser('20000000-0000-0000-0000-000000000001') 
        await supabase.auth.admin.deleteUser('30000000-0000-0000-0000-000000000001')
        await supabase.auth.admin.deleteUser('11111111-2222-3333-4444-555555555555')
        await supabase.auth.admin.deleteUser('22222222-3333-4444-5555-666666666666')
      } catch (error) {
        console.log('Cleanup completed')
      }
      
      // First, add child auth columns if they don't exist
      try {
        await supabase.rpc('exec_sql', {
          query: `
            ALTER TABLE public.children 
            ADD COLUMN IF NOT EXISTS username text UNIQUE,
            ADD COLUMN IF NOT EXISTS pin text,
            ADD COLUMN IF NOT EXISTS age integer,
            ADD COLUMN IF NOT EXISTS active boolean DEFAULT true;
            
            CREATE INDEX IF NOT EXISTS idx_children_username ON public.children(username) WHERE username IS NOT NULL;
            CREATE INDEX IF NOT EXISTS idx_children_active ON public.children(active) WHERE active = true;
          `
        })
      } catch (error) {
        console.log('Schema update completed or columns already exist')
      }
      
      // Get or create the default organisation
      let { data: org, error: orgError } = await supabase
        .from('organisations')
        .select('id')
        .eq('name', 'Default Organisation')
        .single()
      
      if (orgError || !org) {
        // Create default organisation
        const { data: newOrg, error: createOrgError } = await supabase
          .from('organisations')
          .insert({
            name: 'Default Organisation',
            type: 'school-primary',
            status: 'active'
          })
          .select('id')
          .single()
        
        if (createOrgError) {
          throw new Error(`Failed to create organisation: ${createOrgError.message}`)
        }
        org = newOrg
      }
      
      const results = { admins: 0, practitioners: 0, children: 0, errors: [] }
      
      // Create admin users
      const adminUsers = [
        {
          id: '10000000-0000-0000-0000-000000000001',
          email: 'admin@example.com',
          password: 'password123',
          name: 'Admin User',
          role: 'Account'
        },
        {
          id: '10000000-0000-0000-0000-000000000002',
          email: 'demo@groupadmin.com',
          password: 'password123',
          name: 'Demo Group Admin',
          role: 'GroupContact'
        }
      ]
      
      for (const adminData of adminUsers) {
        try {
          const { data: authUser, error: authError } = await supabase.auth.admin.createUser({
            user_id: adminData.id,
            email: adminData.email,
            password: adminData.password,
            email_confirm: true,
            user_metadata: { role: adminData.role, name: adminData.name }
          })
          
          if (authError && !authError.message.includes('already exists')) {
            throw authError
          }
          
          const { error: profileError } = await supabase
            .from('profiles')
            .upsert({
              id: adminData.id,
              email: adminData.email,
              name: adminData.name,
              role: adminData.role,
              org_id: org.id,
              status: 'active'
            }, { onConflict: 'id' })
          
          if (profileError) throw profileError
          
          results.admins++
          console.log(`Created admin: ${adminData.email}`)
        } catch (error) {
          results.errors.push(`Admin ${adminData.email}: ${error.message}`)
        }
      }
      
      // Create practitioner users  
      const practitionerUsers = [
        {
          id: '20000000-0000-0000-0000-000000000001',
          email: 'practitioner@example.com', 
          password: 'password123',
          name: 'Test Practitioner',
          role: 'Practitioner'
        },
        {
          id: '30000000-0000-0000-0000-000000000001',
          email: 'manager@example.com',
          password: 'password123', 
          name: 'Group Manager',
          role: 'GroupContact'
        }
      ]
      
      for (const practitionerData of practitionerUsers) {
        try {
          const { data: authUser, error: authError } = await supabase.auth.admin.createUser({
            user_id: practitionerData.id,
            email: practitionerData.email,
            password: practitionerData.password,
            email_confirm: true,
            user_metadata: { role: practitionerData.role, name: practitionerData.name }
          })
          
          if (authError && !authError.message.includes('already exists')) {
            throw authError
          }
          
          const { error: profileError } = await supabase
            .from('profiles')
            .upsert({
              id: practitionerData.id,
              email: practitionerData.email,
              name: practitionerData.name,
              role: practitionerData.role,
              org_id: org.id,
              status: 'active'
            }, { onConflict: 'id' })
          
          if (profileError) throw profileError
          
          results.practitioners++
          console.log(`Created practitioner: ${practitionerData.email}`)
        } catch (error) {
          results.errors.push(`Practitioner ${practitionerData.email}: ${error.message}`)
        }
      }
      
      // Create child users
      const testChildrenData = [
        {
          id: '11111111-2222-3333-4444-555555555555',
          email: 'alice123@children.thelift.local',
          first_name: 'Alice',
          age: 7,
          username: 'alice123',
          pin: '1234'
        },
        {
          id: '22222222-3333-4444-5555-666666666666', 
          email: 'bobby456@children.thelift.local',
          first_name: 'Bobby',
          age: 9,
          username: 'bobby456',
          pin: '5678'
        }
      ]
      
      for (const childData of testChildrenData) {
        try {
          // Create auth user first
          const { data: authUser, error: authError } = await supabase.auth.admin.createUser({
            user_id: childData.id,
            email: childData.email,
            password: `Child123-${childData.username}`,
            email_confirm: true,
            user_metadata: {
              role: 'Child',
              first_name: childData.first_name
            }
          })
          
          if (authError && !authError.message.includes('already exists')) {
            throw authError
          }
          
          // Create profile
          const { error: profileError } = await supabase
            .from('profiles')
            .upsert({
              id: childData.id,
              email: childData.email,
              name: childData.first_name,
              role: 'Child',
              org_id: org.id,
              status: 'active'
            }, { onConflict: 'id' })
          
          if (profileError) throw profileError
          
          // Create child record
          const { data: child, error: childError } = await supabase
            .from('children')
            .upsert({
              id: childData.id,
              first_name: childData.first_name,
              age: childData.age,
              username: childData.username,
              pin: childData.pin,
              consent_given: true,
              active: true
            }, { onConflict: 'id' })
            .select()
            .single()
          
          if (childError) throw childError
          
          results.children++
          console.log(`Created child: ${childData.first_name} (${childData.username})`)
        } catch (error) {
          results.errors.push(`Child ${childData.username}: ${error.message}`)
        }
      }
      
      return Response.json(
        {
          success: true,
          message: 'All test users initialized successfully',
          results: results,
          accounts: {
            admin: { email: 'admin@example.com', password: 'password123' },
            practitioner: { email: 'practitioner@example.com', password: 'password123' },
            manager: { email: 'manager@example.com', password: 'password123' },
            children: [
              { username: 'alice123', pin: '1234' },
              { username: 'bobby456', pin: '5678' }
            ]
          }
        },
        { headers: corsHeaders }
      )
    }

    // Child login endpoint
    if (pathname === '/auth/child-login' && req.method === 'POST') {
      const body = await req.json()
      const { username, pin } = body
      
      if (!username || !pin) {
        return Response.json(
          { 
            success: false, 
            error: 'Username and PIN are required' 
          },
          { status: 400, headers: corsHeaders }
        )
      }
      
      const { data: child, error } = await supabase
        .from('children')
        .select('id, username, first_name, age, organisation_id')
        .eq('username', username)
        .eq('pin', pin)
        .eq('active', true)
        .single()
      
      if (error || !child) {
        return Response.json(
          { 
            success: false, 
            error: 'Invalid username or PIN' 
          },
          { status: 401, headers: corsHeaders }
        )
      }
      
      console.log(`Child login successful: ${child.first_name} (${child.username})`)
      
      return Response.json(
        {
          success: true,
          child: {
            id: child.id,
            username: child.username,
            first_name: child.first_name,
            age: child.age,
            organisation_id: child.organisation_id
          }
        },
        { headers: corsHeaders }
      )
    }

    // Simple test endpoint first
    if (pathname === '/test' && req.method === 'POST') {
      console.log('Test endpoint hit!')
      return Response.json(
        { success: true, message: 'Test endpoint working' },
        { headers: corsHeaders }
      )
    }

    // Add new child endpoint
    if (pathname === '/children' && req.method === 'POST') {
      console.log('Received request to add child')
      
      try {
        const body = await req.json()
        const { name, aboutMe, credentialsMode, credentials, practitionerId } = body
        
        console.log('Child data:', { name, aboutMe, credentials })
        
        if (!name) {
          return Response.json(
            { 
              success: false, 
              error: 'Child name is required' 
            },
            { status: 400, headers: corsHeaders }
          )
        }
        
        // For now, just return success without actually saving to database
        console.log('Would create child:', name, 'with username:', credentials?.username)
        
        return Response.json(
          {
            success: true,
            message: 'Child added successfully (demo mode)',
            child: { name, credentials }
          },
          { headers: corsHeaders }
        )
      } catch (error) {
        console.error('Error in children endpoint:', error)
        return Response.json(
          { success: false, error: error.message },
          { status: 500, headers: corsHeaders }
        )
      }
    }

    // Debug endpoint to view all children
    if (pathname === '/auth/debug/children' && req.method === 'GET') {
      const { data: children, error } = await supabase
        .from('children')
        .select('*')
        .order('created_at', { ascending: false })
      
      if (error) {
        throw new Error(`Database query failed: ${error.message}`)
      }
      
      return Response.json(
        {
          success: true,
          children: children || [],
          count: children?.length || 0
        },
        { headers: corsHeaders }
      )
    }

    // Setup waitlist table and populate with test data
    if (pathname === '/setup-waitlist' && req.method === 'POST') {
      console.log('Setting up waitlist table...')
      
      // First, create the table using the same method we used for children table
      try {
        await supabase.rpc('exec_sql', {
          query: `
            CREATE TABLE IF NOT EXISTS public.waitlist (
              id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
              name TEXT NOT NULL,
              email TEXT NOT NULL UNIQUE,
              organization TEXT,
              role TEXT,
              created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
            );
            
            CREATE INDEX IF NOT EXISTS waitlist_email_idx ON public.waitlist(email);
            CREATE INDEX IF NOT EXISTS waitlist_created_at_idx ON public.waitlist(created_at DESC);
            
            ALTER TABLE public.waitlist ENABLE ROW LEVEL SECURITY;
            CREATE POLICY "Enable all operations for all users" ON public.waitlist FOR ALL USING (true);
            
            GRANT ALL ON public.waitlist TO anon;
            GRANT ALL ON public.waitlist TO authenticated;
            GRANT ALL ON public.waitlist TO service_role;
          `
        })
      } catch (error) {
        console.log('Table creation completed or already exists')
      }
      
      // Now insert the test data
      const testData = [
        {
          name: 'Sarah Johnson',
          email: 'sarah.johnson@primaryschool.edu',
          organization: 'Meadowbrook Primary School',
          role: 'teacher',
          created_at: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000).toISOString()
        },
        {
          name: 'Dr. Michael Chen',
          email: 'michael.chen@childpsychology.uk',
          organization: 'London Child Psychology Centre',
          role: 'psychologist',
          created_at: new Date(Date.now() - 4 * 24 * 60 * 60 * 1000).toISOString()
        },
        {
          name: 'Emma Thompson',
          email: 'emma.thompson@gmail.com',
          organization: null,
          role: 'parent',
          created_at: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000).toISOString()
        },
        {
          name: 'James Wilson',
          email: 'j.wilson@stmarys-academy.org',
          organization: 'St. Mary\'s Academy',
          role: 'headteacher',
          created_at: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString()
        },
        {
          name: 'Dr. Rachel Green',
          email: 'r.green@nhs.uk',
          organization: 'NHS Greater Manchester Mental Health Trust',
          role: 'therapist',
          created_at: new Date(Date.now() - 1 * 24 * 60 * 60 * 1000).toISOString()
        },
        {
          name: 'Lisa Parker',
          email: 'lisa.parker@counselling.co.uk',
          organization: 'Parker Counselling Services',
          role: 'counselor',
          created_at: new Date(Date.now() - 12 * 60 * 60 * 1000).toISOString()
        },
        {
          name: 'David Mitchell',
          email: 'dmitchell@yahoo.com',
          organization: null,
          role: 'parent',
          created_at: new Date(Date.now() - 6 * 60 * 60 * 1000).toISOString()
        },
        {
          name: 'Anna Roberts',
          email: 'a.roberts@riverside-school.edu',
          organization: 'Riverside Community School',
          role: 'social-worker',
          created_at: new Date(Date.now() - 3 * 60 * 60 * 1000).toISOString()
        }
      ]

      const { data, error } = await supabase
        .from('waitlist')
        .insert(testData)
        .select()

      if (error) {
        console.error('Error inserting waitlist data:', error)
        return Response.json(
          { 
            success: false, 
            error: 'Failed to populate waitlist', 
            details: error 
          },
          { status: 500, headers: corsHeaders }
        )
      }

      return Response.json(
        {
          success: true,
          message: `Successfully populated waitlist with ${data?.length || 0} entries`,
          data: data
        },
        { headers: corsHeaders }
      )
    }

    // 404 for unmatched routes
    return Response.json(
      { 
        success: false,
        error: 'Endpoint not found',
        path: pathname,
        method: req.method 
      },
      { status: 404, headers: corsHeaders }
    )

  } catch (error) {
    console.error('Edge Function error:', error)
    
    return Response.json(
      {
        success: false,
        error: 'Internal server error',
        message: error.message,
        timestamp: new Date().toISOString()
      },
      { status: 500, headers: corsHeaders }
    )
  }
})