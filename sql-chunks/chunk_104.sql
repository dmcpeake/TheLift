-- SQL Chunk 104
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 104/131 - Ben
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0022'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    3, 
    '2025-02-24T11:31:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-24T11:29:00+00', 
    '2025-02-24T11:34:00+00', 
    300, 
    'box_breathing', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0023', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-26T16:54:00+00', 
    '2025-02-26T17:04:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0023', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-26T16:55:00+00', 
    28, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T16:44:00+00', 
    '2025-02-28T16:56:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-28T16:45:00+00', 
    10, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T16:46:00+00', 
    '2025-02-28T16:52:00+00', 
    3, 
    'learning to handle chronic pain better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    1, 
    '2025-02-28T16:47:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    2, 
    '2025-02-28T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'joyful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling joyful', 
    3, 
    '2025-02-28T16:49:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-28T16:49:00+00', 
    '2025-02-28T17:01:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.29, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_friends', 
    'sad', 
    2, 
    'lonely sometimes', 
    16, 
    '2025-02-28T16:53:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-02-28T16:51:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-28T16:50:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-28T16:52:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-02-28T16:50:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-02-28T16:51:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-28T16:56:00+00', 
    52, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-03T16:02:00+00', 
    '2025-03-03T16:16:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-03T16:03:00+00', 
    28, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-03T16:05:00+00', 
    '2025-03-03T16:10:00+00', 
    300, 
    'basic_inhale_exhale', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-05T13:50:00+00', 
    '2025-03-05T14:03:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-05T13:51:00+00', 
    15, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-05T13:52:00+00', 
    '2025-03-05T14:01:00+00', 
    3, 
    'learning to handle chronic pain better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-03-05T13:53:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    2, 
    '2025-03-05T13:54:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-03-05T13:55:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0027', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-07T16:44:00+00', 
    '2025-03-07T17:03:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0027', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-07T16:45:00+00', 
    23, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T16:19:00+00', 
    '2025-03-10T16:30:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-10T16:20:00+00', 
    19, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T16:21:00+00', 
    '2025-03-10T16:28:00+00', 
    3, 
    'learning to handle chronic pain better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-10T16:22:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    2, 
    '2025-03-10T16:23:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    3, 
    '2025-03-10T16:24:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T16:22:00+00', 
    '2025-03-10T16:24:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T16:24:00+00', 
    '2025-03-10T16:34:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-10T16:27:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-10T16:27:00+00', 
    49, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-10T16:32:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-10T16:30:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-03-10T16:29:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-10T16:27:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ben0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-10T16:27:00+00', 
    32, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0029', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-12T16:24:00+00', 
    '2025-03-12T16:43:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0029', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-12T16:25:00+00', 
    5, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ben0030', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-14T12:19:00+00', 
    '2025-03-14T12:43:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0030', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-14T12:20:00+00', 
    18, 
    false, 
    'feeling confident about chronic pain', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ben0030', 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-14T12:21:00+00', 
    '2025-03-14T12:29:00+00', 
    3, 
    'learning to handle chronic pain better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ben0030'), 
    'aaaabbbb-cccc-dddd-eeee-111111111118', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    1, 
    '2025-03-14T12:22:00+00', 
    now()
);