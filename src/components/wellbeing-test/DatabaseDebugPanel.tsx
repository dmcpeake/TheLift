import React, { useState } from 'react'
import { getSupabaseClient } from '../../utils/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Button } from '../ui/button'
import { Alert, AlertDescription } from '../ui/alert'
import { Badge } from '../ui/badge'
import { Database, CheckCircle2, XCircle, AlertCircle } from 'lucide-react'

const supabase = getSupabaseClient()

export function DatabaseDebugPanel() {
  const [results, setResults] = useState<any>({})
  const [loading, setLoading] = useState(false)

  const runDatabaseTests = async () => {
    setLoading(true)
    const testResults: any = {}

    try {
      // Test 1: Check if we can query organisations table
      console.log('Testing organisations table...')
      const { data: orgData, error: orgError } = await supabase
        .from('organisations')
        .select('id')
        .limit(1)

      testResults.organisations = {
        success: !orgError,
        error: orgError,
        data: orgData
      }

      // Test 2: Check if we can query profiles table
      console.log('Testing profiles table...')
      const { data: profileData, error: profileError } = await supabase
        .from('profiles')
        .select('id')
        .limit(1)

      testResults.profiles = {
        success: !profileError,
        error: profileError,
        data: profileData
      }

      // Test 3: Check if we can query checkin_sessions table
      console.log('Testing checkin_sessions table...')
      const { data: sessionData, error: sessionError } = await supabase
        .from('checkin_sessions')
        .select('id')
        .limit(1)

      testResults.checkin_sessions = {
        success: !sessionError,
        error: sessionError,
        data: sessionData
      }

      // Test 4: Check if we can query mood_meter_usage table
      console.log('Testing mood_meter_usage table...')
      const { data: moodData, error: moodError } = await supabase
        .from('mood_meter_usage')
        .select('id')
        .limit(1)

      testResults.mood_meter_usage = {
        success: !moodError,
        error: moodError,
        data: moodData
      }

      // Test 5: Try to create test org (may fail due to RLS)
      console.log('Testing org creation...')
      try {
        // Generate a valid UUID for test org
        const testOrgId = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
          const r = Math.random() * 16 | 0
          const v = c === 'x' ? r : (r & 0x3 | 0x8)
          return v.toString(16)
        })

        const { data: createOrgData, error: createOrgError } = await supabase
          .from('organisations')
          .upsert({
            id: testOrgId,
            name: 'Debug Test Org',
            type: 'other',
            status: 'active'
          })
          .select()

        testResults.createOrg = {
          success: !createOrgError,
          error: createOrgError || (createOrgData ? null : 'No data returned - may be due to RLS policies'),
          data: createOrgData
        }
      } catch (orgError) {
        testResults.createOrg = {
          success: false,
          error: 'Organization creation failed - likely due to RLS policies',
          data: null
        }
      }

      // Test 6: Check RLS policies (if function exists)
      console.log('Testing RLS policies...')
      try {
        const { data: rlsData, error: rlsError } = await supabase
          .rpc('check_rls_status', {})
          .single()

        testResults.rls = {
          success: !rlsError,
          error: rlsError,
          data: rlsData
        }
      } catch (rlsCatchError) {
        // RLS check function doesn't exist, skip it
        testResults.rls = {
          success: false,
          error: 'RLS check function not available',
          data: null
        }
      }

    } catch (err) {
      console.error('Database test error:', err)
      testResults.general = {
        success: false,
        error: err
      }
    }

    setResults(testResults)
    setLoading(false)
  }

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Database className="w-5 h-5" />
          Database Connection Debug
        </CardTitle>
        <CardDescription>
          Test database connectivity and permissions
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-4">
        <Button
          onClick={runDatabaseTests}
          disabled={loading}
          className="w-full"
        >
          {loading ? 'Running Tests...' : 'Run Database Tests'}
        </Button>

        {Object.keys(results).length > 0 && (
          <div className="space-y-3">
            {Object.entries(results).map(([table, result]: [string, any]) => (
              <Alert key={table} variant={result.success ? 'default' : 'destructive'}>
                <div className="flex items-start gap-2">
                  {result.success ? (
                    <CheckCircle2 className="h-4 w-4 text-green-600 mt-0.5" />
                  ) : (
                    <XCircle className="h-4 w-4 text-red-600 mt-0.5" />
                  )}
                  <div className="flex-1">
                    <div className="flex items-center gap-2 mb-1">
                      <span className="font-semibold">{table}</span>
                      <Badge variant={result.success ? 'default' : 'destructive'}>
                        {result.success ? 'PASS' : 'FAIL'}
                      </Badge>
                    </div>
                    {result.error && (
                      <AlertDescription className="text-sm">
                        <div className="space-y-1">
                          <div><strong>Error:</strong> {result.error.message || result.error}</div>
                          {result.error.code && <div><strong>Code:</strong> {result.error.code}</div>}
                          {result.error.hint && <div><strong>Hint:</strong> {result.error.hint}</div>}
                        </div>
                      </AlertDescription>
                    )}
                    {result.data && (
                      <AlertDescription className="text-sm text-gray-600">
                        Data: {JSON.stringify(result.data).slice(0, 100)}...
                      </AlertDescription>
                    )}
                  </div>
                </div>
              </Alert>
            ))}
          </div>
        )}

        <Alert>
          <AlertCircle className="h-4 w-4" />
          <AlertDescription>
            <strong>Check the browser console for detailed debug logs.</strong>
            <br />
            The helpers now include extensive logging to help identify issues.
          </AlertDescription>
        </Alert>
      </CardContent>
    </Card>
  )
}