-- Combined SQL Batch 2
-- Contains chunks 11 to 20


-- From chunk_011.sql
-- SQL Chunk 11
-- Lines: ~747
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 11/131 - Kai
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-18T13:21:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-02-18T13:15:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-18T13:15:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-18T13:22:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-18T13:20:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-02-18T13:22:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-18T13:20:00+00', 
    50, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T12:52:00+00', 
    '2025-02-19T13:02:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-19T12:53:00+00', 
    25, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-20T15:26:00+00', 
    '2025-02-20T15:41:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-20T15:27:00+00', 
    20, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-20T15:28:00+00', 
    '2025-02-20T15:35:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-02-20T15:29:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-02-20T15:30:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-02-20T15:31:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-20T15:29:00+00', 
    '2025-02-20T15:30:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-21T12:36:00+00', 
    '2025-02-21T12:45:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-21T12:37:00+00', 
    27, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T12:56:00+00', 
    '2025-02-24T13:05:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-24T12:57:00+00', 
    30, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T12:58:00+00', 
    '2025-02-24T13:08:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-02-24T12:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-02-24T13:00:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-02-24T13:01:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T13:01:00+00', 
    '2025-02-24T13:10:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.0, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-02-24T13:04:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-24T13:04:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-02-24T13:06:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-24T13:05:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-02-24T13:04:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-02-24T13:08:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-24T13:09:00+00', 
    30, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-25T11:43:00+00', 
    '2025-02-25T11:57:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-25T11:44:00+00', 
    19, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-25T11:46:00+00', 
    '2025-02-25T11:49:00+00', 
    180, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-26T16:48:00+00', 
    '2025-02-26T16:56:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'ok', 
    3, 
    '2025-02-26T16:49:00+00', 
    12, 
    false, 
    'learning to manage surgery recovery better', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-26T16:50:00+00', 
    '2025-02-26T16:59:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-02-26T16:51:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-02-26T16:52:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-02-26T16:53:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-27T11:57:00+00', 
    '2025-02-27T12:11:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'ok', 
    3, 
    '2025-02-27T11:58:00+00', 
    23, 
    false, 
    'learning to manage surgery recovery better', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T10:45:00+00', 
    '2025-02-28T11:06:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-28T10:46:00+00', 
    27, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T10:47:00+00', 
    '2025-02-28T10:53:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-02-28T10:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-02-28T10:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-02-28T10:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T10:48:00+00', 
    '2025-02-28T10:51:00+00', 
    180, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

-- From chunk_012.sql
-- SQL Chunk 12
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 12/131 - Kai
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T10:50:00+00', 
    '2025-02-28T10:56:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-02-28T10:51:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-28T10:51:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-28T10:58:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-28T10:57:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-02-28T10:57:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-28T10:56:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-28T10:56:00+00', 
    49, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T14:22:00+00', 
    '2025-03-03T14:31:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-03T14:23:00+00', 
    24, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-04T12:03:00+00', 
    '2025-03-04T12:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-04T12:04:00+00', 
    19, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-04T12:05:00+00', 
    '2025-03-04T12:13:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-03-04T12:06:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-04T12:07:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-03-04T12:08:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T14:43:00+00', 
    '2025-03-05T15:02:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-05T14:44:00+00', 
    23, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T14:46:00+00', 
    '2025-03-05T14:49:00+00', 
    180, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-06T10:56:00+00', 
    '2025-03-06T11:07:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-06T10:57:00+00', 
    29, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-06T10:58:00+00', 
    '2025-03-06T11:01:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-03-06T10:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-03-06T11:00:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-03-06T11:01:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-06T11:01:00+00', 
    '2025-03-06T11:12:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.71, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-06T11:05:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-06T11:07:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-06T11:09:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-06T11:09:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-03-06T11:09:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-06T11:02:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-03-06T11:07:00+00', 
    26, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-07T13:54:00+00', 
    '2025-03-07T14:18:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-07T13:55:00+00', 
    20, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:58:00+00', 
    '2025-03-10T15:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-10T14:59:00+00', 
    28, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T15:00:00+00', 
    '2025-03-10T15:05:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-03-10T15:01:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-03-10T15:02:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-10T15:03:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T15:01:00+00', 
    '2025-03-10T15:04:00+00', 
    180, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-11T13:05:00+00', 
    '2025-03-11T13:26:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-11T13:06:00+00', 
    25, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T12:05:00+00', 
    '2025-03-12T12:30:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-12T12:06:00+00', 
    15, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T12:07:00+00', 
    '2025-03-12T12:12:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-12T12:08:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-03-12T12:09:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-12T12:10:00+00', 
    now()
);

