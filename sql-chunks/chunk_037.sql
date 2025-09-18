-- SQL Chunk 37
-- Lines: ~752
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 37/131 - Oliver
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0021', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-21T15:31:00+00', 
    29, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0022', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T17:30:00+00', 
    '2025-02-24T17:39:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0022', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-24T17:31:00+00', 
    10, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0022', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T17:32:00+00', 
    '2025-02-24T17:40:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
    43, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0022'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    1, 
    '2025-02-24T17:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0022'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-02-24T17:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0022'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-02-24T17:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0022', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-24T17:33:00+00', 
    '2025-02-24T17:38:00+00', 
    300, 
    'box_breathing', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0023', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-26T17:30:00+00', 
    '2025-02-26T17:48:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0023', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-26T17:31:00+00', 
    15, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0024', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-28T15:30:00+00', 
    '2025-02-28T15:45:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0024', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-28T15:31:00+00', 
    6, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0024', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-28T15:32:00+00', 
    '2025-02-28T15:35:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
    43, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    1, 
    '2025-02-28T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    2, 
    '2025-02-28T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-02-28T15:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0024', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-28T15:35:00+00', 
    '2025-02-28T15:42:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-02-28T15:39:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-28T15:40:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_health', 
    'very_happy', 
    5, 
    'proud of my progress', 
    20, 
    '2025-02-28T15:43:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-02-28T15:38:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-28T15:41:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_safety', 
    'sad', 
    2, 
    'challenging with safety', 
    23, 
    '2025-02-28T15:37:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0024'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-28T15:37:00+00', 
    30, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0025', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-03T17:15:00+00', 
    '2025-03-03T17:37:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0025', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-03T17:16:00+00', 
    17, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0025', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-03T17:18:00+00', 
    '2025-03-03T17:23:00+00', 
    300, 
    'box_breathing', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0026', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-05T16:15:00+00', 
    '2025-03-05T16:33:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0026', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-05T16:16:00+00', 
    24, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0026', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-05T16:17:00+00', 
    '2025-03-05T16:23:00+00', 
    3, 
    'learning to handle dyslexia better each day', 
    43, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0026'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-03-05T16:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0026'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-03-05T16:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0026'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-03-05T16:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0027', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-07T16:45:00+00', 
    '2025-03-07T17:02:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0027', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-07T16:46:00+00', 
    23, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:45:00+00', 
    '2025-03-10T16:03:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-10T15:46:00+00', 
    13, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:47:00+00', 
    '2025-03-10T15:51:00+00', 
    3, 
    'reading is still hard but i have tools to help', 
    46, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-10T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-03-10T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-03-10T15:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:48:00+00', 
    '2025-03-10T15:50:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0028', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T15:50:00+00', 
    '2025-03-10T15:58:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-10T15:51:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-10T15:56:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_health', 
    'ok', 
    3, 
    'getting support helps', 
    21, 
    '2025-03-10T15:53:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-03-10T15:53:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-10T15:56:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-10T15:58:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0028'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-10T15:53:00+00', 
    27, 
    now()
);