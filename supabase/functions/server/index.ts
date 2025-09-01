import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { Hono } from 'https://deno.land/x/hono@v3.12.6/mod.ts'
import { cors } from 'https://deno.land/x/hono@v3.12.6/middleware.ts'
import { authRoutes } from './auth.ts'
import { adminRoutes } from './admin.ts'
import { userRoutes } from './users.ts'
import { childrenRoutes } from './children.ts'
import { setupRoutes } from './setup.ts'

const app = new Hono()

app.use('*', cors({
  origin: '*',
  allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowHeaders: ['Content-Type', 'Authorization'],
}))

app.get('/make-server-a1855b25/health', (c) => {
  return c.json({ status: 'ok', timestamp: new Date().toISOString() })
})

app.route('/make-server-a1855b25/auth', authRoutes)
app.route('/make-server-a1855b25/admin', adminRoutes)
app.route('/make-server-a1855b25/users', userRoutes)
app.route('/make-server-a1855b25/children', childrenRoutes)
app.route('/make-server-a1855b25/setup', setupRoutes)

serve(app.fetch)