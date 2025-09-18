-- SQL Chunk 123
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 123/131 - Felix
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-10T15:06:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-10T15:07:00+00', 
    24, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-03-10T15:12:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-03-10T15:13:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-10T15:08:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-03-10T15:13:00+00', 
    38, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0029', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-12T16:30:00+00', 
    '2025-03-12T16:49:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0029', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-12T16:31:00+00', 
    22, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0030', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-14T15:30:00+00', 
    '2025-03-14T15:55:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0030', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-03-14T15:31:00+00', 
    18, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0030', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-14T15:32:00+00', 
    '2025-03-14T15:39:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0030'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    1, 
    '2025-03-14T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0030'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-14T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0030'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-03-14T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0031', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-17T15:30:00+00', 
    '2025-03-17T15:54:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0031', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-03-17T15:31:00+00', 
    27, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0031', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-17T15:33:00+00', 
    '2025-03-17T15:34:30+00', 
    90, 
    'guided_4_7_8', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0032', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-19T16:30:00+00', 
    '2025-03-19T16:55:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0032', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-19T16:31:00+00', 
    20, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0032', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-19T16:32:00+00', 
    '2025-03-19T16:37:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-03-19T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-03-19T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-19T16:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0032', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-19T16:35:00+00', 
    '2025-03-19T16:42:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-19T16:38:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-19T16:36:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-03-19T16:43:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-03-19T16:37:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-03-19T16:42:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-19T16:38:00+00', 
    31, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0032'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-19T16:40:00+00', 
    55, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0033', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-21T16:00:00+00', 
    '2025-03-21T16:23:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0033', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-03-21T16:01:00+00', 
    11, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-24T15:30:00+00', 
    '2025-03-24T15:43:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-24T15:31:00+00', 
    12, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-24T15:32:00+00', 
    '2025-03-24T15:40:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0034'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    1, 
    '2025-03-24T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0034'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    2, 
    '2025-03-24T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0034'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-24T15:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0034', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-24T15:33:00+00', 
    '2025-03-24T15:34:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0035', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-26T16:00:00+00', 
    '2025-03-26T16:24:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0035', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-26T16:01:00+00', 
    14, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-28T15:00:00+00', 
    '2025-03-28T15:14:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-28T15:01:00+00', 
    16, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-28T15:02:00+00', 
    '2025-03-28T15:11:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    1, 
    '2025-03-28T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    2, 
    '2025-03-28T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    3, 
    '2025-03-28T15:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0036', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-28T15:05:00+00', 
    '2025-03-28T15:15:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0036'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-28T15:13:00+00', 
    39, 
    now()
);