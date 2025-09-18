-- SQL Chunk 119
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 119/131 - Felix
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-24T16:10:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-02-24T16:08:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-24T16:08:00+00', 
    21, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-evie0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-03T17:30:00+00', 
    '2025-03-03T17:44:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-03T17:31:00+00', 
    6, 
    false, 
    'feeling confident about friendship drama', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-evie0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T16:00:00+00', 
    '2025-03-10T16:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-10T16:01:00+00', 
    24, 
    false, 
    'feeling confident about friendship drama', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T16:02:00+00', 
    '2025-03-10T16:12:00+00', 
    3, 
    'learning to handle friendship drama better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-evie0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    1, 
    '2025-03-10T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-evie0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    2, 
    '2025-03-10T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-evie0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    3, 
    '2025-03-10T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-10T16:03:00+00', 
    '2025-03-10T16:05:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-evie0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-17T16:45:00+00', 
    '2025-03-17T17:09:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-17T16:46:00+00', 
    11, 
    false, 
    'feeling confident about friendship drama', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-evie0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T16:45:00+00', 
    '2025-03-24T17:00:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-03-24T16:46:00+00', 
    19, 
    false, 
    'feeling confident about friendship drama', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T16:47:00+00', 
    '2025-03-24T16:55:00+00', 
    3, 
    'learning to handle friendship drama better each day', 
    51, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    1, 
    '2025-03-24T16:48:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    2, 
    '2025-03-24T16:49:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    3, 
    '2025-03-24T16:50:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-evie0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-03-24T16:50:00+00', 
    '2025-03-24T16:58:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-03-24T16:54:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-24T16:52:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-24T16:52:00+00', 
    55, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-03-24T16:53:00+00', 
    32, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-03-24T16:56:00+00', 
    25, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-03-24T16:57:00+00', 
    58, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-evie0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222230', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-24T16:51:00+00', 
    51, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0001', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-06T14:30:00+00', 
    '2025-01-06T14:49:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0001', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-06T14:31:00+00', 
    17, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0001', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-06T14:33:00+00', 
    '2025-01-06T14:34:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0002', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-08T16:00:00+00', 
    '2025-01-08T16:20:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0002', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-08T16:01:00+00', 
    12, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0002', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-08T16:02:00+00', 
    '2025-01-08T16:12:00+00', 
    3, 
    'learning to handle speech delay better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0002'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    1, 
    '2025-01-08T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0002'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    2, 
    '2025-01-08T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0002'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-01-08T16:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0003', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-10T14:00:00+00', 
    '2025-01-10T14:18:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0003', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-10T14:01:00+00', 
    10, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-13T16:30:00+00', 
    '2025-01-13T16:39:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-01-13T16:31:00+00', 
    29, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-13T16:32:00+00', 
    '2025-01-13T16:35:00+00', 
    3, 
    'learning to handle speech delay better each day', 
    47, 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    1, 
    '2025-01-13T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-01-13T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-01-13T16:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-13T16:33:00+00', 
    '2025-01-13T16:34:30+00', 
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
    '12345678-1234-5678-abcd-feli0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-13T16:35:00+00', 
    '2025-01-13T16:43:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-13T16:37:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-01-13T16:43:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-13T16:40:00+00', 
    29, 
    now()
);