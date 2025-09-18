-- Combined SQL Batch 4
-- Contains chunks 31 to 40


-- From chunk_031.sql
-- SQL Chunk 31
-- Lines: ~745
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 31/131 - Lucas
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
    '2025-03-10T13:38:00+00', 
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
    '2025-03-10T13:39:00+00', 
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
    '2025-03-10T13:40:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T13:38:00+00', 
    '2025-03-10T13:43:00+00', 
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
    '2025-03-11T15:20:00+00', 
    '2025-03-11T15:40:00+00', 
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
    '2025-03-11T15:21:00+00', 
    27, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T18:44:00+00', 
    '2025-03-12T19:03:00+00', 
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
    '2025-03-12T18:45:00+00', 
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
    '2025-03-12T18:46:00+00', 
    '2025-03-12T18:53:00+00', 
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
    '2025-03-12T18:47:00+00', 
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
    '2025-03-12T18:48:00+00', 
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
    '2025-03-12T18:49:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-12T18:49:00+00', 
    '2025-03-12T18:55:00+00', 
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
    '2025-03-12T18:52:00+00', 
    36, 
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
    '2025-03-12T18:54:00+00', 
    57, 
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
    '2025-03-12T18:54:00+00', 
    60, 
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
    '2025-03-12T18:54:00+00', 
    45, 
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
    '2025-03-12T18:51:00+00', 
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
    '2025-03-12T18:51:00+00', 
    41, 
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
    '2025-03-12T18:55:00+00', 
    27, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-13T14:49:00+00', 
    '2025-03-13T15:13:00+00', 
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
    '2025-03-13T14:50:00+00', 
    19, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-13T14:52:00+00', 
    '2025-03-13T14:54:30+00', 
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
    'happy', 
    4, 
    '2025-03-14T16:58:00+00', 
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
    '2025-03-14T16:59:00+00', 
    '2025-03-14T17:08:00+00', 
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
    '2025-03-14T17:00:00+00', 
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
    '2025-03-14T17:01:00+00', 
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
    '2025-03-14T17:02:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-17T12:32:00+00', 
    '2025-03-17T12:57:00+00', 
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
    '2025-03-17T12:33:00+00', 
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
    '2025-03-18T14:22:00+00', 
    '2025-03-18T14:46:00+00', 
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
    '2025-03-18T14:23:00+00', 
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
    '2025-03-18T14:24:00+00', 
    '2025-03-18T14:28:00+00', 
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
    '2025-03-18T14:25:00+00', 
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
    '2025-03-18T14:26:00+00', 
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
    '2025-03-18T14:27:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-18T14:25:00+00', 
    '2025-03-18T14:27:30+00', 
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
    '2025-03-18T14:27:00+00', 
    '2025-03-18T14:33:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-18T14:30:00+00', 
    35, 
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
    '2025-03-18T14:32:00+00', 
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
    '2025-03-18T14:29:00+00', 
    49, 
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
    '2025-03-18T14:31:00+00', 
    39, 
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
    '2025-03-18T14:30:00+00', 
    24, 
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
    '2025-03-18T14:33:00+00', 
    38, 
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
    '2025-03-18T14:31:00+00', 
    46, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-19T11:18:00+00', 
    '2025-03-19T11:33:00+00', 
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
    '2025-03-19T11:19:00+00', 
    18, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-20T12:14:00+00', 
    '2025-03-20T12:28:00+00', 
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
    '2025-03-20T12:15:00+00', 
    27, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

