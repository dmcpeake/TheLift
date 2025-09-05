export interface Pace {
  in: number
  hold: number
  out: number
  holdAfter?: number  // For square breathing
  label?: string
}

export interface BreathingTechnique {
  id: string
  name: string
  description: string
  pace: Pace
  cycles?: number
  theme?: {
    primaryColor: string
    secondaryColor: string
    icon?: string
  }
}

export interface BreathingCirclesProps {
  cycles?: number
  pace?: Pace
  muted?: boolean
  captions?: boolean
  reducedMotion?: boolean
  highContrast?: boolean
  onProgress?: (cycle: number, phase: 'inhale' | 'hold' | 'exhale', t: number) => void
  onComplete?: () => void
  onExit?: (reason: 'skip' | 'close') => void
}

export type Phase = 'intro' | 'instruction' | 'inhale' | 'hold' | 'exhale' | 'holdAfter' | 'complete'

export interface BreathingSettings {
  paceLabel: 'short' | 'standard' | 'slow'
  captions: boolean
  reducedMotion: boolean
  muted: boolean
  highContrast: boolean
}

export interface TelemetryEvent {
  sessionId: string
  event: 'breathing_started' | 'breathing_cycle_completed' | 'breathing_completed' | 'breathing_exited' | 'settings_changed'
  cycle?: number
  pace?: Pace
  muted?: boolean
  reducedMotion?: boolean
  elapsedMs?: number
  ts: string
  ua?: string
}