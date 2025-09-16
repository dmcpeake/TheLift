-- The Lift - Complete Journey Data for 30 Children
-- Generated using actual child IDs from database
-- Period: January - March 2025
-- Authentic progression patterns based on conditions


-- Aisha Patel: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T18:00:00+00',
    '2025-01-08T18:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-08T18:01:00+00',
    7,
    false,
    'managing well with routine',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-15T16:01:00+00',
    14,
    false,
    'blood sugar stable today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T16:03:00+00',
    '2025-01-15T16:05:41+00',
    134,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-22T18:01:00+00',
    13,
    false,
    'blood sugar stable today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T18:03:00+00',
    '2025-01-22T18:05:12+00',
    168,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-29T18:01:00+00',
    7,
    false,
    'feeling more in control',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T18:03:00+00',
    '2025-01-29T18:04:27+00',
    144,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:25:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-05T15:01:00+00',
    9,
    false,
    'blood sugar stable today',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-12T17:01:00+00',
    10,
    false,
    'feeling more in control',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T17:03:00+00',
    '2025-02-12T17:05:51+00',
    98,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T16:00:00+00',
    '2025-02-19T16:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-19T16:01:00+00',
    5,
    false,
    'feeling more in control',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T15:00:00+00',
    '2025-02-26T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-26T15:01:00+00',
    16,
    false,
    'managing well with routine',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-05T18:01:00+00',
    12,
    false,
    'blood sugar stable today',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T17:00:00+00',
    '2025-03-12T17:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-12T17:01:00+00',
    7,
    false,
    'feeling more in control',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T16:00:00+00',
    '2025-03-19T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-19T16:01:00+00',
    19,
    false,
    'managing well with routine',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T16:03:00+00',
    '2025-03-19T16:05:57+00',
    171,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T16:00:00+00',
    '2025-03-26T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-26T16:01:00+00',
    13,
    false,
    'blood sugar stable today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '1d0d16ae-2aa0-4d72-9abc-fd641147291f' ORDER BY created_at DESC LIMIT 1),
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T16:03:00+00',
    '2025-03-26T16:05:35+00',
    166,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Kai Chen: 36 sessions (5x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-06T16:00:00+00',
    '2025-01-06T16:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-06T16:01:00+00',
    18,
    false,
    'feeling more like myself',
    now()
);

-- Session 2/36: Jan 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-07T17:00:00+00',
    '2025-01-07T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-07T17:01:00+00',
    15,
    false,
    'less pain today',
    now()
);

-- Session 3/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T15:00:00+00',
    '2025-01-08T15:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-08T15:01:00+00',
    16,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T15:03:00+00',
    '2025-01-08T15:05:49+00',
    102,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 09
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-09T15:00:00+00',
    '2025-01-09T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-09T15:01:00+00',
    7,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-09T15:03:00+00',
    '2025-01-09T15:04:29+00',
    132,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T15:00:00+00',
    '2025-01-10T15:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-10T15:01:00+00',
    12,
    false,
    'less pain today',
    now()
);

-- Session 6/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T16:00:00+00',
    '2025-01-13T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-13T16:01:00+00',
    15,
    false,
    'feeling more like myself',
    now()
);

-- Session 7/36: Jan 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-14T18:00:00+00',
    '2025-01-14T18:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-14T18:01:00+00',
    10,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-14T18:03:00+00',
    '2025-01-14T18:05:46+00',
    64,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T15:00:00+00',
    '2025-01-15T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-15T15:01:00+00',
    9,
    false,
    'getting stronger each day',
    now()
);

-- Session 9/36: Jan 16
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-16T16:00:00+00',
    '2025-01-16T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-16T16:01:00+00',
    17,
    false,
    'feeling more like myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-16T16:03:00+00',
    '2025-01-16T16:05:57+00',
    144,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T15:00:00+00',
    '2025-01-17T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-17T15:01:00+00',
    10,
    false,
    'feeling more like myself',
    now()
);

-- Session 11/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T15:00:00+00',
    '2025-01-20T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-20T15:01:00+00',
    5,
    false,
    'getting stronger each day',
    now()
);

-- Session 12/36: Jan 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-21T15:00:00+00',
    '2025-01-21T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-21T15:01:00+00',
    16,
    false,
    'feeling more like myself',
    now()
);

-- Session 13/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T17:00:00+00',
    '2025-01-22T17:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-22T17:01:00+00',
    16,
    false,
    'getting stronger each day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T17:03:00+00',
    '2025-01-22T17:05:11+00',
    139,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 14/36: Jan 23
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-23T17:00:00+00',
    '2025-01-23T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-23T17:01:00+00',
    12,
    false,
    'feeling more like myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-23T17:03:00+00',
    '2025-01-23T17:05:41+00',
    136,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-24T15:01:00+00',
    16,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T15:03:00+00',
    '2025-01-24T15:04:41+00',
    118,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T16:00:00+00',
    '2025-01-27T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-27T16:01:00+00',
    8,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T16:03:00+00',
    '2025-01-27T16:05:24+00',
    89,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 17/36: Jan 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-28T18:00:00+00',
    '2025-01-28T18:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-28T18:01:00+00',
    14,
    false,
    'less pain today',
    now()
);

-- Session 18/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-29T16:01:00+00',
    11,
    false,
    'less pain today',
    now()
);

-- Session 19/36: Jan 30
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-30T18:00:00+00',
    '2025-01-30T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-30T18:01:00+00',
    18,
    false,
    'getting stronger each day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-30T18:03:00+00',
    '2025-01-30T18:05:38+00',
    82,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-31T17:00:00+00',
    '2025-01-31T17:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-31T17:01:00+00',
    18,
    false,
    'less pain today',
    now()
);

-- Session 21/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-03T18:01:00+00',
    7,
    false,
    'feeling more like myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T18:03:00+00',
    '2025-02-03T18:04:15+00',
    137,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 22/36: Feb 04
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-04T17:00:00+00',
    '2025-02-04T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-04T17:01:00+00',
    6,
    false,
    'less pain today',
    now()
);

-- Session 23/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-05T17:01:00+00',
    6,
    false,
    'feeling more like myself',
    now()
);

-- Session 24/36: Feb 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-06T18:00:00+00',
    '2025-02-06T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-06T18:01:00+00',
    17,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-06T18:03:00+00',
    '2025-02-06T18:05:37+00',
    173,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T15:00:00+00',
    '2025-02-07T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-07T15:01:00+00',
    12,
    false,
    'feeling more like myself',
    now()
);

-- Session 26/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T15:00:00+00',
    '2025-02-10T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-10T15:01:00+00',
    6,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T15:03:00+00',
    '2025-02-10T15:04:59+00',
    177,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Feb 11
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-11T17:00:00+00',
    '2025-02-11T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-11T17:01:00+00',
    19,
    false,
    'feeling more like myself',
    now()
);

-- Session 28/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-12T15:01:00+00',
    19,
    false,
    'less pain today',
    now()
);

-- Session 29/36: Feb 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-13T15:00:00+00',
    '2025-02-13T15:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-13T15:01:00+00',
    9,
    false,
    'feeling more like myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-13T15:03:00+00',
    '2025-02-13T15:05:13+00',
    153,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T17:00:00+00',
    '2025-02-14T17:25:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-14T17:01:00+00',
    11,
    false,
    'less pain today',
    now()
);

-- Session 31/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T17:00:00+00',
    '2025-02-17T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-17T17:01:00+00',
    9,
    false,
    'getting stronger each day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T17:03:00+00',
    '2025-02-17T17:05:32+00',
    83,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Feb 18
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-18T17:00:00+00',
    '2025-02-18T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-18T17:01:00+00',
    5,
    false,
    'feeling more like myself',
    now()
);

-- Session 33/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-19T17:01:00+00',
    9,
    false,
    'getting stronger each day',
    now()
);

-- Session 34/36: Feb 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-20T18:00:00+00',
    '2025-02-20T18:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-20T18:01:00+00',
    7,
    false,
    'getting stronger each day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-20T18:03:00+00',
    '2025-02-20T18:05:56+00',
    162,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T17:00:00+00',
    '2025-02-21T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-21T17:01:00+00',
    6,
    false,
    'less pain today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T17:03:00+00',
    '2025-02-21T17:04:09+00',
    104,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T17:00:00+00',
    '2025-02-24T17:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '621635c0-c6c8-4eed-8a8a-48e04e9a722a' ORDER BY created_at DESC LIMIT 1),
    '621635c0-c6c8-4eed-8a8a-48e04e9a722a',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-24T17:01:00+00',
    5,
    false,
    'less pain today',
    now()
);

-- Mia Rodriguez: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-06T18:00:00+00',
    '2025-01-06T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-06T18:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T18:00:00+00',
    '2025-01-08T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-08T18:01:00+00',
    9,
    false,
    'making progress',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T15:00:00+00',
    '2025-01-10T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-10T15:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T17:00:00+00',
    '2025-01-13T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-13T17:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T17:03:00+00',
    '2025-01-13T17:05:12+00',
    117,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:13:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-15T16:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:12:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-17T17:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:00:00+00',
    '2025-01-20T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-20T18:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:03:00+00',
    '2025-01-20T18:04:02+00',
    152,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T16:00:00+00',
    '2025-01-22T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-22T16:01:00+00',
    9,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T16:03:00+00',
    '2025-01-22T16:05:35+00',
    79,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-24T15:01:00+00',
    18,
    false,
    'making progress',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-27T15:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T15:00:00+00',
    '2025-01-29T15:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-29T15:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-31T15:00:00+00',
    '2025-01-31T15:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-31T15:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T15:00:00+00',
    '2025-02-03T15:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-03T15:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-05T17:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T17:00:00+00',
    '2025-02-07T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-07T17:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T17:03:00+00',
    '2025-02-07T17:05:37+00',
    98,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T16:00:00+00',
    '2025-02-10T16:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-10T16:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-12T15:01:00+00',
    11,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T15:03:00+00',
    '2025-02-12T15:04:30+00',
    104,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-14T18:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T18:03:00+00',
    '2025-02-14T18:05:34+00',
    71,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T15:00:00+00',
    '2025-02-17T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-17T15:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T15:03:00+00',
    '2025-02-17T15:04:41+00',
    179,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-19T17:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T18:00:00+00',
    '2025-02-21T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-21T18:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T18:03:00+00',
    '2025-02-21T18:04:18+00',
    94,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T15:00:00+00',
    '2025-02-24T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-24T15:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T15:03:00+00',
    '2025-02-24T15:05:27+00',
    89,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T15:00:00+00',
    '2025-02-26T15:25:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-26T15:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-28T15:00:00+00',
    '2025-02-28T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-28T15:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-28T15:03:00+00',
    '2025-02-28T15:05:41+00',
    92,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-03T17:00:00+00',
    '2025-03-03T17:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-03T17:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T15:00:00+00',
    '2025-03-05T15:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-03-05T15:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T15:03:00+00',
    '2025-03-05T15:05:00+00',
    108,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-07T15:00:00+00',
    '2025-03-07T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-07T15:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-10T16:00:00+00',
    '2025-03-10T16:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-03-10T16:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-10T16:03:00+00',
    '2025-03-10T16:05:09+00',
    68,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T17:00:00+00',
    '2025-03-12T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-12T17:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T17:03:00+00',
    '2025-03-12T17:04:06+00',
    119,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-14T18:00:00+00',
    '2025-03-14T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-14T18:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-17T16:00:00+00',
    '2025-03-17T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-17T16:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-17T16:03:00+00',
    '2025-03-17T16:05:13+00',
    139,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T17:00:00+00',
    '2025-03-19T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-19T17:01:00+00',
    12,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T17:03:00+00',
    '2025-03-19T17:05:18+00',
    65,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-21T15:00:00+00',
    '2025-03-21T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-21T15:01:00+00',
    6,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-21T15:03:00+00',
    '2025-03-21T15:04:06+00',
    112,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-24T17:00:00+00',
    '2025-03-24T17:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-24T17:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T17:00:00+00',
    '2025-03-26T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-26T17:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T17:03:00+00',
    '2025-03-26T17:05:43+00',
    113,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-28T16:00:00+00',
    '2025-03-28T16:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-28T16:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '87c1f890-2789-411f-b8bd-801b7b568c47' ORDER BY created_at DESC LIMIT 1),
    '87c1f890-2789-411f-b8bd-801b7b568c47',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-28T16:03:00+00',
    '2025-03-28T16:05:24+00',
    123,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Ethan Williams: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-06T16:00:00+00',
    '2025-01-06T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-06T16:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    11,
    false,
    'feeling okay today',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T16:00:00+00',
    '2025-01-10T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-10T16:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T16:03:00+00',
    '2025-01-10T16:04:47+00',
    141,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T15:00:00+00',
    '2025-01-13T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-13T15:01:00+00',
    6,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T15:03:00+00',
    '2025-01-13T15:04:27+00',
    113,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:25:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-15T18:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-17T17:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:00:00+00',
    '2025-01-20T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-20T18:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:03:00+00',
    '2025-01-20T18:05:28+00',
    89,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T15:00:00+00',
    '2025-01-22T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-22T15:01:00+00',
    16,
    false,
    'making progress',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-24T15:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-27T15:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T15:03:00+00',
    '2025-01-27T15:04:57+00',
    150,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-29T18:01:00+00',
    5,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T18:03:00+00',
    '2025-01-29T18:04:41+00',
    69,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-31T17:00:00+00',
    '2025-01-31T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-31T17:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T16:00:00+00',
    '2025-02-03T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-03T16:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T18:00:00+00',
    '2025-02-05T18:13:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-05T18:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T15:00:00+00',
    '2025-02-07T15:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-07T15:01:00+00',
    5,
    false,
    'making progress',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T15:00:00+00',
    '2025-02-10T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-10T15:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T15:03:00+00',
    '2025-02-10T15:05:30+00',
    160,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-12T16:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T16:03:00+00',
    '2025-02-12T16:04:44+00',
    66,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T17:00:00+00',
    '2025-02-14T17:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-14T17:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T18:00:00+00',
    '2025-02-17T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-17T18:01:00+00',
    14,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T18:03:00+00',
    '2025-02-17T18:05:12+00',
    117,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T18:00:00+00',
    '2025-02-19T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-19T18:01:00+00',
    7,
    false,
    'making progress',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T18:00:00+00',
    '2025-02-21T18:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-21T18:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T15:00:00+00',
    '2025-02-24T15:25:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-24T15:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-26T16:01:00+00',
    11,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T16:03:00+00',
    '2025-02-26T16:04:43+00',
    164,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-28T18:00:00+00',
    '2025-02-28T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-28T18:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-03T18:00:00+00',
    '2025-03-03T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-03T18:01:00+00',
    6,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-03T18:03:00+00',
    '2025-03-03T18:05:46+00',
    131,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T16:00:00+00',
    '2025-03-05T16:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-05T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T16:03:00+00',
    '2025-03-05T16:05:05+00',
    78,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-07T15:00:00+00',
    '2025-03-07T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-07T15:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-07T15:03:00+00',
    '2025-03-07T15:05:36+00',
    104,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-10T15:00:00+00',
    '2025-03-10T15:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-10T15:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T15:00:00+00',
    '2025-03-12T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-12T15:01:00+00',
    6,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T15:03:00+00',
    '2025-03-12T15:05:45+00',
    166,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-14T15:00:00+00',
    '2025-03-14T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-14T15:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-17T18:00:00+00',
    '2025-03-17T18:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-17T18:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T18:00:00+00',
    '2025-03-19T18:25:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-19T18:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-21T18:00:00+00',
    '2025-03-21T18:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-21T18:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-24T16:00:00+00',
    '2025-03-24T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-24T16:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-24T16:03:00+00',
    '2025-03-24T16:04:12+00',
    127,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T18:00:00+00',
    '2025-03-26T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-26T18:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-28T16:00:00+00',
    '2025-03-28T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-28T16:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '5b864e7e-473e-4232-98b6-5eabdac2ece4' ORDER BY created_at DESC LIMIT 1),
    '5b864e7e-473e-4232-98b6-5eabdac2ece4',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-28T16:03:00+00',
    '2025-03-28T16:05:16+00',
    122,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Zara Ahmed: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-15T18:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T16:00:00+00',
    '2025-01-22T16:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-22T16:01:00+00',
    19,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T16:03:00+00',
    '2025-01-22T16:04:34+00',
    124,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:22:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-29T16:01:00+00',
    8,
    false,
    'making progress',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T16:00:00+00',
    '2025-02-05T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-05T16:01:00+00',
    20,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T16:03:00+00',
    '2025-02-05T16:04:47+00',
    132,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-12T16:01:00+00',
    15,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T16:03:00+00',
    '2025-02-12T16:04:04+00',
    89,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T16:00:00+00',
    '2025-02-19T16:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-19T16:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T17:00:00+00',
    '2025-02-26T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-26T17:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T17:03:00+00',
    '2025-02-26T17:04:12+00',
    103,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T15:00:00+00',
    '2025-03-05T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-05T15:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T15:00:00+00',
    '2025-03-12T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-12T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T17:00:00+00',
    '2025-03-19T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-19T17:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T17:03:00+00',
    '2025-03-19T17:04:10+00',
    147,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T17:00:00+00',
    '2025-03-26T17:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '332fe862-786f-4bd5-aba5-8742fbcc460f' ORDER BY created_at DESC LIMIT 1),
    '332fe862-786f-4bd5-aba5-8742fbcc460f',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-26T17:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

