export interface Pace {
  in: number
  hold: number
  out: number
  label?: 'short' | 'standard' | 'slow' | string
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

export type Phase = 'intro' | 'instruction' | 'inhale' | 'hold' | 'exhale' | 'complete'

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