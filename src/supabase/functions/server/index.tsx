import { Hono } from 'npm:hono'
import { cors } from 'npm:hono/cors'
import { logger } from 'npm:hono/logger'
import { createClient } from 'npm:@supabase/supabase-js@2'
import * as kv from './kv_store.tsx'
import adminRoutes from './admin.tsx'
import authRoutes from './auth.tsx'

const app = new Hono()

// Enable CORS for all routes
app.use('*', cors({
  origin: '*',
  allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowHeaders: ['Content-Type', 'Authorization'],
}))

// Add logging
app.use('*', logger(console.log))

// Create Supabase client
const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
)

// Helper function to get user from token
const getUserFromToken = async (accessToken: string) => {
  const { data: { user }, error } = await supabase.auth.getUser(accessToken)
  if (error || !user) return null
  return user
}

// Default route
app.get('/', (c) => {
  return c.json({ 
    message: 'The Lift API Server',
    version: '1.0.0',
    timestamp: new Date().toISOString()
  })
})

// Health check route
app.get('/server/health', async (c) => {
  return c.json({ 
    status: 'ok', 
    timestamp: new Date().toISOString(),
    message: 'The Lift server is running'
  })
})

// Debug endpoint to check KV store data
app.get('/server/debug/child-data', async (c) => {
  try {
    const credentials = await kv.get('childCredentials:testchild')
    const child = await kv.get('child:demo-school-001:test-child-1')
    const allCredentials = await kv.getByPrefix('childCredentials:')
    const allChildren = await kv.getByPrefix('child:demo-school-001:')
    
    return c.json({
      testCredentials: credentials,
      testChild: child,
      allCredentials: allCredentials,
      allChildren: allChildren,
      timestamp: new Date().toISOString()
    })
  } catch (error) {
    console.log('Debug endpoint error:', error)
    return c.json({ error: 'Failed to get debug data' }, 500)
  }
})

// Create fresh test users
app.post('/server/auth/create-fresh-users', async (c) => {
  try {
    console.log('=== CREATING FRESH TEST USERS ===')
    
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    )

    // Delete existing users first
    try {
      const { data: users } = await supabaseAdmin.auth.admin.listUsers()
      for (const user of users?.users || []) {
        if (['testadmin@demo.com', 'testprac@demo.com'].includes(user.email)) {
          await supabaseAdmin.auth.admin.deleteUser(user.id)
          console.log(`Deleted existing user: ${user.email}`)
        }
      }
    } catch (e) {
      console.log('Error cleaning users:', e)
    }

    // Create fresh users
    const testUsers = [
      { email: 'testadmin@demo.com', password: 'demo123!', name: 'Test Admin' },
      { email: 'testprac@demo.com', password: 'demo123!', name: 'Test Practitioner' }
    ]

    const results = []
    for (const userData of testUsers) {
      try {
        const { data, error } = await supabaseAdmin.auth.admin.createUser({
          email: userData.email,
          password: userData.password,
          user_metadata: { name: userData.name },
          email_confirm: true
        })
        
        if (error) {
          console.log(`Error creating ${userData.email}:`, error.message)
          results.push({ email: userData.email, success: false, error: error.message })
        } else {
          console.log(`Created user: ${userData.email}`)
          results.push({ email: userData.email, success: true, id: data.user.id })
        }
      } catch (e) {
        console.log(`Exception creating ${userData.email}:`, e)
        results.push({ email: userData.email, success: false, error: e.message })
      }
    }

    return c.json({ 
      success: true, 
      results,
      credentials: testUsers.map(u => ({ email: u.email, password: u.password }))
    })
    
  } catch (error) {
    console.log('Create users error:', error)
    return c.json({ error: error.message }, 500)
  }
})

