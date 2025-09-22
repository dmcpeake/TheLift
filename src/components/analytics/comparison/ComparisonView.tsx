import { useState } from 'react'
import { X, Users } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import { ChildSelector } from './ChildSelector'
import { ChildRadarComparison } from './ChildRadarComparison'

interface Child {
  id: string
  name: string
  initials?: string
  averageMood?: number
  checkInCount?: number
}

interface ComparisonViewProps {
  children: Child[]
  moodHistory: Record<string, any[]>
  organizationName?: string
  onClose: () => void
}

export function ComparisonView({
  children,
  moodHistory,
  organizationName,
  onClose
}: ComparisonViewProps) {
  const [selectedChildren, setSelectedChildren] = useState<string[]>([])

  const selectedChildData = children.filter(child =>
    selectedChildren.includes(child.id)
  )

  return (
    <motion.div
      initial={{ height: 0, opacity: 0 }}
      animate={{ height: 'auto', opacity: 1 }}
      exit={{ height: 0, opacity: 0 }}
      transition={{ duration: 0.3 }}
      className="bg-white rounded-lg shadow-sm border border-gray-200 mb-6 overflow-hidden"
    >
      {/* Header */}
      <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200 bg-gray-50">
        <div className="flex items-center space-x-3">
          <h2 className="text-lg font-semibold text-gray-900">
            Wellbeing Comparison
          </h2>
          {organizationName && organizationName !== 'All Organizations' && (
            <span className="text-sm text-gray-600">
              • {organizationName}
            </span>
          )}
        </div>
        <button
          onClick={onClose}
          className="p-1.5 hover:bg-gray-200 rounded-lg transition-colors"
        >
          <X className="h-5 w-5 text-gray-500" />
        </button>
      </div>

      {/* Content */}
      <div className="p-6">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Left Column - Child Selection */}
          <div>
            <ChildSelector
              availableChildren={children}
              selectedChildren={selectedChildren}
              onSelectionChange={setSelectedChildren}
              maxSelection={5}
            />
          </div>

          {/* Right Column - Comparison Chart */}
          <div>
            {selectedChildren.length >= 2 ? (
              <ChildRadarComparison
                children={selectedChildData}
                moodHistory={moodHistory}
              />
            ) : (
              <div className="h-full flex items-center justify-center bg-gray-50 rounded-lg border-2 border-dashed border-gray-200 p-8">
                <div className="text-center">
                  <Users className="h-10 w-10 text-gray-400 mx-auto mb-3" />
                  <h3 className="text-base font-medium text-gray-900 mb-1">
                    Select Children to Compare
                  </h3>
                  <p className="text-sm text-gray-600 max-w-sm">
                    Choose at least 2 children from the left to see their wellbeing profiles compared.
                  </p>
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Insights Section */}
        {selectedChildren.length >= 2 && (
          <div className="mt-6 bg-blue-50 rounded-lg p-4">
            <h4 className="text-sm font-medium text-blue-900 mb-2">
              How to interpret this comparison
            </h4>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-2 text-xs text-blue-800">
              <div className="flex items-start">
                <span className="mr-2">•</span>
                <span>Larger areas indicate stronger wellbeing in those dimensions</span>
              </div>
              <div className="flex items-start">
                <span className="mr-2">•</span>
                <span>Each child has unique strengths - celebrate these differences</span>
              </div>
              <div className="flex items-start">
                <span className="mr-2">•</span>
                <span>Use this to identify where additional support might be beneficial</span>
              </div>
              <div className="flex items-start">
                <span className="mr-2">•</span>
                <span>Remember that wellbeing fluctuates - this is a snapshot in time</span>
              </div>
            </div>
          </div>
        )}
      </div>
    </motion.div>
  )
}