-- From chunk_032.sql
-- SQL Chunk 32
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 32/131 - Amara
INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-20T12:16:00+00', 
    '2025-03-20T12:20:00+00', 
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
    '2025-03-20T12:17:00+00', 
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
    '2025-03-20T12:18:00+00', 
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
    '2025-03-20T12:19:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T10:27:00+00', 
    '2025-03-21T10:38:00+00', 
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
    '2025-03-21T10:28:00+00', 
    14, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-21T10:30:00+00', 
    '2025-03-21T10:32:30+00', 
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
    '2025-03-24T18:24:00+00', 
    '2025-03-24T18:32:00+00', 
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
    '2025-03-24T18:25:00+00', 
    19, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T18:26:00+00', 
    '2025-03-24T18:32:00+00', 
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
    '2025-03-24T18:27:00+00', 
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
    '2025-03-24T18:28:00+00', 
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
    '2025-03-24T18:29:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T18:29:00+00', 
    '2025-03-24T18:36:00+00', 
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
    '2025-03-24T18:37:00+00', 
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
    '2025-03-24T18:31:00+00', 
    53, 
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
    '2025-03-24T18:35:00+00', 
    35, 
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
    '2025-03-24T18:31:00+00', 
    24, 
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
    '2025-03-24T18:30:00+00', 
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
    '2025-03-24T18:36:00+00', 
    56, 
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
    '2025-03-24T18:32:00+00', 
    30, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-25T18:10:00+00', 
    '2025-03-25T18:20:00+00', 
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
    '2025-03-25T18:11:00+00', 
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
    '2025-03-26T10:48:00+00', 
    '2025-03-26T10:56:00+00', 
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
    '2025-03-26T10:49:00+00', 
    30, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T10:50:00+00', 
    '2025-03-26T10:59:00+00', 
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
    '2025-03-26T10:51:00+00', 
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
    '2025-03-26T10:52:00+00', 
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
    '2025-03-26T10:53:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-26T10:51:00+00', 
    '2025-03-26T10:53:30+00', 
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
    '2025-03-27T11:02:00+00', 
    '2025-03-27T11:17:00+00', 
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
    '2025-03-27T11:03:00+00', 
    20, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T10:41:00+00', 
    '2025-03-28T10:57:00+00', 
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
    '2025-03-28T10:42:00+00', 
    13, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T10:43:00+00', 
    '2025-03-28T10:47:00+00', 
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
    '2025-03-28T10:44:00+00', 
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
    '2025-03-28T10:45:00+00', 
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
    '2025-03-28T10:46:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-28T10:46:00+00', 
    '2025-03-28T10:55:00+00', 
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
    '2025-03-28T10:52:00+00', 
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
    '2025-03-28T10:51:00+00', 
    41, 
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
    '2025-03-28T10:50:00+00', 
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
    '2025-03-28T10:49:00+00', 
    54, 
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
    '2025-03-28T10:47:00+00', 
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
    '2025-03-28T10:51:00+00', 
    42, 
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
    '2025-03-28T10:52:00+00', 
    57, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T14:04:00+00', 
    '2025-01-06T14:17:00+00', 
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
    '2025-01-06T14:05:00+00', 
    16, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-06T14:07:00+00', 
    '2025-01-06T14:08:15+00', 
    75, 
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
    '2025-01-13T16:27:00+00', 
    '2025-01-13T16:50:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

-- From chunk_033.sql
-- SQL Chunk 33
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 33/131 - Amara
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-01-13T16:28:00+00', 
    14, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-13T16:29:00+00', 
    '2025-01-13T16:34:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    1, 
    '2025-01-13T16:30:00+00', 
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
    2, 
    '2025-01-13T16:31:00+00', 
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
    3, 
    '2025-01-13T16:32:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-20T18:56:00+00', 
    '2025-01-20T19:04:00+00', 
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
    '2025-01-20T18:57:00+00', 
    8, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T12:42:00+00', 
    '2025-01-27T12:58:00+00', 
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
    '2025-01-27T12:43:00+00', 
    25, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T12:44:00+00', 
    '2025-01-27T12:49:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    '2025-01-27T12:45:00+00', 
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
    '2025-01-27T12:46:00+00', 
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
    '2025-01-27T12:47:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-01-27T12:45:00+00', 
    '2025-01-27T12:47:30+00', 
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
    '2025-01-27T12:47:00+00', 
    '2025-01-27T12:57:00+00', 
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
    '2025-01-27T12:53:00+00', 
    20, 
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
    '2025-01-27T12:51:00+00', 
    44, 
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
    '2025-01-27T12:51:00+00', 
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
    '2025-01-27T12:49:00+00', 
    31, 
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
    '2025-01-27T12:55:00+00', 
    31, 
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
    '2025-01-27T12:52:00+00', 
    52, 
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
    '2025-01-27T12:48:00+00', 
    42, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-03T11:55:00+00', 
    '2025-02-03T12:14:00+00', 
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
    '2025-02-03T11:56:00+00', 
    9, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:00:00+00', 
    '2025-02-10T10:10:00+00', 
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
    '2025-02-10T10:01:00+00', 
    13, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-10T10:02:00+00', 
    '2025-02-10T10:08:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    1, 
    '2025-02-10T10:03:00+00', 
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
    '2025-02-10T10:04:00+00', 
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
    '2025-02-10T10:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T12:00:00+00', 
    '2025-02-17T12:18:00+00', 
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
    '2025-02-17T12:01:00+00', 
    29, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-17T12:03:00+00', 
    '2025-02-17T12:08:00+00', 
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
    '2025-02-24T12:25:00+00', 
    '2025-02-24T12:37:00+00', 
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
    '2025-02-24T12:26:00+00', 
    10, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T12:27:00+00', 
    '2025-02-24T12:34:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    1, 
    '2025-02-24T12:28:00+00', 
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
    '2025-02-24T12:29:00+00', 
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
    '2025-02-24T12:30:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-02-24T12:30:00+00', 
    '2025-02-24T12:40:00+00', 
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
    '2025-02-24T12:38:00+00', 
    51, 
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
    '2025-02-24T12:33:00+00', 
    29, 
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
    '2025-02-24T12:35:00+00', 
    24, 
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
    '2025-02-24T12:31:00+00', 
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
    '2025-02-24T12:32:00+00', 
    54, 
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
    '2025-02-24T12:32:00+00', 
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
    '2025-02-24T12:37:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-03T12:54:00+00', 
    '2025-03-03T13:04:00+00', 
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
    '2025-03-03T12:55:00+00', 
    18, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T12:23:00+00', 
    '2025-03-10T12:34:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

