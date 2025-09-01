import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '../../ui/card'
import { SITEMAP_SECTIONS } from './constants'

export function RolesSummary() {
  const { ROLES } = SITEMAP_SECTIONS
  
  const getRoleStyles = (color: string) => {
    switch (color) {
      case 'red':
        return {
          border: 'border-red-300',
          bg: 'bg-red-50',
          icon: 'text-red-600',
          title: 'text-red-800',
          text: 'text-red-700'
        }
      case 'orange':
        return {
          border: 'border-orange-300',
          bg: 'bg-orange-50',
          icon: 'text-orange-600',
          title: 'text-orange-800',
          text: 'text-orange-700'
        }
      case 'blue':
        return {
          border: 'border-blue-300',
          bg: 'bg-blue-50',
          icon: 'text-blue-600',
          title: 'text-blue-800',
          text: 'text-blue-700'
        }
      case 'pink':
        return {
          border: 'border-pink-300',
          bg: 'bg-pink-50',
          icon: 'text-pink-600',
          title: 'text-pink-800',
          text: 'text-pink-700'
        }
      default:
        return {
          border: 'border-gray-300',
          bg: 'bg-gray-50',
          icon: 'text-gray-600',
          title: 'text-gray-800',
          text: 'text-gray-700'
        }
    }
  }
  
  return (
    <Card className="mb-8">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <ROLES.icon className="h-5 w-5" />
          {ROLES.title}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          {ROLES.roles.map((role) => {
            const styles = getRoleStyles(role.color)
            
            return (
              <div key={role.name} className={`border-2 ${styles.border} rounded-lg p-4 ${styles.bg}`}>
                <div className="flex items-center gap-2 mb-2">
                  <role.icon className={`h-4 w-4 ${styles.icon}`} />
                  <div className={`font-bold ${styles.title}`}>{role.name}</div>
                </div>
                <div className={`text-xs ${styles.text}`}>
                  {role.permissions.map((permission, index) => (
                    <React.Fragment key={permission}>
                      • {permission}
                      {index < role.permissions.length - 1 && <br/>}
                    </React.Fragment>
                  ))}
                </div>
              </div>
            )
          })}
        </div>
      </CardContent>
    </Card>
  )
}