-- Lucas Brown: 36 sessions (5x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-06T15:00:00+00',
    '2025-01-06T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-06T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-06T15:03:00+00',
    '2025-01-06T15:05:04+00',
    171,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/36: Jan 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-07T15:00:00+00',
    '2025-01-07T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-07T15:01:00+00',
    19,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-07T15:03:00+00',
    '2025-01-07T15:05:57+00',
    93,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T17:00:00+00',
    '2025-01-08T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-08T17:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T17:03:00+00',
    '2025-01-08T17:04:29+00',
    108,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 09
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-09T17:00:00+00',
    '2025-01-09T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-09T17:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

-- Session 5/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T17:00:00+00',
    '2025-01-10T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-10T17:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T17:03:00+00',
    '2025-01-10T17:04:55+00',
    79,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-13T18:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

-- Session 7/36: Jan 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-14T16:00:00+00',
    '2025-01-14T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-14T16:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 8/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-15T16:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T16:03:00+00',
    '2025-01-15T16:04:04+00',
    145,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 16
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-16T17:00:00+00',
    '2025-01-16T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-16T17:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

-- Session 10/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-17T17:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T17:03:00+00',
    '2025-01-17T17:04:59+00',
    140,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:00:00+00',
    '2025-01-20T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-20T18:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:03:00+00',
    '2025-01-20T18:05:50+00',
    105,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-21T16:00:00+00',
    '2025-01-21T16:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-21T16:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

-- Session 13/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-22T18:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T18:03:00+00',
    '2025-01-22T18:04:41+00',
    116,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 14/36: Jan 23
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-23T17:00:00+00',
    '2025-01-23T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-23T17:01:00+00',
    10,
    false,
    'making progress',
    now()
);

-- Session 15/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-24T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T15:03:00+00',
    '2025-01-24T15:05:40+00',
    175,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-27T15:01:00+00',
    20,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T15:03:00+00',
    '2025-01-27T15:05:29+00',
    92,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 17/36: Jan 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-28T18:00:00+00',
    '2025-01-28T18:25:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-28T18:01:00+00',
    18,
    false,
    'making progress',
    now()
);

-- Session 18/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T15:00:00+00',
    '2025-01-29T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-29T15:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

-- Session 19/36: Jan 30
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-30T16:00:00+00',
    '2025-01-30T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-30T16:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-30T16:03:00+00',
    '2025-01-30T16:05:01+00',
    176,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-31T15:00:00+00',
    '2025-01-31T15:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-31T15:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

-- Session 21/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T16:00:00+00',
    '2025-02-03T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-03T16:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 22/36: Feb 04
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-04T15:00:00+00',
    '2025-02-04T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-04T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-04T15:03:00+00',
    '2025-02-04T15:05:12+00',
    130,
    'box_breathing',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 23/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-05T15:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 24/36: Feb 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-06T18:00:00+00',
    '2025-02-06T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-06T18:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-06T18:03:00+00',
    '2025-02-06T18:04:17+00',
    123,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T16:00:00+00',
    '2025-02-07T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-07T16:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Session 26/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T18:00:00+00',
    '2025-02-10T18:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-10T18:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T18:03:00+00',
    '2025-02-10T18:04:56+00',
    152,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Feb 11
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-11T18:00:00+00',
    '2025-02-11T18:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-11T18:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-11T18:03:00+00',
    '2025-02-11T18:05:37+00',
    66,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-12T17:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T17:03:00+00',
    '2025-02-12T17:05:11+00',
    119,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Feb 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-13T17:00:00+00',
    '2025-02-13T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-13T17:01:00+00',
    12,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-13T17:03:00+00',
    '2025-02-13T17:05:41+00',
    86,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-14T18:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T18:03:00+00',
    '2025-02-14T18:04:32+00',
    160,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T18:00:00+00',
    '2025-02-17T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-17T18:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 32/36: Feb 18
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-18T15:00:00+00',
    '2025-02-18T15:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-18T15:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

-- Session 33/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-19T17:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T17:03:00+00',
    '2025-02-19T17:04:26+00',
    118,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Feb 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-20T16:00:00+00',
    '2025-02-20T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-20T16:01:00+00',
    16,
    false,
    'making progress',
    now()
);

-- Session 35/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T15:00:00+00',
    '2025-02-21T15:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-21T15:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 36/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T15:00:00+00',
    '2025-02-24T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-24T15:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2598d59d-1fda-4391-9fa0-85f28116eab2' ORDER BY created_at DESC LIMIT 1),
    '2598d59d-1fda-4391-9fa0-85f28116eab2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T15:03:00+00',
    '2025-02-24T15:05:19+00',
    133,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Amara Johnson: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T16:03:00+00',
    '2025-01-08T16:04:28+00',
    61,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T17:00:00+00',
    '2025-01-15T17:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-15T17:01:00+00',
    5,
    false,
    'making progress',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T17:00:00+00',
    '2025-01-22T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-22T17:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T17:03:00+00',
    '2025-01-22T17:05:57+00',
    83,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-29T18:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-05T15:01:00+00',
    16,
    false,
    'making progress',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-12T15:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T18:00:00+00',
    '2025-02-19T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-19T18:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-26T16:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-05T18:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T18:00:00+00',
    '2025-03-12T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-12T18:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T15:00:00+00',
    '2025-03-19T15:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-19T15:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T15:03:00+00',
    '2025-03-19T15:05:09+00',
    131,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T15:00:00+00',
    '2025-03-26T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-26T15:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5' ORDER BY created_at DESC LIMIT 1),
    '3e8e4d85-1e43-41c4-95fc-77741fd5b7a5',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T15:03:00+00',
    '2025-03-26T15:05:43+00',
    67,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Ben Young: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-06T18:00:00+00',
    '2025-01-06T18:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-06T18:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T18:00:00+00',
    '2025-01-08T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-08T18:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T18:00:00+00',
    '2025-01-10T18:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-10T18:01:00+00',
    5,
    false,
    'making progress',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T16:00:00+00',
    '2025-01-13T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-13T16:01:00+00',
    18,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T16:03:00+00',
    '2025-01-13T16:04:55+00',
    140,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:25:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-15T18:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-17T17:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T17:03:00+00',
    '2025-01-17T17:05:37+00',
    69,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:00:00+00',
    '2025-01-20T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-20T18:01:00+00',
    5,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:03:00+00',
    '2025-01-20T18:04:08+00',
    151,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T16:00:00+00',
    '2025-01-22T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-22T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T16:03:00+00',
    '2025-01-22T16:05:33+00',
    98,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T18:00:00+00',
    '2025-01-24T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-24T18:01:00+00',
    17,
    false,
    'making progress',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T16:00:00+00',
    '2025-01-27T16:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-27T16:01:00+00',
    10,
    false,
    'making progress',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-29T16:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T16:03:00+00',
    '2025-01-29T16:04:40+00',
    81,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-31T18:00:00+00',
    '2025-01-31T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-31T18:01:00+00',
    11,
    false,
    'making progress',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T16:00:00+00',
    '2025-02-03T16:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-02-03T16:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T16:03:00+00',
    '2025-02-03T16:05:48+00',
    80,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-05T15:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T16:00:00+00',
    '2025-02-07T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-07T16:01:00+00',
    5,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T16:03:00+00',
    '2025-02-07T16:04:10+00',
    128,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T15:00:00+00',
    '2025-02-10T15:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-10T15:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T18:00:00+00',
    '2025-02-12T18:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-12T18:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T18:03:00+00',
    '2025-02-12T18:05:27+00',
    118,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-14T18:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T18:00:00+00',
    '2025-02-17T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-17T18:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T18:03:00+00',
    '2025-02-17T18:05:00+00',
    130,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-19T15:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:05:49+00',
    62,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T16:00:00+00',
    '2025-02-21T16:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-21T16:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T18:00:00+00',
    '2025-02-24T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-24T18:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T18:03:00+00',
    '2025-02-24T18:04:18+00',
    86,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T18:00:00+00',
    '2025-02-26T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-26T18:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-26T18:03:00+00',
    '2025-02-26T18:05:19+00',
    85,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-28T18:00:00+00',
    '2025-02-28T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-28T18:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-28T18:03:00+00',
    '2025-02-28T18:05:15+00',
    149,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-03T15:00:00+00',
    '2025-03-03T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-03T15:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T16:00:00+00',
    '2025-03-05T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-05T16:01:00+00',
    7,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-05T16:03:00+00',
    '2025-03-05T16:04:11+00',
    140,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-07T18:00:00+00',
    '2025-03-07T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-07T18:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-10T17:00:00+00',
    '2025-03-10T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-10T17:01:00+00',
    18,
    false,
    'making progress',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-12T18:00:00+00',
    '2025-03-12T18:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-12T18:01:00+00',
    8,
    false,
    'making progress',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-14T16:00:00+00',
    '2025-03-14T16:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-14T16:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-17T15:00:00+00',
    '2025-03-17T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-17T15:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-19T15:00:00+00',
    '2025-03-19T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-19T15:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-21T17:00:00+00',
    '2025-03-21T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-21T17:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-24T15:00:00+00',
    '2025-03-24T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-24T15:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-24T15:03:00+00',
    '2025-03-24T15:04:45+00',
    86,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T15:00:00+00',
    '2025-03-26T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-03-26T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-26T15:03:00+00',
    '2025-03-26T15:04:20+00',
    165,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-28T18:00:00+00',
    '2025-03-28T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-03-28T18:01:00+00',
    10,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '616f03bd-aa58-4689-9e88-f1c7d5424f04' ORDER BY created_at DESC LIMIT 1),
    '616f03bd-aa58-4689-9e88-f1c7d5424f04',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-03-28T18:03:00+00',
    '2025-03-28T18:05:43+00',
    147,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Chloe King: 36 sessions (5x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-06T16:00:00+00',
    '2025-01-06T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-06T16:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 2/36: Jan 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-07T17:00:00+00',
    '2025-01-07T17:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-07T17:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-07T17:03:00+00',
    '2025-01-07T17:05:55+00',
    180,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_sad',
    1,
    '2025-01-08T16:01:00+00',
    8,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-08T16:03:00+00',
    '2025-01-08T16:05:20+00',
    62,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 09
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-09T16:00:00+00',
    '2025-01-09T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-09T16:01:00+00',
    9,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-09T16:03:00+00',
    '2025-01-09T16:05:03+00',
    116,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T18:00:00+00',
    '2025-01-10T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-10T18:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-10T18:03:00+00',
    '2025-01-10T18:05:59+00',
    162,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-13T18:01:00+00',
    17,
    false,
    'making progress',
    now()
);