-- From chunk_034.sql
-- SQL Chunk 34
-- Lines: ~752
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 34/131 - Oliver
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    'happy', 
    4, 
    '2025-03-10T12:24:00+00', 
    9, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T12:25:00+00', 
    '2025-03-10T12:35:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-03-10T12:26:00+00', 
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
    '2025-03-10T12:27:00+00', 
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
    '2025-03-10T12:28:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-10T12:26:00+00', 
    '2025-03-10T12:28:30+00', 
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
    '2025-03-17T17:33:00+00', 
    '2025-03-17T17:55:00+00', 
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
    '2025-03-17T17:34:00+00', 
    16, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T12:17:00+00', 
    '2025-03-24T12:35:00+00', 
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
    '2025-03-24T12:18:00+00', 
    30, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T12:19:00+00', 
    '2025-03-24T12:27:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    '2025-03-24T12:20:00+00', 
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
    '2025-03-24T12:21:00+00', 
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
    '2025-03-24T12:22:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Sarah Williams' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'St. Mary''s Hospital'), 
    '2025-03-24T12:22:00+00', 
    '2025-03-24T12:34:00+00', 
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
    '2025-03-24T12:25:00+00', 
    23, 
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
    '2025-03-24T12:30:00+00', 
    42, 
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
    '2025-03-24T12:28:00+00', 
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
    '2025-03-24T12:27:00+00', 
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
    '2025-03-24T12:27:00+00', 
    55, 
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
    '2025-03-24T12:29:00+00', 
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
    '2025-03-24T12:30:00+00', 
    43, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-06T15:00:00+00', 
    '2025-01-06T15:13:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-06T15:01:00+00', 
    23, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-06T15:03:00+00', 
    '2025-01-06T15:05:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-08T16:30:00+00', 
    '2025-01-08T16:41:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-08T16:31:00+00', 
    25, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-08T16:32:00+00', 
    '2025-01-08T16:36:00+00', 
    3, 
    'finally understand why reading is hard for me', 
    45, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-01-08T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-01-08T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-01-08T16:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-10T16:30:00+00', 
    '2025-01-10T16:42:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-10T16:31:00+00', 
    11, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-13T17:45:00+00', 
    '2025-01-13T17:55:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-13T17:46:00+00', 
    20, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-13T17:47:00+00', 
    '2025-01-13T17:57:00+00', 
    3, 
    'finally understand why reading is hard for me', 
    45, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-01-13T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-01-13T17:49:00+00', 
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
    '2025-01-13T17:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-13T17:48:00+00', 
    '2025-01-13T17:50:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-13T17:50:00+00', 
    '2025-01-13T17:57:00+00', 
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
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-13T17:51:00+00', 
    25, 
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
    '2025-01-13T17:52:00+00', 
    39, 
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
    'proud of my progress', 
    20, 
    '2025-01-13T17:51:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-01-13T17:51:00+00', 
    57, 
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
    '2025-01-13T17:58:00+00', 
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
    '2025-01-13T17:55:00+00', 
    26, 
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
    '2025-01-13T17:53:00+00', 
    45, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-15T17:30:00+00', 
    '2025-01-15T17:43:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-15T17:31:00+00', 
    19, 
    false, 
    'reading is getting easier with support', 
    now()
);