// Initialize test users
app.post('/server/auth/init-test-users', async (c) => {
  try {
    console.log('=== INIT TEST USERS ROUTE CALLED ===')
    
    const testUsers = [
      {
        email: 'admin@thelift.com',
        password: 'TestLift2024!',
        name: 'Lift Admin',
        role: 'Account',
        orgId: 'lift-org-001'
      },
      {
        email: 'contact@demoschool.com',
        password: 'TestLift2024!',
        name: 'Sarah Thompson',
        role: 'GroupContact',
        orgId: 'demo-school-001'
      },
      {
        email: 'practitioner@demoschool.com',
        password: 'TestLift2024!',
        name: 'Michael Chen',
        role: 'Practitioner',
        orgId: 'demo-school-001'
      },
      {
        email: 'testchild@child.local',
        password: '1234',
        name: 'Emma Davis',
        role: 'Child',
        orgId: 'demo-school-001'
      }
    ]

    const createdUsers = []
    
    for (const userData of testUsers) {
      try {
        const { data: existingUsers, error: listError } = await supabase.auth.admin.listUsers()
        
        if (listError) {
          console.log('Error listing users:', listError.message)
          continue
        }
        
        const existingUser = existingUsers.users.find(user => user.email === userData.email)
        
        if (existingUser) {
          console.log(`User ${userData.email} already exists`)
          createdUsers.push({
            id: existingUser.id,
            email: userData.email,
            name: userData.name,
            role: userData.role,
            status: 'existing'
          })
          continue
        }

        const { data, error } = await supabase.auth.admin.createUser({
          email: userData.email,
          password: userData.password,
          user_metadata: { 
            name: userData.name, 
            role: userData.role,
            orgId: userData.orgId
          },
          email_confirm: true
        })
        
        if (error) {
          console.log(`Error creating user ${userData.email}:`, error.message)
          continue
        }
        
        createdUsers.push({
          id: data.user.id,
          email: userData.email,
          name: userData.name,
          role: userData.role,
          status: 'created'
        })
        
        console.log(`Successfully created user: ${userData.email}`)
      } catch (userError) {
        console.log(`Error processing user ${userData.email}:`, userError)
      }
    }

    // Create test child credentials for demo purposes
    console.log('Creating test child credentials...')
    await kv.set('childCredentials:testchild', {
      username: 'testchild',
      pin: '1234',
      childId: 'demo-school-001:test-child-1',
      createdAt: new Date().toISOString()
    })
    console.log('Test child credentials created')

    // Create test child record
    console.log('Creating test child record...')
    await kv.set('child:demo-school-001:test-child-1', {
      id: 'demo-school-001:test-child-1',
      name: 'Emma Davis',
      aboutMe: { favourites: ['Drawing', 'Animals'], notes: 'Loves art activities' },
      credentials: {
        mode: 'slip',
        username: 'testchild',
        pin: '1234'
      },
      status: 'active',
      orgId: 'demo-school-001',
      practitionerId: 'demo-practitioner-id',
      totalCheckIns: 5,
      currentStreak: 2,
      createdAt: new Date().toISOString()
    })
    console.log('Test child record created')

    // Verify the data was stored correctly
    const storedCredentials = await kv.get('childCredentials:testchild')
    const storedChild = await kv.get('child:demo-school-001:test-child-1')
    console.log('Verification - stored credentials:', storedCredentials)
    console.log('Verification - stored child:', storedChild)

    // Initialize demo clients
    await kv.set('client:demo-school-001', {
      id: 'demo-school-001',
      name: 'Demo Elementary School',
      contactEmail: 'contact@demoschool.com',
      contractStart: '2024-01-01',
      contractEnd: '2024-12-31',
      seatsTotal: 50,
      seatsUsed: 0,
      status: 'active',
      createdAt: new Date().toISOString()
    })

    await kv.set('client:lift-org-001', {
      id: 'lift-org-001',
      name: 'The Lift Platform',
      contactEmail: 'admin@thelift.com',
      contractStart: '2024-01-01',
      contractEnd: '2025-12-31',
      seatsTotal: 1000,
      seatsUsed: 0,
      status: 'active',
      createdAt: new Date().toISOString()
    })
    
    console.log('=== INIT TEST USERS COMPLETED ===')
    
    return c.json({ 
      success: true,
      message: 'Test users and clients initialized successfully',
      users: createdUsers
    })
  } catch (error) {
    console.error('=== INIT TEST USERS ERROR ===', error)
    return c.json({ 
      success: false,
      error: 'Failed to initialize test users',
      details: error.message
    }, 500)
  }
})

