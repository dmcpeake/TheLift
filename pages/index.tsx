import React from 'react'
import Link from 'next/link'
import Head from 'next/head'

export default function HomePage() {
  return (
    <>
      <Head>
        <title>The Lift - Wellbeing Platform for Children</title>
        <meta name="description" content="Comprehensive wellbeing platform for children aged 5-11" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <div className="min-h-screen bg-gray-50 flex flex-col">
        {/* Header */}
        <header className="bg-white border-b border-gray-300 px-6 py-4">
          <div className="max-w-6xl mx-auto flex items-center justify-between">
            <div className="flex items-center space-x-4">
              <div className="w-8 h-8 bg-gray-800 rounded"></div>
              <h1 className="text-2xl font-bold text-gray-900">The Lift</h1>
            </div>
            <nav className="flex items-center space-x-6">
              <Link href="/auth/login" className="text-gray-600 hover:text-gray-900 transition-colors">
                Login
              </Link>
              <Link href="/admin/login" className="bg-gray-800 text-white px-4 py-2 rounded hover:bg-gray-700 transition-colors">
                Admin Login
              </Link>
            </nav>
          </div>
        </header>

        {/* Main Content */}
        <main className="flex-1">
          {/* Hero Section */}
          <section className="bg-white py-20">
            <div className="max-w-6xl mx-auto px-6 text-center">
              <h2 className="text-5xl font-bold text-gray-900 mb-6">
                Wellbeing Platform for Children
              </h2>
              <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
                A comprehensive platform designed for children aged 5-11, with secure role-based access 
                for practitioners, group contacts, children, and admin staff.
              </p>
              <div className="flex justify-center space-x-4">
                <Link 
                  href="/auth/login" 
                  className="bg-gray-800 text-white px-8 py-3 rounded-lg hover:bg-gray-700 transition-colors text-lg"
                >
                  Get Started
                </Link>
                <Link 
                  href="#features" 
                  className="border border-gray-300 text-gray-700 px-8 py-3 rounded-lg hover:bg-gray-50 transition-colors text-lg"
                >
                  Learn More
                </Link>
              </div>
            </div>
          </section>

          {/* Features Section */}
          <section id="features" className="py-20 bg-gray-50">
            <div className="max-w-6xl mx-auto px-6">
              <h3 className="text-3xl font-bold text-center text-gray-900 mb-12">
                Key Features
              </h3>
              <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
                <div className="bg-white p-6 rounded-lg border border-gray-200">
                  <div className="w-12 h-12 bg-gray-800 rounded-lg mb-4"></div>
                  <h4 className="text-lg font-semibold text-gray-900 mb-2">
                    Dual Authentication
                  </h4>
                  <p className="text-gray-600">
                    Standard Supabase auth for adults, custom username/PIN system for children
                  </p>
                </div>
                <div className="bg-white p-6 rounded-lg border border-gray-200">
                  <div className="w-12 h-12 bg-gray-700 rounded-lg mb-4"></div>
                  <h4 className="text-lg font-semibold text-gray-900 mb-2">
                    Role-based Access
                  </h4>
                  <p className="text-gray-600">
                    Secure routing with automatic redirection based on user role and permissions
                  </p>
                </div>
                <div className="bg-white p-6 rounded-lg border border-gray-200">
                  <div className="w-12 h-12 bg-gray-600 rounded-lg mb-4"></div>
                  <h4 className="text-lg font-semibold text-gray-900 mb-2">
                    Child Safety
                  </h4>
                  <p className="text-gray-600">
                    Age-appropriate interfaces designed with simplified interactions for children
                  </p>
                </div>
                <div className="bg-white p-6 rounded-lg border border-gray-200">
                  <div className="w-12 h-12 bg-gray-500 rounded-lg mb-4"></div>
                  <h4 className="text-lg font-semibold text-gray-900 mb-2">
                    Wellbeing Tracking
                  </h4>
                  <p className="text-gray-600">
                    Interactive activities and comprehensive progress monitoring tools
                  </p>
                </div>
              </div>
            </div>
          </section>

          {/* User Roles Section */}
          <section className="py-20 bg-white">
            <div className="max-w-6xl mx-auto px-6">
              <h3 className="text-3xl font-bold text-center text-gray-900 mb-12">
                User Roles & Access
              </h3>
              <div className="grid md:grid-cols-3 gap-8">
                <div className="text-center">
                  <div className="w-16 h-16 bg-gray-800 rounded-full mx-auto mb-4"></div>
                  <h4 className="text-xl font-semibold text-gray-900 mb-2">Admin</h4>
                  <p className="text-gray-600 mb-4">
                    Full platform oversight and client management capabilities
                  </p>
                  <Link 
                    href="/admin/login" 
                    className="text-gray-800 border border-gray-300 px-4 py-2 rounded hover:bg-gray-50 transition-colors inline-block"
                  >
                    Admin Login
                  </Link>
                </div>
                <div className="text-center">
                  <div className="w-16 h-16 bg-gray-700 rounded-full mx-auto mb-4"></div>
                  <h4 className="text-xl font-semibold text-gray-900 mb-2">Practitioner</h4>
                  <p className="text-gray-600 mb-4">
                    Child management and access to wellbeing data and analytics
                  </p>
                  <Link 
                    href="/auth/login" 
                    className="text-gray-800 border border-gray-300 px-4 py-2 rounded hover:bg-gray-50 transition-colors inline-block"
                  >
                    Staff Login
                  </Link>
                </div>
                <div className="text-center">
                  <div className="w-16 h-16 bg-gray-600 rounded-full mx-auto mb-4"></div>
                  <h4 className="text-xl font-semibold text-gray-900 mb-2">Children</h4>
                  <p className="text-gray-600 mb-4">
                    Safe access to wellbeing activities and personal dashboard
                  </p>
                  <Link 
                    href="/auth/login" 
                    className="text-gray-800 border border-gray-300 px-4 py-2 rounded hover:bg-gray-50 transition-colors inline-block"
                  >
                    Child Login
                  </Link>
                </div>
              </div>
            </div>
          </section>
        </main>

        {/* Footer */}
        <footer className="bg-gray-800 text-white py-8">
          <div className="max-w-6xl mx-auto px-6 text-center">
            <p className="text-gray-400">
              © 2024 The Lift - Wellbeing Platform for Children
            </p>
          </div>
        </footer>
      </div>
    </>
  )
}