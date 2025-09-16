#!/usr/bin/env python3
"""
Generate Session Data for All 30 Children
Uses actual child IDs from the database
Creates realistic journey data for Jan-Mar 2025
"""

import random
from datetime import datetime, timedelta
from typing import Dict, List, Tuple

# Child ID mapping from database
CHILD_MAPPING = {
    # Hospital Children
    "Emma Thompson": {"id": "ce864083-bdf5-4ead-b56a-3c36208d3b69", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "3x", "condition": "asthma"},
    "Aisha Patel": {"id": "1d0d16ae-2aa0-4d72-9abc-fd641147291f", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "1x", "condition": "diabetes"},
    "Kai Chen": {"id": "621635c0-c6c8-4eed-8a8a-48e04e9a722a", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "5x", "condition": "surgery_recovery"},
    "Mia Rodriguez": {"id": "87c1f890-2789-411f-b8bd-801b7b568c47", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "3x", "condition": "kidney"},
    "Ethan Williams": {"id": "5b864e7e-473e-4232-98b6-5eabdac2ece4", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "3x", "condition": "leukemia"},
    "Zara Ahmed": {"id": "332fe862-786f-4bd5-aba5-8742fbcc460f", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "1x", "condition": "trauma"},
    "Lucas Brown": {"id": "2598d59d-1fda-4391-9fa0-85f28116eab2", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "5x", "condition": "depression"},
    "Amara Johnson": {"id": "3e8e4d85-1e43-41c4-95fc-77741fd5b7a5", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "1x", "condition": "heart"},
    "Ben Young": {"id": "616f03bd-aa58-4689-9e88-f1c7d5424f04", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "3x", "condition": "chronic_pain"},
    "Chloe King": {"id": "28e7a649-8677-4476-b88c-b5b923a9a4e2", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "pattern": "5x", "condition": "eating_disorder"},

    # School Children
    "Oliver Davies": {"id": "d9e80399-1a4d-4ac6-8634-077f35846eec", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "3x", "condition": "dyslexia"},
    "Jayden Smith": {"id": "02855440-b7f1-478e-b8fe-f72e2b6511cd", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "5x", "condition": "adhd"},
    "Sophia Wilson": {"id": "b6d90425-2c36-4f96-8040-8eefdec50224", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "1x", "condition": "anxiety"},
    "Tyler Anderson": {"id": "584bad64-a040-4eed-8a99-e5eb81cb2dd9", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "3x", "condition": "social_anxiety"},
    "Ava Taylor": {"id": "9620e76e-2de6-4580-9b05-466f854478f4", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "5x", "condition": "family_stress"},
    "Noah Martin": {"id": "7c2f657d-1607-4045-9e2f-6ebf3ec51d05", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "1x", "condition": "confidence"},
    "Isla Roberts": {"id": "23d3a8d1-7ab6-4a5f-b9be-377ab6370d54", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "1x", "condition": "transition"},
    "Ravi Singh": {"id": "3f9cb391-c1cd-4473-9adb-2af0d05cd514", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "3x", "condition": "bilingual"},
    "Evie Scott": {"id": "f50e666e-538f-4109-baa1-d3cc969ab870", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "3x", "condition": "friendship"},
    "Felix Baker": {"id": "0804f356-4551-4b5d-83a2-c3c787bdac02", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "pattern": "1x", "condition": "speech"},

    # Clinic Children
    "Sebastian Clark": {"id": "20a239a5-2730-49b2-b9f4-2af18d737e4b", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "3x", "condition": "autism"},
    "Lily Evans": {"id": "c02ac4c9-38e5-4e66-978c-97de2368efc2", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "1x", "condition": "sensory"},
    "Charlie White": {"id": "d6161b21-90ce-4c83-8142-98cabaddb655", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "5x", "condition": "mutism"},
    "Maya Green": {"id": "c26fa169-9aa6-458b-94d0-0c13002e0ea6", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "3x", "condition": "perfectionism"},
    "Oscar Harris": {"id": "2b775f59-359e-4e2d-a30d-fb5d263997c0", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "3x", "condition": "dyspraxia"},
    "Ruby Lewis": {"id": "f6f1730c-6bc8-4f39-ba47-71e47f1588dc", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "1x", "condition": "sensitivity"},
    "Finn Walker": {"id": "6d80de20-8ce5-4885-87a5-0af2a3c087a5", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "1x", "condition": "developmental"},
    "Zoe Hall": {"id": "7a93c126-c19c-4e8f-bec0-faa44b5043c2", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "3x", "condition": "gifted"},
    "Dex Wright": {"id": "34075c5b-c6dd-4a1a-9607-ee6186add964", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "5x", "condition": "mutism_school"},
    "Grace Turner": {"id": "036a6ee1-7871-4b82-b74c-0bbcfc1fa646", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "pattern": "1x", "condition": "ocd"}
}

