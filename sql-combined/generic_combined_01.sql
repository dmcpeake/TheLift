-- Combined SQL Batch 1
-- Contains chunks 1 to 10


-- From chunk_001.sql
-- SQL Chunk 1
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql


-- Batch 1/131 - Emma
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T16:51:00+00', 
    '2025-01-06T17:12:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-06T16:52:00+00', 
    29, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T16:54:00+00', 
    '2025-01-06T16:55:00+00', 
    60, 
    'basic_inhale_exhale', 
    3, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T14:11:00+00', 
    '2025-01-08T14:34:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-08T14:12:00+00', 
    24, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T14:13:00+00', 
    '2025-01-08T14:16:00+00', 
    3, 
    'worried about catching cold and making breathing worse', 
    54, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-01-08T14:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-08T14:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-01-08T14:16:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-10T17:29:00+00', 
    '2025-01-10T17:45:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-10T17:30:00+00', 
    12, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:16:00+00', 
    '2025-01-13T16:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-13T16:17:00+00', 
    27, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:18:00+00', 
    '2025-01-13T16:21:00+00', 
    3, 
    'worried about catching cold and making breathing worse', 
    54, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-01-13T16:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-01-13T16:20:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-13T16:21:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:19:00+00', 
    '2025-01-13T16:20:00+00', 
    60, 
    'basic_inhale_exhale', 
    3, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:21:00+00', 
    '2025-01-13T16:27:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'james understands my asthma', 
    27, 
    '2025-01-13T16:28:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-13T16:22:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-01-13T16:27:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-13T16:29:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-13T16:24:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-13T16:29:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-13T16:27:00+00', 
    43, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T18:03:00+00', 
    '2025-01-15T18:20:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-15T18:04:00+00', 
    21, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T13:56:00+00', 
    '2025-01-17T14:11:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-01-17T13:57:00+00', 
    11, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T13:58:00+00', 
    '2025-01-17T14:07:00+00', 
    3, 
    'worried about catching cold and making breathing worse', 
    54, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-17T13:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-17T14:00:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-01-17T14:01:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T10:33:00+00', 
    '2025-01-20T10:48:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-20T10:34:00+00', 
    9, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T10:36:00+00', 
    '2025-01-20T10:38:00+00', 
    120, 
    'box_breathing', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T14:57:00+00', 
    '2025-01-22T15:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-22T14:58:00+00', 
    25, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T14:59:00+00', 
    '2025-01-22T15:04:00+00', 
    3, 
    'practicing breathing exercises helps when chest feels tight', 
    59, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-01-22T15:00:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-01-22T15:01:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-01-22T15:02:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T15:02:00+00', 
    '2025-01-22T15:14:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'worried friends will avoid me', 
    29, 
    '2025-01-22T15:07:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-22T15:09:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'learning to manage asthma', 
    25, 
    '2025-01-22T15:09:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-22T15:06:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-22T15:10:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-22T15:03:00+00', 
    28, 
    now()
);

-- From chunk_002.sql
-- SQL Chunk 2
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 2/131 - Emma
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-22T15:06:00+00', 
    39, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-24T15:00:00+00', 
    '2025-01-24T15:09:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-24T15:01:00+00', 
    9, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T14:32:00+00', 
    '2025-01-27T14:47:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-27T14:33:00+00', 
    23, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T14:34:00+00', 
    '2025-01-27T14:44:00+00', 
    3, 
    'practicing breathing exercises helps when chest feels tight', 
    59, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-01-27T14:35:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-27T14:36:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-01-27T14:37:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T14:35:00+00', 
    '2025-01-27T14:37:00+00', 
    120, 
    'basic_inhale_exhale', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T16:53:00+00', 
    '2025-01-29T17:07:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-29T16:54:00+00', 
    23, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T14:20:00+00', 
    '2025-01-31T14:29:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-31T14:21:00+00', 
    8, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T14:22:00+00', 
    '2025-01-31T14:32:00+00', 
    3, 
    'practicing breathing exercises helps when chest feels tight', 
    59, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-01-31T14:23:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-31T14:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-01-31T14:25:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T14:25:00+00', 
    '2025-01-31T14:35:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'worried friends will avoid me', 
    29, 
    '2025-01-31T14:27:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-31T14:26:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'ok', 
    3, 
    'learning to manage asthma', 
    25, 
    '2025-01-31T14:31:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-31T14:29:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-01-31T14:31:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-31T14:32:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-31T14:32:00+00', 
    60, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T17:06:00+00', 
    '2025-02-03T17:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-03T17:07:00+00', 
    23, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T17:09:00+00', 
    '2025-02-03T17:11:00+00', 
    120, 
    'guided_4_7_8', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T13:19:00+00', 
    '2025-02-05T13:40:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-05T13:20:00+00', 
    25, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-05T13:21:00+00', 
    '2025-02-05T13:31:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-02-05T13:22:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-02-05T13:23:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-02-05T13:24:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T16:47:00+00', 
    '2025-02-07T17:04:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-07T16:48:00+00', 
    21, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:00:00+00', 
    '2025-02-10T10:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-10T10:01:00+00', 
    11, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:02:00+00', 
    '2025-02-10T10:06:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-02-10T10:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-02-10T10:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-02-10T10:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:03:00+00', 
    '2025-02-10T10:05:00+00', 
    120, 
    'guided_4_7_8', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:05:00+00', 
    '2025-02-10T10:11:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love helping friends', 
    20, 
    '2025-02-10T10:07:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-10T10:10:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-02-10T10:10:00+00', 
    32, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-10T10:13:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-02-10T10:08:00+00', 
    34, 
    now()
);

