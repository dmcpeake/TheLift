-- SQL Chunk 1
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql


-- Batch 1/131 - Emma
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0001', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-06T16:51:00+00', 
    '2025-01-06T17:12:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0001', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-06T16:52:00+00', 
    29, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0001', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-06T16:54:00+00', 
    '2025-01-06T16:55:00+00', 
    60, 
    'basic_inhale_exhale', 
    3, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0002', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-08T14:11:00+00', 
    '2025-01-08T14:34:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0002', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-08T14:12:00+00', 
    24, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0002', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-08T14:13:00+00', 
    '2025-01-08T14:16:00+00', 
    3, 
    'worried about catching cold and making breathing worse', 
    54, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0002'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-01-08T14:14:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0002'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-08T14:15:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0002'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    3, 
    '2025-01-08T14:16:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0003', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-10T17:29:00+00', 
    '2025-01-10T17:45:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0003', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-10T17:30:00+00', 
    12, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0004', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-13T16:16:00+00', 
    '2025-01-13T16:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0004', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-13T16:17:00+00', 
    27, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0004', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-13T16:18:00+00', 
    '2025-01-13T16:21:00+00', 
    3, 
    'worried about catching cold and making breathing worse', 
    54, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'angry', 
    'high-energy-comfortable', 
    '😊', 
    'feeling angry', 
    1, 
    '2025-01-13T16:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-01-13T16:20:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    3, 
    '2025-01-13T16:21:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0004', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-13T16:19:00+00', 
    '2025-01-13T16:20:00+00', 
    60, 
    'basic_inhale_exhale', 
    3, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0004', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-13T16:21:00+00', 
    '2025-01-13T16:27:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_friends', 
    'ok', 
    3, 
    'james understands my asthma', 
    27, 
    '2025-01-13T16:28:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-13T16:22:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_health', 
    'very_happy', 
    5, 
    'feel healthy and strong', 
    23, 
    '2025-01-13T16:27:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-01-13T16:29:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-13T16:24:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-13T16:29:00+00', 
    43, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0004'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-13T16:27:00+00', 
    43, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0005', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-15T18:03:00+00', 
    '2025-01-15T18:20:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0005', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-01-15T18:04:00+00', 
    21, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0006', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-17T13:56:00+00', 
    '2025-01-17T14:11:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0006', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-01-17T13:57:00+00', 
    11, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0006', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-17T13:58:00+00', 
    '2025-01-17T14:07:00+00', 
    3, 
    'worried about catching cold and making breathing worse', 
    54, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0006'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    1, 
    '2025-01-17T13:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0006'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-01-17T14:00:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0006'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-01-17T14:01:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0007', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-20T10:33:00+00', 
    '2025-01-20T10:48:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0007', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-20T10:34:00+00', 
    9, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0007', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-20T10:36:00+00', 
    '2025-01-20T10:38:00+00', 
    120, 
    'box_breathing', 
    6, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-emma0008', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-22T14:57:00+00', 
    '2025-01-22T15:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0008', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-22T14:58:00+00', 
    25, 
    false, 
    'can help other kids with breathing now', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0008', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-22T14:59:00+00', 
    '2025-01-22T15:04:00+00', 
    3, 
    'practicing breathing exercises helps when chest feels tight', 
    59, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-01-22T15:00:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'calm', 
    'high-energy-comfortable', 
    '😊', 
    'feeling calm', 
    2, 
    '2025-01-22T15:01:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-01-22T15:02:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-emma0008', 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-22T15:02:00+00', 
    '2025-01-22T15:14:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_friends', 
    'sad', 
    2, 
    'worried friends will avoid me', 
    29, 
    '2025-01-22T15:07:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-22T15:09:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_health', 
    'ok', 
    3, 
    'learning to manage asthma', 
    25, 
    '2025-01-22T15:09:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-22T15:06:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-22T15:10:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-emma0008'), 
    'ce864083-bdf5-4ead-b56a-3c36208d3b69', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-22T15:03:00+00', 
    28, 
    now()
);