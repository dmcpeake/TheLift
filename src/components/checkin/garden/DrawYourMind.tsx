import React, { useRef, useState, useEffect } from 'react'
import { X, RefreshCw } from 'lucide-react'

interface DrawYourMindProps {
  onClose: () => void
}

export function DrawYourMind({ onClose }: DrawYourMindProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const [isDrawing, setIsDrawing] = useState(false)
  const [context, setContext] = useState<CanvasRenderingContext2D | null>(null)

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
        className="bg-white rounded-lg p-8 max-w-3xl w-full mx-4 relative"
        onClick={(e) => e.stopPropagation()}
        style={{ maxHeight: '90vh', overflowY: 'auto' }}
      >
        {/* Close Button */}
        <button
          onClick={onClose}
          className="absolute top-4 right-4 w-10 h-10 rounded-full flex items-center justify-center hover:bg-blue-100 transition-colors"
        >
          <X size={20} color="#2563eb" />
        </button>

        {/* Title */}
        <h2 className="text-2xl font-semibold text-gray-900 mb-6 pr-12">
          Draw a picture of what's on your mind
        </h2>

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
            style={{ touchAction: 'none', width: '100%', height: '500px', display: 'block' }}
          />
        </div>

        {/* Buttons */}
        <div className="flex justify-center gap-4">
          <button
            onClick={clearCanvas}
            className="flex items-center gap-2 px-6 py-3 font-semibold rounded-full transition-colors"
            style={{ backgroundColor: 'white', color: '#2563eb', border: '2px solid #2563eb' }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#eff6ff'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'white'}
          >
            <RefreshCw size={18} />
            Clear
          </button>
          <button
            onClick={onClose}
            className="px-8 py-3 font-semibold rounded-full transition-colors"
            style={{ backgroundColor: '#2563eb', color: 'white' }}
            onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#1d4ed8'}
            onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#2563eb'}
          >
            Save
          </button>
        </div>
      </div>
    </div>
  )
}
