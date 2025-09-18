-- SQL Chunk 122
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 122/131 - Felix
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-02-19T15:40:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_family', 
    'happy', 
    4, 
    'happy with family', 
    17, 
    '2025-02-19T15:39:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-02-19T15:41:00+00', 
    33, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-02-19T15:43:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0020'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-02-19T15:38:00+00', 
    52, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0021', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-21T15:30:00+00', 
    '2025-02-21T15:45:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0021', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-21T15:31:00+00', 
    22, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T16:00:00+00', 
    '2025-02-24T16:15:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-24T16:01:00+00', 
    5, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T16:02:00+00', 
    '2025-02-24T16:11:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0022'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-02-24T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0022'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-02-24T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0022'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    3, 
    '2025-02-24T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0022', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-24T16:03:00+00', 
    '2025-02-24T16:04:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0023', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-26T16:00:00+00', 
    '2025-02-26T16:23:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0023', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-26T16:01:00+00', 
    12, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T14:30:00+00', 
    '2025-02-28T14:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-02-28T14:31:00+00', 
    15, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T14:32:00+00', 
    '2025-02-28T14:42:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    1, 
    '2025-02-28T14:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    2, 
    '2025-02-28T14:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'happy', 
    'high-energy-comfortable', 
    '😊', 
    'feeling happy', 
    3, 
    '2025-02-28T14:35:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0024', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-02-28T14:35:00+00', 
    '2025-02-28T14:44:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    3.0, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-02-28T14:43:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_work', 
    'sad', 
    2, 
    'challenging with work', 
    21, 
    '2025-02-28T14:41:00+00', 
    60, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-02-28T14:38:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_family', 
    'sad', 
    2, 
    'challenging with family', 
    23, 
    '2025-02-28T14:39:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_fun_play', 
    'sad', 
    2, 
    'challenging with fun_play', 
    25, 
    '2025-02-28T14:40:00+00', 
    29, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-02-28T14:43:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0024'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-02-28T14:37:00+00', 
    34, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0025', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-03T15:30:00+00', 
    '2025-03-03T15:41:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0025', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-03T15:31:00+00', 
    20, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0025', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-03T15:33:00+00', 
    '2025-03-03T15:34:30+00', 
    90, 
    'basic_inhale_exhale', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0026', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-05T15:00:00+00', 
    '2025-03-05T15:16:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0026', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-05T15:01:00+00', 
    5, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0026', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-05T15:02:00+00', 
    '2025-03-05T15:07:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0026'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    1, 
    '2025-03-05T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0026'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'scared', 
    'high-energy-comfortable', 
    '😊', 
    'feeling scared', 
    2, 
    '2025-03-05T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0026'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'worried', 
    'high-energy-comfortable', 
    '😊', 
    'feeling worried', 
    3, 
    '2025-03-05T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0027', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-07T16:00:00+00', 
    '2025-03-07T16:23:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0027', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-07T16:01:00+00', 
    13, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-feli0028', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-10T15:00:00+00', 
    '2025-03-10T15:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0028', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-10T15:01:00+00', 
    19, 
    false, 
    'feeling confident about speech delay', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0028', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-10T15:02:00+00', 
    '2025-03-10T15:08:00+00', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'mad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling mad', 
    1, 
    '2025-03-10T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'excited', 
    'high-energy-comfortable', 
    '😊', 
    'feeling excited', 
    2, 
    '2025-03-10T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'sad', 
    'high-energy-comfortable', 
    '😊', 
    'feeling sad', 
    3, 
    '2025-03-10T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0028', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-10T15:03:00+00', 
    '2025-03-10T15:04:30+00', 
    90, 
    'box_breathing', 
    4, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-feli0028', 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-10T15:05:00+00', 
    '2025-03-10T15:17:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-feli0028'), 
    'aaaabbbb-cccc-dddd-eeee-333333333339', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-10T15:13:00+00', 
    60, 
    now()
);