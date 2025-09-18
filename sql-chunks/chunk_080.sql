-- SQL Chunk 80
-- Lines: ~750
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 80/131 - Charlie
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0048'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-03-12T14:10:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0048'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-03-12T14:09:00+00', 
    41, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0049', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-13T16:30:00+00', 
    '2025-03-13T16:48:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0049', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-13T16:31:00+00', 
    19, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0049', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-13T16:33:00+00', 
    '2025-03-13T16:35:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0050', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-14T15:30:00+00', 
    '2025-03-14T15:53:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0050', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-14T15:31:00+00', 
    5, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0050', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-14T15:32:00+00', 
    '2025-03-14T15:39:00+00', 
    3, 
    'learning to handle selective mutism better each day', 
    51, 
    'typing', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0050'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    1, 
    '2025-03-14T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0050'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    2, 
    '2025-03-14T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0050'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    3, 
    '2025-03-14T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0051', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-17T15:00:00+00', 
    '2025-03-17T15:16:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0051', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-17T15:01:00+00', 
    8, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0052', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-18T14:30:00+00', 
    '2025-03-18T14:48:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0052', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-18T14:31:00+00', 
    26, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0052', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-18T14:32:00+00', 
    '2025-03-18T14:39:00+00', 
    3, 
    'learning to handle selective mutism better each day', 
    51, 
    'typing', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    1, 
    '2025-03-18T14:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    2, 
    '2025-03-18T14:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    3, 
    '2025-03-18T14:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0052', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-18T14:33:00+00', 
    '2025-03-18T14:35:30+00', 
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
    '12345678-1234-5678-abcd-char0052', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-18T14:35:00+00', 
    '2025-03-18T14:41:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-03-18T14:43:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-03-18T14:41:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-03-18T14:37:00+00', 
    20, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-18T14:43:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_fun_play', 
    'happy', 
    4, 
    'happy with fun_play', 
    19, 
    '2025-03-18T14:43:00+00', 
    50, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-03-18T14:42:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0052'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-03-18T14:36:00+00', 
    33, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0053', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-19T16:30:00+00', 
    '2025-03-19T16:55:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0053', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-19T16:31:00+00', 
    13, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0054', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-20T15:00:00+00', 
    '2025-03-20T15:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0054', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-20T15:01:00+00', 
    19, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0054', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-20T15:02:00+00', 
    '2025-03-20T15:07:00+00', 
    3, 
    'learning to handle selective mutism better each day', 
    51, 
    'typing', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0054'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    1, 
    '2025-03-20T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0054'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    2, 
    '2025-03-20T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0054'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    3, 
    '2025-03-20T15:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0055', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-21T16:00:00+00', 
    '2025-03-21T16:25:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0055', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-21T16:01:00+00', 
    27, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0055', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-21T16:03:00+00', 
    '2025-03-21T16:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-char0056', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-24T15:00:00+00', 
    '2025-03-24T15:22:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0056', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'happy', 
    4, 
    '2025-03-24T15:01:00+00', 
    14, 
    false, 
    'feeling confident about selective mutism', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0056', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-24T15:02:00+00', 
    '2025-03-24T15:08:00+00', 
    3, 
    'learning to handle selective mutism better each day', 
    51, 
    'typing', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0056'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    1, 
    '2025-03-24T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0056'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    2, 
    '2025-03-24T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-char0056'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    3, 
    '2025-03-24T15:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-char0056', 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-03-24T15:05:00+00', 
    '2025-03-24T15:12:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0056'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_friends', 
    'ok', 
    3, 
    'making friends', 
    14, 
    '2025-03-24T15:13:00+00', 
    40, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0056'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_work', 
    'happy', 
    4, 
    'happy with work', 
    15, 
    '2025-03-24T15:10:00+00', 
    48, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0056'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_health', 
    'very_happy', 
    5, 
    'feeling good', 
    12, 
    '2025-03-24T15:13:00+00', 
    39, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-char0056'), 
    'aaaabbbb-cccc-dddd-eeee-333333333333', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-03-24T15:13:00+00', 
    48, 
    now()
);