import React, { useRef, useState, useEffect } from 'react'
import { X, RefreshCw } from 'lucide-react'

interface DrawYourMindProps {
  onClose: () => void
}

export function DrawYourMind({ onClose }: DrawYourMindProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const [isDrawing, setIsDrawing] = useState(false)
  const [context, setContext] = useState<CanvasRenderingContext2D | null>(null)
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 768)

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
        ctx.lineWidth = 3
        ctx.strokeStyle = '#374151'
        setContext(ctx)
      }
    }
  }, [])

  const startDrawing = (e: React.MouseEvent<HTMLCanvasElement> | React.TouchEvent<HTMLCanvasElement>) => {
    if (!context || !canvasRef.current) return
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

    context.beginPath()
    context.moveTo(x, y)
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

    context.lineTo(x, y)
    context.stroke()
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
        style={{ maxHeight: '90vh', overflowY: 'auto', padding: '2rem' }}
      >
        {/* Title */}
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-2xl font-semibold text-gray-900">
            Draw a picture of what's on your mind
          </h2>
          <button
            onClick={clearCanvas}
            className="transition-colors"
            style={{ color: '#2563eb' }}
            onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
            onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
          >
            <RefreshCw size={24} />
          </button>
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
            style={{ touchAction: 'none', width: '100%', height: isMobile ? '300px' : '500px', display: 'block' }}
          />
        </div>

        {/* Action Footer */}
        <div className="mt-8 pt-4 border-t border-gray-200" style={{ marginBottom: '-1rem' }}>
          <div className="flex items-center">
            <button
              onClick={onClose}
              className="flex-1 font-medium transition-colors text-center"
              style={{ fontSize: '16px', color: '#2563eb' }}
              onMouseEnter={(e) => e.currentTarget.style.color = '#1d4ed8'}
              onMouseLeave={(e) => e.currentTarget.style.color = '#2563eb'}
            >
              CLOSE
            </button>
            <div style={{ width: '1px', height: '20px', backgroundColor: '#d1d5db' }}></div>
            <button
              onClick={onClose}
              className="flex-1 font-medium transition-colors text-center"
              style={{ fontSize: '16px', color: '#2563eb' }}
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
