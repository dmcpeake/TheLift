import React from 'react'
import * as Tooltip from '@radix-ui/react-tooltip'
import { Calendar, MessageCircle } from 'lucide-react'

interface WellbeingTooltipProps {
  children: React.ReactNode
  date: string
  categoryName: string
  categoryColor: string
  score: number
  textResponse?: string
}

const MOOD_COLORS = {
  1: '#EF4444',  // Red - Struggling
  2: '#F97316',  // Orange - Finding it hard
  3: '#FCD34D',  // Yellow - OK
  4: '#10B981'   // Green - Doing well
}

const MOOD_LABELS = {
  1: 'Struggling',
  2: 'Finding it hard',
  3: 'OK',
  4: 'Doing well'
}

export function WellbeingTooltip({ children, date, categoryName, categoryColor, score, textResponse }: WellbeingTooltipProps) {
  if (!textResponse || score === 0) {
    return <>{children}</>
  }

  return (
    <Tooltip.Provider delayDuration={200}>
      <Tooltip.Root>
        <Tooltip.Trigger asChild>
          {children}
        </Tooltip.Trigger>
        <Tooltip.Portal>
          <Tooltip.Content
            className="z-50 max-w-sm animate-in fade-in-0 zoom-in-95 data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=closed]:zoom-out-95"
            sideOffset={5}
          >
            <div className="bg-white rounded-lg shadow-xl border-2 p-4 space-y-3" style={{ borderColor: categoryColor }}>
              {/* Header */}
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-2">
                  <div
                    className="w-3 h-3 rounded-full"
                    style={{ backgroundColor: categoryColor }}
                  />
                  <h4 className="font-bold text-sm" style={{ color: categoryColor }}>
                    {categoryName}
                  </h4>
                </div>
                <div className="flex items-center space-x-1 text-xs text-gray-500">
                  <Calendar className="h-3 w-3" />
                  <span>{date}</span>
                </div>
              </div>

              {/* Score Badge */}
              <div className="flex items-center space-x-2">
                <div
                  className="px-3 py-1.5 rounded-full text-xs font-bold text-white shadow-sm"
                  style={{ backgroundColor: MOOD_COLORS[score as keyof typeof MOOD_COLORS] }}
                >
                  {score}/4
                </div>
              </div>

              {/* Text Response */}
              <div className="bg-gradient-to-br from-blue-50 to-purple-50 rounded-lg p-3 border border-blue-100">
                <div className="flex items-start space-x-2">
                  <MessageCircle className="h-4 w-4 text-blue-600 mt-0.5 flex-shrink-0" />
                  <p className="text-sm text-gray-800 italic leading-relaxed">
                    "{textResponse}"
                  </p>
                </div>
              </div>
            </div>
            <Tooltip.Arrow className="fill-white" width={12} height={6} />
          </Tooltip.Content>
        </Tooltip.Portal>
      </Tooltip.Root>
    </Tooltip.Provider>
  )
}
