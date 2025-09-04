// Audio utilities for breathing exercise
// Using simple tone generation via Web Audio API as fallback

let audioContext: AudioContext | null = null
let audioBuffers: { [key: string]: AudioBuffer } = {}

// Initialize audio context
function getAudioContext(): AudioContext | null {
  if (!audioContext && typeof window !== 'undefined' && window.AudioContext) {
    try {
      audioContext = new AudioContext()
    } catch (e) {
      console.warn('Web Audio API not available:', e)
    }
  }
  return audioContext
}

// Generate a simple tone
function createTone(frequency: number, duration: number, type: OscillatorType = 'sine'): AudioBuffer | null {
  const ctx = getAudioContext()
  if (!ctx) return null

  const sampleRate = ctx.sampleRate
  const length = sampleRate * duration
  const buffer = ctx.createBuffer(1, length, sampleRate)
  const channel = buffer.getChannelData(0)

  for (let i = 0; i < length; i++) {
    const t = i / sampleRate
    const envelope = Math.min(1, Math.min(t * 10, (duration - t) * 10)) // Fade in/out
    
    if (type === 'sine') {
      channel[i] = Math.sin(2 * Math.PI * frequency * t) * envelope * 0.3
    }
  }

  return buffer
}

// Preload audio cues
export function preloadAudio() {
  const ctx = getAudioContext()
  if (!ctx) return

  // Create different tones for each phase
  audioBuffers.inhale = createTone(440, 0.3)! // A4
  audioBuffers.hold = createTone(523, 0.2)! // C5
  audioBuffers.exhale = createTone(349, 0.4)! // F4
  audioBuffers.success = createTone(659, 0.5)! // E5
}

// Play an audio cue
export function playAudioCue(cue: 'inhale' | 'hold' | 'exhale' | 'success') {
  const ctx = getAudioContext()
  if (!ctx || !audioBuffers[cue]) return

  try {
    const source = ctx.createBufferSource()
    source.buffer = audioBuffers[cue]
    
    // Add a bit of reverb/echo for calming effect
    const gainNode = ctx.createGain()
    gainNode.gain.value = 0.5
    
    source.connect(gainNode)
    gainNode.connect(ctx.destination)
    source.start(0)
  } catch (e) {
    console.warn('Failed to play audio cue:', e)
  }
}

// Haptic feedback (where supported)
export function triggerHaptic(pattern: number | number[] = 50) {
  if ('vibrate' in navigator) {
    try {
      navigator.vibrate(pattern)
    } catch (e) {
      console.warn('Haptic feedback failed:', e)
    }
  }
}