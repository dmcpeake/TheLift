import { getSupabaseClient } from '../supabase/client'

const supabase = getSupabaseClient()

// Helper to get org_id for a child
export async function getChildOrgId(childId: string): Promise<string | null> {
  try {
    const { data, error } = await supabase
      .from('profiles')
      .select('org_id')
      .eq('id', childId)
      .single()

    if (error) {
      console.error('Error fetching child org_id:', error)
      return null
    }

    return data?.org_id || null
  } catch (err) {
    console.error('Error in getChildOrgId:', err)
    return null
  }
}

// Helper to get or create a session
export async function getOrCreateSession(childId: string, orgId: string): Promise<string | null> {
  try {
    // First check for an active session
    const { data: existingSession } = await supabase
      .from('checkin_sessions')
      .select('id')
      .eq('child_id', childId)
      .eq('status', 'in_progress')
      .order('created_at', { ascending: false })
      .limit(1)
      .single()

    if (existingSession) {
      return existingSession.id
    }

    // Create a new session
    const { data: newSession, error } = await supabase
      .from('checkin_sessions')
      .insert({
        child_id: childId,
        org_id: orgId,
        status: 'in_progress',
        tools_completed: []
      })
      .select('id')
      .single()

    if (error) {
      console.error('Error creating session:', error)
      return null
    }

    return newSession?.id || null
  } catch (err) {
    console.error('Error in getOrCreateSession:', err)
    return null
  }
}

// For testing - use a default test org
export const TEST_ORG_ID = 'test-org-001'

// Helper to ensure we have org_id and session_id
export async function ensureSessionContext(
  childId: string,
  sessionId?: string | null,
  orgId?: string | null
): Promise<{ sessionId: string; orgId: string } | null> {
  try {
    // Get org_id if not provided
    let finalOrgId = orgId
    if (!finalOrgId) {
      finalOrgId = await getChildOrgId(childId)
      if (!finalOrgId) {
        // For testing, use a default org
        console.warn('No org_id found for child, using test org')
        finalOrgId = TEST_ORG_ID
      }
    }

    // Get or create session if not provided
    let finalSessionId = sessionId
    if (!finalSessionId) {
      finalSessionId = await getOrCreateSession(childId, finalOrgId)
      if (!finalSessionId) {
        console.error('Failed to get or create session')
        return null
      }
    }

    return {
      sessionId: finalSessionId,
      orgId: finalOrgId
    }
  } catch (err) {
    console.error('Error in ensureSessionContext:', err)
    return null
  }
}