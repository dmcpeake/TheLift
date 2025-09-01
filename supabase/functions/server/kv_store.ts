import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const supabase = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SERVICE_ROLE_KEY') ?? '',
)

export interface KVStore {
  get<T>(key: string): Promise<T | null>
  set<T>(key: string, value: T): Promise<void>
  delete(key: string): Promise<void>
  list(prefix: string): Promise<Array<{ key: string; value: any }>>
}

export const kvStore: KVStore = {
  async get<T>(key: string): Promise<T | null> {
    const { data, error } = await supabase
      .from('kv_store')
      .select('value')
      .eq('key', key)
      .single()
    
    if (error || !data) return null
    return JSON.parse(data.value) as T
  },

  async set<T>(key: string, value: T): Promise<void> {
    const { error } = await supabase
      .from('kv_store')
      .upsert({ key, value: JSON.stringify(value) })
    
    if (error) throw error
  },

  async delete(key: string): Promise<void> {
    const { error } = await supabase
      .from('kv_store')
      .delete()
      .eq('key', key)
    
    if (error) throw error
  },

  async list(prefix: string): Promise<Array<{ key: string; value: any }>> {
    const { data, error } = await supabase
      .from('kv_store')
      .select('*')
      .like('key', `${prefix}%`)
    
    if (error) throw error
    
    return (data || []).map(item => ({
      key: item.key,
      value: JSON.parse(item.value)
    }))
  }
}