-- Session 7/36: Jan 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-14T18:00:00+00',
    '2025-01-14T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-14T18:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-14T18:03:00+00',
    '2025-01-14T18:05:55+00',
    98,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T17:00:00+00',
    '2025-01-15T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-15T17:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-15T17:03:00+00',
    '2025-01-15T17:05:50+00',
    60,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 16
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-16T16:00:00+00',
    '2025-01-16T16:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'sad',
    2,
    '2025-01-16T16:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

-- Session 10/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-17T17:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

-- Session 11/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-20T18:00:00+00',
    '2025-01-20T18:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-20T18:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

-- Session 12/36: Jan 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-21T16:00:00+00',
    '2025-01-21T16:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-21T16:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

-- Session 13/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-22T18:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

-- Session 14/36: Jan 23
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-23T18:00:00+00',
    '2025-01-23T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-23T18:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 15/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T16:00:00+00',
    '2025-01-24T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-24T16:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-24T16:03:00+00',
    '2025-01-24T16:05:43+00',
    123,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-27T16:00:00+00',
    '2025-01-27T16:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-27T16:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 17/36: Jan 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-28T15:00:00+00',
    '2025-01-28T15:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-28T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Session 18/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-29T16:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-29T16:03:00+00',
    '2025-01-29T16:04:53+00',
    102,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Jan 30
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-30T18:00:00+00',
    '2025-01-30T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-01-30T18:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-30T18:03:00+00',
    '2025-01-30T18:05:29+00',
    137,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-01-31T16:00:00+00',
    '2025-01-31T16:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-01-31T16:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 21/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-03T18:01:00+00',
    18,
    false,
    'making progress',
    now()
);

-- Session 22/36: Feb 04
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-04T17:00:00+00',
    '2025-02-04T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-04T17:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-04T17:03:00+00',
    '2025-02-04T17:04:57+00',
    65,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 23/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-05T17:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-05T17:03:00+00',
    '2025-02-05T17:04:15+00',
    169,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 24/36: Feb 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-06T16:00:00+00',
    '2025-02-06T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-06T16:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-06T16:03:00+00',
    '2025-02-06T16:04:16+00',
    61,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-07T18:00:00+00',
    '2025-02-07T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-07T18:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

-- Session 26/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-10T17:00:00+00',
    '2025-02-10T17:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-10T17:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

-- Session 27/36: Feb 11
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-11T18:00:00+00',
    '2025-02-11T18:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-11T18:01:00+00',
    8,
    false,
    'making progress',
    now()
);

-- Session 28/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'ok',
    3,
    '2025-02-12T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-12T15:03:00+00',
    '2025-02-12T15:05:13+00',
    168,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Feb 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-13T17:00:00+00',
    '2025-02-13T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-13T17:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-13T17:03:00+00',
    '2025-02-13T17:04:42+00',
    87,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T15:00:00+00',
    '2025-02-14T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-14T15:01:00+00',
    14,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-14T15:03:00+00',
    '2025-02-14T15:04:58+00',
    150,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-17T15:00:00+00',
    '2025-02-17T15:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-17T15:01:00+00',
    16,
    false,
    'making progress',
    now()
);

-- Session 32/36: Feb 18
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-18T17:00:00+00',
    '2025-02-18T17:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-18T17:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

-- Session 33/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-19T18:00:00+00',
    '2025-02-19T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-19T18:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

-- Session 34/36: Feb 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-20T16:00:00+00',
    '2025-02-20T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'very_happy',
    5,
    '2025-02-20T16:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-20T16:03:00+00',
    '2025-02-20T16:05:20+00',
    92,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T17:00:00+00',
    '2025-02-21T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-21T17:01:00+00',
    15,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-21T17:03:00+00',
    '2025-02-21T17:05:46+00',
    171,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T15:00:00+00',
    '2025-02-24T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    'happy',
    4,
    '2025-02-24T15:01:00+00',
    16,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '28e7a649-8677-4476-b88c-b5b923a9a4e2' ORDER BY created_at DESC LIMIT 1),
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    '7eab219a-7c83-406c-a6b2-75ed44de715b',
    '2025-02-24T15:03:00+00',
    '2025-02-24T15:05:26+00',
    144,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Oliver Davies: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T16:00:00+00',
    '2025-01-06T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-06T16:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T16:03:00+00',
    '2025-01-06T16:05:01+00',
    82,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T15:00:00+00',
    '2025-01-08T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T15:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T15:03:00+00',
    '2025-01-08T15:05:09+00',
    119,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T16:00:00+00',
    '2025-01-10T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-10T16:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T16:03:00+00',
    '2025-01-10T16:04:25+00',
    97,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-13T18:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T15:00:00+00',
    '2025-01-15T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-15T15:01:00+00',
    14,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T15:03:00+00',
    '2025-01-15T15:04:34+00',
    74,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T15:00:00+00',
    '2025-01-17T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-17T15:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T15:03:00+00',
    '2025-01-17T15:04:49+00',
    167,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T15:00:00+00',
    '2025-01-20T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-20T15:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T15:03:00+00',
    '2025-01-20T15:04:34+00',
    131,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-22T18:01:00+00',
    19,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T18:03:00+00',
    '2025-01-22T18:04:41+00',
    171,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T18:00:00+00',
    '2025-01-24T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-24T18:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T18:03:00+00',
    '2025-01-24T18:04:52+00',
    119,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T16:00:00+00',
    '2025-01-27T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-27T16:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T16:03:00+00',
    '2025-01-27T16:04:17+00',
    133,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-29T16:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T16:00:00+00',
    '2025-01-31T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-31T16:01:00+00',
    7,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T16:03:00+00',
    '2025-01-31T16:05:26+00',
    89,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:13:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-03T18:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:00:00+00',
    '2025-02-05T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-05T18:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:03:00+00',
    '2025-02-05T18:04:54+00',
    153,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T15:00:00+00',
    '2025-02-07T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-07T15:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T15:03:00+00',
    '2025-02-07T15:04:45+00',
    73,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-10T18:00:00+00',
    '2025-02-10T18:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-10T18:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-10T18:03:00+00',
    '2025-02-10T18:05:46+00',
    76,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-12T15:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T17:00:00+00',
    '2025-02-14T17:12:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-14T17:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T15:00:00+00',
    '2025-02-17T15:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-17T15:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T15:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:04:47+00',
    167,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T17:00:00+00',
    '2025-02-21T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-21T17:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T17:03:00+00',
    '2025-02-21T17:04:43+00',
    155,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-24T15:00:00+00',
    '2025-02-24T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-24T15:01:00+00',
    7,
    false,
    'making progress',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-26T16:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T15:00:00+00',
    '2025-02-28T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-28T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T15:03:00+00',
    '2025-02-28T15:04:49+00',
    135,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-03T18:00:00+00',
    '2025-03-03T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-03T18:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T15:00:00+00',
    '2025-03-05T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-03-05T15:01:00+00',
    5,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T15:03:00+00',
    '2025-03-05T15:05:48+00',
    109,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-07T15:00:00+00',
    '2025-03-07T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-07T15:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-10T18:00:00+00',
    '2025-03-10T18:13:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-10T18:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T16:00:00+00',
    '2025-03-12T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-12T16:01:00+00',
    7,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T16:03:00+00',
    '2025-03-12T16:05:57+00',
    79,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-14T17:00:00+00',
    '2025-03-14T17:13:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-14T17:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-17T15:00:00+00',
    '2025-03-17T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-17T15:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-17T15:03:00+00',
    '2025-03-17T15:04:21+00',
    138,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T15:00:00+00',
    '2025-03-19T15:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-19T15:01:00+00',
    10,
    false,
    'making progress',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-21T17:00:00+00',
    '2025-03-21T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-21T17:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-24T15:00:00+00',
    '2025-03-24T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-24T15:01:00+00',
    12,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-24T15:03:00+00',
    '2025-03-24T15:05:12+00',
    90,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T16:00:00+00',
    '2025-03-26T16:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-26T16:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T16:03:00+00',
    '2025-03-26T16:04:40+00',
    177,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-28T15:00:00+00',
    '2025-03-28T15:25:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd9e80399-1a4d-4ac6-8634-077f35846eec' ORDER BY created_at DESC LIMIT 1),
    'd9e80399-1a4d-4ac6-8634-077f35846eec',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-28T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Jayden Smith: 36 sessions (5x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T15:00:00+00',
    '2025-01-06T15:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-06T15:01:00+00',
    17,
    false,
    'feeling proud of myself',
    now()
);

-- Session 2/36: Jan 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-07T17:00:00+00',
    '2025-01-07T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-07T17:01:00+00',
    16,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-07T17:03:00+00',
    '2025-01-07T17:04:20+00',
    67,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-08T16:01:00+00',
    11,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:03:00+00',
    '2025-01-08T16:05:28+00',
    162,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 09
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-09T15:00:00+00',
    '2025-01-09T15:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-09T15:01:00+00',
    9,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-09T15:03:00+00',
    '2025-01-09T15:04:57+00',
    110,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T15:00:00+00',
    '2025-01-10T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-10T15:01:00+00',
    7,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T15:03:00+00',
    '2025-01-10T15:04:56+00',
    68,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-13T18:01:00+00',
    12,
    false,
    'feeling proud of myself',
    now()
);

-- Session 7/36: Jan 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-14T17:00:00+00',
    '2025-01-14T17:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-14T17:01:00+00',
    19,
    false,
    'focused better today',
    now()
);

-- Session 8/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T17:00:00+00',
    '2025-01-15T17:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-15T17:01:00+00',
    20,
    false,
    'focused better today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T17:03:00+00',
    '2025-01-15T17:04:20+00',
    144,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 16
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-16T18:00:00+00',
    '2025-01-16T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-16T18:01:00+00',
    13,
    false,
    'had fun in activities',
    now()
);

-- Session 10/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T16:00:00+00',
    '2025-01-17T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-17T16:01:00+00',
    11,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T16:03:00+00',
    '2025-01-17T16:04:05+00',
    97,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T15:00:00+00',
    '2025-01-20T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-20T15:01:00+00',
    9,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T15:03:00+00',
    '2025-01-20T15:04:59+00',
    164,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-21T18:00:00+00',
    '2025-01-21T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-21T18:01:00+00',
    8,
    false,
    'had fun in activities',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-21T18:03:00+00',
    '2025-01-21T18:05:05+00',
    140,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 13/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T16:00:00+00',
    '2025-01-22T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-22T16:01:00+00',
    12,
    false,
    'had fun in activities',
    now()
);

-- Session 14/36: Jan 23
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-23T15:00:00+00',
    '2025-01-23T15:17:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-23T15:01:00+00',
    13,
    false,
    'had fun in activities',
    now()
);

-- Session 15/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T17:00:00+00',
    '2025-01-24T17:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-24T17:01:00+00',
    8,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T17:03:00+00',
    '2025-01-24T17:04:21+00',
    73,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-27T15:01:00+00',
    16,
    false,
    'had fun in activities',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T15:03:00+00',
    '2025-01-27T15:04:33+00',
    133,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 17/36: Jan 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-28T15:00:00+00',
    '2025-01-28T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-28T15:01:00+00',
    16,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-28T15:03:00+00',
    '2025-01-28T15:04:49+00',
    64,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T17:00:00+00',
    '2025-01-29T17:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-29T17:01:00+00',
    15,
    false,
    'feeling proud of myself',
    now()
);

