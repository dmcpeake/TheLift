# Edge Function Verification Checklist

## ✅ Quick Verification Steps

### 1. Check if Function is Deployed
Visit: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/functions

You should see:
- [ ] `analyze-qualitative-data` function listed
- [ ] Status shows as "Active" or "Deployed"
- [ ] Last deployment time is recent

### 2. Check if API Key is Set
Visit: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/settings/vault

You should see:
- [ ] Secret named `ANTHROPIC_API_KEY` exists
- [ ] It has a value (will be hidden, showing as •••••)

### 3. Check Function Logs
Visit: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/functions/analyze-qualitative-data/logs

Look for:
- [ ] Recent invocation attempts
- [ ] Any error messages (especially about API keys)

### 4. Check Database Table
Visit: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/editor

You should see:
- [ ] `ai_analyses` table exists in the schema
- [ ] Table has the correct columns

## 🧪 Test in the Application

### 1. Navigate to Analytics
1. Log in to your app at https://www.the-lift.org
2. Navigate to the Check-in Progress Analytics page
3. Select the "Qualitative" view tab

### 2. Run a Test Analysis
1. Click one of the analysis buttons:
   - "Analyze Trends" (simplest test)
   - "Sentiment Analysis"
   - "Flag Concerns"
   - "Full Analysis"

2. Watch for:
   - [ ] Loading spinner appears with "Analyzing with Claude AI..."
   - [ ] Analysis results appear after 5-10 seconds
   - [ ] No error messages

### 3. Check Results
If successful, you should see:
- [ ] Analysis text in purple box
- [ ] Metadata showing data points, children count, etc.
- [ ] No error messages

## 🔧 Troubleshooting

### If you see "Failed to run AI analysis":

1. **Check Function Deployment**
   - Go to Functions page in Supabase dashboard
   - If not listed, deploy with: `npx supabase functions deploy analyze-qualitative-data`

2. **Check API Key**
   - Go to Vault/Secrets in Supabase dashboard
   - If missing, add with: `npx supabase secrets set ANTHROPIC_API_KEY=your-key`

3. **Check Function Logs**
   - Go to function logs in dashboard
   - Look for specific error messages

### Common Error Messages:

| Error | Solution |
|-------|----------|
| "Function not found" | Function not deployed. Run deployment command |
| "Anthropic API key not configured" | Set the API key in Supabase secrets |
| "Unauthorized" | User not logged in or lacks permissions |
| "No qualitative data available" | No emotion grid data in database to analyze |
| Rate limit error | Anthropic API rate limit hit, wait a bit |

## 📊 Verify Data Exists

For the AI analysis to work, you need qualitative data. Check if you have any:

1. Go to SQL Editor: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/sql/new
2. Run this query:
```sql
SELECT COUNT(*) as total_entries
FROM emotion_grid_usage
WHERE explanation_text IS NOT NULL;
```

If the count is 0, you need children to complete some emotion grid activities first.

## ✅ Everything Working?

If all checks pass:
1. The edge function is deployed ✅
2. The API key is configured ✅
3. The database is ready ✅
4. AI analysis should work in the app ✅

## Need Help?

- **Function Logs**: Best place to see what's happening
- **Browser Console**: Check for client-side errors (F12 → Console)
- **Network Tab**: See if the function call is being made (F12 → Network)