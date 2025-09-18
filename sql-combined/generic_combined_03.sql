-- Combined SQL Batch 3
-- Contains chunks 21 to 30


-- From chunk_021.sql
-- SQL Chunk 21
-- Lines: ~752
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 21/131 - Ethan
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-10T11:14:00+00', 
    29, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T11:15:00+00', 
    '2025-02-10T11:24:00+00', 
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
    '2025-02-10T11:16:00+00', 
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
    '2025-02-10T11:17:00+00', 
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
    3, 
    '2025-02-10T11:18:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T11:16:00+00', 
    '2025-02-10T11:18:30+00', 
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
    '2025-02-10T11:18:00+00', 
    '2025-02-10T11:25:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-10T11:23:00+00', 
    49, 
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
    '2025-02-10T11:24:00+00', 
    60, 
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
    '2025-02-10T11:21:00+00', 
    51, 
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
    '2025-02-10T11:24:00+00', 
    43, 
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
    '2025-02-10T11:20:00+00', 
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
    '2025-02-10T11:24:00+00', 
    26, 
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
    '2025-02-10T11:20:00+00', 
    35, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T14:44:00+00', 
    '2025-02-12T15:03:00+00', 
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
    '2025-02-12T14:45:00+00', 
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
    '2025-02-14T16:45:00+00', 
    '2025-02-14T16:58:00+00', 
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
    '2025-02-14T16:46:00+00', 
    28, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T16:47:00+00', 
    '2025-02-14T16:57:00+00', 
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
    '2025-02-14T16:48:00+00', 
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
    '2025-02-14T16:49:00+00', 
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
    '2025-02-14T16:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T10:32:00+00', 
    '2025-02-17T10:57:00+00', 
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
    '2025-02-17T10:33:00+00', 
    25, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T10:35:00+00', 
    '2025-02-17T10:37:30+00', 
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
    '2025-02-19T14:17:00+00', 
    '2025-02-19T14:41:00+00', 
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
    '2025-02-19T14:18:00+00', 
    6, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T14:19:00+00', 
    '2025-02-19T14:26:00+00', 
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
    '2025-02-19T14:20:00+00', 
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
    '2025-02-19T14:21:00+00', 
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
    3, 
    '2025-02-19T14:22:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T14:22:00+00', 
    '2025-02-19T14:33:00+00', 
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
    '2025-02-19T14:30:00+00', 
    58, 
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
    '2025-02-19T14:25:00+00', 
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
    '2025-02-19T14:28:00+00', 
    33, 
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
    '2025-02-19T14:23:00+00', 
    26, 
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
    '2025-02-19T14:30:00+00', 
    58, 
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
    '2025-02-19T14:25:00+00', 
    43, 
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
    '2025-02-19T14:25:00+00', 
    39, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-21T15:23:00+00', 
    '2025-02-21T15:48:00+00', 
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
    '2025-02-21T15:24:00+00', 
    16, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T18:39:00+00', 
    '2025-02-24T18:51:00+00', 
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
    '2025-02-24T18:40:00+00', 
    16, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T18:41:00+00', 
    '2025-02-24T18:45:00+00', 
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
    '2025-02-24T18:42:00+00', 
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
    '2025-02-24T18:43:00+00', 
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
    3, 
    '2025-02-24T18:44:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T18:42:00+00', 
    '2025-02-24T18:47:00+00', 
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
    '2025-02-26T15:38:00+00', 
    '2025-02-26T16:00:00+00', 
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
    '2025-02-26T15:39:00+00', 
    19, 
    false, 
    'feeling confident about leukemia', 
    now()
);