-- From chunk_013.sql
-- SQL Chunk 13
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 13/131 - Kai
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T12:10:00+00', 
    '2025-03-12T12:21:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-12T12:14:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-12T12:14:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-12T12:15:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-12T12:12:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-12T12:17:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-12T12:13:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-12T12:15:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-13T13:45:00+00', 
    '2025-03-13T14:05:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-13T13:46:00+00', 
    13, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-13T13:48:00+00', 
    '2025-03-13T13:49:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T12:35:00+00', 
    '2025-03-14T12:49:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-14T12:36:00+00', 
    20, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T12:37:00+00', 
    '2025-03-14T12:44:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-03-14T12:38:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-03-14T12:39:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-14T12:40:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T17:39:00+00', 
    '2025-03-17T17:59:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-17T17:40:00+00', 
    10, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-18T14:51:00+00', 
    '2025-03-18T15:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-18T14:52:00+00', 
    29, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-18T14:53:00+00', 
    '2025-03-18T14:56:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-03-18T14:54:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-03-18T14:55:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-03-18T14:56:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-18T14:54:00+00', 
    '2025-03-18T14:55:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-18T14:56:00+00', 
    '2025-03-18T15:07:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-18T15:02:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-18T15:03:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-18T15:02:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-18T15:00:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-03-18T15:04:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-18T15:04:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-03-18T14:59:00+00', 
    33, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T10:37:00+00', 
    '2025-03-19T10:50:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-19T10:38:00+00', 
    28, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-20T16:09:00+00', 
    '2025-03-20T16:29:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-20T16:10:00+00', 
    24, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-20T16:11:00+00', 
    '2025-03-20T16:19:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-03-20T16:12:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-20T16:13:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-03-20T16:14:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T10:07:00+00', 
    '2025-03-21T10:25:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-21T10:08:00+00', 
    23, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T10:10:00+00', 
    '2025-03-21T10:11:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T10:12:00+00', 
    '2025-03-24T10:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-24T10:13:00+00', 
    26, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T10:14:00+00', 
    '2025-03-24T10:19:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-03-24T10:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-03-24T10:16:00+00', 
    now()
);

-- From chunk_014.sql
-- SQL Chunk 14
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 14/131 - Mia
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-24T10:17:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T10:17:00+00', 
    '2025-03-24T10:28:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-24T10:19:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-03-24T10:20:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-24T10:25:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-24T10:24:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-24T10:25:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-24T10:21:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-24T10:19:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-25T15:50:00+00', 
    '2025-03-25T16:01:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-25T15:51:00+00', 
    29, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T17:11:00+00', 
    '2025-03-26T17:32:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-26T17:12:00+00', 
    15, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T17:13:00+00', 
    '2025-03-26T17:22:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-03-26T17:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-03-26T17:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-03-26T17:16:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T17:14:00+00', 
    '2025-03-26T17:15:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-27T17:41:00+00', 
    '2025-03-27T17:55:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-27T17:42:00+00', 
    16, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T17:37:00+00', 
    '2025-03-28T17:59:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-28T17:38:00+00', 
    21, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T17:39:00+00', 
    '2025-03-28T17:42:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-03-28T17:40:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-03-28T17:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-03-28T17:42:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T17:42:00+00', 
    '2025-03-28T17:49:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-28T17:43:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-03-28T17:44:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-28T17:49:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-03-28T17:50:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-28T17:48:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-28T17:48:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-28T17:48:00+00', 
    22, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T12:23:00+00', 
    '2025-01-06T12:40:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-06T12:24:00+00', 
    16, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T12:26:00+00', 
    '2025-01-06T12:27:15+00', 
    75, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T16:03:00+00', 
    '2025-01-08T16:11:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-08T16:04:00+00', 
    24, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T16:05:00+00', 
    '2025-01-08T16:09:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-01-08T16:06:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    2, 
    '2025-01-08T16:07:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-01-08T16:08:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-10T10:27:00+00', 
    '2025-01-10T10:49:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-10T10:28:00+00', 
    8, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:11:00+00', 
    '2025-01-13T16:27:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-13T16:12:00+00', 
    6, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:13:00+00', 
    '2025-01-13T16:23:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    1, 
    '2025-01-13T16:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-01-13T16:15:00+00', 
    now()
);