-- From chunk_003.sql
-- SQL Chunk 3
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 3/131 - Emma
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-10T10:07:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-10T10:08:00+00', 
    45, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T18:35:00+00', 
    '2025-02-12T18:50:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-12T18:36:00+00', 
    30, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T12:38:00+00', 
    '2025-02-14T12:59:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-14T12:39:00+00', 
    9, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T12:40:00+00', 
    '2025-02-14T12:48:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-02-14T12:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-02-14T12:42:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-02-14T12:43:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T12:36:00+00', 
    '2025-02-17T12:50:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-17T12:37:00+00', 
    20, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T12:39:00+00', 
    '2025-02-17T12:41:00+00', 
    120, 
    'guided_4_7_8', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T13:53:00+00', 
    '2025-02-19T14:15:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-19T13:54:00+00', 
    10, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T13:55:00+00', 
    '2025-02-19T13:58:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-02-19T13:56:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-02-19T13:57:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-02-19T13:58:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-19T13:58:00+00', 
    '2025-02-19T14:07:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love helping friends', 
    20, 
    '2025-02-19T14:04:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-19T14:03:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feel healthy and strong', 
    23, 
    '2025-02-19T14:01:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-19T14:03:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-02-19T14:02:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-02-19T14:00:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-19T14:01:00+00', 
    25, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-21T11:29:00+00', 
    '2025-02-21T11:42:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-21T11:30:00+00', 
    11, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T12:08:00+00', 
    '2025-02-24T12:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-24T12:09:00+00', 
    30, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T12:10:00+00', 
    '2025-02-24T12:20:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-02-24T12:11:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-02-24T12:12:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-02-24T12:13:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T12:11:00+00', 
    '2025-02-24T12:13:00+00', 
    120, 
    'basic_inhale_exhale', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-26T18:23:00+00', 
    '2025-02-26T18:42:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-02-26T18:24:00+00', 
    29, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T15:49:00+00', 
    '2025-02-28T16:07:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-02-28T15:50:00+00', 
    9, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T15:51:00+00', 
    '2025-02-28T16:00:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-02-28T15:52:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-02-28T15:53:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-02-28T15:54:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-28T15:54:00+00', 
    '2025-02-28T16:02:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'james understands my asthma', 
    27, 
    '2025-02-28T15:58:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-28T16:00:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feel healthy and strong', 
    23, 
    '2025-02-28T15:58:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-28T15:58:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-02-28T16:01:00+00', 
    55, 
    now()
);