-- From chunk_035.sql
-- SQL Chunk 35
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 35/131 - Oliver
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-17T17:15:00+00', 
    '2025-01-17T17:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-17T17:16:00+00', 
    13, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-17T17:17:00+00', 
    '2025-01-17T17:25:00+00', 
    3, 
    'finally understand why reading is hard for me', 
    45, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-01-17T17:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-01-17T17:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-01-17T17:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-20T15:30:00+00', 
    '2025-01-20T15:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-20T15:31:00+00', 
    19, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-20T15:33:00+00', 
    '2025-01-20T15:35:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-22T15:45:00+00', 
    '2025-01-22T15:57:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-22T15:46:00+00', 
    7, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-22T15:47:00+00', 
    '2025-01-22T15:51:00+00', 
    3, 
    'getting special help makes me feel less stupid', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-01-22T15:48:00+00', 
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
    '2025-01-22T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-01-22T15:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-22T15:50:00+00', 
    '2025-01-22T16:02:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-22T15:57:00+00', 
    25, 
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
    '2025-01-22T15:53:00+00', 
    25, 
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
    'proud of my progress', 
    20, 
    '2025-01-22T15:55:00+00', 
    41, 
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
    '2025-01-22T15:52:00+00', 
    26, 
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
    '2025-01-22T15:54:00+00', 
    26, 
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
    '2025-01-22T15:56:00+00', 
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
    '2025-01-22T15:53:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-24T16:00:00+00', 
    '2025-01-24T16:09:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-24T16:01:00+00', 
    29, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-27T16:15:00+00', 
    '2025-01-27T16:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-27T16:16:00+00', 
    9, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-27T16:17:00+00', 
    '2025-01-27T16:27:00+00', 
    3, 
    'getting special help makes me feel less stupid', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-01-27T16:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-01-27T16:19:00+00', 
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
    '2025-01-27T16:20:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-27T16:18:00+00', 
    '2025-01-27T16:20:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-29T15:30:00+00', 
    '2025-01-29T15:47:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-29T15:31:00+00', 
    9, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-31T16:00:00+00', 
    '2025-01-31T16:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-31T16:01:00+00', 
    15, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-31T16:02:00+00', 
    '2025-01-31T16:11:00+00', 
    3, 
    'getting special help makes me feel less stupid', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-01-31T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-01-31T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    3, 
    '2025-01-31T16:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-31T16:05:00+00', 
    '2025-01-31T16:15:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-31T16:12:00+00', 
    46, 
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
    '2025-01-31T16:13:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'sad', 
    2, 
    'frustrated with reading', 
    23, 
    '2025-01-31T16:09:00+00', 
    55, 
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
    '2025-01-31T16:11:00+00', 
    59, 
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
    '2025-01-31T16:12:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'sad', 
    2, 
    'challenging with safety', 
    23, 
    '2025-01-31T16:10:00+00', 
    25, 
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
    '2025-01-31T16:10:00+00', 
    51, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-03T15:00:00+00', 
    '2025-02-03T15:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'very_happy', 
    5, 
    '2025-02-03T15:01:00+00', 
    12, 
    false, 
    'reading is getting easier with support', 
    now()
);

