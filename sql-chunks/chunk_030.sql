-- SQL Chunk 30
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 30/131 - Lucas
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0038'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-02-26T18:39:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0038'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-02-26T18:40:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0038'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    3, 
    '2025-02-26T18:41:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0039', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-27T18:15:00+00', 
    '2025-02-27T18:34:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0039', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-27T18:16:00+00', 
    7, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0040', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T18:55:00+00', 
    '2025-02-28T19:09:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0040', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-28T18:56:00+00', 
    12, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0040', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T18:57:00+00', 
    '2025-02-28T19:02:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-02-28T18:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    2, 
    '2025-02-28T18:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    3, 
    '2025-02-28T19:00:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0040', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T18:58:00+00', 
    '2025-02-28T19:03:00+00', 
    300, 
    'basic_inhale_exhale', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0040', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T19:00:00+00', 
    '2025-02-28T19:11:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-28T19:01:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-02-28T19:01:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-02-28T19:01:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-28T19:06:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-02-28T19:03:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-02-28T19:01:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0040'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-28T19:02:00+00', 
    34, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0041', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-03T16:54:00+00', 
    '2025-03-03T17:03:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0041', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-03T16:55:00+00', 
    16, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0042', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-04T14:38:00+00', 
    '2025-03-04T15:02:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0042', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-04T14:39:00+00', 
    26, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0042', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-04T14:40:00+00', 
    '2025-03-04T14:48:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0042'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-03-04T14:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0042'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    2, 
    '2025-03-04T14:42:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0042'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    3, 
    '2025-03-04T14:43:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0043', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-05T14:58:00+00', 
    '2025-03-05T15:16:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0043', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-05T14:59:00+00', 
    23, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0043', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-05T15:01:00+00', 
    '2025-03-05T15:06:00+00', 
    300, 
    'basic_inhale_exhale', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0044', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-06T18:44:00+00', 
    '2025-03-06T19:04:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0044', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-06T18:45:00+00', 
    28, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0044', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-06T18:46:00+00', 
    '2025-03-06T18:51:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    1, 
    '2025-03-06T18:47:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-03-06T18:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-03-06T18:49:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0044', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-06T18:49:00+00', 
    '2025-03-06T18:59:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-06T18:52:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-03-06T18:53:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-06T18:53:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-03-06T18:52:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-06T18:50:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-06T18:52:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0044'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-06T18:50:00+00', 
    46, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0045', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-07T12:38:00+00', 
    '2025-03-07T13:03:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0045', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-03-07T12:39:00+00', 
    11, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0046', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T13:35:00+00', 
    '2025-03-10T13:58:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0046', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-10T13:36:00+00', 
    24, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0046', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T13:37:00+00', 
    '2025-03-10T13:47:00+00', 
    3, 
    'learning to handle depression anxiety better each day. i understand more about myself now', 
    89, 
    'typing', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    false
);