// Child authentication endpoint
app.post('/server/auth/child-login', async (c) => {
  try {
    console.log('=== CHILD LOGIN ATTEMPT ===')
    const { username, pin } = await c.req.json()
    console.log('Login attempt with:', { username, pin })
    
    if (!username || !pin) {
      console.log('Missing username or PIN')
      return c.json({ error: 'Username and PIN are required' }, 400)
    }

    // Check child credentials
    console.log('Looking for credentials:', `childCredentials:${username}`)
    const credentials = await kv.get(`childCredentials:${username}`)
    console.log('Found credentials:', credentials)
    
    if (!credentials || credentials.pin !== pin) {
      console.log('Invalid credentials. Expected PIN:', credentials?.pin, 'Got PIN:', pin)
      return c.json({ error: 'Invalid username or PIN' }, 401)
    }

    // Get child details
    console.log('Looking for child:', `child:${credentials.childId}`)
    const child = await kv.get(`child:${credentials.childId}`)
    console.log('Found child:', child)
    
    if (!child || child.status !== 'active') {
      console.log('Child not found or inactive. Status:', child?.status)
      return c.json({ error: 'Child account not found or inactive' }, 401)
    }

    // Create a session token for the child (simplified for demo)
    const sessionToken = `child_${credentials.childId}_${Date.now()}`
    console.log('Creating session token:', sessionToken)
    
    // Store session (in real app, this would be more secure)
    await kv.set(`session:${sessionToken}`, {
      userId: credentials.childId,
      username: username,
      role: 'Child',
      orgId: child.orgId,
      createdAt: new Date().toISOString(),
      expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString() // 24 hours
    })
    console.log('Session stored successfully')

    const response = {
      success: true,
      sessionToken,
      user: {
        id: credentials.childId,
        username: username,
        profile: {
          id: credentials.childId,
          name: child.name,
          role: 'Child',
          orgId: child.orgId,
          status: 'active'
        }
      }
    }
    
    console.log('Sending response:', response)
    return c.json(response)
  } catch (error) {
    console.log('Child login error:', error)
    console.log('Error details:', error.message, error.stack)
    return c.json({ error: 'Failed to authenticate', details: error.message }, 500)
  }
})

// Get user profile
app.get('/server/auth/profile', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    
    if (!accessToken) {
      return c.json({ error: 'No access token provided' }, 401)
    }
    
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Invalid access token' }, 401)
    }
    
    return c.json({
      id: user.id,
      email: user.email,
      profile: {
        id: user.id,
        name: user.user_metadata?.name || user.email?.split('@')[0] || 'User',
        role: user.user_metadata?.role || 'Practitioner',
        orgId: user.user_metadata?.orgId || 'default-org',
        status: 'active'
      }
    })
  } catch (error) {
    console.log('Get profile error:', error)
    return c.json({ error: 'Failed to get profile' }, 500)
  }
})

// Get dashboard data
app.get('/server/dashboard', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const orgId = user.user_metadata?.orgId || 'default-org'
    const role = user.user_metadata?.role || 'Practitioner'

    // Get organization data
    const organization = await kv.get(`org:${orgId}`) || {
      name: 'Demo Organization',
      contractEnd: '2024-12-31',
      seatsTotal: 50,
      seatsUsed: 12
    }

    // Get children data based on role
    let children = []
    if (role === 'Account') {
      // Admin sees all children across all orgs
      const allChildrenKeys = await kv.getByPrefix('child:')
      children = allChildrenKeys.map(child => ({
        ...child,
        lastCheckIn: new Date(Date.now() - Math.random() * 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0]
      }))
    } else {
      // Get children for this organization
      const orgChildrenKeys = await kv.getByPrefix(`child:${orgId}:`)
      children = orgChildrenKeys.map(child => ({
        ...child,
        lastCheckIn: new Date(Date.now() - Math.random() * 7 * 24 * 60 * 60 * 1000).toISOString().split('T')[0]
      }))
    }

    // If no children exist, create some demo data
    if (children.length === 0) {
      const demoChildren = [
        {
          id: `${orgId}:child-1`,
          name: 'Emma Thompson',
          status: 'fine',
          orgId,
          practitionerId: user.id,
          recentCheckIns: [],
          totalCheckIns: 12,
          currentStreak: 3,
          lastCheckIn: '2024-08-22'
        },
        {
          id: `${orgId}:child-2`, 
          name: 'James Wilson',
          status: 'needs_attention',
          orgId,
          practitionerId: user.id,
          recentCheckIns: [],
          totalCheckIns: 8,
          currentStreak: 1,
          lastCheckIn: '2024-08-21'
        },
        {
          id: `${orgId}:child-3`,
          name: 'Sophie Chen',
          status: 'flagged',
          orgId,
          practitionerId: user.id,
          recentCheckIns: [],
          totalCheckIns: 15,
          currentStreak: 0,
          lastCheckIn: '2024-08-20'
        }
      ]

      for (const child of demoChildren) {
        await kv.set(`child:${child.id}`, child)
      }
      children = demoChildren
    }

    return c.json({
      organization,
      children: children.slice(0, 10), // Limit for dashboard
      stats: {
        totalChildren: children.length,
        recentCheckIns: children.filter(c => {
          const lastCheckIn = new Date(c.lastCheckIn || '2024-01-01')
          const today = new Date()
          const diffTime = Math.abs(today.getTime() - lastCheckIn.getTime())
          const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
          return diffDays <= 7
        }).length,
        flaggedChildren: children.filter(c => c.status === 'flagged').length,
        needsAttention: children.filter(c => c.status === 'needs_attention').length
      }
    })
  } catch (error) {
    console.log('Dashboard error:', error)
    return c.json({ error: 'Failed to load dashboard' }, 500)
  }
})