-- From chunk_015.sql
-- SQL Chunk 15
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 15/131 - Mia
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-01-13T16:16:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:14:00+00', 
    '2025-01-13T16:15:15+00', 
    75, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:16:00+00', 
    '2025-01-13T16:22:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.71, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-13T16:21:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-13T16:17:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-13T16:21:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-13T16:24:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-13T16:23:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-13T16:17:00+00', 
    32, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-13T16:22:00+00', 
    59, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T12:09:00+00', 
    '2025-01-15T12:26:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-15T12:10:00+00', 
    27, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:40:00+00', 
    '2025-01-17T15:56:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-17T15:41:00+00', 
    19, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:42:00+00', 
    '2025-01-17T15:46:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-01-17T15:43:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-17T15:44:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-01-17T15:45:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T17:41:00+00', 
    '2025-01-20T18:04:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-20T17:42:00+00', 
    17, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T17:44:00+00', 
    '2025-01-20T17:46:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T13:16:00+00', 
    '2025-01-22T13:36:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-22T13:17:00+00', 
    12, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T13:18:00+00', 
    '2025-01-22T13:27:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-01-22T13:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-22T13:20:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    3, 
    '2025-01-22T13:21:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T13:21:00+00', 
    '2025-01-22T13:27:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.71, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-22T13:22:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-01-22T13:22:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-22T13:25:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-22T13:27:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-01-22T13:27:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-22T13:26:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-22T13:26:00+00', 
    49, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-24T12:07:00+00', 
    '2025-01-24T12:19:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-24T12:08:00+00', 
    30, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:28:00+00', 
    '2025-01-27T18:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-27T18:29:00+00', 
    15, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:30:00+00', 
    '2025-01-27T18:36:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    1, 
    '2025-01-27T18:31:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-01-27T18:32:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-01-27T18:33:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:31:00+00', 
    '2025-01-27T18:33:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T18:57:00+00', 
    '2025-01-29T19:22:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-29T18:58:00+00', 
    26, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T12:00:00+00', 
    '2025-01-31T12:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-31T12:01:00+00', 
    8, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T12:02:00+00', 
    '2025-01-31T12:09:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-31T12:03:00+00', 
    now()
);

-- From chunk_016.sql
-- SQL Chunk 16
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 16/131 - Mia
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-01-31T12:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-01-31T12:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T12:05:00+00', 
    '2025-01-31T12:12:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-31T12:09:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-31T12:09:00+00', 
    26, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-31T12:07:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-31T12:13:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-31T12:12:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-31T12:06:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-31T12:09:00+00', 
    37, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T12:57:00+00', 
    '2025-02-03T13:05:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-03T12:58:00+00', 
    21, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T13:00:00+00', 
    '2025-02-03T13:02:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T10:12:00+00', 
    '2025-02-05T10:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-05T10:13:00+00', 
    24, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T10:14:00+00', 
    '2025-02-05T10:23:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-02-05T10:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-02-05T10:16:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-02-05T10:17:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T13:53:00+00', 
    '2025-02-07T14:17:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-07T13:54:00+00', 
    25, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:39:00+00', 
    '2025-02-10T17:03:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-10T16:40:00+00', 
    10, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:41:00+00', 
    '2025-02-10T16:47:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-02-10T16:42:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    2, 
    '2025-02-10T16:43:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-02-10T16:44:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:42:00+00', 
    '2025-02-10T16:44:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T16:44:00+00', 
    '2025-02-10T16:53:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-10T16:51:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-10T16:50:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-02-10T16:48:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-10T16:50:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-02-10T16:50:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-10T16:46:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-02-10T16:51:00+00', 
    52, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T14:17:00+00', 
    '2025-02-12T14:28:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-12T14:18:00+00', 
    8, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T11:22:00+00', 
    '2025-02-14T11:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-14T11:23:00+00', 
    18, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T11:24:00+00', 
    '2025-02-14T11:32:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-02-14T11:25:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-02-14T11:26:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    3, 
    '2025-02-14T11:27:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T11:01:00+00', 
    '2025-02-17T11:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-17T11:02:00+00', 
    24, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T11:04:00+00', 
    '2025-02-17T11:06:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T17:54:00+00', 
    '2025-02-19T18:06:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-19T17:55:00+00', 
    13, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T17:56:00+00', 
    '2025-02-19T17:59:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

