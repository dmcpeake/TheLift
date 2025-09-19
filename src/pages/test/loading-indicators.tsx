import React, { useState } from 'react'
import { LoadingIndicator, DataLoadingIndicator } from '../../components/shared/LoadingIndicator'
import { Button } from '../../components/ui/button'

export default function LoadingIndicatorsTest() {
  const [simulateLoading, setSimulateLoading] = useState(false)
  const [progress, setProgress] = useState(0)
  const [dataStages, setDataStages] = useState<Array<{ name: string; status: 'pending' | 'loading' | 'complete' | 'error' }>>(
    [
      { name: 'Connecting to database', status: 'pending' },
      { name: 'Loading organizations', status: 'pending' },
      { name: 'Fetching child profiles', status: 'pending' },
      { name: 'Processing check-in data', status: 'pending' },
      { name: 'Generating analytics', status: 'pending' }
    ]
  )
  const [currentStage, setCurrentStage] = useState(0)

  const simulateDataLoading = async () => {
    setSimulateLoading(true)
    setProgress(0)
    setCurrentStage(0)
    setDataStages([
      { name: 'Connecting to database', status: 'loading' },
      { name: 'Loading organizations', status: 'pending' },
      { name: 'Fetching child profiles', status: 'pending' },
      { name: 'Processing check-in data', status: 'pending' },
      { name: 'Generating analytics', status: 'pending' }
    ])

    for (let i = 0; i < 5; i++) {
      await new Promise(resolve => setTimeout(resolve, 1000))
      setCurrentStage(i)
      setDataStages(prev => prev.map((stage, idx) => ({
        ...stage,
        status: idx < i ? 'complete' : idx === i ? 'loading' : 'pending'
      })))
      setProgress((i + 1) * 20)
    }

    // Complete all stages
    setDataStages(prev => prev.map(stage => ({ ...stage, status: 'complete' })))
    await new Promise(resolve => setTimeout(resolve, 500))
    setSimulateLoading(false)
    setProgress(0)
  }

  const simulateProgressLoading = async () => {
    setProgress(0)
    for (let i = 0; i <= 100; i += 5) {
      await new Promise(resolve => setTimeout(resolve, 100))
      setProgress(i)
    }
    setTimeout(() => setProgress(0), 1000)
  }

  return (
    <div className="max-w-6xl mx-auto p-8 space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">Loading Indicators Demo</h1>
        <p className="text-gray-600">Dynamic loading indicators based on actual data load progress</p>
      </div>

      {/* Spinner Variants */}
      <div className="bg-white p-6 rounded-lg border">
        <h2 className="text-xl font-semibold mb-4">Spinner Variants</h2>
        <div className="grid grid-cols-3 gap-8">
          <div className="text-center">
            <h3 className="text-sm font-medium mb-4 text-gray-700">Small</h3>
            <LoadingIndicator
              variant="spinner"
              size="small"
              message="Loading..."
              color="blue"
              progress={undefined}
            />
          </div>
          <div className="text-center">
            <h3 className="text-sm font-medium mb-4 text-gray-700">Medium with Progress</h3>
            <LoadingIndicator
              variant="spinner"
              size="medium"
              message="Fetching data..."
              color="green"
              progress={progress}
              showPercentage={true}
            />
            <Button
              onClick={simulateProgressLoading}
              className="mt-4"
              size="sm"
            >
              Simulate Progress
            </Button>
          </div>
          <div className="text-center">
            <h3 className="text-sm font-medium mb-4 text-gray-700">Large</h3>
            <LoadingIndicator
              variant="spinner"
              size="large"
              message="Processing..."
              subMessage="This might take a moment"
              color="purple"
            />
          </div>
        </div>
      </div>

      {/* Progress Bar */}
      <div className="bg-white p-6 rounded-lg border">
        <h2 className="text-xl font-semibold mb-4">Progress Bar</h2>
        <div className="space-y-4">
          <LoadingIndicator
            variant="bar"
            progress={75}
            message="Uploading files..."
            color="blue"
          />
          <LoadingIndicator
            variant="bar"
            progress={progress}
            message="Dynamic progress"
            color="green"
          />
        </div>
      </div>

      {/* Animated Dots */}
      <div className="bg-white p-6 rounded-lg border">
        <h2 className="text-xl font-semibold mb-4">Animated Dots</h2>
        <div className="flex justify-around">
          <LoadingIndicator
            variant="dots"
            message="Processing"
            color="blue"
          />
          <LoadingIndicator
            variant="dots"
            message="Analyzing"
            color="purple"
          />
          <LoadingIndicator
            variant="dots"
            message="Saving"
            color="green"
          />
        </div>
      </div>

      {/* Pulse Animation */}
      <div className="bg-white p-6 rounded-lg border">
        <h2 className="text-xl font-semibold mb-4">Pulse Animation</h2>
        <div className="flex justify-around">
          <LoadingIndicator
            variant="pulse"
            size="small"
            message="Connecting..."
            color="blue"
          />
          <LoadingIndicator
            variant="pulse"
            size="medium"
            message="Syncing..."
            color="green"
          />
          <LoadingIndicator
            variant="pulse"
            size="large"
            message="Loading..."
            color="purple"
          />
        </div>
      </div>

      {/* Data Loading Stages */}
      <div className="bg-white p-6 rounded-lg border">
        <h2 className="text-xl font-semibold mb-4">Multi-Stage Data Loading</h2>
        {simulateLoading ? (
          <DataLoadingIndicator
            stages={dataStages}
            currentStage={currentStage}
          />
        ) : (
          <div className="text-center">
            <p className="text-gray-600 mb-4">
              This simulates the actual data loading process with multiple stages
            </p>
            <Button onClick={simulateDataLoading}>
              Start Loading Simulation
            </Button>
          </div>
        )}
      </div>

      {/* Real-world Examples */}
      <div className="bg-white p-6 rounded-lg border">
        <h2 className="text-xl font-semibold mb-4">Real-world Usage Examples</h2>
        <div className="space-y-6">
          <div>
            <h3 className="font-medium mb-2">Child Analytics Loading</h3>
            <div className="bg-gray-50 p-4 rounded">
              <LoadingIndicator
                variant="spinner"
                size="small"
                message="Analyzing child's wellbeing data..."
                color="blue"
              />
            </div>
          </div>
          <div>
            <h3 className="font-medium mb-2">Dashboard Loading</h3>
            <div className="bg-gray-50 p-4 rounded">
              <LoadingIndicator
                variant="dots"
                size="medium"
                message="Loading emotion data..."
                color="blue"
              />
            </div>
          </div>
          <div>
            <h3 className="font-medium mb-2">AI Insights Generation</h3>
            <div className="bg-gray-50 p-4 rounded">
              <LoadingIndicator
                variant="spinner"
                progress={65}
                message="Generating AI insights..."
                subMessage="Processing qualitative data"
                color="purple"
                showPercentage={true}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}