import React, { useEffect, useState } from 'react'
import { createPortal } from 'react-dom'
import Lottie from 'lottie-react'

interface GuideModalProps {
  isOpen: boolean
  onClose: () => void
  section: string
}

export function GuideModal({ isOpen, onClose, section }: GuideModalProps) {
  const [theoAnimation, setTheoAnimation] = useState(null)

  useEffect(() => {
    fetch('/theo-waving.json')
      .then(response => response.json())
      .then(data => setTheoAnimation(data))
      .catch(error => console.error('Error loading Theo animation:', error))
  }, [])

  const getGuideContent = (section: string) => {
    switch (section) {
      case 'breathing':
        return {
          title: 'My Breathing guide',
          content: `
# Welcome to your breathing exercise!

Take a moment to focus on your breath and find your calm. Here's how it works:

## Getting Started
- Choose a breathing technique that feels right for you
- Find a comfortable position
- Follow the visual guide to breathe in and out

## Techniques Available
- **4-7-8 Breathing**: Inhale for 4, hold for 7, exhale for 8
- **Box Breathing**: Equal counts for inhale, hold, exhale, hold
- **Simple Breathing**: Just focus on natural rhythm

## Tips for Success
- Don't worry if your mind wanders - that's normal
- Start with just a few minutes
- Practice regularly for the best results
- Remember: there's no wrong way to breathe

Take your time and be gentle with yourself. I'm here to guide you through this calming experience.
          `
        }
      case 'mood':
        return {
          title: 'My Mood meter guide',
          content: `
# Understanding your mood

Your mood is like the weather of your mind - it changes throughout the day and that's completely normal!

## How to Use the Mood Meter
- Look at the colorful wheel with different emotions
- Hover over each section to see the mood name
- Click on the one that best matches how you're feeling right now
- Don't overthink it - go with your first instinct

## About the Moods
- **Very Happy**: You're feeling great and energetic
- **Happy**: Things are going well and you feel positive
- **OK**: You're feeling neutral, not particularly up or down
- **Sad**: You're feeling a bit down or disappointed
- **Very Sad**: You're feeling quite low and need some support

## Remember
- All feelings are valid and temporary
- It's okay to feel sad sometimes
- Sharing how you feel can help
- Your emotions give you important information about yourself

I'm proud of you for checking in with your feelings!
          `
        }
      case 'emotions':
        return {
          title: 'My Emotions guide',
          content: `
# Exploring your emotions

Emotions are like messengers - they tell us important things about our experiences and what we need.

## How the Emotion Grid Works
**Step 1: Choose Your Emotions**
- Browse through different emotion categories
- Select all the emotions you're feeling (you can pick more than one!)
- It's normal to feel multiple emotions at the same time

**Step 2: Share Your Story (Optional)**
- Tell me why you're feeling these emotions
- What happened that made you feel this way?
- Use the microphone button for voice input if you prefer

## Emotion Categories
- **Upset**: Angry, frustrated, worried, anxious feelings
- **Down**: Sad, tired, lonely, disappointed feelings
- **Joyful**: Happy, excited, proud, confident feelings
- **Calm**: Peaceful, relaxed, content feelings

## Helpful Tips
- There are no right or wrong emotions
- Sometimes we feel opposite emotions at the same time
- Naming your emotions helps you understand them better
- You're brave for exploring your feelings

Keep going - understanding your emotions is a superpower!
          `
        }
      case 'wellbeing':
        return {
          title: 'My Wellbeing wheel guide',
          content: `
# Your complete wellbeing picture

Wellbeing is like a wheel - when all parts are balanced, life rolls smoothly. Let's check in on different areas of your life!

## How the Wellbeing Wheel Works
- There are 7 important areas of your life to explore
- For each area, rate how you're feeling from sad to happy
- Add notes about why you feel that way (optional)
- Move through all 7 areas at your own pace

## The 7 Life Areas
1. **Family & Friends**: Your relationships and connections
2. **School & Learning**: Your education and growth
3. **Health & Body**: How your body feels and physical wellness
4. **Emotions & Feelings**: Your emotional wellbeing
5. **Fun & Hobbies**: Play, creativity, and things you enjoy
6. **Safety & Security**: Feeling safe and secure in your environment
7. **Growth & Goals**: Your personal development and future plans

## Understanding Your Results
- It's normal for some areas to be stronger than others
- Your wheel shows you where you're thriving
- It also highlights areas where you might need support
- This information helps you and your support team understand you better

## Remember
- This is about understanding yourself, not judging yourself
- Every area of life has ups and downs
- You're taking an important step by reflecting on your wellbeing
- I'm here to support you through this journey

Great job taking care of your overall wellness!
          `
        }
      default:
        return {
          title: 'My guide',
          content: 'Welcome! I\'m here to help guide you through your journey.'
        }
    }
  }

  const { title, content } = getGuideContent(section)

  if (!isOpen) return null

  return createPortal(
    <>
      <style>{`
        .gradient-fade-overlay {
          background: linear-gradient(to top, white 0%, transparent 100%) !important;
        }
        @media (max-width: 768px) {
          .guide-modal-card {
            left: 20px !important;
            right: 20px !important;
            max-width: none !important;
          }
        }
      `}</style>
    <div
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        backgroundColor: 'rgba(0, 0, 0, 0.8)',
        zIndex: 9999
      }}
      onClick={onClose}
    >
      <div
        className="guide-modal-card"
        style={{
          position: 'absolute',
          top: '20px',
          left: '20px',
          right: '20px',
          bottom: '20px',
          backgroundColor: 'white',
          borderRadius: '8px',
          padding: '20px',
          display: 'flex',
          flexDirection: 'column',
          overflow: 'hidden',
          maxWidth: 'calc(896px + 40px)', // max-w-4xl (896px) + 40px for left/right margins
          margin: '0 auto'
        }}
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header with Theo and title */}
        <div style={{ textAlign: 'center', marginBottom: '20px' }}>
          {theoAnimation && (
            <div style={{ marginBottom: '16px' }}>
              <div
                style={{
                  width: '80px',
                  height: '80px',
                  margin: '0 auto'
                }}
              >
                <Lottie
                  animationData={theoAnimation}
                  loop={true}
                  autoplay={true}
                  style={{ width: '100%', height: '100%' }}
                />
              </div>
            </div>
          )}

          <h2 style={{ fontSize: '24px', fontWeight: '600', color: '#111827', marginBottom: '16px' }}>
            {title}
          </h2>

          {/* Dashed line separator */}
          <div style={{
            width: '100%',
            height: '1px',
            borderTop: '1px dashed #d1d5db',
            marginBottom: '0'
          }} />
        </div>

        {/* Content area */}
        <div style={{
          flex: 1,
          overflow: 'auto'
        }}>
          <div>
            {content.split('\n').map((line, index) => {
              if (line.startsWith('# ')) {
                return (
                  <h1 key={index} style={{
                    fontSize: '20px',
                    fontWeight: 'bold',
                    marginBottom: '16px',
                    color: '#111827'
                  }}>
                    {line.substring(2)}
                  </h1>
                )
              }
              if (line.startsWith('## ')) {
                return (
                  <h2 key={index} style={{
                    fontSize: '18px',
                    fontWeight: '600',
                    marginBottom: '12px',
                    marginTop: '24px',
                    color: '#1f2937'
                  }}>
                    {line.substring(3)}
                  </h2>
                )
              }
              if (line.startsWith('**') && line.endsWith('**')) {
                return (
                  <p key={index} style={{
                    fontWeight: '600',
                    marginBottom: '8px',
                    color: '#1f2937'
                  }}>
                    {line.substring(2, line.length - 2)}
                  </p>
                )
              }
              if (line.startsWith('- ')) {
                return (
                  <li key={index} style={{
                    marginLeft: '16px',
                    marginBottom: '4px',
                    color: '#374151',
                    listStyleType: 'disc'
                  }}>
                    {line.substring(2)}
                  </li>
                )
              }
              if (line.trim() === '') {
                return <div key={index} style={{ marginBottom: '8px' }} />
              }
              return (
                <p key={index} style={{
                  marginBottom: '8px',
                  color: '#374151',
                  lineHeight: '1.6'
                }}>
                  {line}
                </p>
              )
            })}
          </div>
        </div>

        {/* Gradient overlay positioned before footer */}
        <div
          className="gradient-fade-overlay"
          style={{
            position: 'absolute',
            bottom: '90px',
            left: '20px',
            right: '20px',
            height: '80px',
            pointerEvents: 'none',
            zIndex: 10
          }}
        />

        {/* Footer with close button */}
        <div style={{
          borderTop: '1px solid #e5e7eb',
          paddingTop: '20px',
          marginTop: '0px'
        }}>
          <button
            onClick={onClose}
            style={{
              width: '100%',
              padding: '12px',
              textAlign: 'center',
              color: '#3a7ddc',
              fontWeight: '500',
              backgroundColor: 'transparent',
              border: 'none',
              cursor: 'pointer',
              fontSize: '16px'
            }}
          >
            CLOSE
          </button>
        </div>
      </div>
    </div>
    </>,
    document.body
  )
}