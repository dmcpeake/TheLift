import React from 'react'

export function WellbeingCardSkeleton() {
  return (
    <div className="p-6 animate-pulse">
      {/* Header Section */}
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-3">
          <div className="h-10 w-10 bg-gray-200 rounded-lg"></div>
          <div className="space-y-2">
            <div className="h-5 w-48 bg-gray-200 rounded"></div>
            <div className="h-4 w-64 bg-gray-200 rounded"></div>
          </div>
        </div>
        <div className="h-5 w-5 bg-gray-200 rounded"></div>
      </div>

      {/* Stats Summary Skeleton */}
      <div className="grid grid-cols-3 gap-4 mb-6">
        {[0, 1, 2].map((i) => (
          <div key={i} className="text-center">
            <div className="h-8 w-16 bg-gray-200 rounded mx-auto mb-2"></div>
            <div className="h-3 w-24 bg-gray-200 rounded mx-auto"></div>
          </div>
        ))}
      </div>

      {/* Section Cards Skeleton */}
      <div>
        <div className="h-4 w-40 bg-gray-200 rounded mb-3"></div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
          {[0, 1, 2, 3, 4, 5].map((i) => (
            <div
              key={i}
              className="p-3 border border-gray-200 rounded-lg"
              style={{ animationDelay: `${i * 50}ms` }}
            >
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-2">
                  <div className="h-4 w-4 bg-gray-200 rounded"></div>
                  <div className="h-4 w-20 bg-gray-200 rounded"></div>
                </div>
                <div className="h-6 w-8 bg-gray-200 rounded"></div>
              </div>
              <div className="flex gap-2">
                <div className="h-3 w-16 bg-gray-200 rounded"></div>
                <div className="h-3 w-16 bg-gray-200 rounded"></div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Individual Trends Skeleton */}
      <div className="mt-6">
        <div className="h-4 w-48 bg-gray-200 rounded mb-3"></div>
        <div className="space-y-2">
          {[0, 1, 2].map((i) => (
            <div
              key={i}
              className="p-4 border border-gray-200 rounded-lg"
              style={{ animationDelay: `${i * 75}ms` }}
            >
              <div className="flex items-center justify-between mb-3">
                <div className="flex items-center gap-3">
                  <div className="h-8 w-8 bg-gray-200 rounded-full"></div>
                  <div className="space-y-2">
                    <div className="h-4 w-32 bg-gray-200 rounded"></div>
                    <div className="h-3 w-48 bg-gray-200 rounded"></div>
                  </div>
                </div>
                <div className="h-6 w-16 bg-gray-200 rounded-full"></div>
              </div>
              {/* Category bars */}
              <div className="grid grid-cols-7 gap-1">
                {[0, 1, 2, 3, 4, 5, 6].map((j) => (
                  <div key={j} className="flex flex-col items-center">
                    <div className="w-full h-12 bg-gray-200 rounded"></div>
                    <div className="h-3 w-8 bg-gray-200 rounded mt-1"></div>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
