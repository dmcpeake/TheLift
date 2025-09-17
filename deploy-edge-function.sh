#!/bin/bash

echo "========================================="
echo "Supabase Edge Function Deployment Script"
echo "========================================="
echo ""

# Check if Supabase CLI is available
if ! command -v supabase &> /dev/null && ! command -v npx &> /dev/null; then
    echo "Error: Supabase CLI is not installed."
    echo "Install it with: brew install supabase/tap/supabase"
    exit 1
fi

# Use npx if supabase is not installed globally
SUPABASE_CMD="supabase"
if ! command -v supabase &> /dev/null; then
    SUPABASE_CMD="npx supabase"
fi

PROJECT_REF="lwxrsufqnxlwiotkolfc"

echo "Step 1: Login to Supabase"
echo "-------------------------"
echo "Running: $SUPABASE_CMD login"
$SUPABASE_CMD login

if [ $? -ne 0 ]; then
    echo "Error: Failed to login to Supabase"
    exit 1
fi

echo ""
echo "Step 2: Link to project"
echo "----------------------"
echo "Running: $SUPABASE_CMD link --project-ref $PROJECT_REF"
$SUPABASE_CMD link --project-ref $PROJECT_REF

if [ $? -ne 0 ]; then
    echo "Error: Failed to link to project"
    exit 1
fi

echo ""
echo "Step 3: Set Anthropic API Key"
echo "-----------------------------"
echo "Please enter your Anthropic API key (starts with sk-ant-api03-):"
read -s ANTHROPIC_KEY
echo ""

if [ -z "$ANTHROPIC_KEY" ]; then
    echo "Error: API key cannot be empty"
    exit 1
fi

echo "Setting API key as secret..."
$SUPABASE_CMD secrets set ANTHROPIC_API_KEY="$ANTHROPIC_KEY"

if [ $? -ne 0 ]; then
    echo "Error: Failed to set API key"
    exit 1
fi

echo ""
echo "Step 4: Deploy Edge Function"
echo "---------------------------"
echo "Deploying analyze-qualitative-data function..."
$SUPABASE_CMD functions deploy analyze-qualitative-data

if [ $? -ne 0 ]; then
    echo "Error: Failed to deploy edge function"
    exit 1
fi

echo ""
echo "Step 5: Push Database Migrations"
echo "--------------------------------"
echo "Pushing database migrations..."
$SUPABASE_CMD db push

if [ $? -ne 0 ]; then
    echo "Warning: Failed to push database migrations"
    echo "You may need to run migrations manually in the Supabase dashboard"
fi

echo ""
echo "========================================="
echo "✅ Deployment Complete!"
echo "========================================="
echo ""
echo "Your edge function is now deployed and ready to use."
echo ""
echo "Test it by:"
echo "1. Going to the Check-in Progress Analytics page"
echo "2. Selecting the 'Qualitative' view"
echo "3. Clicking one of the AI analysis buttons"
echo ""
echo "Dashboard: https://supabase.com/dashboard/project/$PROJECT_REF/functions"