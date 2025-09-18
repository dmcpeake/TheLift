-- SQL Chunk 51
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 51/131 - Tyler
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0024', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-28T17:35:00+00', 
    '2025-02-28T17:44:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_friends', 
    'happy', 
    4, 
    'have good friends now', 
    21, 
    '2025-02-28T17:37:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-28T17:41:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_health', 
    'sad', 
    2, 
    'struggling today', 
    16, 
    '2025-02-28T17:39:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-28T17:41:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-28T17:41:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_safety', 
    'sad', 
    2, 
    'challenging with safety', 
    23, 
    '2025-02-28T17:37:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-28T17:38:00+00', 
    57, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0025', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-03T16:45:00+00', 
    '2025-03-03T17:09:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0025', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-03T16:46:00+00', 
    11, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0025', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-03T16:48:00+00', 
    '2025-03-03T16:53:00+00', 
    300, 
    'guided_4_7_8', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0026', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-05T15:00:00+00', 
    '2025-03-05T15:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0026', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-05T15:01:00+00', 
    29, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0026', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-05T15:02:00+00', 
    '2025-03-05T15:12:00+00', 
    3, 
    'learning to handle social struggles better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0026'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    1, 
    '2025-03-05T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0026'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    2, 
    '2025-03-05T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0026'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    3, 
    '2025-03-05T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0027', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-07T17:00:00+00', 
    '2025-03-07T17:19:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0027', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-07T17:01:00+00', 
    23, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:00:00+00', 
    '2025-03-10T15:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-10T15:01:00+00', 
    25, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:02:00+00', 
    '2025-03-10T15:10:00+00', 
    3, 
    'learning to handle social struggles better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    1, 
    '2025-03-10T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    2, 
    '2025-03-10T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    3, 
    '2025-03-10T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:03:00+00', 
    '2025-03-10T15:05:30+00', 
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
    '12345678-1234-5678-abcd-tyle0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:05:00+00', 
    '2025-03-10T15:13:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_friends', 
    'happy', 
    4, 
    'have good friends now', 
    21, 
    '2025-03-10T15:10:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-10T15:09:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-10T15:06:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-03-10T15:06:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-10T15:08:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-10T15:12:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-10T15:12:00+00', 
    41, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0029', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-12T17:00:00+00', 
    '2025-03-12T17:21:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0029', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-12T17:01:00+00', 
    8, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0030', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-14T15:00:00+00', 
    '2025-03-14T15:12:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0030', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-14T15:01:00+00', 
    17, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0030', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-14T15:02:00+00', 
    '2025-03-14T15:12:00+00', 
    3, 
    'learning to handle social struggles better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0030'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    1, 
    '2025-03-14T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0030'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    2, 
    '2025-03-14T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0030'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    3, 
    '2025-03-14T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0031', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-17T15:30:00+00', 
    '2025-03-17T15:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0031', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-17T15:31:00+00', 
    17, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0031', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-17T15:33:00+00', 
    '2025-03-17T15:35:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0032', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-19T17:15:00+00', 
    '2025-03-19T17:26:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0032', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-19T17:16:00+00', 
    15, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0032', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-19T17:17:00+00', 
    '2025-03-19T17:20:00+00', 
    3, 
    'learning to handle social struggles better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    1, 
    '2025-03-19T17:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0032'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    2, 
    '2025-03-19T17:19:00+00', 
    now()
);