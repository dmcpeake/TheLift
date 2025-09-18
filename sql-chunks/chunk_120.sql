-- SQL Chunk 120
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 120/131 - Felix
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-13T16:41:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-13T16:42:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-13T16:42:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-13T16:39:00+00', 
    51, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0005', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-15T15:00:00+00', 
    '2025-01-15T15:12:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0005', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-15T15:01:00+00', 
    8, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-17T16:00:00+00', 
    '2025-01-17T16:25:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-17T16:01:00+00', 
    21, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-17T16:02:00+00', 
    '2025-01-17T16:11:00+00', 
    3, 
    'learning to handle speech delay better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-01-17T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    2, 
    '2025-01-17T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-01-17T16:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-20T14:00:00+00', 
    '2025-01-20T14:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-20T14:01:00+00', 
    25, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-20T14:03:00+00', 
    '2025-01-20T14:04:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-22T16:30:00+00', 
    '2025-01-22T16:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-22T16:31:00+00', 
    27, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-22T16:32:00+00', 
    '2025-01-22T16:37:00+00', 
    3, 
    'learning to handle speech delay better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-22T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-22T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    3, 
    '2025-01-22T16:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-22T16:35:00+00', 
    '2025-01-22T16:44:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-22T16:38:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-22T16:43:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-22T16:41:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-22T16:36:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-22T16:37:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-22T16:42:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-22T16:42:00+00', 
    27, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0009', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-24T15:30:00+00', 
    '2025-01-24T15:46:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0009', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-24T15:31:00+00', 
    6, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-27T14:00:00+00', 
    '2025-01-27T14:12:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-27T14:01:00+00', 
    25, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-27T14:02:00+00', 
    '2025-01-27T14:11:00+00', 
    3, 
    'learning to handle speech delay better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0010'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    1, 
    '2025-01-27T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0010'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    2, 
    '2025-01-27T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0010'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-01-27T14:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-27T14:03:00+00', 
    '2025-01-27T14:04:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0011', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-29T16:30:00+00', 
    '2025-01-29T16:49:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0011', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-29T16:31:00+00', 
    15, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0012', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-31T16:30:00+00', 
    '2025-01-31T16:55:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0012', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-31T16:31:00+00', 
    5, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0012', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-31T16:32:00+00', 
    '2025-01-31T16:36:00+00', 
    3, 
    'learning to handle speech delay better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-31T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0012', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-31T16:35:00+00', 
    '2025-01-31T16:44:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-31T16:40:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-31T16:36:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-31T16:43:00+00', 
    56, 
    now()
);