-- Session 19/36: Jan 30
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-30T16:00:00+00',
    '2025-01-30T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-30T16:01:00+00',
    6,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-30T16:03:00+00',
    '2025-01-30T16:05:52+00',
    147,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T17:00:00+00',
    '2025-01-31T17:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-31T17:01:00+00',
    10,
    false,
    'had fun in activities',
    now()
);

-- Session 21/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-03T15:00:00+00',
    '2025-02-03T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-03T15:01:00+00',
    19,
    false,
    'feeling proud of myself',
    now()
);

-- Session 22/36: Feb 04
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-04T15:00:00+00',
    '2025-02-04T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-04T15:01:00+00',
    13,
    false,
    'had fun in activities',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-04T15:03:00+00',
    '2025-02-04T15:05:27+00',
    108,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 23/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:00:00+00',
    '2025-02-05T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-05T18:01:00+00',
    17,
    false,
    'had fun in activities',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:03:00+00',
    '2025-02-05T18:04:37+00',
    166,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 24/36: Feb 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-06T15:00:00+00',
    '2025-02-06T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-06T15:01:00+00',
    5,
    false,
    'focused better today',
    now()
);

-- Session 25/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T17:00:00+00',
    '2025-02-07T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-07T17:01:00+00',
    11,
    false,
    'had fun in activities',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T17:03:00+00',
    '2025-02-07T17:05:36+00',
    160,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-10T17:00:00+00',
    '2025-02-10T17:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-10T17:01:00+00',
    9,
    false,
    'focused better today',
    now()
);

-- Session 27/36: Feb 11
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-11T18:00:00+00',
    '2025-02-11T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-11T18:01:00+00',
    5,
    false,
    'had fun in activities',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-11T18:03:00+00',
    '2025-02-11T18:04:21+00',
    107,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:25:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-12T17:01:00+00',
    13,
    false,
    'feeling proud of myself',
    now()
);

-- Session 29/36: Feb 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-13T18:00:00+00',
    '2025-02-13T18:25:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-13T18:01:00+00',
    15,
    false,
    'had fun in activities',
    now()
);

-- Session 30/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T15:00:00+00',
    '2025-02-14T15:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-14T15:01:00+00',
    6,
    false,
    'feeling proud of myself',
    now()
);

-- Session 31/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T15:00:00+00',
    '2025-02-17T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-17T15:01:00+00',
    5,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T15:03:00+00',
    '2025-02-17T15:04:28+00',
    100,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Feb 18
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-18T16:00:00+00',
    '2025-02-18T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-18T16:01:00+00',
    12,
    false,
    'focused better today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-18T16:03:00+00',
    '2025-02-18T16:05:02+00',
    90,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 33/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T16:00:00+00',
    '2025-02-19T16:22:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T16:01:00+00',
    8,
    false,
    'had fun in activities',
    now()
);

-- Session 34/36: Feb 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-20T15:00:00+00',
    '2025-02-20T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-20T15:01:00+00',
    6,
    false,
    'feeling proud of myself',
    now()
);

-- Session 35/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T16:00:00+00',
    '2025-02-21T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-21T16:01:00+00',
    12,
    false,
    'had fun in activities',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T16:03:00+00',
    '2025-02-21T16:05:28+00',
    102,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-24T18:00:00+00',
    '2025-02-24T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-24T18:01:00+00',
    14,
    false,
    'feeling proud of myself',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '02855440-b7f1-478e-b8fe-f72e2b6511cd' ORDER BY created_at DESC LIMIT 1),
    '02855440-b7f1-478e-b8fe-f72e2b6511cd',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-24T18:03:00+00',
    '2025-02-24T18:05:30+00',
    125,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Sophia Wilson: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    16,
    false,
    'feeling less worried',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-15T16:01:00+00',
    15,
    false,
    'breathing helped today',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T15:00:00+00',
    '2025-01-22T15:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-22T15:01:00+00',
    8,
    false,
    'breathing helped today',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-29T18:01:00+00',
    9,
    false,
    'feeling less worried',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-05T15:01:00+00',
    14,
    false,
    'feeling less worried',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-12T17:01:00+00',
    8,
    false,
    'breathing helped today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T17:03:00+00',
    '2025-02-12T17:04:53+00',
    74,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-19T15:01:00+00',
    17,
    false,
    'found a calm moment',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:04:17+00',
    81,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T17:00:00+00',
    '2025-02-26T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-26T17:01:00+00',
    10,
    false,
    'feeling less worried',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T17:03:00+00',
    '2025-02-26T17:05:00+00',
    117,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-03-05T18:01:00+00',
    5,
    false,
    'feeling less worried',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T18:03:00+00',
    '2025-03-05T18:05:34+00',
    161,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T18:00:00+00',
    '2025-03-12T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-12T18:01:00+00',
    8,
    false,
    'feeling less worried',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T18:03:00+00',
    '2025-03-12T18:04:46+00',
    161,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T15:00:00+00',
    '2025-03-19T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-19T15:01:00+00',
    16,
    false,
    'feeling less worried',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T15:03:00+00',
    '2025-03-19T15:04:06+00',
    68,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T15:00:00+00',
    '2025-03-26T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'b6d90425-2c36-4f96-8040-8eefdec50224' ORDER BY created_at DESC LIMIT 1),
    'b6d90425-2c36-4f96-8040-8eefdec50224',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-26T15:01:00+00',
    11,
    false,
    'found a calm moment',
    now()
);

-- Tyler Anderson: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T15:00:00+00',
    '2025-01-06T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-06T15:01:00+00',
    10,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T15:03:00+00',
    '2025-01-06T15:04:11+00',
    160,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T17:00:00+00',
    '2025-01-08T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T17:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T17:03:00+00',
    '2025-01-08T17:05:01+00',
    127,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T18:00:00+00',
    '2025-01-10T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-10T18:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T18:03:00+00',
    '2025-01-10T18:04:50+00',
    94,
    'box_breathing',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T15:00:00+00',
    '2025-01-13T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-13T15:01:00+00',
    16,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T15:03:00+00',
    '2025-01-13T15:04:15+00',
    179,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-15T16:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T16:03:00+00',
    '2025-01-15T16:04:37+00',
    89,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-17T17:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T16:00:00+00',
    '2025-01-20T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-20T16:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T16:03:00+00',
    '2025-01-20T16:04:36+00',
    134,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T17:00:00+00',
    '2025-01-22T17:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-22T17:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-24T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T15:03:00+00',
    '2025-01-24T15:04:12+00',
    113,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-27T15:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T15:03:00+00',
    '2025-01-27T15:05:01+00',
    111,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-29T16:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T16:00:00+00',
    '2025-01-31T16:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-31T16:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-02-03T18:01:00+00',
    16,
    false,
    'making progress',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T16:00:00+00',
    '2025-02-05T16:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-05T16:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T17:00:00+00',
    '2025-02-07T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-07T17:01:00+00',
    18,
    false,
    'making progress',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-10T18:00:00+00',
    '2025-02-10T18:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-10T18:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-12T16:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T16:03:00+00',
    '2025-02-12T16:05:29+00',
    121,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-14T18:01:00+00',
    20,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T18:03:00+00',
    '2025-02-14T18:05:09+00',
    103,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T17:00:00+00',
    '2025-02-17T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-17T17:01:00+00',
    7,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T17:03:00+00',
    '2025-02-17T17:05:44+00',
    76,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T17:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T15:00:00+00',
    '2025-02-21T15:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-21T15:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-24T17:00:00+00',
    '2025-02-24T17:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-24T17:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T17:00:00+00',
    '2025-02-26T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-26T17:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T16:00:00+00',
    '2025-02-28T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-28T16:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T16:03:00+00',
    '2025-02-28T16:05:03+00',
    94,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-03T16:00:00+00',
    '2025-03-03T16:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-03-03T16:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-05T18:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T18:03:00+00',
    '2025-03-05T18:04:30+00',
    147,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-07T16:00:00+00',
    '2025-03-07T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-07T16:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-10T18:00:00+00',
    '2025-03-10T18:13:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-10T18:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T17:00:00+00',
    '2025-03-12T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-12T17:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T17:03:00+00',
    '2025-03-12T17:05:19+00',
    75,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-14T15:00:00+00',
    '2025-03-14T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-14T15:01:00+00',
    8,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-14T15:03:00+00',
    '2025-03-14T15:04:04+00',
    141,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-17T16:00:00+00',
    '2025-03-17T16:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-17T16:01:00+00',
    7,
    false,
    'making progress',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T16:00:00+00',
    '2025-03-19T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-19T16:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-21T17:00:00+00',
    '2025-03-21T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-21T17:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-21T17:03:00+00',
    '2025-03-21T17:04:31+00',
    180,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-24T18:00:00+00',
    '2025-03-24T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-24T18:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T15:00:00+00',
    '2025-03-26T15:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-26T15:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-28T17:00:00+00',
    '2025-03-28T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-28T17:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '584bad64-a040-4eed-8a99-e5eb81cb2dd9' ORDER BY created_at DESC LIMIT 1),
    '584bad64-a040-4eed-8a99-e5eb81cb2dd9',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-28T17:03:00+00',
    '2025-03-28T17:04:49+00',
    168,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Ava Taylor: 36 sessions (5x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T18:00:00+00',
    '2025-01-06T18:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-06T18:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

-- Session 2/36: Jan 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-07T18:00:00+00',
    '2025-01-07T18:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-07T18:01:00+00',
    7,
    false,
    'making progress',
    now()
);

-- Session 3/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T18:00:00+00',
    '2025-01-08T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T18:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T18:03:00+00',
    '2025-01-08T18:04:03+00',
    100,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 09
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-09T16:00:00+00',
    '2025-01-09T16:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-09T16:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

-- Session 5/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T17:00:00+00',
    '2025-01-10T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-10T17:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T17:03:00+00',
    '2025-01-10T17:04:49+00',
    68,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T15:00:00+00',
    '2025-01-13T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-13T15:01:00+00',
    5,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T15:03:00+00',
    '2025-01-13T15:04:00+00',
    93,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/36: Jan 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-14T18:00:00+00',
    '2025-01-14T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-14T18:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-14T18:03:00+00',
    '2025-01-14T18:05:04+00',
    100,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T17:00:00+00',
    '2025-01-15T17:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-15T17:01:00+00',
    9,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T17:03:00+00',
    '2025-01-15T17:05:09+00',
    169,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 16
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-16T16:00:00+00',
    '2025-01-16T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-16T16:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

-- Session 10/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-17T17:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 11/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T17:00:00+00',
    '2025-01-20T17:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-20T17:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 12/36: Jan 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-21T16:00:00+00',
    '2025-01-21T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-21T16:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-21T16:03:00+00',
    '2025-01-21T16:04:53+00',
    82,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 13/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-22T18:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T18:03:00+00',
    '2025-01-22T18:05:28+00',
    149,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 14/36: Jan 23
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-23T15:00:00+00',
    '2025-01-23T15:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-23T15:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

-- Session 15/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T16:00:00+00',
    '2025-01-24T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-24T16:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

-- Session 16/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-27T15:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 17/36: Jan 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-28T15:00:00+00',
    '2025-01-28T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-28T15:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-28T15:03:00+00',
    '2025-01-28T15:04:27+00',
    139,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-29T18:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T18:03:00+00',
    '2025-01-29T18:05:40+00',
    65,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Jan 30
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-30T17:00:00+00',
    '2025-01-30T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-30T17:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

-- Session 20/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T17:00:00+00',
    '2025-01-31T17:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-01-31T17:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

-- Session 21/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-03T16:00:00+00',
    '2025-02-03T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-03T16:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Session 22/36: Feb 04
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-04T16:00:00+00',
    '2025-02-04T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-04T16:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-04T16:03:00+00',
    '2025-02-04T16:05:49+00',
    145,
    'box_breathing',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 23/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T16:00:00+00',
    '2025-02-05T16:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-05T16:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 24/36: Feb 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-06T15:00:00+00',
    '2025-02-06T15:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-06T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Session 25/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T16:00:00+00',
    '2025-02-07T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-07T16:01:00+00',
    11,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T16:03:00+00',
    '2025-02-07T16:04:37+00',
    118,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-10T17:00:00+00',
    '2025-02-10T17:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-10T17:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 27/36: Feb 11
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-11T16:00:00+00',
    '2025-02-11T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-11T16:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

-- Session 28/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-12T16:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T16:03:00+00',
    '2025-02-12T16:05:53+00',
    172,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Feb 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-13T17:00:00+00',
    '2025-02-13T17:13:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-13T17:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 30/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-14T18:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T18:03:00+00',
    '2025-02-14T18:05:06+00',
    110,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T17:00:00+00',
    '2025-02-17T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-17T17:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T17:03:00+00',
    '2025-02-17T17:05:48+00',
    94,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Feb 18
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-18T18:00:00+00',
    '2025-02-18T18:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-18T18:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