class SessionGenerator:
    def __init__(self):
        self.start_date = datetime(2025, 1, 6, 9, 0)  # Monday Jan 6, 2025
        self.end_date = datetime(2025, 3, 31, 18, 0)   # Monday Mar 31, 2025

    def get_session_dates(self, pattern: str) -> List[datetime]:
        """Generate session dates based on pattern (1x, 3x, or 5x per week)"""
        dates = []
        current = self.start_date

        if pattern == "1x":
            # Once per week (Wednesdays)
            while current <= self.end_date:
                if current.weekday() == 2:  # Wednesday
                    dates.append(current + timedelta(hours=random.randint(6, 9)))
                current += timedelta(days=1)
        elif pattern == "3x":
            # Three times per week (Mon, Wed, Fri)
            while current <= self.end_date:
                if current.weekday() in [0, 2, 4]:  # Mon, Wed, Fri
                    dates.append(current + timedelta(hours=random.randint(6, 9)))
                current += timedelta(days=1)
        elif pattern == "5x":
            # Five times per week (weekdays)
            while current <= self.end_date:
                if current.weekday() < 5:  # Monday to Friday
                    dates.append(current + timedelta(hours=random.randint(6, 9)))
                current += timedelta(days=1)

        return dates[:36]  # Limit to 36 sessions max

    def generate_mood_progression(self, session_num: int, total_sessions: int) -> Tuple[str, int]:
        """Generate realistic mood progression over time"""
        progress = session_num / total_sessions

        if progress < 0.2:  # Early phase - struggling
            moods = [('very_sad', 1), ('sad', 2), ('sad', 2), ('ok', 3)]
        elif progress < 0.4:  # Stabilizing
            moods = [('sad', 2), ('ok', 3), ('ok', 3), ('happy', 4)]
        elif progress < 0.6:  # Building
            moods = [('ok', 3), ('ok', 3), ('happy', 4), ('happy', 4)]
        elif progress < 0.8:  # Improving
            moods = [('ok', 3), ('happy', 4), ('happy', 4), ('very_happy', 5)]
        else:  # Thriving
            moods = [('happy', 4), ('happy', 4), ('very_happy', 5), ('very_happy', 5)]

        return random.choice(moods)

    def generate_child_sessions_sql(self, name: str, child_data: Dict) -> str:
        """Generate SQL for one child's complete journey"""
        sql_parts = []
        dates = self.get_session_dates(child_data['pattern'])
        total_sessions = len(dates)

        sql_parts.append(f"\n-- {name}: {total_sessions} sessions ({child_data['pattern']} per week)")

        for i, session_date in enumerate(dates, 1):
            mood_level, mood_value = self.generate_mood_progression(i, total_sessions)
            completion_time = session_date + timedelta(minutes=random.randint(10, 25))

            # Choose random tools for this session
            tools = ['mood_meter']
            if random.random() > 0.5:
                tools.append('breathing_tool')
            if random.random() > 0.6:
                tools.append('emotion_grid')
            if random.random() > 0.7:
                tools.append('wellbeing_wheel')

            # Session insert
            sql_parts.append(f"""
-- Session {i}/{total_sessions}: {session_date.strftime('%b %d')}
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '{child_data['id']}',
    '{child_data['org_id']}',
    '{session_date.isoformat()}+00',
    '{completion_time.isoformat()}+00',
    'completed',
    ARRAY{tools},
    now(),
    now()
);""")

            # Mood meter (always included)
            mood_time = session_date + timedelta(minutes=1)
            sql_parts.append(f"""
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{child_data['id']}' ORDER BY created_at DESC LIMIT 1),
    '{child_data['id']}',
    '{child_data['org_id']}',
    '{mood_level}',
    {mood_value},
    '{mood_time.isoformat()}+00',
    {random.randint(5, 20)},
    false,
    '{self.generate_mood_note(child_data['condition'], i, total_sessions)}',
    now()
);""")

            # Add breathing tool if selected
            if 'breathing_tool' in tools:
                breath_time = session_date + timedelta(minutes=3)
                sql_parts.append(f"""
INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{child_data['id']}' ORDER BY created_at DESC LIMIT 1),
    '{child_data['id']}',
    '{child_data['org_id']}',
    '{breath_time.isoformat()}+00',
    '{(breath_time + timedelta(seconds=random.randint(60, 180))).isoformat()}+00',
    {random.randint(60, 180)},
    '{random.choice(['basic_inhale_exhale', 'guided_4_7_8', 'box_breathing'])}',
    {random.randint(3, 10)},
    false,
    'breathing exercises help me feel better',
    now()
);""")

        return '\n'.join(sql_parts)

    def generate_mood_note(self, condition: str, session_num: int, total: int) -> str:
        """Generate condition-specific mood notes"""
        progress = session_num / total

        notes_by_condition = {
            "asthma": ["breathing feels easier today", "practiced my inhaler technique", "feeling stronger"],
            "diabetes": ["blood sugar stable today", "feeling more in control", "managing well with routine"],
            "surgery_recovery": ["less pain today", "getting stronger each day", "feeling more like myself"],
            "anxiety": ["found a calm moment", "breathing helped today", "feeling less worried"],
            "adhd": ["focused better today", "had fun in activities", "feeling proud of myself"],
            "autism": ["good sensory day", "enjoyed quiet time", "felt understood today"],
            "mutism": ["expressed myself through drawing", "felt heard today", "made progress"],
        }

        default_notes = ["feeling okay today", "had a good session", "making progress"]

        if condition in notes_by_condition:
            return random.choice(notes_by_condition[condition])
        return random.choice(default_notes)

