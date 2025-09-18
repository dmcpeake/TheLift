-- SQL Chunk 14
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 14/131 - Mia
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-24T10:17:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0056', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T10:17:00+00', 
    '2025-03-24T10:28:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-24T10:19:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-03-24T10:20:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-24T10:25:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-24T10:24:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-24T10:25:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-24T10:21:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-24T10:19:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0057', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-25T15:50:00+00', 
    '2025-03-25T16:01:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0057', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-25T15:51:00+00', 
    29, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0058', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-26T17:11:00+00', 
    '2025-03-26T17:32:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0058', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-26T17:12:00+00', 
    15, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0058', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-26T17:13:00+00', 
    '2025-03-26T17:22:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0058'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-03-26T17:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0058'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-03-26T17:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0058'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    3, 
    '2025-03-26T17:16:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0058', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-26T17:14:00+00', 
    '2025-03-26T17:15:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0059', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-27T17:41:00+00', 
    '2025-03-27T17:55:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0059', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-27T17:42:00+00', 
    16, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0060', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-28T17:37:00+00', 
    '2025-03-28T17:59:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0060', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-28T17:38:00+00', 
    21, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0060', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-28T17:39:00+00', 
    '2025-03-28T17:42:00+00', 
    3, 
    'learning to handle surgery recovery better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-03-28T17:40:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-03-28T17:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-03-28T17:42:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0060', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-28T17:42:00+00', 
    '2025-03-28T17:49:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-28T17:43:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-03-28T17:44:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-28T17:49:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-03-28T17:50:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-28T17:48:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-28T17:48:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0060'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-28T17:48:00+00', 
    22, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-mia0001', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-06T12:23:00+00', 
    '2025-01-06T12:40:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0001', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-06T12:24:00+00', 
    16, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0001', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-06T12:26:00+00', 
    '2025-01-06T12:27:15+00', 
    75, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-mia0002', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-08T16:03:00+00', 
    '2025-01-08T16:11:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0002', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-08T16:04:00+00', 
    24, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0002', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-08T16:05:00+00', 
    '2025-01-08T16:09:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0002'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-01-08T16:06:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0002'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    2, 
    '2025-01-08T16:07:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0002'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-01-08T16:08:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-mia0003', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-10T10:27:00+00', 
    '2025-01-10T10:49:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0003', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-10T10:28:00+00', 
    8, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-mia0004', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-13T16:11:00+00', 
    '2025-01-13T16:27:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0004', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-13T16:12:00+00', 
    6, 
    false, 
    'feeling confident about chronic kidney', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-mia0004', 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-13T16:13:00+00', 
    '2025-01-13T16:23:00+00', 
    3, 
    'learning to handle chronic kidney better each day', 
    49, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0004'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    1, 
    '2025-01-13T16:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-mia0004'), 
    'aaaabbbb-cccc-dddd-eeee-111111111113', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-01-13T16:15:00+00', 
    now()
);