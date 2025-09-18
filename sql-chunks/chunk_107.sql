-- SQL Chunk 107
-- Lines: ~745
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 107/131 - Chloe
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-01-17T17:23:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    2, 
    '2025-01-17T17:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-01-17T17:25:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-17T17:23:00+00', 
    '2025-01-17T17:24:15+00', 
    75, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0011', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-20T16:16:00+00', 
    '2025-01-20T16:27:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0011', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-01-20T16:17:00+00', 
    27, 
    false, 
    'feeling confident about eating disorder', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-21T15:44:00+00', 
    '2025-01-21T16:03:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-21T15:45:00+00', 
    12, 
    false, 
    'feeling confident about eating disorder', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-21T15:46:00+00', 
    '2025-01-21T15:49:00+00', 
    3, 
    'learning to handle eating disorder better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    1, 
    '2025-01-21T15:47:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    2, 
    '2025-01-21T15:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    3, 
    '2025-01-21T15:49:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-21T15:49:00+00', 
    '2025-01-21T15:57:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-21T15:55:00+00', 
    42, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-21T15:51:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-21T15:56:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-21T15:55:00+00', 
    44, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-21T15:56:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-21T15:51:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-21T15:50:00+00', 
    55, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0013', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-22T17:47:00+00', 
    '2025-01-22T17:57:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0013', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-22T17:48:00+00', 
    8, 
    false, 
    'feeling confident about eating disorder', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0013', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-22T17:50:00+00', 
    '2025-01-22T17:52:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0014', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-23T14:32:00+00', 
    '2025-01-23T14:47:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0014', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-23T14:33:00+00', 
    5, 
    false, 
    'feeling confident about eating disorder', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0014', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-23T14:34:00+00', 
    '2025-01-23T14:40:00+00', 
    3, 
    'learning to handle eating disorder better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0014'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-23T14:35:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0014'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    2, 
    '2025-01-23T14:36:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0014'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-01-23T14:37:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0015', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-24T18:21:00+00', 
    '2025-01-24T18:35:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0015', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-24T18:22:00+00', 
    5, 
    false, 
    'feeling confident about eating disorder', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T18:06:00+00', 
    '2025-01-27T18:29:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-27T18:07:00+00', 
    13, 
    false, 
    'feeling confident about eating disorder', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T18:08:00+00', 
    '2025-01-27T18:17:00+00', 
    3, 
    'learning to handle eating disorder better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-27T18:09:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'hopeful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling hopeful', 
    2, 
    '2025-01-27T18:10:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    3, 
    '2025-01-27T18:11:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T18:09:00+00', 
    '2025-01-27T18:11:30+00', 
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
    '12345678-1234-5678-abcd-chlo0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T18:11:00+00', 
    '2025-01-27T18:21:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_friends', 
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-01-27T18:18:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-27T18:14:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-27T18:12:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-27T18:13:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-27T18:18:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-27T18:17:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-chlo0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-27T18:13:00+00', 
    29, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0017', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-28T13:51:00+00', 
    '2025-01-28T14:14:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0017', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-28T13:52:00+00', 
    5, 
    false, 
    'feeling confident about eating disorder', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-chlo0018', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-29T12:43:00+00', 
    '2025-01-29T12:59:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-chlo0018', 
    'aaaabbbb-cccc-dddd-eeee-111111111119', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-29T12:44:00+00', 
    16, 
    false, 
    'feeling confident about eating disorder', 
    now()
);