# Supabase Setup Instructions

I've created the complete database schema and setup files. Here's what you need to do step by step:

## Step 1: Create Supabase Project

1. **Go to [Supabase Dashboard](https://supabase.com/dashboard)**
2. **Click "New Project"**
3. **Fill in project details:**
   - Project Name: `The Lift`
   - Database Password: (create a strong password)
   - Region: Choose closest to your location
4. **Click "Create new project"**
5. **Wait for project to be provisioned (2-3 minutes)**

## Step 2: Get Project Credentials

Once your project is ready:

1. **Go to Settings > API**
2. **Copy these values:**
   - Project URL (something like `https://abcdefgh.supabase.co`)
   - Project Reference ID (the part before `.supabase.co`)
   - Anon public key (starts with `eyJhbGci...`)

## Step 3: Install Supabase CLI

```bash
# Install Supabase CLI globally
npm install -g @supabase/cli

# Verify installation
supabase --version
```

## Step 4: Set Up Environment Variables

```bash
# Copy the example file
cp .env.example .env

# Edit .env file with your credentials:
REACT_APP_SUPABASE_URL=https://YOUR_PROJECT_ID.supabase.co
REACT_APP_SUPABASE_ANON_KEY=your_anon_key_here
REACT_APP_SUPABASE_PROJECT_ID=YOUR_PROJECT_ID
```

## Step 5: Link Local Project to Supabase

```bash
# Link to your Supabase project
supabase link --project-ref YOUR_PROJECT_ID

# When prompted, enter your database password
```

## Step 6: Apply Database Migrations

```bash
# Push all migrations to your Supabase database
supabase db push

# This will apply:
# - Initial schema (tables, indexes, triggers)
# - Row Level Security policies
# - Database functions
# - Test data
```

## Step 7: Deploy Edge Functions

```bash
# Deploy the server function
supabase functions deploy server

# Verify deployment
supabase functions list
```

## Step 8: Set Up Authentication

### Create Admin User
1. **Go to Supabase Dashboard > Authentication > Users**
2. **Click "Invite"**
3. **Email:** `admin@thelift.com`
4. **Click "Send invitation"**
5. **Check email and set password**

### Create Test Practitioner
1. **Click "Invite" again**
2. **Email:** `practitioner@example.com` 
3. **Send invitation and set password**

### Create Test Group Manager
1. **Click "Invite" again**
2. **Email:** `manager@sunnydale.edu`
3. **Send invitation and set password**

## Step 9: Test the Connection

```bash
# Start the development server
npm run dev

# Visit http://localhost:5173
# Try logging in with the accounts you created
```

## Step 10: Verify Everything Works

### Test Admin Login
- **URL:** `http://localhost:5173/admin/login`
- **Email:** `admin@thelift.com`
- **Should redirect to:** Admin dashboard

### Test Practitioner Login  
- **URL:** `http://localhost:5173/login` (Adult tab)
- **Email:** `practitioner@example.com`
- **Should redirect to:** Practitioner dashboard

### Test Child Login
- **URL:** `http://localhost:5173/login` (Child tab)
- **Username:** `alice123`
- **PIN:** `1234`
- **Should redirect to:** Child onboarding

## What's Been Created

✅ **Complete Database Schema:**
- 9 tables with proper relationships
- Row Level Security on all tables
- Indexes for performance
- Triggers for updated_at timestamps

✅ **Security Policies:**
- Role-based access control
- Organisation-level data isolation
- Child data protection

✅ **Database Functions:**
- User signup handling
- Organisation management
- Child account creation
- Reporting functions

✅ **Test Data:**
- 3 test organisations
- Multiple user roles
- Sample children with wellbeing data
- Garden items and stickers

## Troubleshooting

### If migrations fail:
```bash
# Reset and try again
supabase db reset
supabase db push
```

### If Edge Functions don't deploy:
```bash
# Check function logs
supabase functions logs server

# Re-deploy with verbose output
supabase functions deploy server --debug
```

### If authentication isn't working:
1. **Check RLS is enabled** in Supabase Dashboard > Authentication > Settings
2. **Verify email confirmations are disabled** for testing
3. **Check user roles** are set correctly in the profiles table

## Next Steps After Setup

Once everything is working:
1. **Update user roles** in the database to match test accounts
2. **Test all user flows** (admin, practitioner, child)
3. **Add more test data** as needed
4. **Begin connecting frontend forms** to the database
5. **Implement child authentication** properly

The database is now fully set up and ready for development!