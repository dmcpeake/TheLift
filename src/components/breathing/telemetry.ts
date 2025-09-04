import { TelemetryEvent } from './types'

// Queue for offline telemetry
let telemetryQueue: TelemetryEvent[] = []
let isOnline = typeof window !== 'undefined' ? navigator.onLine : true

// Listen for online/offline events
if (typeof window !== 'undefined') {
  window.addEventListener('online', () => {
    isOnline = true
    flushTelemetryQueue()
  })
  
  window.addEventListener('offline', () => {
    isOnline = false
  })
}

// Store telemetry in IndexedDB for offline support
async function storeTelemetryOffline(event: TelemetryEvent) {
  if (!('indexedDB' in window)) {
    telemetryQueue.push(event)
    return
  }

  try {
    const dbRequest = indexedDB.open('LiftTelemetry', 1)
    
    dbRequest.onsuccess = () => {
      const db = dbRequest.result
      const transaction = db.transaction(['telemetry'], 'readwrite')
      const store = transaction.objectStore('telemetry')
      store.add(event)
    }
    
    dbRequest.onupgradeneeded = () => {
      const db = dbRequest.result
      if (!db.objectStoreNames.contains('telemetry')) {
        db.createObjectStore('telemetry', { autoIncrement: true })
      }
    }
  } catch (e) {
    console.warn('Failed to store telemetry offline:', e)
    telemetryQueue.push(event)
  }
}

// Send telemetry event
export async function sendTelemetry(event: Partial<TelemetryEvent>) {
  const fullEvent: TelemetryEvent = {
    sessionId: event.sessionId || crypto.randomUUID(),
    event: event.event || 'breathing_started',
    ts: event.ts || new Date().toISOString(),
    ua: typeof window !== 'undefined' ? window.navigator.userAgent : undefined,
    ...event
  }

  if (!isOnline) {
    await storeTelemetryOffline(fullEvent)
    return
  }

  try {
    // For now, just log to console in development
    if (process.env.NODE_ENV === 'development') {
      console.log('[Telemetry]', fullEvent)
      return
    }

    // In production, send to telemetry endpoint
    const response = await fetch('/api/telemetry/breathing', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(fullEvent)
    })

    if (!response.ok) {
      throw new Error(`Telemetry failed: ${response.status}`)
    }
  } catch (e) {
    console.warn('Failed to send telemetry:', e)
    await storeTelemetryOffline(fullEvent)
  }
}

// Flush queued telemetry when online
async function flushTelemetryQueue() {
  if (!isOnline || telemetryQueue.length === 0) return

  const events = [...telemetryQueue]
  telemetryQueue = []

  for (const event of events) {
    await sendTelemetry(event)
  }

  // Also flush IndexedDB queue
  if ('indexedDB' in window) {
    try {
      const dbRequest = indexedDB.open('LiftTelemetry', 1)
      
      dbRequest.onsuccess = () => {
        const db = dbRequest.result
        const transaction = db.transaction(['telemetry'], 'readwrite')
        const store = transaction.objectStore('telemetry')
        
        const getAllRequest = store.getAll()
        getAllRequest.onsuccess = async () => {
          const storedEvents = getAllRequest.result
          
          for (const event of storedEvents) {
            await sendTelemetry(event)
          }
          
          // Clear the store after sending
          store.clear()
        }
      }
    } catch (e) {
      console.warn('Failed to flush offline telemetry:', e)
    }
  }
}