-- Session 33/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T18:00:00+00',
    '2025-02-19T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T18:01:00+00',
    18,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T18:03:00+00',
    '2025-02-19T18:05:21+00',
    155,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Feb 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-20T18:00:00+00',
    '2025-02-20T18:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-20T18:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-20T18:03:00+00',
    '2025-02-20T18:04:52+00',
    71,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T15:00:00+00',
    '2025-02-21T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-21T15:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 36/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-24T18:00:00+00',
    '2025-02-24T18:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '9620e76e-2de6-4580-9b05-466f854478f4' ORDER BY created_at DESC LIMIT 1),
    '9620e76e-2de6-4580-9b05-466f854478f4',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-24T18:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Noah Martin: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T15:00:00+00',
    '2025-01-08T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T15:01:00+00',
    11,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T15:03:00+00',
    '2025-01-08T15:04:01+00',
    163,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-15T18:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T18:03:00+00',
    '2025-01-15T18:04:03+00',
    82,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-22T18:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T17:00:00+00',
    '2025-01-29T17:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-29T17:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T17:03:00+00',
    '2025-01-29T17:05:21+00',
    88,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:00:00+00',
    '2025-02-05T18:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-05T18:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:03:00+00',
    '2025-02-05T18:04:49+00',
    136,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-12T16:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T17:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T18:00:00+00',
    '2025-02-26T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-26T18:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T15:00:00+00',
    '2025-03-05T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-05T15:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T16:00:00+00',
    '2025-03-12T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-12T16:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T16:03:00+00',
    '2025-03-12T16:05:58+00',
    124,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T17:00:00+00',
    '2025-03-19T17:25:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-19T17:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T18:00:00+00',
    '2025-03-26T18:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7c2f657d-1607-4045-9e2f-6ebf3ec51d05' ORDER BY created_at DESC LIMIT 1),
    '7c2f657d-1607-4045-9e2f-6ebf3ec51d05',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-26T18:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Isla Roberts: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:03:00+00',
    '2025-01-08T16:05:14+00',
    161,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T17:00:00+00',
    '2025-01-15T17:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-15T17:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T17:03:00+00',
    '2025-01-15T17:04:27+00',
    149,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T17:00:00+00',
    '2025-01-22T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-22T17:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T17:00:00+00',
    '2025-01-29T17:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-29T17:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-05T15:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T15:03:00+00',
    '2025-02-05T15:06:00+00',
    125,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-12T17:01:00+00',
    16,
    false,
    'making progress',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T17:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T17:03:00+00',
    '2025-02-19T17:05:51+00',
    77,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-26T16:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T16:03:00+00',
    '2025-02-26T16:04:50+00',
    131,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T16:00:00+00',
    '2025-03-05T16:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-05T16:01:00+00',
    11,
    false,
    'making progress',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T16:00:00+00',
    '2025-03-12T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-12T16:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T16:03:00+00',
    '2025-03-12T16:05:57+00',
    81,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T18:00:00+00',
    '2025-03-19T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-19T18:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T18:03:00+00',
    '2025-03-19T18:04:49+00',
    113,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T16:00:00+00',
    '2025-03-26T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54' ORDER BY created_at DESC LIMIT 1),
    '23d3a8d1-7ab6-4a5f-b9be-377ab6370d54',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-26T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

-- Ravi Singh: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T15:00:00+00',
    '2025-01-06T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-06T15:01:00+00',
    10,
    false,
    'making progress',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T16:00:00+00',
    '2025-01-10T16:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-10T16:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-13T18:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-15T16:01:00+00',
    7,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T16:03:00+00',
    '2025-01-15T16:04:13+00',
    90,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T18:00:00+00',
    '2025-01-17T18:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-17T18:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T15:00:00+00',
    '2025-01-20T15:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-20T15:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T16:00:00+00',
    '2025-01-22T16:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-22T16:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T16:03:00+00',
    '2025-01-22T16:06:00+00',
    100,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-24T15:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T15:03:00+00',
    '2025-01-24T15:04:00+00',
    112,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-27T15:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T15:03:00+00',
    '2025-01-27T15:05:45+00',
    98,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-29T18:01:00+00',
    7,
    false,
    'making progress',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T15:00:00+00',
    '2025-01-31T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-31T15:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-03T18:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-05T17:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T17:03:00+00',
    '2025-02-05T17:05:49+00',
    146,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T18:00:00+00',
    '2025-02-07T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-07T18:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T18:03:00+00',
    '2025-02-07T18:04:03+00',
    111,
    'box_breathing',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-10T15:00:00+00',
    '2025-02-10T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-10T15:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-12T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-14T18:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T18:03:00+00',
    '2025-02-14T18:04:43+00',
    136,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T17:00:00+00',
    '2025-02-17T17:12:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-17T17:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T16:00:00+00',
    '2025-02-19T16:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-19T16:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T16:00:00+00',
    '2025-02-21T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-21T16:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T16:03:00+00',
    '2025-02-21T16:05:14+00',
    83,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-24T18:00:00+00',
    '2025-02-24T18:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-24T18:01:00+00',
    5,
    false,
    'making progress',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-26T16:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T17:00:00+00',
    '2025-02-28T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-02-28T17:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T17:03:00+00',
    '2025-02-28T17:05:06+00',
    74,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-03T15:00:00+00',
    '2025-03-03T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-03T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-03T15:03:00+00',
    '2025-03-03T15:05:20+00',
    75,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T15:00:00+00',
    '2025-03-05T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-05T15:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-07T15:00:00+00',
    '2025-03-07T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-07T15:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-07T15:03:00+00',
    '2025-03-07T15:04:21+00',
    71,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-10T16:00:00+00',
    '2025-03-10T16:22:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-10T16:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T15:00:00+00',
    '2025-03-12T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-12T15:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T15:03:00+00',
    '2025-03-12T15:04:02+00',
    151,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-14T17:00:00+00',
    '2025-03-14T17:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-14T17:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-14T17:03:00+00',
    '2025-03-14T17:04:23+00',
    74,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-17T16:00:00+00',
    '2025-03-17T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-17T16:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-17T16:03:00+00',
    '2025-03-17T16:04:14+00',
    165,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T16:00:00+00',
    '2025-03-19T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-19T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-21T16:00:00+00',
    '2025-03-21T16:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-21T16:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-24T15:00:00+00',
    '2025-03-24T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-24T15:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T16:00:00+00',
    '2025-03-26T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-26T16:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T16:03:00+00',
    '2025-03-26T16:05:08+00',
    156,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-28T18:00:00+00',
    '2025-03-28T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '3f9cb391-c1cd-4473-9adb-2af0d05cd514' ORDER BY created_at DESC LIMIT 1),
    '3f9cb391-c1cd-4473-9adb-2af0d05cd514',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-28T18:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Evie Scott: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T18:00:00+00',
    '2025-01-06T18:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-06T18:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-06T18:03:00+00',
    '2025-01-06T18:05:17+00',
    121,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T15:00:00+00',
    '2025-01-10T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-10T15:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-10T15:03:00+00',
    '2025-01-10T15:05:18+00',
    91,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T16:00:00+00',
    '2025-01-13T16:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_sad',
    1,
    '2025-01-13T16:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-13T16:03:00+00',
    '2025-01-13T16:04:56+00',
    168,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-15T16:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T16:03:00+00',
    '2025-01-15T16:04:09+00',
    82,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-17T17:01:00+00',
    11,
    false,
    'making progress',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-20T15:00:00+00',
    '2025-01-20T15:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-20T15:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T17:00:00+00',
    '2025-01-22T17:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-22T17:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T17:03:00+00',
    '2025-01-22T17:05:42+00',
    107,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T17:00:00+00',
    '2025-01-24T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-24T17:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-24T17:03:00+00',
    '2025-01-24T17:04:23+00',
    150,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-27T16:00:00+00',
    '2025-01-27T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-27T16:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T15:00:00+00',
    '2025-01-29T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-29T15:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T15:03:00+00',
    '2025-01-29T15:04:37+00',
    114,
    'box_breathing',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T18:00:00+00',
    '2025-01-31T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-31T18:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-31T18:03:00+00',
    '2025-01-31T18:05:30+00',
    157,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-03T15:00:00+00',
    '2025-02-03T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-03T15:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:00:00+00',
    '2025-02-05T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-02-05T18:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T18:03:00+00',
    '2025-02-05T18:05:53+00',
    116,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T15:00:00+00',
    '2025-02-07T15:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-07T15:01:00+00',
    14,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-07T15:03:00+00',
    '2025-02-07T15:04:10+00',
    88,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-10T16:00:00+00',
    '2025-02-10T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-10T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-12T16:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-14T15:00:00+00',
    '2025-02-14T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-14T15:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-17T15:00:00+00',
    '2025-02-17T15:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-17T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T18:00:00+00',
    '2025-02-19T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T18:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T18:03:00+00',
    '2025-02-19T18:05:08+00',
    171,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-21T16:00:00+00',
    '2025-02-21T16:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-21T16:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-24T15:00:00+00',
    '2025-02-24T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-24T15:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T17:00:00+00',
    '2025-02-26T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-26T17:01:00+00',
    9,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T17:03:00+00',
    '2025-02-26T17:05:06+00',
    174,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T15:00:00+00',
    '2025-02-28T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-28T15:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-28T15:03:00+00',
    '2025-02-28T15:05:07+00',
    95,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-03T16:00:00+00',
    '2025-03-03T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-03-03T16:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T16:00:00+00',
    '2025-03-05T16:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-05T16:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-07T16:00:00+00',
    '2025-03-07T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-07T16:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-10T17:00:00+00',
    '2025-03-10T17:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-03-10T17:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T15:00:00+00',
    '2025-03-12T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-12T15:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-14T16:00:00+00',
    '2025-03-14T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-14T16:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-14T16:03:00+00',
    '2025-03-14T16:04:36+00',
    106,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-17T15:00:00+00',
    '2025-03-17T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-17T15:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T17:00:00+00',
    '2025-03-19T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-19T17:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T17:03:00+00',
    '2025-03-19T17:05:25+00',
    107,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-21T18:00:00+00',
    '2025-03-21T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-21T18:01:00+00',
    5,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-21T18:03:00+00',
    '2025-03-21T18:04:17+00',
    177,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-24T15:00:00+00',
    '2025-03-24T15:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-24T15:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T18:00:00+00',
    '2025-03-26T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-26T18:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-28T16:00:00+00',
    '2025-03-28T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-28T16:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f50e666e-538f-4109-baa1-d3cc969ab870' ORDER BY created_at DESC LIMIT 1),
    'f50e666e-538f-4109-baa1-d3cc969ab870',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-28T16:03:00+00',
    '2025-03-28T16:05:42+00',
    123,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Felix Baker: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:22:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-15T15:00:00+00',
    '2025-01-15T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'sad',
    2,
    '2025-01-15T15:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-22T18:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T15:00:00+00',
    '2025-01-29T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-01-29T15:01:00+00',
    15,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-01-29T15:03:00+00',
    '2025-01-29T15:04:55+00',
    138,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-05T17:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-12T15:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-12T15:03:00+00',
    '2025-02-12T15:04:29+00',
    78,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-02-19T17:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T15:00:00+00',
    '2025-02-26T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-02-26T15:01:00+00',
    20,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-02-26T15:03:00+00',
    '2025-02-26T15:05:37+00',
    61,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-05T17:00:00+00',
    '2025-03-05T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'ok',
    3,
    '2025-03-05T17:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-12T15:00:00+00',
    '2025-03-12T15:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-12T15:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-19T18:00:00+00',
    '2025-03-19T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'very_happy',
    5,
    '2025-03-19T18:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    '2025-03-26T18:00:00+00',
    '2025-03-26T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '0804f356-4551-4b5d-83a2-c3c787bdac02' ORDER BY created_at DESC LIMIT 1),
    '0804f356-4551-4b5d-83a2-c3c787bdac02',
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
    'happy',
    4,
    '2025-03-26T18:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