-- From chunk_036.sql
-- SQL Chunk 36
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 36/131 - Oliver
INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-03T15:03:00+00', 
    '2025-02-03T15:05:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-05T16:15:00+00', 
    '2025-02-05T16:39:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-05T16:16:00+00', 
    19, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-05T16:17:00+00', 
    '2025-02-05T16:25:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-02-05T16:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    2, 
    '2025-02-05T16:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    3, 
    '2025-02-05T16:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-07T15:15:00+00', 
    '2025-02-07T15:26:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-07T15:16:00+00', 
    20, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-10T17:30:00+00', 
    '2025-02-10T17:44:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-10T17:31:00+00', 
    7, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-10T17:32:00+00', 
    '2025-02-10T17:36:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-02-10T17:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    2, 
    '2025-02-10T17:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-02-10T17:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-10T17:33:00+00', 
    '2025-02-10T17:35:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-10T17:35:00+00', 
    '2025-02-10T17:43:00+00', 
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
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-10T17:38:00+00', 
    27, 
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
    '2025-02-10T17:38:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'sad', 
    2, 
    'frustrated with reading', 
    23, 
    '2025-02-10T17:40:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-02-10T17:38:00+00', 
    47, 
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
    '2025-02-10T17:40:00+00', 
    58, 
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
    '2025-02-10T17:37:00+00', 
    43, 
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
    '2025-02-10T17:36:00+00', 
    40, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-12T17:30:00+00', 
    '2025-02-12T17:41:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-12T17:31:00+00', 
    17, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-14T17:45:00+00', 
    '2025-02-14T17:55:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-14T17:46:00+00', 
    12, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-14T17:47:00+00', 
    '2025-02-14T17:53:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-02-14T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-02-14T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-02-14T17:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-17T16:30:00+00', 
    '2025-02-17T16:44:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-17T16:31:00+00', 
    7, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-17T16:33:00+00', 
    '2025-02-17T16:35:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-19T16:30:00+00', 
    '2025-02-19T16:53:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-19T16:31:00+00', 
    29, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-19T16:32:00+00', 
    '2025-02-19T16:37:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    1, 
    '2025-02-19T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-02-19T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    3, 
    '2025-02-19T16:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-19T16:35:00+00', 
    '2025-02-19T16:47:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-19T16:37:00+00', 
    23, 
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
    '2025-02-19T16:39:00+00', 
    22, 
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
    'getting support helps', 
    21, 
    '2025-02-19T16:43:00+00', 
    39, 
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
    '2025-02-19T16:40:00+00', 
    21, 
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
    '2025-02-19T16:37:00+00', 
    59, 
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
    '2025-02-19T16:38:00+00', 
    21, 
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
    '2025-02-19T16:43:00+00', 
    39, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-21T15:30:00+00', 
    '2025-02-21T15:40:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

-- From chunk_037.sql
-- SQL Chunk 37
-- Lines: ~752
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 37/131 - Oliver
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-21T15:31:00+00', 
    29, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-24T17:30:00+00', 
    '2025-02-24T17:39:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-24T17:31:00+00', 
    10, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-24T17:32:00+00', 
    '2025-02-24T17:40:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    1, 
    '2025-02-24T17:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-02-24T17:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-02-24T17:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-24T17:33:00+00', 
    '2025-02-24T17:38:00+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-26T17:30:00+00', 
    '2025-02-26T17:48:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-26T17:31:00+00', 
    15, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-28T15:30:00+00', 
    '2025-02-28T15:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-02-28T15:31:00+00', 
    6, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-28T15:32:00+00', 
    '2025-02-28T15:35:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    1, 
    '2025-02-28T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    2, 
    '2025-02-28T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-02-28T15:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-02-28T15:35:00+00', 
    '2025-02-28T15:42:00+00', 
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
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-28T15:39:00+00', 
    41, 
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
    '2025-02-28T15:40:00+00', 
    22, 
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
    'proud of my progress', 
    20, 
    '2025-02-28T15:43:00+00', 
    52, 
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
    '2025-02-28T15:38:00+00', 
    36, 
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
    '2025-02-28T15:41:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'sad', 
    2, 
    'challenging with safety', 
    23, 
    '2025-02-28T15:37:00+00', 
    44, 
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
    '2025-02-28T15:37:00+00', 
    30, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-03T17:15:00+00', 
    '2025-03-03T17:37:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-03T17:16:00+00', 
    17, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-03T17:18:00+00', 
    '2025-03-03T17:23:00+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-05T16:15:00+00', 
    '2025-03-05T16:33:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-05T16:16:00+00', 
    24, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-05T16:17:00+00', 
    '2025-03-05T16:23:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-03-05T16:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-03-05T16:19:00+00', 
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
    '2025-03-05T16:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-07T16:45:00+00', 
    '2025-03-07T17:02:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-07T16:46:00+00', 
    23, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-10T15:45:00+00', 
    '2025-03-10T16:03:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-10T15:46:00+00', 
    13, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-10T15:47:00+00', 
    '2025-03-10T15:51:00+00', 
    3, 
    'reading is still hard but i have tools to help', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-10T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-03-10T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-03-10T15:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-10T15:48:00+00', 
    '2025-03-10T15:50:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-10T15:50:00+00', 
    '2025-03-10T15:58:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-10T15:51:00+00', 
    45, 
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
    '2025-03-10T15:56:00+00', 
    43, 
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
    'getting support helps', 
    21, 
    '2025-03-10T15:53:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-03-10T15:53:00+00', 
    49, 
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
    '2025-03-10T15:56:00+00', 
    56, 
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
    '2025-03-10T15:58:00+00', 
    38, 
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
    '2025-03-10T15:53:00+00', 
    27, 
    now()
);

