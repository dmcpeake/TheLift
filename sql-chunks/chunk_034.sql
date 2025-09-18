-- SQL Chunk 34
-- Lines: ~752
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 34/131 - Oliver
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-amar0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-10T12:24:00+00', 
    9, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-amar0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T12:25:00+00', 
    '2025-03-10T12:35:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-amar0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-03-10T12:26:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-amar0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    2, 
    '2025-03-10T12:27:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-amar0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    3, 
    '2025-03-10T12:28:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-amar0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T12:26:00+00', 
    '2025-03-10T12:28:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-amar0011', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-17T17:33:00+00', 
    '2025-03-17T17:55:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-amar0011', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-17T17:34:00+00', 
    16, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-amar0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T12:17:00+00', 
    '2025-03-24T12:35:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-amar0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-24T12:18:00+00', 
    30, 
    false, 
    'feeling confident about heart condition', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-amar0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T12:19:00+00', 
    '2025-03-24T12:27:00+00', 
    3, 
    'learning to handle heart condition better each day', 
    50, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-03-24T12:20:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-03-24T12:21:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-03-24T12:22:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-amar0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T12:22:00+00', 
    '2025-03-24T12:34:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-24T12:25:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-03-24T12:30:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-24T12:28:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-24T12:27:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-24T12:27:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-24T12:29:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-amar0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111117', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-24T12:30:00+00', 
    43, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0001', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-06T15:00:00+00', 
    '2025-01-06T15:13:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0001', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-06T15:01:00+00', 
    23, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0001', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-06T15:03:00+00', 
    '2025-01-06T15:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0002', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-08T16:30:00+00', 
    '2025-01-08T16:41:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0002', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-08T16:31:00+00', 
    25, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0002', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-08T16:32:00+00', 
    '2025-01-08T16:36:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0002'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-01-08T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0002'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-01-08T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0002'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-01-08T16:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0003', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-10T16:30:00+00', 
    '2025-01-10T16:42:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0003', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-10T16:31:00+00', 
    11, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T17:45:00+00', 
    '2025-01-13T17:55:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-13T17:46:00+00', 
    20, 
    false, 
    'reading is getting easier with support', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T17:47:00+00', 
    '2025-01-13T17:57:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-01-13T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-01-13T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-01-13T17:50:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T17:48:00+00', 
    '2025-01-13T17:50:30+00', 
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
    '12345678-1234-5678-abcd-oliv0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T17:50:00+00', 
    '2025-01-13T17:57:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-13T17:51:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-01-13T17:52:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_health', 
    'very_happy', 
    5, 
    'proud of my progress', 
    20, 
    '2025-01-13T17:51:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-01-13T17:51:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-13T17:58:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-13T17:55:00+00', 
    26, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-oliv0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-13T17:53:00+00', 
    45, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-oliv0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-15T17:30:00+00', 
    '2025-01-15T17:43:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-oliv0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222221', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-15T17:31:00+00', 
    19, 
    false, 
    'reading is getting easier with support', 
    now()
);