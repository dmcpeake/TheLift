import { Hono } from 'https://deno.land/x/hono@v3.12.6/mod.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const auth = new Hono()

const supabase = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
)

auth.post('/init-test-users', async (c) => {
  try {
    console.log('Initializing test children data...')
    
    // Get the default organisation (created in migrations)
    const { data: org, error: orgError } = await supabase
      .from('organisations')
      .select('*')
      .limit(1)
      .single()
    
    if (orgError || !org) {
      return c.json({ 
        success: false,
        error: 'No organisation found in database'
      }, 500)
    }
    
    // Insert test children
    const { data: childrenData, error: childrenError } = await supabase
      .from('children')
      .upsert([
        {
          id: 'child-1',
          first_name: 'Alice',
          age: 7,
          username: 'alice123',
          pin: '1234',
          organisation_id: org.id,
          consent_given: true,
          active: true
        },
        {
          id: 'child-2', 
          first_name: 'Bobby',
          age: 9,
          username: 'bobby456',
          pin: '5678',
          organisation_id: org.id,
          consent_given: true,
          active: true
        }
      ], { onConflict: 'id' })
      .select()
    
    if (childrenError) {
      console.error('Error creating test children:', childrenError)
      return c.json({ 
        success: false,
        error: childrenError.message 
      }, 500)
    }
    
    return c.json({ 
      success: true,
      message: 'Test children initialized successfully',
      children: childrenData?.length || 0
    })
    
  } catch (error) {
    console.error('Error initializing test users:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

auth.post('/child-login', async (c) => {
  try {
    const { username, pin } = await c.req.json()
    
    if (!username || !pin) {
      return c.json({ 
        success: false, 
        error: 'Username and PIN are required' 
      }, 400)
    }
    
    const { data: child, error } = await supabase
      .from('children')
      .select('*')
      .eq('username', username)
      .eq('pin', pin)
      .eq('active', true)
      .single()
    
    if (error || !child) {
      return c.json({ 
        success: false, 
        error: 'Invalid username or PIN' 
      }, 401)
    }
    
    return c.json({
      success: true,
      child: {
        id: child.id,
        username: child.username,
        first_name: child.first_name,
        age: child.age
      }
    })
    
  } catch (error) {
    console.error('Error during child login:', error)
    return c.json({ 
      success: false,
      error: 'Login failed' 
    }, 500)
  }
})

auth.get('/debug/child-data', async (c) => {
  try {
    const { data: children, error } = await supabase
      .from('children')
      .select('*')
    
    if (error) {
      return c.json({ 
        success: false,
        error: error.message 
      }, 500)
    }
    
    return c.json({
      success: true,
      children: children
    })
  } catch (error) {
    console.error('Error retrieving child data:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

export { auth as authRoutes }