-- From chunk_022.sql
-- SQL Chunk 22
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 22/131 - Ethan
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T13:10:00+00', 
    '2025-02-28T13:23:00+00', 
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
    '2025-02-28T13:11:00+00', 
    19, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T13:12:00+00', 
    '2025-02-28T13:18:00+00', 
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
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    1, 
    '2025-02-28T13:13:00+00', 
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
    2, 
    '2025-02-28T13:14:00+00', 
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
    '2025-02-28T13:15:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T13:15:00+00', 
    '2025-02-28T13:25:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-28T13:22:00+00', 
    53, 
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
    '2025-02-28T13:23:00+00', 
    21, 
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
    '2025-02-28T13:21:00+00', 
    20, 
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
    '2025-02-28T13:19:00+00', 
    22, 
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
    '2025-02-28T13:21:00+00', 
    40, 
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
    '2025-02-28T13:17:00+00', 
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
    '2025-02-28T13:17:00+00', 
    36, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T12:43:00+00', 
    '2025-03-03T13:02:00+00', 
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
    '2025-03-03T12:44:00+00', 
    27, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T12:46:00+00', 
    '2025-03-03T12:51:00+00', 
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
    '2025-03-05T15:03:00+00', 
    '2025-03-05T15:27:00+00', 
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
    '2025-03-05T15:04:00+00', 
    23, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T15:05:00+00', 
    '2025-03-05T15:14:00+00', 
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
    '2025-03-05T15:06:00+00', 
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
    '2025-03-05T15:07:00+00', 
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
    3, 
    '2025-03-05T15:08:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-07T11:22:00+00', 
    '2025-03-07T11:30:00+00', 
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
    '2025-03-07T11:23:00+00', 
    25, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:07:00+00', 
    '2025-03-10T14:16:00+00', 
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
    '2025-03-10T14:08:00+00', 
    27, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:09:00+00', 
    '2025-03-10T14:15:00+00', 
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
    '2025-03-10T14:10:00+00', 
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
    2, 
    '2025-03-10T14:11:00+00', 
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
    3, 
    '2025-03-10T14:12:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:10:00+00', 
    '2025-03-10T14:12:30+00', 
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
    '2025-03-10T14:12:00+00', 
    '2025-03-10T14:23:00+00', 
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
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-03-10T14:20:00+00', 
    46, 
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
    '2025-03-10T14:17:00+00', 
    21, 
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
    '2025-03-10T14:15:00+00', 
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
    '2025-03-10T14:18:00+00', 
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
    '2025-03-10T14:19:00+00', 
    49, 
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
    '2025-03-10T14:20:00+00', 
    41, 
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
    '2025-03-10T14:17:00+00', 
    57, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T12:43:00+00', 
    '2025-03-12T12:52:00+00', 
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
    '2025-03-12T12:44:00+00', 
    29, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T16:57:00+00', 
    '2025-03-14T17:18:00+00', 
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
    '2025-03-14T16:58:00+00', 
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
    '2025-03-14T16:59:00+00', 
    '2025-03-14T17:08:00+00', 
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
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    1, 
    '2025-03-14T17:00:00+00', 
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
    2, 
    '2025-03-14T17:01:00+00', 
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
    3, 
    '2025-03-14T17:02:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T12:23:00+00', 
    '2025-03-17T12:41:00+00', 
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
    '2025-03-17T12:24:00+00', 
    22, 
    false, 
    'feeling confident about leukemia', 
    now()
);

