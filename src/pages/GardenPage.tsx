import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { X, Heart, Star, Smile, Users, Sparkles, Edit3, Check, Plus } from 'lucide-react'

interface GratefulItem {
  id: string
  text: string
}

interface HappinessItem {
  id: string
  text: string
}

interface KindActItem {
  id: string
  text: string
}

interface GlimmerItem {
  id: string
  text: string
}

interface ProgressItem {
  id: string
  text: string
}

export function GardenPage() {
  const navigate = useNavigate()

  // State for each card type
  const [gratefulItems, setGratefulItems] = useState<GratefulItem[]>([])
  const [happinessItems, setHappinessItems] = useState<HappinessItem[]>([])
  const [kindActItems, setKindActItems] = useState<KindActItem[]>([])
  const [glimmerItems, setGlimmerItems] = useState<GlimmerItem[]>([])
  const [progressItems, setProgressItems] = useState<ProgressItem[]>([])

  // Editing states
  const [editingGrateful, setEditingGrateful] = useState<string | null>(null)
  const [editingHappiness, setEditingHappiness] = useState<string | null>(null)
  const [editingKindAct, setEditingKindAct] = useState<string | null>(null)
  const [editingGlimmer, setEditingGlimmer] = useState<string | null>(null)
  const [editingProgress, setEditingProgress] = useState<string | null>(null)

  // New item states
  const [newGratefulText, setNewGratefulText] = useState('')
  const [newHappinessText, setNewHappinessText] = useState('')
  const [newKindActText, setNewKindActText] = useState('')
  const [newGlimmerText, setNewGlimmerText] = useState('')
  const [newProgressText, setNewProgressText] = useState('')

  const addGratefulItem = () => {
    if (newGratefulText.trim()) {
      setGratefulItems([...gratefulItems, { id: Date.now().toString(), text: newGratefulText.trim() }])
      setNewGratefulText('')
    }
  }

  const addHappinessItem = () => {
    if (newHappinessText.trim()) {
      setHappinessItems([...happinessItems, { id: Date.now().toString(), text: newHappinessText.trim() }])
      setNewHappinessText('')
    }
  }

  const addKindActItem = () => {
    if (newKindActText.trim()) {
      setKindActItems([...kindActItems, { id: Date.now().toString(), text: newKindActText.trim() }])
      setNewKindActText('')
    }
  }

  const addGlimmerItem = () => {
    if (newGlimmerText.trim()) {
      setGlimmerItems([...glimmerItems, { id: Date.now().toString(), text: newGlimmerText.trim() }])
      setNewGlimmerText('')
    }
  }

  const addProgressItem = () => {
    if (newProgressText.trim()) {
      setProgressItems([...progressItems, { id: Date.now().toString(), text: newProgressText.trim() }])
      setNewProgressText('')
    }
  }

  const removeItem = (id: string, type: 'grateful' | 'happiness' | 'kindAct' | 'glimmer' | 'progress') => {
    switch (type) {
      case 'grateful':
        setGratefulItems(gratefulItems.filter(item => item.id !== id))
        break
      case 'happiness':
        setHappinessItems(happinessItems.filter(item => item.id !== id))
        break
      case 'kindAct':
        setKindActItems(kindActItems.filter(item => item.id !== id))
        break
      case 'glimmer':
        setGlimmerItems(glimmerItems.filter(item => item.id !== id))
        break
      case 'progress':
        setProgressItems(progressItems.filter(item => item.id !== id))
        break
    }
  }

  const GardenCard = ({
    title,
    icon: Icon,
    bgColor,
    textColor,
    items,
    onAdd,
    onRemove,
    newText,
    setNewText,
    type
  }: {
    title: string
    icon: React.ComponentType<any>
    bgColor: string
    textColor: string
    items: Array<{ id: string; text: string }>
    onAdd: () => void
    onRemove: (id: string) => void
    newText: string
    setNewText: (text: string) => void
    type: string
  }) => (
    <div className={`rounded-xl p-6 shadow-lg ${bgColor} min-h-[400px]`}>
      <div className="flex items-center gap-3 mb-6">
        <Icon className={`h-6 w-6 ${textColor}`} />
        <h2 className={`text-xl font-semibold ${textColor}`}>{title}</h2>
      </div>

      {/* Items list */}
      <div className="space-y-3 mb-6">
        {items.map((item, index) => (
          <div key={item.id} className="flex items-start gap-3 group">
            <span className={`text-sm font-medium ${textColor} opacity-70 mt-1 min-w-[20px]`}>
              {index + 1}.
            </span>
            <p className={`flex-1 ${textColor} bg-white/20 rounded-lg p-3 text-sm leading-relaxed`}>
              {item.text}
            </p>
            <button
              onClick={() => onRemove(item.id)}
              className="opacity-0 group-hover:opacity-100 transition-opacity duration-200 text-red-500 hover:text-red-700 mt-3"
            >
              <X className="h-4 w-4" />
            </button>
          </div>
        ))}
      </div>

      {/* Add new item */}
      {items.length < 3 && (
        <div className="space-y-3">
          <textarea
            value={newText}
            onChange={(e) => setNewText(e.target.value)}
            placeholder={`Add something ${type === 'grateful' ? "you're grateful for" : type === 'happiness' ? 'that made you happy' : type === 'kindAct' ? 'kind you did' : type === 'glimmer' ? 'that sparked joy' : 'you made progress on'}...`}
            className="w-full p-3 rounded-lg border-0 bg-white/30 placeholder-gray-600 text-gray-800 text-sm resize-none"
            rows={2}
            onKeyDown={(e) => {
              if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault()
                onAdd()
              }
            }}
          />
          <button
            onClick={onAdd}
            disabled={!newText.trim()}
            className="flex items-center gap-2 px-4 py-2 bg-white/30 hover:bg-white/40 disabled:opacity-50 disabled:cursor-not-allowed rounded-lg transition-all duration-200 text-sm font-medium"
          >
            <Plus className="h-4 w-4" />
            Add
          </button>
        </div>
      )}

      {items.length >= 3 && (
        <div className="text-center">
          <p className={`text-sm ${textColor} opacity-70`}>All set! ✨</p>
        </div>
      )}
    </div>
  )

  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 via-blue-50 to-purple-50">
      {/* Header with close button */}
      <div className="relative p-6">
        <button
          onClick={() => navigate('/checkin/home')}
          className="absolute top-6 right-6 w-12 h-12 rounded-full bg-white shadow-lg flex items-center justify-center hover:shadow-xl transition-shadow duration-200"
        >
          <X className="h-6 w-6 text-gray-600" />
        </button>

        <div className="max-w-6xl mx-auto text-center">
          <h1 className="text-4xl font-bold text-gray-800 mb-4">
            🌻 The Garden 🌻
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Take a moment to reflect on the good things in your life. Each positive thought helps your inner garden grow.
          </p>
        </div>
      </div>

      {/* Garden cards grid */}
      <div className="max-w-7xl mx-auto px-6 pb-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

          {/* 3 Things I'm Grateful For */}
          <GardenCard
            title="3 Things I'm Grateful For"
            icon={Heart}
            bgColor="bg-gradient-to-br from-pink-200 to-rose-300"
            textColor="text-rose-800"
            items={gratefulItems}
            onAdd={addGratefulItem}
            onRemove={(id) => removeItem(id, 'grateful')}
            newText={newGratefulText}
            setNewText={setNewGratefulText}
            type="grateful"
          />

          {/* 3 Things That Made Me Happy */}
          <GardenCard
            title="3 Things That Made Me Happy"
            icon={Smile}
            bgColor="bg-gradient-to-br from-yellow-200 to-orange-300"
            textColor="text-orange-800"
            items={happinessItems}
            onAdd={addHappinessItem}
            onRemove={(id) => removeItem(id, 'happiness')}
            newText={newHappinessText}
            setNewText={setNewHappinessText}
            type="happiness"
          />

          {/* 3 Kind Acts Today */}
          <GardenCard
            title="3 Kind Acts Today"
            icon={Users}
            bgColor="bg-gradient-to-br from-blue-200 to-indigo-300"
            textColor="text-indigo-800"
            items={kindActItems}
            onAdd={addKindActItem}
            onRemove={(id) => removeItem(id, 'kindAct')}
            newText={newKindActText}
            setNewText={setNewKindActText}
            type="kindAct"
          />

          {/* My Glimmers */}
          <GardenCard
            title="My Glimmers"
            icon={Sparkles}
            bgColor="bg-gradient-to-br from-purple-200 to-pink-300"
            textColor="text-purple-800"
            items={glimmerItems}
            onAdd={addGlimmerItem}
            onRemove={(id) => removeItem(id, 'glimmer')}
            newText={newGlimmerText}
            setNewText={setNewGlimmerText}
            type="glimmer"
          />

          {/* My Progress */}
          <GardenCard
            title="My Progress"
            icon={Star}
            bgColor="bg-gradient-to-br from-green-200 to-emerald-300"
            textColor="text-emerald-800"
            items={progressItems}
            onAdd={addProgressItem}
            onRemove={(id) => removeItem(id, 'progress')}
            newText={newProgressText}
            setNewText={setNewProgressText}
            type="progress"
          />

        </div>

        {/* Bottom summary */}
        <div className="mt-12 text-center">
          <div className="bg-white/70 backdrop-blur rounded-2xl p-8 shadow-lg max-w-2xl mx-auto">
            <h3 className="text-2xl font-semibold text-gray-800 mb-4">
              Your Garden is Growing! 🌱
            </h3>
            <p className="text-gray-600 text-lg leading-relaxed">
              Every positive thought and grateful moment you capture here helps nurture your wellbeing.
              Keep tending to your inner garden and watch it flourish.
            </p>
            <div className="mt-6">
              <button
                onClick={() => navigate('/checkin/home')}
                className="px-8 py-3 bg-gradient-to-r from-green-500 to-emerald-500 text-white font-semibold rounded-full hover:from-green-600 hover:to-emerald-600 transition-all duration-200 shadow-lg hover:shadow-xl"
              >
                Return to Check-in
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}