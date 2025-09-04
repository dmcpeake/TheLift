import React from 'react'
import { motion } from 'framer-motion'
import { Button } from '../ui/button'
import { Switch } from '../ui/switch'
import { Label } from '../ui/label'
import { RadioGroup, RadioGroupItem } from '../ui/radio-group'
import { X } from 'lucide-react'
import { BreathingSettings } from './types'

interface SettingsProps {
  settings: BreathingSettings
  onChange: (settings: Partial<BreathingSettings>) => void
  onClose: () => void
}

export function Settings({ settings, onChange, onClose }: SettingsProps) {
  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4"
      onClick={onClose}
    >
      <motion.div
        initial={{ scale: 0.9, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        exit={{ scale: 0.9, opacity: 0 }}
        className="bg-white rounded-lg shadow-xl max-w-md w-full p-6"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-semibold">Settings</h2>
          <Button
            variant="ghost"
            size="icon"
            onClick={onClose}
            aria-label="Close settings"
          >
            <X className="h-5 w-5" />
          </Button>
        </div>

        <div className="space-y-6">
          {/* Pace Selection */}
          <div>
            <Label className="text-base font-medium mb-3 block">Breathing Pace</Label>
            <RadioGroup
              value={settings.paceLabel}
              onValueChange={(value) => onChange({ paceLabel: value as 'short' | 'standard' | 'slow' })}
            >
              <div className="flex items-center space-x-2 mb-2">
                <RadioGroupItem value="short" id="pace-short" />
                <Label htmlFor="pace-short" className="font-normal">
                  Short (2-1-3) - Quicker breaths
                </Label>
              </div>
              <div className="flex items-center space-x-2 mb-2">
                <RadioGroupItem value="standard" id="pace-standard" />
                <Label htmlFor="pace-standard" className="font-normal">
                  Standard (3-1-4) - Recommended
                </Label>
              </div>
              <div className="flex items-center space-x-2">
                <RadioGroupItem value="slow" id="pace-slow" />
                <Label htmlFor="pace-slow" className="font-normal">
                  Slow (4-1-5) - Deeper breaths
                </Label>
              </div>
            </RadioGroup>
          </div>

          {/* Toggle Options */}
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <Label htmlFor="muted" className="font-normal">
                Sound Effects
              </Label>
              <Switch
                id="muted"
                checked={!settings.muted}
                onCheckedChange={(checked) => onChange({ muted: !checked })}
              />
            </div>

            <div className="flex items-center justify-between">
              <Label htmlFor="captions" className="font-normal">
                Captions
              </Label>
              <Switch
                id="captions"
                checked={settings.captions}
                onCheckedChange={(checked) => onChange({ captions: checked })}
              />
            </div>

            <div className="flex items-center justify-between">
              <Label htmlFor="reduced-motion" className="font-normal">
                Reduced Motion
              </Label>
              <Switch
                id="reduced-motion"
                checked={settings.reducedMotion}
                onCheckedChange={(checked) => onChange({ reducedMotion: checked })}
              />
            </div>

            <div className="flex items-center justify-between">
              <Label htmlFor="high-contrast" className="font-normal">
                High Contrast
              </Label>
              <Switch
                id="high-contrast"
                checked={settings.highContrast}
                onCheckedChange={(checked) => onChange({ highContrast: checked })}
              />
            </div>
          </div>
        </div>

        <div className="mt-6 pt-4 border-t">
          <p className="text-sm text-gray-500">
            Settings are saved automatically and will be remembered for next time.
          </p>
        </div>
      </motion.div>
    </motion.div>
  )
}