-- From chunk_017.sql
-- SQL Chunk 17
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 17/131 - Mia
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-02-19T17:57:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-02-19T17:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-02-19T17:59:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T17:59:00+00', 
    '2025-02-19T18:05:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-02-19T18:01:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-19T18:03:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-19T18:06:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-19T18:00:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-02-19T18:02:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-19T18:03:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-19T18:00:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-21T11:14:00+00', 
    '2025-02-21T11:22:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-21T11:15:00+00', 
    11, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T13:20:00+00', 
    '2025-02-24T13:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-24T13:21:00+00', 
    20, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T13:22:00+00', 
    '2025-02-24T13:27:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-02-24T13:23:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-02-24T13:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    3, 
    '2025-02-24T13:25:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T13:23:00+00', 
    '2025-02-24T13:28:00+00', 
    300, 
    'box_breathing', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-26T13:08:00+00', 
    '2025-02-26T13:27:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-26T13:09:00+00', 
    21, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T10:55:00+00', 
    '2025-02-28T11:15:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-28T10:56:00+00', 
    10, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T10:57:00+00', 
    '2025-02-28T11:04:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    1, 
    '2025-02-28T10:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-02-28T10:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-02-28T11:00:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T11:00:00+00', 
    '2025-02-28T11:11:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-28T11:03:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-02-28T11:04:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-28T11:07:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-28T11:04:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-02-28T11:08:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-02-28T11:02:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-28T11:06:00+00', 
    56, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T13:05:00+00', 
    '2025-03-03T13:29:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-03-03T13:06:00+00', 
    30, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T13:08:00+00', 
    '2025-03-03T13:13:00+00', 
    300, 
    'basic_inhale_exhale', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T18:37:00+00', 
    '2025-03-05T18:51:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-03-05T18:38:00+00', 
    7, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T18:39:00+00', 
    '2025-03-05T18:42:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    1, 
    '2025-03-05T18:40:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    2, 
    '2025-03-05T18:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-03-05T18:42:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-07T13:09:00+00', 
    '2025-03-07T13:26:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-07T13:10:00+00', 
    30, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:02:00+00', 
    '2025-03-10T11:13:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-10T11:03:00+00', 
    12, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:04:00+00', 
    '2025-03-10T11:07:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

-- From chunk_018.sql
-- SQL Chunk 18
-- Lines: ~745
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 18/131 - Mia
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-03-10T11:05:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-03-10T11:06:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-03-10T11:07:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:05:00+00', 
    '2025-03-10T11:07:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:07:00+00', 
    '2025-03-10T11:17:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.14, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-03-10T11:12:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-10T11:08:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-10T11:08:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-10T11:10:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-03-10T11:11:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-10T11:12:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-10T11:12:00+00', 
    57, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T13:14:00+00', 
    '2025-03-12T13:32:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-12T13:15:00+00', 
    21, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T14:13:00+00', 
    '2025-03-14T14:25:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-14T14:14:00+00', 
    24, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T14:15:00+00', 
    '2025-03-14T14:25:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-03-14T14:16:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    2, 
    '2025-03-14T14:17:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    3, 
    '2025-03-14T14:18:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T10:19:00+00', 
    '2025-03-17T10:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-17T10:20:00+00', 
    18, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T10:22:00+00', 
    '2025-03-17T10:24:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T14:55:00+00', 
    '2025-03-19T15:06:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-19T14:56:00+00', 
    22, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T14:57:00+00', 
    '2025-03-19T15:05:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    1, 
    '2025-03-19T14:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-03-19T14:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    3, 
    '2025-03-19T15:00:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T15:00:00+00', 
    '2025-03-19T15:09:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-19T15:03:00+00', 
    26, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-03-19T15:02:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-19T15:02:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-19T15:04:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-19T15:01:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-19T15:08:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-19T15:08:00+00', 
    46, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T10:47:00+00', 
    '2025-03-21T10:58:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-21T10:48:00+00', 
    6, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T17:21:00+00', 
    '2025-03-24T17:33:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-03-24T17:22:00+00', 
    20, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T17:23:00+00', 
    '2025-03-24T17:29:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-03-24T17:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    2, 
    '2025-03-24T17:25:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-03-24T17:26:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T17:24:00+00', 
    '2025-03-24T17:26:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T16:43:00+00', 
    '2025-03-26T17:04:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-26T16:44:00+00', 
    18, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T17:03:00+00', 
    '2025-03-28T17:27:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-28T17:04:00+00', 
    6, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

