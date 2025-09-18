-- SQL Chunk 49
-- Lines: ~747
-- Generated from: all_children_complete_journeys_20250916_193517.sql

-- Batch 49/131 - Tyler
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_friends', 
    'happy', 
    4, 
    'have good friends now', 
    21, 
    '2025-01-22T17:40:00+00', 
    38, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_work', 
    'very_happy', 
    5, 
    'happy with work', 
    15, 
    '2025-01-22T17:41:00+00', 
    36, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_health', 
    'ok', 
    3, 
    'getting better', 
    14, 
    '2025-01-22T17:39:00+00', 
    53, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_family', 
    'very_happy', 
    5, 
    'happy with family', 
    17, 
    '2025-01-22T17:43:00+00', 
    41, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_fun_play', 
    'ok', 
    3, 
    'improving with fun_play', 
    23, 
    '2025-01-22T17:41:00+00', 
    37, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_safety', 
    'ok', 
    3, 
    'improving with safety', 
    21, 
    '2025-01-22T17:36:00+00', 
    47, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0008'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_emotions', 
    'happy', 
    4, 
    'happy with emotions', 
    19, 
    '2025-01-22T17:43:00+00', 
    53, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-24T16:00:00+00', 
    '2025-01-24T16:15:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0009', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-24T16:01:00+00', 
    25, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:30:00+00', 
    '2025-01-27T16:38:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-27T16:31:00+00', 
    13, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:32:00+00', 
    '2025-01-27T16:42:00+00', 
    3, 
    'learning to handle social struggles better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'ambivalent', 
    'high-energy-comfortable', 
    '😊', 
    'feeling ambivalent', 
    1, 
    '2025-01-27T16:33:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    2, 
    '2025-01-27T16:34:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0010'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    3, 
    '2025-01-27T16:35:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0010', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-27T16:33:00+00', 
    '2025-01-27T16:35:30+00', 
    150, 
    'basic_inhale_exhale', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-29T16:15:00+00', 
    '2025-01-29T16:27:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0011', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-29T16:16:00+00', 
    16, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T15:15:00+00', 
    '2025-01-31T15:24:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-01-31T15:16:00+00', 
    21, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T15:17:00+00', 
    '2025-01-31T15:27:00+00', 
    3, 
    'learning to handle social struggles better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    1, 
    '2025-01-31T15:18:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    2, 
    '2025-01-31T15:19:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'vulnerable', 
    'high-energy-comfortable', 
    '😊', 
    'feeling vulnerable', 
    3, 
    '2025-01-31T15:20:00+00', 
    now()
);

INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0012', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-01-31T15:20:00+00', 
    '2025-01-31T15:26:00+00', 
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
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_friends', 
    'happy', 
    4, 
    'have good friends now', 
    21, 
    '2025-01-31T15:25:00+00', 
    30, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_work', 
    'ok', 
    3, 
    'improving with work', 
    19, 
    '2025-01-31T15:25:00+00', 
    57, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_health', 
    'happy', 
    4, 
    'feeling good', 
    12, 
    '2025-01-31T15:23:00+00', 
    45, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_family', 
    'ok', 
    3, 
    'improving with family', 
    21, 
    '2025-01-31T15:22:00+00', 
    35, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_fun_play', 
    'very_happy', 
    5, 
    'happy with fun_play', 
    19, 
    '2025-01-31T15:28:00+00', 
    54, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_safety', 
    'happy', 
    4, 
    'happy with safety', 
    17, 
    '2025-01-31T15:24:00+00', 
    32, 
    now()
);

INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0012'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'my_emotions', 
    'ok', 
    3, 
    'improving with emotions', 
    23, 
    '2025-01-31T15:21:00+00', 
    33, 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-03T17:30:00+00', 
    '2025-02-03T17:49:00+00', 
    'completed', 
    ARRAY['mood_meter', 'breathing_tool'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-03T17:31:00+00', 
    7, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0013', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-03T17:33:00+00', 
    '2025-02-03T17:35:30+00', 
    150, 
    'guided_4_7_8', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0014', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-05T17:00:00+00', 
    '2025-02-05T17:17:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0014', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-05T17:01:00+00', 
    5, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0014', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-05T17:02:00+00', 
    '2025-02-05T17:05:00+00', 
    3, 
    'learning to handle social struggles better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0014'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    1, 
    '2025-02-05T17:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0014'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'resilient', 
    'high-energy-comfortable', 
    '😊', 
    'feeling resilient', 
    2, 
    '2025-02-05T17:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0014'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'compassionate', 
    'high-energy-comfortable', 
    '😊', 
    'feeling compassionate', 
    3, 
    '2025-02-05T17:05:00+00', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0015', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-07T16:45:00+00', 
    '2025-02-07T16:54:00+00', 
    'completed', 
    ARRAY['mood_meter'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0015', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-07T16:46:00+00', 
    25, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at) 
VALUES (
    '12345678-1234-5678-abcd-tyle0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T16:00:00+00', 
    '2025-02-10T16:19:00+00', 
    'completed', 
    ARRAY['mood_meter', 'emotion_grid', 'breathing_tool', 'wellbeing_wheel'], 
    now(), 
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    'happy', 
    4, 
    '2025-02-10T16:01:00+00', 
    21, 
    false, 
    'feeling confident about social struggles', 
    now()
);

INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T16:02:00+00', 
    '2025-02-10T16:09:00+00', 
    3, 
    'learning to handle social struggles better each day', 
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
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'skeptical', 
    'high-energy-comfortable', 
    '😊', 
    'feeling skeptical', 
    1, 
    '2025-02-10T16:03:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'optimistic', 
    'high-energy-comfortable', 
    '😊', 
    'feeling optimistic', 
    2, 
    '2025-02-10T16:04:00+00', 
    now()
);

INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at) 
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE session_id = '12345678-1234-5678-abcd-tyle0016'), 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    'empowered', 
    'high-energy-comfortable', 
    '😊', 
    'feeling empowered', 
    3, 
    '2025-02-10T16:05:00+00', 
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at) 
VALUES (
    gen_random_uuid(), 
    '12345678-1234-5678-abcd-tyle0016', 
    'aaaabbbb-cccc-dddd-eeee-222222222224', 
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9', 
    '2025-02-10T16:03:00+00', 
    '2025-02-10T16:05:30+00', 
    150, 
    'box_breathing', 
    8, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);