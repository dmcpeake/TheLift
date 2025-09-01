import { Hono } from 'https://deno.land/x/hono@v3.12.6/mod.ts'
import { kvStore } from './kv_store.ts'

const children = new Hono()

children.get('/list', async (c) => {
  try {
    const children = await kvStore.list('child:')
    return c.json({
      success: true,
      children: children.map(item => ({
        id: item.value.id,
        username: item.value.username,
        first_name: item.value.first_name,
        age: item.value.age,
        practitioner_id: item.value.practitioner_id
      }))
    })
  } catch (error) {
    console.error('Error fetching children:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

children.post('/create', async (c) => {
  try {
    const childData = await c.req.json()
    const childId = `child-${Date.now()}`
    
    const child = {
      id: childId,
      username: childData.username,
      pin: childData.pin,
      first_name: childData.first_name,
      age: childData.age,
      practitioner_id: childData.practitioner_id,
      created_at: new Date().toISOString()
    }
    
    await kvStore.set(`child:${childData.username}`, child)
    
    return c.json({
      success: true,
      child: child
    })
  } catch (error) {
    console.error('Error creating child:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

export { children as childrenRoutes }