-- From chunk_023.sql
-- SQL Chunk 23
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 23/131 - Zara
INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T12:26:00+00', 
    '2025-03-17T12:28:30+00', 
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
    '2025-03-19T18:13:00+00', 
    '2025-03-19T18:37:00+00', 
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
    '2025-03-19T18:14:00+00', 
    25, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T18:15:00+00', 
    '2025-03-19T18:19:00+00', 
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
    '2025-03-19T18:16:00+00', 
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
    2, 
    '2025-03-19T18:17:00+00', 
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
    '2025-03-19T18:18:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T18:18:00+00', 
    '2025-03-19T18:30:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.86, 
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
    '2025-03-19T18:19:00+00', 
    36, 
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
    '2025-03-19T18:24:00+00', 
    50, 
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
    '2025-03-19T18:25:00+00', 
    28, 
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
    '2025-03-19T18:25:00+00', 
    41, 
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
    '2025-03-19T18:19:00+00', 
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
    '2025-03-19T18:22:00+00', 
    24, 
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
    '2025-03-19T18:22:00+00', 
    40, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T12:23:00+00', 
    '2025-03-21T12:41:00+00', 
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
    '2025-03-21T12:24:00+00', 
    7, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T18:56:00+00', 
    '2025-03-24T19:05:00+00', 
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
    '2025-03-24T18:57:00+00', 
    29, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T18:58:00+00', 
    '2025-03-24T19:01:00+00', 
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
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    1, 
    '2025-03-24T18:59:00+00', 
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
    '2025-03-24T19:00:00+00', 
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
    3, 
    '2025-03-24T19:01:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T18:59:00+00', 
    '2025-03-24T19:01:30+00', 
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
    '2025-03-26T14:11:00+00', 
    '2025-03-26T14:32:00+00', 
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
    '2025-03-26T14:12:00+00', 
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
    '2025-03-28T15:29:00+00', 
    '2025-03-28T15:51:00+00', 
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
    '2025-03-28T15:30:00+00', 
    23, 
    false, 
    'feeling confident about leukemia', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T15:31:00+00', 
    '2025-03-28T15:39:00+00', 
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
    '2025-03-28T15:32:00+00', 
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
    '2025-03-28T15:33:00+00', 
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
    '2025-03-28T15:34:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T15:34:00+00', 
    '2025-03-28T15:44:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-28T15:37:00+00', 
    36, 
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
    '2025-03-28T15:39:00+00', 
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
    '2025-03-28T15:40:00+00', 
    45, 
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
    '2025-03-28T15:35:00+00', 
    44, 
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
    '2025-03-28T15:37:00+00', 
    36, 
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
    '2025-03-28T15:40:00+00', 
    51, 
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
    '2025-03-28T15:35:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T18:42:00+00', 
    '2025-01-06T18:51:00+00', 
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
    '2025-01-06T18:43:00+00', 
    27, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T18:45:00+00', 
    '2025-01-06T18:45:45+00', 
    45, 
    'box_breathing', 
    2, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T12:33:00+00', 
    '2025-01-13T12:44:00+00', 
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
    '2025-01-13T12:34:00+00', 
    23, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T12:35:00+00', 
    '2025-01-13T12:38:00+00', 
    3, 
    'learning to handle accident trauma better each day', 
    50, 
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
    '2025-01-13T12:36:00+00', 
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
    '2025-01-13T12:37:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    3, 
    '2025-01-13T12:38:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T14:13:00+00', 
    '2025-01-20T14:37:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

-- From chunk_024.sql
-- SQL Chunk 24
-- Lines: ~752
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 24/131 - Zara
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-20T14:14:00+00', 
    18, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T11:53:00+00', 
    '2025-01-27T12:09:00+00', 
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
    '2025-01-27T11:54:00+00', 
    12, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T11:55:00+00', 
    '2025-01-27T12:03:00+00', 
    3, 
    'learning to handle accident trauma better each day', 
    50, 
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
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    1, 
    '2025-01-27T11:56:00+00', 
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
    '2025-01-27T11:57:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    3, 
    '2025-01-27T11:58:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T11:56:00+00', 
    '2025-01-27T11:57:30+00', 
    90, 
    'box_breathing', 
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
    '2025-01-27T11:58:00+00', 
    '2025-01-27T12:09:00+00', 
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
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-27T12:03:00+00', 
    47, 
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
    '2025-01-27T11:59:00+00', 
    55, 
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
    '2025-01-27T12:05:00+00', 
    49, 
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
    '2025-01-27T11:59:00+00', 
    21, 
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
    '2025-01-27T12:05:00+00', 
    57, 
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
    '2025-01-27T12:00:00+00', 
    60, 
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
    '2025-01-27T12:02:00+00', 
    49, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T12:15:00+00', 
    '2025-02-03T12:35:00+00', 
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
    '2025-02-03T12:16:00+00', 
    9, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:09:00+00', 
    '2025-02-10T10:23:00+00', 
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
    '2025-02-10T10:10:00+00', 
    23, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:11:00+00', 
    '2025-02-10T10:19:00+00', 
    3, 
    'learning to handle accident trauma better each day', 
    50, 
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
    '2025-02-10T10:12:00+00', 
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
    '2025-02-10T10:13:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    3, 
    '2025-02-10T10:14:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T18:14:00+00', 
    '2025-02-17T18:25:00+00', 
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
    '2025-02-17T18:15:00+00', 
    20, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T18:17:00+00', 
    '2025-02-17T18:20:00+00', 
    180, 
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
    '2025-02-24T13:22:00+00', 
    '2025-02-24T13:44:00+00', 
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
    '2025-02-24T13:23:00+00', 
    26, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T13:24:00+00', 
    '2025-02-24T13:27:00+00', 
    3, 
    'learning to handle accident trauma better each day', 
    50, 
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
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    1, 
    '2025-02-24T13:25:00+00', 
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
    '2025-02-24T13:26:00+00', 
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
    3, 
    '2025-02-24T13:27:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T13:27:00+00', 
    '2025-02-24T13:38:00+00', 
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
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-02-24T13:33:00+00', 
    33, 
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
    '2025-02-24T13:30:00+00', 
    34, 
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
    '2025-02-24T13:32:00+00', 
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
    '2025-02-24T13:30:00+00', 
    56, 
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
    '2025-02-24T13:31:00+00', 
    41, 
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
    '2025-02-24T13:31:00+00', 
    40, 
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
    '2025-02-24T13:29:00+00', 
    28, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T14:15:00+00', 
    '2025-03-03T14:27:00+00', 
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
    '2025-03-03T14:16:00+00', 
    14, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T10:55:00+00', 
    '2025-03-10T11:15:00+00', 
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
    '2025-03-10T10:56:00+00', 
    24, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T10:57:00+00', 
    '2025-03-10T11:04:00+00', 
    3, 
    'learning to handle accident trauma better each day', 
    50, 
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
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    1, 
    '2025-03-10T10:58:00+00', 
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
    '2025-03-10T10:59:00+00', 
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
    '2025-03-10T11:00:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T10:58:00+00', 
    '2025-03-10T10:59:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

