-- Combined SQL Batch 9
-- Contains chunks 81 to 90


-- From chunk_081.sql
-- SQL Chunk 81
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 81/131 - Maya
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-24T15:08:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-24T15:08:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-24T15:12:00+00', 
    41, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-25T16:00:00+00', 
    '2025-03-25T16:11:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-25T16:01:00+00', 
    30, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T15:00:00+00', 
    '2025-03-26T15:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-03-26T15:01:00+00', 
    23, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T15:02:00+00', 
    '2025-03-26T15:11:00+00', 
    3, 
    'learning to handle selective mutism better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    1, 
    '2025-03-26T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    2, 
    '2025-03-26T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    3, 
    '2025-03-26T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T15:03:00+00', 
    '2025-03-26T15:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-27T14:00:00+00', 
    '2025-03-27T14:14:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-27T14:01:00+00', 
    29, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T14:30:00+00', 
    '2025-03-28T14:41:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-28T14:31:00+00', 
    7, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T14:32:00+00', 
    '2025-03-28T14:37:00+00', 
    3, 
    'learning to handle selective mutism better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    1, 
    '2025-03-28T14:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    2, 
    '2025-03-28T14:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    3, 
    '2025-03-28T14:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T14:35:00+00', 
    '2025-03-28T14:47:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.14, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-28T14:36:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-28T14:41:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-28T14:39:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-28T14:36:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-28T14:40:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-28T14:42:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Noah Wilson' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-28T14:38:00+00', 
    32, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T16:30:00+00', 
    '2025-01-06T16:43:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-06T16:31:00+00', 
    22, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T16:33:00+00', 
    '2025-01-06T16:34:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T16:00:00+00', 
    '2025-01-08T16:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-08T16:01:00+00', 
    13, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T16:02:00+00', 
    '2025-01-08T16:09:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-01-08T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-08T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-08T16:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-10T14:00:00+00', 
    '2025-01-10T14:11:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-10T14:01:00+00', 
    25, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:00:00+00', 
    '2025-01-13T16:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-13T16:01:00+00', 
    27, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:02:00+00', 
    '2025-01-13T16:10:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-01-13T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-13T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-01-13T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:03:00+00', 
    '2025-01-13T16:04:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:05:00+00', 
    '2025-01-13T16:13:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-13T16:12:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-13T16:12:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-13T16:06:00+00', 
    42, 
    now()
);

-- From chunk_082.sql
-- SQL Chunk 82
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 82/131 - Maya
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-13T16:08:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-13T16:12:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-13T16:11:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-13T16:12:00+00', 
    55, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T16:00:00+00', 
    '2025-01-15T16:24:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-15T16:01:00+00', 
    30, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:00:00+00', 
    '2025-01-17T15:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-17T15:01:00+00', 
    28, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:02:00+00', 
    '2025-01-17T15:12:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-01-17T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-01-17T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-01-17T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T15:30:00+00', 
    '2025-01-20T15:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-20T15:31:00+00', 
    8, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T15:33:00+00', 
    '2025-01-20T15:34:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T15:00:00+00', 
    '2025-01-22T15:11:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-22T15:01:00+00', 
    5, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T15:02:00+00', 
    '2025-01-22T15:11:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-01-22T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-01-22T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-01-22T15:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T15:05:00+00', 
    '2025-01-22T15:13:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.71, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-22T15:11:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-01-22T15:11:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-22T15:12:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-22T15:09:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-22T15:13:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-22T15:13:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-22T15:10:00+00', 
    22, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-24T16:00:00+00', 
    '2025-01-24T16:11:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-24T16:01:00+00', 
    16, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:30:00+00', 
    '2025-01-27T16:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-27T16:31:00+00', 
    16, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:32:00+00', 
    '2025-01-27T16:35:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-01-27T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-27T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-27T16:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:33:00+00', 
    '2025-01-27T16:34:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T16:00:00+00', 
    '2025-01-29T16:22:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-29T16:01:00+00', 
    22, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T16:30:00+00', 
    '2025-01-31T16:40:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-31T16:31:00+00', 
    14, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T16:32:00+00', 
    '2025-01-31T16:38:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-31T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-01-31T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-31T16:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T16:35:00+00', 
    '2025-01-31T16:47:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-31T16:39:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-31T16:41:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-31T16:41:00+00', 
    48, 
    now()
);