-- Sebastian Clark: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T15:00:00+00',
    '2025-01-06T15:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-06T15:01:00+00',
    16,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    5,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T17:00:00+00',
    '2025-01-10T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-10T17:01:00+00',
    18,
    false,
    'good sensory day',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-13T18:01:00+00',
    15,
    false,
    'felt understood today',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T17:00:00+00',
    '2025-01-15T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-15T17:01:00+00',
    13,
    false,
    'felt understood today',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T16:00:00+00',
    '2025-01-17T16:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-17T16:01:00+00',
    5,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T15:00:00+00',
    '2025-01-20T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-20T15:01:00+00',
    16,
    false,
    'good sensory day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T15:03:00+00',
    '2025-01-20T15:04:48+00',
    109,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-22T18:01:00+00',
    13,
    false,
    'felt understood today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T18:03:00+00',
    '2025-01-22T18:05:43+00',
    107,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T17:00:00+00',
    '2025-01-24T17:12:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-24T17:01:00+00',
    19,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T18:00:00+00',
    '2025-01-27T18:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-27T18:01:00+00',
    7,
    false,
    'enjoyed quiet time',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T18:03:00+00',
    '2025-01-27T18:05:12+00',
    171,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-29T18:01:00+00',
    8,
    false,
    'good sensory day',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T16:00:00+00',
    '2025-01-31T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-31T16:01:00+00',
    6,
    false,
    'felt understood today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T16:03:00+00',
    '2025-01-31T16:05:15+00',
    148,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T15:00:00+00',
    '2025-02-03T15:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-03T15:01:00+00',
    19,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-02-05T17:01:00+00',
    17,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T17:00:00+00',
    '2025-02-07T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-07T17:01:00+00',
    16,
    false,
    'good sensory day',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T18:00:00+00',
    '2025-02-10T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-10T18:01:00+00',
    10,
    false,
    'good sensory day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T18:03:00+00',
    '2025-02-10T18:04:14+00',
    102,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-12T16:01:00+00',
    6,
    false,
    'good sensory day',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T16:00:00+00',
    '2025-02-14T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-14T16:01:00+00',
    16,
    false,
    'felt understood today',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T16:00:00+00',
    '2025-02-17T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-17T16:01:00+00',
    20,
    false,
    'good sensory day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T16:03:00+00',
    '2025-02-17T16:05:10+00',
    63,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-19T15:01:00+00',
    19,
    false,
    'felt understood today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:04:47+00',
    126,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T15:00:00+00',
    '2025-02-21T15:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-21T15:01:00+00',
    9,
    false,
    'enjoyed quiet time',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T15:03:00+00',
    '2025-02-21T15:05:16+00',
    61,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T16:00:00+00',
    '2025-02-24T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-24T16:01:00+00',
    7,
    false,
    'good sensory day',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T15:00:00+00',
    '2025-02-26T15:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-26T15:01:00+00',
    14,
    false,
    'good sensory day',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-28T16:00:00+00',
    '2025-02-28T16:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-28T16:01:00+00',
    6,
    false,
    'good sensory day',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-03T17:00:00+00',
    '2025-03-03T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-03T17:01:00+00',
    7,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-05T18:01:00+00',
    16,
    false,
    'enjoyed quiet time',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:03:00+00',
    '2025-03-05T18:05:17+00',
    72,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-07T18:00:00+00',
    '2025-03-07T18:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-07T18:01:00+00',
    19,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-10T16:00:00+00',
    '2025-03-10T16:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-10T16:01:00+00',
    17,
    false,
    'enjoyed quiet time',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-10T16:03:00+00',
    '2025-03-10T16:05:49+00',
    85,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T16:00:00+00',
    '2025-03-12T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-12T16:01:00+00',
    11,
    false,
    'felt understood today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T16:03:00+00',
    '2025-03-12T16:04:40+00',
    142,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-14T18:00:00+00',
    '2025-03-14T18:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-14T18:01:00+00',
    11,
    false,
    'enjoyed quiet time',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-17T18:00:00+00',
    '2025-03-17T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-17T18:01:00+00',
    9,
    false,
    'good sensory day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-17T18:03:00+00',
    '2025-03-17T18:05:19+00',
    111,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T16:00:00+00',
    '2025-03-19T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-19T16:01:00+00',
    7,
    false,
    'felt understood today',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-21T15:00:00+00',
    '2025-03-21T15:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-21T15:01:00+00',
    15,
    false,
    'good sensory day',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-21T15:03:00+00',
    '2025-03-21T15:05:19+00',
    174,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-24T18:00:00+00',
    '2025-03-24T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-24T18:01:00+00',
    15,
    false,
    'enjoyed quiet time',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-24T18:03:00+00',
    '2025-03-24T18:05:07+00',
    159,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T15:00:00+00',
    '2025-03-26T15:12:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-26T15:01:00+00',
    9,
    false,
    'felt understood today',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-28T16:00:00+00',
    '2025-03-28T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '20a239a5-2730-49b2-b9f4-2af18d737e4b' ORDER BY created_at DESC LIMIT 1),
    '20a239a5-2730-49b2-b9f4-2af18d737e4b',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-28T16:01:00+00',
    15,
    false,
    'felt understood today',
    now()
);

-- Lily Evans: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T17:00:00+00',
    '2025-01-08T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-08T17:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T17:03:00+00',
    '2025-01-08T17:04:15+00',
    167,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-15T18:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T18:03:00+00',
    '2025-01-15T18:04:36+00',
    175,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-22T18:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-29T18:01:00+00',
    14,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:03:00+00',
    '2025-01-29T18:05:37+00',
    108,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-05T15:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T15:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T15:03:00+00',
    '2025-02-12T15:05:15+00',
    62,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-19T15:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:04:28+00',
    68,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T18:00:00+00',
    '2025-02-26T18:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-26T18:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-03-05T18:01:00+00',
    16,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:03:00+00',
    '2025-03-05T18:04:06+00',
    140,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T18:00:00+00',
    '2025-03-12T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-12T18:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T18:03:00+00',
    '2025-03-12T18:04:45+00',
    161,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T18:00:00+00',
    '2025-03-19T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-19T18:01:00+00',
    14,
    false,
    'making progress',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T18:00:00+00',
    '2025-03-26T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c02ac4c9-38e5-4e66-978c-97de2368efc2' ORDER BY created_at DESC LIMIT 1),
    'c02ac4c9-38e5-4e66-978c-97de2368efc2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-26T18:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Charlie White: 36 sessions (5x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T16:00:00+00',
    '2025-01-06T16:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-06T16:01:00+00',
    7,
    false,
    'felt heard today',
    now()
);

-- Session 2/36: Jan 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-07T17:00:00+00',
    '2025-01-07T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-07T17:01:00+00',
    20,
    false,
    'made progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-07T17:03:00+00',
    '2025-01-07T17:04:21+00',
    72,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T18:00:00+00',
    '2025-01-08T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-08T18:01:00+00',
    13,
    false,
    'made progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T18:03:00+00',
    '2025-01-08T18:04:57+00',
    64,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 09
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-09T17:00:00+00',
    '2025-01-09T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-09T17:01:00+00',
    8,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-09T17:03:00+00',
    '2025-01-09T17:04:42+00',
    60,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T16:00:00+00',
    '2025-01-10T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-10T16:01:00+00',
    16,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T16:03:00+00',
    '2025-01-10T16:05:25+00',
    117,
    'basic_inhale_exhale',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-13T18:01:00+00',
    9,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T18:03:00+00',
    '2025-01-13T18:05:05+00',
    151,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/36: Jan 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-14T17:00:00+00',
    '2025-01-14T17:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-14T17:01:00+00',
    13,
    false,
    'made progress',
    now()
);

-- Session 8/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-15T16:01:00+00',
    10,
    false,
    'expressed myself through drawing',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T16:03:00+00',
    '2025-01-15T16:05:29+00',
    83,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 16
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-16T17:00:00+00',
    '2025-01-16T17:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-16T17:01:00+00',
    10,
    false,
    'expressed myself through drawing',
    now()
);

-- Session 10/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T18:00:00+00',
    '2025-01-17T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-17T18:01:00+00',
    17,
    false,
    'made progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T18:03:00+00',
    '2025-01-17T18:04:32+00',
    60,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T18:00:00+00',
    '2025-01-20T18:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-20T18:01:00+00',
    12,
    false,
    'felt heard today',
    now()
);

-- Session 12/36: Jan 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-21T15:00:00+00',
    '2025-01-21T15:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-21T15:01:00+00',
    15,
    false,
    'felt heard today',
    now()
);

-- Session 13/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T17:00:00+00',
    '2025-01-22T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-22T17:01:00+00',
    10,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T17:03:00+00',
    '2025-01-22T17:04:14+00',
    171,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 14/36: Jan 23
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-23T15:00:00+00',
    '2025-01-23T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-23T15:01:00+00',
    14,
    false,
    'expressed myself through drawing',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-23T15:03:00+00',
    '2025-01-23T15:05:01+00',
    147,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-24T15:01:00+00',
    12,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T15:03:00+00',
    '2025-01-24T15:05:10+00',
    144,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T17:00:00+00',
    '2025-01-27T17:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-27T17:01:00+00',
    15,
    false,
    'expressed myself through drawing',
    now()
);

-- Session 17/36: Jan 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-28T16:00:00+00',
    '2025-01-28T16:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-28T16:01:00+00',
    5,
    false,
    'felt heard today',
    now()
);

-- Session 18/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-29T16:01:00+00',
    9,
    false,
    'made progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T16:03:00+00',
    '2025-01-29T16:05:55+00',
    81,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Jan 30
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-30T16:00:00+00',
    '2025-01-30T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-30T16:01:00+00',
    20,
    false,
    'expressed myself through drawing',
    now()
);

-- Session 20/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T18:00:00+00',
    '2025-01-31T18:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-31T18:01:00+00',
    10,
    false,
    'expressed myself through drawing',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T18:03:00+00',
    '2025-01-31T18:04:52+00',
    130,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 21/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T16:00:00+00',
    '2025-02-03T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-03T16:01:00+00',
    10,
    false,
    'made progress',
    now()
);

-- Session 22/36: Feb 04
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-04T18:00:00+00',
    '2025-02-04T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-04T18:01:00+00',
    9,
    false,
    'made progress',
    now()
);

-- Session 23/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:12:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-05T17:01:00+00',
    18,
    false,
    'made progress',
    now()
);

-- Session 24/36: Feb 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-06T17:00:00+00',
    '2025-02-06T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-06T17:01:00+00',
    17,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-06T17:03:00+00',
    '2025-02-06T17:04:54+00',
    131,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 25/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T16:00:00+00',
    '2025-02-07T16:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-07T16:01:00+00',
    19,
    false,
    'made progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T16:03:00+00',
    '2025-02-07T16:04:58+00',
    142,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T15:00:00+00',
    '2025-02-10T15:11:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-10T15:01:00+00',
    6,
    false,
    'made progress',
    now()
);

-- Session 27/36: Feb 11
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-11T16:00:00+00',
    '2025-02-11T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-11T16:01:00+00',
    15,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-11T16:03:00+00',
    '2025-02-11T16:04:26+00',
    113,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-12T17:01:00+00',
    9,
    false,
    'expressed myself through drawing',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T17:03:00+00',
    '2025-02-12T17:05:38+00',
    111,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Feb 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-13T16:00:00+00',
    '2025-02-13T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-13T16:01:00+00',
    6,
    false,
    'expressed myself through drawing',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-13T16:03:00+00',
    '2025-02-13T16:05:34+00',
    171,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T16:00:00+00',
    '2025-02-14T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-14T16:01:00+00',
    10,
    false,
    'felt heard today',
    now()
);

-- Session 31/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T15:00:00+00',
    '2025-02-17T15:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-17T15:01:00+00',
    17,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T15:03:00+00',
    '2025-02-17T15:04:08+00',
    74,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Feb 18
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-18T15:00:00+00',
    '2025-02-18T15:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-18T15:01:00+00',
    17,
    false,
    'expressed myself through drawing',
    now()
);

-- Session 33/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-19T17:01:00+00',
    7,
    false,
    'felt heard today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T17:03:00+00',
    '2025-02-19T17:04:03+00',
    139,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Feb 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-20T17:00:00+00',
    '2025-02-20T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-20T17:01:00+00',
    8,
    false,
    'expressed myself through drawing',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-20T17:03:00+00',
    '2025-02-20T17:04:33+00',
    63,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 35/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T17:00:00+00',
    '2025-02-21T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-21T17:01:00+00',
    13,
    false,
    'felt heard today',
    now()
);

