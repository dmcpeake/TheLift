import { Check } from 'lucide-react'

interface Child {
  id: string
  name: string
  initials?: string
  averageMood?: number
}

interface ChildSelectorProps {
  availableChildren: Child[]
  selectedChildren: string[]
  onSelectionChange: (selected: string[]) => void
  maxSelection?: number
}

// Avatar styles matching main analytics
const AVATAR_STYLES = [
  { bg: 'bg-blue-500', shape: 'rounded-full' },
  { bg: 'bg-green-500', shape: 'rounded-lg' },
  { bg: 'bg-purple-500', shape: 'rounded-full' },
  { bg: 'bg-orange-500', shape: 'rounded-lg' },
  { bg: 'bg-pink-500', shape: 'rounded-full' },
  { bg: 'bg-teal-500', shape: 'rounded-lg' },
  { bg: 'bg-red-500', shape: 'rounded-full' },
  { bg: 'bg-indigo-500', shape: 'rounded-lg' },
  { bg: 'bg-yellow-500', shape: 'rounded-full' },
]

export function ChildSelector({
  availableChildren,
  selectedChildren,
  onSelectionChange,
  maxSelection = 5
}: ChildSelectorProps) {

  const toggleChild = (childId: string) => {
    if (selectedChildren.includes(childId)) {
      onSelectionChange(selectedChildren.filter(id => id !== childId))
    } else if (selectedChildren.length < maxSelection) {
      onSelectionChange([...selectedChildren, childId])
    }
  }

  const getAvatarStyle = (index: number) => {
    return AVATAR_STYLES[index % AVATAR_STYLES.length]
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h4 className="text-sm font-medium text-gray-900">
          Select children to compare
        </h4>
        <span className="text-xs text-gray-500">
          {selectedChildren.length}/{maxSelection} selected
        </span>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {availableChildren.map((child, index) => {
          const isSelected = selectedChildren.includes(child.id)
          const isDisabled = !isSelected && selectedChildren.length >= maxSelection
          const avatarStyle = getAvatarStyle(index)

          return (
            <button
              key={child.id}
              onClick={() => toggleChild(child.id)}
              disabled={isDisabled}
              className={`
                relative flex items-center space-x-3 p-3 rounded-lg border-2 transition-all
                ${isSelected
                  ? 'border-blue-500 bg-blue-50'
                  : isDisabled
                  ? 'border-gray-200 bg-gray-50 opacity-50 cursor-not-allowed'
                  : 'border-gray-200 bg-white hover:border-gray-300 hover:bg-gray-50'
                }
              `}
            >
              {/* Avatar */}
              <div className={`w-10 h-10 flex items-center justify-center text-white font-semibold ${avatarStyle.bg} ${avatarStyle.shape}`}>
                <span className="text-xs">
                  {child.initials}
                </span>
              </div>

              {/* Child Info */}
              <div className="flex-1 text-left">
                <p className="font-medium text-sm text-gray-900">
                  {child.name}
                </p>
                {child.averageMood && (
                  <p className="text-xs text-gray-500">
                    Avg mood: {child.averageMood.toFixed(1)}
                  </p>
                )}
              </div>

              {/* Selection Indicator */}
              {isSelected && (
                <div className="absolute top-2 right-2">
                  <div className="w-5 h-5 bg-blue-500 rounded-full flex items-center justify-center">
                    <Check className="h-3 w-3 text-white" />
                  </div>
                </div>
              )}
            </button>
          )
        })}
      </div>

      {availableChildren.length === 0 && (
        <div className="text-center py-8 text-gray-500">
          <p className="text-sm">No children available for comparison</p>
        </div>
      )}

      {selectedChildren.length < 2 && availableChildren.length > 0 && (
        <div className="text-center py-2">
          <p className="text-xs text-amber-600">
            Select at least 2 children to see the comparison
          </p>
        </div>
      )}
    </div>
  )
}