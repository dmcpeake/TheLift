-- SQL Chunk 27
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 27/131 - Lucas
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0014'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    3, 
    '2025-01-23T12:53:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0015', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-24T13:06:00+00', 
    '2025-01-24T13:20:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0015', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-24T13:07:00+00', 
    19, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T16:05:00+00', 
    '2025-01-27T16:16:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-27T16:06:00+00', 
    16, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T16:07:00+00', 
    '2025-01-27T16:10:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    1, 
    '2025-01-27T16:08:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    2, 
    '2025-01-27T16:09:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-01-27T16:10:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T16:08:00+00', 
    '2025-01-27T16:10:30+00', 
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
    '12345678-1234-5678-abcd-luca0016', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-27T16:10:00+00', 
    '2025-01-27T16:20:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-27T16:13:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-01-27T16:15:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-27T16:15:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-27T16:15:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-27T16:11:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-27T16:13:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0016'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-27T16:16:00+00', 
    28, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0017', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-28T14:17:00+00', 
    '2025-01-28T14:37:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0017', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-28T14:18:00+00', 
    24, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0018', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-29T17:45:00+00', 
    '2025-01-29T18:01:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0018', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-29T17:46:00+00', 
    26, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0018', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-29T17:47:00+00', 
    '2025-01-29T17:54:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0018'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'wise', 
    'high-energy-comfortable', 
    '😊', 
    'feeling wise', 
    1, 
    '2025-01-29T17:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0018'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'empathetic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empathetic', 
    2, 
    '2025-01-29T17:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0018'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-01-29T17:50:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0019', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-30T10:12:00+00', 
    '2025-01-30T10:31:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0019', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-01-30T10:13:00+00', 
    28, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0019', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-30T10:15:00+00', 
    '2025-01-30T10:17:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0020', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-31T12:40:00+00', 
    '2025-01-31T12:48:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0020', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-01-31T12:41:00+00', 
    23, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0020', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-31T12:42:00+00', 
    '2025-01-31T12:47:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'analytical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling analytical', 
    1, 
    '2025-01-31T12:43:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-01-31T12:44:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    3, 
    '2025-01-31T12:45:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0020', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-01-31T12:45:00+00', 
    '2025-01-31T12:56:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-31T12:50:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-31T12:47:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-01-31T12:46:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-31T12:52:00+00', 
    23, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-31T12:51:00+00', 
    56, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-31T12:53:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-luca0020'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-31T12:50:00+00', 
    20, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0021', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-03T17:33:00+00', 
    '2025-02-03T17:54:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0021', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-03T17:34:00+00', 
    24, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-luca0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-04T17:21:00+00', 
    '2025-02-04T17:34:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-02-04T17:22:00+00', 
    21, 
    false, 
    'feeling confident about depression anxiety', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-luca0022', 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-04T17:23:00+00', 
    '2025-02-04T17:26:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0022'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'introspective', 
    'high-energy-comfortable', 
    '😊', 
    'feeling introspective', 
    1, 
    '2025-02-04T17:24:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-luca0022'), 
    'aaaabbbb-cccc-dddd-eeee-111111111116', 
    'autonomous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling autonomous', 
    2, 
    '2025-02-04T17:25:00+00', 
    now()
);