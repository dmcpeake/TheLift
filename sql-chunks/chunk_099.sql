-- SQL Chunk 99
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 99/131 - Zoe
INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0019', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-17T15:33:00+00', 
    '2025-02-17T15:35:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0020', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-19T16:00:00+00', 
    '2025-02-19T16:19:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0020', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-02-19T16:01:00+00', 
    14, 
    false, 
    'feeling confident about gifted social', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0020', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-19T16:02:00+00', 
    '2025-02-19T16:12:00+00', 
    3, 
    'learning to handle gifted social better each day', 
    48, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    1, 
    '2025-02-19T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    2, 
    '2025-02-19T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    3, 
    '2025-02-19T16:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0020', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-19T16:05:00+00', 
    '2025-02-19T16:12:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-19T16:12:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-19T16:11:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-02-19T16:11:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-19T16:11:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-02-19T16:08:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-19T16:10:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-19T16:10:00+00', 
    36, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0021', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-21T16:30:00+00', 
    '2025-02-21T16:46:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0021', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-21T16:31:00+00', 
    8, 
    false, 
    'feeling confident about gifted social', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T14:00:00+00', 
    '2025-02-24T14:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-24T14:01:00+00', 
    27, 
    false, 
    'feeling confident about gifted social', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T14:02:00+00', 
    '2025-02-24T14:10:00+00', 
    3, 
    'learning to handle gifted social better each day', 
    48, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0022'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    1, 
    '2025-02-24T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0022'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    2, 
    '2025-02-24T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0022'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    3, 
    '2025-02-24T14:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T14:03:00+00', 
    '2025-02-24T14:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0023', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-26T16:30:00+00', 
    '2025-02-26T16:48:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0023', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-26T16:31:00+00', 
    18, 
    false, 
    'feeling confident about gifted social', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T14:30:00+00', 
    '2025-02-28T14:44:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-28T14:31:00+00', 
    30, 
    false, 
    'feeling confident about gifted social', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T14:32:00+00', 
    '2025-02-28T14:40:00+00', 
    3, 
    'learning to handle gifted social better each day', 
    48, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    1, 
    '2025-02-28T14:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    2, 
    '2025-02-28T14:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    3, 
    '2025-02-28T14:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T14:35:00+00', 
    '2025-02-28T14:42:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-28T14:41:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-28T14:38:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-28T14:38:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-28T14:43:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-28T14:40:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-02-28T14:38:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-28T14:40:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0025', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-03T15:00:00+00', 
    '2025-03-03T15:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0025', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-03T15:01:00+00', 
    28, 
    false, 
    'feeling confident about gifted social', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0025', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-03T15:03:00+00', 
    '2025-03-03T15:05:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0026', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-05T14:00:00+00', 
    '2025-03-05T14:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0026', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-03-05T14:01:00+00', 
    7, 
    false, 
    'feeling confident about gifted social', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-zoe0026', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-05T14:02:00+00', 
    '2025-03-05T14:09:00+00', 
    3, 
    'learning to handle gifted social better each day', 
    48, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0026'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    1, 
    '2025-03-05T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0026'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    2, 
    '2025-03-05T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-zoe0026'), 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    3, 
    '2025-03-05T14:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-zoe0027', 
    'aaaabbbb-cccc-dddd-eeee-333333333338', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-07T15:30:00+00', 
    '2025-03-07T15:41:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);