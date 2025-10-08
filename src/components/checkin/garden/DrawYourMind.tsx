import React, { useRef, useState, useEffect } from 'react'
import { X, RefreshCw, Eraser } from 'lucide-react'

interface DrawYourMindProps {
  onClose: () => void
}

type BrushType = 'pen' | 'marker' | 'highlighter' | 'eraser'

export function DrawYourMind({ onClose }: DrawYourMindProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const [isDrawing, setIsDrawing] = useState(false)
  const [context, setContext] = useState<CanvasRenderingContext2D | null>(null)
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 768)
  const [color, setColor] = useState('#374151')
  const [brushType, setBrushType] = useState<BrushType>('pen')
  const [brushSize, setBrushSize] = useState(4)
  const [lastX, setLastX] = useState(0)
  const [lastY, setLastY] = useState(0)

  const colors = [
    { name: 'Black', value: '#000000' },
    { name: 'Gray', value: '#6B7280' },
    { name: 'Red', value: '#EF4444' },
    { name: 'Orange', value: '#F97316' },
    { name: 'Yellow', value: '#EAB308' },
    { name: 'Green', value: '#22C55E' },
    { name: 'Blue', value: '#3B82F6' },
    { name: 'Purple', value: '#A855F7' },
    { name: 'Pink', value: '#EC4899' },
    { name: 'Brown', value: '#92400E' }
  ]

  useEffect(() => {
    const canvas = canvasRef.current
    if (canvas) {
      // Set canvas size to match its display size
      const rect = canvas.getBoundingClientRect()
      canvas.width = rect.width
      canvas.height = rect.height

      const ctx = canvas.getContext('2d')
      if (ctx) {
        ctx.lineCap = 'round'
        ctx.lineJoin = 'round'
        ctx.lineWidth = brushSize
        ctx.strokeStyle = color
        setContext(ctx)
      }
    }
  }, [])

  useEffect(() => {
    if (context) {
      // Update context settings when brush type, color, or size changes
      if (brushType === 'eraser') {
        context.globalCompositeOperation = 'destination-out'
        context.lineWidth = brushSize * 3
      } else {
        context.globalCompositeOperation = 'source-over'
        context.strokeStyle = color

        switch (brushType) {
          case 'pen':
            context.lineWidth = brushSize
            context.globalAlpha = 1
            break
          case 'marker':
            context.lineWidth = brushSize * 2
            context.globalAlpha = 0.9
            break
          case 'highlighter':
            context.lineWidth = brushSize * 3
            context.globalAlpha = 0.5
            break
        }
      }
    }
  }, [color, brushType, brushSize, context])

  const startDrawing = (e: React.MouseEvent<HTMLCanvasElement> | React.TouchEvent<HTMLCanvasElement>) => {
    if (!context || !canvasRef.current) return

    // Ensure context settings are applied before drawing
    if (brushType === 'eraser') {
      context.globalCompositeOperation = 'destination-out'
      context.lineWidth = brushSize * 3
      context.globalAlpha = 1
    } else {
      context.globalCompositeOperation = 'source-over'
      context.strokeStyle = color

      switch (brushType) {
        case 'pen':
          context.lineWidth = brushSize
          context.globalAlpha = 1
          break
        case 'marker':
          context.lineWidth = brushSize * 2
          context.globalAlpha = 0.9
          break
        case 'highlighter':
          context.lineWidth = brushSize * 3
          context.globalAlpha = 0.5
          break
      }
    }

    setIsDrawing(true)
    const rect = canvasRef.current.getBoundingClientRect()

    let clientX, clientY
    if ('touches' in e) {
      clientX = e.touches[0].clientX
      clientY = e.touches[0].clientY
    } else {
      clientX = e.clientX
      clientY = e.clientY
    }

    const x = ((clientX - rect.left) / rect.width) * canvasRef.current.width
    const y = ((clientY - rect.top) / rect.height) * canvasRef.current.height

    setLastX(x)
    setLastY(y)
  }

  const draw = (e: React.MouseEvent<HTMLCanvasElement> | React.TouchEvent<HTMLCanvasElement>) => {
    if (!isDrawing || !context || !canvasRef.current) return
    e.preventDefault()

    const rect = canvasRef.current.getBoundingClientRect()

    let clientX, clientY
    if ('touches' in e) {
      clientX = e.touches[0].clientX
      clientY = e.touches[0].clientY
    } else {
      clientX = e.clientX
      clientY = e.clientY
    }

    const x = ((clientX - rect.left) / rect.width) * canvasRef.current.width
    const y = ((clientY - rect.top) / rect.height) * canvasRef.current.height

    // Draw a line segment from last position to current position
    context.beginPath()
    context.moveTo(lastX, lastY)
    context.lineTo(x, y)
    context.stroke()

    // Update last position
    setLastX(x)
    setLastY(y)
  }

  const stopDrawing = () => {
    setIsDrawing(false)
  }

  const clearCanvas = () => {
    if (!context || !canvasRef.current) return
    context.clearRect(0, 0, canvasRef.current.width, canvasRef.current.height)
  }

  return (
    <div
      className="fixed inset-0 flex items-center justify-center"
      style={{
        zIndex: 9999,
        backgroundColor: 'rgba(0, 0, 0, 0.8)'
      }}
      onClick={onClose}
    >
      <div
        className="bg-white rounded-lg max-w-3xl w-full mx-4 relative"
        onClick={(e) => e.stopPropagation()}
        style={{ maxHeight: '90vh', overflowY: 'auto', padding: isMobile ? '1rem' : '2rem' }}
      >
        {/* Title */}
        <div className="flex items-center justify-between mb-4">
          <h2 className="font-semibold text-gray-900" style={{ fontSize: isMobile ? '18px' : '24px' }}>
            Draw a picture of what's on your mind
          </h2>
          <button
            onClick={clearCanvas}
            className="transition-colors flex-shrink-0"
            style={{ color: '#2563eb' }}
            onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
            onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
          >
            <RefreshCw size={isMobile ? 20 : 24} />
          </button>
        </div>

        {/* Toolbar */}
        <div className="mb-3">
          {/* Brush Type */}
          <div className="mb-2">
            <label className="font-medium text-gray-700 mb-1 block" style={{ fontSize: isMobile ? '12px' : '14px' }}>Tool</label>
            <div className="flex gap-1 flex-wrap" style={{ fontSize: isMobile ? '12px' : '14px' }}>
              <button
                onClick={() => setBrushType('pen')}
                className="rounded-lg font-medium transition-colors"
                style={{
                  padding: isMobile ? '6px 10px' : '8px 12px',
                  fontSize: isMobile ? '12px' : '14px',
                  backgroundColor: brushType === 'pen' ? '#3B82F6' : '#F3F4F6',
                  color: brushType === 'pen' ? 'white' : '#374151'
                }}
              >
                Pen
              </button>
              <button
                onClick={() => setBrushType('marker')}
                className="rounded-lg font-medium transition-colors"
                style={{
                  padding: isMobile ? '6px 10px' : '8px 12px',
                  fontSize: isMobile ? '12px' : '14px',
                  backgroundColor: brushType === 'marker' ? '#3B82F6' : '#F3F4F6',
                  color: brushType === 'marker' ? 'white' : '#374151'
                }}
              >
                Marker
              </button>
              <button
                onClick={() => setBrushType('highlighter')}
                className="rounded-lg font-medium transition-colors"
                style={{
                  padding: isMobile ? '6px 10px' : '8px 12px',
                  fontSize: isMobile ? '12px' : '14px',
                  backgroundColor: brushType === 'highlighter' ? '#3B82F6' : '#F3F4F6',
                  color: brushType === 'highlighter' ? 'white' : '#374151'
                }}
              >
                Highlighter
              </button>
              <button
                onClick={() => setBrushType('eraser')}
                className="rounded-lg font-medium transition-colors flex items-center gap-1"
                style={{
                  padding: isMobile ? '6px 10px' : '8px 12px',
                  fontSize: isMobile ? '12px' : '14px',
                  backgroundColor: brushType === 'eraser' ? '#3B82F6' : '#F3F4F6',
                  color: brushType === 'eraser' ? 'white' : '#374151'
                }}
              >
                <Eraser size={isMobile ? 14 : 16} />
                Eraser
              </button>
            </div>
          </div>

          {/* Colors */}
          <div className="mb-2">
            <label className="font-medium text-gray-700 mb-1 block" style={{ fontSize: isMobile ? '12px' : '14px' }}>Color</label>
            <div className="flex gap-1 flex-wrap">
              {colors.map((c) => (
                <button
                  key={c.value}
                  onClick={() => setColor(c.value)}
                  className="rounded-full transition-transform hover:scale-110"
                  style={{
                    width: isMobile ? '28px' : '32px',
                    height: isMobile ? '28px' : '32px',
                    backgroundColor: c.value,
                    border: color === c.value ? '3px solid #3B82F6' : '2px solid #D1D5DB',
                    boxShadow: color === c.value ? '0 0 0 2px white' : 'none'
                  }}
                  title={c.name}
                />
              ))}
            </div>
          </div>

          {/* Brush Size */}
          <div>
            <label className="font-medium text-gray-700 mb-1 block" style={{ fontSize: isMobile ? '12px' : '14px' }}>Size</label>
            <div className="flex gap-1">
              <button
                onClick={() => setBrushSize(2)}
                className="rounded-lg font-medium transition-colors"
                style={{
                  padding: isMobile ? '6px 10px' : '8px 12px',
                  fontSize: isMobile ? '12px' : '14px',
                  backgroundColor: brushSize === 2 ? '#3B82F6' : '#F3F4F6',
                  color: brushSize === 2 ? 'white' : '#374151'
                }}
              >
                Small
              </button>
              <button
                onClick={() => setBrushSize(4)}
                className="rounded-lg font-medium transition-colors"
                style={{
                  padding: isMobile ? '6px 10px' : '8px 12px',
                  fontSize: isMobile ? '12px' : '14px',
                  backgroundColor: brushSize === 4 ? '#3B82F6' : '#F3F4F6',
                  color: brushSize === 4 ? 'white' : '#374151'
                }}
              >
                Medium
              </button>
              <button
                onClick={() => setBrushSize(6)}
                className="rounded-lg font-medium transition-colors"
                style={{
                  padding: isMobile ? '6px 10px' : '8px 12px',
                  fontSize: isMobile ? '12px' : '14px',
                  backgroundColor: brushSize === 6 ? '#3B82F6' : '#F3F4F6',
                  color: brushSize === 6 ? 'white' : '#374151'
                }}
              >
                Large
              </button>
            </div>
          </div>
        </div>

        {/* Canvas */}
        <div className="mb-6">
          <canvas
            ref={canvasRef}
            onMouseDown={startDrawing}
            onMouseMove={draw}
            onMouseUp={stopDrawing}
            onMouseLeave={stopDrawing}
            onTouchStart={startDrawing}
            onTouchMove={draw}
            onTouchEnd={stopDrawing}
            className="border-2 border-gray-300 rounded-lg w-full cursor-crosshair"
            style={{ touchAction: 'none', width: '100%', height: isMobile ? '200px' : '400px', display: 'block', backgroundColor: 'white' }}
          />
        </div>

        {/* Action Footer */}
        <div className="mt-8 pt-4 border-t border-gray-200" style={{ marginBottom: '0rem' }}>
          <div className="flex items-center" style={{ height: '20px' }}>
            <button
              onClick={onClose}
              className="flex-1 font-medium transition-colors text-center"
              style={{ fontSize: '16px', color: '#2563eb', padding: '0', height: '20px', lineHeight: '20px' }}
              onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
              onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
            >
              CLOSE
            </button>
            <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>
            <button
              onClick={onClose}
              className="flex-1 font-medium transition-colors text-center"
              style={{ fontSize: '16px', color: '#2563eb', padding: '0', height: '20px', lineHeight: '20px' }}
              onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
              onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
            >
              SAVE
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
