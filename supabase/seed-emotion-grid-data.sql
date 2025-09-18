-- Create test emotion_grid_usage data for Chloe King and other children
-- These will appear as "Latest Check-ins" in the analytics dashboard

-- First, let's create the emotion_grid_usage table if it doesn't exist
CREATE TABLE IF NOT EXISTS emotion_grid_usage (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    child_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    explanation_text TEXT,
    emotion_x FLOAT,
    emotion_y FLOAT,
    FOREIGN KEY (child_id) REFERENCES profiles(id) ON DELETE CASCADE
);

-- Clear existing test data for clean slate (optional)
-- DELETE FROM emotion_grid_usage WHERE child_id IN (
--     '28e7a649-8677-4476-b88c-b5b923a9a4e2',  -- Chloe King
--     '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b',  -- Liam Johnson
--     '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c'   -- Emma Davis
-- );

-- Insert emotion grid data for Chloe King (10 recent check-ins)
INSERT INTO emotion_grid_usage (child_id, created_at, explanation_text, emotion_x, emotion_y) VALUES
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-17 14:30:00', 'Feeling a bit anxious about my upcoming math test, but I studied hard so I think I''ll do okay.', 0.3, -0.2),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-16 09:15:00', 'Had a great time playing with my friends at recess today! We played tag and everyone was laughing.', 0.8, 0.7),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-15 15:45:00', 'Feeling tired after PE class but proud that I ran the whole mile without stopping.', 0.5, 0.3),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-14 11:20:00', 'My art project didn''t turn out how I wanted and I feel frustrated. I might try again tomorrow.', -0.3, -0.4),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-13 13:00:00', 'Excited about the school play next week! I have been practicing my lines every day.', 0.9, 0.8),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-12 10:30:00', 'Feeling okay today. Nothing special happened but nothing bad either.', 0.0, 0.0),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-11 14:00:00', 'Got picked for the soccer team! I''m so happy and can''t wait for practice to start.', 0.95, 0.9),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-10 09:00:00', 'Had a disagreement with my best friend and we''re not talking. I feel sad and hope we make up soon.', -0.6, -0.7),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-09 16:00:00', 'Teacher said my story was really creative! I feel proud and want to write more.', 0.7, 0.6),
('28e7a649-8677-4476-b88c-b5b923a9a4e2', '2025-01-08 11:45:00', 'Feeling nervous about the dentist appointment tomorrow. I don''t like going there.', -0.2, -0.5);

-- Insert emotion grid data for Liam Johnson (5 check-ins)
INSERT INTO emotion_grid_usage (child_id, created_at, explanation_text, emotion_x, emotion_y) VALUES
('2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b', '2025-01-17 10:00:00', 'Really enjoying my new book series. I stayed up late reading last night!', 0.6, 0.5),
('2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b', '2025-01-16 14:20:00', 'Struggled with homework today but my dad helped me understand it better.', 0.1, 0.2),
('2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b', '2025-01-15 09:30:00', 'Made a new friend in music class. We both play guitar!', 0.8, 0.7),
('2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b', '2025-01-14 15:00:00', 'Feeling bored. It''s raining and I can''t go outside to play.', -0.1, -0.3),
('2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b', '2025-01-13 11:15:00', 'Got 100% on my spelling test! Mom said she''s proud of me.', 0.9, 0.85);

-- Insert emotion grid data for Emma Davis (5 check-ins)
INSERT INTO emotion_grid_usage (child_id, created_at, explanation_text, emotion_x, emotion_y) VALUES
('3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c', '2025-01-17 13:45:00', 'Feeling calm after meditation session in wellness class. I like these quiet moments.', 0.4, 0.6),
('3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c', '2025-01-16 10:30:00', 'Worried about my grandma who is sick. I hope she feels better soon.', -0.5, -0.6),
('3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c', '2025-01-15 14:15:00', 'Had fun in science class today! We did an experiment with volcanoes.', 0.7, 0.65),
('3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c', '2025-01-14 09:45:00', 'Feeling overwhelmed with all the homework this week. Need to organize better.', -0.3, -0.4),
('3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c', '2025-01-13 16:00:00', 'Happy that my parents said we can get a puppy! Can''t wait to pick one out.', 0.95, 0.92);

-- Add a few more for other children if they exist
INSERT INTO emotion_grid_usage (child_id, created_at, explanation_text, emotion_x, emotion_y)
SELECT
    id as child_id,
    NOW() - (random() * INTERVAL '30 days') as created_at,
    'Today was a good day at school. I enjoyed learning about space in science class.' as explanation_text,
    random() * 2 - 1 as emotion_x,
    random() * 2 - 1 as emotion_y
FROM profiles
WHERE role = 'Child'
  AND id NOT IN (
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b',
    '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c'
  )
LIMIT 5;

-- Verify the data was inserted
SELECT
    p.name,
    COUNT(e.id) as checkin_count,
    MAX(e.created_at) as latest_checkin
FROM profiles p
LEFT JOIN emotion_grid_usage e ON p.id = e.child_id
WHERE p.role = 'Child'
GROUP BY p.id, p.name
ORDER BY checkin_count DESC;