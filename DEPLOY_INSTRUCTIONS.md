# Deploy Supabase Edge Function - Manual Steps

Since you need to run this interactively, please follow these steps in your terminal:

## Step 1: Login to Supabase
Open your terminal and run:
```bash
npx supabase login
```
This will open your browser for authentication.

## Step 2: Link to your project
```bash
npx supabase link --project-ref lwxrsufqnxlwiotkolfc
```

## Step 3: Set your Anthropic API Key
Replace `YOUR_KEY_HERE` with your actual Anthropic API key:
```bash
npx supabase secrets set ANTHROPIC_API_KEY=YOUR_KEY_HERE
```

## Step 4: Deploy the Edge Function
```bash
npx supabase functions deploy analyze-qualitative-data
```

## Step 5: Push Database Migrations (Optional)
```bash
npx supabase db push
```
Or manually run the migration from `supabase/migrations/20240101000007_ai_analyses.sql` in the Supabase SQL editor.

## Alternative: Use Supabase Dashboard

If the CLI gives you trouble, you can deploy via the dashboard:

1. **Go to your project's Edge Functions**:
   https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/functions

2. **Create new function**:
   - Click "New Function"
   - Name: `analyze-qualitative-data`
   - Copy the entire contents from: `supabase/functions/analyze-qualitative-data/index.ts`
   - Click "Deploy"

3. **Add the API Key secret**:
   - Go to: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/settings/vault
   - Click "New Secret"
   - Name: `ANTHROPIC_API_KEY`
   - Value: Your Anthropic API key
   - Click "Save"

4. **Run the database migration**:
   - Go to: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/sql/new
   - Copy the SQL from: `supabase/migrations/20240101000007_ai_analyses.sql`
   - Click "Run"

## Verify Deployment

After deployment, you can test the function:
1. Go to the Check-in Progress Analytics page on your app
2. Select the "Qualitative" view tab
3. Click any of the AI analysis buttons

If you see an error, check:
- Edge Function logs: https://supabase.com/dashboard/project/lwxrsufqnxlwiotkolfc/functions/analyze-qualitative-data/logs
- Verify the ANTHROPIC_API_KEY secret is set correctly

## Need an Anthropic API Key?

1. Sign up at: https://console.anthropic.com
2. Navigate to API Keys
3. Create a new key
4. Copy the key (it will start with `sk-ant-api03-`)