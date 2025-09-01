import React, { useState, useRef, useEffect, useCallback } from 'react'

interface PinInputProps {
  value: string
  onChange: (pin: string) => void
  placeholder?: string
  disabled?: boolean
  className?: string
}

export function PinInput({ value, onChange, placeholder = '1234', disabled = false, className = '' }: PinInputProps) {
  const [digits, setDigits] = useState(['', '', '', ''])
  const inputRefs = [useRef<HTMLInputElement>(null), useRef<HTMLInputElement>(null), useRef<HTMLInputElement>(null), useRef<HTMLInputElement>(null)]
  const isUpdatingFromProp = useRef(false)

  // Update digits when value prop changes
  useEffect(() => {
    if (value.length <= 4) {
      const newDigits = value.padEnd(4, '').split('').slice(0, 4)
      // Only update if digits actually changed
      if (JSON.stringify(newDigits) !== JSON.stringify(digits)) {
        isUpdatingFromProp.current = true
        setDigits(newDigits)
      }
    }
  }, [value])

  // Update parent when digits change (but not when updating from prop)
  useEffect(() => {
    if (isUpdatingFromProp.current) {
      isUpdatingFromProp.current = false
      return
    }
    
    const pin = digits.join('').replace(/\s/g, '')
    if (pin !== value) {
      onChange(pin)
    }
  }, [digits, value])

  const handleInputChange = useCallback((index: number, inputValue: string) => {
    // Only allow single digits
    const digit = inputValue.replace(/\D/g, '').slice(-1)
    
    // Only update if the digit actually changed
    if (digits[index] !== digit) {
      const newDigits = [...digits]
      newDigits[index] = digit
      setDigits(newDigits)

      // Auto-focus next input if digit was entered
      if (digit && index < 3) {
        setTimeout(() => inputRefs[index + 1].current?.focus(), 0)
      }
    }
  }, [digits])

  const handleKeyDown = useCallback((index: number, e: React.KeyboardEvent<HTMLInputElement>) => {
    // Handle backspace
    if (e.key === 'Backspace') {
      if (!digits[index] && index > 0) {
        // If current box is empty and backspace is pressed, move to previous box
        setTimeout(() => inputRefs[index - 1].current?.focus(), 0)
      } else {
        // Clear current box
        const newDigits = [...digits]
        newDigits[index] = ''
        setDigits(newDigits)
      }
    }
    
    // Handle arrow keys
    if (e.key === 'ArrowLeft' && index > 0) {
      setTimeout(() => inputRefs[index - 1].current?.focus(), 0)
    }
    if (e.key === 'ArrowRight' && index < 3) {
      setTimeout(() => inputRefs[index + 1].current?.focus(), 0)
    }

    // Prevent non-numeric input
    if (!/[0-9]/.test(e.key) && !['Backspace', 'Delete', 'Tab', 'ArrowLeft', 'ArrowRight'].includes(e.key)) {
      e.preventDefault()
    }
  }, [digits])

  const handlePaste = useCallback((e: React.ClipboardEvent) => {
    e.preventDefault()
    const pasteData = e.clipboardData.getData('text').replace(/\D/g, '').slice(0, 4)
    
    if (pasteData.length > 0) {
      const newDigits = pasteData.padEnd(4, '').split('').slice(0, 4)
      setDigits(newDigits)
      
      // Focus the next empty box or the last box
      const nextEmptyIndex = newDigits.findIndex(digit => digit === '')
      const focusIndex = nextEmptyIndex !== -1 ? nextEmptyIndex : 3
      setTimeout(() => inputRefs[focusIndex].current?.focus(), 0)
    }
  }, [])

  const handleFocus = useCallback((index: number) => {
    // Select all text when focused
    setTimeout(() => inputRefs[index].current?.select(), 0)
  }, [])

  return (
    <div className={`flex gap-3 ${className}`}>
      {digits.map((digit, index) => (
        <input
          key={index}
          ref={inputRefs[index]}
          type="text"
          inputMode="numeric"
          maxLength={1}
          value={digit}
          onChange={(e) => handleInputChange(index, e.target.value)}
          onKeyDown={(e) => handleKeyDown(index, e)}
          onPaste={handlePaste}
          onFocus={() => handleFocus(index)}
          disabled={disabled}
          placeholder={placeholder[index] || ''}
          className="w-12 h-12 text-center text-lg border-2 border-gray-300 rounded-md bg-white focus:border-gray-500 focus:ring-2 focus:ring-gray-200 focus:outline-none transition-all disabled:bg-gray-100 disabled:cursor-not-allowed"
        />
      ))}
    </div>
  )
}