-- From chunk_083.sql
-- SQL Chunk 83
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 83/131 - Maya
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-31T16:36:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-31T16:37:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-31T16:39:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-31T16:36:00+00', 
    25, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T14:30:00+00', 
    '2025-02-03T14:53:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-03T14:31:00+00', 
    28, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T14:33:00+00', 
    '2025-02-03T14:34:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T14:00:00+00', 
    '2025-02-05T14:11:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-05T14:01:00+00', 
    20, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T14:02:00+00', 
    '2025-02-05T14:10:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-02-05T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-02-05T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-02-05T14:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T15:30:00+00', 
    '2025-02-07T15:39:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-07T15:31:00+00', 
    8, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:30:00+00', 
    '2025-02-10T16:42:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-10T16:31:00+00', 
    17, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:32:00+00', 
    '2025-02-10T16:39:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-02-10T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-02-10T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-02-10T16:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:33:00+00', 
    '2025-02-10T16:34:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:35:00+00', 
    '2025-02-10T16:42:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.86, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-10T16:43:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-10T16:42:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-02-10T16:40:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-10T16:39:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-02-10T16:36:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-02-10T16:43:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-10T16:38:00+00', 
    32, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T16:30:00+00', 
    '2025-02-12T16:50:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-12T16:31:00+00', 
    29, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T15:30:00+00', 
    '2025-02-14T15:49:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-14T15:31:00+00', 
    10, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T15:32:00+00', 
    '2025-02-14T15:40:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-02-14T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-02-14T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-02-14T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T16:30:00+00', 
    '2025-02-17T16:48:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-17T16:31:00+00', 
    15, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T16:33:00+00', 
    '2025-02-17T16:34:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T15:30:00+00', 
    '2025-02-19T15:51:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-19T15:31:00+00', 
    22, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T15:32:00+00', 
    '2025-02-19T15:41:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-02-19T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-02-19T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-02-19T15:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T15:35:00+00', 
    '2025-02-19T15:43:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.57, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-19T15:38:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-19T15:40:00+00', 
    54, 
    now()
);

-- From chunk_084.sql
-- SQL Chunk 84
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 84/131 - Maya
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-19T15:36:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-19T15:40:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-02-19T15:38:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-19T15:43:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-19T15:36:00+00', 
    25, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-21T16:30:00+00', 
    '2025-02-21T16:43:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-21T16:31:00+00', 
    24, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T16:00:00+00', 
    '2025-02-24T16:09:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-24T16:01:00+00', 
    28, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T16:02:00+00', 
    '2025-02-24T16:08:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-02-24T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-02-24T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-02-24T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T16:03:00+00', 
    '2025-02-24T16:04:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-26T14:00:00+00', 
    '2025-02-26T14:10:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-26T14:01:00+00', 
    9, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T15:00:00+00', 
    '2025-02-28T15:09:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-28T15:01:00+00', 
    21, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T15:02:00+00', 
    '2025-02-28T15:07:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-02-28T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-02-28T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-02-28T15:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T15:05:00+00', 
    '2025-02-28T15:17:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.71, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-28T15:12:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-28T15:13:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-02-28T15:07:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-28T15:06:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-02-28T15:07:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-28T15:08:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-28T15:09:00+00', 
    25, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T14:30:00+00', 
    '2025-03-03T14:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-03T14:31:00+00', 
    12, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T14:33:00+00', 
    '2025-03-03T14:34:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T15:00:00+00', 
    '2025-03-05T15:16:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-05T15:01:00+00', 
    17, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T15:02:00+00', 
    '2025-03-05T15:12:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-03-05T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-03-05T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-05T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-07T14:30:00+00', 
    '2025-03-07T14:51:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-07T14:31:00+00', 
    30, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:00:00+00', 
    '2025-03-10T14:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-10T14:01:00+00', 
    21, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:02:00+00', 
    '2025-03-10T14:06:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-03-10T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-03-10T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-03-10T14:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:03:00+00', 
    '2025-03-10T14:04:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:05:00+00', 
    '2025-03-10T14:16:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-10T14:13:00+00', 
    44, 
    now()
);

