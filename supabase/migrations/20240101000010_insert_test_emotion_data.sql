-- Insert test emotion grid data for existing children

-- First, let's create some test emotion grid usage entries
DO $$
DECLARE
  child_record RECORD;
  org_record RECORD;
  feeling_record RECORD;
  usage_id UUID;
  days_ago INTEGER;
  random_hour INTEGER;
  created_timestamp TIMESTAMP WITH TIME ZONE;
BEGIN
  -- Get all organizations
  FOR org_record IN SELECT id FROM public.organizations LOOP
    -- Get all children in this organization
    FOR child_record IN SELECT id FROM public.profiles WHERE role = 'Child' AND org_id = org_record.id LOOP
      -- Create multiple entries per child over the last 30 days
      FOR days_ago IN 0..30 BY 3 LOOP
        -- Random time of day
        random_hour := floor(random() * 10 + 8)::integer; -- Between 8am and 6pm
        created_timestamp := CURRENT_TIMESTAMP - (days_ago || ' days')::interval + (random_hour || ' hours')::interval;

        -- Create emotion grid usage entry
        INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
        VALUES (
          child_record.id,
          org_record.id,
          CASE
            WHEN random() < 0.3 THEN 'I felt this way because of something at school'
            WHEN random() < 0.6 THEN 'Playing with friends made me feel better'
            WHEN random() < 0.8 THEN 'I was thinking about my family'
            ELSE NULL
          END,
          created_timestamp
        ) RETURNING id INTO usage_id;

        -- Add 1-3 random feelings
        FOR feeling_record IN
          SELECT id FROM public.emotion_grid_feelings
          ORDER BY random()
          LIMIT floor(random() * 3 + 1)::integer
        LOOP
          INSERT INTO public.emotion_grid_usage_feelings (usage_id, feeling_id)
          VALUES (usage_id, feeling_record.id);
        END LOOP;

        -- Also create corresponding mood meter entry
        INSERT INTO public.mood_meter_usage (child_id, org_id, mood_level, mood_numeric, notes, created_at)
        VALUES (
          child_record.id,
          org_record.id,
          CASE
            WHEN random() < 0.1 THEN 'very_sad'
            WHEN random() < 0.2 THEN 'sad'
            WHEN random() < 0.5 THEN 'ok'
            WHEN random() < 0.8 THEN 'happy'
            ELSE 'very_happy'
          END,
          CASE
            WHEN random() < 0.1 THEN 1
            WHEN random() < 0.2 THEN 2
            WHEN random() < 0.5 THEN 3
            WHEN random() < 0.8 THEN 4
            ELSE 5
          END,
          CASE
            WHEN random() < 0.3 THEN 'Had a good day today'
            WHEN random() < 0.5 THEN 'Feeling better than yesterday'
            ELSE NULL
          END,
          created_timestamp
        );
      END LOOP;
    END LOOP;
  END LOOP;
END $$;

-- Create some specific patterns for demonstration
-- Add concerning pattern for one child (declining mood over time)
DO $$
DECLARE
  test_child_id UUID;
  test_org_id UUID;
  feeling_id UUID;
  usage_id UUID;
  i INTEGER;
BEGIN
  -- Get first child and org
  SELECT id INTO test_child_id FROM public.profiles WHERE role = 'Child' LIMIT 1;
  SELECT org_id INTO test_org_id FROM public.profiles WHERE id = test_child_id;

  IF test_child_id IS NOT NULL THEN
    -- Create declining mood pattern over last 7 days
    FOR i IN 0..6 LOOP
      -- Create emotion grid usage
      INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
      VALUES (
        test_child_id,
        test_org_id,
        CASE
          WHEN i < 3 THEN 'Things have been difficult lately'
          ELSE 'Not feeling great today'
        END,
        CURRENT_TIMESTAMP - (i || ' days')::interval + '14:00:00'::interval
      ) RETURNING id INTO usage_id;

      -- Add sad/tired feelings
      SELECT id INTO feeling_id FROM public.emotion_grid_feelings
      WHERE feeling_category = 'low-energy-uncomfortable'
      ORDER BY random() LIMIT 1;

      INSERT INTO public.emotion_grid_usage_feelings (usage_id, feeling_id)
      VALUES (usage_id, feeling_id);

      -- Add corresponding declining mood scores
      INSERT INTO public.mood_meter_usage (child_id, org_id, mood_level, mood_numeric, notes, created_at)
      VALUES (
        test_child_id,
        test_org_id,
        CASE
          WHEN i < 2 THEN 'sad'
          ELSE 'very_sad'
        END,
        CASE
          WHEN i < 2 THEN 2
          ELSE 1
        END,
        'Need some support',
        CURRENT_TIMESTAMP - (i || ' days')::interval + '14:00:00'::interval
      );
    END LOOP;
  END IF;
END $$;

-- Create improving pattern for another child
DO $$
DECLARE
  test_child_id UUID;
  test_org_id UUID;
  feeling_id UUID;
  usage_id UUID;
  i INTEGER;
BEGIN
  -- Get second child
  SELECT id INTO test_child_id FROM public.profiles WHERE role = 'Child' OFFSET 1 LIMIT 1;
  SELECT org_id INTO test_org_id FROM public.profiles WHERE id = test_child_id;

  IF test_child_id IS NOT NULL THEN
    -- Create improving mood pattern over last 7 days
    FOR i IN 0..6 LOOP
      -- Create emotion grid usage
      INSERT INTO public.emotion_grid_usage (child_id, org_id, explanation_text, created_at)
      VALUES (
        test_child_id,
        test_org_id,
        CASE
          WHEN i < 3 THEN 'Starting to feel better'
          ELSE 'Had a great day!'
        END,
        CURRENT_TIMESTAMP - (i || ' days')::interval + '10:00:00'::interval
      ) RETURNING id INTO usage_id;

      -- Add happy/excited feelings
      SELECT id INTO feeling_id FROM public.emotion_grid_feelings
      WHERE feeling_category = 'high-energy-comfortable'
      ORDER BY random() LIMIT 1;

      INSERT INTO public.emotion_grid_usage_feelings (usage_id, feeling_id)
      VALUES (usage_id, feeling_id);

      -- Add corresponding improving mood scores
      INSERT INTO public.mood_meter_usage (child_id, org_id, mood_level, mood_numeric, notes, created_at)
      VALUES (
        test_child_id,
        test_org_id,
        CASE
          WHEN i < 3 THEN 'happy'
          ELSE 'very_happy'
        END,
        CASE
          WHEN i < 3 THEN 4
          ELSE 5
        END,
        'Things are going well!',
        CURRENT_TIMESTAMP - (i || ' days')::interval + '10:00:00'::interval
      );
    END LOOP;
  END IF;
END $$;