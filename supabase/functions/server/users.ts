import { Hono } from 'https://deno.land/x/hono@v3.12.6/mod.ts'
import { kvStore } from './kv_store.ts'

const users = new Hono()

users.get('/profile', async (c) => {
  try {
    const authHeader = c.req.header('Authorization')
    if (!authHeader) {
      return c.json({ 
        success: false,
        error: 'Authorization header required' 
      }, 401)
    }
    
    return c.json({
      success: true,
      profile: {
        name: 'Test User',
        role: 'Practitioner',
        status: 'active'
      }
    })
  } catch (error) {
    console.error('Error fetching user profile:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

export { users as userRoutes }