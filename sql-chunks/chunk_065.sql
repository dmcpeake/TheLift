-- SQL Chunk 65
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 65/131 - Ravi
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0014'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-02-05T15:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0015', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-07T16:00:00+00', 
    '2025-02-07T16:21:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0015', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-07T16:01:00+00', 
    18, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T15:00:00+00', 
    '2025-02-10T15:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-10T15:01:00+00', 
    10, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T15:02:00+00', 
    '2025-02-10T15:05:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    1, 
    '2025-02-10T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-02-10T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    3, 
    '2025-02-10T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T15:03:00+00', 
    '2025-02-10T15:05:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T15:05:00+00', 
    '2025-02-10T15:14:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-02-10T15:09:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-10T15:12:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-02-10T15:12:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-02-10T15:07:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-10T15:08:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-10T15:10:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-02-10T15:09:00+00', 
    37, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0017', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-12T17:45:00+00', 
    '2025-02-12T17:55:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0017', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-12T17:46:00+00', 
    26, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0018', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-14T17:15:00+00', 
    '2025-02-14T17:33:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0018', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-14T17:16:00+00', 
    29, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0018', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-14T17:17:00+00', 
    '2025-02-14T17:22:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0018'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    1, 
    '2025-02-14T17:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0018'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-02-14T17:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0018'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-02-14T17:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0019', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-17T15:45:00+00', 
    '2025-02-17T16:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0019', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'very_happy', 
    5, 
    '2025-02-17T15:46:00+00', 
    25, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0019', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-17T15:48:00+00', 
    '2025-02-17T15:50:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0020', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-19T15:45:00+00', 
    '2025-02-19T16:00:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0020', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-19T15:46:00+00', 
    11, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0020', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-19T15:47:00+00', 
    '2025-02-19T15:54:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-02-19T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    2, 
    '2025-02-19T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-02-19T15:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0020', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-19T15:50:00+00', 
    '2025-02-19T15:59:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-19T15:54:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-02-19T15:55:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-02-19T15:53:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-19T15:58:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-02-19T15:53:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-02-19T15:57:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0020'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-02-19T15:54:00+00', 
    46, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0021', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-21T16:30:00+00', 
    '2025-02-21T16:38:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0021', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-21T16:31:00+00', 
    5, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ravi0022', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T17:15:00+00', 
    '2025-02-24T17:39:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0022', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-24T17:16:00+00', 
    24, 
    false, 
    'feeling confident about bilingual confidence', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ravi0022', 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T17:17:00+00', 
    '2025-02-24T17:25:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0022'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-02-24T17:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ravi0022'), 
    'aaaabbbb-cccc-dddd-eeee-222222222228', 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-02-24T17:19:00+00', 
    now()
);