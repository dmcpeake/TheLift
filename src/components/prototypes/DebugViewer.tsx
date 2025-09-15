import React, { useState, useEffect } from 'react'

interface CapturedData {
  timestamp: string
  tool: string
  data: any
}

export function DebugViewer() {
  const [capturedData, setCapturedData] = useState<CapturedData[]>([])
  const [selectedData, setSelectedData] = useState<CapturedData | null>(null)

  useEffect(() => {
    // Listen to console.log messages
    const originalLog = console.log
    const logInterceptor = function(...args: any[]) {
      originalLog.apply(console, args)

      // Capture wellbeing tool data
      const message = args[0]
      if (typeof message === 'string' && message.includes('DATA')) {
        const tool = message.includes('MOOD') ? 'Mood Meter' :
                     message.includes('EMOTION') ? 'Emotion Grid' :
                     message.includes('WHEEL') ? 'Wellbeing Wheel' :
                     message.includes('BREATHING') ? 'Breathing Tool' : 'Unknown'

        const newData: CapturedData = {
          timestamp: new Date().toISOString(),
          tool,
          data: args[1] || {}
        }

        setCapturedData((prev: CapturedData[]) => [...prev, newData])
      }
    }

    console.log = logInterceptor

    return () => {
      console.log = originalLog
    }
  }, [])

  const clearData = () => {
    setCapturedData([])
    setSelectedData(null)
    console.log('🗑️ Debug data cleared')
  }

  const exportData = () => {
    const dataStr = JSON.stringify(capturedData, null, 2)
    const dataUri = 'data:application/json;charset=utf-8,' + encodeURIComponent(dataStr)
    const exportFileDefaultName = `wellbeing-prototype-data-${Date.now()}.json`

    const linkElement = document.createElement('a')
    linkElement.setAttribute('href', dataUri)
    linkElement.setAttribute('download', exportFileDefaultName)
    linkElement.click()

    console.log('📥 Data exported')
  }

  const mockApiCall = (data: CapturedData) => {
    console.log('🚀 Simulating API call to:', `/api/${data.tool.toLowerCase().replace(' ', '-')}`)
    console.log('📤 Payload:', data.data)

    // Simulate API response
    setTimeout(() => {
      console.log('✅ API Response: { success: true, id: "mock-' + Date.now() + '" }')
    }, 500)
  }

  return (
    <div className="p-6 bg-white rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-4">🔍 Debug Viewer</h2>

      <div className="flex gap-3 mb-4">
        <button
          onClick={clearData}
          disabled={capturedData.length === 0}
          className="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Clear All
        </button>
        <button
          onClick={exportData}
          disabled={capturedData.length === 0}
          className="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Export JSON
        </button>
      </div>

      {capturedData.length === 0 ? (
        <div className="text-center py-12 bg-gray-50 rounded-lg">
          <p className="text-gray-500">No data captured yet</p>
          <p className="text-sm text-gray-400 mt-2">Interact with the tools above to see data here</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
          {/* Data List */}
          <div>
            <h3 className="font-semibold mb-2">Captured Events ({capturedData.length})</h3>
            <div className="space-y-2 max-h-96 overflow-y-auto">
              {capturedData.map((item, index) => {
                const isSelected = selectedData?.timestamp === item.timestamp && selectedData?.tool === item.tool
                return (
                  <div
                    key={`${item.timestamp}-${index}`}
                    onClick={() => setSelectedData(item)}
                    className={`p-3 border rounded-lg cursor-pointer transition-all ${
                      isSelected
                        ? 'border-blue-500 bg-blue-50'
                        : 'border-gray-200 hover:border-gray-300'
                    }`}
                  >
                    <div className="flex justify-between items-start">
                      <div>
                        <p className="font-medium">{item.tool}</p>
                        <p className="text-xs text-gray-500">
                          {new Date(item.timestamp).toLocaleTimeString()}
                        </p>
                      </div>
                      <button
                        onClick={(e) => {
                          e.stopPropagation()
                          mockApiCall(item)
                        }}
                        className="px-2 py-1 text-xs bg-green-500 text-white rounded hover:bg-green-600"
                      >
                        Mock API Call
                      </button>
                    </div>
                  </div>
                )
              })}
            </div>
          </div>

          {/* Data Detail */}
          <div>
            <h3 className="font-semibold mb-2">Data Detail</h3>
            {selectedData ? (
              <div>
                <div className="mb-2 p-2 bg-gray-100 rounded">
                  <p className="text-sm"><strong>Tool:</strong> {selectedData.tool}</p>
                  <p className="text-sm"><strong>Time:</strong> {new Date(selectedData.timestamp).toLocaleString()}</p>
                </div>
                <pre className="bg-gray-900 text-white p-4 rounded-lg overflow-x-auto text-xs max-h-80">
                  {JSON.stringify(selectedData.data, null, 2)}
                </pre>
              </div>
            ) : (
              <div className="text-center py-12 bg-gray-50 rounded-lg">
                <p className="text-gray-400 text-sm">Select an event to view details</p>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  )
}