-- Session 36/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T18:00:00+00',
    '2025-02-24T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-24T18:01:00+00',
    6,
    false,
    'made progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'd6161b21-90ce-4c83-8142-98cabaddb655' ORDER BY created_at DESC LIMIT 1),
    'd6161b21-90ce-4c83-8142-98cabaddb655',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T18:03:00+00',
    '2025-02-24T18:04:35+00',
    78,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Maya Green: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T17:00:00+00',
    '2025-01-06T17:11:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-06T17:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T17:00:00+00',
    '2025-01-08T17:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-08T17:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T15:00:00+00',
    '2025-01-10T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-10T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T15:03:00+00',
    '2025-01-10T15:05:33+00',
    131,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T15:00:00+00',
    '2025-01-13T15:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-13T15:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T15:03:00+00',
    '2025-01-13T15:04:02+00',
    134,
    'box_breathing',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T17:00:00+00',
    '2025-01-15T17:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-15T17:01:00+00',
    17,
    false,
    'making progress',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T15:00:00+00',
    '2025-01-17T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-17T15:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T15:03:00+00',
    '2025-01-17T15:04:49+00',
    136,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T15:00:00+00',
    '2025-01-20T15:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-20T15:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T16:00:00+00',
    '2025-01-22T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-22T16:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T16:03:00+00',
    '2025-01-22T16:04:48+00',
    88,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T18:00:00+00',
    '2025-01-24T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-24T18:01:00+00',
    7,
    false,
    'making progress',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-27T15:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-29T18:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:03:00+00',
    '2025-01-29T18:04:51+00',
    92,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T17:00:00+00',
    '2025-01-31T17:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-31T17:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-03T18:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T18:03:00+00',
    '2025-02-03T18:04:26+00',
    122,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T17:00:00+00',
    '2025-02-05T17:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-02-05T17:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T15:00:00+00',
    '2025-02-07T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-07T15:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T15:03:00+00',
    '2025-02-07T15:05:50+00',
    179,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T16:00:00+00',
    '2025-02-10T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-10T16:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T17:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T17:03:00+00',
    '2025-02-12T17:05:49+00',
    158,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-14T18:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T18:03:00+00',
    '2025-02-14T18:04:07+00',
    88,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T18:00:00+00',
    '2025-02-17T18:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-17T18:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T18:03:00+00',
    '2025-02-17T18:05:25+00',
    64,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-19T15:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:05:08+00',
    84,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T16:00:00+00',
    '2025-02-21T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-21T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T16:03:00+00',
    '2025-02-21T16:04:52+00',
    71,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T15:00:00+00',
    '2025-02-24T15:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-24T15:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:21:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-26T16:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-28T15:00:00+00',
    '2025-02-28T15:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-28T15:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-03T17:00:00+00',
    '2025-03-03T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-03T17:01:00+00',
    20,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-03T17:03:00+00',
    '2025-03-03T17:04:07+00',
    147,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-03-05T18:01:00+00',
    11,
    false,
    'feeling okay today',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-07T15:00:00+00',
    '2025-03-07T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-07T15:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-07T15:03:00+00',
    '2025-03-07T15:04:51+00',
    89,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-10T17:00:00+00',
    '2025-03-10T17:17:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-10T17:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T17:00:00+00',
    '2025-03-12T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-12T17:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T17:03:00+00',
    '2025-03-12T17:04:26+00',
    92,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-14T16:00:00+00',
    '2025-03-14T16:25:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-14T16:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-17T16:00:00+00',
    '2025-03-17T16:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-17T16:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-17T16:03:00+00',
    '2025-03-17T16:05:32+00',
    94,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T16:00:00+00',
    '2025-03-19T16:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-19T16:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T16:03:00+00',
    '2025-03-19T16:05:11+00',
    152,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-21T17:00:00+00',
    '2025-03-21T17:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-21T17:01:00+00',
    17,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-21T17:03:00+00',
    '2025-03-21T17:05:09+00',
    97,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-24T16:00:00+00',
    '2025-03-24T16:20:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-24T16:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T16:00:00+00',
    '2025-03-26T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-26T16:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T16:03:00+00',
    '2025-03-26T16:04:04+00',
    155,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-28T18:00:00+00',
    '2025-03-28T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-28T18:01:00+00',
    8,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'c26fa169-9aa6-458b-94d0-0c13002e0ea6' ORDER BY created_at DESC LIMIT 1),
    'c26fa169-9aa6-458b-94d0-0c13002e0ea6',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-28T18:03:00+00',
    '2025-03-28T18:05:29+00',
    87,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Oscar Harris: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T16:00:00+00',
    '2025-01-06T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-06T16:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T16:03:00+00',
    '2025-01-06T16:04:32+00',
    68,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T15:00:00+00',
    '2025-01-08T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-08T15:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T17:00:00+00',
    '2025-01-10T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-10T17:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T17:03:00+00',
    '2025-01-10T17:04:53+00',
    103,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T15:00:00+00',
    '2025-01-13T15:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-13T15:01:00+00',
    15,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T15:03:00+00',
    '2025-01-13T15:04:00+00',
    173,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-15T16:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T16:03:00+00',
    '2025-01-15T16:04:05+00',
    159,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T18:00:00+00',
    '2025-01-17T18:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-17T18:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T18:03:00+00',
    '2025-01-17T18:04:13+00',
    166,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T17:00:00+00',
    '2025-01-20T17:12:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-20T17:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T16:00:00+00',
    '2025-01-22T16:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-22T16:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T16:03:00+00',
    '2025-01-22T16:04:21+00',
    103,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-24T15:01:00+00',
    5,
    false,
    'making progress',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T15:00:00+00',
    '2025-01-27T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-27T15:01:00+00',
    16,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T15:03:00+00',
    '2025-01-27T15:04:28+00',
    145,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:15:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-29T16:01:00+00',
    18,
    false,
    'making progress',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T17:00:00+00',
    '2025-01-31T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-31T17:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T16:00:00+00',
    '2025-02-03T16:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-03T16:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T16:00:00+00',
    '2025-02-05T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-05T16:01:00+00',
    19,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T16:03:00+00',
    '2025-02-05T16:04:40+00',
    91,
    'basic_inhale_exhale',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T16:00:00+00',
    '2025-02-07T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-07T16:01:00+00',
    8,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T16:03:00+00',
    '2025-02-07T16:04:10+00',
    79,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T16:00:00+00',
    '2025-02-10T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-10T16:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T15:01:00+00',
    11,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T15:03:00+00',
    '2025-02-12T15:04:51+00',
    126,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-14T18:01:00+00',
    17,
    false,
    'making progress',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T17:00:00+00',
    '2025-02-17T17:16:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-17T17:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T18:00:00+00',
    '2025-02-19T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-19T18:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T16:00:00+00',
    '2025-02-21T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-21T16:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T18:00:00+00',
    '2025-02-24T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-24T18:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T18:03:00+00',
    '2025-02-24T18:05:12+00',
    88,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-26T16:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T16:03:00+00',
    '2025-02-26T16:04:50+00',
    76,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-28T18:00:00+00',
    '2025-02-28T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-28T18:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-03T16:00:00+00',
    '2025-03-03T16:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-03T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-03T16:03:00+00',
    '2025-03-03T16:04:15+00',
    106,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T17:00:00+00',
    '2025-03-05T17:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-05T17:01:00+00',
    10,
    false,
    'making progress',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-07T18:00:00+00',
    '2025-03-07T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-07T18:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-07T18:03:00+00',
    '2025-03-07T18:04:36+00',
    166,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-10T18:00:00+00',
    '2025-03-10T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-03-10T18:01:00+00',
    7,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-10T18:03:00+00',
    '2025-03-10T18:05:07+00',
    73,
    'basic_inhale_exhale',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T18:00:00+00',
    '2025-03-12T18:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-12T18:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T18:03:00+00',
    '2025-03-12T18:05:22+00',
    85,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-14T17:00:00+00',
    '2025-03-14T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-14T17:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-14T17:03:00+00',
    '2025-03-14T17:04:50+00',
    158,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-17T18:00:00+00',
    '2025-03-17T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-17T18:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T17:00:00+00',
    '2025-03-19T17:25:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-19T17:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-21T17:00:00+00',
    '2025-03-21T17:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-21T17:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-21T17:03:00+00',
    '2025-03-21T17:04:13+00',
    121,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-24T17:00:00+00',
    '2025-03-24T17:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-24T17:01:00+00',
    5,
    false,
    'making progress',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T17:00:00+00',
    '2025-03-26T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-26T17:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T17:03:00+00',
    '2025-03-26T17:05:46+00',
    149,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-28T16:00:00+00',
    '2025-03-28T16:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-28T16:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '2b775f59-359e-4e2d-a30d-fb5d263997c0' ORDER BY created_at DESC LIMIT 1),
    '2b775f59-359e-4e2d-a30d-fb5d263997c0',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-28T16:03:00+00',
    '2025-03-28T16:05:29+00',
    106,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Ruby Lewis: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T17:00:00+00',
    '2025-01-08T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-08T17:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:25:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-15T18:01:00+00',
    8,
    false,
    'making progress',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T15:00:00+00',
    '2025-01-22T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-22T15:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T15:03:00+00',
    '2025-01-22T15:04:38+00',
    104,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-29T18:01:00+00',
    19,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:03:00+00',
    '2025-01-29T18:05:53+00',
    128,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-05T15:01:00+00',
    18,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T15:03:00+00',
    '2025-02-05T15:05:44+00',
    122,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T15:01:00+00',
    17,
    false,
    'making progress',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T18:00:00+00',
    '2025-02-19T18:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-19T18:01:00+00',
    13,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T18:03:00+00',
    '2025-02-19T18:04:01+00',
    64,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T18:00:00+00',
    '2025-02-26T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-26T18:01:00+00',
    8,
    false,
    'making progress',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-05T18:01:00+00',
    14,
    false,
    'making progress',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T18:00:00+00',
    '2025-03-12T18:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-12T18:01:00+00',
    14,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T18:03:00+00',
    '2025-03-12T18:05:21+00',
    119,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T16:00:00+00',
    '2025-03-19T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-19T16:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T16:03:00+00',
    '2025-03-19T16:04:58+00',
    176,
    'box_breathing',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T18:00:00+00',
    '2025-03-26T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = 'f6f1730c-6bc8-4f39-ba47-71e47f1588dc' ORDER BY created_at DESC LIMIT 1),
    'f6f1730c-6bc8-4f39-ba47-71e47f1588dc',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-26T18:01:00+00',
    6,
    false,
    'making progress',
    now()
);

-- Finn Walker: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T18:00:00+00',
    '2025-01-08T18:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-08T18:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T18:03:00+00',
    '2025-01-08T18:04:53+00',
    118,
    'guided_4_7_8',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-15T18:01:00+00',
    20,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T18:03:00+00',
    '2025-01-15T18:04:49+00',
    141,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-22T18:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T16:00:00+00',
    '2025-01-29T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-29T16:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T16:03:00+00',
    '2025-01-29T16:05:55+00',
    60,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-05T15:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T17:00:00+00',
    '2025-02-12T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T17:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-19T15:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:04:01+00',
    165,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T15:00:00+00',
    '2025-02-26T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-26T15:01:00+00',
    11,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T15:03:00+00',
    '2025-02-26T15:04:00+00',
    109,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-05T18:01:00+00',
    17,
    false,
    'feeling okay today',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T16:00:00+00',
    '2025-03-12T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-12T16:01:00+00',
    11,
    false,
    'making progress',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T16:00:00+00',
    '2025-03-19T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-19T16:01:00+00',
    11,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T16:03:00+00',
    '2025-03-19T16:05:32+00',
    66,
    'guided_4_7_8',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T17:00:00+00',
    '2025-03-26T17:17:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '6d80de20-8ce5-4885-87a5-0af2a3c087a5' ORDER BY created_at DESC LIMIT 1),
    '6d80de20-8ce5-4885-87a5-0af2a3c087a5',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-26T17:01:00+00',
    18,
    false,
    'making progress',
    now()
);

-- Zoe Hall: 36 sessions (3x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T18:00:00+00',
    '2025-01-06T18:16:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-06T18:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

-- Session 2/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-08T16:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

-- Session 3/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T17:00:00+00',
    '2025-01-10T17:13:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_sad',
    1,
    '2025-01-10T17:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Session 4/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-13T18:01:00+00',
    7,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T18:03:00+00',
    '2025-01-13T18:05:47+00',
    113,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T16:00:00+00',
    '2025-01-15T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-15T16:01:00+00',
    11,
    false,
    'making progress',
    now()
);

-- Session 6/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T18:00:00+00',
    '2025-01-17T18:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-17T18:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

-- Session 7/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T16:00:00+00',
    '2025-01-20T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-20T16:01:00+00',
    5,
    false,
    'making progress',
    now()
);

-- Session 8/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T17:00:00+00',
    '2025-01-22T17:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-22T17:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T17:03:00+00',
    '2025-01-22T17:05:02+00',
    93,
    'guided_4_7_8',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 9/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T17:00:00+00',
    '2025-01-24T17:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-24T17:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T17:03:00+00',
    '2025-01-24T17:05:51+00',
    118,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 10/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T16:00:00+00',
    '2025-01-27T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-27T16:01:00+00',
    12,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T16:03:00+00',
    '2025-01-27T16:05:25+00',
    122,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T17:00:00+00',
    '2025-01-29T17:10:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-29T17:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T17:03:00+00',
    '2025-01-29T17:04:17+00',
    163,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T18:00:00+00',
    '2025-01-31T18:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-31T18:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T18:03:00+00',
    '2025-01-31T18:04:03+00',
    177,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 13/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-03T18:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

-- Session 14/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T15:00:00+00',
    '2025-02-05T15:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-05T15:01:00+00',
    15,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T15:03:00+00',
    '2025-02-05T15:05:19+00',
    71,
    'box_breathing',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T17:00:00+00',
    '2025-02-07T17:23:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-07T17:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

-- Session 16/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T15:00:00+00',
    '2025-02-10T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-10T15:01:00+00',
    18,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T15:03:00+00',
    '2025-02-10T15:05:48+00',
    61,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 17/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T15:00:00+00',
    '2025-02-12T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T15:01:00+00',
    5,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T15:03:00+00',
    '2025-02-12T15:05:15+00',
    170,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 18/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T18:00:00+00',
    '2025-02-14T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-14T18:01:00+00',
    19,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T18:03:00+00',
    '2025-02-14T18:04:05+00',
    150,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T18:00:00+00',
    '2025-02-17T18:21:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-17T18:01:00+00',
    11,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T18:03:00+00',
    '2025-02-17T18:05:51+00',
    73,
    'box_breathing',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T17:00:00+00',
    '2025-02-19T17:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-19T17:01:00+00',
    8,
    false,
    'making progress',
    now()
);

