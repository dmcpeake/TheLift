import { Hono } from 'npm:hono'
import { createClient } from 'npm:@supabase/supabase-js@2'

const app = new Hono()

// Create Supabase admin client
const getSupabaseAdmin = () => createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
)

// Simple test user setup endpoint
app.post('/setup-test-users', async (c) => {
  try {
    const supabase = getSupabaseAdmin()
    
    // Clean, simple test users
    const testUsers = [
      { email: 'admin@test.com', password: 'test123', role: 'admin' },
      { email: 'practitioner@test.com', password: 'test123', role: 'practitioner' }
    ]

    const results = []
    
    for (const user of testUsers) {
      try {
        // Remove existing user if exists
        const { data: existing } = await supabase.auth.admin.listUsers()
        const existingUser = existing?.users?.find(u => u.email === user.email)
        if (existingUser) {
          await supabase.auth.admin.deleteUser(existingUser.id)
        }
        
        // Create fresh confirmed user
        const { data, error } = await supabase.auth.admin.createUser({
          email: user.email,
          password: user.password,
          email_confirm: true,
          user_metadata: { role: user.role }
        })
        
        if (error) {
          results.push({ email: user.email, success: false, error: error.message })
        } else {
          results.push({ email: user.email, success: true })
        }
      } catch (e) {
        results.push({ email: user.email, success: false, error: e.message })
      }
    }

    return c.json({
      success: true,
      message: 'Test users ready',
      credentials: testUsers,
      results
    })
    
  } catch (error) {
    return c.json({ success: false, error: error.message }, 500)
  }
})

export default app