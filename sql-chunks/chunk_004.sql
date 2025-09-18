-- SQL Chunk 4
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 4/131 - Emma
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0024'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-28T15:59:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0024'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-02-28T16:01:00+00', 
    41, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0025', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-03T11:51:00+00', 
    '2025-03-03T12:12:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0025', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-03T11:52:00+00', 
    11, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0025', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-03T11:54:00+00', 
    '2025-03-03T11:56:00+00', 
    120, 
    'basic_inhale_exhale', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0026', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-05T12:21:00+00', 
    '2025-03-05T12:43:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0026', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-05T12:22:00+00', 
    17, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0026', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-05T12:23:00+00', 
    '2025-03-05T12:31:00+00', 
    3, 
    'learning to handle asthma better each day', 
    41, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0026'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    1, 
    '2025-03-05T12:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0026'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-03-05T12:25:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0026'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-03-05T12:26:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0027', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-07T14:54:00+00', 
    '2025-03-07T15:13:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0027', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-03-07T14:55:00+00', 
    30, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0028', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T11:32:00+00', 
    '2025-03-10T11:50:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0028', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-10T11:33:00+00', 
    17, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0028', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T11:34:00+00', 
    '2025-03-10T11:38:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
    50, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    1, 
    '2025-03-10T11:35:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    2, 
    '2025-03-10T11:36:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-10T11:37:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0028', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T11:35:00+00', 
    '2025-03-10T11:39:00+00', 
    240, 
    'basic_inhale_exhale', 
    12, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0028', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T11:37:00+00', 
    '2025-03-10T11:47:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_friends', 
    'sad', 
    2, 
    'worried friends will avoid me', 
    29, 
    '2025-03-10T11:42:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-03-10T11:41:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-03-10T11:45:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-10T11:38:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-10T11:43:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-10T11:39:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0028'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-10T11:43:00+00', 
    35, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0029', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-12T10:16:00+00', 
    '2025-03-12T10:24:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0029', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-12T10:17:00+00', 
    10, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0030', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-14T11:10:00+00', 
    '2025-03-14T11:19:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0030', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-14T11:11:00+00', 
    8, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0030', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-14T11:12:00+00', 
    '2025-03-14T11:22:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
    50, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0030'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-03-14T11:13:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0030'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-14T11:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0030'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    3, 
    '2025-03-14T11:15:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0031', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-17T11:37:00+00', 
    '2025-03-17T11:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0031', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-17T11:38:00+00', 
    24, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0031', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-17T11:40:00+00', 
    '2025-03-17T11:44:00+00', 
    240, 
    'basic_inhale_exhale', 
    12, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0032', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-19T12:53:00+00', 
    '2025-03-19T13:14:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0032', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-19T12:54:00+00', 
    18, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0032', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-19T12:55:00+00', 
    '2025-03-19T13:00:00+00', 
    3, 
    'feel like breathing expert now, helping other kids', 
    50, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0032'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-19T12:56:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0032'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-03-19T12:57:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0032'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-03-19T12:58:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0032', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-19T12:58:00+00', 
    '2025-03-19T13:09:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0032'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_friends', 
    'ok', 
    3, 
    'james understands my asthma', 
    27, 
    '2025-03-19T13:03:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0032'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-19T13:03:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0032'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-03-19T13:01:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0032'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-03-19T13:04:00+00', 
    47, 
    now()
);