import { createClient } from '@supabase/supabase-js'
import { supabaseUrl, publicAnonKey } from './info'

export function getSupabaseClient() {
  return createClient(supabaseUrl, publicAnonKey)
}