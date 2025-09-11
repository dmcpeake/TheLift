import React, { useState } from 'react'
import Lottie from 'lottie-react'
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
  CheckCircle,
  Check,
  ChevronLeft,
  ChevronRight,
  Play
} from 'lucide-react'

export function MarketingHome() {
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [organization, setOrganization] = useState('')
  const [role, setRole] = useState('')
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)
  const [rocketAnimation, setRocketAnimation] = useState(null)
  const [thinkingAnimation, setThinkingAnimation] = useState(null)
  const [thumbUpAnimation, setThumbUpAnimation] = useState(null)
  const [puzzleAnimation, setPuzzleAnimation] = useState(null)
  const [documentAnimation, setDocumentAnimation] = useState(null)

  // Load the Lottie animations
  React.useEffect(() => {
    fetch('/theo-rocket.json')
      .then(response => response.json())
      .then(data => setRocketAnimation(data))
      .catch(error => console.error('Error loading rocket animation:', error))
      
    fetch('/theo-thinking.json')
      .then(response => response.json())
      .then(data => setThinkingAnimation(data))
      .catch(error => console.error('Error loading thinking animation:', error))
      
    fetch('/theo-thumb-up.json')
      .then(response => response.json())
      .then(data => setThumbUpAnimation(data))
      .catch(error => console.error('Error loading thumb-up animation:', error))
      
    fetch('/theo-puzzle.json')
      .then(response => response.json())
      .then(data => setPuzzleAnimation(data))
      .catch(error => console.error('Error loading puzzle animation:', error))
      
    fetch('/theo-document.json')
      .then(response => response.json())
      .then(data => setDocumentAnimation(data))
      .catch(error => console.error('Error loading document animation:', error))
  }, [])

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

  const handleJoinWaitlistClick = (e: React.MouseEvent) => {
    e.preventDefault()
    const waitlistForm = document.getElementById('waitlist-form')
    if (waitlistForm) {
      waitlistForm.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }
  }
  const transformations = [
    {
      from: 'Confusion',
      to: 'Clarity',
      description: 'AI-powered analytics identify learning gaps and provide personalized recommendations.',
      icon: Brain,
      borderColor: 'bg-blue-400',
      animationType: 'lottie',
      animationFile: '/theo-thinking.json'
    },
    {
      from: 'Silence',
      to: 'Support', 
      description: 'Enable every student voice through intelligent tools and feedback systems.',
      icon: Users,
      borderColor: 'bg-cyan-400',
      animationType: 'lottie',
      animationFile: '/theo-thumb-up.json'
    },
    {
      from: 'Early signs',
      to: 'Early action',
      description: 'Predictive insights help educators intervene before challenges become barriers.',
      icon: Target,
      borderColor: 'bg-orange-400',
      animationType: 'lottie',
      animationFile: '/theo-puzzle.json'
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
      description: 'Helping the NHS deliver front line care for kids and understanding behavioral patterns at scale.',
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
      <section className="bg-white" style={{ minHeight: '600px', position: 'relative', display: 'flex', alignItems: 'center', paddingTop: '2rem', paddingBottom: '2rem' }}>
        <div className="max-w-7xl mx-auto px-6 w-full">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-center">
            {/* Text content */}
            <div>
              <h1 className="text-6xl font-bold mb-6" style={{ color: '#3c64c4' }}>
                Education. Data. Connection.
              </h1>
              
              <p className="text-xl mb-4 font-normal text-gray-600" style={{ fontFamily: 'SF Pro Text, -apple-system, BlinkMacSystemFont, system-ui, sans-serif', fontSize: '20px' }}>
                The Lift gives kids a safe space to reflect and have conversations so problems don't take root.
              </p>
              
              <p className="text-xl mb-8 font-semibold text-gray-900" style={{ fontFamily: 'SF Pro Text, -apple-system, BlinkMacSystemFont, system-ui, sans-serif', fontSize: '20px' }}>
                Launching soon.
              </p>
              
              <div className="flex flex-col sm:flex-row gap-4">
                <Button 
                  onClick={handleJoinWaitlistClick}
                  className="h-10 rounded flex items-center justify-center pt-2.5 pb-2" 
                  style={{ backgroundColor: '#3c64c4', color: 'white' }} 
                  onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#2D55E5'} 
                  onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#3c64c4'}
                >
                  JOIN WAITLIST
                </Button>
              </div>
            </div>
            
            {/* Animation column */}
            <div className="flex justify-center lg:justify-end">
              {rocketAnimation && (
                <div className="relative">
                  <Lottie 
                    animationData={rocketAnimation} 
                    style={{ 
                      width: '500px', 
                      height: '500px',
                      margin: 0,
                      padding: 0,
                      border: 'none',
                      outline: 'none'
                    }}
                    loop={true}
                    autoplay={true}
                  />
                  {/* Gradient fade overlay at bottom */}
                  <div 
                    className="absolute left-0"
                    style={{
                      bottom: '32px',
                      width: '500px',
                      height: '200px',
                      backgroundColor: 'white',
                      WebkitMask: 'linear-gradient(to bottom, transparent, black)',
                      mask: 'linear-gradient(to bottom, transparent, black)'
                    }}
                  />
                </div>
              )}
            </div>
          </div>
        </div>
          
          {/* Quick Access Section */}
      </section>

      {/* Mental Health Seeding Issues Section */}
      <section style={{ backgroundColor: '#f1cc67', paddingTop: '80px', paddingBottom: '80px' }}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="font-bold text-gray-900 mb-4" style={{ fontSize: '40px' }}>
              Mental health seeding issues start early
            </h2>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {transformations.map((transformation, index) => (
              <div key={index} className="bg-white rounded-lg border border-black/10 shadow-[0_2px_8px_rgba(0,0,0,0.1)] overflow-hidden" style={{ borderRadius: '8px', height: 'auto' }}>
                {/* Image/Animation container - now 300px height */}
                <div className="relative overflow-hidden" style={{ height: '300px', display: 'flex', alignItems: 'center', justifyContent: 'center', backgroundColor: '#fafafa' }}>
                  {transformation.animationType === 'lottie' ? (
                    (() => {
                      let animationData = null;
                      if (transformation.animationFile === '/theo-thinking.json') {
                        animationData = thinkingAnimation;
                      } else if (transformation.animationFile === '/theo-thumb-up.json') {
                        animationData = thumbUpAnimation;
                      } else if (transformation.animationFile === '/theo-puzzle.json') {
                        animationData = puzzleAnimation;
                      }
                      
                      return animationData && (
                        <Lottie 
                          animationData={animationData} 
                          style={{ 
                            width: '260px', 
                            height: '260px',
                            margin: 0,
                            padding: 0,
                            border: 'none',
                            outline: 'none'
                          }}
                          loop={true}
                          autoplay={true}
                        />
                      );
                    })()
                  ) : (
                    <img 
                      src={transformation.image} 
                      alt={`${transformation.from} to ${transformation.to}`}
                      className="w-full h-full object-cover"
                    />
                  )}
                  {/* Colored bottom border */}
                  <div className="absolute bottom-0 left-0 right-0" style={{ height: '4px', backgroundColor: '#e87e67' }}></div>
                </div>
                
                {/* Content - your original content */}
                <div className="p-6">
                  <div className="text-center mb-6">
                    <div className="flex items-center justify-center gap-4 mb-4">
                      <span className="text-gray-900 font-bold" style={{ fontSize: '18px' }}>{transformation.from}</span>
                      <ArrowRight className="h-4 w-4 text-gray-400" />
                      <span className="font-bold" style={{ color: '#e87e67', fontSize: '18px' }}>{transformation.to}</span>
                    </div>
                    {/* Dashed Divider */}
                    <div style={{ 
                      width: '100%', 
                      height: '1px',
                      backgroundImage: 'repeating-linear-gradient(to right, #cccccc 0, #cccccc 4px, transparent 4px, transparent 8px)'
                    }}></div>
                  </div>
                  
                  <p className="text-gray-600 text-center" style={{ fontSize: '18px' }}>
                    {transformation.description}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Support Where It Matters Section */}
      <section className="bg-white" style={{ paddingTop: '80px', paddingBottom: '80px' }}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="font-bold text-gray-900 mb-4" style={{ fontSize: '40px' }}>Support where it matters</h2>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {supportAreas.map((area, index) => (
              <div key={index} className="bg-white rounded-lg border border-black/10 shadow-[0_2px_8px_rgba(0,0,0,0.1)] overflow-hidden" style={{ borderRadius: '8px', height: '340px' }}>
                {/* Icon container - half height */}
                <div className="relative overflow-hidden" style={{ height: '150px', backgroundColor: 'white' }}>
                  <div className="w-full h-full flex items-center justify-center">
                    <div 
                      className="w-20 h-20 flex items-center justify-center"
                      style={{ 
                        backgroundColor: '#3c64c4',
                        borderRadius: '4px'
                      }}
                    >
                      <area.icon className="h-10 w-10 text-white" />
                    </div>
                  </div>
                  {/* Colored bottom border */}
                  <div 
                    className="absolute bottom-0 left-0 right-0" 
                    style={{ 
                      height: '4px', 
                      backgroundColor: '#3c64c4'
                    }}
                  ></div>
                </div>
                
                {/* Content */}
                <div className="p-6">
                  <h3 className="font-bold text-gray-900 mb-3 text-center" style={{ fontSize: '18px' }}>{area.title}</h3>
                  <p className="text-gray-600 text-center" style={{ fontSize: '18px' }}>
                    {area.description}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
      <section style={{ backgroundColor: '#f6f4ef', paddingTop: '80px', paddingBottom: '80px' }}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="font-bold text-gray-900 mb-4" style={{ fontSize: '40px' }}>What our pilot users say</h2>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
            {testimonials.slice(0, 2).map((testimonial, index) => (
              <div key={index} className="p-8">
                <div className="flex gap-4">
                  <div className="flex-shrink-0" style={{ marginTop: '6px' }}>
                    <img 
                      src={testimonial.profilePic} 
                      alt={testimonial.name}
                      className="w-20 h-20 object-cover"
                      style={{ borderRadius: '4px' }}
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
                        color: '#e87e67',
                        marginBottom: '-10px'
                      }}>"</div>
                      <p className="text-gray-700 leading-relaxed" style={{ fontSize: '16px' }}>{testimonial.quote}</p>
                    </div>
                    <div className="flex items-center gap-1">
                      {[...Array(testimonial.rating)].map((_, i) => (
                        <Star key={i} className="w-4 h-4 fill-current" style={{ color: '#e87e67', width: '16px', height: '16px' }} />
                      ))}
                      <span className="text-sm ml-2 font-medium" style={{ color: '#e87e67' }}>4.9 / 5</span>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
          
          {/* Dashed Divider */}
          <div className="mb-12">
            <div style={{ 
              width: '100%', 
              height: '1px',
              backgroundImage: 'repeating-linear-gradient(to right, #cccccc 0, #cccccc 4px, transparent 4px, transparent 8px)'
            }}></div>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {testimonials.slice(2, 4).map((testimonial, index) => (
              <div key={index + 2} className="p-8">
                <div className="flex gap-4">
                  <div className="flex-shrink-0" style={{ marginTop: '6px' }}>
                    <img 
                      src={testimonial.profilePic} 
                      alt={testimonial.name}
                      className="w-20 h-20 object-cover"
                      style={{ borderRadius: '4px' }}
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
                        color: '#e87e67',
                        marginBottom: '-10px'
                      }}>"</div>
                      <p className="text-gray-700 leading-relaxed" style={{ fontSize: '16px' }}>{testimonial.quote}</p>
                    </div>
                    <div className="flex items-center gap-1">
                      {[...Array(testimonial.rating)].map((_, i) => (
                        <Star key={i} className="w-4 h-4 fill-current" style={{ color: '#e87e67', width: '16px', height: '16px' }} />
                      ))}
                      <span className="text-sm ml-2 font-medium" style={{ color: '#e87e67' }}>4.9 / 5</span>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Security and Compliance Section */}
      <section className="bg-white" style={{ paddingTop: '80px', paddingBottom: '80px' }}>
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="font-bold text-gray-900 mb-4" style={{ fontSize: '40px' }}>Security and Compliance</h2>
          </div>
          
          <div className="bg-white rounded-lg border border-black/10 shadow-[0_2px_8px_rgba(0,0,0,0.1)] p-8">
            <div className="grid lg:grid-cols-2 gap-8 items-center">
              <div>
                <h3 className="text-2xl mb-4 text-gray-900 font-bold">Enterprise-Grade Security</h3>
                <div className="space-y-3">
                  <div className="flex items-center gap-3">
                    <div className="w-5 h-5 rounded-full flex items-center justify-center" style={{ backgroundColor: '#da836d' }}>
                      <Check className="h-3 w-3 text-white" strokeWidth={3} />
                    </div>
                    <span className="text-gray-700" style={{ fontSize: '16px' }}>ISO 27001 certified infrastructure</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="w-5 h-5 rounded-full flex items-center justify-center" style={{ backgroundColor: '#da836d' }}>
                      <Check className="h-3 w-3 text-white" strokeWidth={3} />
                    </div>
                    <span className="text-gray-700" style={{ fontSize: '16px' }}>GDPR compliant data processing</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="w-5 h-5 rounded-full flex items-center justify-center" style={{ backgroundColor: '#da836d' }}>
                      <Check className="h-3 w-3 text-white" strokeWidth={3} />
                    </div>
                    <span className="text-gray-700" style={{ fontSize: '16px' }}>End-to-end encryption</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="w-5 h-5 rounded-full flex items-center justify-center" style={{ backgroundColor: '#da836d' }}>
                      <Check className="h-3 w-3 text-white" strokeWidth={3} />
                    </div>
                    <span className="text-gray-700" style={{ fontSize: '16px' }}>Regular security audits</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="w-5 h-5 rounded-full flex items-center justify-center" style={{ backgroundColor: '#da836d' }}>
                      <Check className="h-3 w-3 text-white" strokeWidth={3} />
                    </div>
                    <span className="text-gray-700" style={{ fontSize: '16px' }}>Child safeguarding protocols</span>
                  </div>
                </div>
              </div>
              <div className="flex items-center justify-center">
                {documentAnimation && (
                  <Lottie 
                    animationData={documentAnimation} 
                    style={{ 
                      width: '260px', 
                      height: '260px'
                    }}
                    loop={true}
                    autoplay={true}
                  />
                )}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer with Waitlist Form */}
      <footer id="waitlist-form" className="text-white" style={{ backgroundColor: '#3c64c4', paddingTop: '80px', paddingBottom: '80px' }}>
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
              <div className="text-center mb-8">
                <h2 className="font-bold text-white" style={{ fontSize: '40px', marginBottom: '8px' }}>
                  Join the Waitlist
                </h2>
                <p className="text-white" style={{ fontSize: '20px' }}>
                  Be amongst the first to access The Lift when we launch, and help shape the future of child wellbeing support.
                </p>
              </div>

              <form onSubmit={handleSubmit} className="space-y-6">
                <div>
                  <label htmlFor="name" className="block text-sm font-medium text-white mb-2">
                    Full Name *
                  </label>
                  <input
                    type="text"
                    id="name"
                    required
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    className="w-full px-4 bg-transparent border border-gray-300 rounded text-white placeholder-gray-300 focus:ring-2 focus:ring-white focus:border-transparent"
                    style={{ height: '40px' }}
                    placeholder="Your full name"
                  />
                </div>

                <div>
                  <label htmlFor="email" className="block text-sm font-medium text-white mb-2">
                    Email Address *
                  </label>
                  <input
                    type="email"
                    id="email"
                    required
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="w-full px-4 bg-transparent border border-gray-300 rounded text-white placeholder-gray-300 focus:ring-2 focus:ring-white focus:border-transparent"
                    style={{ height: '40px' }}
                    placeholder="your@email.com"
                  />
                </div>

                <div>
                  <label htmlFor="organization" className="block text-sm font-medium text-white mb-2">
                    Organisation
                  </label>
                  <input
                    type="text"
                    id="organization"
                    value={organization}
                    onChange={(e) => setOrganization(e.target.value)}
                    className="w-full px-4 bg-transparent border border-gray-300 rounded text-white placeholder-gray-300 focus:ring-2 focus:ring-white focus:border-transparent"
                    style={{ height: '40px' }}
                    placeholder="School, clinic, or organisation name"
                  />
                </div>

                <div>
                  <label htmlFor="role" className="block text-sm font-medium text-white mb-2">
                    Your Role
                  </label>
                  <div className="relative">
                    <select
                      id="role"
                      value={role}
                      onChange={(e) => setRole(e.target.value)}
                      className="w-full bg-transparent border border-gray-300 rounded focus:ring-2 focus:ring-white focus:border-transparent"
                      style={{ 
                        height: '40px', 
                        paddingLeft: '16px', 
                        paddingRight: '60px',
                        appearance: 'none',
                        WebkitAppearance: 'none',
                        MozAppearance: 'none',
                        backgroundImage: 'url("data:image/svg+xml;charset=US-ASCII,<svg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 4 5\'><path fill=\'white\' d=\'M2 0L0 2h4zm0 5L0 3h4z\'/></svg>")',
                        backgroundRepeat: 'no-repeat',
                        backgroundPosition: 'right 20px center',
                        backgroundSize: '12px 12px',
                        color: role === '' ? 'transparent' : 'white'
                      }}
                    >
                      <option value="" disabled></option>
                      <option value="teacher" style={{ color: '#333' }}>Teacher</option>
                      <option value="headteacher" style={{ color: '#333' }}>Headteacher</option>
                      <option value="counselor" style={{ color: '#333' }}>School Counsellor</option>
                      <option value="psychologist" style={{ color: '#333' }}>Psychologist</option>
                      <option value="therapist" style={{ color: '#333' }}>Therapist</option>
                      <option value="social-worker" style={{ color: '#333' }}>Social Worker</option>
                      <option value="parent" style={{ color: '#333' }}>Parent</option>
                      <option value="administrator" style={{ color: '#333' }}>Administrator</option>
                      <option value="other" style={{ color: '#333' }}>Other</option>
                    </select>
                    {role === '' && (
                      <div 
                        className="absolute inset-0 pointer-events-none flex items-center"
                        style={{ paddingLeft: '16px', color: 'rgba(255, 255, 255, 0.6)' }}
                      >
                        Select your role
                      </div>
                    )}
                  </div>
                </div>

                <Button 
                  type="submit" 
                  disabled={isSubmitting}
                  className="w-full rounded text-lg"
                  style={{ 
                    height: '40px',
                    borderRadius: '4px',
                    backgroundColor: 'white',
                    color: '#3c64c4',
                    marginTop: '25px'
                  }}
                >
                  {isSubmitting ? 'Joining...' : 'Join the Waitlist'}
                </Button>
              </form>

              <p className="text-xs text-white mt-6 text-center">
                We respect your privacy. Unsubscribe at any time.
              </p>
            </div>
          )}
          
          <div className="mt-12 text-center">
            <div style={{ 
              width: '100%', 
              height: '1px',
              backgroundImage: 'repeating-linear-gradient(to right, white 0, white 4px, transparent 4px, transparent 8px)',
              marginBottom: '32px'
            }}></div>
            <div className="flex items-center justify-center gap-3 mb-4">
              <svg height="25" viewBox="0 0 621 157" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clipPath="url(#clip0_1_2)">
                  <path d="M25.6 73.2H0V50H25.6V26.2L50.2 12.4V50H104.2V73.2H50.2V155H25.6V73.2Z" fill="white"/>
                  <path d="M92.6 7H117.2V62.8C123.6 54 134.4 48 148.2 48C170.2 48 189.8 60.2 189.8 90.4V155H165.2V95.4C165.2 79.6 155.6 71.6 142.4 71.6C128 71.6 117.2 81.4 117.2 98.2V155H92.6V7Z" fill="white"/>
                  <path d="M209 102.6C209 74 231.6 48 261.2 48C292.6 48 310.2 72.6 310.2 98.6C310.2 105.6 310 109 309.4 112.4H234.8C238.6 125.4 250 134.2 268.2 134.2C281.6 134.2 293 131.2 302 125.4V148.6C294.8 153.4 281.6 157 267.2 157C229.2 157 209 133.2 209 102.6ZM287 92.4C285 78.8 276.6 70.2 261.8 70.2C247.8 70.2 237.8 78.8 234.6 92.4H287Z" fill="white"/>
                  <path d="M375.6 7H400.2V155H375.6V7Z" fill="white"/>
                  <path d="M440.19 0C448.39 0 455.39 6.6 455.39 15.4C455.39 24.2 448.39 31 440.19 31C431.39 31 424.59 24.4 424.59 15.4C424.59 6.4 431.39 0 440.19 0ZM427.79 50H452.39V155H427.79V50Z" fill="white"/>
                  <path d="M594.39 73.2H620.39V50H594.39V26.4L569.79 12.2V50H513.19V41.8C513.19 32 518.39 28 525.99 28C529.59 28 533.59 28.8 536.39 30.2V6.2C531.19 4.8 526.99 4.4 522.79 4.4C501.79 4.4 488.59 18 488.59 41.4V50H471.79V73.2H488.59V155H513.19V73.2H569.79V155H594.39V73.2Z" fill="white"/>
                </g>
                <defs>
                  <clipPath id="clip0_1_2">
                    <rect width="620.39" height="157" fill="white"/>
                  </clipPath>
                </defs>
              </svg>
            </div>
            
            <p className="mb-4" style={{ color: 'rgba(255, 255, 255, 0.8)' }}>&copy; 2025 The Lift Up Ltd. All rights reserved.</p>
            
            {/* Temporary development links */}
            <div className="space-x-4">
              <Link 
                to="/admin/login" 
                className="text-xs underline hover:opacity-70"
                style={{ color: 'rgba(255, 255, 255, 0.8)' }}
              >
                [Dev] Admin Login
              </Link>
              <Link 
                to="/login" 
                className="text-xs underline hover:opacity-70"
                style={{ color: 'rgba(255, 255, 255, 0.8)' }}
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