-- SQL Chunk 28
-- Lines: ~751
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 28/131 - Lucas
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0022'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    3, 
    '2025-02-04T17:26:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-04T17:24:00+00', 
    '2025-02-04T17:26:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0023', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-05T10:07:00+00', 
    '2025-02-05T10:21:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0023', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-05T10:08:00+00', 
    11, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-06T14:05:00+00', 
    '2025-02-06T14:28:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-06T14:06:00+00', 
    21, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-06T14:07:00+00', 
    '2025-02-06T14:15:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    1, 
    '2025-02-06T14:08:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    2, 
    '2025-02-06T14:09:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-02-06T14:10:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0024', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-06T14:10:00+00', 
    '2025-02-06T14:22:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-06T14:17:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-02-06T14:12:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-06T14:12:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-06T14:13:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-06T14:12:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-02-06T14:16:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0024'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-06T14:16:00+00', 
    48, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-07T16:11:00+00', 
    '2025-02-07T16:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-07T16:12:00+00', 
    13, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0025', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-07T16:14:00+00', 
    '2025-02-07T16:16:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-10T15:30:00+00', 
    '2025-02-10T15:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-10T15:31:00+00', 
    15, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0026', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-10T15:32:00+00', 
    '2025-02-10T15:40:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-02-10T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-02-10T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0026'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    3, 
    '2025-02-10T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0027', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-11T14:35:00+00', 
    '2025-02-11T14:43:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0027', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-11T14:36:00+00', 
    25, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-12T17:50:00+00', 
    '2025-02-12T17:59:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-12T17:51:00+00', 
    9, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-12T17:52:00+00', 
    '2025-02-12T17:55:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    1, 
    '2025-02-12T17:53:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    2, 
    '2025-02-12T17:54:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    3, 
    '2025-02-12T17:55:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-12T17:53:00+00', 
    '2025-02-12T17:55:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0028', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-12T17:55:00+00', 
    '2025-02-12T18:03:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-02-12T18:02:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-02-12T17:56:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-02-12T18:03:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-12T18:01:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-12T17:57:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-12T18:02:00+00', 
    32, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0028'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-02-12T17:58:00+00', 
    56, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0029', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-13T15:48:00+00', 
    '2025-02-13T16:05:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0029', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-13T15:49:00+00', 
    22, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0030', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-14T14:13:00+00', 
    '2025-02-14T14:30:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0030', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-14T14:14:00+00', 
    5, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0030', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-14T14:15:00+00', 
    '2025-02-14T14:19:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0030'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'philosophical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling philosophical', 
    1, 
    '2025-02-14T14:16:00+00', 
    now()
);