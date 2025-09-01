import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { ArrowDown } from 'lucide-react'
import { SITEMAP_SECTIONS } from './constants'

export function PractitionerFlow() {
  const { PRACTITIONER } = SITEMAP_SECTIONS
  
  return (
    <Card className="mb-8">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <PRACTITIONER.icon className="h-5 w-5" />
          {PRACTITIONER.title}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          <div className="flex items-center justify-center">
            <div className="border-2 border-blue-300 rounded-lg p-3 text-center bg-blue-50">
              <div className="font-medium text-sm">{PRACTITIONER.mainPage.name}</div>
              <div className="text-xs text-gray-500">{PRACTITIONER.mainPage.path}</div>
            </div>
          </div>
          <div className="flex justify-center">
            <ArrowDown className="h-4 w-4 text-gray-400" />
          </div>
          
          {/* Child Management Section */}
          <div>
            <h4 className="font-medium text-gray-700 mb-2">{PRACTITIONER.childManagement.title}</h4>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              {PRACTITIONER.childManagement.pages.map((page) => (
                <div key={page.path} className="border-2 border-purple-300 rounded-lg p-3 text-center bg-purple-50">
                  <div className="font-medium text-sm">{page.name}</div>
                  <div className="text-xs text-gray-500">{page.path}</div>
                </div>
              ))}
            </div>
          </div>

          {/* Group Contact Only Section */}
          <div>
            <h4 className="font-medium text-gray-700 mb-2">{PRACTITIONER.groupContactOnly.title}</h4>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              {PRACTITIONER.groupContactOnly.pages.map((page) => (
                <div key={page.path} className="border-2 border-orange-300 rounded-lg p-3 text-center bg-orange-50">
                  <div className="font-medium text-sm">{page.name}</div>
                  <div className="text-xs text-gray-500">{page.path}</div>
                </div>
              ))}
            </div>
          </div>

          {/* Shared Profile */}
          <div className="flex items-center justify-center">
            <div className="border-2 border-gray-300 rounded-lg p-3 text-center bg-gray-50">
              <div className="font-medium text-sm">{PRACTITIONER.sharedProfile.name}</div>
              <div className="text-xs text-gray-500">{PRACTITIONER.sharedProfile.path}</div>
              <div className="text-xs text-gray-600 mt-1">{PRACTITIONER.sharedProfile.description}</div>
            </div>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}