-- From chunk_025.sql
-- SQL Chunk 25
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 25/131 - Lucas
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T13:58:00+00', 
    '2025-03-17T14:11:00+00', 
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
    '2025-03-17T13:59:00+00', 
    22, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:34:00+00', 
    '2025-03-24T15:49:00+00', 
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
    '2025-03-24T15:35:00+00', 
    12, 
    false, 
    'feeling confident about accident trauma', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:36:00+00', 
    '2025-03-24T15:44:00+00', 
    3, 
    'learning to handle accident trauma better each day', 
    50, 
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
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    1, 
    '2025-03-24T15:37:00+00', 
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
    '2025-03-24T15:38:00+00', 
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
    '2025-03-24T15:39:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:39:00+00', 
    '2025-03-24T15:45:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-24T15:44:00+00', 
    46, 
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
    '2025-03-24T15:43:00+00', 
    40, 
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
    '2025-03-24T15:44:00+00', 
    56, 
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
    '2025-03-24T15:42:00+00', 
    29, 
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
    '2025-03-24T15:40:00+00', 
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
    '2025-03-24T15:41:00+00', 
    21, 
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
    '2025-03-24T15:43:00+00', 
    31, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T16:46:00+00', 
    '2025-01-06T17:09:00+00', 
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
    '2025-01-06T16:47:00+00', 
    5, 
    false, 
    'feeling confident about depression anxiety', 
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
    '2025-01-07T13:44:00+00', 
    '2025-01-07T13:58:00+00', 
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
    '2025-01-07T13:45:00+00', 
    8, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-07T13:46:00+00', 
    '2025-01-07T13:56:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-01-07T13:47:00+00', 
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
    '2025-01-07T13:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    3, 
    '2025-01-07T13:49:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T14:41:00+00', 
    '2025-01-08T14:50:00+00', 
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
    '2025-01-08T14:42:00+00', 
    6, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T13:56:00+00', 
    '2025-01-09T14:11:00+00', 
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
    '2025-01-09T13:57:00+00', 
    25, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T13:58:00+00', 
    '2025-01-09T14:03:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    1, 
    '2025-01-09T13:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-01-09T14:00:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    3, 
    '2025-01-09T14:01:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T13:59:00+00', 
    '2025-01-09T14:00:15+00', 
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
    '2025-01-09T14:01:00+00', 
    '2025-01-09T14:08:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-09T14:04:00+00', 
    39, 
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
    '2025-01-09T14:03:00+00', 
    26, 
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
    '2025-01-09T14:05:00+00', 
    39, 
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
    '2025-01-09T14:08:00+00', 
    46, 
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
    '2025-01-09T14:09:00+00', 
    58, 
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
    '2025-01-09T14:06:00+00', 
    31, 
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
    '2025-01-09T14:08:00+00', 
    46, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-10T18:05:00+00', 
    '2025-01-10T18:27:00+00', 
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
    '2025-01-10T18:06:00+00', 
    28, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T17:17:00+00', 
    '2025-01-13T17:39:00+00', 
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
    '2025-01-13T17:18:00+00', 
    6, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T17:19:00+00', 
    '2025-01-13T17:23:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    1, 
    '2025-01-13T17:20:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-01-13T17:21:00+00', 
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
    '2025-01-13T17:22:00+00', 
    now()
);

