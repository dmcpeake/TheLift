import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
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
          password: 'Admin123!',
          name: 'Admin User',
          role: 'Account'
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
          password: 'Practitioner123!',
          name: 'Test Practitioner',
          role: 'Practitioner'
        },
        {
          id: '30000000-0000-0000-0000-000000000001',
          email: 'manager@example.com',
          password: 'Manager123!', 
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
            admin: { email: 'admin@example.com', password: 'Admin123!' },
            practitioner: { email: 'practitioner@example.com', password: 'Practitioner123!' },
            manager: { email: 'manager@example.com', password: 'Manager123!' },
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