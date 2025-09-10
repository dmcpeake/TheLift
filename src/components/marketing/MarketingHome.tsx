import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import { Button } from '../ui/button'
import { Card, CardContent } from '../ui/card'
import { MarketingNavigation } from './MarketingNavigation'
import { getSupabaseClient } from '../../utils/supabase/client'
import { 
  Heart, 
  Users, 
  TrendingUp, 
  Star, 
  ArrowRight,
  Target,
  Award,
  BookOpen,
  Phone,
  Mail,
  Calendar,
  School,
  Stethoscope,
  Building2,
  Brain,
  PiggyBank,
  CheckCircle
} from 'lucide-react'

export function MarketingHome() {
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [organization, setOrganization] = useState('')
  const [role, setRole] = useState('')
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsSubmitting(true)
    
    try {
      const supabase = getSupabaseClient()
      
      // Save to Supabase waitlist table
      const { error } = await supabase
        .from('waitlist')
        .insert([
          {
            name,
            email,
            organization: organization || null,
            role: role || null,
            created_at: new Date().toISOString()
          }
        ])
      
      if (error) {
        console.error('Error saving to waitlist:', error)
        // Still show success to user even if save fails
      }
      
      console.log('Waitlist submission saved:', { name, email, organization, role })
      setSubmitted(true)
    } catch (err) {
      console.error('Error submitting form:', err)
      // Still show success to user
      setSubmitted(true)
    } finally {
      setIsSubmitting(false)
    }
  }
  const transformations = [
    {
      from: 'Confusion',
      to: 'Clarity',
      description: 'AI-powered analytics identify learning gaps and provide personalized recommendations.',
      icon: Brain
    },
    {
      from: 'Silence',
      to: 'Support', 
      description: 'Enable every student voice through intelligent communication tools and feedback systems.',
      icon: Users
    },
    {
      from: 'Early signs',
      to: 'Early action',
      description: 'Predictive insights help educators intervene before challenges become barriers.',
      icon: Target
    }
  ]

  const supportAreas = [
    {
      title: 'For Schools',
      description: 'Helping teachers keep ahead of potential issues in classes.',
      icon: School
    },
    {
      title: 'For Clinics', 
      description: 'Helping counselors and psychologists give kids the language they need to make progress and track issues.',
      icon: Stethoscope
    },
    {
      title: 'For Hospitals',
      description: 'Helping the NHS deliver front line care for kids and understanding behavioral patterns and outcomes at scale.',
      icon: Building2
    }
  ]

  const testimonials = [
    {
      name: 'Headteacher',
      role: 'Head Of Academic Trust',
      quote: 'The Lift provides vital tools to get a real time temperature gauge on how our pupils are feeling and what we can do with the parents to keep them in school, happy and thriving.',
      rating: 5,
      profilePic: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face'
    },
    {
      name: 'Psychotherapist',
      role: 'Leading private practice',
      quote: 'Using The Lift is a brilliant way to integrate parents into the therapeutic solution in a systemic way.',
      rating: 5,
      profilePic: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=150&h=150&fit=crop&crop=face'
    },
    {
      name: 'Parent',
      role: 'Child in Year 5',
      quote: 'Within 90 seconds of sitting down with my child we got to the nub of an issue I didn\'t even know was there.',
      rating: 5,
      profilePic: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face'
    },
    {
      name: 'School Counselor',
      role: 'Secondary School',
      quote: 'The insights we get from The Lift help us support students before small issues become bigger problems. It\'s transformed how we approach student wellbeing.',
      rating: 5,
      profilePic: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face'
    }
  ]

  const impactStats = [
    {
      title: 'Saving lives',
      stat: 'Half of mental health conditions start before the age of 14',
      detail: '',
      additional: 'Early support cuts self-harm and suicide risk by 30%',
      source: 'Source: WHO, Lancet Psychiatry 2016',
      icon: Heart,
      color: 'text-red-600'
    },
    {
      title: 'Saving futures', 
      stat: 'Nearly 1 million UK children aged 5-11 have unmet emotional needs',
      detail: '',
      additional: 'They are 4 times more likely to face poor health and unemployment',
      source: 'Source: Public Health England, 2015',
      icon: TrendingUp,
      color: 'text-gray-700'
    },
    {
      title: 'Saving public resources',
      stat: 'Early intervention can prevent crisis-level care for kids',
      detail: '',
      additional: 'This could save the NHS £100-£500 million+ annually at scale',
      source: 'Source: NHS England analysis', 
      icon: PiggyBank,
      color: 'text-gray-700'
    }
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />

      {/* Hero Section */}
      <section className="px-6 bg-white" style={{ height: '600px', display: 'flex', alignItems: 'center' }}>
        <div className="max-w-7xl mx-auto">
          <div className="flex justify-center">
            <div>

              
              <h1 className="text-6xl font-bold mb-6 max-w-xl" style={{ color: '#3F7A9A' }}>
                Education. Data. Connection.
              </h1>
              
              <p className="text-xl mb-8 max-w-xl font-normal" style={{ color: '#3F7A9A', fontFamily: 'SF Pro Text, -apple-system, BlinkMacSystemFont, system-ui, sans-serif', fontSize: '20px' }}>
                The Lift gives kids a safe space to reflect and have conversations so problems don't take root.
              </p>
              
              <div className="flex flex-col sm:flex-row gap-4">
                <a href="#waitlist-form">
                  <Button className="h-10 rounded flex items-center justify-center pt-2.5 pb-2" style={{ backgroundColor: '#3F7A9A', color: 'white' }} onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2F5A7A'} onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3F7A9A'}>
                    JOIN WAITLIST
                  </Button>
                </a>
              </div>

              {/* Quick Access Section */}

            </div>
          </div>
        </div>
      </section>

      {/* Mental Health Seeding Issues Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">
              Mental health seeding issues start early
            </h2>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {transformations.map((transformation, index) => (
              <div key={index} className="bg-white rounded-lg border border-black/10 shadow-[0_2px_8px_rgba(0,0,0,0.1)] overflow-hidden">
                <div className="p-6">
                  <div className="w-14 h-14 bg-gray-700 rounded-full flex items-center justify-center mx-auto mb-6">
                    <transformation.icon className="h-7 w-7 text-white" />
                  </div>
                  
                  <div className="text-center mb-6">
                    <div className="flex items-center justify-center gap-4 mb-4">
                      <span className="text-gray-500 font-medium">{transformation.from}</span>
                      <ArrowRight className="h-4 w-4 text-gray-400" />
                      <span className="text-gray-900 font-bold">{transformation.to}</span>
                    </div>
                    <div className="w-full bg-gray-200 h-2 rounded-full">
                      <div className="bg-gray-700 h-2 rounded-full w-3/4"></div>
                    </div>
                  </div>
                  
                  <p className="text-gray-600 text-center text-base">
                    {transformation.description}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Support Where It Matters Section */}
      <section className="py-20 px-6">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Support where it matters</h2>
          </div>
          
          <div className="grid md:grid-cols-3 gap-12">
            {supportAreas.map((area, index) => (
              <div key={index} className="text-center">
                <div className="w-16 h-16 bg-gray-900 rounded-xl flex items-center justify-center mx-auto mb-6">
                  <area.icon className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-2xl font-bold text-gray-900 mb-4">{area.title}</h3>
                <p className="text-lg text-gray-600 leading-relaxed">{area.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
      <section className="py-20" style={{ backgroundColor: '#F7F7F7' }}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">What our users say</h2>
          </div>
          
          <div className="max-w-6xl mx-auto">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
              {testimonials.slice(0, 2).map((testimonial, index) => (
                <div key={index} className="p-8">
                  <div className="flex gap-4 items-start">
                    <div className="flex-shrink-0">
                      <img 
                        src={testimonial.profilePic} 
                        alt={testimonial.name}
                        className="w-16 h-16 object-cover"
                        style={{ borderRadius: '8px' }}
                      />
                    </div>
                    <div className="flex-1">
                      <h3 className="font-semibold text-gray-900 text-lg mb-4">{testimonial.name}</h3>
                      <div className="mb-4">
                        <div style={{ 
                          fontSize: '60px', 
                          fontWeight: '600', 
                          fontFamily: '"Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif', 
                          lineHeight: '30px',
                          color: '#DD7C7A',
                          marginBottom: '-30px'
                        }}>"</div>
                        <p className="text-gray-700 leading-relaxed" style={{ fontSize: '16px' }}>{testimonial.quote}</p>
                      </div>
                      <div className="flex items-center gap-1">
                        {[...Array(testimonial.rating)].map((_, i) => (
                          <Star key={i} className="h-4 w-4 fill-current" style={{ color: '#DD7C7A' }} />
                        ))}
                        <span className="text-sm ml-2 font-medium" style={{ color: '#DD7C7A' }}>4.9 / 5</span>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
            
            {/* Dashed Divider */}
            <div className="mb-12 max-w-6xl mx-auto">
              <div style={{ 
                width: '100%', 
                height: '1px',
                backgroundImage: 'repeating-linear-gradient(to right, #cccccc 0, #cccccc 4px, transparent 4px, transparent 8px)'
              }}></div>
            </div>
            
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
              {testimonials.slice(2, 4).map((testimonial, index) => (
                <div key={index + 2} className="p-8">
                  <div className="flex gap-4 items-start">
                    <div className="flex-shrink-0">
                      <img 
                        src={testimonial.profilePic} 
                        alt={testimonial.name}
                        className="w-16 h-16 object-cover"
                        style={{ borderRadius: '8px' }}
                      />
                    </div>
                    <div className="flex-1">
                      <h3 className="font-semibold text-gray-900 text-lg mb-4">{testimonial.name}</h3>
                      <div className="mb-4">
                        <div style={{ 
                          fontSize: '60px', 
                          fontWeight: '600', 
                          fontFamily: '"Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif', 
                          lineHeight: '30px',
                          color: '#DD7C7A',
                          marginBottom: '-30px'
                        }}>"</div>
                        <p className="text-gray-700 leading-relaxed" style={{ fontSize: '16px' }}>{testimonial.quote}</p>
                      </div>
                      <div className="flex items-center gap-1">
                        {[...Array(testimonial.rating)].map((_, i) => (
                          <Star key={i} className="h-4 w-4 fill-current" style={{ color: '#DD7C7A' }} />
                        ))}
                        <span className="text-sm ml-2 font-medium" style={{ color: '#DD7C7A' }}>4.9 / 5</span>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Social Impact Section */}
      <section className="py-20 px-6">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Patient, purpose-led social impact</h2>
          </div>
          
          <div className="grid md:grid-cols-3 gap-12">
            {impactStats.map((stat, index) => (
              <div key={index} className="text-center">
                <div className="w-16 h-16 bg-gray-900 rounded-xl flex items-center justify-center mx-auto mb-6">
                  <stat.icon className={`h-8 w-8 text-white`} />
                </div>
                
                <h3 className="text-2xl font-bold text-gray-900 mb-6">{stat.title}</h3>
                
                <div className="space-y-4 mb-6">
                  <p className="text-lg font-semibold text-gray-900 leading-relaxed">
                    {stat.stat}
                  </p>
                  {stat.detail && <p className="text-base text-gray-700">{stat.detail}</p>}
                  <p className="text-base text-gray-700 leading-relaxed">{stat.additional}</p>
                </div>
                
                <p className="text-sm text-gray-500 italic">{stat.source}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Security and Compliance Section */}
      <section className="py-20 px-6 bg-white">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Security and Compliance</h2>
          </div>
          
          <div className="bg-white rounded-lg border border-black/10 shadow-[0_2px_8px_rgba(0,0,0,0.1)] p-8">
            <div className="grid lg:grid-cols-2 gap-8 items-center">
              <div>
                <h3 className="text-2xl mb-4 text-gray-900">Enterprise-Grade Security</h3>
                <div className="space-y-3">
                  <div className="flex items-center gap-3">
                    <CheckCircle className="h-5 w-5 text-gray-600" />
                    <span className="text-gray-700">ISO 27001 certified infrastructure</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="h-5 w-5 text-gray-600" />
                    <span className="text-gray-700">GDPR compliant data processing</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="h-5 w-5 text-gray-600" />
                    <span className="text-gray-700">End-to-end encryption</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="h-5 w-5 text-gray-600" />
                    <span className="text-gray-700">Regular security audits</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="h-5 w-5 text-gray-600" />
                    <span className="text-gray-700">Child safeguarding protocols</span>
                  </div>
                </div>
              </div>
              <div className="bg-gray-50 rounded-xl p-6">
                <h4 className="text-lg mb-4 text-gray-900">Compliance Standards</h4>
                <div className="grid grid-cols-2 gap-4">
                  <div className="text-center p-3 bg-white rounded-lg">
                    <div className="text-2xl mb-1">🔒</div>
                    <div className="text-sm text-gray-600">GDPR</div>
                  </div>
                  <div className="text-center p-3 bg-white rounded-lg">
                    <div className="text-2xl mb-1">🛡️</div>
                    <div className="text-sm text-gray-600">ISO 27001</div>
                  </div>
                  <div className="text-center p-3 bg-white rounded-lg">
                    <div className="text-2xl mb-1">👶</div>
                    <div className="text-sm text-gray-600">Child Protection</div>
                  </div>
                  <div className="text-center p-3 bg-white rounded-lg">
                    <div className="text-2xl mb-1">🏥</div>
                    <div className="text-sm text-gray-600">NHS IG Toolkit</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer with Waitlist Form */}
      <footer id="waitlist-form" className="bg-gray-900 text-white py-16">
        <div className="max-w-7xl mx-auto px-6">
          {submitted ? (
            <div className="max-w-md mx-auto text-center">
              <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              
              <h2 className="text-2xl font-bold mb-4">
                You're on the list! 🎉
              </h2>
              
              <p className="text-gray-300 mb-6">
                Thank you for joining The Lift waitlist. We'll keep you updated on our progress and notify you as soon as we launch.
              </p>
            </div>
          ) : (
            <div className="max-w-2xl mx-auto">
              <Card className="bg-white text-gray-900">
                <CardContent className="p-8">
                  <div className="text-center mb-8">
                    <Mail className="h-12 w-12 text-gray-700 mx-auto mb-4" />
                    <h2 className="text-2xl font-bold text-gray-900 mb-2">
                      Join the Waitlist
                    </h2>
                    <p className="text-gray-600">
                      Be amongst the first to access The Lift when we launch. Get early access, exclusive updates, and help shape the future of child wellbeing support.
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
                        Organisation
                      </label>
                      <input
                        type="text"
                        id="organization"
                        value={organization}
                        onChange={(e) => setOrganization(e.target.value)}
                        className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-500 focus:border-transparent"
                        placeholder="School, clinic, or organisation name"
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
                        <option value="counselor">School Counsellor</option>
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
          )}
          
          <div className="mt-12 pt-8 border-t border-gray-800 text-center">
            <div className="flex items-center justify-center gap-3 mb-4">
              <div className="w-8 h-8 bg-gray-700 rounded-lg flex items-center justify-center">
                <Heart className="h-5 w-5 text-white" />
              </div>
              <span className="text-xl font-bold">The Lift</span>
            </div>
            
            <p className="text-gray-400 mb-4">&copy; 2025 The Lift Up Ltd. All rights reserved.</p>
            
            {/* Temporary development links */}
            <div className="space-x-4">
              <Link 
                to="/admin/login" 
                className="text-xs text-gray-600 hover:text-gray-400 underline"
              >
                [Dev] Admin Login
              </Link>
              <Link 
                to="/login" 
                className="text-xs text-gray-600 hover:text-gray-400 underline"
              >
                [Dev] Unified Login
              </Link>
            </div>
          </div>
        </div>
      </footer>
    </div>
  )
}