// Get children list
app.get('/server/children', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const orgId = user.user_metadata?.orgId || 'default-org'
    const role = user.user_metadata?.role || 'Practitioner'

    let children = []
    if (role === 'Account') {
      const allChildrenKeys = await kv.getByPrefix('child:')
      children = allChildrenKeys
    } else {
      const orgChildrenKeys = await kv.getByPrefix(`child:${orgId}:`)
      children = orgChildrenKeys
    }
    
    return c.json({ children })
  } catch (error) {
    console.log('Children list error:', error)
    return c.json({ error: 'Failed to get children' }, 500)
  }
})

// Helper function to generate unique credentials
const generateUniqueCredentials = async (childName: string) => {
  const animals = ['bear', 'fox', 'owl', 'cat', 'dog', 'bird', 'fish', 'star']
  
  // Extract first name, fallback to 'child' if empty
  const firstName = childName.trim().split(' ')[0].toLowerCase() || 'child'
  
  let attempts = 0
  const maxAttempts = 50
  
  while (attempts < maxAttempts) {
    const animal = animals[Math.floor(Math.random() * animals.length)]
    const number = Math.floor(Math.random() * 99) + 1
    
    const username = `${firstName}${animal}${number}`
    
    // Check if username is already taken
    const existingUsers = await kv.getByPrefix('childCredentials:')
    const usernameTaken = existingUsers.some(cred => cred.username === username)
    
    if (!usernameTaken) {
      const pin = Math.floor(1000 + Math.random() * 9000).toString()
      return { username, pin }
    }
    
    attempts++
  }
  
  // Fallback to UUID-based username if all attempts failed
  const fallbackUsername = `${firstName}${Math.random().toString(36).substring(2, 6)}`
  const pin = Math.floor(1000 + Math.random() * 9000).toString()
  return { username: fallbackUsername, pin }
}

// Helper function to check username uniqueness
const isUsernameUnique = async (username: string): Promise<boolean> => {
  const existingUsers = await kv.getByPrefix('childCredentials:')
  return !existingUsers.some(cred => cred.username === username)
}

// Add child
app.post('/server/children', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const { name, aboutMe, credentialsMode, credentials, practitionerId } = await c.req.json()
    
    if (!name) {
      return c.json({ error: 'Child name is required' }, 400)
    }

    const orgId = user.user_metadata?.orgId || 'default-org'
    const childId = crypto.randomUUID()
    const fullChildId = `${orgId}:${childId}`
    
    // Handle credentials with uniqueness checking
    let finalCredentials = credentials
    
    if (credentials?.username) {
      // Check if the provided username is unique
      const isUnique = await isUsernameUnique(credentials.username)
      
      if (!isUnique) {
        console.log(`Username '${credentials.username}' already exists, generating new credentials`)
        finalCredentials = await generateUniqueCredentials(name)
      }
    } else {
      // Generate new credentials if none provided
      finalCredentials = await generateUniqueCredentials(name)
    }
    
    // Store credentials separately for uniqueness checking
    await kv.set(`childCredentials:${finalCredentials.username}`, {
      username: finalCredentials.username,
      pin: finalCredentials.pin,
      childId: fullChildId,
      createdAt: new Date().toISOString()
    })
    
    const child = {
      id: fullChildId,
      name,
      aboutMe: aboutMe || { favourites: [], notes: '' },
      credentials: {
        mode: credentialsMode || 'slip',
        username: finalCredentials.username,
        pin: finalCredentials.pin
      },
      status: 'active',
      orgId,
      practitionerId: practitionerId || user.id,
      totalCheckIns: 0,
      currentStreak: 0,
      createdAt: new Date().toISOString()
    }

    await kv.set(`child:${fullChildId}`, child)
    
    return c.json({ 
      child,
      credentials: finalCredentials // Return the final credentials to the client
    })
  } catch (error) {
    console.log('Create child error:', error)
    return c.json({ error: 'Failed to create child' }, 500)
  }
})