-- From chunk_004.sql
-- SQL Chunk 4
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 4/131 - Emma
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-28T15:59:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-28T16:01:00+00', 
    41, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T11:51:00+00', 
    '2025-03-03T12:12:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-03T11:52:00+00', 
    11, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T11:54:00+00', 
    '2025-03-03T11:56:00+00', 
    120, 
    'basic_inhale_exhale', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T12:21:00+00', 
    '2025-03-05T12:43:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-05T12:22:00+00', 
    17, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-05T12:23:00+00', 
    '2025-03-05T12:31:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-03-05T12:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-03-05T12:25:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-03-05T12:26:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-07T14:54:00+00', 
    '2025-03-07T15:13:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-03-07T14:55:00+00', 
    30, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:32:00+00', 
    '2025-03-10T11:50:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-10T11:33:00+00', 
    17, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:34:00+00', 
    '2025-03-10T11:38:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-03-10T11:35:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-03-10T11:36:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-10T11:37:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:35:00+00', 
    '2025-03-10T11:39:00+00', 
    240, 
    'basic_inhale_exhale', 
    12, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T11:37:00+00', 
    '2025-03-10T11:47:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'worried friends will avoid me', 
    29, 
    '2025-03-10T11:42:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-03-10T11:41:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-03-10T11:45:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-10T11:38:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-10T11:43:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-10T11:39:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-10T11:43:00+00', 
    35, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T10:16:00+00', 
    '2025-03-12T10:24:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-12T10:17:00+00', 
    10, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T11:10:00+00', 
    '2025-03-14T11:19:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-14T11:11:00+00', 
    8, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-14T11:12:00+00', 
    '2025-03-14T11:22:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-03-14T11:13:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-14T11:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-14T11:15:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T11:37:00+00', 
    '2025-03-17T11:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-17T11:38:00+00', 
    24, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T11:40:00+00', 
    '2025-03-17T11:44:00+00', 
    240, 
    'basic_inhale_exhale', 
    12, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T12:53:00+00', 
    '2025-03-19T13:14:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-19T12:54:00+00', 
    18, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T12:55:00+00', 
    '2025-03-19T13:00:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-19T12:56:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-03-19T12:57:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-03-19T12:58:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T12:58:00+00', 
    '2025-03-19T13:09:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'james understands my asthma', 
    27, 
    '2025-03-19T13:03:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-19T13:03:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-03-19T13:01:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-19T13:04:00+00', 
    47, 
    now()
);

-- From chunk_005.sql
-- SQL Chunk 5
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 5/131 - Aisha
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-19T13:03:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-19T13:02:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-03-19T13:03:00+00', 
    60, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T15:03:00+00', 
    '2025-03-21T15:14:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'very_happy', 
    5, 
    '2025-03-21T15:04:00+00', 
    19, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T16:09:00+00', 
    '2025-03-24T16:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-24T16:10:00+00', 
    17, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T16:11:00+00', 
    '2025-03-24T16:21:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-03-24T16:12:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-03-24T16:13:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-03-24T16:14:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T16:12:00+00', 
    '2025-03-24T16:16:00+00', 
    240, 
    'guided_4_7_8', 
    12, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T14:54:00+00', 
    '2025-03-26T15:11:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-26T14:55:00+00', 
    24, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T12:29:00+00', 
    '2025-03-28T12:40:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-28T12:30:00+00', 
    5, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T12:31:00+00', 
    '2025-03-28T12:36:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-03-28T12:32:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-03-28T12:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-03-28T12:34:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T12:34:00+00', 
    '2025-03-28T12:42:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'sad', 
    2, 
    'worried friends will avoid me', 
    29, 
    '2025-03-28T12:36:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-28T12:41:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-03-28T12:40:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-28T12:41:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-28T12:42:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-28T12:42:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-28T12:40:00+00', 
    50, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T17:57:00+00', 
    '2025-01-06T18:09:00+00', 
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
    '2025-01-06T17:58:00+00', 
    23, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T18:00:00+00', 
    '2025-01-06T18:02:30+00', 
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
    '2025-01-13T17:51:00+00', 
    '2025-01-13T18:07:00+00', 
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
    '2025-01-13T17:52:00+00', 
    25, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T17:53:00+00', 
    '2025-01-13T18:00:00+00', 
    3, 
    'learning to handle diabetes better each day', 
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
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-01-13T17:54:00+00', 
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
    '2025-01-13T17:55:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    3, 
    '2025-01-13T17:56:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T13:50:00+00', 
    '2025-01-20T14:05:00+00', 
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
    '2025-01-20T13:51:00+00', 
    24, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:12:00+00', 
    '2025-01-27T18:26:00+00', 
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
    '2025-01-27T18:13:00+00', 
    20, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:14:00+00', 
    '2025-01-27T18:20:00+00', 
    3, 
    'learning to handle diabetes better each day', 
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
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-01-27T18:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    2, 
    '2025-01-27T18:16:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    3, 
    '2025-01-27T18:17:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T18:15:00+00', 
    '2025-01-27T18:17:30+00', 
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
    '2025-01-27T18:17:00+00', 
    '2025-01-27T18:29:00+00', 
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
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-01-27T18:20:00+00', 
    43, 
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
    '2025-01-27T18:18:00+00', 
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
    '2025-01-27T18:18:00+00', 
    27, 
    now()
);