-- From chunk_085.sql
-- SQL Chunk 85
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 85/131 - Maya
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-03-10T14:13:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-10T14:09:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-03-10T14:10:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-10T14:08:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-10T14:13:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-10T14:10:00+00', 
    53, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T16:00:00+00', 
    '2025-03-12T16:17:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-12T16:01:00+00', 
    23, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T16:30:00+00', 
    '2025-03-14T16:47:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-14T16:31:00+00', 
    11, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T16:32:00+00', 
    '2025-03-14T16:38:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-03-14T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-03-14T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-14T16:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T14:00:00+00', 
    '2025-03-17T14:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-17T14:01:00+00', 
    7, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T14:03:00+00', 
    '2025-03-17T14:04:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T16:30:00+00', 
    '2025-03-19T16:41:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-19T16:31:00+00', 
    30, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T16:32:00+00', 
    '2025-03-19T16:39:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-03-19T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-03-19T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-03-19T16:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T16:35:00+00', 
    '2025-03-19T16:45:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.57, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-19T16:37:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-19T16:36:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-19T16:39:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-19T16:43:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-03-19T16:41:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-19T16:42:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-19T16:40:00+00', 
    45, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T15:30:00+00', 
    '2025-03-21T15:47:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-21T15:31:00+00', 
    23, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:00:00+00', 
    '2025-03-24T15:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-24T15:01:00+00', 
    28, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:02:00+00', 
    '2025-03-24T15:07:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-24T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-03-24T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-03-24T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:03:00+00', 
    '2025-03-24T15:04:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T16:00:00+00', 
    '2025-03-26T16:14:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-26T16:01:00+00', 
    21, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T16:00:00+00', 
    '2025-03-28T16:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-03-28T16:01:00+00', 
    28, 
    false, 
    'feeling confident about anxiety perfectionism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T16:02:00+00', 
    '2025-03-28T16:12:00+00', 
    3, 
    'learning to handle anxiety perfectionism better each day', 
    56, 
    'speech_to_text', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-03-28T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-28T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-03-28T16:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T16:05:00+00', 
    '2025-03-28T16:14:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.57, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-28T16:07:00+00', 
    45, 
    now()
);

-- From chunk_086.sql
-- SQL Chunk 86
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 86/131 - Oscar
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-28T16:11:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-28T16:09:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-03-28T16:13:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-03-28T16:06:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-28T16:13:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Olivia Brown' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-28T16:06:00+00', 
    58, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T15:30:00+00', 
    '2025-01-06T15:47:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-06T15:31:00+00', 
    15, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T15:33:00+00', 
    '2025-01-06T15:35:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T15:30:00+00', 
    '2025-01-13T15:50:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-13T15:31:00+00', 
    23, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T15:32:00+00', 
    '2025-01-13T15:42:00+00', 
    3, 
    'learning to handle dyspraxia better each day', 
    44, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-01-13T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    2, 
    '2025-01-13T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    3, 
    '2025-01-13T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T14:30:00+00', 
    '2025-01-20T14:45:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-20T14:31:00+00', 
    6, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T15:00:00+00', 
    '2025-01-27T15:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-27T15:01:00+00', 
    25, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T15:02:00+00', 
    '2025-01-27T15:07:00+00', 
    3, 
    'learning to handle dyspraxia better each day', 
    44, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-01-27T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    2, 
    '2025-01-27T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    3, 
    '2025-01-27T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T15:03:00+00', 
    '2025-01-27T15:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T15:05:00+00', 
    '2025-01-27T15:16:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.29, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-27T15:07:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-27T15:13:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-27T15:07:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-27T15:13:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-27T15:07:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-27T15:11:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-27T15:07:00+00', 
    59, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T16:30:00+00', 
    '2025-02-03T16:44:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-03T16:31:00+00', 
    24, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T15:00:00+00', 
    '2025-02-10T15:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-10T15:01:00+00', 
    9, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T15:02:00+00', 
    '2025-02-10T15:08:00+00', 
    3, 
    'learning to handle dyspraxia better each day', 
    44, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    1, 
    '2025-02-10T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    2, 
    '2025-02-10T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    3, 
    '2025-02-10T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T15:30:00+00', 
    '2025-02-17T15:38:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-17T15:31:00+00', 
    5, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T15:33:00+00', 
    '2025-02-17T15:35:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T15:30:00+00', 
    '2025-02-24T15:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-24T15:31:00+00', 
    24, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T15:32:00+00', 
    '2025-02-24T15:35:00+00', 
    3, 
    'learning to handle dyspraxia better each day', 
    44, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    1, 
    '2025-02-24T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    2, 
    '2025-02-24T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    3, 
    '2025-02-24T15:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T15:35:00+00', 
    '2025-02-24T15:44:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.0, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

