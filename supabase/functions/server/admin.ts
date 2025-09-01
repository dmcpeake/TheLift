import { Hono } from 'https://deno.land/x/hono@v3.12.6/mod.ts'
import { kvStore } from './kv_store.ts'

const admin = new Hono()

admin.get('/clients', async (c) => {
  try {
    const clients = await kvStore.list('client:')
    return c.json({
      success: true,
      clients: clients.map(item => item.value)
    })
  } catch (error) {
    console.error('Error fetching clients:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

admin.post('/clients', async (c) => {
  try {
    const clientData = await c.req.json()
    const clientId = `client-${Date.now()}`
    
    const client = {
      id: clientId,
      name: clientData.name,
      type: clientData.type,
      email: clientData.email,
      status: 'active',
      subscription_plan: clientData.subscription_plan || 'essential',
      max_children: clientData.max_children || 50,
      max_practitioners: clientData.max_practitioners || 5,
      created_at: new Date().toISOString()
    }
    
    await kvStore.set(`client:${clientId}`, client)
    
    return c.json({
      success: true,
      client: client
    })
  } catch (error) {
    console.error('Error creating client:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

admin.get('/clients/:id', async (c) => {
  try {
    const clientId = c.req.param('id')
    const client = await kvStore.get(`client:${clientId}`)
    
    if (!client) {
      return c.json({ 
        success: false,
        error: 'Client not found' 
      }, 404)
    }
    
    return c.json({
      success: true,
      client: client
    })
  } catch (error) {
    console.error('Error fetching client:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

export { admin as adminRoutes }