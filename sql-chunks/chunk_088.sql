-- SQL Chunk 88
-- Lines: ~749
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 88/131 - Ruby
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0004', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-09T14:05:00+00', 
    '2025-01-09T14:17:00+00', 
    ARRAY['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions'], 
    7, 
    4.43, 
    false,
    'completed', 
    null,
    now(), 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_friends', 
    'very_happy', 
    5, 
    'love my friends', 
    15, 
    '2025-01-09T14:12:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-09T14:08:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-09T14:08:00+00', 
    34, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-09T14:11:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-09T14:13:00+00', 
    21, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_safety', 
    'very_happy', 
    5, 
    'happy with safety', 
    17, 
    '2025-01-09T14:13:00+00', 
    22, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0004'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-09T14:09:00+00', 
    33, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0005', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-10T15:00:00+00', 
    '2025-01-10T15:19:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0005', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-10T15:01:00+00', 
    13, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-13T15:30:00+00', 
    '2025-01-13T15:46:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-13T15:31:00+00', 
    27, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0006', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-13T15:32:00+00', 
    '2025-01-13T15:42:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-13T15:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-01-13T15:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0006'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    3, 
    '2025-01-13T15:35:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-14T14:30:00+00', 
    '2025-01-14T14:52:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-14T14:31:00+00', 
    22, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0007', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-14T14:33:00+00', 
    '2025-01-14T14:35:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-15T14:00:00+00', 
    '2025-01-15T14:18:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-15T14:01:00+00', 
    16, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-15T14:02:00+00', 
    '2025-01-15T14:12:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'grateful', 
    'high-energy-comfortable', 
    '😊', 
    'feeling grateful', 
    1, 
    '2025-01-15T14:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-15T14:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-01-15T14:05:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0008', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-15T14:05:00+00', 
    '2025-01-15T14:17:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_friends', 
    'happy', 
    4, 
    'love my friends', 
    15, 
    '2025-01-15T14:10:00+00', 
    52, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-15T14:07:00+00', 
    46, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-15T14:11:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-15T14:10:00+00', 
    28, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-15T14:06:00+00', 
    27, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-15T14:11:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0008'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'my_emotions', 
    'very_happy', 
    5, 
    'happy with emotions', 
    19, 
    '2025-01-15T14:12:00+00', 
    28, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0009', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-16T14:30:00+00', 
    '2025-01-16T14:40:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0009', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-16T14:31:00+00', 
    29, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-17T15:00:00+00', 
    '2025-01-17T15:10:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-17T15:01:00+00', 
    12, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-17T15:02:00+00', 
    '2025-01-17T15:05:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0010'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    1, 
    '2025-01-17T15:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0010'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'proud', 
    'high-energy-comfortable', 
    '😊', 
    'feeling proud', 
    2, 
    '2025-01-17T15:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0010'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'embarrassed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling embarrassed', 
    3, 
    '2025-01-17T15:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0010', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-17T15:03:00+00', 
    '2025-01-17T15:05:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0011', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-20T15:00:00+00', 
    '2025-01-20T15:19:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0011', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-20T15:01:00+00', 
    7, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-ruby0012', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-21T16:00:00+00', 
    '2025-01-21T16:23:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0012', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    'very_happy', 
    5, 
    '2025-01-21T16:01:00+00', 
    28, 
    false, 
    'feeling confident about high sensitivity', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-ruby0012', 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf', 
    '2025-01-21T16:02:00+00', 
    '2025-01-21T16:06:00+00', 
    3, 
    'learning to handle high sensitivity better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'determined', 
    'high-energy-comfortable', 
    '😊', 
    'feeling determined', 
    1, 
    '2025-01-21T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'conflicted', 
    'high-energy-comfortable', 
    '😊', 
    'feeling conflicted', 
    2, 
    '2025-01-21T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-ruby0012'), 
    'aaaabbbb-cccc-dddd-eeee-333333333336', 
    'overwhelmed', 
    'high-energy-comfortable', 
    '😊', 
    'feeling overwhelmed', 
    3, 
    '2025-01-21T16:05:00+00', 
    now()
);