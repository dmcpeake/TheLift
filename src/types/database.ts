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
      checkin_sessions: {
        Row: {
          id: string
          child_id: string
          session_date: string
          session_time: string
          tools_completed: string[]
          mood_meter_completed: boolean
          emotion_grid_completed: boolean
          wellbeing_wheel_completed: boolean
          breathing_tool_completed: boolean
          notes: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          child_id: string
          session_date?: string
          session_time?: string
          tools_completed?: string[]
          mood_meter_completed?: boolean
          emotion_grid_completed?: boolean
          wellbeing_wheel_completed?: boolean
          breathing_tool_completed?: boolean
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          session_date?: string
          session_time?: string
          tools_completed?: string[]
          mood_meter_completed?: boolean
          emotion_grid_completed?: boolean
          wellbeing_wheel_completed?: boolean
          breathing_tool_completed?: boolean
          notes?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      breathing_tool_usage: {
        Row: {
          id: string
          child_id: string
          session_id: string | null
          duration_seconds: number
          cycles_completed: number
          breathing_pattern: string
          start_time: string
          end_time: string
          created_at: string
        }
        Insert: {
          id?: string
          child_id: string
          session_id?: string | null
          duration_seconds: number
          cycles_completed: number
          breathing_pattern: string
          start_time: string
          end_time: string
          created_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          session_id?: string | null
          duration_seconds?: number
          cycles_completed?: number
          breathing_pattern?: string
          start_time?: string
          end_time?: string
          created_at?: string
        }
      }
      mood_meter_usage: {
        Row: {
          id: string
          child_id: string
          session_id: string | null
          mood_value: number
          mood_label: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          selection_time_ms: number
          created_at: string
        }
        Insert: {
          id?: string
          child_id: string
          session_id?: string | null
          mood_value: number
          mood_label: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          selection_time_ms: number
          created_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          session_id?: string | null
          mood_value?: number
          mood_label?: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          selection_time_ms?: number
          created_at?: string
        }
      }
      emotion_grid_usage: {
        Row: {
          id: string
          child_id: string
          session_id: string | null
          story_text: string | null
          story_audio_url: string | null
          completion_time_ms: number
          created_at: string
        }
        Insert: {
          id?: string
          child_id: string
          session_id?: string | null
          story_text?: string | null
          story_audio_url?: string | null
          completion_time_ms: number
          created_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          session_id?: string | null
          story_text?: string | null
          story_audio_url?: string | null
          completion_time_ms?: number
          created_at?: string
        }
      }
      emotion_grid_feelings: {
        Row: {
          id: string
          emotion_grid_id: string
          feeling_name: string
          category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          selection_order: number
          created_at: string
        }
        Insert: {
          id?: string
          emotion_grid_id: string
          feeling_name: string
          category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          selection_order: number
          created_at?: string
        }
        Update: {
          id?: string
          emotion_grid_id?: string
          feeling_name?: string
          category?: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          selection_order?: number
          created_at?: string
        }
      }
      feeling_definitions: {
        Row: {
          id: string
          feeling_name: string
          category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          definition: string
          example_usage: string | null
          icon_url: string | null
          color_hex: string
          created_at: string
        }
        Insert: {
          id?: string
          feeling_name: string
          category: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          definition: string
          example_usage?: string | null
          icon_url?: string | null
          color_hex: string
          created_at?: string
        }
        Update: {
          id?: string
          feeling_name?: string
          category?: 'high-energy-uncomfortable' | 'low-energy-uncomfortable' | 'high-energy-comfortable' | 'low-energy-comfortable'
          definition?: string
          example_usage?: string | null
          icon_url?: string | null
          color_hex?: string
          created_at?: string
        }
      }
      wellbeing_wheel_usage: {
        Row: {
          id: string
          child_id: string
          session_id: string | null
          overall_score: number
          completion_time_ms: number
          created_at: string
        }
        Insert: {
          id?: string
          child_id: string
          session_id?: string | null
          overall_score: number
          completion_time_ms: number
          created_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          session_id?: string | null
          overall_score?: number
          completion_time_ms?: number
          created_at?: string
        }
      }
      wellbeing_wheel_sections: {
        Row: {
          id: string
          wellbeing_wheel_id: string
          section_name: 'my_friends' | 'my_work' | 'my_health' | 'my_family' | 'my_fun_play' | 'my_safety' | 'my_emotions'
          score_value: number
          score_label: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          text_note: string | null
          created_at: string
        }
        Insert: {
          id?: string
          wellbeing_wheel_id: string
          section_name: 'my_friends' | 'my_work' | 'my_health' | 'my_family' | 'my_fun_play' | 'my_safety' | 'my_emotions'
          score_value: number
          score_label: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          text_note?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          wellbeing_wheel_id?: string
          section_name?: 'my_friends' | 'my_work' | 'my_health' | 'my_family' | 'my_fun_play' | 'my_safety' | 'my_emotions'
          score_value?: number
          score_label?: 'very_sad' | 'sad' | 'ok' | 'happy' | 'very_happy'
          text_note?: string | null
          created_at?: string
        }
      }
      child_profile_scores: {
        Row: {
          id: string
          child_id: string
          metric_type: string
          score: number
          date_recorded: string
          created_at: string
        }
        Insert: {
          id?: string
          child_id: string
          metric_type: string
          score: number
          date_recorded: string
          created_at?: string
        }
        Update: {
          id?: string
          child_id?: string
          metric_type?: string
          score?: number
          date_recorded?: string
          created_at?: string
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