-- From chunk_006.sql
-- SQL Chunk 6
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 6/131 - Aisha
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
    '2025-01-27T18:22:00+00', 
    50, 
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
    '2025-01-27T18:18:00+00', 
    59, 
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
    '2025-01-27T18:18:00+00', 
    33, 
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
    '2025-01-27T18:19:00+00', 
    60, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T11:30:00+00', 
    '2025-02-03T11:53:00+00', 
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
    '2025-02-03T11:31:00+00', 
    16, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T14:04:00+00', 
    '2025-02-10T14:26:00+00', 
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
    '2025-02-10T14:05:00+00', 
    26, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T14:06:00+00', 
    '2025-02-10T14:09:00+00', 
    3, 
    'learning to handle diabetes better each day', 
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
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-02-10T14:07:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-02-10T14:08:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-02-10T14:09:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T16:57:00+00', 
    '2025-02-17T17:12:00+00', 
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
    '2025-02-17T16:58:00+00', 
    22, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T17:00:00+00', 
    '2025-02-17T17:02:30+00', 
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
    '2025-02-24T16:55:00+00', 
    '2025-02-24T17:07:00+00', 
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
    '2025-02-24T16:56:00+00', 
    20, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T16:57:00+00', 
    '2025-02-24T17:04:00+00', 
    3, 
    'learning to handle diabetes better each day', 
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
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-02-24T16:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    2, 
    '2025-02-24T16:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-02-24T17:00:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T17:00:00+00', 
    '2025-02-24T17:07:00+00', 
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
    '2025-02-24T17:07:00+00', 
    48, 
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
    '2025-02-24T17:05:00+00', 
    36, 
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
    '2025-02-24T17:02:00+00', 
    53, 
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
    '2025-02-24T17:08:00+00', 
    51, 
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
    '2025-02-24T17:03:00+00', 
    20, 
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
    '2025-02-24T17:05:00+00', 
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
    '2025-02-24T17:08:00+00', 
    56, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T13:25:00+00', 
    '2025-03-03T13:36:00+00', 
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
    '2025-03-03T13:26:00+00', 
    21, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:25:00+00', 
    '2025-03-10T14:36:00+00', 
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
    '2025-03-10T14:26:00+00', 
    6, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:27:00+00', 
    '2025-03-10T14:31:00+00', 
    3, 
    'learning to handle diabetes better each day', 
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
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-10T14:28:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-03-10T14:29:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-03-10T14:30:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T14:28:00+00', 
    '2025-03-10T14:33:00+00', 
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
    '2025-03-17T17:41:00+00', 
    '2025-03-17T18:00:00+00', 
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
    '2025-03-17T17:42:00+00', 
    14, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:38:00+00', 
    '2025-03-24T15:51:00+00', 
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
    '2025-03-24T15:39:00+00', 
    28, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:40:00+00', 
    '2025-03-24T15:48:00+00', 
    3, 
    'learning to handle diabetes better each day', 
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
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-03-24T15:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-03-24T15:42:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-03-24T15:43:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T15:43:00+00', 
    '2025-03-24T15:53:00+00', 
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
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-24T15:51:00+00', 
    31, 
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
    '2025-03-24T15:46:00+00', 
    46, 
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
    '2025-03-24T15:47:00+00', 
    31, 
    now()
);

