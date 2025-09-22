import { AlertTriangle, Phone, FileText, Users, Calendar, TrendingDown } from 'lucide-react'
import { motion } from 'framer-motion'

interface CriticalSupportAlertProps {
  childName: string
  averageMood: number
  lastCheckIn: string
  checkInCount: number
  criticalCheckIns: number // Number of check-ins with mood <= 2
  onViewDetails: () => void
  onContactSupport: () => void
  onGenerateReport: () => void
}

export function CriticalSupportAlert({
  childName,
  averageMood,
  lastCheckIn,
  checkInCount,
  criticalCheckIns,
  onViewDetails,
  onContactSupport,
  onGenerateReport
}: CriticalSupportAlertProps) {
  // Determine severity level
  const getSeverityLevel = (mood: number) => {
    if (mood <= 1.5) return 'critical'
    if (mood <= 2.0) return 'severe'
    return 'high'
  }

  const severity = getSeverityLevel(averageMood)

  const severityConfig = {
    critical: {
      bgColor: 'bg-red-50',
      borderColor: 'border-red-500',
      textColor: 'text-red-900',
      badgeColor: 'bg-red-600',
      iconColor: 'text-red-600',
      pulseColor: 'bg-red-400',
      message: 'IMMEDIATE INTERVENTION REQUIRED'
    },
    severe: {
      bgColor: 'bg-orange-50',
      borderColor: 'border-orange-500',
      textColor: 'text-orange-900',
      badgeColor: 'bg-orange-600',
      iconColor: 'text-orange-600',
      pulseColor: 'bg-orange-400',
      message: 'URGENT SUPPORT NEEDED'
    },
    high: {
      bgColor: 'bg-amber-50',
      borderColor: 'border-amber-500',
      textColor: 'text-amber-900',
      badgeColor: 'bg-amber-600',
      iconColor: 'text-amber-600',
      pulseColor: 'bg-amber-400',
      message: 'PRIORITY SUPPORT RECOMMENDED'
    }
  }

  const config = severityConfig[severity]

  return (
    <motion.div
      initial={{ opacity: 0, y: -10 }}
      animate={{ opacity: 1, y: 0 }}
      className={`${config.bgColor} ${config.borderColor} border-2 rounded-lg p-4 mb-4`}
    >
      {/* Alert Header */}
      <div className="flex items-start justify-between mb-3">
        <div className="flex items-center space-x-3">
          {/* Pulsing Warning Icon */}
          <div className="relative">
            <div className={`absolute inset-0 ${config.pulseColor} rounded-full animate-ping opacity-75`}></div>
            <AlertTriangle className={`relative h-6 w-6 ${config.iconColor}`} />
          </div>

          <div>
            <h3 className={`text-lg font-bold ${config.textColor}`}>
              {config.message}
            </h3>
            <p className={`text-sm ${config.textColor} opacity-90`}>
              {childName} requires immediate wellbeing support
            </p>
          </div>
        </div>

        {/* Severity Badge */}
        <span className={`${config.badgeColor} text-white text-xs font-bold px-2 py-1 rounded-full uppercase`}>
          {severity}
        </span>
      </div>

      {/* Critical Metrics Grid */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-3 mb-4">
        <div className="bg-white rounded-lg p-2">
          <div className="flex items-center space-x-2">
            <TrendingDown className="h-4 w-4 text-red-500" />
            <div>
              <p className="text-xs text-gray-600">Average mood</p>
              <p className="text-sm font-bold text-red-600">{averageMood.toFixed(1)}/5.0</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-lg p-2">
          <div className="flex items-center space-x-2">
            <AlertTriangle className="h-4 w-4 text-orange-500" />
            <div>
              <p className="text-xs text-gray-600">Critical check-ins</p>
              <p className="text-sm font-bold text-orange-600">{criticalCheckIns}/{checkInCount}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-lg p-2">
          <div className="flex items-center space-x-2">
            <Calendar className="h-4 w-4 text-gray-500" />
            <div>
              <p className="text-xs text-gray-600">Last check-in</p>
              <p className="text-sm font-bold text-gray-700">{lastCheckIn}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-lg p-2">
          <div className="flex items-center space-x-2">
            <Users className="h-4 w-4 text-blue-500" />
            <div>
              <p className="text-xs text-gray-600">Support status</p>
              <p className="text-sm font-bold text-blue-600">Needs review</p>
            </div>
          </div>
        </div>
      </div>

      {/* Action Buttons */}
      <div className="flex flex-wrap gap-2">
        <button
          onClick={onViewDetails}
          className={`flex items-center space-x-2 px-4 py-2 ${config.badgeColor} text-white rounded-lg hover:opacity-90 transition-opacity font-medium text-sm`}
        >
          <FileText className="h-4 w-4" />
          <span>View full assessment</span>
        </button>

        <button
          onClick={onContactSupport}
          className="flex items-center space-x-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors font-medium text-sm"
        >
          <Phone className="h-4 w-4" />
          <span>Contact safeguarding</span>
        </button>

        <button
          onClick={onGenerateReport}
          className="flex items-center space-x-2 px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 transition-colors font-medium text-sm"
        >
          <FileText className="h-4 w-4" />
          <span>Generate report</span>
        </button>
      </div>

      {/* Safeguarding Notice */}
      <div className="mt-3 pt-3 border-t border-red-200">
        <p className="text-xs text-red-800">
          <strong>Safeguarding protocol:</strong> This child's wellbeing indicators require immediate review.
          Please follow your organization's safeguarding procedures. All interactions are logged for child protection.
        </p>
      </div>
    </motion.div>
  )
}