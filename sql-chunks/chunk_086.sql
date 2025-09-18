-- SQL Chunk 86
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 86/131 - Oscar
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-maya0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333334', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-maya0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333334', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-maya0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333334', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-maya0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333334', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-maya0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333334', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-maya0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333334', 
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
    '12345678-1234-5678-abcd-osca0001', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-06T15:30:00+00', 
    '2025-01-06T15:47:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0001', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0001', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    '12345678-1234-5678-abcd-osca0002', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-13T15:30:00+00', 
    '2025-01-13T15:50:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0002', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0002', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0002'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0002'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0002'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    '12345678-1234-5678-abcd-osca0003', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-20T14:30:00+00', 
    '2025-01-20T14:45:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0003', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    '12345678-1234-5678-abcd-osca0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-27T15:00:00+00', 
    '2025-01-27T15:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-osca0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    '12345678-1234-5678-abcd-osca0005', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-03T16:30:00+00', 
    '2025-02-03T16:44:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0005', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    '12345678-1234-5678-abcd-osca0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-10T15:00:00+00', 
    '2025-02-10T15:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    '12345678-1234-5678-abcd-osca0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-17T15:30:00+00', 
    '2025-02-17T15:38:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    '12345678-1234-5678-abcd-osca0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T15:30:00+00', 
    '2025-02-24T15:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-osca0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-osca0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333335', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
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