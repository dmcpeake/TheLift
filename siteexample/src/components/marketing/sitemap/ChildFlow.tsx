import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { ArrowRight, ArrowDown } from 'lucide-react'
import { SITEMAP_SECTIONS } from './constants'

export function ChildFlow() {
  const { CHILD } = SITEMAP_SECTIONS
  
  return (
    <Card className="mb-8">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <CHILD.icon className="h-5 w-5" />
          {CHILD.title}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          <div className="flex items-center justify-center">
            <div className="border-2 border-pink-300 rounded-lg p-3 text-center bg-pink-50">
              <div className="font-medium text-sm">{CHILD.onboarding.name}</div>
              <div className="text-xs text-gray-500">{CHILD.onboarding.path}</div>
            </div>
          </div>
          <div className="flex justify-center">
            <ArrowDown className="h-4 w-4 text-gray-400" />
          </div>
          <div className="flex items-center justify-center">
            <div className="border-2 border-pink-300 rounded-lg p-3 text-center bg-pink-50">
              <div className="font-medium text-sm">{CHILD.home.name}</div>
              <div className="text-xs text-gray-500">{CHILD.home.path}</div>
            </div>
          </div>
          <div className="flex justify-center">
            <ArrowDown className="h-4 w-4 text-gray-400" />
          </div>
          
          {/* Check-in Flow */}
          <div>
            <h4 className="font-medium text-gray-700 mb-2 text-center">{CHILD.checkinFlow.title}</h4>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div className="border-2 border-teal-300 rounded-lg p-3 text-center bg-teal-50">
                <div className="font-medium text-sm">{CHILD.checkinFlow.steps[0].name}</div>
                <div className="text-xs text-gray-500">{CHILD.checkinFlow.steps[0].path}</div>
                <div className="text-xs text-teal-600 mt-1">{CHILD.checkinFlow.steps[0].step}</div>
              </div>
              <ArrowRight className="h-4 w-4 text-gray-400 mx-auto mt-4" />
              <div className="border-2 border-teal-300 rounded-lg p-3 text-center bg-teal-50">
                <div className="font-medium text-sm">{CHILD.checkinFlow.steps[1].name}</div>
                <div className="text-xs text-gray-500">{CHILD.checkinFlow.steps[1].path}</div>
                <div className="text-xs text-teal-600 mt-1">{CHILD.checkinFlow.steps[1].step}</div>
              </div>
            </div>
            <div className="flex justify-center mt-2">
              <ArrowDown className="h-4 w-4 text-gray-400" />
            </div>
            <div className="flex items-center justify-center">
              <div className="border-2 border-teal-300 rounded-lg p-3 text-center bg-teal-50">
                <div className="font-medium text-sm">{CHILD.checkinFlow.steps[2].name}</div>
                <div className="text-xs text-gray-500">{CHILD.checkinFlow.steps[2].path}</div>
                <div className="text-xs text-teal-600 mt-1">{CHILD.checkinFlow.steps[2].step}</div>
              </div>
            </div>
          </div>

          {/* Other Child Features */}
          <div>
            <h4 className="font-medium text-gray-700 mb-2 text-center">{CHILD.additionalFeatures.title}</h4>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {CHILD.additionalFeatures.pages.map((page) => (
                <div key={page.path} className="border-2 border-yellow-300 rounded-lg p-3 text-center bg-yellow-50">
                  <div className="font-medium text-sm">{page.name}</div>
                  <div className="text-xs text-gray-500">{page.path}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}