-- From chunk_007.sql
-- SQL Chunk 7
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 7/131 - Kai
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
    '2025-03-24T15:48:00+00', 
    20, 
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
    '2025-03-24T15:47:00+00', 
    29, 
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
    '2025-03-24T15:51:00+00', 
    45, 
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
    '2025-03-24T15:50:00+00', 
    41, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T17:45:00+00', 
    '2025-01-06T18:03:00+00', 
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
    '2025-01-06T17:46:00+00', 
    15, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T17:48:00+00', 
    '2025-01-06T17:48:45+00', 
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
    '2025-01-07T16:21:00+00', 
    '2025-01-07T16:38:00+00', 
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
    '2025-01-07T16:22:00+00', 
    7, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-07T16:23:00+00', 
    '2025-01-07T16:26:00+00', 
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
    '2025-01-07T16:24:00+00', 
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
    '2025-01-07T16:25:00+00', 
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
    '2025-01-07T16:26:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-08T18:12:00+00', 
    '2025-01-08T18:23:00+00', 
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
    '2025-01-08T18:13:00+00', 
    19, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T11:17:00+00', 
    '2025-01-09T11:39:00+00', 
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
    '2025-01-09T11:18:00+00', 
    5, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T11:19:00+00', 
    '2025-01-09T11:22:00+00', 
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
    '2025-01-09T11:20:00+00', 
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
    '2025-01-09T11:21:00+00', 
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
    '2025-01-09T11:22:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T11:20:00+00', 
    '2025-01-09T11:20:45+00', 
    45, 
    'box_breathing', 
    2, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-09T11:22:00+00', 
    '2025-01-09T11:34:00+00', 
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
    '2025-01-09T11:28:00+00', 
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
    '2025-01-09T11:27:00+00', 
    32, 
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
    '2025-01-09T11:27:00+00', 
    59, 
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
    '2025-01-09T11:28:00+00', 
    38, 
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
    '2025-01-09T11:26:00+00', 
    21, 
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
    '2025-01-09T11:30:00+00', 
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
    '2025-01-09T11:25:00+00', 
    31, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-10T11:11:00+00', 
    '2025-01-10T11:32:00+00', 
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
    '2025-01-10T11:12:00+00', 
    27, 
    false, 
    'learning to manage surgery recovery better', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T11:39:00+00', 
    '2025-01-13T11:50:00+00', 
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
    '2025-01-13T11:40:00+00', 
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
    '2025-01-13T11:41:00+00', 
    '2025-01-13T11:45:00+00', 
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
    '2025-01-13T11:42:00+00', 
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
    '2025-01-13T11:43:00+00', 
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
    '2025-01-13T11:44:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-14T11:08:00+00', 
    '2025-01-14T11:18:00+00', 
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
    '2025-01-14T11:09:00+00', 
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
    '2025-01-14T11:11:00+00', 
    '2025-01-14T11:11:45+00', 
    45, 
    'basic_inhale_exhale', 
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
    '2025-01-15T12:58:00+00', 
    '2025-01-15T13:20:00+00', 
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
    '2025-01-15T12:59:00+00', 
    11, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T13:00:00+00', 
    '2025-01-15T13:05:00+00', 
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
    '2025-01-15T13:01:00+00', 
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
    '2025-01-15T13:02:00+00', 
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
    '2025-01-15T13:03:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-15T13:03:00+00', 
    '2025-01-15T13:09:00+00', 
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
    '2025-01-15T13:06:00+00', 
    27, 
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
    '2025-01-15T13:04:00+00', 
    22, 
    now()
);