def main():
    """Generate SQL for all 30 children"""
    generator = SessionGenerator()

    print("🚀 Generating Session Data for All 30 Children")
    print("=" * 60)

    # Skip Emma if she already has sessions
    skip_emma = input("Skip Emma Thompson (she has 176 sessions)? (y/n): ").lower() == 'y'

    sql_parts = ["""-- The Lift - Complete Journey Data for 30 Children
-- Generated using actual child IDs from database
-- Period: January - March 2025
-- Authentic progression patterns based on conditions
"""]

    total_sessions = 0
    for name, child_data in CHILD_MAPPING.items():
        if skip_emma and name == "Emma Thompson":
            print(f"⏭️  Skipping {name} (already has sessions)")
            continue

        print(f"✅ Generating sessions for {name}...")
        child_sql = generator.generate_child_sessions_sql(name, child_data)
        sql_parts.append(child_sql)

        # Count sessions for this child
        pattern = child_data['pattern']
        if pattern == "1x":
            sessions = 12
        elif pattern == "3x":
            sessions = 36
        else:  # 5x
            sessions = 36
        total_sessions += sessions

    # Save to file
    filename = f"all_30_children_sessions_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
    with open(filename, 'w') as f:
        f.write('\n'.join(sql_parts))

    print(f"\n✅ Generated {filename}")
    print(f"📊 Total sessions: ~{total_sessions}")
    print(f"🎯 Ready to run in Supabase!")
    print("\n💡 To execute:")
    print(f"   1. Run: python3 smart_sql_executor.py {filename}")
    print("   2. Or paste into Supabase SQL editor in chunks")

if __name__ == "__main__":
    main()