-- Session 21/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T18:00:00+00',
    '2025-02-21T18:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-21T18:01:00+00',
    14,
    false,
    'feeling okay today',
    now()
);

-- Session 22/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T17:00:00+00',
    '2025-02-24T17:10:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-24T17:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

-- Session 23/36: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T15:00:00+00',
    '2025-02-26T15:21:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-26T15:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

-- Session 24/36: Feb 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-28T15:00:00+00',
    '2025-02-28T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-28T15:01:00+00',
    20,
    false,
    'had a good session',
    now()
);

-- Session 25/36: Mar 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-03T17:00:00+00',
    '2025-03-03T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-03T17:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-03T17:03:00+00',
    '2025-03-03T17:05:53+00',
    131,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T15:00:00+00',
    '2025-03-05T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-05T15:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 27/36: Mar 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-07T15:00:00+00',
    '2025-03-07T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-07T15:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

-- Session 28/36: Mar 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-10T17:00:00+00',
    '2025-03-10T17:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-10T17:01:00+00',
    12,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-10T17:03:00+00',
    '2025-03-10T17:05:01+00',
    156,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 29/36: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T15:00:00+00',
    '2025-03-12T15:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-12T15:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 30/36: Mar 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-14T17:00:00+00',
    '2025-03-14T17:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-14T17:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-14T17:03:00+00',
    '2025-03-14T17:04:01+00',
    140,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 31/36: Mar 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-17T18:00:00+00',
    '2025-03-17T18:17:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-17T18:01:00+00',
    11,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-17T18:03:00+00',
    '2025-03-17T18:05:18+00',
    142,
    'basic_inhale_exhale',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 32/36: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T18:00:00+00',
    '2025-03-19T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-19T18:01:00+00',
    9,
    false,
    'making progress',
    now()
);

-- Session 33/36: Mar 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-21T18:00:00+00',
    '2025-03-21T18:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-21T18:01:00+00',
    5,
    false,
    'had a good session',
    now()
);

-- Session 34/36: Mar 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-24T16:00:00+00',
    '2025-03-24T16:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-24T16:01:00+00',
    5,
    false,
    'feeling okay today',
    now()
);

-- Session 35/36: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T17:00:00+00',
    '2025-03-26T17:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-26T17:01:00+00',
    15,
    false,
    'making progress',
    now()
);

-- Session 36/36: Mar 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-28T16:00:00+00',
    '2025-03-28T16:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-28T16:01:00+00',
    10,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '7a93c126-c19c-4e8f-bec0-faa44b5043c2' ORDER BY created_at DESC LIMIT 1),
    '7a93c126-c19c-4e8f-bec0-faa44b5043c2',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-28T16:03:00+00',
    '2025-03-28T16:05:53+00',
    127,
    'basic_inhale_exhale',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Dex Wright: 36 sessions (5x per week)

-- Session 1/36: Jan 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T15:00:00+00',
    '2025-01-06T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-06T15:01:00+00',
    12,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-06T15:03:00+00',
    '2025-01-06T15:04:38+00',
    68,
    'box_breathing',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 2/36: Jan 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-07T16:00:00+00',
    '2025-01-07T16:16:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-07T16:01:00+00',
    15,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-07T16:03:00+00',
    '2025-01-07T16:04:03+00',
    101,
    'guided_4_7_8',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 3/36: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T16:00:00+00',
    '2025-01-08T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-08T16:01:00+00',
    19,
    false,
    'making progress',
    now()
);

-- Session 4/36: Jan 09
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-09T16:00:00+00',
    '2025-01-09T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-09T16:01:00+00',
    11,
    false,
    'feeling okay today',
    now()
);

-- Session 5/36: Jan 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T15:00:00+00',
    '2025-01-10T15:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-10T15:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-10T15:03:00+00',
    '2025-01-10T15:04:47+00',
    174,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 6/36: Jan 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-13T18:00:00+00',
    '2025-01-13T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-13T18:01:00+00',
    12,
    false,
    'had a good session',
    now()
);

-- Session 7/36: Jan 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-14T17:00:00+00',
    '2025-01-14T17:22:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-14T17:01:00+00',
    10,
    false,
    'making progress',
    now()
);

-- Session 8/36: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T18:00:00+00',
    '2025-01-15T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-15T18:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 9/36: Jan 16
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-16T17:00:00+00',
    '2025-01-16T17:13:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-16T17:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

-- Session 10/36: Jan 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T17:00:00+00',
    '2025-01-17T17:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-17T17:01:00+00',
    10,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-17T17:03:00+00',
    '2025-01-17T17:04:38+00',
    152,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/36: Jan 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T17:00:00+00',
    '2025-01-20T17:11:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-20T17:01:00+00',
    16,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-20T17:03:00+00',
    '2025-01-20T17:05:51+00',
    172,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/36: Jan 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-21T15:00:00+00',
    '2025-01-21T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-21T15:01:00+00',
    13,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-21T15:03:00+00',
    '2025-01-21T15:04:40+00',
    131,
    'basic_inhale_exhale',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 13/36: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T18:00:00+00',
    '2025-01-22T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-22T18:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T18:03:00+00',
    '2025-01-22T18:04:10+00',
    72,
    'guided_4_7_8',
    5,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 14/36: Jan 23
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-23T15:00:00+00',
    '2025-01-23T15:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-23T15:01:00+00',
    20,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-23T15:03:00+00',
    '2025-01-23T15:04:46+00',
    82,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 15/36: Jan 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T15:00:00+00',
    '2025-01-24T15:12:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-24T15:01:00+00',
    14,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-24T15:03:00+00',
    '2025-01-24T15:04:19+00',
    66,
    'box_breathing',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 16/36: Jan 27
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-27T16:00:00+00',
    '2025-01-27T16:18:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-27T16:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

-- Session 17/36: Jan 28
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-28T15:00:00+00',
    '2025-01-28T15:18:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-28T15:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

-- Session 18/36: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T15:00:00+00',
    '2025-01-29T15:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-29T15:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T15:03:00+00',
    '2025-01-29T15:04:03+00',
    65,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 19/36: Jan 30
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-30T17:00:00+00',
    '2025-01-30T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-30T17:01:00+00',
    16,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-30T17:03:00+00',
    '2025-01-30T17:05:39+00',
    135,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 20/36: Jan 31
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-31T18:00:00+00',
    '2025-01-31T18:21:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-31T18:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 21/36: Feb 03
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T18:00:00+00',
    '2025-02-03T18:22:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-03T18:01:00+00',
    12,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-03T18:03:00+00',
    '2025-02-03T18:05:44+00',
    171,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 22/36: Feb 04
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-04T15:00:00+00',
    '2025-02-04T15:19:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-04T15:01:00+00',
    19,
    false,
    'had a good session',
    now()
);

-- Session 23/36: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T16:00:00+00',
    '2025-02-05T16:14:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-05T16:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T16:03:00+00',
    '2025-02-05T16:04:33+00',
    87,
    'basic_inhale_exhale',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 24/36: Feb 06
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-06T17:00:00+00',
    '2025-02-06T17:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-06T17:01:00+00',
    8,
    false,
    'feeling okay today',
    now()
);

-- Session 25/36: Feb 07
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T17:00:00+00',
    '2025-02-07T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-07T17:01:00+00',
    15,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-07T17:03:00+00',
    '2025-02-07T17:05:54+00',
    160,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 26/36: Feb 10
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-10T16:00:00+00',
    '2025-02-10T16:12:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-10T16:01:00+00',
    17,
    false,
    'had a good session',
    now()
);

-- Session 27/36: Feb 11
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-11T18:00:00+00',
    '2025-02-11T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-11T18:01:00+00',
    7,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-11T18:03:00+00',
    '2025-02-11T18:05:18+00',
    86,
    'basic_inhale_exhale',
    6,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 28/36: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:24:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T16:01:00+00',
    8,
    false,
    'making progress',
    now()
);

-- Session 29/36: Feb 13
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-13T16:00:00+00',
    '2025-02-13T16:23:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-13T16:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-13T16:03:00+00',
    '2025-02-13T16:04:55+00',
    104,
    'guided_4_7_8',
    9,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 30/36: Feb 14
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-14T15:00:00+00',
    '2025-02-14T15:14:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-14T15:01:00+00',
    20,
    false,
    'feeling okay today',
    now()
);

-- Session 31/36: Feb 17
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-17T15:00:00+00',
    '2025-02-17T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-17T15:01:00+00',
    6,
    false,
    'feeling okay today',
    now()
);

-- Session 32/36: Feb 18
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-18T17:00:00+00',
    '2025-02-18T17:19:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-18T17:01:00+00',
    20,
    false,
    'making progress',
    now()
);

-- Session 33/36: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:18:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-19T15:01:00+00',
    9,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:03:00+00',
    '2025-02-19T15:05:53+00',
    75,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 34/36: Feb 20
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-20T18:00:00+00',
    '2025-02-20T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-20T18:01:00+00',
    14,
    false,
    'making progress',
    now()
);

-- Session 35/36: Feb 21
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T18:00:00+00',
    '2025-02-21T18:20:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-21T18:01:00+00',
    9,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-21T18:03:00+00',
    '2025-02-21T18:05:04+00',
    104,
    'box_breathing',
    8,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 36/36: Feb 24
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T17:00:00+00',
    '2025-02-24T17:24:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-02-24T17:01:00+00',
    14,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '34075c5b-c6dd-4a1a-9607-ee6186add964' ORDER BY created_at DESC LIMIT 1),
    '34075c5b-c6dd-4a1a-9607-ee6186add964',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-24T17:03:00+00',
    '2025-02-24T17:04:28+00',
    168,
    'guided_4_7_8',
    10,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Grace Turner: 12 sessions (1x per week)

-- Session 1/12: Jan 08
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-08T18:00:00+00',
    '2025-01-08T18:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-08T18:01:00+00',
    14,
    false,
    'making progress',
    now()
);

-- Session 2/12: Jan 15
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-15T15:00:00+00',
    '2025-01-15T15:19:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'sad',
    2,
    '2025-01-15T15:01:00+00',
    18,
    false,
    'had a good session',
    now()
);

-- Session 3/12: Jan 22
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-22T15:00:00+00',
    '2025-01-22T15:10:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-01-22T15:01:00+00',
    7,
    false,
    'making progress',
    now()
);

-- Session 4/12: Jan 29
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:00:00+00',
    '2025-01-29T18:15:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-01-29T18:01:00+00',
    10,
    false,
    'making progress',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-01-29T18:03:00+00',
    '2025-01-29T18:04:43+00',
    154,
    'box_breathing',
    7,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 5/12: Feb 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-05T16:00:00+00',
    '2025-02-05T16:11:00+00',
    'completed',
    ARRAY['mood_meter', 'wellbeing_wheel'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-05T16:01:00+00',
    11,
    false,
    'feeling okay today',
    now()
);

-- Session 6/12: Feb 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-12T16:00:00+00',
    '2025-02-12T16:19:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'ok',
    3,
    '2025-02-12T16:01:00+00',
    13,
    false,
    'making progress',
    now()
);

-- Session 7/12: Feb 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-19T15:00:00+00',
    '2025-02-19T15:14:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-19T15:01:00+00',
    8,
    false,
    'had a good session',
    now()
);

-- Session 8/12: Feb 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-02-26T16:00:00+00',
    '2025-02-26T16:10:00+00',
    'completed',
    ARRAY['mood_meter'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-02-26T16:01:00+00',
    12,
    false,
    'making progress',
    now()
);

-- Session 9/12: Mar 05
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-05T18:00:00+00',
    '2025-03-05T18:25:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-05T18:01:00+00',
    16,
    false,
    'making progress',
    now()
);

-- Session 10/12: Mar 12
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T16:00:00+00',
    '2025-03-12T16:25:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'very_happy',
    5,
    '2025-03-12T16:01:00+00',
    13,
    false,
    'feeling okay today',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-12T16:03:00+00',
    '2025-03-12T16:05:36+00',
    179,
    'guided_4_7_8',
    4,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 11/12: Mar 19
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T17:00:00+00',
    '2025-03-19T17:13:00+00',
    'completed',
    ARRAY['mood_meter', 'breathing_tool', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-19T17:01:00+00',
    6,
    false,
    'had a good session',
    now()
);

INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-19T17:03:00+00',
    '2025-03-19T17:05:19+00',
    144,
    'box_breathing',
    3,
    false,
    'breathing exercises help me feel better',
    now()
);

-- Session 12/12: Mar 26
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    '2025-03-26T16:00:00+00',
    '2025-03-26T16:12:00+00',
    'completed',
    ARRAY['mood_meter', 'emotion_grid'],
    now(),
    now()
);

INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '036a6ee1-7871-4b82-b74c-0bbcfc1fa646' ORDER BY created_at DESC LIMIT 1),
    '036a6ee1-7871-4b82-b74c-0bbcfc1fa646',
    '0e233a3b-e007-4eae-a9a5-4586c59b2faf',
    'happy',
    4,
    '2025-03-26T16:01:00+00',
    10,
    false,
    'making progress',
    now()
);