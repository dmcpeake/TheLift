-- SQL Chunk 117
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 117/131 - Dex
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-10T16:22:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-03-10T16:21:00+00', 
    51, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0029', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-12T17:45:00+00', 
    '2025-03-12T17:54:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0029', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-12T17:46:00+00', 
    13, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0030', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-14T16:45:00+00', 
    '2025-03-14T17:05:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0030', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-14T16:46:00+00', 
    8, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0030', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-14T16:47:00+00', 
    '2025-03-14T16:54:00+00', 
    3, 
    'learning to handle selective mutism school better each', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0030'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-03-14T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0030'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-03-14T16:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0030'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-03-14T16:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0031', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-17T15:00:00+00', 
    '2025-03-17T15:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0031', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-17T15:01:00+00', 
    28, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0031', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-17T15:03:00+00', 
    '2025-03-17T15:04:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0032', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-19T15:00:00+00', 
    '2025-03-19T15:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0032', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-19T15:01:00+00', 
    15, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0032', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-19T15:02:00+00', 
    '2025-03-19T15:07:00+00', 
    3, 
    'learning to handle selective mutism school better each', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-03-19T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-19T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-03-19T15:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0032', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-19T15:05:00+00', 
    '2025-03-19T15:12:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-19T15:07:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-19T15:06:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-19T15:08:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-19T15:06:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-19T15:13:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-19T15:10:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-19T15:06:00+00', 
    46, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0033', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-21T16:00:00+00', 
    '2025-03-21T16:22:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0033', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-21T16:01:00+00', 
    25, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0034', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T16:00:00+00', 
    '2025-03-24T16:15:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0034', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-24T16:01:00+00', 
    15, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0034', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T16:02:00+00', 
    '2025-03-24T16:07:00+00', 
    3, 
    'learning to handle selective mutism school better each', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0034'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-03-24T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0034'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-03-24T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0034'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-24T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0034', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T16:03:00+00', 
    '2025-03-24T16:04:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0035', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-26T15:00:00+00', 
    '2025-03-26T15:12:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0035', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-26T15:01:00+00', 
    19, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-dex0036', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-28T15:45:00+00', 
    '2025-03-28T15:56:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0036', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-28T15:46:00+00', 
    29, 
    false, 
    'feeling confident about selective mutism school', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0036', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-28T15:47:00+00', 
    '2025-03-28T15:54:00+00', 
    3, 
    'learning to handle selective mutism school better each', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-28T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-03-28T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-03-28T15:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-dex0036', 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-28T15:50:00+00', 
    '2025-03-28T16:00:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-28T15:58:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-28T15:56:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-28T15:52:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-03-28T15:52:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-dex0036'), 
    'aaaabbbb-cccc-dddd-eeee-222222222229', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-28T15:51:00+00', 
    46, 
    now()
);