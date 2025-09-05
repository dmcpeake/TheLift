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

// Generate a calming chime sound
function createChime(frequency: number, duration: number, harmonics: number[] = [1, 2, 3]): AudioBuffer | null {
  const ctx = getAudioContext()
  if (!ctx) return null

  const sampleRate = ctx.sampleRate
  const length = sampleRate * duration
  const buffer = ctx.createBuffer(1, length, sampleRate)
  const channel = buffer.getChannelData(0)

  for (let i = 0; i < length; i++) {
    const t = i / sampleRate
    // Softer attack and longer decay for calming effect
    const envelope = Math.pow(Math.sin(Math.PI * t / duration), 0.5) * Math.exp(-t * 2)
    
    let sample = 0
    // Add harmonics for richer, more pleasant sound
    harmonics.forEach((harmonic, index) => {
      const amp = 1 / (index + 1) // Each harmonic quieter than the last
      sample += Math.sin(2 * Math.PI * frequency * harmonic * t) * amp
    })
    
    channel[i] = sample * envelope * 0.15 // Much quieter, more subtle
  }

  return buffer
}

// Preload audio cues
export function preloadAudio() {
  const ctx = getAudioContext()
  if (!ctx) return

  // Create calming chimes for each phase
  audioBuffers.inhale = createChime(523.25, 0.8, [1, 2])! // C5 with soft harmonics
  audioBuffers.hold = createChime(659.25, 0.6, [1])! // E5 pure tone
  audioBuffers.exhale = createChime(392, 1.0, [1, 1.5, 2])! // G4 with warm harmonics
  audioBuffers.success = createChime(783.99, 1.2, [1, 2, 3, 4])! // G5 with rich harmonics
}

// Play an audio cue
export function playAudioCue(cue: 'inhale' | 'hold' | 'exhale' | 'success') {
  const ctx = getAudioContext()
  if (!ctx || !audioBuffers[cue]) return

  try {
    const source = ctx.createBufferSource()
    source.buffer = audioBuffers[cue]
    
    // Reduced volume for gentler sound
    const gainNode = ctx.createGain()
    gainNode.gain.value = 0.3
    
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