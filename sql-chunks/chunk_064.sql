-- SQL Chunk 64
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 64/131 - Ravi
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-20T17:15:00+00', 
    '2025-01-20T17:30:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-20T17:16:00+00', 
    20, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-20T17:18:00+00', 
    '2025-01-20T17:20:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-22T16:15:00+00', 
    '2025-01-22T16:38:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-22T16:16:00+00', 
    11, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-22T16:17:00+00', 
    '2025-01-22T16:26:00+00', 
    3, 
    'learning to handle bilingual confidence better each day', 
    55, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-01-22T16:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-22T16:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-01-22T16:20:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-22T16:20:00+00', 
    '2025-01-22T16:29:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-22T16:25:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-01-22T16:25:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-22T16:25:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-22T16:22:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-22T16:24:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-22T16:25:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-22T16:21:00+00', 
    25, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-24T16:00:00+00', 
    '2025-01-24T16:21:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-24T16:01:00+00', 
    23, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:45:00+00', 
    '2025-01-27T17:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-27T16:46:00+00', 
    12, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:47:00+00', 
    '2025-01-27T16:52:00+00', 
    3, 
    'learning to handle bilingual confidence better each day', 
    55, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-01-27T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-01-27T16:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-01-27T16:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:48:00+00', 
    '2025-01-27T16:50:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-29T15:30:00+00', 
    '2025-01-29T15:48:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'very_happy', 
    5, 
    '2025-01-29T15:31:00+00', 
    17, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T15:45:00+00', 
    '2025-01-31T16:01:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-31T15:46:00+00', 
    14, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T15:47:00+00', 
    '2025-01-31T15:54:00+00', 
    3, 
    'learning to handle bilingual confidence better each day', 
    55, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-01-31T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-01-31T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-01-31T15:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T15:50:00+00', 
    '2025-01-31T15:59:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-31T15:53:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-31T15:57:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-31T15:58:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-31T15:55:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-31T15:56:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-31T15:51:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-31T15:56:00+00', 
    48, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-03T15:00:00+00', 
    '2025-02-03T15:14:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-03T15:01:00+00', 
    11, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-03T15:03:00+00', 
    '2025-02-03T15:05:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0014', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-05T15:15:00+00', 
    '2025-02-05T15:38:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0014', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-05T15:16:00+00', 
    24, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0014', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-05T15:17:00+00', 
    '2025-02-05T15:22:00+00', 
    3, 
    'learning to handle bilingual confidence better each day', 
    55, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0014'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-02-05T15:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0014'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    2, 
    '2025-02-05T15:19:00+00', 
    now()
);