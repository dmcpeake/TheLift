-- SQL Chunk 39
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 39/131 - Jayden
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0001', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-06T16:30:00+00', 
    '2025-01-06T16:49:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0001', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-06T16:31:00+00', 
    25, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0001', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-06T16:33:00+00', 
    '2025-01-06T16:34:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0002', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-07T15:45:00+00', 
    '2025-01-07T15:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0002', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-07T15:46:00+00', 
    16, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0002', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-07T15:47:00+00', 
    '2025-01-07T15:54:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
    'speech_to_text', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0002'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-01-07T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0002'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-07T15:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0002'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-01-07T15:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0003', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-08T15:30:00+00', 
    '2025-01-08T15:41:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0003', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-08T15:31:00+00', 
    21, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-09T17:00:00+00', 
    '2025-01-09T17:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-09T17:01:00+00', 
    10, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-09T17:02:00+00', 
    '2025-01-09T17:12:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
    'speech_to_text', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-09T17:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-01-09T17:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-01-09T17:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-09T17:03:00+00', 
    '2025-01-09T17:04:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-09T17:05:00+00', 
    '2025-01-09T17:16:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-09T17:12:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-09T17:06:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-09T17:12:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-09T17:13:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-09T17:08:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-09T17:08:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-09T17:10:00+00', 
    40, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-10T16:15:00+00', 
    '2025-01-10T16:40:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-10T16:16:00+00', 
    25, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T16:30:00+00', 
    '2025-01-13T16:44:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-13T16:31:00+00', 
    7, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T16:32:00+00', 
    '2025-01-13T16:36:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
    'speech_to_text', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-01-13T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-13T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-13T16:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-14T15:15:00+00', 
    '2025-01-14T15:28:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-14T15:16:00+00', 
    15, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-14T15:18:00+00', 
    '2025-01-14T15:19:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-jayd0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-15T16:45:00+00', 
    '2025-01-15T16:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-15T16:46:00+00', 
    9, 
    false, 
    'feeling confident about adhd traits', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-15T16:47:00+00', 
    '2025-01-15T16:50:00+00', 
    3, 
    'learning to handle adhd traits better each day', 
    46, 
    'speech_to_text', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-15T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-01-15T16:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-15T16:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-jayd0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-15T16:50:00+00', 
    '2025-01-15T16:57:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-15T16:58:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-15T16:54:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-15T16:55:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-15T16:52:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-15T16:57:00+00', 
    32, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-jayd0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222222', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-15T16:52:00+00', 
    31, 
    now()
);