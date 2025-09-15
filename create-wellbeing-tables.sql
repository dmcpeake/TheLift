-- Create wellbeing tool tables for The Lift

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create ENUM types
DO $$ BEGIN
    CREATE TYPE mood_type AS ENUM ('very_sad', 'sad', 'ok', 'happy', 'very_happy');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE emotion_category AS ENUM (
        'high-energy-uncomfortable',
        'low-energy-uncomfortable',
        'high-energy-comfortable',
        'low-energy-comfortable'
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE wellbeing_section AS ENUM (
        'my_friends',
        'my_work',
        'my_health',
        'my_family',
        'my_fun_play',
        'my_safety',
        'my_emotions'
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- Check-in Sessions table
CREATE TABLE IF NOT EXISTS checkin_sessions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    child_id UUID NOT NULL,
    session_date DATE DEFAULT CURRENT_DATE,
    session_time TIME DEFAULT CURRENT_TIME,
    tools_completed TEXT[] DEFAULT '{}',
    mood_meter_completed BOOLEAN DEFAULT false,
    emotion_grid_completed BOOLEAN DEFAULT false,
    wellbeing_wheel_completed BOOLEAN DEFAULT false,
    breathing_tool_completed BOOLEAN DEFAULT false,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Mood Meter Usage table
CREATE TABLE IF NOT EXISTS mood_meter_usage (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    child_id UUID NOT NULL,
    session_id UUID REFERENCES checkin_sessions(id) ON DELETE CASCADE,
    mood_value INTEGER NOT NULL CHECK (mood_value >= 1 AND mood_value <= 5),
    mood_label mood_type NOT NULL,
    selection_time_ms INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Emotion Grid Usage table
CREATE TABLE IF NOT EXISTS emotion_grid_usage (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    child_id UUID NOT NULL,
    session_id UUID REFERENCES checkin_sessions(id) ON DELETE CASCADE,
    story_text TEXT,
    story_audio_url TEXT,
    completion_time_ms INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Emotion Grid Feelings table
CREATE TABLE IF NOT EXISTS emotion_grid_feelings (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    emotion_grid_id UUID NOT NULL REFERENCES emotion_grid_usage(id) ON DELETE CASCADE,
    feeling_name VARCHAR(50) NOT NULL,
    category emotion_category NOT NULL,
    selection_order INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Feeling Definitions table (reference data)
CREATE TABLE IF NOT EXISTS feeling_definitions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    feeling_name VARCHAR(50) NOT NULL UNIQUE,
    category emotion_category NOT NULL,
    definition TEXT NOT NULL,
    example_usage TEXT,
    icon_url TEXT,
    color_hex VARCHAR(7) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Wellbeing Wheel Usage table
CREATE TABLE IF NOT EXISTS wellbeing_wheel_usage (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    child_id UUID NOT NULL,
    session_id UUID REFERENCES checkin_sessions(id) ON DELETE CASCADE,
    overall_score DECIMAL(3,2) NOT NULL,
    completion_time_ms INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Wellbeing Wheel Sections table
CREATE TABLE IF NOT EXISTS wellbeing_wheel_sections (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    wellbeing_wheel_id UUID NOT NULL REFERENCES wellbeing_wheel_usage(id) ON DELETE CASCADE,
    section_name wellbeing_section NOT NULL,
    score_value INTEGER NOT NULL CHECK (score_value >= 1 AND score_value <= 5),
    score_label mood_type NOT NULL,
    text_note TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Breathing Tool Usage table
CREATE TABLE IF NOT EXISTS breathing_tool_usage (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    child_id UUID NOT NULL,
    session_id UUID REFERENCES checkin_sessions(id) ON DELETE CASCADE,
    duration_seconds INTEGER NOT NULL,
    cycles_completed INTEGER NOT NULL,
    breathing_pattern VARCHAR(50) NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Child Profile Scores table (for aggregated metrics)
CREATE TABLE IF NOT EXISTS child_profile_scores (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    child_id UUID NOT NULL,
    metric_type VARCHAR(50) NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    date_recorded DATE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_checkin_sessions_child_id ON checkin_sessions(child_id);
CREATE INDEX IF NOT EXISTS idx_checkin_sessions_created_at ON checkin_sessions(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_mood_meter_child_id ON mood_meter_usage(child_id);
CREATE INDEX IF NOT EXISTS idx_mood_meter_session_id ON mood_meter_usage(session_id);
CREATE INDEX IF NOT EXISTS idx_emotion_grid_child_id ON emotion_grid_usage(child_id);
CREATE INDEX IF NOT EXISTS idx_emotion_grid_session_id ON emotion_grid_usage(session_id);
CREATE INDEX IF NOT EXISTS idx_wellbeing_wheel_child_id ON wellbeing_wheel_usage(child_id);
CREATE INDEX IF NOT EXISTS idx_wellbeing_wheel_session_id ON wellbeing_wheel_usage(session_id);
CREATE INDEX IF NOT EXISTS idx_breathing_tool_child_id ON breathing_tool_usage(child_id);
CREATE INDEX IF NOT EXISTS idx_breathing_tool_session_id ON breathing_tool_usage(session_id);
CREATE INDEX IF NOT EXISTS idx_child_profile_scores_child_id ON child_profile_scores(child_id);

-- Row Level Security (RLS) Policies
-- Enable RLS on all tables
ALTER TABLE checkin_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE mood_meter_usage ENABLE ROW LEVEL SECURITY;
ALTER TABLE emotion_grid_usage ENABLE ROW LEVEL SECURITY;
ALTER TABLE emotion_grid_feelings ENABLE ROW LEVEL SECURITY;
ALTER TABLE feeling_definitions ENABLE ROW LEVEL SECURITY;
ALTER TABLE wellbeing_wheel_usage ENABLE ROW LEVEL SECURITY;
ALTER TABLE wellbeing_wheel_sections ENABLE ROW LEVEL SECURITY;
ALTER TABLE breathing_tool_usage ENABLE ROW LEVEL SECURITY;
ALTER TABLE child_profile_scores ENABLE ROW LEVEL SECURITY;

-- Create policies (allowing all operations for now - adjust based on your auth setup)
-- For testing, we'll allow all operations. In production, restrict based on user roles

-- Checkin Sessions policies
CREATE POLICY "Allow all operations on checkin_sessions" ON checkin_sessions
    FOR ALL USING (true) WITH CHECK (true);

-- Mood Meter policies
CREATE POLICY "Allow all operations on mood_meter_usage" ON mood_meter_usage
    FOR ALL USING (true) WITH CHECK (true);

-- Emotion Grid policies
CREATE POLICY "Allow all operations on emotion_grid_usage" ON emotion_grid_usage
    FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "Allow all operations on emotion_grid_feelings" ON emotion_grid_feelings
    FOR ALL USING (true) WITH CHECK (true);

-- Feeling Definitions policies (read-only for most users)
CREATE POLICY "Allow read on feeling_definitions" ON feeling_definitions
    FOR SELECT USING (true);

CREATE POLICY "Allow all operations on feeling_definitions for testing" ON feeling_definitions
    FOR ALL USING (true) WITH CHECK (true);

-- Wellbeing Wheel policies
CREATE POLICY "Allow all operations on wellbeing_wheel_usage" ON wellbeing_wheel_usage
    FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "Allow all operations on wellbeing_wheel_sections" ON wellbeing_wheel_sections
    FOR ALL USING (true) WITH CHECK (true);

-- Breathing Tool policies
CREATE POLICY "Allow all operations on breathing_tool_usage" ON breathing_tool_usage
    FOR ALL USING (true) WITH CHECK (true);

-- Child Profile Scores policies
CREATE POLICY "Allow all operations on child_profile_scores" ON child_profile_scores
    FOR ALL USING (true) WITH CHECK (true);

-- Insert feeling definitions (reference data)
INSERT INTO feeling_definitions (feeling_name, category, definition, color_hex) VALUES
-- High Energy Uncomfortable
('Angry', 'high-energy-uncomfortable', 'Feeling strong displeasure or hostility', '#DC2626'),
('Disgusted', 'high-energy-uncomfortable', 'Feeling strong disapproval or revulsion', '#DC2626'),
('Embarrassed', 'high-energy-uncomfortable', 'Feeling self-conscious or ashamed', '#DC2626'),
('Hurt', 'high-energy-uncomfortable', 'Feeling emotional pain or distress', '#DC2626'),
('Jealous', 'high-energy-uncomfortable', 'Feeling envious of someone else', '#DC2626'),
('Overwhelmed', 'high-energy-uncomfortable', 'Feeling like too much is happening', '#DC2626'),
('Terrified', 'high-energy-uncomfortable', 'Feeling extreme fear', '#DC2626'),
('Shocked', 'high-energy-uncomfortable', 'Feeling surprised in a bad way', '#DC2626'),
('Worried', 'high-energy-uncomfortable', 'Feeling anxious about something', '#DC2626'),
-- Low Energy Uncomfortable
('Bored', 'low-energy-uncomfortable', 'Feeling uninterested or restless', '#6B7280'),
('Confused', 'low-energy-uncomfortable', 'Feeling uncertain or unclear', '#6B7280'),
('Disappointed', 'low-energy-uncomfortable', 'Feeling let down by expectations', '#6B7280'),
('Guilty', 'low-energy-uncomfortable', 'Feeling responsible for wrongdoing', '#6B7280'),
('Hopeless', 'low-energy-uncomfortable', 'Feeling without hope', '#6B7280'),
('Lonely', 'low-energy-uncomfortable', 'Feeling isolated or alone', '#6B7280'),
('Lost', 'low-energy-uncomfortable', 'Feeling directionless or confused', '#6B7280'),
('Resentful', 'low-energy-uncomfortable', 'Feeling bitter about unfair treatment', '#6B7280'),
('Sad', 'low-energy-uncomfortable', 'Feeling unhappy or sorrowful', '#6B7280'),
-- High Energy Comfortable
('Amazed', 'high-energy-comfortable', 'Feeling wonderfully surprised', '#10B981'),
('Amused', 'high-energy-comfortable', 'Finding something funny or entertaining', '#10B981'),
('Confident', 'high-energy-comfortable', 'Feeling sure of yourself', '#10B981'),
('Courageous', 'high-energy-comfortable', 'Feeling brave and strong', '#10B981'),
('Excited', 'high-energy-comfortable', 'Feeling enthusiastic and eager', '#10B981'),
('Happy', 'high-energy-comfortable', 'Feeling pleased and content', '#10B981'),
('Pleased', 'high-energy-comfortable', 'Feeling satisfied with something', '#10B981'),
('Motivated', 'high-energy-comfortable', 'Feeling driven to do something', '#10B981'),
('Proud', 'high-energy-comfortable', 'Feeling good about an achievement', '#10B981'),
-- Low Energy Comfortable
('Accepted', 'low-energy-comfortable', 'Feeling welcomed and included', '#3B82F6'),
('Calm', 'low-energy-comfortable', 'Feeling peaceful and relaxed', '#3B82F6'),
('Content', 'low-energy-comfortable', 'Feeling satisfied and at ease', '#3B82F6'),
('Curious', 'low-energy-comfortable', 'Feeling interested to learn more', '#3B82F6'),
('Hopeful', 'low-energy-comfortable', 'Feeling optimistic about the future', '#3B82F6'),
('Loved', 'low-energy-comfortable', 'Feeling cared for and valued', '#3B82F6'),
('Relieved', 'low-energy-comfortable', 'Feeling relaxed after worry', '#3B82F6'),
('Safe', 'low-energy-comfortable', 'Feeling secure and protected', '#3B82F6'),
('Thankful', 'low-energy-comfortable', 'Feeling grateful and appreciative', '#3B82F6')
ON CONFLICT (feeling_name) DO NOTHING;

-- Grant permissions for anon and authenticated users
GRANT ALL ON ALL TABLES IN SCHEMA public TO anon;
GRANT ALL ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO anon;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO authenticated;