-- From chunk_026.sql
-- SQL Chunk 26
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 26/131 - Lucas
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-14T13:19:00+00', 
    '2025-01-14T13:27:00+00', 
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
    '2025-01-14T13:20:00+00', 
    8, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-14T13:22:00+00', 
    '2025-01-14T13:23:15+00', 
    75, 
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
    '2025-01-15T13:04:00+00', 
    '2025-01-15T13:14:00+00', 
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
    '2025-01-15T13:05:00+00', 
    21, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T13:06:00+00', 
    '2025-01-15T13:11:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-01-15T13:07:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-01-15T13:08:00+00', 
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
    '2025-01-15T13:09:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T13:09:00+00', 
    '2025-01-15T13:20:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    5.0, 
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
    '2025-01-15T13:17:00+00', 
    44, 
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
    '2025-01-15T13:12:00+00', 
    52, 
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
    '2025-01-15T13:12:00+00', 
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
    '2025-01-15T13:17:00+00', 
    36, 
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
    '2025-01-15T13:12:00+00', 
    49, 
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
    '2025-01-15T13:16:00+00', 
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
    '2025-01-15T13:13:00+00', 
    48, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-16T11:29:00+00', 
    '2025-01-16T11:40:00+00', 
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
    '2025-01-16T11:30:00+00', 
    21, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T10:02:00+00', 
    '2025-01-17T10:12:00+00', 
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
    '2025-01-17T10:03:00+00', 
    17, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T10:04:00+00', 
    '2025-01-17T10:13:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    '2025-01-17T10:05:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    2, 
    '2025-01-17T10:06:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    3, 
    '2025-01-17T10:07:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T10:05:00+00', 
    '2025-01-17T10:06:15+00', 
    75, 
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
    '2025-01-20T12:03:00+00', 
    '2025-01-20T12:16:00+00', 
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
    '2025-01-20T12:04:00+00', 
    8, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T13:24:00+00', 
    '2025-01-21T13:48:00+00', 
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
    '2025-01-21T13:25:00+00', 
    11, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T13:26:00+00', 
    '2025-01-21T13:35:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    1, 
    '2025-01-21T13:27:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-01-21T13:28:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    3, 
    '2025-01-21T13:29:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T13:29:00+00', 
    '2025-01-21T13:37:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-21T13:35:00+00', 
    47, 
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
    '2025-01-21T13:31:00+00', 
    28, 
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
    '2025-01-21T13:34:00+00', 
    48, 
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
    '2025-01-21T13:36:00+00', 
    44, 
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
    '2025-01-21T13:35:00+00', 
    39, 
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
    '2025-01-21T13:35:00+00', 
    52, 
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
    '2025-01-21T13:32:00+00', 
    27, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T18:14:00+00', 
    '2025-01-22T18:30:00+00', 
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
    '2025-01-22T18:15:00+00', 
    11, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T18:17:00+00', 
    '2025-01-22T18:19:30+00', 
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
    '2025-01-23T12:48:00+00', 
    '2025-01-23T13:00:00+00', 
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
    '2025-01-23T12:49:00+00', 
    14, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-23T12:50:00+00', 
    '2025-01-23T12:56:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    1, 
    '2025-01-23T12:51:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-01-23T12:52:00+00', 
    now()
);

