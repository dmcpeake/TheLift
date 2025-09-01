import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { ArrowRight, ArrowDown } from 'lucide-react'
import { SITEMAP_SECTIONS } from './constants'

export function AuthenticationFlow() {
  const { AUTHENTICATION } = SITEMAP_SECTIONS
  
  const getFlowStyles = (style: string) => {
    const styles = {
      blue: 'border-blue-300 bg-blue-50 text-blue-600',
      red: 'border-red-300 bg-red-50 text-red-600',
      gray: 'border-gray-300 bg-white'
    }
    return styles[style as keyof typeof styles] || styles.gray
  }
  
  return (
    <Card className="mb-8">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <AUTHENTICATION.icon className="h-5 w-5" />
          {AUTHENTICATION.title}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-1 md:grid-cols-5 gap-4 items-center">
          <div className={`border-2 rounded-lg p-3 text-center ${getFlowStyles(AUTHENTICATION.flows[0].style)}`}>
            <div className="font-medium text-sm">{AUTHENTICATION.flows[0].name}</div>
            <div className="text-xs text-gray-500">{AUTHENTICATION.flows[0].path}</div>
            <div className="text-xs mt-1">{AUTHENTICATION.flows[0].description}</div>
          </div>
          <div className="flex flex-col items-center gap-2">
            <ArrowDown className="h-4 w-4 text-gray-400" />
            <div className="text-xs text-gray-500">Splits by role</div>
          </div>
          <div className={`border-2 rounded-lg p-3 text-center ${getFlowStyles(AUTHENTICATION.flows[1].style)}`}>
            <div className="font-medium text-sm">{AUTHENTICATION.flows[1].name}</div>
            <div className="text-xs text-gray-500">{AUTHENTICATION.flows[1].path}</div>
            <div className="text-xs mt-1">{AUTHENTICATION.flows[1].description}</div>
          </div>
          <ArrowRight className="h-4 w-4 text-gray-400 mx-auto" />
          <div className={`border-2 rounded-lg p-3 text-center ${getFlowStyles(AUTHENTICATION.flows[2].style)}`}>
            <div className="font-medium text-sm">{AUTHENTICATION.flows[2].name}</div>
            <div className="text-xs text-gray-500">{AUTHENTICATION.flows[2].path}</div>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}