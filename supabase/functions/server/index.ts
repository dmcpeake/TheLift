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

    // Initialize test children data
    if (pathname === '/auth/init-test-users' && req.method === 'POST') {
      console.log('Initializing test children...')
      
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
      
      // Create auth users and profiles first
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
      
      const children = []
      
      for (const childData of testChildrenData) {
        // Create auth user first
        const { data: authUser, error: authError } = await supabase.auth.admin.createUser({
          user_id: childData.id,
          email: childData.email,
          password: `temp-password-${childData.username}`,
          email_confirm: true,
          user_metadata: {
            role: 'Child',
            first_name: childData.first_name
          }
        })
        
        if (authError && !authError.message.includes('already exists')) {
          console.error(`Failed to create auth user for ${childData.username}:`, authError)
          continue
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
        
        if (profileError) {
          console.error(`Failed to create profile for ${childData.username}:`, profileError)
          continue
        }
        
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
        
        if (childError) {
          console.error(`Failed to create child record for ${childData.username}:`, childError)
          continue
        }
        
        children.push(child)
        console.log(`Successfully created child: ${childData.first_name} (${childData.username})`)
      }
      
      console.log(`Successfully processed ${children.length} test children`)
      
      return Response.json(
        {
          success: true,
          message: 'Test children initialized successfully',
          children: children.length,
          data: children
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