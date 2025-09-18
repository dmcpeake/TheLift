-- SQL Chunk 128
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 128/131 - Grace
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    3, 
    '2025-02-18T16:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0032', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-18T16:05:00+00', 
    '2025-02-18T16:17:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-18T16:11:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-18T16:08:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-02-18T16:12:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-18T16:09:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-02-18T16:12:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-02-18T16:09:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-18T16:06:00+00', 
    21, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0033', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-19T15:30:00+00', 
    '2025-02-19T15:51:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0033', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-19T15:31:00+00', 
    10, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-20T16:00:00+00', 
    '2025-02-20T16:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-20T16:01:00+00', 
    9, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-20T16:02:00+00', 
    '2025-02-20T16:11:00+00', 
    3, 
    'learning to handle ocd tendencies better each day', 
    49, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0034'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-02-20T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0034'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    2, 
    '2025-02-20T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0034'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    3, 
    '2025-02-20T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-20T16:03:00+00', 
    '2025-02-20T16:05:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0035', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-21T16:30:00+00', 
    '2025-02-21T16:49:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0035', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-21T16:31:00+00', 
    5, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T16:30:00+00', 
    '2025-02-24T16:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-24T16:31:00+00', 
    17, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T16:32:00+00', 
    '2025-02-24T16:38:00+00', 
    3, 
    'learning to handle ocd tendencies better each day', 
    49, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    1, 
    '2025-02-24T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    2, 
    '2025-02-24T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-02-24T16:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T16:35:00+00', 
    '2025-02-24T16:45:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-24T16:40:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-24T16:39:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-02-24T16:42:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-24T16:39:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-02-24T16:37:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-24T16:37:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-grac0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-02-24T16:39:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0037', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-25T15:00:00+00', 
    '2025-02-25T15:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0037', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-25T15:01:00+00', 
    21, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0037', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-25T15:03:00+00', 
    '2025-02-25T15:05:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0038', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-26T14:30:00+00', 
    '2025-02-26T14:55:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0038', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-26T14:31:00+00', 
    10, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0038', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-26T14:32:00+00', 
    '2025-02-26T14:35:00+00', 
    3, 
    'learning to handle ocd tendencies better each day', 
    49, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0038'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-02-26T14:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0038'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-02-26T14:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0038'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    3, 
    '2025-02-26T14:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0039', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-27T15:00:00+00', 
    '2025-02-27T15:24:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0039', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-27T15:01:00+00', 
    30, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-grac0040', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T16:00:00+00', 
    '2025-02-28T16:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0040', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-28T16:01:00+00', 
    22, 
    false, 
    'feeling confident about ocd tendencies', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-grac0040', 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T16:02:00+00', 
    '2025-02-28T16:09:00+00', 
    3, 
    'learning to handle ocd tendencies better each day', 
    49, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0040'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-02-28T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-grac0040'), 
    'aaaabbbb-cccc-dddd-eeee-333333333340', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-02-28T16:04:00+00', 
    now()
);