// Get archived children - MUST be before /children/:id route
app.get('/server/children/archived', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const orgId = user.user_metadata?.orgId || 'default-org'
    const role = user.user_metadata?.role || 'Practitioner'

    let archivedChildren = []
    if (role === 'Account') {
      // Admin sees all archived children
      const allArchivedKeys = await kv.getByPrefix('archived:child:')
      archivedChildren = allArchivedKeys
    } else {
      // Get all archived children and filter by orgId
      const allArchivedKeys = await kv.getByPrefix('archived:child:')
      archivedChildren = allArchivedKeys.filter(child => 
        child.orgId === orgId || child.id?.startsWith(`${orgId}:`)
      )
    }
    
    // Add practitioner name if missing and format the response
    const enrichedChildren = archivedChildren.map(child => ({
      ...child,
      practitioner: child.practitioner || 'Unknown Practitioner',
      archivedAt: child.archivedAt || new Date().toISOString(),
      archivedBy: child.archivedBy || 'system',
      lastCheckIn: child.lastCheckIn || 'No check-ins'
    }))
    
    return c.json({ archivedChildren: enrichedChildren })
  } catch (error) {
    console.log('Get archived children error:', error)
    return c.json({ error: 'Failed to get archived children' }, 500)
  }
})

// Get child details
app.get('/server/children/:id', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const childId = c.req.param('id')
    const child = await kv.get(`child:${childId}`)
    
    if (!child) {
      return c.json({ error: 'Child not found' }, 404)
    }

    // Get recent check-ins
    const checkIns = await kv.getByPrefix(`checkin:${childId}:`)
    const sortedCheckIns = checkIns
      .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
      .slice(0, 10)

    return c.json({ 
      child: {
        ...child,
        recentCheckIns: sortedCheckIns
      }
    })
  } catch (error) {
    console.log('Get child error:', error)
    return c.json({ error: 'Failed to get child' }, 500)
  }
})

// Update child details
app.put('/server/children/:id', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const childId = c.req.param('id')
    const { name, aboutMe, credentials } = await c.req.json()
    
    if (!name) {
      return c.json({ error: 'Child name is required' }, 400)
    }

    // Get existing child data
    const existingChild = await kv.get(`child:${childId}`)
    
    if (!existingChild) {
      return c.json({ error: 'Child not found' }, 404)
    }

    // Handle credentials update with uniqueness checking if username changed
    let finalCredentials = credentials
    
    if (credentials?.username && credentials.username !== existingChild.credentials?.username) {
      // Check if the new username is unique
      const isUnique = await isUsernameUnique(credentials.username)
      
      if (!isUnique) {
        console.log(`Username '${credentials.username}' already exists, generating new credentials`)
        finalCredentials = await generateUniqueCredentials(name)
      } else {
        // Update the credentials store with new username
        await kv.del(`childCredentials:${existingChild.credentials?.username}`)
        await kv.set(`childCredentials:${credentials.username}`, {
          username: credentials.username,
          pin: credentials.pin,
          childId: childId,
          createdAt: new Date().toISOString()
        })
      }
    }
    
    // Update child data
    const updatedChild = {
      ...existingChild,
      name,
      aboutMe: aboutMe || { favourites: [], notes: '' },
      credentials: {
        mode: existingChild.credentials?.mode || 'slip',
        username: finalCredentials.username,
        pin: finalCredentials.pin
      },
      updatedAt: new Date().toISOString()
    }

    await kv.set(`child:${childId}`, updatedChild)
    
    return c.json({ 
      child: updatedChild,
      credentials: finalCredentials
    })
  } catch (error) {
    console.log('Update child error:', error)
    return c.json({ error: 'Failed to update child' }, 500)
  }
})

