import { Hono } from 'https://deno.land/x/hono@v3.12.6/mod.ts'
import { kvStore } from './kv_store.ts'

const auth = new Hono()

auth.post('/init-test-users', async (c) => {
  try {
    console.log('Initializing test users and child data...')
    
    const testUsers = [
      {
        id: 'admin-user-id',
        email: 'admin@example.com',
        name: 'Admin User',
        role: 'Account'
      },
      {
        id: 'practitioner-user-id',
        email: 'practitioner@example.com',
        name: 'Test Practitioner',
        role: 'Practitioner'
      },
      {
        id: 'groupmanager-user-id',
        email: 'manager@example.com',
        name: 'Group Manager',
        role: 'GroupContact'
      }
    ]
    
    for (const user of testUsers) {
      await kvStore.set(`user:${user.id}`, user)
      console.log(`Created test user: ${user.email}`)
    }
    
    const testChildren = [
      {
        id: 'child-1',
        username: 'alice123',
        pin: '1234',
        first_name: 'Alice',
        age: 7,
        practitioner_id: 'practitioner-user-id'
      },
      {
        id: 'child-2',
        username: 'bobby456',
        pin: '5678',
        first_name: 'Bobby',
        age: 9,
        practitioner_id: 'practitioner-user-id'
      }
    ]
    
    for (const child of testChildren) {
      await kvStore.set(`child:${child.username}`, child)
      console.log(`Created test child: ${child.username}`)
    }
    
    return c.json({ 
      success: true,
      message: 'Test users and children initialized successfully',
      users: testUsers.length,
      children: testChildren.length
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
    
    const child = await kvStore.get(`child:${username}`)
    
    if (!child || child.pin !== pin) {
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
    const children = await kvStore.list('child:')
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