-- From chunk_008.sql
-- SQL Chunk 8
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 8/131 - Kai
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
    '2025-01-15T13:11:00+00', 
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
    '2025-01-15T13:09:00+00', 
    26, 
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
    '2025-01-15T13:04:00+00', 
    28, 
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
    '2025-01-15T13:08:00+00', 
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
    '2025-01-15T13:07:00+00', 
    54, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-16T15:06:00+00', 
    '2025-01-16T15:29:00+00', 
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
    '2025-01-16T15:07:00+00', 
    14, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:55:00+00', 
    '2025-01-17T16:12:00+00', 
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
    '2025-01-17T15:56:00+00', 
    12, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:57:00+00', 
    '2025-01-17T16:02:00+00', 
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
    '2025-01-17T15:58:00+00', 
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
    '2025-01-17T15:59:00+00', 
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
    '2025-01-17T16:00:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-17T15:58:00+00', 
    '2025-01-17T15:58:45+00', 
    45, 
    'basic_inhale_exhale', 
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
    '2025-01-20T17:16:00+00', 
    '2025-01-20T17:36:00+00', 
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
    '2025-01-20T17:17:00+00', 
    14, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T15:27:00+00', 
    '2025-01-21T15:36:00+00', 
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
    '2025-01-21T15:28:00+00', 
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
    '2025-01-21T15:29:00+00', 
    '2025-01-21T15:39:00+00', 
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
    '2025-01-21T15:30:00+00', 
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
    '2025-01-21T15:31:00+00', 
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
    '2025-01-21T15:32:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-21T15:32:00+00', 
    '2025-01-21T15:38:00+00', 
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
    '2025-01-21T15:38:00+00', 
    55, 
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
    '2025-01-21T15:36:00+00', 
    39, 
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
    '2025-01-21T15:35:00+00', 
    23, 
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
    '2025-01-21T15:34:00+00', 
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
    '2025-01-21T15:37:00+00', 
    34, 
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
    '2025-01-21T15:33:00+00', 
    27, 
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
    '2025-01-21T15:34:00+00', 
    40, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T17:11:00+00', 
    '2025-01-22T17:33:00+00', 
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
    '2025-01-22T17:12:00+00', 
    28, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-22T17:14:00+00', 
    '2025-01-22T17:15:30+00', 
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
    '2025-01-23T10:38:00+00', 
    '2025-01-23T11:01:00+00', 
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
    '2025-01-23T10:39:00+00', 
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
    '2025-01-23T10:40:00+00', 
    '2025-01-23T10:47:00+00', 
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
    '2025-01-23T10:41:00+00', 
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
    '2025-01-23T10:42:00+00', 
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
    '2025-01-23T10:43:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-24T14:06:00+00', 
    '2025-01-24T14:21:00+00', 
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
    '2025-01-24T14:07:00+00', 
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
    '2025-01-27T16:23:00+00', 
    '2025-01-27T16:34:00+00', 
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
    '2025-01-27T16:24:00+00', 
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
    '2025-01-27T16:25:00+00', 
    '2025-01-27T16:33:00+00', 
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
    '2025-01-27T16:26:00+00', 
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
    '2025-01-27T16:27:00+00', 
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
    '2025-01-27T16:28:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T16:26:00+00', 
    '2025-01-27T16:27:30+00', 
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
    '2025-01-27T16:28:00+00', 
    '2025-01-27T16:40:00+00', 
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
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-01-27T16:35:00+00', 
    23, 
    now()
);

-- From chunk_009.sql
-- SQL Chunk 9
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 9/131 - Kai
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
    '2025-01-27T16:29:00+00', 
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
    '2025-01-27T16:35:00+00', 
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
    '2025-01-27T16:36:00+00', 
    48, 
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
    '2025-01-27T16:32:00+00', 
    52, 
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
    '2025-01-27T16:35:00+00', 
    37, 
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
    '2025-01-27T16:34:00+00', 
    54, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-28T13:03:00+00', 
    '2025-01-28T13:13:00+00', 
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
    '2025-01-28T13:04:00+00', 
    11, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T17:35:00+00', 
    '2025-01-29T17:56:00+00', 
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
    '2025-01-29T17:36:00+00', 
    12, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-29T17:37:00+00', 
    '2025-01-29T17:47:00+00', 
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
    '2025-01-29T17:38:00+00', 
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
    '2025-01-29T17:39:00+00', 
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
    '2025-01-29T17:40:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-30T16:14:00+00', 
    '2025-01-30T16:27:00+00', 
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
    '2025-01-30T16:15:00+00', 
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
    '2025-01-30T16:17:00+00', 
    '2025-01-30T16:18:30+00', 
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
    '2025-01-31T13:27:00+00', 
    '2025-01-31T13:41:00+00', 
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
    '2025-01-31T13:28:00+00', 
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
    '2025-01-31T13:29:00+00', 
    '2025-01-31T13:34:00+00', 
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
    '2025-01-31T13:30:00+00', 
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
    '2025-01-31T13:31:00+00', 
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
    '2025-01-31T13:32:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-31T13:32:00+00', 
    '2025-01-31T13:39:00+00', 
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
    '2025-01-31T13:37:00+00', 
    34, 
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
    '2025-01-31T13:35:00+00', 
    47, 
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
    '2025-01-31T13:38:00+00', 
    40, 
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
    '2025-01-31T13:40:00+00', 
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
    '2025-01-31T13:34:00+00', 
    53, 
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
    '2025-01-31T13:33:00+00', 
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
    '2025-01-31T13:39:00+00', 
    55, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T13:28:00+00', 
    '2025-02-03T13:52:00+00', 
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
    '2025-02-03T13:29:00+00', 
    9, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T18:45:00+00', 
    '2025-02-04T18:55:00+00', 
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
    '2025-02-04T18:46:00+00', 
    23, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T18:47:00+00', 
    '2025-02-04T18:57:00+00', 
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
    '2025-02-04T18:48:00+00', 
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
    '2025-02-04T18:49:00+00', 
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
    '2025-02-04T18:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-04T18:48:00+00', 
    '2025-02-04T18:49:30+00', 
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
    '2025-02-05T17:34:00+00', 
    '2025-02-05T17:49:00+00', 
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
    '2025-02-05T17:35:00+00', 
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
    '2025-02-06T15:14:00+00', 
    '2025-02-06T15:23:00+00', 
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
    '2025-02-06T15:15:00+00', 
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
    '2025-02-06T15:16:00+00', 
    '2025-02-06T15:26:00+00', 
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
    '2025-02-06T15:17:00+00', 
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
    '2025-02-06T15:18:00+00', 
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
    '2025-02-06T15:19:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-06T15:19:00+00', 
    '2025-02-06T15:27:00+00', 
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
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-02-06T15:21:00+00', 
    46, 
    now()
);