// Bulk archive children - MUST be before /children/:id route
app.post('/server/children/bulk-archive', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const { childrenIds } = await c.req.json()
    
    if (!childrenIds || !Array.isArray(childrenIds) || childrenIds.length === 0) {
      return c.json({ error: 'Children IDs array is required' }, 400)
    }

    const archivedChildren = []
    
    for (const childId of childrenIds) {
      const child = await kv.get(`child:${childId}`)
      
      if (child) {
        // Archive the child by updating status and storing in archived collection
        const archivedChild = {
          ...child,
          status: 'archived',
          archivedAt: new Date().toISOString(),
          archivedBy: user.id
        }
        
        // Store in archived collection
        await kv.set(`archived:child:${childId}`, archivedChild)
        
        // Remove from active children
        await kv.del(`child:${childId}`)
        
        archivedChildren.push(archivedChild)
      }
    }
    
    return c.json({ 
      success: true,
      archivedCount: archivedChildren.length,
      archivedChildren
    })
  } catch (error) {
    console.log('Bulk archive error:', error)
    return c.json({ error: 'Failed to archive children' }, 500)
  }
})

// Bulk reassign children - MUST be before /children/:id route
app.post('/server/children/bulk-reassign', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const { childrenIds, newPractitionerId } = await c.req.json()
    
    if (!childrenIds || !Array.isArray(childrenIds) || childrenIds.length === 0) {
      return c.json({ error: 'Children IDs array is required' }, 400)
    }
    
    if (!newPractitionerId) {
      return c.json({ error: 'New practitioner ID is required' }, 400)
    }

    const reassignedChildren = []
    
    for (const childId of childrenIds) {
      const child = await kv.get(`child:${childId}`)
      
      if (child) {
        // Update practitioner assignment
        const updatedChild = {
          ...child,
          practitionerId: newPractitionerId,
          reassignedAt: new Date().toISOString(),
          reassignedBy: user.id
        }
        
        await kv.set(`child:${childId}`, updatedChild)
        reassignedChildren.push(updatedChild)
      }
    }
    
    return c.json({ 
      success: true,
      reassignedCount: reassignedChildren.length,
      reassignedChildren
    })
  } catch (error) {
    console.log('Bulk reassign error:', error)
    return c.json({ error: 'Failed to reassign children' }, 500)
  }
})

// Generate credentials endpoint - MUST be before /children/:id route
app.post('/server/children/generate-credentials', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const { childName } = await c.req.json()
    
    const credentials = await generateUniqueCredentials(childName || 'child')
    
    return c.json({ credentials })
  } catch (error) {
    console.log('Generate credentials error:', error)
    return c.json({ error: 'Failed to generate credentials' }, 500)
  }
})

// Restore archived child - MUST be before /children/:id route
app.post('/server/children/restore/:id', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const childId = c.req.param('id')
    const archivedChild = await kv.get(`archived:child:${childId}`)
    
    if (!archivedChild) {
      return c.json({ error: 'Archived child not found' }, 404)
    }

    // Restore the child by removing archived fields and moving back to active
    const restoredChild = {
      ...archivedChild,
      status: 'active',
      restoredAt: new Date().toISOString(),
      restoredBy: user.id
    }
    
    // Remove archived-specific fields
    delete restoredChild.archivedAt
    delete restoredChild.archivedBy
    
    // Store back in active children
    await kv.set(`child:${childId}`, restoredChild)
    
    // Remove from archived collection
    await kv.del(`archived:child:${childId}`)
    
    return c.json({ 
      success: true,
      child: restoredChild
    })
  } catch (error) {
    console.log('Restore child error:', error)
    return c.json({ error: 'Failed to restore child' }, 500)
  }
})

