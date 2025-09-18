-- SQL Chunk 53
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 53/131 - Ava
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    3, 
    '2025-01-09T17:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-09T17:03:00+00', 
    '2025-01-09T17:05:30+00', 
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
    '12345678-1234-5678-abcd-ava0004', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-09T17:05:00+00', 
    '2025-01-09T17:14:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-01-09T17:11:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-01-09T17:11:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-09T17:11:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-09T17:11:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-09T17:13:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-09T17:06:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0004'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-09T17:11:00+00', 
    50, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-10T15:30:00+00', 
    '2025-01-10T15:38:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0005', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-10T15:31:00+00', 
    27, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T15:00:00+00', 
    '2025-01-13T15:09:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-13T15:01:00+00', 
    13, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0006', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-13T15:02:00+00', 
    '2025-01-13T15:12:00+00', 
    3, 
    'learning to handle family separation better each day', 
    52, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-01-13T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    2, 
    '2025-01-13T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0006'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-01-13T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-14T17:15:00+00', 
    '2025-01-14T17:37:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-14T17:16:00+00', 
    15, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0007', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-14T17:18:00+00', 
    '2025-01-14T17:20:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-15T17:45:00+00', 
    '2025-01-15T18:06:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'very_happy', 
    5, 
    '2025-01-15T17:46:00+00', 
    12, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-15T17:47:00+00', 
    '2025-01-15T17:57:00+00', 
    3, 
    'learning to handle family separation better each day', 
    52, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-01-15T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    2, 
    '2025-01-15T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-01-15T17:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0008', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-15T17:50:00+00', 
    '2025-01-15T18:02:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-15T17:56:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-15T17:58:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-15T17:51:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-15T17:53:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-15T17:56:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-15T17:53:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ava0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-15T17:51:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-16T17:00:00+00', 
    '2025-01-16T17:17:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-16T17:01:00+00', 
    5, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-17T15:00:00+00', 
    '2025-01-17T15:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-17T15:01:00+00', 
    27, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-17T15:02:00+00', 
    '2025-01-17T15:06:00+00', 
    3, 
    'learning to handle family separation better each day', 
    52, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-01-17T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-01-17T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-01-17T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-17T15:03:00+00', 
    '2025-01-17T15:05:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-20T17:00:00+00', 
    '2025-01-20T17:08:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'very_happy', 
    5, 
    '2025-01-20T17:01:00+00', 
    15, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ava0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-21T15:45:00+00', 
    '2025-01-21T15:58:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-21T15:46:00+00', 
    28, 
    false, 
    'feeling confident about family separation', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ava0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-21T15:47:00+00', 
    '2025-01-21T15:53:00+00', 
    3, 
    'learning to handle family separation better each day', 
    52, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ava0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222225', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    1, 
    '2025-01-21T15:48:00+00', 
    now()
);