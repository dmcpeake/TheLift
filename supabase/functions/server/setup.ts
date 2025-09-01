import { Hono } from 'https://deno.land/x/hono@v3.12.6/mod.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const setup = new Hono()

setup.post('/create-kv-table', async (c) => {
  try {
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
    )

    // Create kv_store table
    const { error: tableError } = await supabase.rpc('exec_sql', {
      query: `
        CREATE TABLE IF NOT EXISTS public.kv_store (
          key text PRIMARY KEY,
          value text NOT NULL,
          created_at timestamptz DEFAULT now(),
          updated_at timestamptz DEFAULT now()
        );
        
        ALTER TABLE public.kv_store ENABLE ROW LEVEL SECURITY;
        
        CREATE POLICY IF NOT EXISTS "Service role can manage kv_store" ON public.kv_store
        FOR ALL USING (auth.jwt() ->> 'role' = 'service_role');
      `
    })

    if (tableError) {
      console.error('Error creating kv_store table:', tableError)
      return c.json({ 
        success: false, 
        error: tableError.message 
      }, 500)
    }

    return c.json({ 
      success: true,
      message: 'KV store table created successfully'
    })
  } catch (error) {
    console.error('Error in create-kv-table:', error)
    return c.json({ 
      success: false,
      error: error.message 
    }, 500)
  }
})

export { setup as setupRoutes }