-- From chunk_027.sql
-- SQL Chunk 27
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 27/131 - Lucas
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
    '2025-01-23T12:53:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-24T13:06:00+00', 
    '2025-01-24T13:20:00+00', 
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
    '2025-01-24T13:07:00+00', 
    19, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:05:00+00', 
    '2025-01-27T16:16:00+00', 
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
    '2025-01-27T16:06:00+00', 
    16, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:07:00+00', 
    '2025-01-27T16:10:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    '2025-01-27T16:08:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    2, 
    '2025-01-27T16:09:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-01-27T16:10:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:08:00+00', 
    '2025-01-27T16:10:30+00', 
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
    '2025-01-27T16:10:00+00', 
    '2025-01-27T16:20:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-27T16:13:00+00', 
    27, 
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
    '2025-01-27T16:15:00+00', 
    31, 
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
    '2025-01-27T16:15:00+00', 
    57, 
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
    '2025-01-27T16:15:00+00', 
    36, 
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
    '2025-01-27T16:11:00+00', 
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
    '2025-01-27T16:13:00+00', 
    60, 
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
    '2025-01-27T16:16:00+00', 
    28, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-28T14:17:00+00', 
    '2025-01-28T14:37:00+00', 
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
    '2025-01-28T14:18:00+00', 
    24, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T17:45:00+00', 
    '2025-01-29T18:01:00+00', 
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
    '2025-01-29T17:46:00+00', 
    26, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T17:47:00+00', 
    '2025-01-29T17:54:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    1, 
    '2025-01-29T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    2, 
    '2025-01-29T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-01-29T17:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-30T10:12:00+00', 
    '2025-01-30T10:31:00+00', 
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
    '2025-01-30T10:13:00+00', 
    28, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-30T10:15:00+00', 
    '2025-01-30T10:17:30+00', 
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
    '2025-01-31T12:40:00+00', 
    '2025-01-31T12:48:00+00', 
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
    '2025-01-31T12:41:00+00', 
    23, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T12:42:00+00', 
    '2025-01-31T12:47:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-01-31T12:43:00+00', 
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
    '2025-01-31T12:44:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-01-31T12:45:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T12:45:00+00', 
    '2025-01-31T12:56:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-31T12:50:00+00', 
    50, 
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
    '2025-01-31T12:47:00+00', 
    45, 
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
    '2025-01-31T12:46:00+00', 
    46, 
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
    '2025-01-31T12:52:00+00', 
    23, 
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
    '2025-01-31T12:51:00+00', 
    56, 
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
    '2025-01-31T12:53:00+00', 
    60, 
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
    '2025-01-31T12:50:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T17:33:00+00', 
    '2025-02-03T17:54:00+00', 
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
    '2025-02-03T17:34:00+00', 
    24, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T17:21:00+00', 
    '2025-02-04T17:34:00+00', 
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
    '2025-02-04T17:22:00+00', 
    21, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T17:23:00+00', 
    '2025-02-04T17:26:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    1, 
    '2025-02-04T17:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-02-04T17:25:00+00', 
    now()
);

