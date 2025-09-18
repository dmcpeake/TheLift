-- SQL Chunk 13
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 13/131 - Kai
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0048', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-12T12:10:00+00', 
    '2025-03-12T12:21:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0048'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-12T12:14:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0048'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-12T12:14:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0048'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-12T12:15:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0048'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-12T12:12:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0048'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-12T12:17:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0048'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-12T12:13:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0048'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-12T12:15:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0049', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-13T13:45:00+00', 
    '2025-03-13T14:05:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0049', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-13T13:46:00+00', 
    13, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0049', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-13T13:48:00+00', 
    '2025-03-13T13:49:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0050', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-14T12:35:00+00', 
    '2025-03-14T12:49:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0050', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-14T12:36:00+00', 
    20, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0050', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-14T12:37:00+00', 
    '2025-03-14T12:44:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0050'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-03-14T12:38:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0050'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-03-14T12:39:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0050'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-14T12:40:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0051', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-17T17:39:00+00', 
    '2025-03-17T17:59:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0051', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-17T17:40:00+00', 
    10, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0052', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-18T14:51:00+00', 
    '2025-03-18T15:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0052', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-18T14:52:00+00', 
    29, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0052', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-18T14:53:00+00', 
    '2025-03-18T14:56:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-03-18T14:54:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-03-18T14:55:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-03-18T14:56:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0052', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-18T14:54:00+00', 
    '2025-03-18T14:55:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0052', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-18T14:56:00+00', 
    '2025-03-18T15:07:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-18T15:02:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-18T15:03:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-18T15:02:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-18T15:00:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-03-18T15:04:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-18T15:04:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-kai0052'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-03-18T14:59:00+00', 
    33, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0053', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-19T10:37:00+00', 
    '2025-03-19T10:50:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0053', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-19T10:38:00+00', 
    28, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0054', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-20T16:09:00+00', 
    '2025-03-20T16:29:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0054', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-20T16:10:00+00', 
    24, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0054', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-20T16:11:00+00', 
    '2025-03-20T16:19:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0054'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-03-20T16:12:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0054'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-20T16:13:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0054'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-03-20T16:14:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0055', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-21T10:07:00+00', 
    '2025-03-21T10:25:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0055', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-21T10:08:00+00', 
    23, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0055', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-21T10:10:00+00', 
    '2025-03-21T10:11:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-kai0056', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T10:12:00+00', 
    '2025-03-24T10:21:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0056', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-24T10:13:00+00', 
    26, 
    false, 
    'feeling confident about surgery recovery', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-kai0056', 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T10:14:00+00', 
    '2025-03-24T10:19:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-03-24T10:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-kai0056'), 
    'aaaabbbb-cccc-dddd-eeee-111111111112', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-03-24T10:16:00+00', 
    now()
);