-- From chunk_087.sql
-- SQL Chunk 87
-- Lines: ~747
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 87/131 - Ruby
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-24T15:42:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-24T15:41:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-02-24T15:41:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-24T15:40:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-02-24T15:40:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-24T15:42:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-24T15:36:00+00', 
    21, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T14:30:00+00', 
    '2025-03-03T14:52:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-03T14:31:00+00', 
    13, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:00:00+00', 
    '2025-03-10T14:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-10T14:01:00+00', 
    24, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:02:00+00', 
    '2025-03-10T14:10:00+00', 
    3, 
    'learning to handle dyspraxia better each day', 
    44, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    1, 
    '2025-03-10T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-03-10T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    3, 
    '2025-03-10T14:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:03:00+00', 
    '2025-03-10T14:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T16:30:00+00', 
    '2025-03-17T16:45:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-17T16:31:00+00', 
    8, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T14:00:00+00', 
    '2025-03-24T14:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-24T14:01:00+00', 
    21, 
    false, 
    'feeling confident about dyspraxia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T14:02:00+00', 
    '2025-03-24T14:05:00+00', 
    3, 
    'learning to handle dyspraxia better each day', 
    44, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    1, 
    '2025-03-24T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    2, 
    '2025-03-24T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    3, 
    '2025-03-24T14:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T14:05:00+00', 
    '2025-03-24T14:16:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.29, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-24T14:09:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-24T14:06:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-24T14:12:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-03-24T14:06:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-24T14:13:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-24T14:11:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'William Taylor' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-24T14:08:00+00', 
    60, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T15:00:00+00', 
    '2025-01-06T15:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-06T15:01:00+00', 
    12, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T15:03:00+00', 
    '2025-01-06T15:05:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-07T15:00:00+00', 
    '2025-01-07T15:14:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-07T15:01:00+00', 
    17, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-07T15:02:00+00', 
    '2025-01-07T15:10:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-07T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-01-07T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-01-07T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T14:30:00+00', 
    '2025-01-08T14:53:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-08T14:31:00+00', 
    5, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T14:00:00+00', 
    '2025-01-09T14:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-09T14:01:00+00', 
    14, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T14:02:00+00', 
    '2025-01-09T14:08:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-01-09T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-01-09T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    3, 
    '2025-01-09T14:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T14:03:00+00', 
    '2025-01-09T14:05:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

-- From chunk_088.sql
-- SQL Chunk 88
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 88/131 - Ruby
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T14:05:00+00', 
    '2025-01-09T14:17:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-09T14:12:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-09T14:08:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-09T14:08:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-09T14:11:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-09T14:13:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-09T14:13:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-09T14:09:00+00', 
    33, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-10T15:00:00+00', 
    '2025-01-10T15:19:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-10T15:01:00+00', 
    13, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T15:30:00+00', 
    '2025-01-13T15:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-13T15:31:00+00', 
    27, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T15:32:00+00', 
    '2025-01-13T15:42:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-13T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-01-13T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-01-13T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-14T14:30:00+00', 
    '2025-01-14T14:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-14T14:31:00+00', 
    22, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-14T14:33:00+00', 
    '2025-01-14T14:35:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T14:00:00+00', 
    '2025-01-15T14:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-15T14:01:00+00', 
    16, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T14:02:00+00', 
    '2025-01-15T14:12:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-01-15T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-15T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-01-15T14:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T14:05:00+00', 
    '2025-01-15T14:17:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.0, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-15T14:10:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-15T14:07:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-15T14:11:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-15T14:10:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-15T14:06:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-15T14:11:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-15T14:12:00+00', 
    28, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-16T14:30:00+00', 
    '2025-01-16T14:40:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-16T14:31:00+00', 
    29, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:00:00+00', 
    '2025-01-17T15:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-17T15:01:00+00', 
    12, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:02:00+00', 
    '2025-01-17T15:05:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-17T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-17T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-01-17T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:03:00+00', 
    '2025-01-17T15:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T15:00:00+00', 
    '2025-01-20T15:19:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-20T15:01:00+00', 
    7, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T16:00:00+00', 
    '2025-01-21T16:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-21T16:01:00+00', 
    28, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T16:02:00+00', 
    '2025-01-21T16:06:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-01-21T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-01-21T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-01-21T16:05:00+00', 
    now()
);

