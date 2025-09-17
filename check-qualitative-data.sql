-- Check if there's qualitative data available for AI analysis

-- Count emotion grid entries with explanations
SELECT
  'Emotion Grid Explanations' as data_type,
  COUNT(*) as total_entries,
  COUNT(DISTINCT child_id) as unique_children,
  MIN(created_at)::date as earliest_entry,
  MAX(created_at)::date as latest_entry
FROM emotion_grid_usage
WHERE explanation_text IS NOT NULL AND explanation_text != '';

-- Check recent entries (last 30 days)
SELECT
  'Recent Entries (30 days)' as period,
  COUNT(*) as count
FROM emotion_grid_usage
WHERE explanation_text IS NOT NULL
  AND created_at >= NOW() - INTERVAL '30 days';

-- Sample a few recent explanations
SELECT
  child_id,
  explanation_text,
  created_at::date as date,
  LENGTH(explanation_text) as text_length
FROM emotion_grid_usage
WHERE explanation_text IS NOT NULL
ORDER BY created_at DESC
LIMIT 5;