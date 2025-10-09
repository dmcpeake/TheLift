import { useState } from 'react'
import { X, Users, BarChart3, Grid3x3, ScatterChart, TrendingUp } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import { ChildSelector } from './ChildSelector'
import { ChildRadarComparison } from './ChildRadarComparison'
import { ChildHeatMapComparison } from './ChildHeatMapComparison'
import { ChildScatterComparison } from './ChildScatterComparison'
import { ChildLineComparison } from './ChildLineComparison'

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
  wellbeingData?: Record<string, any[]> // Add wellbeing wheel data
  organizationName?: string
  onClose: () => void
}

type VisualizationType = 'radar' | 'heatmap' | 'scatter' | 'timeline'

export function ComparisonView({
  children,
  moodHistory,
  wellbeingData,
  organizationName,
  onClose
}: ComparisonViewProps) {
  const [selectedChildren, setSelectedChildren] = useState<string[]>([])
  const [activeVisualization, setActiveVisualization] = useState<VisualizationType>('radar')

  const selectedChildData = children.filter(child =>
    selectedChildren.includes(child.id)
  )

  const visualizationTabs = [
    { id: 'radar', label: 'Profile', icon: BarChart3 },
    { id: 'heatmap', label: 'Heat Map', icon: Grid3x3 },
    { id: 'scatter', label: 'Correlation', icon: ScatterChart },
    { id: 'timeline', label: 'Timeline', icon: TrendingUp }
  ]

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
              <>
                {/* Visualization Tabs */}
                <div className="flex space-x-1 mb-4 p-1 bg-gray-100 rounded-lg">
                  {visualizationTabs.map((tab) => {
                    const Icon = tab.icon
                    return (
                      <button
                        key={tab.id}
                        onClick={() => setActiveVisualization(tab.id as VisualizationType)}
                        className={`
                          flex items-center space-x-2 px-3 py-1.5 rounded-md text-sm font-medium transition-all
                          ${activeVisualization === tab.id
                            ? 'bg-white text-gray-900 shadow-sm'
                            : 'text-gray-600 hover:text-gray-900 hover:bg-gray-50'
                          }
                        `}
                      >
                        <Icon className="h-4 w-4" />
                        <span>{tab.label}</span>
                      </button>
                    )
                  })}
                </div>

                {/* Active Visualization */}
                <div className="bg-white rounded-lg border border-gray-200 p-4">
                  <AnimatePresence mode="wait">
                    <motion.div
                      key={activeVisualization}
                      initial={{ opacity: 0, y: 10 }}
                      animate={{ opacity: 1, y: 0 }}
                      exit={{ opacity: 0, y: -10 }}
                      transition={{ duration: 0.2 }}
                    >
                      {activeVisualization === 'radar' && (
                        <ChildRadarComparison
                          children={selectedChildData}
                          moodHistory={moodHistory}
                          wellbeingData={wellbeingData}
                        />
                      )}
                      {activeVisualization === 'heatmap' && (
                        <ChildHeatMapComparison
                          children={selectedChildData}
                          moodHistory={moodHistory}
                          wellbeingData={wellbeingData}
                        />
                      )}
                      {activeVisualization === 'scatter' && (
                        <ChildScatterComparison
                          children={selectedChildData}
                          moodHistory={moodHistory}
                          wellbeingData={wellbeingData}
                        />
                      )}
                      {activeVisualization === 'timeline' && (
                        <ChildLineComparison
                          children={selectedChildData}
                          moodHistory={moodHistory}
                          wellbeingData={wellbeingData}
                        />
                      )}
                    </motion.div>
                  </AnimatePresence>
                </div>
              </>
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
              How to interpret {activeVisualization === 'radar' ? 'this comparison' :
                              activeVisualization === 'heatmap' ? 'the heat map' :
                              activeVisualization === 'scatter' ? 'the correlation' :
                              'the timeline'}
            </h4>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-2 text-xs text-blue-800">
              {activeVisualization === 'radar' && (
                <>
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
                </>
              )}
              {activeVisualization === 'heatmap' && (
                <>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Greener cells show higher wellbeing scores for that week</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Children are ranked by their average wellbeing score</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Look for patterns across weeks to identify trends</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Gray cells indicate weeks with no check-in data</span>
                  </div>
                </>
              )}
              {activeVisualization === 'scatter' && (
                <>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Position shows the relationship between two wellbeing metrics</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Top-right quadrant indicates strength in both areas</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Use the dropdown to explore different metric correlations</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Identify children who may need targeted support</span>
                  </div>
                </>
              )}
              {activeVisualization === 'timeline' && (
                <>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Lines show daily mood trends over the last 30 days</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Upward trends indicate improving wellbeing</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Look for patterns and responses to interventions</span>
                  </div>
                  <div className="flex items-start">
                    <span className="mr-2">•</span>
                    <span>Compare trajectories to understand individual progress</span>
                  </div>
                </>
              )}
            </div>
          </div>
        )}
      </div>
    </motion.div>
  )
}