-- From chunk_038.sql
-- SQL Chunk 38
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 38/131 - Oliver
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-12T15:30:00+00', 
    '2025-03-12T15:44:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-12T15:31:00+00', 
    5, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-14T15:15:00+00', 
    '2025-03-14T15:37:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-14T15:16:00+00', 
    26, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-14T15:17:00+00', 
    '2025-03-14T15:26:00+00', 
    3, 
    'reading is still hard but i have tools to help', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-14T15:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-03-14T15:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-03-14T15:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-17T17:45:00+00', 
    '2025-03-17T18:06:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-17T17:46:00+00', 
    22, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-17T17:48:00+00', 
    '2025-03-17T17:50:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-19T17:15:00+00', 
    '2025-03-19T17:36:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-19T17:16:00+00', 
    14, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-19T17:17:00+00', 
    '2025-03-19T17:20:00+00', 
    3, 
    'reading is still hard but i have tools to help', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-03-19T17:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-03-19T17:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    3, 
    '2025-03-19T17:20:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-19T17:20:00+00', 
    '2025-03-19T17:31:00+00', 
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
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-19T17:22:00+00', 
    28, 
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
    '2025-03-19T17:21:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_health', 
    'sad', 
    2, 
    'frustrated with reading', 
    23, 
    '2025-03-19T17:24:00+00', 
    45, 
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
    '2025-03-19T17:26:00+00', 
    46, 
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
    '2025-03-19T17:23:00+00', 
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
    '2025-03-19T17:23:00+00', 
    55, 
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
    '2025-03-19T17:24:00+00', 
    26, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-21T17:00:00+00', 
    '2025-03-21T17:21:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-21T17:01:00+00', 
    7, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-24T15:30:00+00', 
    '2025-03-24T15:53:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-24T15:31:00+00', 
    20, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-24T15:32:00+00', 
    '2025-03-24T15:36:00+00', 
    3, 
    'reading is still hard but i have tools to help', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    1, 
    '2025-03-24T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-03-24T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-03-24T15:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-24T15:33:00+00', 
    '2025-03-24T15:35:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-26T17:45:00+00', 
    '2025-03-26T17:54:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-26T17:46:00+00', 
    6, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-28T16:15:00+00', 
    '2025-03-28T16:34:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-03-28T16:16:00+00', 
    7, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-28T16:17:00+00', 
    '2025-03-28T16:26:00+00', 
    3, 
    'reading is still hard but i have tools to help', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-03-28T16:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-03-28T16:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    3, 
    '2025-03-28T16:20:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-03-28T16:20:00+00', 
    '2025-03-28T16:30:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-28T16:21:00+00', 
    22, 
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
    '2025-03-28T16:21:00+00', 
    36, 
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
    'proud of my progress', 
    20, 
    '2025-03-28T16:28:00+00', 
    54, 
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
    '2025-03-28T16:24:00+00', 
    50, 
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
    '2025-03-28T16:24:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Emma Thompson' AND role = 'Child'), 
    'my_safety', 
    'sad', 
    2, 
    'challenging with safety', 
    23, 
    '2025-03-28T16:28:00+00', 
    33, 
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
    '2025-03-28T16:25:00+00', 
    22, 
    now()
);

