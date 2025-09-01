const kv = await Deno.openKv()

export interface KVStore {
  get<T>(key: string): Promise<T | null>
  set<T>(key: string, value: T): Promise<void>
  delete(key: string): Promise<void>
  list(prefix: string): Promise<Array<{ key: string; value: any }>>
}

export const kvStore: KVStore = {
  async get<T>(key: string): Promise<T | null> {
    const result = await kv.get([key])
    return result.value as T | null
  },

  async set<T>(key: string, value: T): Promise<void> {
    await kv.set([key], value)
  },

  async delete(key: string): Promise<void> {
    await kv.delete([key])
  },

  async list(prefix: string): Promise<Array<{ key: string; value: any }>> {
    const results = []
    for await (const entry of kv.list({ prefix: [prefix] })) {
      results.push({
        key: entry.key.join('/'),
        value: entry.value
      })
    }
    return results
  }
}