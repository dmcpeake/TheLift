import { useState } from 'react'
import { X, Users, BarChart3 } from 'lucide-react'
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

interface ComparisonModalProps {
  isOpen: boolean
  onClose: () => void
  children: Child[]
  moodHistory: Record<string, any[]>
  organizationName?: string
}

export function ComparisonModal({
  isOpen,
  onClose,
  children,
  moodHistory,
  organizationName
}: ComparisonModalProps) {
  const [selectedChildren, setSelectedChildren] = useState<string[]>([])

  const selectedChildData = children.filter(child =>
    selectedChildren.includes(child.id)
  )

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* Backdrop */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 bg-black bg-opacity-50 z-40"
            onClick={onClose}
          />

          {/* Modal */}
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 0.95 }}
            className="fixed inset-4 md:inset-8 lg:inset-12 bg-white rounded-xl shadow-xl z-50 overflow-hidden flex flex-col"
          >
            {/* Header */}
            <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200">
              <div className="flex items-center space-x-3">
                <div className="p-2 bg-blue-100 rounded-lg">
                  <BarChart3 className="h-5 w-5 text-blue-600" />
                </div>
                <div>
                  <h2 className="text-xl font-semibold text-gray-900">
                    Wellbeing Comparison
                  </h2>
                  {organizationName && (
                    <p className="text-sm text-gray-600">
                      {organizationName}
                    </p>
                  )}
                </div>
              </div>
              <button
                onClick={onClose}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="h-5 w-5 text-gray-500" />
              </button>
            </div>

            {/* Content */}
            <div className="flex-1 overflow-y-auto p-6">
              <div className="max-w-7xl mx-auto space-y-8">
                {/* Child Selection */}
                <div className="bg-gray-50 rounded-lg p-4">
                  <ChildSelector
                    availableChildren={children}
                    selectedChildren={selectedChildren}
                    onSelectionChange={setSelectedChildren}
                    maxSelection={5}
                  />
                </div>

                {/* Comparison Chart */}
                {selectedChildren.length >= 2 ? (
                  <div className="bg-white rounded-lg border border-gray-200 p-6">
                    <ChildRadarComparison
                      children={selectedChildData}
                      moodHistory={moodHistory}
                    />
                  </div>
                ) : (
                  <div className="bg-white rounded-lg border border-gray-200 p-12">
                    <div className="text-center">
                      <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                      <h3 className="text-lg font-medium text-gray-900 mb-2">
                        Select Children to Compare
                      </h3>
                      <p className="text-sm text-gray-600 max-w-md mx-auto">
                        Choose at least 2 children from the list above to see their wellbeing profiles compared across multiple dimensions.
                      </p>
                    </div>
                  </div>
                )}

                {/* Insights Section */}
                {selectedChildren.length >= 2 && (
                  <div className="bg-blue-50 rounded-lg p-4">
                    <h4 className="text-sm font-medium text-blue-900 mb-2">
                      How to interpret this comparison
                    </h4>
                    <ul className="space-y-1 text-sm text-blue-800">
                      <li className="flex items-start">
                        <span className="mr-2">•</span>
                        <span>Larger areas indicate stronger wellbeing in those dimensions</span>
                      </li>
                      <li className="flex items-start">
                        <span className="mr-2">•</span>
                        <span>Each child has unique strengths - celebrate these differences</span>
                      </li>
                      <li className="flex items-start">
                        <span className="mr-2">•</span>
                        <span>Use this to identify where additional support might be beneficial</span>
                      </li>
                      <li className="flex items-start">
                        <span className="mr-2">•</span>
                        <span>Remember that wellbeing fluctuates - this is a snapshot in time</span>
                      </li>
                    </ul>
                  </div>
                )}
              </div>
            </div>

            {/* Footer */}
            <div className="flex items-center justify-between px-6 py-4 border-t border-gray-200 bg-gray-50">
              <p className="text-sm text-gray-600">
                {selectedChildren.length > 0
                  ? `Comparing ${selectedChildren.length} ${selectedChildren.length === 1 ? 'child' : 'children'}`
                  : 'No children selected'
                }
              </p>
              <button
                onClick={onClose}
                className="px-4 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors text-sm"
              >
                Close
              </button>
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  )
}