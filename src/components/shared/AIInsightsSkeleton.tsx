import React from 'react'

export function AIInsightsSkeleton() {
  return (
    <div className="space-y-4 animate-pulse">
      {/* Summary Section Skeleton */}
      <div className="bg-white p-4 rounded-lg border border-gray-200">
        <div className="flex items-center mb-3">
          <div className="h-4 w-4 bg-gray-200 rounded mr-2"></div>
          <div className="h-4 w-40 bg-gray-200 rounded"></div>
        </div>
        <div className="space-y-2">
          <div className="h-3 w-full bg-gray-200 rounded"></div>
          <div className="h-3 w-full bg-gray-200 rounded"></div>
          <div className="h-3 w-3/4 bg-gray-200 rounded"></div>
        </div>
      </div>

      {/* Concerns Section Skeleton */}
      <div className="bg-amber-50 p-4 rounded-lg border border-amber-200">
        <div className="flex items-center mb-3">
          <div className="h-4 w-4 bg-gray-300 rounded mr-2"></div>
          <div className="h-4 w-48 bg-gray-300 rounded"></div>
        </div>
        <div className="space-y-2">
          {[0, 1, 2].map((i) => (
            <div key={i} className="flex items-start">
              <div className="h-2 w-2 bg-gray-300 rounded-full mt-1.5 mr-2"></div>
              <div className="h-3 flex-1 bg-gray-300 rounded"></div>
            </div>
          ))}
        </div>
      </div>

      {/* Strengths Section Skeleton */}
      <div className="bg-green-50 p-4 rounded-lg border border-green-200">
        <div className="flex items-center mb-3">
          <div className="h-4 w-4 bg-gray-300 rounded mr-2"></div>
          <div className="h-4 w-40 bg-gray-300 rounded"></div>
        </div>
        <div className="space-y-2">
          {[0, 1].map((i) => (
            <div key={i} className="flex items-start">
              <div className="h-2 w-2 bg-gray-300 rounded-full mt-1.5 mr-2"></div>
              <div className="h-3 flex-1 bg-gray-300 rounded"></div>
            </div>
          ))}
        </div>
      </div>

      {/* Recommendations Section Skeleton */}
      <div className="bg-blue-50 p-4 rounded-lg border border-blue-200">
        <div className="flex items-center mb-3">
          <div className="h-4 w-4 bg-gray-300 rounded mr-2"></div>
          <div className="h-4 w-36 bg-gray-300 rounded"></div>
        </div>
        <div className="space-y-2">
          {[0, 1, 2].map((i) => (
            <div key={i} className="flex items-start">
              <div className="h-2 w-2 bg-gray-300 rounded-full mt-1.5 mr-2"></div>
              <div className="h-3 flex-1 bg-gray-300 rounded"></div>
            </div>
          ))}
        </div>
      </div>

      {/* Last analyzed timestamp skeleton */}
      <div className="flex justify-end">
        <div className="h-3 w-40 bg-gray-200 rounded"></div>
      </div>
    </div>
  )
}
