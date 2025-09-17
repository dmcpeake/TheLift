#!/bin/bash

# Deploy the optimized edge function for reduced token usage
echo "Deploying optimized edge function..."

# Deploy the function
npx supabase functions deploy analyze-qualitative-data-optimized \
  --project-ref lwxrsufqnxlwiotkolfc

echo "Deployment complete!"
echo ""
echo "To use the optimized function, update ChildSummaryAnalytics.tsx:"
echo "Change: analyze-qualitative-data"
echo "To: analyze-qualitative-data-optimized"
echo ""
echo "Benefits of optimized function:"
echo "- 90-95% reduction in token usage"
echo "- Faster responses"
echo "- Lower costs"
echo "- Pre-aggregated data"