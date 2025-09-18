-- SQL Chunk 35
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 35/131 - Oliver
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-17T17:15:00+00', 
    '2025-01-17T17:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-17T17:16:00+00', 
    13, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-17T17:17:00+00', 
    '2025-01-17T17:25:00+00', 
    3, 
    'finally understand why reading is hard for me', 
    45, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-01-17T17:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    2, 
    '2025-01-17T17:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-01-17T17:20:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-20T15:30:00+00', 
    '2025-01-20T15:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-20T15:31:00+00', 
    19, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-20T15:33:00+00', 
    '2025-01-20T15:35:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-22T15:45:00+00', 
    '2025-01-22T15:57:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-22T15:46:00+00', 
    7, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-22T15:47:00+00', 
    '2025-01-22T15:51:00+00', 
    3, 
    'getting special help makes me feel less stupid', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-01-22T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-01-22T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-01-22T15:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-22T15:50:00+00', 
    '2025-01-22T16:02:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.0, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-22T15:57:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-22T15:53:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_health', 
    'very_happy', 
    5, 
    'proud of my progress', 
    20, 
    '2025-01-22T15:55:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-22T15:52:00+00', 
    26, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-22T15:54:00+00', 
    26, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-22T15:56:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-22T15:53:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-24T16:00:00+00', 
    '2025-01-24T16:09:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-24T16:01:00+00', 
    29, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:15:00+00', 
    '2025-01-27T16:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-27T16:16:00+00', 
    9, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:17:00+00', 
    '2025-01-27T16:27:00+00', 
    3, 
    'getting special help makes me feel less stupid', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-01-27T16:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-01-27T16:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-01-27T16:20:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:18:00+00', 
    '2025-01-27T16:20:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-29T15:30:00+00', 
    '2025-01-29T15:47:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-29T15:31:00+00', 
    9, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T16:00:00+00', 
    '2025-01-31T16:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-31T16:01:00+00', 
    15, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T16:02:00+00', 
    '2025-01-31T16:11:00+00', 
    3, 
    'getting special help makes me feel less stupid', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-01-31T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-01-31T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    3, 
    '2025-01-31T16:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T16:05:00+00', 
    '2025-01-31T16:15:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-31T16:12:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-31T16:13:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_health', 
    'sad', 
    2, 
    'frustrated with reading', 
    23, 
    '2025-01-31T16:09:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-31T16:11:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-31T16:12:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_safety', 
    'sad', 
    2, 
    'challenging with safety', 
    23, 
    '2025-01-31T16:10:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-31T16:10:00+00', 
    51, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-03T15:00:00+00', 
    '2025-02-03T15:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'very_happy', 
    5, 
    '2025-02-03T15:01:00+00', 
    12, 
    false, 
    'reading is getting easier with support', 
    now()
);