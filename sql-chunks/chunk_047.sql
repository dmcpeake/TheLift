-- SQL Chunk 47
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 47/131 - Sophia
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-01-27T17:55:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-27T17:54:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-01-27T17:58:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-27T17:51:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-27T17:54:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-27T17:55:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-03T15:00:00+00', 
    '2025-02-03T15:16:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-03T15:01:00+00', 
    22, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T17:45:00+00', 
    '2025-02-10T17:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-10T17:46:00+00', 
    21, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T17:47:00+00', 
    '2025-02-10T17:52:00+00', 
    3, 
    'learning to handle high achiever anxiety better each day', 
    56, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-02-10T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-02-10T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-02-10T17:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-17T16:15:00+00', 
    '2025-02-17T16:35:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-17T16:16:00+00', 
    21, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-17T16:18:00+00', 
    '2025-02-17T16:23:00+00', 
    300, 
    'box_breathing', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T15:45:00+00', 
    '2025-02-24T16:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-24T15:46:00+00', 
    15, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T15:47:00+00', 
    '2025-02-24T15:53:00+00', 
    3, 
    'learning to handle high achiever anxiety better each day', 
    56, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-02-24T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-02-24T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    3, 
    '2025-02-24T15:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T15:50:00+00', 
    '2025-02-24T15:56:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-24T15:53:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-02-24T15:51:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-24T15:56:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-24T15:58:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-02-24T15:53:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-24T15:57:00+00', 
    26, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-24T15:55:00+00', 
    49, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-03T15:30:00+00', 
    '2025-03-03T15:55:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-03T15:31:00+00', 
    30, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T16:45:00+00', 
    '2025-03-10T17:08:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-10T16:46:00+00', 
    24, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T16:47:00+00', 
    '2025-03-10T16:55:00+00', 
    3, 
    'learning to handle high achiever anxiety better each day', 
    56, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    1, 
    '2025-03-10T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-03-10T16:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    3, 
    '2025-03-10T16:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T16:48:00+00', 
    '2025-03-10T16:50:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-17T15:45:00+00', 
    '2025-03-17T16:01:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-17T15:46:00+00', 
    27, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-soph0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T15:15:00+00', 
    '2025-03-24T15:25:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-24T15:16:00+00', 
    10, 
    false, 
    'feeling confident about high achiever anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T15:17:00+00', 
    '2025-03-24T15:22:00+00', 
    3, 
    'learning to handle high achiever anxiety better each day', 
    56, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-03-24T15:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-03-24T15:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-soph0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    3, 
    '2025-03-24T15:20:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-soph0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T15:20:00+00', 
    '2025-03-24T15:31:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-soph0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222223', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-24T15:23:00+00', 
    30, 
    now()
);