-- From chunk_039.sql
-- SQL Chunk 39
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 39/131 - Jayden
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-06T16:30:00+00', 
    '2025-01-06T16:49:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-06T16:31:00+00', 
    25, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-06T16:33:00+00', 
    '2025-01-06T16:34:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-07T15:45:00+00', 
    '2025-01-07T15:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-07T15:46:00+00', 
    16, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-07T15:47:00+00', 
    '2025-01-07T15:54:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-01-07T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-07T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-01-07T15:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-08T15:30:00+00', 
    '2025-01-08T15:41:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-08T15:31:00+00', 
    21, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-09T17:00:00+00', 
    '2025-01-09T17:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-09T17:01:00+00', 
    10, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-09T17:02:00+00', 
    '2025-01-09T17:12:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-09T17:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-01-09T17:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-01-09T17:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-09T17:03:00+00', 
    '2025-01-09T17:04:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-09T17:05:00+00', 
    '2025-01-09T17:16:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-09T17:12:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-09T17:06:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-09T17:12:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-09T17:13:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-09T17:08:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-09T17:08:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-09T17:10:00+00', 
    40, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-10T16:15:00+00', 
    '2025-01-10T16:40:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-10T16:16:00+00', 
    25, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-13T16:30:00+00', 
    '2025-01-13T16:44:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-13T16:31:00+00', 
    7, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-13T16:32:00+00', 
    '2025-01-13T16:36:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-01-13T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-13T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-13T16:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-14T15:15:00+00', 
    '2025-01-14T15:28:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-14T15:16:00+00', 
    15, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-14T15:18:00+00', 
    '2025-01-14T15:19:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-15T16:45:00+00', 
    '2025-01-15T16:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-15T16:46:00+00', 
    9, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-15T16:47:00+00', 
    '2025-01-15T16:50:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-15T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-15T16:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-15T16:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-15T16:50:00+00', 
    '2025-01-15T16:57:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-15T16:58:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-15T16:54:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-15T16:55:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-15T16:52:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-15T16:57:00+00', 
    32, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-15T16:52:00+00', 
    31, 
    now()
);

-- From chunk_040.sql
-- SQL Chunk 40
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 40/131 - Jayden
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-15T16:57:00+00', 
    39, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-16T15:30:00+00', 
    '2025-01-16T15:53:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-16T15:31:00+00', 
    26, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-17T16:45:00+00', 
    '2025-01-17T17:05:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-17T16:46:00+00', 
    21, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-17T16:47:00+00', 
    '2025-01-17T16:55:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-01-17T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-01-17T16:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-17T16:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-17T16:48:00+00', 
    '2025-01-17T16:49:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-20T16:30:00+00', 
    '2025-01-20T16:42:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'very_happy', 
    5, 
    '2025-01-20T16:31:00+00', 
    5, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-21T17:45:00+00', 
    '2025-01-21T17:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-21T17:46:00+00', 
    6, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-21T17:47:00+00', 
    '2025-01-21T17:51:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-01-21T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-21T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-01-21T17:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-21T17:50:00+00', 
    '2025-01-21T17:56:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-21T17:58:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-21T17:56:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-21T17:58:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-21T17:57:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-21T17:51:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-21T17:51:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-21T17:56:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-22T15:15:00+00', 
    '2025-01-22T15:39:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'very_happy', 
    5, 
    '2025-01-22T15:16:00+00', 
    19, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-22T15:18:00+00', 
    '2025-01-22T15:19:30+00', 
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
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-23T15:00:00+00', 
    '2025-01-23T15:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-23T15:01:00+00', 
    20, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-23T15:02:00+00', 
    '2025-01-23T15:10:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-01-23T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-01-23T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-01-23T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-24T16:00:00+00', 
    '2025-01-24T16:19:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-24T16:01:00+00', 
    13, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-27T17:45:00+00', 
    '2025-01-27T17:58:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    'happy', 
    4, 
    '2025-01-27T17:46:00+00', 
    27, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-27T17:47:00+00', 
    '2025-01-27T17:52:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-01-27T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-01-27T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-01-27T17:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-27T17:48:00+00', 
    '2025-01-27T17:49:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), (SELECT id FROM public.checkin_sessions WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    (SELECT id FROM public.organisations WHERE name = 'Westfield Primary School'), 
    '2025-01-27T17:50:00+00', 
    '2025-01-27T18:00:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-27T17:54:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-27T17:54:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-27T17:51:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-27T17:55:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child') ORDER BY created_at DESC LIMIT 1), 
    (SELECT id FROM public.profiles WHERE name = 'Aisha Patel' AND role = 'Child'), 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-27T17:53:00+00', 
    26, 
    now()
);
