-- Insert realistic emotion grid usage data for Felix Baker
-- UUID: 0804f356-4551-4b5d-83a2-c3c787bdac02
-- Org: 5f910546-8bdc-44ca-b776-fdd5eb5cccd9

-- Clear any existing data for Felix first
DELETE FROM public.emotion_grid_usage_feelings WHERE usage_id IN (
  SELECT id FROM public.emotion_grid_usage WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02'
);
DELETE FROM public.emotion_grid_usage WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02';

-- Felix Baker's emotional journey: Starts sad, gradually improves
-- Week 1: Struggling with anxiety and sadness
INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Feeling really worried about school. My stomach hurts when I think about going tomorrow.',
 '2025-01-08T16:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Had a bad dream last night. Scared to sleep alone.',
 '2025-01-10T20:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Friends were mean at lunch. Feel like nobody likes me.',
 '2025-01-12T14:00:00+00');

-- Week 2: Still struggling but trying coping strategies
INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Tried breathing exercises today. Still feel sad but a little better.',
 '2025-01-15T15:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Teacher helped me with math. Feeling less stupid.',
 '2025-01-17T10:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Mom says I worry too much. Maybe she is right.',
 '2025-01-19T18:00:00+00');

-- Week 3: Slight improvement
INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Made a new friend at recess. We played soccer together.',
 '2025-01-22T18:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Still worried about tests but trying to stay calm.',
 '2025-01-24T16:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Slept better last night. Dad read me a story.',
 '2025-01-26T09:00:00+00');

-- Week 4: Mixed emotions
INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Good day at school but still feel worried sometimes.',
 '2025-01-29T15:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Got invited to a birthday party! Excited but nervous.',
 '2025-01-31T17:00:00+00');

-- Weeks 5-8: Gradual improvement with setbacks
INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Feeling okay today. The breathing helps when I am scared.',
 '2025-02-05T17:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Bad day. Failed my spelling test. Feel dumb again.',
 '2025-02-08T14:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Teacher said I am getting better at math. Made me smile.',
 '2025-02-12T15:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Played with friends all recess. Had fun!',
 '2025-02-15T13:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Still get nervous but I know what to do now.',
 '2025-02-19T17:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Helped a younger kid who was crying. Felt good to help.',
 '2025-02-22T11:00:00+00');

-- Weeks 9-12: Showing resilience and improvement
INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Had a great weekend with family. Feeling happy!',
 '2025-02-26T15:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Worried about the big test but I studied hard.',
 '2025-03-01T16:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Got a B on my test! Mom is proud of me.',
 '2025-03-05T17:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Best friend said I am funny. Made me feel special.',
 '2025-03-08T12:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Still feel worried sometimes but much better than before.',
 '2025-03-12T15:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Looking forward to spring break. Feeling excited!',
 '2025-03-15T14:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'I think I am getting better at handling my worries.',
 '2025-03-19T18:00:00+00'),

('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
 'Had the best day! Scored a goal in soccer and everyone cheered!',
 '2025-03-26T18:00:00+00');

-- Also insert corresponding mood meter data to match the emotional journey
DELETE FROM public.mood_meter_usage WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02';

-- Weeks 1-2: Low moods (2-3)
INSERT INTO public.mood_meter_usage (child_id, org_id, mood_level, mood_numeric, notes, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'sad', 2, 'Anxious about school', '2025-01-08T16:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'sad', 2, 'Nightmares', '2025-01-10T20:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'very_sad', 1, 'No friends', '2025-01-12T14:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'sad', 2, 'Trying to cope', '2025-01-15T15:00:00+00');

-- Weeks 3-4: Slight improvement (2-3)
INSERT INTO public.mood_meter_usage (child_id, org_id, mood_level, mood_numeric, notes, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'ok', 3, 'Made a friend', '2025-01-22T18:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'sad', 2, 'Test anxiety', '2025-01-24T16:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'ok', 3, 'Slept better', '2025-01-26T09:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'ok', 3, 'Mixed feelings', '2025-01-29T15:00:00+00');

-- Weeks 5-8: Gradual improvement with ups and downs (3-4)
INSERT INTO public.mood_meter_usage (child_id, org_id, mood_level, mood_numeric, notes, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'ok', 3, 'Breathing helps', '2025-02-05T17:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'sad', 2, 'Failed test', '2025-02-08T14:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'ok', 3, 'Getting better at math', '2025-02-12T15:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'happy', 4, 'Fun at recess', '2025-02-15T13:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'ok', 3, 'Managing anxiety', '2025-02-19T17:00:00+00');

-- Weeks 9-12: Steady improvement (4-5)
INSERT INTO public.mood_meter_usage (child_id, org_id, mood_level, mood_numeric, notes, created_at)
VALUES
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'happy', 4, 'Great weekend', '2025-02-26T15:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'ok', 3, 'Test worry but prepared', '2025-03-01T16:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'happy', 4, 'Got a B!', '2025-03-05T17:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'happy', 4, 'Feeling special', '2025-03-08T12:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'happy', 4, 'Much better', '2025-03-12T15:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'very_happy', 5, 'Spring break excitement', '2025-03-15T14:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'happy', 4, 'Better at coping', '2025-03-19T18:00:00+00'),
('0804f356-4551-4b5d-83a2-c3c787bdac02', '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 'very_happy', 5, 'Scored a goal!', '2025-03-26T18:00:00+00');