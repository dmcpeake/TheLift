#!/usr/bin/env python3
"""
Emma's 36-Session Journey Generator
Generates realistic progression from winter anxiety to spring confidence
Run with: claude code emma_journey_generator.py
"""

import json
import uuid
from datetime import datetime, timedelta
from typing import Dict, List, Tuple
import random

class EmmaJourneyGenerator:
    def __init__(self):
        self.child_id = 'ce864083-bdf5-4ead-b56a-3c36208d3b69'
        self.org_id = '7eab219a-7c83-406c-a6b2-75ed44de715b'
        
        # Emma's emotional journey phases
        self.journey_phases = {
            'crisis': (1, 6),           # Sessions 1-6: Winter anxiety peak
            'stabilizing': (7, 12),     # Sessions 7-12: Finding routine
            'building': (13, 20),       # Sessions 13-20: Friendship with James
            'mastering': (21, 28),      # Sessions 21-28: Tool confidence
            'thriving': (29, 36)        # Sessions 29-36: Spring leadership
        }
        
        # Realistic mood progression
        self.mood_patterns = {
            'crisis': [2, 2, 3, 2, 3, 3],
            'stabilizing': [3, 3, 4, 3, 4, 3],
            'building': [3, 4, 4, 3, 4, 4, 3, 4],
            'mastering': [4, 4, 3, 4, 4, 3, 4, 4],
            'thriving': [4, 5, 4, 4, 5, 4, 5, 4]
        }
        
        # Emma's vocabulary evolution
        self.emotional_vocabulary = {
            'crisis': {
                'emotions': ['worried', 'anxious', 'scared', 'tired', 'frustrated'],
                'phrases': ['breathing feels hard', 'chest feels tight', 'scared about germs', 'worried about school']
            },
            'stabilizing': {
                'emotions': ['calm', 'relieved', 'grateful', 'nervous', 'hopeful'],
                'phrases': ['feeling a bit better', 'mummy and daddy help', 'breathing exercises work']
            },
            'building': {
                'emotions': ['confident', 'happy', 'excited', 'proud', 'connected'],
                'phrases': ['james understands me', 'we help each other', 'not alone anymore']
            },
            'mastering': {
                'emotions': ['strong', 'capable', 'peaceful', 'wise', 'resilient'],
                'phrases': ['know what to do now', 'can help myself', 'breathing is my superpower']
            },
            'thriving': {
                'emotions': ['joyful', 'leader', 'caring', 'bright', 'amazing'],
                'phrases': ['helping new children', 'showing others the tools', 'feeling really good']
            }
        }

    def get_phase_for_session(self, session_num: int) -> str:
        """Determine which emotional phase Emma is in for this session"""
        for phase, (start, end) in self.journey_phases.items():
            if start <= session_num <= end:
                return phase
        return 'thriving'

    def generate_session_timestamp(self, session_num: int) -> datetime:
        """Generate realistic timestamps - 3x per week pattern"""
        # Start January 6th, 2025
        start_date = datetime(2025, 1, 6, 16, 30)
        
        # 3 sessions per week: Monday, Wednesday, Friday
        week_number = (session_num - 1) // 3
        day_in_week = (session_num - 1) % 3
        
        days_offset = week_number * 7 + [0, 2, 4][day_in_week]  # Mon=0, Wed=2, Fri=4
        
        # Add some realistic time variation
        time_offset = random.randint(-30, 60)  # ±30-60 minutes
        
        return start_date + timedelta(days=days_offset, minutes=time_offset)

    def generate_mood_meter(self, session_num: int, phase: str) -> Dict:
        """Generate mood meter data with realistic progression"""
        mood_values = self.mood_patterns[phase]
        mood_index = (session_num - self.journey_phases[phase][0]) % len(mood_values)
        mood_numeric = mood_values[mood_index]
        
        mood_levels = ['', 'very_sad', 'sad', 'ok', 'happy', 'very_happy']
        mood_level = mood_levels[mood_numeric]
        
        # Generate Emma's authentic notes based on phase
        notes = self.generate_mood_notes(phase, mood_numeric, session_num)
        
        return {
            'mood_level': mood_level,
            'mood_numeric': mood_numeric,
            'time_to_select_seconds': random.randint(5, 25),
            'notes': notes
        }

    def generate_mood_notes(self, phase: str, mood_numeric: int, session_num: int) -> str:
        """Generate Emma's authentic mood notes"""
        phrases = self.emotional_vocabulary[phase]['phrases']
        
        if phase == 'crisis':
            return random.choice([
                'still worried about school and getting sick',
                'my breathing felt hard today',
                'chest feels tight when kids cough',
                'scared about winter germs'
            ])
        elif phase == 'stabilizing':
            return random.choice([
                'weekend helped me feel calmer',
                'mummy and daddy are helping me lots',
                'breathing exercises are getting easier',
                'school feels a bit more normal'
            ])
        elif phase == 'building':
            return random.choice([
                'james and i talked about our inhalers today',
                'having a friend who understands helps so much',
                'not feeling so alone anymore',
                'we help each other with breathing'
            ])
        elif phase == 'mastering':
            return random.choice([
                'know exactly what to do when i feel worried',
                'breathing exercises are like my superpower now',
                'can help other kids who feel scared',
                'feeling really confident and strong'
            ])
        else:  # thriving
            return random.choice([
                'love helping new children learn the tools',
                'spring makes everything feel bright and happy',
                'showing other kids how breathing helps',
                'feeling amazing and ready for anything'
            ])

    def generate_emotion_grid(self, session_num: int, phase: str) -> Dict:
        """Generate emotion grid data with authentic child expression"""
        emotions = self.emotional_vocabulary[phase]['emotions']
        selected_emotions = random.sample(emotions, 3)
        
        explanation = self.generate_emotion_explanation(phase, session_num)
        
        return {
            'step_completed': 3,
            'explanation_text': explanation,
            'explanation_length': len(explanation),
            'input_method': random.choice(['typing', 'speech_to_text']),
            'wants_adult_conversation': phase in ['crisis', 'building'],
            'emotions': selected_emotions
        }

    def generate_emotion_explanation(self, phase: str, session_num: int) -> str:
        """Generate Emma's authentic emotion explanations"""
        if phase == 'crisis':
            return random.choice([
                'im really worried about getting sick at school. everyone is coughing and i get scared',
                'my breathing feels hard and i dont know why. mummy says it will be ok',
                'school is scary right now because of all the germs. i want to stay home'
            ])
        elif phase == 'stabilizing':
            return random.choice([
                'feeling a bit better about school. the breathing exercises help when i practice',
                'weekend was nice. we did quiet things and i felt safe and calm',
                'still nervous but not as scared. learning to breathe slowly helps'
            ])
        elif phase == 'building':
            return random.choice([
                'met james today and he has asthma too! we understand each other',
                'having a friend who gets it makes school so much better. we help each other',
                'james showed me his inhaler and i showed him breathing exercises'
            ])
        elif phase == 'mastering':
            return random.choice([
                'know what to do when i feel worried now. breathing exercises work really well',
                'can teach other kids the breathing tricks. it feels good to help',
                'school feels normal now. i have tools and friends who understand'
            ])
        else:  # thriving
            return random.choice([
                'love spring! everything feels bright. helping new kids learn the breathing tools',
                'feel like a breathing expert now. other kids ask me for help and i love it',
                'so happy and confident. can handle anything that comes my way'
            ])

    def generate_breathing_tool(self, session_num: int, phase: str) -> Dict:
        """Generate breathing tool usage with progression"""
        patterns = ['basic_inhale_exhale', 'guided_4_7_8', 'box_breathing']
        
        # Emma gets better at breathing exercises over time
        if phase == 'crisis':
            duration = random.randint(60, 120)
            cycles = random.randint(2, 5)
            pattern = 'basic_inhale_exhale'
            notes = random.choice([
                'felt hard to breathe deeply today',
                'chest felt tight but got a bit better',
                'difficult but mummy helped me'
            ])
        elif phase == 'stabilizing':
            duration = random.randint(90, 180)
            cycles = random.randint(4, 8)
            pattern = random.choice(['basic_inhale_exhale', 'guided_4_7_8'])
            notes = random.choice([
                'getting easier with practice',
                'the counting helps me focus',
                'felt calmer after breathing'
            ])
        elif phase in ['building', 'mastering']:
            duration = random.randint(120, 240)
            cycles = random.randint(6, 12)
            pattern = random.choice(['guided_4_7_8', 'box_breathing'])
            notes = random.choice([
                'breathing exercises feel natural now',
                'can do these anywhere when i need them',
                'helped james learn this pattern too'
            ])
        else:  # thriving
            duration = random.randint(180, 300)
            cycles = random.randint(8, 15)
            pattern = random.choice(patterns)
            notes = random.choice([
                'breathing is my superpower now',
                'love teaching other kids these exercises',
                'feel so peaceful and strong after breathing'
            ])
        
        return {
            'duration_seconds': duration,
            'breathing_pattern': pattern,
            'cycles_completed': cycles,
            'notes': notes
        }

    def generate_wellbeing_wheel(self, session_num: int, phase: str) -> Dict:
        """Generate wellbeing wheel with realistic section scores"""
        sections = ['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions']
        
        # Emma's scores improve over time, with health being her main concern
        if phase == 'crisis':
            base_scores = {'my_health': 2, 'my_emotions': 2, 'my_safety': 3}
        elif phase == 'stabilizing':
            base_scores = {'my_health': 3, 'my_emotions': 3, 'my_safety': 4}
        elif phase == 'building':
            base_scores = {'my_health': 3, 'my_friends': 4, 'my_emotions': 4}
        elif phase == 'mastering':
            base_scores = {'my_health': 4, 'my_friends': 4, 'my_emotions': 4}
        else:  # thriving
            base_scores = {'my_health': 4, 'my_friends': 5, 'my_emotions': 5}
        
        section_data = []
        total_score = 0
        
        for section in sections:
            score = base_scores.get(section, random.randint(3, 5))
            mood_levels = ['', 'very_sad', 'sad', 'ok', 'happy', 'very_happy']
            
            response = self.generate_wellbeing_response(section, score, phase)
            
            section_data.append({
                'section_name': section,
                'mood_level': mood_levels[score],
                'mood_numeric': score,
                'text_response': response,
                'text_response_length': len(response),
                'time_to_complete_seconds': random.randint(15, 45)
            })
            total_score += score
        
        return {
            'sections_completed': sections,
            'total_sections_completed': len(sections),
            'overall_score': round(total_score / len(sections), 2),
            'sections': section_data
        }

    def generate_wellbeing_response(self, section: str, score: int, phase: str) -> str:
        """Generate Emma's responses for wellbeing wheel sections"""
        responses = {
            'my_friends': {
                'crisis': 'worried about friends getting sick',
                'building': 'james is my best friend now',
                'thriving': 'love my friends and helping new ones'
            },
            'my_health': {
                'crisis': 'breathing is hard and scary',
                'stabilizing': 'getting better with practice',
                'mastering': 'know how to take care of myself',
                'thriving': 'feel healthy and strong'
            },
            'my_family': {
                'crisis': 'mummy and daddy help me feel safe',
                'building': 'family understands me so well',
                'thriving': 'love my family so much'
            }
        }
        
        if section in responses and phase in responses[section]:
            return responses[section][phase]
        
        return f"feeling {['', 'very sad', 'sad', 'ok', 'happy', 'very happy'][score]} about this"

    def generate_session_sql(self, session_num: int) -> str:
        """Generate complete SQL for one session"""
        phase = self.get_phase_for_session(session_num)
        timestamp = self.generate_session_timestamp(session_num)
        
        # Determine which tools to use this session
        tools = ['mood_meter']  # Always use mood meter
        if session_num % 2 == 0:  # Every other session
            tools.append('emotion_grid')
        if session_num % 3 == 1:  # Every third session starting with 1
            tools.append('breathing_tool')
        if session_num % 5 == 4:  # Every fifth session starting with 4
            tools.append('wellbeing_wheel')
        
        # Generate data for each tool
        mood_data = self.generate_mood_meter(session_num, phase)
        emotion_data = self.generate_emotion_grid(session_num, phase) if 'emotion_grid' in tools else None
        breathing_data = self.generate_breathing_tool(session_num, phase) if 'breathing_tool' in tools else None
        wellbeing_data = self.generate_wellbeing_wheel(session_num, phase) if 'wellbeing_wheel' in tools else None
        
        # Build SQL
        sql_parts = []

        # Session record
        completion_time = timestamp + timedelta(minutes=random.randint(5, 20))
        sql_parts.append(f"""
-- Session {session_num}: {timestamp.strftime('%b %d')} - {phase.title()} phase
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '{self.child_id}',
    '{self.org_id}',
    '{timestamp.isoformat()}+00',
    '{completion_time.isoformat()}+00',
    'completed',
    ARRAY{tools},
    now(),
    now()
);""")
        
        # Mood meter (always present)
        mood_time = timestamp + timedelta(minutes=1)
        sql_parts.append(f"""
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{self.child_id}' ORDER BY created_at DESC LIMIT 1),
    '{self.child_id}',
    '{self.org_id}',
    '{mood_data['mood_level']}',
    {mood_data['mood_numeric']},
    '{mood_time.isoformat()}+00',
    {mood_data['time_to_select_seconds']},
    false,
    '{mood_data['notes']}',
    now()
);""")
        
        # Add other tools as needed
        if emotion_data:
            sql_parts.append(self.generate_emotion_grid_sql(timestamp, emotion_data))

        if breathing_data:
            sql_parts.append(self.generate_breathing_tool_sql(timestamp, breathing_data))

        if wellbeing_data:
            sql_parts.append(self.generate_wellbeing_wheel_sql(timestamp, wellbeing_data))
        
        return '\n'.join(sql_parts)

    def generate_emotion_grid_sql(self, timestamp: datetime, data: Dict) -> str:
        """Generate emotion grid SQL"""
        start_time = timestamp + timedelta(minutes=2)
        end_time = start_time + timedelta(minutes=random.randint(3, 8))
        
        sql = f"""
INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{self.child_id}' ORDER BY created_at DESC LIMIT 1),
    '{self.child_id}',
    '{self.org_id}',
    '{start_time.isoformat()}+00',
    '{end_time.isoformat()}+00',
    {data['step_completed']},
    '{data['explanation_text']}',
    {data['explanation_length']},
    '{data['input_method']}',
    false,
    'completed',
    null,
    now(),
    now(),
    {str(data['wants_adult_conversation']).lower()}
);"""
        
        # Add feelings
        for i, emotion in enumerate(data['emotions'], 1):
            feeling_time = start_time + timedelta(minutes=i)
            sql += f"""
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = '{self.child_id}' ORDER BY created_at DESC LIMIT 1),
    '{self.child_id}',
    '{emotion}',
    'high-energy-comfortable',
    '😊',
    'feeling {emotion}',
    {i},
    '{feeling_time.isoformat()}+00',
    now()
);"""
        
        return sql

    def generate_breathing_tool_sql(self, timestamp: datetime, data: Dict) -> str:
        """Generate breathing tool SQL"""
        start_time = timestamp + timedelta(minutes=3)
        end_time = start_time + timedelta(seconds=data['duration_seconds'])
        
        return f"""
INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{self.child_id}' ORDER BY created_at DESC LIMIT 1),
    '{self.child_id}',
    '{self.org_id}',
    '{start_time.isoformat()}+00',
    '{end_time.isoformat()}+00',
    {data['duration_seconds']},
    '{data['breathing_pattern']}',
    {data['cycles_completed']},
    false,
    '{data['notes']}',
    now()
);"""

    def generate_wellbeing_wheel_sql(self, timestamp: datetime, data: Dict) -> str:
        """Generate wellbeing wheel SQL"""
        start_time = timestamp + timedelta(minutes=5)
        end_time = start_time + timedelta(minutes=8)
        
        sql = f"""
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{self.child_id}' ORDER BY created_at DESC LIMIT 1),
    '{self.child_id}',
    '{self.org_id}',
    '{start_time.isoformat()}+00',
    '{end_time.isoformat()}+00',
    ARRAY{data['sections_completed']},
    {data['total_sections_completed']},
    {data['overall_score']},
    false,
    'completed',
    null,
    now(),
    now()
);"""
        
        # Add sections
        for section in data['sections']:
            section_time = start_time + timedelta(minutes=random.randint(1, 7))
            sql += f"""
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = '{self.child_id}' ORDER BY created_at DESC LIMIT 1),
    '{self.child_id}',
    '{section['section_name']}',
    '{section['mood_level']}',
    {section['mood_numeric']},
    '{section['text_response']}',
    {section['text_response_length']},
    '{section_time.isoformat()}+00',
    {section['time_to_complete_seconds']},
    now()
);"""
        
        return sql

    def generate_all_sessions(self) -> str:
        """Generate SQL for all 36 sessions"""
        sql_parts = ["""-- Emma's Complete 36-Session Journey - Generated by AI
-- Realistic progression from winter anxiety to spring confidence
-- Generated on: """ + datetime.now().strftime('%Y-%m-%d %H:%M:%S')]
        
        for session_num in range(6, 37):  # Sessions 6-36 (we already have 1-5)
            sql_parts.append(self.generate_session_sql(session_num))
        
        return '\n'.join(sql_parts)

def main():
    """Main function to generate and save Emma's journey"""
    generator = EmmaJourneyGenerator()
    
    print("🌟 Generating Emma's 36-session journey...")
    print("📊 This includes realistic emotional progression:")
    print("   • Crisis phase (Sessions 1-6): Winter anxiety")
    print("   • Stabilizing phase (Sessions 7-12): Finding routine")
    print("   • Building phase (Sessions 13-20): Friendship with James")
    print("   • Mastering phase (Sessions 21-28): Tool confidence")
    print("   • Thriving phase (Sessions 29-36): Spring leadership")
    
    # Generate all sessions
    sql_content = generator.generate_all_sessions()
    
    # Save to file
    filename = f"emma_journey_sessions_6_to_36_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print(f"✅ Generated {filename}")
    print(f"📝 Contains {len(sql_content.split('INSERT INTO'))-1} SQL insert statements")
    print("🚀 Ready to run in Supabase!")
    print("\n💡 To run this:")
    print(f"   1. Review the generated {filename}")
    print("   2. Run in Supabase SQL editor")
    print("   3. Verify with: SELECT COUNT(*) FROM checkin_sessions WHERE child_id = 'ce864083-bdf5-4ead-b56a-3c36208d3b69';")

if __name__ == "__main__":
    main()