#!/usr/bin/env python3
"""
The Lift - All Children Journey Generator
Generates complete 36-session journeys for all 30 children across 3 organizations
Based on authentic pen portraits and realistic progression patterns

Run with: claude code all_children_journey_generator.py
"""

import json
import uuid
from datetime import datetime, timedelta
from typing import Dict, List, Tuple, Optional
import random
from dataclasses import dataclass
from enum import Enum

class OrganizationType(Enum):
    HOSPITAL = "hospital"
    SCHOOL = "school" 
    CLINIC = "clinic"

@dataclass
class Child:
    name: str
    age: int
    gender: str
    child_id: str
    org_id: str
    org_type: OrganizationType
    condition: str
    personality: str
    journey_theme: str
    usage_pattern: str  # "1x", "3x", "5x" per week

class AllChildrenJourneyGenerator:
    def __init__(self):
        self.organizations = {
            'hospital': '7eab219a-7c83-406c-a6b2-75ed44de715b',
            'school': '5f910546-8bdc-44ca-b776-fdd5eb5cccd9',
            'clinic': '0e233a3b-e007-4eae-a9a5-4586c59b2faf'
        }
        
        # All 30 children from the pen portraits
        self.children = self.load_all_children()
        
        # Common emotional vocabulary by age and context
        self.emotional_frameworks = self.load_emotional_frameworks()
        
        # Journey patterns by organization type and individual needs
        self.journey_patterns = self.load_journey_patterns()

    def load_all_children(self) -> List[Child]:
        """Load all 30 children from the pen portraits"""
        return [
            # Hospital Children
            Child("Emma", 7, "F", "ce864083-bdf5-4ead-b56a-3c36208d3b69", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "asthma", "gentle_thoughtful", "breathing_confidence", "3x"),
            Child("Aisha", 8, "F", "aaaabbbb-cccc-dddd-eeee-111111111111", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "diabetes", "determined_independent", "routine_mastery", "1x"),
            Child("Kai", 7, "M", "aaaabbbb-cccc-dddd-eeee-111111111112", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "surgery_recovery", "anxious_articulate", "trauma_healing", "5x"),
            Child("Mia", 9, "F", "aaaabbbb-cccc-dddd-eeee-111111111113", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "chronic_kidney", "resilient_responsible", "advocacy_growth", "3x"),
            Child("Ethan", 10, "M", "aaaabbbb-cccc-dddd-eeee-111111111114", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "leukemia", "optimistic_social", "friendship_maintenance", "3x"),
            Child("Zara", 6, "F", "aaaabbbb-cccc-dddd-eeee-111111111115", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "accident_trauma", "withdrawn_creative", "gradual_opening", "1x"),
            Child("Lucas", 11, "M", "aaaabbbb-cccc-dddd-eeee-111111111116", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "depression_anxiety", "intelligent_burdened", "family_adjustment", "5x"),
            Child("Amara", 8, "F", "aaaabbbb-cccc-dddd-eeee-111111111117", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "heart_condition", "gentle_empathetic", "activity_confidence", "1x"),
            
            # School Children  
            Child("Oliver", 8, "M", "aaaabbbb-cccc-dddd-eeee-222222222221", self.organizations['school'], 
                  OrganizationType.SCHOOL, "dyslexia", "creative_frustrated", "academic_confidence", "3x"),
            Child("Jayden", 7, "M", "aaaabbbb-cccc-dddd-eeee-222222222222", self.organizations['school'], 
                  OrganizationType.SCHOOL, "adhd_traits", "energetic_overwhelming", "focus_development", "5x"),
            Child("Sophia", 9, "F", "aaaabbbb-cccc-dddd-eeee-222222222223", self.organizations['school'], 
                  OrganizationType.SCHOOL, "high_achiever_anxiety", "perfectionist_pressured", "balance_learning", "1x"),
            Child("Tyler", 10, "M", "aaaabbbb-cccc-dddd-eeee-222222222224", self.organizations['school'], 
                  OrganizationType.SCHOOL, "social_struggles", "quiet_observant", "connection_building", "3x"),
            Child("Ava", 8, "F", "aaaabbbb-cccc-dddd-eeee-222222222225", self.organizations['school'], 
                  OrganizationType.SCHOOL, "family_separation", "sensitive_resilient", "stability_growth", "5x"),
            Child("Noah", 6, "M", "aaaabbbb-cccc-dddd-eeee-222222222226", self.organizations['school'], 
                  OrganizationType.SCHOOL, "summer_born", "sweet_developing", "confidence_building", "1x"),
            Child("Isla", 11, "F", "aaaabbbb-cccc-dddd-eeee-222222222227", self.organizations['school'], 
                  OrganizationType.SCHOOL, "leadership_pressure", "popular_stressed", "transition_preparation", "1x"),
            Child("Ravi", 9, "M", "aaaabbbb-cccc-dddd-eeee-222222222228", self.organizations['school'], 
                  OrganizationType.SCHOOL, "bilingual_confidence", "thoughtful_cultural", "identity_celebration", "3x"),
            
            # Clinic Children
            Child("Sebastian", 9, "M", "aaaabbbb-cccc-dddd-eeee-333333333331", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "autism_social", "intelligent_routine", "communication_growth", "3x"),
            Child("Lily", 8, "F", "aaaabbbb-cccc-dddd-eeee-333333333332", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "autism_sensory", "quiet_observant", "environment_mastery", "1x"),
            Child("Charlie", 10, "M", "aaaabbbb-cccc-dddd-eeee-333333333333", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "selective_mutism", "articulate_silent", "voice_emergence", "5x"),
            Child("Maya", 7, "F", "aaaabbbb-cccc-dddd-eeee-333333333334", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "anxiety_perfectionism", "bright_worried", "worry_management", "3x"),
            Child("Oscar", 11, "M", "aaaabbbb-cccc-dddd-eeee-333333333335", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "dyspraxia", "determined_adaptive", "tool_mastery", "1x"),
            Child("Ruby", 9, "F", "aaaabbbb-cccc-dddd-eeee-333333333336", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "high_sensitivity", "empathetic_intense", "regulation_artistry", "5x"),
            Child("Finn", 6, "M", "aaaabbbb-cccc-dddd-eeee-333333333337", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "developmental_delays", "happy_determined", "milestone_celebration", "1x"),
            Child("Zoe", 10, "F", "aaaabbbb-cccc-dddd-eeee-333333333338", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "gifted_social", "intellectual_seeking", "peer_discovery", "3x"),
            
            # Additional children to reach 30 total
            Child("Ben", 8, "M", "aaaabbbb-cccc-dddd-eeee-111111111118", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "chronic_pain", "brave_tired", "pain_management", "3x"),
            Child("Chloe", 9, "F", "aaaabbbb-cccc-dddd-eeee-111111111119", self.organizations['hospital'], 
                  OrganizationType.HOSPITAL, "eating_disorder", "controlled_fearful", "nutrition_healing", "5x"),
            Child("Dex", 7, "M", "aaaabbbb-cccc-dddd-eeee-222222222229", self.organizations['school'], 
                  OrganizationType.SCHOOL, "selective_mutism_school", "creative_silent", "classroom_voice", "3x"),
            Child("Evie", 10, "F", "aaaabbbb-cccc-dddd-eeee-222222222230", self.organizations['school'], 
                  OrganizationType.SCHOOL, "friendship_drama", "social_complex", "peer_navigation", "1x"),
            Child("Felix", 6, "M", "aaaabbbb-cccc-dddd-eeee-333333333339", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "speech_delay", "patient_progressing", "communication_breakthrough", "3x"),
            Child("Grace", 11, "F", "aaaabbbb-cccc-dddd-eeee-333333333340", self.organizations['clinic'], 
                  OrganizationType.CLINIC, "ocd_tendencies", "meticulous_anxious", "flexibility_growth", "5x")
        ]

    def load_emotional_frameworks(self) -> Dict:
        """Load age-appropriate emotional frameworks"""
        return {
            6: {
                'vocabulary': ['happy', 'sad', 'mad', 'scared', 'excited', 'worried'],
                'expression_length': (15, 45),
                'complexity': 'simple'
            },
            7: {
                'vocabulary': ['happy', 'sad', 'angry', 'worried', 'excited', 'frustrated', 'calm'],
                'expression_length': (20, 60),
                'complexity': 'developing'
            },
            8: {
                'vocabulary': ['joyful', 'disappointed', 'anxious', 'confident', 'frustrated', 'peaceful', 'nervous'],
                'expression_length': (25, 80),
                'complexity': 'expanding'
            },
            9: {
                'vocabulary': ['grateful', 'overwhelmed', 'determined', 'conflicted', 'proud', 'embarrassed', 'hopeful'],
                'expression_length': (30, 100),
                'complexity': 'nuanced'
            },
            10: {
                'vocabulary': ['resilient', 'ambivalent', 'empowered', 'vulnerable', 'optimistic', 'skeptical', 'compassionate'],
                'expression_length': (35, 120),
                'complexity': 'sophisticated'
            },
            11: {
                'vocabulary': ['introspective', 'conflicted', 'autonomous', 'empathetic', 'analytical', 'philosophical', 'wise'],
                'expression_length': (40, 140),
                'complexity': 'advanced'
            }
        }

    def load_journey_patterns(self) -> Dict:
        """Load journey patterns by organization and condition type"""
        return {
            'hospital': {
                'phases': ['medical_crisis', 'treatment_adjustment', 'coping_development', 'routine_mastery', 'advocacy_growth'],
                'focus_areas': ['my_health', 'my_family', 'my_safety', 'my_emotions'],
                'breathing_importance': 'high',
                'adult_conversation_need': 'high'
            },
            'school': {
                'phases': ['academic_challenge', 'support_discovery', 'skill_building', 'confidence_growth', 'peer_leadership'],
                'focus_areas': ['my_work', 'my_friends', 'my_emotions', 'my_fun_play'],
                'breathing_importance': 'medium',
                'adult_conversation_need': 'medium'
            },
            'clinic': {
                'phases': ['assessment_period', 'strategy_learning', 'skill_practice', 'integration', 'independence'],
                'focus_areas': ['my_emotions', 'my_friends', 'my_safety', 'my_health'],
                'breathing_importance': 'high',
                'adult_conversation_need': 'very_high'
            }
        }

    def get_usage_pattern_schedule(self, usage_pattern: str) -> List[int]:
        """Get which days of each week to have sessions based on usage pattern"""
        if usage_pattern == "1x":
            return [0]  # Mondays only
        elif usage_pattern == "3x":
            return [0, 2, 4]  # Monday, Wednesday, Friday
        elif usage_pattern == "5x":
            return [0, 1, 2, 3, 4]  # Monday through Friday
        else:
            return [0, 2, 4]  # Default to 3x

    def calculate_total_sessions(self, usage_pattern: str) -> int:
        """Calculate total sessions from Jan-Mar based on usage pattern"""
        weekly_sessions = len(self.get_usage_pattern_schedule(usage_pattern))
        # 12 weeks from January 6 to March 28, 2025
        return weekly_sessions * 12

    def generate_child_timestamps(self, child: Child) -> List[datetime]:
        """Generate realistic timestamps for a child based on their usage pattern"""
        schedule = self.get_usage_pattern_schedule(child.usage_pattern)
        total_sessions = self.calculate_total_sessions(child.usage_pattern)
        
        timestamps = []
        start_date = datetime(2025, 1, 6)  # Monday, January 6, 2025
        
        session_count = 0
        week = 0
        
        while session_count < total_sessions and week < 12:
            for day_offset in schedule:
                if session_count >= total_sessions:
                    break
                    
                session_date = start_date + timedelta(days=week * 7 + day_offset)
                
                # Add realistic time variation based on organization
                if child.org_type == OrganizationType.HOSPITAL:
                    # Hospital sessions more variable due to medical schedules
                    hour = random.randint(10, 18)
                    minute = random.randint(0, 59)
                elif child.org_type == OrganizationType.SCHOOL:
                    # School sessions typically after school
                    hour = random.randint(15, 17)
                    minute = random.choice([0, 15, 30, 45])
                else:  # CLINIC
                    # Clinic sessions scheduled more precisely
                    hour = random.randint(14, 16)
                    minute = random.choice([0, 30])
                
                session_time = session_date.replace(hour=hour, minute=minute)
                timestamps.append(session_time)
                session_count += 1
            
            week += 1
        
        return timestamps

    def generate_child_journey_phases(self, child: Child) -> List[str]:
        """Generate journey phases specific to each child's condition and context"""
        base_phases = self.journey_patterns[child.org_type.value]['phases']
        
        # Customize phases based on specific conditions
        if child.condition == "asthma":
            return ['winter_crisis', 'breathing_learning', 'routine_building', 'peer_support', 'spring_confidence']
        elif child.condition == "diabetes":
            return ['routine_disruption', 'management_learning', 'control_building', 'independence_growth', 'mastery_confidence']
        elif child.condition == "dyslexia":
            return ['assessment_clarity', 'support_discovery', 'strategy_learning', 'confidence_building', 'academic_success']
        elif child.condition == "autism_social":
            return ['routine_establishment', 'communication_growth', 'peer_understanding', 'skill_integration', 'social_confidence']
        else:
            return base_phases

    def generate_mood_progression(self, child: Child, phase: str, session_in_phase: int, total_in_phase: int) -> int:
        """Generate realistic mood progression for a child in a specific phase"""
        # Base mood patterns by condition type
        condition_baselines = {
            'asthma': [2, 2, 3, 3, 4],
            'diabetes': [3, 3, 3, 4, 4],
            'dyslexia': [2, 3, 3, 4, 4],
            'autism_social': [3, 3, 4, 4, 4],
            'anxiety_perfectionism': [2, 2, 3, 3, 4],
            'high_sensitivity': [2, 3, 3, 4, 5],
            'default': [3, 3, 3, 4, 4]
        }
        
        base_mood = condition_baselines.get(child.condition, condition_baselines['default'])
        phase_index = min(len(base_mood) - 1, len(phase) // 2)
        
        # Progress within phase
        progress_factor = session_in_phase / total_in_phase
        mood = base_mood[phase_index] + (progress_factor * 0.5)
        
        # Add personality variations
        if 'anxious' in child.personality:
            mood -= 0.3
        elif 'optimistic' in child.personality:
            mood += 0.3
        elif 'determined' in child.personality:
            mood += 0.2
        
        # Add age-appropriate variations
        if child.age <= 7:
            mood += random.uniform(-0.5, 0.5)
        else:
            mood += random.uniform(-0.3, 0.3)
        
        return max(1, min(5, round(mood)))

    def generate_child_specific_content(self, child: Child, phase: str, mood: int) -> Dict:
        """Generate authentic content specific to each child's voice and condition"""
        
        # Get age-appropriate framework
        framework = self.emotional_frameworks[child.age]
        
        # Generate mood notes based on child's specific situation
        mood_notes = self.generate_mood_notes(child, phase, mood)
        
        # Generate emotion explanation based on child's verbal ability and condition
        emotion_explanation = self.generate_emotion_explanation(child, phase, mood)
        
        # Generate wellbeing responses based on child's focus areas
        wellbeing_responses = self.generate_wellbeing_responses(child, phase, mood)
        
        return {
            'mood_notes': mood_notes,
            'emotion_explanation': emotion_explanation,
            'wellbeing_responses': wellbeing_responses,
            'vocabulary_level': framework['complexity'],
            'expression_length': framework['expression_length']
        }

    def generate_mood_notes(self, child: Child, phase: str, mood: int) -> str:
        """Generate authentic mood notes for each child"""
        
        # Child-specific mood expressions
        expressions = {
            'Emma': {
                'low': "breathing feels hard today",
                'medium': "getting better at the breathing exercises",
                'high': "can help other kids with breathing now"
            },
            'Oliver': {
                'low': "reading was really hard today",
                'medium': "new strategies are helping a bit",
                'high': "reading is getting easier with support"
            },
            'Sebastian': {
                'low': "too many changes today",
                'medium': "routine is helping me feel safer",
                'high': "making good friends who understand me"
            }
        }
        
        if child.name in expressions:
            if mood <= 2:
                return expressions[child.name]['low']
            elif mood <= 3:
                return expressions[child.name]['medium']
            else:
                return expressions[child.name]['high']
        
        # Generic expressions based on condition
        if mood <= 2:
            return f"having a tough day with {child.condition.replace('_', ' ')}"
        elif mood <= 3:
            return f"learning to manage {child.condition.replace('_', ' ')} better"
        else:
            return f"feeling confident about {child.condition.replace('_', ' ')}"

    def generate_emotion_explanation(self, child: Child, phase: str, mood: int) -> str:
        """Generate authentic emotion explanations for each child"""
        
        framework = self.emotional_frameworks[child.age]
        min_length, max_length = framework['expression_length']
        
        # Base explanation on child's condition and current phase
        base_explanations = {
            'asthma': {
                'winter_crisis': "worried about catching cold and making breathing worse",
                'breathing_learning': "practicing breathing exercises helps when chest feels tight",
                'spring_confidence': "feel like breathing expert now, helping other kids learn"
            },
            'dyslexia': {
                'assessment_clarity': "finally understand why reading is hard for me",
                'support_discovery': "getting special help makes me feel less stupid",
                'academic_success': "reading is still hard but i have tools to help"
            }
        }
        
        # Get base explanation
        explanation = base_explanations.get(child.condition, {}).get(phase, 
            f"learning to handle {child.condition.replace('_', ' ')} better each day")
        
        # Adjust length based on age and personality
        if child.age <= 7:
            # Simpler, shorter expressions
            words = explanation.split()[:8]
            explanation = ' '.join(words)
        elif child.age >= 10:
            # More sophisticated expressions
            if 'intelligent' in child.personality:
                explanation += ". i understand more about myself now"
        
        return explanation

    def generate_wellbeing_responses(self, child: Child, phase: str, mood: int) -> Dict:
        """Generate wellbeing wheel responses for each child"""
        
        focus_areas = self.journey_patterns[child.org_type.value]['focus_areas']
        responses = {}
        
        for area in ['my_friends', 'my_work', 'my_health', 'my_family', 'my_fun_play', 'my_safety', 'my_emotions']:
            if area in focus_areas:
                score = mood + random.randint(-1, 1)
            else:
                score = mood + random.randint(-2, 1)
            
            score = max(1, min(5, score))
            
            # Generate child-specific response
            response = self.generate_area_response(child, area, score)
            responses[area] = {
                'score': score,
                'response': response
            }
        
        return responses

    def generate_area_response(self, child: Child, area: str, score: int) -> str:
        """Generate specific responses for wellbeing wheel areas"""
        
        responses = {
            'my_health': {
                'Emma': {1: "breathing is really hard", 3: "learning to manage asthma", 5: "feel healthy and strong"},
                'Oliver': {1: "frustrated with reading", 3: "getting support helps", 5: "proud of my progress"},
                'default': {1: "struggling today", 3: "getting better", 5: "feeling good"}
            },
            'my_friends': {
                'Emma': {1: "worried friends will avoid me", 3: "james understands my asthma", 5: "love helping friends"},
                'Tyler': {1: "hard to make friends", 3: "social group helping", 5: "have good friends now"},
                'default': {1: "lonely sometimes", 3: "making friends", 5: "love my friends"}
            }
        }
        
        child_responses = responses.get(area, {}).get(child.name, responses.get(area, {}).get('default', {}))
        
        if score <= 2:
            return child_responses.get(1, f"challenging with {area.replace('my_', '')}")
        elif score <= 3:
            return child_responses.get(3, f"improving with {area.replace('my_', '')}")
        else:
            return child_responses.get(5, f"happy with {area.replace('my_', '')}")

    def generate_session_sql(self, child: Child, session_num: int, timestamp: datetime) -> str:
        """Generate complete SQL for one child's session"""
        
        # Determine current phase
        total_sessions = self.calculate_total_sessions(child.usage_pattern)
        phases = self.generate_child_journey_phases(child)
        sessions_per_phase = total_sessions // len(phases)
        current_phase_index = min(session_num // sessions_per_phase, len(phases) - 1)
        current_phase = phases[current_phase_index]
        session_in_phase = session_num % sessions_per_phase
        
        # Generate mood and content
        mood = self.generate_mood_progression(child, current_phase, session_in_phase, sessions_per_phase)
        content = self.generate_child_specific_content(child, current_phase, mood)
        
        # Determine tools for this session
        tools = ['mood_meter']
        if session_num % 2 == 0:
            tools.append('emotion_grid')
        if session_num % 3 == 1:
            tools.append('breathing_tool')
        if session_num % 4 == 0:
            tools.append('wellbeing_wheel')
        
        # Build SQL
        completion_time = timestamp + timedelta(minutes=random.randint(8, 25))
        
        sql_parts = [f"""
-- {child.name} Session {session_num}: {timestamp.strftime('%b %d')} - {current_phase.replace('_', ' ').title()} phase
INSERT INTO public.checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '{child.child_id}',
    '{child.org_id}', 
    '{timestamp.isoformat()}+00', 
    '{completion_time.isoformat()}+00', 
    'completed', 
    ARRAY{tools}, 
    now(), 
    now()
);"""]
        
        # Mood meter
        mood_levels = ['', 'very_sad', 'sad', 'ok', 'happy', 'very_happy']
        mood_time = timestamp + timedelta(minutes=1)
        sql_parts.append(f"""
INSERT INTO public.mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{child.child_id}' ORDER BY created_at DESC LIMIT 1), 
    '{child.child_id}', 
    '{child.org_id}', 
    '{mood_levels[mood]}', 
    {mood}, 
    '{mood_time.isoformat()}+00', 
    {random.randint(5, 30)}, 
    false, 
    '{content['mood_notes']}', 
    now()
);""")
        
        # Add other tools as needed
        if 'emotion_grid' in tools:
            sql_parts.append(self.generate_emotion_grid_sql(child, timestamp, content))

        if 'breathing_tool' in tools:
            sql_parts.append(self.generate_breathing_tool_sql(child, timestamp, current_phase))

        if 'wellbeing_wheel' in tools:
            sql_parts.append(self.generate_wellbeing_wheel_sql(child, timestamp, content))
        
        return '\n'.join(sql_parts)

    def generate_emotion_grid_sql(self, child: Child, timestamp: datetime, content: Dict) -> str:
        """Generate emotion grid SQL for child"""
        start_time = timestamp + timedelta(minutes=2)
        end_time = start_time + timedelta(minutes=random.randint(3, 10))
        
        wants_conversation = child.org_type == OrganizationType.CLINIC or child.age <= 7
        
        sql = f"""
INSERT INTO public.emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{child.child_id}' ORDER BY created_at DESC LIMIT 1), 
    '{child.child_id}', 
    '{child.org_id}', 
    '{start_time.isoformat()}+00', 
    '{end_time.isoformat()}+00', 
    3, 
    '{content['emotion_explanation']}', 
    {len(content['emotion_explanation'])}, 
    '{"speech_to_text" if child.age <= 7 else "typing"}', 
    false, 
    'completed', 
    null,
    now(), 
    now(),
    {str(wants_conversation).lower()}
);"""
        
        # Add emotions
        framework = self.emotional_frameworks[child.age]
        emotions = random.sample(framework['vocabulary'], 3)
        
        for i, emotion in enumerate(emotions, 1):
            feeling_time = start_time + timedelta(minutes=i)
            sql += f"""
INSERT INTO public.emotion_grid_feelings (id, emotion_grid_id, child_id, feeling_name, feeling_category, feeling_emoji, feeling_description, selection_order, selected_at, created_at)
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.emotion_grid_usage WHERE child_id = '{child.child_id}' ORDER BY created_at DESC LIMIT 1), 
    '{child.child_id}', 
    '{emotion}', 
    'high-energy-comfortable', 
    '😊', 
    'feeling {emotion}', 
    {i}, 
    '{feeling_time.isoformat()}+00', 
    now()
);"""
        
        return sql

    def generate_breathing_tool_sql(self, child: Child, timestamp: datetime, phase: str) -> str:
        """Generate breathing tool SQL for child"""
        start_time = timestamp + timedelta(minutes=3)
        
        # Breathing ability based on age and condition
        if child.condition == "asthma":
            base_duration = 120
            base_cycles = 6
        elif child.age <= 7:
            base_duration = 90
            base_cycles = 4
        else:
            base_duration = 150
            base_cycles = 8
        
        # Progression over time
        if 'crisis' in phase:
            duration = base_duration // 2
            cycles = base_cycles // 2
        elif 'mastery' in phase or 'confidence' in phase:
            duration = base_duration * 2
            cycles = base_cycles * 2
        else:
            duration = base_duration
            cycles = base_cycles
        
        end_time = start_time + timedelta(seconds=duration)
        
        patterns = ['basic_inhale_exhale', 'guided_4_7_8', 'box_breathing']
        pattern = random.choice(patterns)
        
        return f"""
INSERT INTO public.breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{child.child_id}' ORDER BY created_at DESC LIMIT 1), 
    '{child.child_id}', 
    '{child.org_id}', 
    '{start_time.isoformat()}+00', 
    '{end_time.isoformat()}+00', 
    {duration}, 
    '{pattern}', 
    {cycles}, 
    false,
    'breathing exercises helping me feel calmer', 
    now()
);"""

    def generate_wellbeing_wheel_sql(self, child: Child, timestamp: datetime, content: Dict) -> str:
        """Generate wellbeing wheel SQL for child"""
        start_time = timestamp + timedelta(minutes=5)
        end_time = start_time + timedelta(minutes=random.randint(6, 12))
        
        responses = content['wellbeing_responses']
        sections = list(responses.keys())
        total_score = sum(responses[s]['score'] for s in sections)
        overall_score = round(total_score / len(sections), 2)
        
        sql = f"""
INSERT INTO public.wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, sections_completed, total_sections_completed, overall_score, was_skipped, completion_status, notes, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    (SELECT id FROM public.checkin_sessions WHERE child_id = '{child.child_id}' ORDER BY created_at DESC LIMIT 1), 
    '{child.child_id}', 
    '{child.org_id}', 
    '{start_time.isoformat()}+00', 
    '{end_time.isoformat()}+00', 
    ARRAY{sections}, 
    {len(sections)}, 
    {overall_score}, 
    false,
    'completed', 
    null,
    now(), 
    now()
);"""
        
        # Add sections
        mood_levels = ['', 'very_sad', 'sad', 'ok', 'happy', 'very_happy']
        for section in sections:
            section_time = start_time + timedelta(minutes=random.randint(1, 8))
            response_data = responses[section]
            sql += f"""
INSERT INTO public.wellbeing_wheel_sections (id, wellbeing_wheel_id, child_id, section_name, mood_level, mood_numeric, text_response, text_response_length, completed_at, time_to_complete_seconds, created_at)
VALUES (
    gen_random_uuid(), 
    (SELECT id FROM public.wellbeing_wheel_usage WHERE child_id = '{child.child_id}' ORDER BY created_at DESC LIMIT 1), 
    '{child.child_id}', 
    '{section}', 
    '{mood_levels[response_data['score']]}', 
    {response_data['score']}, 
    '{response_data['response']}', 
    {len(response_data['response'])}, 
    '{section_time.isoformat()}+00', 
    {random.randint(20, 60)}, 
    now()
);"""
        
        return sql

    def generate_child_complete_journey(self, child: Child) -> str:
        """Generate complete journey for one child"""
        timestamps = self.generate_child_timestamps(child)
        total_sessions = len(timestamps)
        
        sql_parts = [f"""
-- {child.name}'s Complete Journey ({total_sessions} sessions)
-- Age: {child.age}, Condition: {child.condition.replace('_', ' ').title()}
-- Organization: {child.org_type.value.title()}
-- Usage Pattern: {child.usage_pattern} per week
-- Journey Theme: {child.journey_theme.replace('_', ' ').title()}"""]
        
        for session_num, timestamp in enumerate(timestamps, 1):
            sql_parts.append(self.generate_session_sql(child, session_num, timestamp))
        
        return '\n'.join(sql_parts)

    def generate_all_children_journeys(self) -> str:
        """Generate complete journeys for all 30 children"""
        sql_parts = [f"""-- The Lift - All Children Complete Journeys
-- Generated on: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- Total Children: {len(self.children)}
-- Organizations: Hospital, School, Clinic
-- Period: January - March 2025
-- Authentic progression patterns based on pen portraits"""]
        
        for child in self.children:
            print(f"Generating journey for {child.name} ({child.condition})...")
            sql_parts.append(self.generate_child_complete_journey(child))
        
        return '\n'.join(sql_parts)

def main():
    """Main function to generate all children's journeys"""
    generator = AllChildrenJourneyGenerator()
    
    print("🌟 Generating complete journeys for all 30 children...")
    print(f"📊 Organizations: Hospital ({len([c for c in generator.children if c.org_type == OrganizationType.HOSPITAL])} children)")
    print(f"📊 Organizations: School ({len([c for c in generator.children if c.org_type == OrganizationType.SCHOOL])} children)")
    print(f"📊 Organizations: Clinic ({len([c for c in generator.children if c.org_type == OrganizationType.CLINIC])} children)")
    print("📅 Period: January - March 2025")
    print("🎭 Usage patterns: 1x, 3x, and 5x per week")
    
    # Generate all journeys
    sql_content = generator.generate_all_children_journeys()
    
    # Save to file
    filename = f"all_children_complete_journeys_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    total_sessions = sum(generator.calculate_total_sessions(child.usage_pattern) for child in generator.children)
    
    print(f"✅ Generated {filename}")
    print(f"📝 Total sessions across all children: {total_sessions}")
    print(f"🎯 Each child has authentic progression based on their condition")
    print(f"💬 Age-appropriate language and emotional development")
    print("🚀 Ready to run in Supabase!")
    
    print("\n💡 To run this:")
    print(f"   1. Review the generated {filename}")
    print("   2. Run in Supabase SQL editor (may need to run in chunks)")
    print("   3. Verify with: SELECT child_id, COUNT(*) FROM checkin_sessions GROUP BY child_id;")

if __name__ == "__main__":
    main()