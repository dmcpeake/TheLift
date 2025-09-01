import React from 'react'
import { Card, CardContent } from '../ui/card'
import { Calendar, Clock, Users, CheckCircle } from 'lucide-react'
import { Badge } from '../ui/badge'
import { PractitionerWithAssignments } from './types'
import { getDaysAgo, getStatusBadge } from './practitionerUtils'

interface PractitionerStatsCardsProps {
  practitioner: PractitionerWithAssignments
}

export function PractitionerStatsCards({ practitioner }: PractitionerStatsCardsProps) {
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
      {/* Status Card */}
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center">
              <CheckCircle className="h-5 w-5 text-gray-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600 mb-1">Status</p>
              {getStatusBadge(practitioner.status)}
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Invited Date Card */}
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center">
              <Calendar className="h-5 w-5 text-gray-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600 mb-1">Invited</p>
              <p className="font-medium">{getDaysAgo(practitioner.invitedDate)}</p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Last Login Card */}
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center">
              <Clock className="h-5 w-5 text-gray-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600 mb-1">Last Login</p>
              <p className="font-medium">
                {practitioner.lastLogin ? getDaysAgo(practitioner.lastLogin) : 'Never'}
              </p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Assigned Children Card */}
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center">
              <Users className="h-5 w-5 text-gray-600" />
            </div>
            <div>
              <p className="text-sm text-gray-600 mb-1">Assigned Children</p>
              <p className="font-medium">{practitioner.childrenCount}</p>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}