-- From chunk_028.sql
-- SQL Chunk 28
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 28/131 - Lucas
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    3, 
    '2025-02-04T17:26:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T17:24:00+00', 
    '2025-02-04T17:26:30+00', 
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
    '2025-02-05T10:07:00+00', 
    '2025-02-05T10:21:00+00', 
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
    '2025-02-05T10:08:00+00', 
    11, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-06T14:05:00+00', 
    '2025-02-06T14:28:00+00', 
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
    '2025-02-06T14:06:00+00', 
    21, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-06T14:07:00+00', 
    '2025-02-06T14:15:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    1, 
    '2025-02-06T14:08:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-02-06T14:09:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-02-06T14:10:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-06T14:10:00+00', 
    '2025-02-06T14:22:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-06T14:17:00+00', 
    31, 
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
    '2025-02-06T14:12:00+00', 
    36, 
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
    '2025-02-06T14:12:00+00', 
    20, 
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
    '2025-02-06T14:13:00+00', 
    20, 
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
    '2025-02-06T14:12:00+00', 
    46, 
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
    '2025-02-06T14:16:00+00', 
    55, 
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
    '2025-02-06T14:16:00+00', 
    48, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T16:11:00+00', 
    '2025-02-07T16:22:00+00', 
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
    '2025-02-07T16:12:00+00', 
    13, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T16:14:00+00', 
    '2025-02-07T16:16:30+00', 
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
    '2025-02-10T15:30:00+00', 
    '2025-02-10T15:52:00+00', 
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
    '2025-02-10T15:31:00+00', 
    15, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T15:32:00+00', 
    '2025-02-10T15:40:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-02-10T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-02-10T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    3, 
    '2025-02-10T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-11T14:35:00+00', 
    '2025-02-11T14:43:00+00', 
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
    '2025-02-11T14:36:00+00', 
    25, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T17:50:00+00', 
    '2025-02-12T17:59:00+00', 
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
    '2025-02-12T17:51:00+00', 
    9, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T17:52:00+00', 
    '2025-02-12T17:55:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    1, 
    '2025-02-12T17:53:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    2, 
    '2025-02-12T17:54:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    3, 
    '2025-02-12T17:55:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T17:53:00+00', 
    '2025-02-12T17:55:30+00', 
    150, 
    'guided_4_7_8', 
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
    '2025-02-12T17:55:00+00', 
    '2025-02-12T18:03:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-12T18:02:00+00', 
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
    '2025-02-12T17:56:00+00', 
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
    '2025-02-12T18:03:00+00', 
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
    '2025-02-12T18:01:00+00', 
    56, 
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
    '2025-02-12T17:57:00+00', 
    50, 
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
    '2025-02-12T18:02:00+00', 
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
    '2025-02-12T17:58:00+00', 
    56, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-13T15:48:00+00', 
    '2025-02-13T16:05:00+00', 
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
    '2025-02-13T15:49:00+00', 
    22, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T14:13:00+00', 
    '2025-02-14T14:30:00+00', 
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
    '2025-02-14T14:14:00+00', 
    5, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T14:15:00+00', 
    '2025-02-14T14:19:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    1, 
    '2025-02-14T14:16:00+00', 
    now()
);

-- From chunk_029.sql
-- SQL Chunk 29
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 29/131 - Lucas
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-02-14T14:17:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    3, 
    '2025-02-14T14:18:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T18:13:00+00', 
    '2025-02-17T18:28:00+00', 
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
    '2025-02-17T18:14:00+00', 
    5, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T18:16:00+00', 
    '2025-02-17T18:18:30+00', 
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
    '2025-02-18T12:44:00+00', 
    '2025-02-18T13:03:00+00', 
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
    '2025-02-18T12:45:00+00', 
    21, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-18T12:46:00+00', 
    '2025-02-18T12:52:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    1, 
    '2025-02-18T12:47:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    2, 
    '2025-02-18T12:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    3, 
    '2025-02-18T12:49:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-18T12:49:00+00', 
    '2025-02-18T12:59:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-18T12:52:00+00', 
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
    '2025-02-18T12:50:00+00', 
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
    '2025-02-18T12:57:00+00', 
    35, 
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
    '2025-02-18T12:54:00+00', 
    44, 
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
    '2025-02-18T12:53:00+00', 
    39, 
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
    '2025-02-18T12:51:00+00', 
    51, 
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
    '2025-02-18T12:51:00+00', 
    43, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T18:24:00+00', 
    '2025-02-19T18:46:00+00', 
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
    '2025-02-19T18:25:00+00', 
    30, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-20T12:07:00+00', 
    '2025-02-20T12:24:00+00', 
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
    '2025-02-20T12:08:00+00', 
    24, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-20T12:09:00+00', 
    '2025-02-20T12:16:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    1, 
    '2025-02-20T12:10:00+00', 
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
    '2025-02-20T12:11:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-02-20T12:12:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-20T12:10:00+00', 
    '2025-02-20T12:12:30+00', 
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
    '2025-02-21T16:51:00+00', 
    '2025-02-21T17:05:00+00', 
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
    '2025-02-21T16:52:00+00', 
    26, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T14:16:00+00', 
    '2025-02-24T14:38:00+00', 
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
    '2025-02-24T14:17:00+00', 
    5, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T14:18:00+00', 
    '2025-02-24T14:27:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    1, 
    '2025-02-24T14:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    2, 
    '2025-02-24T14:20:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    3, 
    '2025-02-24T14:21:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T14:21:00+00', 
    '2025-02-24T14:28:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-02-24T14:28:00+00', 
    34, 
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
    '2025-02-24T14:25:00+00', 
    45, 
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
    '2025-02-24T14:28:00+00', 
    41, 
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
    '2025-02-24T14:27:00+00', 
    51, 
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
    '2025-02-24T14:27:00+00', 
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
    '2025-02-24T14:23:00+00', 
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
    '2025-02-24T14:24:00+00', 
    28, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-25T16:47:00+00', 
    '2025-02-25T17:11:00+00', 
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
    '2025-02-25T16:48:00+00', 
    13, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-25T16:50:00+00', 
    '2025-02-25T16:55:00+00', 
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
    '2025-02-26T18:36:00+00', 
    '2025-02-26T18:44:00+00', 
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
    '2025-02-26T18:37:00+00', 
    9, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-26T18:38:00+00', 
    '2025-02-26T18:48:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);

