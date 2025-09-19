-- Get complete database schema information

-- 1. List all tables in public schema
SELECT 'TABLES IN PUBLIC SCHEMA:' as info;
SELECT
    table_name,
    table_type
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- 2. Get detailed column information for key tables
SELECT 'CHECKIN_SESSIONS COLUMNS:' as info;
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'checkin_sessions'
ORDER BY ordinal_position;

SELECT 'MOOD_METER_USAGE COLUMNS:' as info;
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'mood_meter_usage'
ORDER BY ordinal_position;

SELECT 'EMOTION_GRID_USAGE COLUMNS:' as info;
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'emotion_grid_usage'
ORDER BY ordinal_position;

SELECT 'WELLBEING_WHEEL_USAGE COLUMNS:' as info;
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'wellbeing_wheel_usage'
ORDER BY ordinal_position;

SELECT 'BREATHING_TOOL_USAGE COLUMNS:' as info;
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'breathing_tool_usage'
ORDER BY ordinal_position;

-- 3. Check if wellbeing_sessions exists
SELECT 'WELLBEING_SESSIONS TABLE CHECK:' as info;
SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name LIKE '%wellbeing%'
ORDER BY table_name;

-- 4. Get foreign key relationships
SELECT 'FOREIGN KEY RELATIONSHIPS:' as info;
SELECT
    tc.table_name,
    tc.constraint_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
AND tc.table_schema = 'public'
AND tc.table_name IN ('checkin_sessions', 'mood_meter_usage', 'emotion_grid_usage',
                      'wellbeing_wheel_usage', 'breathing_tool_usage')
ORDER BY tc.table_name, kcu.column_name;