// Save wellbeing wheel data
app.post('/server/wellbeing', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const { wellbeingScores } = await c.req.json()
    
    if (!wellbeingScores || typeof wellbeingScores !== 'object') {
      return c.json({ error: 'Missing wellbeing scores data' }, 400)
    }

    // For child users, use their own ID. For practitioners/others, allow demo functionality
    let childId
    if (user.user_metadata?.role === 'Child') {
      childId = user.id
    } else {
      // For demo purposes, allow practitioners to save wellbeing data for demo child
      childId = `demo-child-${user.id}`
      console.log('Using demo child ID for non-child user:', childId)
    }
    
    if (!childId) {
      return c.json({ error: 'Child ID not found' }, 400)
    }

    const wellbeingId = crypto.randomUUID()
    const wellbeingEntry = {
      id: wellbeingId,
      childId,
      scores: wellbeingScores,
      createdAt: new Date().toISOString(),
      date: new Date().toISOString().split('T')[0]
    }

    await kv.set(`wellbeing:${childId}:${wellbeingId}`, wellbeingEntry)

    // Update child stats and status
    let child = await kv.get(`child:${childId}`)
    
    // If child record doesn't exist (demo scenario), create a basic one
    if (!child && childId.startsWith('demo-child-')) {
      child = {
        id: childId,
        name: 'Demo Child',
        totalCheckIns: 0,
        currentStreak: 0,
        status: 'fine',
        createdAt: new Date().toISOString()
      }
    }
    
    if (child) {
      child.totalCheckIns = (child.totalCheckIns || 0) + 1
      child.lastCheckIn = new Date().toISOString().split('T')[0]
      
      // Calculate status based on wellbeing scores
      const scores = Object.values(wellbeingScores)
      const avgScore = scores.reduce((a, b) => a + b, 0) / scores.length
      
      if (avgScore <= 2) {
        child.status = 'flagged'
      } else if (avgScore <= 3) {
        child.status = 'needs_attention' 
      } else {
        child.status = 'fine'
      }

      // Update current streak
      const today = new Date().toISOString().split('T')[0]
      const yesterday = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString().split('T')[0]
      
      if (child.lastCheckIn === yesterday) {
        child.currentStreak = (child.currentStreak || 0) + 1
      } else if (child.lastCheckIn !== today) {
        child.currentStreak = 1
      }

      await kv.set(`child:${childId}`, child)
    }
    
    return c.json({ 
      success: true,
      wellbeingEntry,
      message: 'Wellbeing data saved successfully'
    })
  } catch (error) {
    console.log('Save wellbeing error:', error)
    return c.json({ error: 'Failed to save wellbeing data' }, 500)
  }
})

// Create check-in (legacy - kept for backwards compatibility)
app.post('/server/checkins', async (c) => {
  try {
    const { childId, wheel, garden, wrapUpMood } = await c.req.json()
    
    if (!childId || !wheel) {
      return c.json({ error: 'Missing required check-in data' }, 400)
    }
    
    const stickers = ['star', 'heart', 'smile', 'rainbow', 'flower', 'sun', 'butterfly', 'tree', 'cloud', 'diamond']
    const stickerAwarded = stickers[Math.floor(Math.random() * stickers.length)]
    
    const checkInId = crypto.randomUUID()
    const checkIn = {
      id: checkInId,
      childId,
      createdAt: new Date().toISOString(),
      wheel,
      garden: garden || {},
      wrapUpMood: wrapUpMood || 3,
      stickerAwarded
    }

    await kv.set(`checkin:${childId}:${checkInId}`, checkIn)

    // Update child stats
    const child = await kv.get(`child:${childId}`)
    if (child) {
      child.totalCheckIns = (child.totalCheckIns || 0) + 1
      child.lastCheckIn = new Date().toISOString().split('T')[0]
      
      // Calculate status based on wheel responses
      const scores = Object.values(wheel)
      const avgScore = scores.reduce((a, b) => a + b, 0) / scores.length
      
      if (avgScore <= 2) {
        child.status = 'flagged'
      } else if (avgScore <= 3) {
        child.status = 'needs_attention'
      } else {
        child.status = 'fine'
      }

      await kv.set(`child:${childId}`, child)
    }
    
    return c.json({ checkIn })
  } catch (error) {
    console.log('Create check-in error:', error)
    return c.json({ error: 'Failed to create check-in' }, 500)
  }
})

// Get wellbeing data for a child
app.get('/server/wellbeing/:childId', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user) {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const childId = c.req.param('childId')
    const wellbeingEntries = await kv.getByPrefix(`wellbeing:${childId}:`)
    
    const sortedEntries = wellbeingEntries.sort((a, b) => 
      new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()
    )
    
    return c.json({ wellbeingData: sortedEntries })
  } catch (error) {
    console.log('Get wellbeing data error:', error)
    return c.json({ error: 'Failed to get wellbeing data' }, 500)
  }
})

// Get check-ins for a child (legacy - kept for backwards compatibility)
app.get('/server/checkins/:childId', async (c) => {
  try {
    const childId = c.req.param('childId')
    const checkIns = await kv.getByPrefix(`checkin:${childId}:`)
    
    const sortedCheckIns = checkIns.sort((a, b) => 
      new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()
    )
    
    return c.json({ checkIns: sortedCheckIns })
  } catch (error) {
    console.log('Get check-ins error:', error)
    return c.json({ error: 'Failed to get check-ins' }, 500)
  }
})

