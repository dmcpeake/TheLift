import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { ArrowDown } from 'lucide-react'
import { SITEMAP_SECTIONS } from './constants'

export function AdminFlow() {
  const { ADMIN } = SITEMAP_SECTIONS
  
  return (
    <Card className="mb-8">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <ADMIN.icon className="h-5 w-5" />
          {ADMIN.title}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          <div className="flex items-center justify-center">
            <div className="border-2 border-red-300 rounded-lg p-3 text-center bg-red-50">
              <div className="font-medium text-sm">{ADMIN.mainPage.name}</div>
              <div className="text-xs text-gray-500">{ADMIN.mainPage.path}</div>
            </div>
          </div>
          <div className="flex justify-center">
            <ArrowDown className="h-4 w-4 text-gray-400" />
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {ADMIN.subPages.map((page) => (
              <div key={page.path} className="border-2 border-green-300 rounded-lg p-3 text-center bg-green-50">
                <div className="font-medium text-sm">{page.name}</div>
                <div className="text-xs text-gray-500">{page.path}</div>
              </div>
            ))}
          </div>
        </div>
      </CardContent>
    </Card>
  )
}