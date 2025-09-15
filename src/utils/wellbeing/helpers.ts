import { getSupabaseClient } from '../supabase/client'

const supabase = getSupabaseClient()

// Simple UUID v4 generator for test data
function generateUUID(): string {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    const r = Math.random() * 16 | 0
    const v = c === 'x' ? r : (r & 0x3 | 0x8)
    return v.toString(16)
  })
}

// For testing - use a default test org (must be a valid UUID)
export const TEST_ORG_ID = '00000000-0000-0000-0000-000000000001'

// Helper to get org_id for a child
export async function getChildOrgId(childId: string): Promise<string | null> {
  console.log('[getChildOrgId] Starting for childId:', childId)

  try {
    // First try to get existing profile
    console.log('[getChildOrgId] Checking for existing profile...')
    const { data: existingProfile, error: profileError } = await supabase
      .from('profiles')
      .select('org_id')
      .eq('id', childId)
      .single()

    console.log('[getChildOrgId] Profile query result:', { existingProfile, profileError })

    if (existingProfile?.org_id) {
      console.log('[getChildOrgId] Found existing profile with org_id:', existingProfile.org_id)
      return existingProfile.org_id
    }

    // If no profile exists, create test org and profile
    console.log('[getChildOrgId] No profile found, creating test data...')

    // Create test org if it doesn't exist
    console.log('[getChildOrgId] Creating/updating test org...')
    const { data: orgData, error: orgError } = await supabase
      .from('organisations')
      .upsert({
        id: TEST_ORG_ID,
        name: 'Test Organization',
        type: 'other',
        status: 'active'
      })
      .select()

    console.log('[getChildOrgId] Org upsert result:', { orgData, orgError })

    if (orgError) {
      console.error('[getChildOrgId] Failed to create test org:', orgError)
      // Continue anyway - maybe the org exists but we can't read it
    }

    // Create test profile
    console.log('[getChildOrgId] Creating test profile...')
    const { data: profileData, error: createProfileError } = await supabase
      .from('profiles')
      .upsert({
        id: childId,
        email: `test-${childId.slice(0, 8)}@test.com`,
        name: `Test Child ${childId.slice(0, 8)}`,
        role: 'Child',
        org_id: TEST_ORG_ID,
        status: 'active'
      })
      .select()

    console.log('[getChildOrgId] Profile creation result:', { profileData, createProfileError })

    if (createProfileError) {
      console.error('[getChildOrgId] Failed to create test profile:', createProfileError)
      // Still return the test org ID as we'll try to use it anyway
    }

    return TEST_ORG_ID
  } catch (err) {
    console.error('Error in getChildOrgId:', err)
    return null
  }
}

// Helper to get or create a session
export async function getOrCreateSession(childId: string, orgId: string): Promise<string | null> {
  console.log('[getOrCreateSession] Starting with childId:', childId, 'orgId:', orgId)

  try {
    // First check for an active session
    console.log('[getOrCreateSession] Checking for existing session...')
    const { data: existingSession, error: sessionError } = await supabase
      .from('checkin_sessions')
      .select('id')
      .eq('child_id', childId)
      .eq('status', 'in_progress')
      .order('created_at', { ascending: false })
      .limit(1)
      .single()

    console.log('[getOrCreateSession] Existing session query result:', { existingSession, sessionError })

    if (existingSession) {
      console.log('[getOrCreateSession] Found existing session:', existingSession.id)
      return existingSession.id
    }

    // Create a new session
    console.log('[getOrCreateSession] Creating new session...')
    const insertData = {
      child_id: childId,
      org_id: orgId,
      status: 'in_progress',
      tools_completed: []
    }
    console.log('[getOrCreateSession] Insert data:', insertData)

    const { data: newSession, error } = await supabase
      .from('checkin_sessions')
      .insert(insertData)
      .select('id')
      .single()

    console.log('[getOrCreateSession] Session creation result:', { newSession, error })

    if (error) {
      console.error('[getOrCreateSession] Error creating session - Full error details:', {
        error,
        message: error.message,
        details: error.details,
        hint: error.hint,
        code: error.code
      })
      return null
    }

    console.log('[getOrCreateSession] Successfully created session:', newSession?.id)
    return newSession?.id || null
  } catch (err) {
    console.error('Error in getOrCreateSession:', err)
    return null
  }
}

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