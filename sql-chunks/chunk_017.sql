-- SQL Chunk 17
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 17/131 - Mia
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0020', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    '12345678-1234-5678-abcd-mia0021', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-21T11:14:00+00', 
    '2025-02-21T11:22:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0021', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    '12345678-1234-5678-abcd-mia0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-24T13:20:00+00', 
    '2025-02-24T13:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0022'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0022'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0022'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    '12345678-1234-5678-abcd-mia0023', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-26T13:08:00+00', 
    '2025-02-26T13:27:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0023', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    '12345678-1234-5678-abcd-mia0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T10:55:00+00', 
    '2025-02-28T11:15:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-mia0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    '12345678-1234-5678-abcd-mia0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-03T13:05:00+00', 
    '2025-03-03T13:29:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    '12345678-1234-5678-abcd-mia0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-05T18:37:00+00', 
    '2025-03-05T18:51:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
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
    '12345678-1234-5678-abcd-mia0027', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-07T13:09:00+00', 
    '2025-03-07T13:26:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0027', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    '12345678-1234-5678-abcd-mia0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T11:02:00+00', 
    '2025-03-10T11:13:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
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