-- From chunk_019.sql
-- SQL Chunk 19
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 19/131 - Ethan
INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T17:05:00+00', 
    '2025-03-28T17:13:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-03-28T17:06:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-03-28T17:07:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-03-28T17:08:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T17:08:00+00', 
    '2025-03-28T17:18:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.14, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-03-28T17:09:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-03-28T17:12:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-28T17:16:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-28T17:15:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-28T17:14:00+00', 
    26, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-28T17:09:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-03-28T17:09:00+00', 
    28, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T16:46:00+00', 
    '2025-01-06T17:01:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-06T16:47:00+00', 
    9, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T16:49:00+00', 
    '2025-01-06T16:50:15+00', 
    75, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T18:55:00+00', 
    '2025-01-08T19:06:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-08T18:56:00+00', 
    18, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T18:57:00+00', 
    '2025-01-08T19:02:00+00', 
    3, 
    'learning to handle leukemia better each day', 
    43, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    1, 
    '2025-01-08T18:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    2, 
    '2025-01-08T18:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    3, 
    '2025-01-08T19:00:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-10T12:45:00+00', 
    '2025-01-10T12:59:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-10T12:46:00+00', 
    13, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T14:27:00+00', 
    '2025-01-13T14:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-13T14:28:00+00', 
    11, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T14:29:00+00', 
    '2025-01-13T14:34:00+00', 
    3, 
    'learning to handle leukemia better each day', 
    43, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    1, 
    '2025-01-13T14:30:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    2, 
    '2025-01-13T14:31:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    3, 
    '2025-01-13T14:32:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T14:30:00+00', 
    '2025-01-13T14:31:15+00', 
    75, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T14:32:00+00', 
    '2025-01-13T14:39:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-13T14:36:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-13T14:34:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-13T14:37:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-13T14:37:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-01-13T14:37:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-13T14:33:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-13T14:34:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T16:24:00+00', 
    '2025-01-15T16:42:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-15T16:25:00+00', 
    28, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T12:27:00+00', 
    '2025-01-17T12:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-17T12:28:00+00', 
    11, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T12:29:00+00', 
    '2025-01-17T12:34:00+00', 
    3, 
    'learning to handle leukemia better each day', 
    43, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    1, 
    '2025-01-17T12:30:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    2, 
    '2025-01-17T12:31:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    3, 
    '2025-01-17T12:32:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T14:03:00+00', 
    '2025-01-20T14:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-20T14:04:00+00', 
    18, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T14:06:00+00', 
    '2025-01-20T14:08:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T18:27:00+00', 
    '2025-01-22T18:41:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

-- From chunk_020.sql
-- SQL Chunk 20
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 20/131 - Ethan
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-22T18:28:00+00', 
    24, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T18:29:00+00', 
    '2025-01-22T18:33:00+00', 
    3, 
    'learning to handle leukemia better each day', 
    43, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    1, 
    '2025-01-22T18:30:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    2, 
    '2025-01-22T18:31:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    3, 
    '2025-01-22T18:32:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T18:32:00+00', 
    '2025-01-22T18:44:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-22T18:35:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-22T18:40:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-22T18:40:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-22T18:34:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-22T18:39:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-22T18:33:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-22T18:38:00+00', 
    40, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-24T12:20:00+00', 
    '2025-01-24T12:43:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-24T12:21:00+00', 
    9, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:16:00+00', 
    '2025-01-27T18:34:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-27T18:17:00+00', 
    7, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:18:00+00', 
    '2025-01-27T18:25:00+00', 
    3, 
    'learning to handle leukemia better each day', 
    43, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    1, 
    '2025-01-27T18:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    2, 
    '2025-01-27T18:20:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    3, 
    '2025-01-27T18:21:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:19:00+00', 
    '2025-01-27T18:21:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T17:32:00+00', 
    '2025-01-29T17:54:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-29T17:33:00+00', 
    30, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T18:24:00+00', 
    '2025-01-31T18:33:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-31T18:25:00+00', 
    5, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T18:26:00+00', 
    '2025-01-31T18:34:00+00', 
    3, 
    'learning to handle leukemia better each day', 
    43, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    1, 
    '2025-01-31T18:27:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    2, 
    '2025-01-31T18:28:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    3, 
    '2025-01-31T18:29:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T18:29:00+00', 
    '2025-01-31T18:37:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-31T18:33:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-31T18:30:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-31T18:35:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-31T18:37:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-31T18:36:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-31T18:32:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-31T18:30:00+00', 
    39, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T16:26:00+00', 
    '2025-02-03T16:48:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-03T16:27:00+00', 
    28, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T16:29:00+00', 
    '2025-02-03T16:31:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T12:31:00+00', 
    '2025-02-05T12:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-05T12:32:00+00', 
    21, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T12:33:00+00', 
    '2025-02-05T12:40:00+00', 
    3, 
    'learning to handle leukemia better each day', 
    43, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    1, 
    '2025-02-05T12:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    2, 
    '2025-02-05T12:35:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    3, 
    '2025-02-05T12:36:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T14:38:00+00', 
    '2025-02-07T14:59:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-07T14:39:00+00', 
    21, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T11:13:00+00', 
    '2025-02-10T11:38:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);