-- From chunk_010.sql
-- SQL Chunk 10
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 10/131 - Kai
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
    '2025-02-06T15:26:00+00', 
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
    '2025-02-06T15:25:00+00', 
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
    '2025-02-06T15:23:00+00', 
    27, 
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
    '2025-02-06T15:23:00+00', 
    48, 
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
    '2025-02-06T15:25:00+00', 
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
    '2025-02-06T15:22:00+00', 
    50, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-07T17:39:00+00', 
    '2025-02-07T17:56:00+00', 
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
    '2025-02-07T17:40:00+00', 
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
    '2025-02-07T17:42:00+00', 
    '2025-02-07T17:43:30+00', 
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
    '2025-02-10T15:22:00+00', 
    '2025-02-10T15:44:00+00', 
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
    '2025-02-10T15:23:00+00', 
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
    '2025-02-10T15:24:00+00', 
    '2025-02-10T15:27:00+00', 
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
    '2025-02-10T15:25:00+00', 
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
    '2025-02-10T15:26:00+00', 
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
    '2025-02-10T15:27:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-11T10:46:00+00', 
    '2025-02-11T11:06:00+00', 
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
    '2025-02-11T10:47:00+00', 
    16, 
    false, 
    'learning to manage surgery recovery better', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T17:50:00+00', 
    '2025-02-12T18:11:00+00', 
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
    25, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T17:52:00+00', 
    '2025-02-12T17:58:00+00', 
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
    '2025-02-12T17:53:00+00', 
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
    '2025-02-12T17:54:00+00', 
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
    '2025-02-12T17:55:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-12T17:53:00+00', 
    '2025-02-12T17:54:30+00', 
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
    '2025-02-12T17:55:00+00', 
    '2025-02-12T18:01:00+00', 
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
    '2025-02-12T18:01:00+00', 
    39, 
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
    '2025-02-12T17:57:00+00', 
    21, 
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
    '2025-02-12T17:57:00+00', 
    45, 
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
    '2025-02-12T18:00:00+00', 
    41, 
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
    '2025-02-12T17:56:00+00', 
    46, 
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
    '2025-02-12T17:56:00+00', 
    36, 
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
    '2025-02-12T17:57:00+00', 
    59, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-13T10:52:00+00', 
    '2025-02-13T11:02:00+00', 
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
    '2025-02-13T10:53:00+00', 
    6, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T11:22:00+00', 
    '2025-02-14T11:41:00+00', 
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
    11, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-14T11:24:00+00', 
    '2025-02-14T11:30:00+00', 
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
    '2025-02-14T11:25:00+00', 
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
    '2025-02-14T11:26:00+00', 
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
    '2025-02-14T11:27:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T13:00:00+00', 
    '2025-02-17T13:20:00+00', 
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
    '2025-02-17T13:01:00+00', 
    27, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T13:03:00+00', 
    '2025-02-17T13:04:30+00', 
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
    '2025-02-18T13:09:00+00', 
    '2025-02-18T13:17:00+00', 
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
    '2025-02-18T13:10:00+00', 
    16, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-18T13:11:00+00', 
    '2025-02-18T13:16:00+00', 
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
    '2025-02-18T13:12:00+00', 
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
    '2025-02-18T13:13:00+00', 
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
    '2025-02-18T13:14:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-18T13:14:00+00', 
    '2025-02-18T13:22:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.86, 
    false,
    'completed', 
    null,
    now(), 
    now()
);
