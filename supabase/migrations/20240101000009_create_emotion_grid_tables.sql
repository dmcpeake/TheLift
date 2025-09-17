-- Create emotion_grid_feelings table (master list of feelings)
CREATE TABLE IF NOT EXISTS public.emotion_grid_feelings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  feeling_name TEXT NOT NULL,
  feeling_category TEXT NOT NULL, -- 'high-energy-comfortable', 'low-energy-comfortable', etc.
  energy_level INTEGER NOT NULL CHECK (energy_level BETWEEN 1 AND 5),
  comfort_level INTEGER NOT NULL CHECK (comfort_level BETWEEN 1 AND 5),
  emoji TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create emotion_grid_usage table (tracks when children select feelings)
CREATE TABLE IF NOT EXISTS public.emotion_grid_usage (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  child_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  org_id UUID REFERENCES public.organizations(id) ON DELETE CASCADE,
  explanation_text TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create junction table for many-to-many relationship
CREATE TABLE IF NOT EXISTS public.emotion_grid_usage_feelings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  usage_id UUID REFERENCES public.emotion_grid_usage(id) ON DELETE CASCADE,
  feeling_id UUID REFERENCES public.emotion_grid_feelings(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(usage_id, feeling_id)
);

-- Create mood_meter_usage table
CREATE TABLE IF NOT EXISTS public.mood_meter_usage (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  child_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  org_id UUID REFERENCES public.organizations(id) ON DELETE CASCADE,
  mood_level TEXT NOT NULL, -- 'very_sad', 'sad', 'ok', 'happy', 'very_happy'
  mood_numeric INTEGER NOT NULL CHECK (mood_numeric BETWEEN 1 AND 5),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Enable RLS
ALTER TABLE public.emotion_grid_feelings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.emotion_grid_usage ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.emotion_grid_usage_feelings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mood_meter_usage ENABLE ROW LEVEL SECURITY;

-- RLS Policies for emotion_grid_feelings (read-only for everyone)
CREATE POLICY "Anyone can read feelings" ON public.emotion_grid_feelings
  FOR SELECT USING (true);

-- RLS Policies for emotion_grid_usage
CREATE POLICY "Anyone can create emotion usage" ON public.emotion_grid_usage
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Anyone can read emotion usage" ON public.emotion_grid_usage
  FOR SELECT USING (true);

CREATE POLICY "Anyone can update emotion usage" ON public.emotion_grid_usage
  FOR UPDATE USING (true);

-- RLS Policies for emotion_grid_usage_feelings
CREATE POLICY "Anyone can create usage feelings" ON public.emotion_grid_usage_feelings
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Anyone can read usage feelings" ON public.emotion_grid_usage_feelings
  FOR SELECT USING (true);

-- RLS Policies for mood_meter_usage
CREATE POLICY "Anyone can create mood usage" ON public.mood_meter_usage
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Anyone can read mood usage" ON public.mood_meter_usage
  FOR SELECT USING (true);

CREATE POLICY "Anyone can update mood usage" ON public.mood_meter_usage
  FOR UPDATE USING (true);

-- Insert default feelings
INSERT INTO public.emotion_grid_feelings (feeling_name, feeling_category, energy_level, comfort_level, emoji) VALUES
  -- High Energy + Comfortable (Green zone)
  ('Happy', 'high-energy-comfortable', 4, 4, '😊'),
  ('Excited', 'high-energy-comfortable', 5, 4, '🤩'),
  ('Joyful', 'high-energy-comfortable', 4, 5, '😄'),
  ('Playful', 'high-energy-comfortable', 4, 4, '🤗'),
  ('Energetic', 'high-energy-comfortable', 5, 3, '⚡'),

  -- Low Energy + Comfortable (Blue zone)
  ('Calm', 'low-energy-comfortable', 2, 4, '😌'),
  ('Peaceful', 'low-energy-comfortable', 1, 5, '☮️'),
  ('Relaxed', 'low-energy-comfortable', 2, 4, '😎'),
  ('Content', 'low-energy-comfortable', 2, 4, '🙂'),
  ('Thoughtful', 'low-energy-comfortable', 2, 3, '🤔'),

  -- High Energy + Uncomfortable (Amber zone)
  ('Angry', 'high-energy-uncomfortable', 5, 1, '😠'),
  ('Frustrated', 'high-energy-uncomfortable', 4, 2, '😤'),
  ('Annoyed', 'high-energy-uncomfortable', 4, 2, '😒'),
  ('Nervous', 'high-energy-uncomfortable', 4, 2, '😰'),
  ('Anxious', 'high-energy-uncomfortable', 4, 1, '😟'),

  -- Low Energy + Uncomfortable (Red zone)
  ('Sad', 'low-energy-uncomfortable', 2, 1, '😢'),
  ('Tired', 'low-energy-uncomfortable', 1, 2, '😴'),
  ('Bored', 'low-energy-uncomfortable', 1, 2, '😑'),
  ('Lonely', 'low-energy-uncomfortable', 2, 1, '😔'),
  ('Disappointed', 'low-energy-uncomfortable', 2, 2, '😞');

-- Create indexes for performance
CREATE INDEX idx_emotion_grid_usage_child_id ON public.emotion_grid_usage(child_id);
CREATE INDEX idx_emotion_grid_usage_org_id ON public.emotion_grid_usage(org_id);
CREATE INDEX idx_emotion_grid_usage_created_at ON public.emotion_grid_usage(created_at);
CREATE INDEX idx_mood_meter_usage_child_id ON public.mood_meter_usage(child_id);
CREATE INDEX idx_mood_meter_usage_org_id ON public.mood_meter_usage(org_id);
CREATE INDEX idx_mood_meter_usage_created_at ON public.mood_meter_usage(created_at);