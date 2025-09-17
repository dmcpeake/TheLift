# Claude API Setup for Qualitative Data Analysis

This guide explains how to set up the Anthropic Claude API for analyzing qualitative data from children's check-in sessions.

## Prerequisites

1. An Anthropic API account with access to Claude
2. Supabase project with edge functions enabled

## Setup Steps

### 1. Get Your Anthropic API Key

1. Sign up for an Anthropic account at [console.anthropic.com](https://console.anthropic.com)
2. Navigate to API Keys section
3. Create a new API key
4. Copy the key (it starts with `sk-ant-api03-`)

### 2. Configure Supabase Environment Variables

Add the Anthropic API key to your Supabase project:

```bash
# Using Supabase CLI
supabase secrets set ANTHROPIC_API_KEY=your-api-key-here

# Or through Supabase Dashboard
# Go to Project Settings > Edge Functions > Secrets
# Add ANTHROPIC_API_KEY with your key value
```

### 3. Deploy the Edge Function

Deploy the analyze-qualitative-data edge function:

```bash
# From project root
supabase functions deploy analyze-qualitative-data
```

### 4. Apply Database Migrations

Run the AI analyses table migration:

```bash
supabase migration up
```

## Features

### Available Analysis Types

The Claude API integration supports four types of analysis:

1. **Trends Analysis** - Identifies patterns over time
2. **Sentiment Analysis** - Analyzes emotional tone
3. **Concerns Detection** - Flags potential issues
4. **Comprehensive Analysis** - Full detailed analysis

### Data Analyzed

The system analyzes:
- Children's emotional explanations
- Selected feelings and emotions
- Mood patterns over time
- Input methods (voice vs text)

### Using the Feature

1. Navigate to the Check-in Progress Analytics page
2. Select the "Qualitative" view tab
3. Choose your filters (organization, date range)
4. Click one of the analysis buttons:
   - Analyze Trends
   - Sentiment Analysis
   - Flag Concerns
   - Full Analysis

### API Usage Limits

- Claude API has rate limits based on your plan
- Each analysis consumes approximately 500-2000 tokens
- Results are cached in the database to minimize API calls

## Security Considerations

- API keys are stored securely in Supabase secrets
- Analysis requests require authentication
- RLS policies ensure users can only analyze their organization's data
- No personally identifiable information is sent to Claude beyond first names

## Troubleshooting

### Common Issues

1. **"Anthropic API key not configured"**
   - Ensure ANTHROPIC_API_KEY is set in Supabase secrets
   - Restart edge functions after adding the secret

2. **"Failed to run AI analysis"**
   - Check API key validity
   - Verify you have sufficient API credits
   - Check Supabase edge function logs

3. **No qualitative data available**
   - Ensure children have completed emotion grid activities
   - Check date range filters
   - Verify organization filter selection

## Cost Estimation

- Average analysis: ~1,000 tokens
- Claude 3 Sonnet pricing: $3 per million input tokens
- Estimated cost: < $0.01 per analysis

## Support

For issues or questions:
1. Check Supabase edge function logs
2. Review Anthropic API dashboard for errors
3. Contact system administrator