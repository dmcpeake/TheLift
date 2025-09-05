import React, { useState } from 'react'
import { Button } from '../ui/button'
import { Card, CardContent } from '../ui/card'
import { MarketingNavigation } from './MarketingNavigation'
import { Heart, Mail, CheckCircle, Users, Sparkles, Clock } from 'lucide-react'

export function Waitlist() {
  const [email, setEmail] = useState('')
  const [name, setName] = useState('')
  const [organization, setOrganization] = useState('')
  const [role, setRole] = useState('')
  const [submitted, setSubmitted] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsSubmitting(true)
    
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1500))
    
    setSubmitted(true)
    setIsSubmitting(false)
  }

  const benefits = [
    {
      icon: Users,
      title: 'Early Access',
      description: 'Be among the first to use The Lift when we launch'
    },
    {
      icon: Sparkles,
      title: 'Exclusive Updates',
      description: 'Get behind-the-scenes development updates and previews'
    },
    {
      icon: Clock,
      title: 'Priority Support',
      description: 'Receive priority onboarding and dedicated support'
    }
  ]

  if (submitted) {
    return (
      <div className="min-h-screen bg-gray-50">
        <MarketingNavigation />
        
        <div className="flex items-center justify-center min-h-[80vh] px-6">
          <Card className="max-w-md w-full text-center shadow-xl">
            <CardContent className="p-8">
              <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              
              <h2 className="text-2xl font-bold text-gray-900 mb-4">
                You're on the list! 🎉
              </h2>
              
              <p className="text-gray-600 mb-6">
                Thank you for joining The Lift waitlist. We'll keep you updated on our progress and notify you as soon as we launch.
              </p>
              
              <Button 
                onClick={() => window.location.href = '/'}
                variant="outline"
                className="w-full"
              >
                Return to Home
              </Button>
            </CardContent>
          </Card>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />
      
      {/* Hero Section */}
      <section className="py-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <div className="w-16 h-16 bg-gray-900 rounded-full flex items-center justify-center mx-auto mb-8">
            <Heart className="h-8 w-8 text-white" />
          </div>
          
          <h1 className="text-5xl md:text-6xl font-bold text-gray-900 mb-6">
            Join the <span className="text-gray-700">Waitlist</span>
          </h1>
          
          <p className="text-xl text-gray-600 mb-12 max-w-2xl mx-auto">
            Be among the first to access The Lift when we launch. Get early access, exclusive updates, and help shape the future of child wellbeing support.
          </p>
        </div>
      </section>

      {/* Benefits Section */}
      <section className="py-16 px-6 bg-white">
        <div className="max-w-6xl mx-auto">
          <h2 className="text-3xl font-bold text-center text-gray-900 mb-12">
            What you'll get as an early member
          </h2>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {benefits.map((benefit, index) => (
              <Card key={index} className="text-center border-0 shadow-lg">
                <CardContent className="p-8">
                  <div className="w-14 h-14 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-6">
                    <benefit.icon className="h-7 w-7 text-gray-700" />
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 mb-4">{benefit.title}</h3>
                  <p className="text-gray-600">{benefit.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Waitlist Form */}
      <section className="py-20 px-6 bg-gray-50">
        <div className="max-w-2xl mx-auto">
          <Card className="shadow-xl">
            <CardContent className="p-8">
              <div className="text-center mb-8">
                <Mail className="h-12 w-12 text-gray-700 mx-auto mb-4" />
                <h2 className="text-2xl font-bold text-gray-900 mb-2">
                  Reserve Your Spot
                </h2>
                <p className="text-gray-600">
                  Join thousands of educators, clinicians, and parents waiting for The Lift
                </p>
              </div>

              <form onSubmit={handleSubmit} className="space-y-6">
                <div>
                  <label htmlFor="name" className="block text-sm font-medium text-gray-700 mb-2">
                    Full Name *
                  </label>
                  <input
                    type="text"
                    id="name"
                    required
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-500 focus:border-transparent"
                    placeholder="Your full name"
                  />
                </div>

                <div>
                  <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">
                    Email Address *
                  </label>
                  <input
                    type="email"
                    id="email"
                    required
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-500 focus:border-transparent"
                    placeholder="your@email.com"
                  />
                </div>

                <div>
                  <label htmlFor="organization" className="block text-sm font-medium text-gray-700 mb-2">
                    Organization
                  </label>
                  <input
                    type="text"
                    id="organization"
                    value={organization}
                    onChange={(e) => setOrganization(e.target.value)}
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-500 focus:border-transparent"
                    placeholder="School, clinic, or organization name"
                  />
                </div>

                <div>
                  <label htmlFor="role" className="block text-sm font-medium text-gray-700 mb-2">
                    Your Role
                  </label>
                  <select
                    id="role"
                    value={role}
                    onChange={(e) => setRole(e.target.value)}
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-500 focus:border-transparent"
                  >
                    <option value="">Select your role</option>
                    <option value="teacher">Teacher</option>
                    <option value="headteacher">Headteacher</option>
                    <option value="counselor">School Counselor</option>
                    <option value="psychologist">Psychologist</option>
                    <option value="therapist">Therapist</option>
                    <option value="social-worker">Social Worker</option>
                    <option value="parent">Parent</option>
                    <option value="administrator">Administrator</option>
                    <option value="other">Other</option>
                  </select>
                </div>

                <Button 
                  type="submit" 
                  disabled={isSubmitting}
                  className="w-full bg-gray-900 hover:bg-gray-800 py-4 text-lg"
                >
                  {isSubmitting ? 'Joining...' : 'Join the Waitlist'}
                </Button>
              </form>

              <p className="text-xs text-gray-500 mt-6 text-center">
                We respect your privacy. Unsubscribe at any time.
              </p>
            </CardContent>
          </Card>
        </div>
      </section>

      {/* Social Proof */}
      <section className="py-16 px-6 bg-white">
        <div className="max-w-4xl mx-auto text-center">
          <p className="text-gray-600 text-lg mb-8">
            Join educators, clinicians, and parents from leading organizations
          </p>
          
          <div className="flex flex-wrap justify-center items-center gap-8 opacity-60">
            <div className="text-gray-400 font-semibold text-lg">NHS Trusts</div>
            <div className="text-gray-400 font-semibold text-lg">Academy Schools</div>
            <div className="text-gray-400 font-semibold text-lg">Private Practices</div>
            <div className="text-gray-400 font-semibold text-lg">Local Authorities</div>
          </div>
        </div>
      </section>
    </div>
  )
}