-- From chunk_089.sql
-- SQL Chunk 89
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 89/131 - Ruby
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T16:05:00+00', 
    '2025-01-21T16:12:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.86, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-21T16:09:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-21T16:07:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-21T16:08:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-21T16:10:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-21T16:13:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-21T16:06:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-21T16:08:00+00', 
    37, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T15:00:00+00', 
    '2025-01-22T15:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-22T15:01:00+00', 
    26, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T15:03:00+00', 
    '2025-01-22T15:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-23T14:00:00+00', 
    '2025-01-23T14:16:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-23T14:01:00+00', 
    10, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-23T14:02:00+00', 
    '2025-01-23T14:08:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-23T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    2, 
    '2025-01-23T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    3, 
    '2025-01-23T14:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-24T16:00:00+00', 
    '2025-01-24T16:16:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-24T16:01:00+00', 
    26, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:00:00+00', 
    '2025-01-27T16:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-27T16:01:00+00', 
    21, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:02:00+00', 
    '2025-01-27T16:07:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-01-27T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-27T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-01-27T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:03:00+00', 
    '2025-01-27T16:05:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:05:00+00', 
    '2025-01-27T16:13:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-27T16:11:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-27T16:10:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-27T16:09:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-27T16:11:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-27T16:08:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-27T16:12:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-27T16:06:00+00', 
    57, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-28T16:00:00+00', 
    '2025-01-28T16:22:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-28T16:01:00+00', 
    23, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T16:00:00+00', 
    '2025-01-29T16:14:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-29T16:01:00+00', 
    21, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T16:02:00+00', 
    '2025-01-29T16:09:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-29T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    2, 
    '2025-01-29T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-01-29T16:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-30T16:00:00+00', 
    '2025-01-30T16:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-30T16:01:00+00', 
    15, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-30T16:03:00+00', 
    '2025-01-30T16:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T15:00:00+00', 
    '2025-01-31T15:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-31T15:01:00+00', 
    16, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T15:02:00+00', 
    '2025-01-31T15:05:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-01-31T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-31T15:04:00+00', 
    now()
);

-- From chunk_090.sql
-- SQL Chunk 90
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 90/131 - Ruby
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    3, 
    '2025-01-31T15:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T15:05:00+00', 
    '2025-01-31T15:15:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.14, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-31T15:10:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-31T15:06:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-31T15:11:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-31T15:09:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-31T15:06:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-31T15:08:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-31T15:07:00+00', 
    39, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T14:30:00+00', 
    '2025-02-03T14:38:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-03T14:31:00+00', 
    30, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T14:00:00+00', 
    '2025-02-04T14:11:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-04T14:01:00+00', 
    25, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T14:02:00+00', 
    '2025-02-04T14:10:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-02-04T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    2, 
    '2025-02-04T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-02-04T14:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T14:03:00+00', 
    '2025-02-04T14:05:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T14:30:00+00', 
    '2025-02-05T14:43:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-05T14:31:00+00', 
    21, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-06T14:00:00+00', 
    '2025-02-06T14:19:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-06T14:01:00+00', 
    18, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-06T14:02:00+00', 
    '2025-02-06T14:08:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-02-06T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-02-06T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-02-06T14:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-06T14:05:00+00', 
    '2025-02-06T14:17:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.14, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-02-06T14:12:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-06T14:08:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-06T14:09:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-06T14:06:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-06T14:11:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-06T14:13:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-06T14:08:00+00', 
    39, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T14:00:00+00', 
    '2025-02-07T14:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-07T14:01:00+00', 
    19, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T14:03:00+00', 
    '2025-02-07T14:05:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:00:00+00', 
    '2025-02-10T16:25:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-10T16:01:00+00', 
    7, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:02:00+00', 
    '2025-02-10T16:08:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    1, 
    '2025-02-10T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-02-10T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    3, 
    '2025-02-10T16:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-11T16:00:00+00', 
    '2025-02-11T16:13:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-11T16:01:00+00', 
    19, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T15:00:00+00', 
    '2025-02-12T15:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-12T15:01:00+00', 
    18, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T15:02:00+00', 
    '2025-02-12T15:10:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
    51, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    true
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-02-12T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sophia Martinez' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-02-12T15:04:00+00', 
    now()
);