-- From chunk_030.sql
-- SQL Chunk 30
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 30/131 - Lucas
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
    '2025-02-26T18:39:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-02-26T18:40:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    3, 
    '2025-02-26T18:41:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-27T18:15:00+00', 
    '2025-02-27T18:34:00+00', 
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
    '2025-02-27T18:16:00+00', 
    7, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T18:55:00+00', 
    '2025-02-28T19:09:00+00', 
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
    '2025-02-28T18:56:00+00', 
    12, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T18:57:00+00', 
    '2025-02-28T19:02:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-02-28T18:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    2, 
    '2025-02-28T18:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    3, 
    '2025-02-28T19:00:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T18:58:00+00', 
    '2025-02-28T19:03:00+00', 
    300, 
    'basic_inhale_exhale', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T19:00:00+00', 
    '2025-02-28T19:11:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-28T19:01:00+00', 
    60, 
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
    '2025-02-28T19:01:00+00', 
    41, 
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
    '2025-02-28T19:01:00+00', 
    47, 
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
    '2025-02-28T19:06:00+00', 
    29, 
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
    '2025-02-28T19:03:00+00', 
    29, 
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
    '2025-02-28T19:01:00+00', 
    57, 
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
    '2025-02-28T19:02:00+00', 
    34, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T16:54:00+00', 
    '2025-03-03T17:03:00+00', 
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
    '2025-03-03T16:55:00+00', 
    16, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-04T14:38:00+00', 
    '2025-03-04T15:02:00+00', 
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
    '2025-03-04T14:39:00+00', 
    26, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-04T14:40:00+00', 
    '2025-03-04T14:48:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    '2025-03-04T14:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    2, 
    '2025-03-04T14:42:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    3, 
    '2025-03-04T14:43:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T14:58:00+00', 
    '2025-03-05T15:16:00+00', 
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
    '2025-03-05T14:59:00+00', 
    23, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T15:01:00+00', 
    '2025-03-05T15:06:00+00', 
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
    '2025-03-06T18:44:00+00', 
    '2025-03-06T19:04:00+00', 
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
    '2025-03-06T18:45:00+00', 
    28, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-06T18:46:00+00', 
    '2025-03-06T18:51:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    1, 
    '2025-03-06T18:47:00+00', 
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
    '2025-03-06T18:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-03-06T18:49:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-06T18:49:00+00', 
    '2025-03-06T18:59:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-06T18:52:00+00', 
    59, 
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
    '2025-03-06T18:53:00+00', 
    36, 
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
    '2025-03-06T18:53:00+00', 
    42, 
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
    '2025-03-06T18:52:00+00', 
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
    '2025-03-06T18:50:00+00', 
    42, 
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
    '2025-03-06T18:52:00+00', 
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
    '2025-03-06T18:50:00+00', 
    46, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-07T12:38:00+00', 
    '2025-03-07T13:03:00+00', 
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
    '2025-03-07T12:39:00+00', 
    11, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T13:35:00+00', 
    '2025-03-10T13:58:00+00', 
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
    '2025-03-10T13:36:00+00', 
    24, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T13:37:00+00', 
    '2025-03-10T13:47:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);
