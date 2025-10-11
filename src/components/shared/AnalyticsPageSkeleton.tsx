import React from 'react'

export function AnalyticsPageSkeleton() {
  return (
    <div className="space-y-6 animate-pulse">
      {/* Organization Filter Skeleton */}
      <div className="flex items-center justify-between">
        <div className="h-10 w-64 bg-gray-200 rounded-lg"></div>
        <div className="h-10 w-40 bg-gray-200 rounded-lg"></div>
      </div>

      {/* Stats Cards Skeleton */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {[0, 1, 2].map((i) => (
          <div key={i} className="bg-white rounded-lg border border-gray-200 p-6">
            <div className="flex items-center space-x-3 mb-4">
              <div className="h-10 w-10 bg-gray-200 rounded-lg"></div>
              <div className="flex-1 space-y-2">
                <div className="h-4 w-32 bg-gray-200 rounded"></div>
                <div className="h-6 w-24 bg-gray-200 rounded"></div>
              </div>
            </div>
            <div className="h-3 w-full bg-gray-200 rounded"></div>
          </div>
        ))}
      </div>

      {/* Children List Skeleton */}
      <div className="bg-white rounded-lg border border-gray-200 p-6">
        <div className="h-6 w-48 bg-gray-200 rounded mb-4"></div>
        <div className="space-y-4">
          {[0, 1, 2, 3].map((i) => (
            <div
              key={i}
              className="border border-gray-200 rounded-lg p-4"
              style={{ animationDelay: `${i * 100}ms` }}
            >
              <div className="flex items-center space-x-4">
                {/* Avatar */}
                <div className="h-12 w-12 bg-gray-200 rounded-full flex-shrink-0"></div>

                {/* Content */}
                <div className="flex-1 space-y-3">
                  {/* Name */}
                  <div className="h-5 w-40 bg-gray-200 rounded"></div>

                  {/* Mood indicators */}
                  <div className="flex items-center space-x-4">
                    <div className="h-4 w-24 bg-gray-200 rounded"></div>
                    <div className="h-4 w-24 bg-gray-200 rounded"></div>
                    <div className="h-4 w-24 bg-gray-200 rounded"></div>
                  </div>
                </div>

                {/* Expand button */}
                <div className="h-8 w-8 bg-gray-200 rounded"></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
