export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      organisations: {
        Row: {
          id: string
          name: string
          type: 'school-primary' | 'school-secondary' | 'academy-trust' | 'clinic-private' | 'nhs-trust' | 'hospital' | 'charity' | 'other'
          address_line_1: string | null
          address_line_2: string | null
          city: string | null
          postcode: string | null
          country: string
          phone: string | null
          email: string | null
          website: string | null
          status: 'active' | 'inactive' | 'trial' | 'suspended'
          subscription_plan: 'essential' | 'professional' | 'enterprise'
          max_children: number
          max_practitioners: number
          settings: Json
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          type: 'school-primary' | 'school-secondary' | 'academy-trust' | 'clinic-private' | 'nhs-trust' | 'hospital' | 'charity' | 'other'
          address_line_1?: string | null
          address_line_2?: string | null
          city?: string | null
          postcode?: string | null
          country?: string
          phone?: string | null
          email?: string | null
          website?: string | null
          status?: 'active' | 'inactive' | 'trial' | 'suspended'
          subscription_plan?: 'essential' | 'professional' | 'enterprise'
          max_children?: number
          max_practitioners?: number
          settings?: Json
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          type?: 'school-primary' | 'school-secondary' | 'academy-trust' | 'clinic-private' | 'nhs-trust' | 'hospital' | 'charity' | 'other'
          address_line_1?: string | null
          address_line_2?: string | null
          city?: string | null
          postcode?: string | null
          country?: string
          phone?: string | null
          email?: string | null
          website?: string | null
          status?: 'active' | 'inactive' | 'trial' | 'suspended'
          subscription_plan?: 'essential' | 'professional' | 'enterprise'
          max_children?: number
          max_practitioners?: number
          settings?: Json
          created_at?: string
          updated_at?: string
        }
      }
      profiles: {
        Row: {
          id: string
          email: string
          name: string
          role: 'Account' | 'GroupContact' | 'Practitioner' | 'Child'
          org_id: string | null
          status: 'active' | 'inactive' | 'pending' | 'suspended'
          avatar_url: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id: string
          email: string
          name: string
          role: 'Account' | 'GroupContact' | 'Practitioner' | 'Child'
          org_id?: string | null
          status?: 'active' | 'inactive' | 'pending' | 'suspended'
          avatar_url?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          email?: string
          name?: string
          role?: 'Account' | 'GroupContact' | 'Practitioner' | 'Child'
          org_id?: string | null
          status?: 'active' | 'inactive' | 'pending' | 'suspended'
          avatar_url?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      checkin_sessions: {
        Row: {
          id: string
          child_id: string
          org_id: string
          started_at: string
          completed_at: string | null
          status: 'in_progress' | 'completed' | 'abandoned'
          tools_completed: string[]
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          child_id: string
          org_id: string
          started_at?: string
          completed_at?: string | null
          status?: 'in_progress' | 'completed' | 'abandoned'
          tools_completed?: string[]
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          org_id?: string
          started_at?: string
          completed_at?: string | null
          status?: 'in_progress' | 'completed' | 'abandoned'
          tools_completed?: string[]
          created_at?: string
          updated_at?: string
        }
      }
      breathing_tool_usage: {
        Row: {
          id: string
          session_id: string
          child_id: string
          org_id: string
          started_at: string
          completed_at: string | null
          duration_seconds: number | null
          breathing_pattern: string | null
          cycles_completed: number
          was_skipped: boolean
          notes: string | null
          created_at: string
        }
        Insert: {
          id?: string
          session_id: string
          child_id: string
          org_id: string
          started_at?: string
          completed_at?: string | null
          duration_seconds?: number | null
          breathing_pattern?: string | null
          cycles_completed?: number
          was_skipped?: boolean
          notes?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          session_id?: string
          child_id?: string
          org_id?: string
          started_at?: string
          completed_at?: string | null
          duration_seconds?: number | null
          breathing_pattern?: string | null
          cycles_completed?: number
          was_skipped?: boolean
          notes?: string | null
          created_at?: string
        }
      }
      mood_meter_usage: {
        Row: {
          id: string
          session_id: string
          child_id: string
          org_id: string
          mood_level: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          mood_numeric: number
          selected_at: string
          time_to_select_seconds: number | null
          was_skipped: boolean
          notes: string | null
          created_at: string
        }
        Insert: {
          id?: string
          session_id: string
          child_id: string
          org_id: string
          mood_level: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          mood_numeric: number
          selected_at?: string
          time_to_select_seconds?: number | null
          was_skipped?: boolean
          notes?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          session_id?: string
          child_id?: string
          org_id?: string
          mood_level?: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          mood_numeric?: number
          selected_at?: string
          time_to_select_seconds?: number | null
          was_skipped?: boolean
          notes?: string | null
          created_at?: string
        }
      }
      emotion_grid_usage: {
        Row: {
          id: string
          session_id: string
          child_id: string
          org_id: string
          started_at: string
          completed_at: string | null
          step_completed: number
          explanation_text: string | null
          explanation_length: number
          input_method: 'typing' | 'speech_to_text' | 'mixed' | null
          was_skipped: boolean
          completion_status: 'in_progress' | 'completed' | 'abandoned'
          notes: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          session_id: string
          child_id: string
          org_id: string
          started_at?: string
          completed_at?: string | null
          step_completed?: number
          explanation_text?: string | null
          explanation_length?: number
          input_method?: 'typing' | 'speech_to_text' | 'mixed' | null
          was_skipped?: boolean
          completion_status?: 'in_progress' | 'completed' | 'abandoned'
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          session_id?: string
          child_id?: string
          org_id?: string
          started_at?: string
          completed_at?: string | null
          step_completed?: number
          explanation_text?: string | null
          explanation_length?: number
          input_method?: 'typing' | 'speech_to_text' | 'mixed' | null
          was_skipped?: boolean
          completion_status?: 'in_progress' | 'completed' | 'abandoned'
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      emotion_grid_feelings: {
        Row: {
          id: string
          emotion_grid_id: string
          child_id: string
          feeling_name: string
          feeling_category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          feeling_emoji: string
          feeling_description: string
          selection_order: number
          selected_at: string
          created_at: string
        }
        Insert: {
          id?: string
          emotion_grid_id: string
          child_id: string
          feeling_name: string
          feeling_category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          feeling_emoji: string
          feeling_description: string
          selection_order: number
          selected_at?: string
          created_at?: string
        }
        Update: {
          id?: string
          emotion_grid_id?: string
          child_id?: string
          feeling_name?: string
          feeling_category?: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          feeling_emoji?: string
          feeling_description?: string
          selection_order?: number
          selected_at?: string
          created_at?: string
        }
      }
      feeling_definitions: {
        Row: {
          id: string
          name: string
          description: string
          category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          emoji: string
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          description: string
          category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          emoji: string
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          description?: string
          category?: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          emoji?: string
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      wellbeing_wheel_usage: {
        Row: {
          id: string
          session_id: string
          child_id: string
          org_id: string
          started_at: string
          completed_at: string | null
          sections_completed: string[]
          total_sections_completed: number
          overall_score: number | null
          was_skipped: boolean
          completion_status: 'in_progress' | 'completed' | 'abandoned'
          notes: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          session_id: string
          child_id: string
          org_id: string
          started_at?: string
          completed_at?: string | null
          sections_completed?: string[]
          total_sections_completed?: number
          overall_score?: number | null
          was_skipped?: boolean
          completion_status?: 'in_progress' | 'completed' | 'abandoned'
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          session_id?: string
          child_id?: string
          org_id?: string
          started_at?: string
          completed_at?: string | null
          sections_completed?: string[]
          total_sections_completed?: number
          overall_score?: number | null
          was_skipped?: boolean
          completion_status?: 'in_progress' | 'completed' | 'abandoned'
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      wellbeing_wheel_sections: {
        Row: {
          id: string
          wellbeing_wheel_id: string
          child_id: string
          section_name: 'my_friends' | 'my_work' | 'my_health' | 'my_family' | 'my_fun_play' | 'my_safety' | 'my_emotions'
          mood_level: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          mood_numeric: number
          text_response: string | null
          text_response_length: number
          completed_at: string
          time_to_complete_seconds: number | null
          created_at: string
        }
        Insert: {
          id?: string
          wellbeing_wheel_id: string
          child_id: string
          section_name: 'my_friends' | 'my_work' | 'my_health' | 'my_family' | 'my_fun_play' | 'my_safety' | 'my_emotions'
          mood_level: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          mood_numeric: number
          text_response?: string | null
          text_response_length?: number
          completed_at?: string
          time_to_complete_seconds?: number | null
          created_at?: string
        }
        Update: {
          id?: string
          wellbeing_wheel_id?: string
          child_id?: string
          section_name?: 'my_friends' | 'my_work' | 'my_health' | 'my_family' | 'my_fun_play' | 'my_safety' | 'my_emotions'
          mood_level?: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          mood_numeric?: number
          text_response?: string | null
          text_response_length?: number
          completed_at?: string
          time_to_complete_seconds?: number | null
          created_at?: string
        }
      }
      child_profile_scores: {
        Row: {
          id: string
          child_id: string
          org_id: string
          score_date: string
          score_period: 'daily' | 'weekly' | 'monthly'
          mood_meter_avg: number | null
          mood_meter_count: number
          wellbeing_wheel_avg: number | null
          wellbeing_wheel_count: number
          friends_avg: number | null
          work_avg: number | null
          health_avg: number | null
          family_avg: number | null
          fun_play_avg: number | null
          safety_avg: number | null
          emotions_avg: number | null
          emotion_grid_sessions: number
          comfortable_emotions_ratio: number | null
          high_energy_emotions_ratio: number | null
          breathing_tool_usage_count: number
          breathing_tool_avg_duration: number | null
          overall_wellbeing_score: number | null
          engagement_score: number | null
          sentiment_score: number | null
          emotional_complexity_score: number | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          child_id: string
          org_id: string
          score_date: string
          score_period?: 'daily' | 'weekly' | 'monthly'
          mood_meter_avg?: number | null
          mood_meter_count?: number
          wellbeing_wheel_avg?: number | null
          wellbeing_wheel_count?: number
          friends_avg?: number | null
          work_avg?: number | null
          health_avg?: number | null
          family_avg?: number | null
          fun_play_avg?: number | null
          safety_avg?: number | null
          emotions_avg?: number | null
          emotion_grid_sessions?: number
          comfortable_emotions_ratio?: number | null
          high_energy_emotions_ratio?: number | null
          breathing_tool_usage_count?: number
          breathing_tool_avg_duration?: number | null
          overall_wellbeing_score?: number | null
          engagement_score?: number | null
          sentiment_score?: number | null
          emotional_complexity_score?: number | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          org_id?: string
          score_date?: string
          score_period?: 'daily' | 'weekly' | 'monthly'
          mood_meter_avg?: number | null
          mood_meter_count?: number
          wellbeing_wheel_avg?: number | null
          wellbeing_wheel_count?: number
          friends_avg?: number | null
          work_avg?: number | null
          health_avg?: number | null
          family_avg?: number | null
          fun_play_avg?: number | null
          safety_avg?: number | null
          emotions_avg?: number | null
          emotion_grid_sessions?: number
          comfortable_emotions_ratio?: number | null
          high_energy_emotions_ratio?: number | null
          breathing_tool_usage_count?: number
          breathing_tool_avg_duration?: number | null
          overall_wellbeing_score?: number | null
          engagement_score?: number | null
          sentiment_score?: number | null
          emotional_complexity_score?: number | null
          created_at?: string
          updated_at?: string
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      mood_type: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
      emotion_category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
      wellbeing_section: 'my_friends' | 'my_work' | 'my_health' | 'my_family' | 'my_fun_play' | 'my_safety' | 'my_emotions'
    }
  }
}

export type Tables<T extends keyof Database['public']['Tables']> = Database['public']['Tables'][T]['Row']
export type Inserts<T extends keyof Database['public']['Tables']> = Database['public']['Tables'][T]['Insert']
export type Updates<T extends keyof Database['public']['Tables']> = Database['public']['Tables'][T]['Update']
export type Enums<T extends keyof Database['public']['Enums']> = Database['public']['Enums'][T]

// Helper types for component usage
export type Organisation = Tables<'organisations'>
export type Profile = Tables<'profiles'>
export type CheckinSession = Tables<'checkin_sessions'>
export type BreathingToolUsage = Tables<'breathing_tool_usage'>
export type MoodMeterUsage = Tables<'mood_meter_usage'>
export type EmotionGridUsage = Tables<'emotion_grid_usage'>
export type EmotionGridFeelings = Tables<'emotion_grid_feelings'>
export type FeelingDefinition = Tables<'feeling_definitions'>
export type WellbeingWheelUsage = Tables<'wellbeing_wheel_usage'>
export type WellbeingWheelSection = Tables<'wellbeing_wheel_sections'>
export type ChildProfileScore = Tables<'child_profile_scores'>

export type MoodType = Enums<'mood_type'>
export type EmotionCategory = Enums<'emotion_category'>
export type WellbeingSectionType = Enums<'wellbeing_section'>