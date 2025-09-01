import { Hono } from 'npm:hono'
import { cors } from 'npm:hono/cors'
import { createClient } from 'npm:@supabase/supabase-js@2'
import * as kv from './kv_store.tsx'

const app = new Hono()

// Enable CORS for all routes
app.use('*', cors({
  origin: '*',
  allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowHeaders: ['Content-Type', 'Authorization'],
}))

// Admin authentication middleware
const requireAdminAuth = async (c, next) => {
  const accessToken = c.req.header('Authorization')?.split(' ')[1]
  if (!accessToken) {
    return c.json({ error: 'Authorization token required' }, 401)
  }

  const supabase = createClient(
    Deno.env.get('SUPABASE_URL')!,
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  )

  const { data: { user }, error } = await supabase.auth.getUser(accessToken)
  if (error || !user) {
    return c.json({ error: 'Invalid authorization token' }, 401)
  }

  // Check if user has admin role
  const profileData = await kv.get(`profile:${user.id}`)
  if (!profileData || (profileData.role !== 'Account' && profileData.role !== 'LiftStaff')) {
    return c.json({ error: 'Admin access required' }, 403)
  }

  c.set('user', user)
  c.set('profile', profileData)
  await next()
}

// Update client email endpoint
app.put('/clients/:id/email', requireAdminAuth, async (c) => {
  try {
    const clientId = c.req.param('id')
    const { newEmail, reason } = await c.req.json()

    if (!newEmail || !newEmail.includes('@')) {
      return c.json({ error: 'Valid email address is required' }, 400)
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    )

    // Get current client data
    const clientData = await kv.get(`client:${clientId}`)
    if (!clientData) {
      return c.json({ error: 'Client not found' }, 404)
    }

    const oldEmail = clientData.contactEmail

    // Find the user account by email
    const { data: users, error: searchError } = await supabase.auth.admin.listUsers()
    if (searchError) {
      console.error('Error searching for user:', searchError)
      return c.json({ error: 'Failed to find user account' }, 500)
    }

    const userAccount = users.users.find(user => user.email === oldEmail)
    
    if (userAccount) {
      // Update user email in Supabase Auth
      const { data: updatedUser, error: updateError } = await supabase.auth.admin.updateUserById(
        userAccount.id,
        { 
          email: newEmail,
          email_confirm: false // Require email verification
        }
      )

      if (updateError) {
        console.error('Error updating user email:', updateError)
        return c.json({ error: 'Failed to update user account email' }, 500)
      }

      // Log the email change
      const changeLog = {
        timestamp: new Date().toISOString(),
        adminUserId: c.get('user').id,
        adminEmail: c.get('user').email,
        clientId,
        oldEmail,
        newEmail,
        reason: reason || 'Administrative update',
        userAccountId: userAccount.id
      }

      await kv.set(`email_change_log:${clientId}:${Date.now()}`, changeLog)
    }

    // Update client data
    const updatedClientData = {
      ...clientData,
      contactEmail: newEmail,
      lastModified: new Date().toISOString(),
      lastModifiedBy: c.get('user').id
    }

    await kv.set(`client:${clientId}`, updatedClientData)

    // Create notification records
    const notifications = [
      {
        id: `notif_${Date.now()}_old`,
        type: 'email_changed_old',
        recipient: oldEmail,
        subject: 'Your account email has been updated',
        message: `Your account email has been changed from ${oldEmail} to ${newEmail}. If you did not request this change, please contact support immediately.`,
        clientId,
        timestamp: new Date().toISOString(),
        sent: false
      },
      {
        id: `notif_${Date.now()}_new`,
        type: 'email_changed_new',
        recipient: newEmail,
        subject: 'Email verification required',
        message: `Your account email has been updated to this address. Please check your email and click the verification link to confirm your new email address.`,
        clientId,
        timestamp: new Date().toISOString(),
        sent: false
      }
    ]

    for (const notification of notifications) {
      await kv.set(`notification:${notification.id}`, notification)
    }

    return c.json({ 
      success: true, 
      message: 'Email updated successfully',
      oldEmail,
      newEmail,
      requiresVerification: !!userAccount,
      notificationsSent: notifications.length
    })

  } catch (error) {
    console.error('Error updating client email:', error)
    return c.json({ error: 'Internal server error' }, 500)
  }
})

// Get email change history for a client
app.get('/clients/:id/email-history', requireAdminAuth, async (c) => {
  try {
    const clientId = c.req.param('id')
    
    // Get all email change logs for this client
    const logs = await kv.getByPrefix(`email_change_log:${clientId}:`)
    
    // Sort by timestamp (newest first)
    const sortedLogs = logs.sort((a, b) => 
      new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime()
    )

    return c.json({ 
      success: true, 
      history: sortedLogs 
    })

  } catch (error) {
    console.error('Error fetching email history:', error)
    return c.json({ error: 'Internal server error' }, 500)
  }
})

export default app