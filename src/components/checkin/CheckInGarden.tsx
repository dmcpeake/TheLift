import React from 'react'
import { useNavigate } from 'react-router-dom'

export function CheckInGarden() {
  const navigate = useNavigate()

  return (
    <>
      <style jsx>{`
        @keyframes leafGroup {
          0% {
            transform: translateX(-150px) translateY(0);
            opacity: 0;
          }
          10% {
            opacity: 0.9;
          }
          90% {
            opacity: 0.9;
          }
          100% {
            transform: translateX(calc(100vw + 150px)) translateY(-50vh);
            opacity: 0;
          }
        }
        @keyframes leafFloat1 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(-10px, -15px) rotate(45deg);
          }
          50% {
            transform: translate(-25px, 10px) rotate(-30deg);
          }
          75% {
            transform: translate(-35px, -8px) rotate(60deg);
          }
          100% {
            transform: translate(-50px, 0) rotate(360deg);
          }
        }
        @keyframes leafFloat2 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(15px, 12px) rotate(-45deg);
          }
          50% {
            transform: translate(30px, -20px) rotate(30deg);
          }
          75% {
            transform: translate(45px, 5px) rotate(-60deg);
          }
          100% {
            transform: translate(60px, -10px) rotate(-360deg);
          }
        }
        @keyframes leafFloat3 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(5px, -10px) rotate(30deg);
          }
          50% {
            transform: translate(10px, 15px) rotate(-45deg);
          }
          75% {
            transform: translate(15px, -5px) rotate(45deg);
          }
          100% {
            transform: translate(20px, 20px) rotate(720deg);
          }
        }
        @keyframes leafFloat4 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(-8px, 8px) rotate(-30deg);
          }
          50% {
            transform: translate(-20px, -15px) rotate(45deg);
          }
          75% {
            transform: translate(-30px, 10px) rotate(-45deg);
          }
          100% {
            transform: translate(-40px, -25px) rotate(360deg);
          }
        }
        @keyframes leafFloat5 {
          0% {
            transform: translate(0, 0) rotate(0deg);
          }
          25% {
            transform: translate(12px, -5px) rotate(45deg);
          }
          50% {
            transform: translate(25px, 12px) rotate(-60deg);
          }
          75% {
            transform: translate(40px, -8px) rotate(30deg);
          }
          100% {
            transform: translate(55px, 15px) rotate(-360deg);
          }
        }
        .leaf-group {
          position: fixed;
          top: 75%;
          width: 180px;
          height: 150px;
          pointer-events: none;
          z-index: 2;
          animation: leafGroup 10s linear infinite;
        }
        .leaf {
          position: absolute;
          width: 30px;
          height: 30px;
        }
        .leaf1 {
          top: 10px;
          left: 15px;
          animation: leafFloat1 3s ease-in-out infinite;
        }
        .leaf2 {
          top: 45px;
          left: 80px;
          animation: leafFloat2 3.5s ease-in-out infinite;
          animation-delay: 0.3s;
        }
        .leaf3 {
          top: 90px;
          left: 30px;
          animation: leafFloat3 4s ease-in-out infinite;
          animation-delay: 0.6s;
        }
        .leaf4 {
          top: 20px;
          left: 120px;
          animation: leafFloat4 3.8s ease-in-out infinite;
          animation-delay: 0.9s;
        }
        .leaf5 {
          top: 75px;
          left: 100px;
          animation: leafFloat5 3.2s ease-in-out infinite;
          animation-delay: 1.2s;
        }
        @keyframes butterflyPath {
          0% {
            transform: translateX(-100px) translateY(0);
            opacity: 0;
          }
          5% {
            opacity: 0.8;
          }
          15% {
            transform: translateX(15vw) translateY(-50px);
          }
          30% {
            transform: translateX(30vw) translateY(30px);
          }
          45% {
            transform: translateX(45vw) translateY(-70px);
          }
          60% {
            transform: translateX(60vw) translateY(10px);
          }
          75% {
            transform: translateX(75vw) translateY(-60px);
          }
          90% {
            transform: translateX(90vw) translateY(20px);
          }
          95% {
            opacity: 0.8;
          }
          100% {
            transform: translateX(calc(100vw + 100px)) translateY(-30px);
            opacity: 0;
          }
        }
        @keyframes butterflyWings {
          0%, 100% {
            transform: scaleY(1) scaleX(1);
          }
          50% {
            transform: scaleY(0.3) scaleX(1.1);
          }
        }
        .butterfly {
          position: fixed;
          bottom: 15%;
          width: 40px;
          height: 40px;
          pointer-events: none;
          z-index: 3;
          opacity: 0;
          animation: butterflyPath 12s linear infinite;
          animation-delay: 2s;
          animation-fill-mode: forwards;
        }
        .butterfly svg {
          animation: butterflyWings 0.2s ease-in-out infinite;
        }

        /* Mobile Optimizations */
        @media (max-width: 768px) {
          .leaf-group {
            width: 100px !important;
            height: 100px !important;
            top: 80% !important;
          }
          .leaf {
            width: 20px !important;
            height: 20px !important;
          }
          .leaf1 { top: 5px !important; left: 10px !important; }
          .leaf2 { top: 30px !important; left: 50px !important; }
          .leaf3 { top: 60px !important; left: 20px !important; }
          .leaf4 { top: 15px !important; left: 70px !important; }
          .leaf5 { top: 50px !important; left: 65px !important; }

          .butterfly {
            width: 28px !important;
            height: 28px !important;
            bottom: 20% !important;
          }
        }
      `}</style>
      <div
        className="min-h-screen bg-white relative overflow-hidden flex items-start justify-start"
        style={{
          backgroundImage: 'url(/CheckinComplete.svg)',
          backgroundSize: window.innerWidth > 768 ? 'cover' : 'cover',
          backgroundPosition: window.innerWidth > 768 ? 'center bottom' : 'center',
          backgroundAttachment: window.innerWidth > 768 ? 'fixed' : 'scroll',
          backgroundRepeat: 'no-repeat'
        }}
      >
        {/* Butterfly */}
        <div className="butterfly">
          <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            {/* Left wing */}
            <ellipse cx="12" cy="20" rx="10" ry="15" fill="#FF6B9D" fillOpacity="0.7" transform="rotate(-20 12 20)"/>
            <ellipse cx="12" cy="20" rx="8" ry="12" fill="#C66FCF" fillOpacity="0.6" transform="rotate(-20 12 20)"/>
            {/* Right wing */}
            <ellipse cx="28" cy="20" rx="10" ry="15" fill="#FF6B9D" fillOpacity="0.7" transform="rotate(20 28 20)"/>
            <ellipse cx="28" cy="20" rx="8" ry="12" fill="#C66FCF" fillOpacity="0.6" transform="rotate(20 28 20)"/>
            {/* Body */}
            <ellipse cx="20" cy="20" rx="2" ry="8" fill="#4A4A4A" fillOpacity="0.8"/>
            {/* Antennae */}
            <line x1="20" y1="16" x2="17" y2="12" stroke="#4A4A4A" strokeWidth="0.5" strokeOpacity="0.6"/>
            <line x1="20" y1="16" x2="23" y2="12" stroke="#4A4A4A" strokeWidth="0.5" strokeOpacity="0.6"/>
            <circle cx="17" cy="12" r="0.8" fill="#4A4A4A" fillOpacity="0.6"/>
            <circle cx="23" cy="12" r="0.8" fill="#4A4A4A" fillOpacity="0.6"/>
          </svg>
        </div>

        {/* Animated Leaves */}
        <div className="leaf-group">
          <div className="leaf leaf1">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#8BC34A" fillOpacity="0.85"/>
            </svg>
          </div>
          <div className="leaf leaf2">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#FFA726" fillOpacity="0.75"/>
            </svg>
          </div>
          <div className="leaf leaf3">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#FFD54F" fillOpacity="0.7"/>
            </svg>
          </div>
          <div className="leaf leaf4">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#FF7043" fillOpacity="0.8"/>
            </svg>
          </div>
          <div className="leaf leaf5">
            <svg viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.5 0C7.5 0 3 3 3 7.5C3 9.5 4.5 11 6 11.5C6 10.5 6.5 9.5 7.5 8.5C8.5 9.5 9 10.5 9 11.5C10.5 11 12 9.5 12 7.5C12 3 7.5 0 7.5 0Z" fill="#CDDC39" fillOpacity="0.65"/>
            </svg>
          </div>
        </div>

        {/* Close Button */}
        <button
          onClick={() => navigate('/')}
          className="fixed w-12 h-12 rounded-full flex items-center justify-center hover:bg-gray-50 transition-colors z-50 shadow-lg"
          style={{
            backgroundColor: 'white',
            border: '1px solid #147fe3',
            top: '40px',
            right: '40px'
          }}
        >
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#147fe3" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
            <polyline points="16 17 21 12 16 7"/>
            <line x1="21" y1="12" x2="9" y2="12"/>
          </svg>
        </button>

        {/* Content */}
        <div
          className="flex items-center justify-center transition-opacity duration-300"
          style={{
            minHeight: '100vh',
            padding: '80px',
            width: '100%'
          }}
        >
          <div className="max-w-4xl mx-auto text-center">
            <h1 className="text-4xl font-bold text-gray-900 mb-4">
              My Garden
            </h1>
            <p className="text-lg text-gray-700">
              Your garden content goes here
            </p>
          </div>
        </div>
      </div>
    </>
  )
}
