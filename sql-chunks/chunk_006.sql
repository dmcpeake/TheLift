-- SQL Chunk 6
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 6/131 - Aisha
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0004'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-27T18:22:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0004'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-01-27T18:18:00+00', 
    59, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0004'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-27T18:18:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0004'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-27T18:19:00+00', 
    60, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0005', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-03T11:30:00+00', 
    '2025-02-03T11:53:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0005', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-03T11:31:00+00', 
    16, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0006', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-10T14:04:00+00', 
    '2025-02-10T14:26:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0006', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-10T14:05:00+00', 
    26, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0006', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-10T14:06:00+00', 
    '2025-02-10T14:09:00+00', 
    3, 
    'learning to handle diabetes better each day', 
    43, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0006'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-02-10T14:07:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0006'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-02-10T14:08:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0006'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-02-10T14:09:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0007', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-17T16:57:00+00', 
    '2025-02-17T17:12:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0007', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-02-17T16:58:00+00', 
    22, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0007', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-17T17:00:00+00', 
    '2025-02-17T17:02:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0008', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-24T16:55:00+00', 
    '2025-02-24T17:07:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0008', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-02-24T16:56:00+00', 
    20, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0008', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-24T16:57:00+00', 
    '2025-02-24T17:04:00+00', 
    3, 
    'learning to handle diabetes better each day', 
    43, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-02-24T16:58:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    2, 
    '2025-02-24T16:59:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-02-24T17:00:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0008', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-02-24T17:00:00+00', 
    '2025-02-24T17:07:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-02-24T17:07:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-02-24T17:05:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-02-24T17:02:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-02-24T17:08:00+00', 
    51, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-02-24T17:03:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-02-24T17:05:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0008'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-24T17:08:00+00', 
    56, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0009', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-03T13:25:00+00', 
    '2025-03-03T13:36:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0009', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-03T13:26:00+00', 
    21, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T14:25:00+00', 
    '2025-03-10T14:36:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-10T14:26:00+00', 
    6, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T14:27:00+00', 
    '2025-03-10T14:31:00+00', 
    3, 
    'learning to handle diabetes better each day', 
    43, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'frustrated', 
    'high-energy-comfortable', 
    '😊', 
    'feeling frustrated', 
    1, 
    '2025-03-10T14:28:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'disappointed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling disappointed', 
    2, 
    '2025-03-10T14:29:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0010'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'nervous', 
    'high-energy-comfortable', 
    '😊', 
    'feeling nervous', 
    3, 
    '2025-03-10T14:30:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0010', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-10T14:28:00+00', 
    '2025-03-10T14:33:00+00', 
    300, 
    'basic_inhale_exhale', 
    16, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0011', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-17T17:41:00+00', 
    '2025-03-17T18:00:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0011', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'very_happy', 
    5, 
    '2025-03-17T17:42:00+00', 
    14, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-aish0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T15:38:00+00', 
    '2025-03-24T15:51:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    'happy', 
    4, 
    '2025-03-24T15:39:00+00', 
    28, 
    false, 
    'feeling confident about diabetes', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T15:40:00+00', 
    '2025-03-24T15:48:00+00', 
    3, 
    'learning to handle diabetes better each day', 
    43, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'anxious', 
    'high-energy-comfortable', 
    '😊', 
    'feeling anxious', 
    1, 
    '2025-03-24T15:41:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'confident', 
    'high-energy-comfortable', 
    '😊', 
    'feeling confident', 
    2, 
    '2025-03-24T15:42:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-aish0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'peaceful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling peaceful', 
    3, 
    '2025-03-24T15:43:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-aish0012', 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    '7eab219a-7c83-406c-a6b2-75ed44de715b', 
    '2025-03-24T15:43:00+00', 
    '2025-03-24T15:53:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-24T15:51:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-03-24T15:46:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-aish0012'), 
    'aaaabbbb-cccc-dddd-eeee-111111111111', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-24T15:47:00+00', 
    31, 
    now()
);