import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { ArrowRight } from 'lucide-react'
import { SITEMAP_SECTIONS } from './constants'

export function MarketingFlow() {
  const { MARKETING } = SITEMAP_SECTIONS
  
  return (
    <Card className="mb-8">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <MARKETING.icon className="h-5 w-5" />
          {MARKETING.title}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-1 md:grid-cols-6 gap-4 items-center">
          {MARKETING.pages.slice(0, 4).map((page, index) => (
            <React.Fragment key={page.path}>
              <div className="border-2 border-gray-300 rounded-lg p-3 text-center bg-white">
                <div className="font-medium text-sm">{page.name}</div>
                <div className="text-xs text-gray-500">{page.path}</div>
              </div>
              {index < 3 && <ArrowRight className="h-4 w-4 text-gray-400 mx-auto" />}
            </React.Fragment>
          ))}
          <div className="border-2 border-gray-300 rounded-lg p-3 text-center bg-white">
            <div className="font-medium text-sm">{MARKETING.pages[4].name}</div>
            <div className="text-xs text-gray-500">{MARKETING.pages[4].path}</div>
          </div>
          <div className="border-2 border-gray-300 rounded-lg p-3 text-center bg-white">
            <div className="font-medium text-sm">{MARKETING.pages[5].name}</div>
            <div className="text-xs text-gray-500">{MARKETING.pages[5].path}</div>
          </div>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4 items-center mt-4">
          {MARKETING.pages.slice(4).map((page) => (
            <div key={page.path} className="border-2 border-gray-300 rounded-lg p-3 text-center bg-white">
              <div className="font-medium text-sm">{page.name}</div>
              <div className="text-xs text-gray-500">{page.path}</div>
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  )
}