// Admin routes
app.get('/server/admin/stats', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user || user.user_metadata?.role !== 'Account') {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const allOrgs = await kv.getByPrefix('org:')
    const allChildren = await kv.getByPrefix('child:')
    const allCheckIns = await kv.getByPrefix('checkin:')

    const stats = {
      totalOrganizations: allOrgs.length,
      totalChildren: allChildren.length,
      totalCheckIns: allCheckIns.length,
      activeOrganizations: allOrgs.filter(org => org.status === 'active').length,
      totalSeats: allOrgs.reduce((sum, org) => sum + org.seatsTotal, 0),
      usedSeats: allOrgs.reduce((sum, org) => sum + (org.seatsUsed || 0), 0),
      recentActivity: allCheckIns.filter(checkIn => {
        const checkInDate = new Date(checkIn.createdAt)
        const weekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000)
        return checkInDate > weekAgo
      }).length
    }

    return c.json({ stats, organizations: allOrgs })
  } catch (error) {
    console.log('Admin stats error:', error)
    return c.json({ error: 'Failed to get admin stats' }, 500)
  }
})









// Create organization
app.post('/server/admin/organizations', async (c) => {
  try {
    const accessToken = c.req.header('Authorization')?.split(' ')[1]
    const user = await getUserFromToken(accessToken)
    
    if (!user || user.user_metadata?.role !== 'Account') {
      return c.json({ error: 'Unauthorized' }, 401)
    }

    const { name, contactEmail, seatsTotal, contractEnd } = await c.req.json()
    
    if (!name || !contactEmail || !seatsTotal) {
      return c.json({ error: 'Missing required fields' }, 400)
    }

    const orgId = `org-${Math.random().toString(36).substring(2, 10)}`
    const organization = {
      id: orgId,
      name,
      contactEmail,
      seatsTotal: parseInt(seatsTotal),
      seatsUsed: 0,
      contractStart: new Date().toISOString().split('T')[0],
      contractEnd: contractEnd || new Date(Date.now() + 365 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
      status: 'active',
      createdAt: new Date().toISOString()
    }

    await kv.set(`org:${orgId}`, organization)
    
    return c.json({ organization })
  } catch (error) {
    console.log('Create organization error:', error)
    return c.json({ error: 'Failed to create organization' }, 500)
  }
})

// Simple working test user creation
app.post('/server/auth/setup-test-users', async (c) => {
  try {
    console.log('Setting up clean test users...')
    
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    )

    // Define simple working test users
    const testUsers = [
      { email: 'admin@test.com', password: 'test123', role: 'admin' },
      { email: 'practitioner@test.com', password: 'test123', role: 'practitioner' }
    ]

    const results = []
    
    for (const user of testUsers) {
      try {
        // Delete existing user if exists
        const { data: existingUsers } = await supabaseAdmin.auth.admin.listUsers()
        const existing = existingUsers?.users?.find(u => u.email === user.email)
        if (existing) {
          await supabaseAdmin.auth.admin.deleteUser(existing.id)
          console.log(`Deleted existing user: ${user.email}`)
        }
        
        // Create fresh confirmed user
        const { data, error } = await supabaseAdmin.auth.admin.createUser({
          email: user.email,
          password: user.password,
          email_confirm: true,
          user_metadata: { role: user.role }
        })
        
        if (error) {
          console.log(`Error creating ${user.email}:`, error.message)
          results.push({ email: user.email, success: false, error: error.message })
        } else {
          console.log(`Successfully created user: ${user.email}`)
          results.push({ email: user.email, success: true })
        }
      } catch (e) {
        console.log(`Exception with ${user.email}:`, e)
        results.push({ email: user.email, success: false, error: e.message })
      }
    }

    return c.json({
      success: true,
      message: 'Clean test users created successfully',
      credentials: testUsers,
      results
    })
    
  } catch (error) {
    console.log('Setup users error:', error)
    return c.json({ success: false, error: error.message }, 500)
  }
})

// Mount admin routes
app.route('/server/admin', adminRoutes)

// Mount auth routes
app.route('/server/auth', authRoutes)

Deno.serve(app.fetch)