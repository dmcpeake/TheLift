import React from 'react'
import { Link } from 'react-router-dom'
import { Button } from '../ui/button'
import { Card, CardContent } from '../ui/card'
import { MarketingNavigation } from './MarketingNavigation'
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
  PiggyBank
} from 'lucide-react'

export function MarketingHome() {
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
      rating: 5
    },
    {
      name: 'Psychotherapist',
      role: 'Leading private practice',
      quote: 'Using The Lift is a brilliant way to integrate parents into the therapeutic solution in a systemic way.',
      rating: 5
    },
    {
      name: 'Parent',
      role: 'Child in Year 5',
      quote: 'Within 90 seconds of sitting down with my child we got to the nub of an issue I didn\'t even know was there.',
      rating: 5
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
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div>

              
              <h1 className="text-5xl md:text-6xl font-bold text-gray-900 mb-6">
                Education. <span className="text-gray-700">Data.</span>
                <br />
                <span className="text-gray-600">Connection.</span>
              </h1>
              
              <p className="text-xl text-gray-600 mb-8 max-w-xl">
                Coming soon: The revolutionary platform that gives kids a safe space to reflect and have conversations so problems don't take root
              </p>
              
              <div className="flex flex-col sm:flex-row gap-4">
                <Link to="/waitlist">
                  <Button className="bg-gray-900 hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                    <Heart className="h-5 w-5 mr-2" />
                    Join Waitlist
                  </Button>
                </Link>
                <Link to="/how-it-works">
                  <Button variant="outline" className="text-lg px-8 py-4 rounded-full">
                    <BookOpen className="h-5 w-5 mr-2" />
                    Learn More
                  </Button>
                </Link>
              </div>

              {/* Quick Access Section */}

            </div>
            
            <div className="relative">
              <div className="bg-white rounded-2xl p-8 shadow-2xl">
                <div className="bg-gray-50 rounded-xl p-6 text-left">
                  <div className="flex items-center gap-4 mb-6">
                    <div className="w-12 h-12 bg-gray-600 rounded-full flex items-center justify-center">
                      <span className="text-white text-xl font-bold">E</span>
                    </div>
                    <div>
                      <h3 className="font-bold text-gray-800">Hi Jane! 👋</h3>
                      <p className="text-gray-600">Ready for your wellbeing check-in?</p>
                    </div>
                  </div>
                  <div className="grid grid-cols-2 md:grid-cols-5 gap-3">
                    {['😢', '😕', '😐', '😊', '😍'].map((emoji, index) => (
                      <div key={index} className="text-center p-3 bg-gray-100 rounded-lg">
                        <div className="text-3xl mb-2">{emoji}</div>
                        <div className="text-xs text-gray-600">{index + 1}</div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Mental Health Seeding Issues Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">
              🌱 Mental health seeding issues start early
            </h2>
            <p className="text-xl text-gray-600 max-w-4xl mx-auto">
              The Lift gives kids a safe space to reflect and have conversations so problems don't take root
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {transformations.map((transformation, index) => (
              <div key={index} className="bg-white rounded-xl shadow-lg overflow-hidden">
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
                  
                  <p className="text-gray-600 text-center">
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
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Support where it matters</h2>
            <p className="text-xl text-gray-600">
              We deliver child-led, flexible support in different settings.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {supportAreas.map((area, index) => (
              <Card key={index} className="bg-white shadow-lg border-0 text-center">
                <CardContent className="p-8">
                  <div className="w-16 h-16 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-6">
                    <area.icon className="h-8 w-8 text-gray-700" />
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 mb-4">{area.title}</h3>
                  <p className="text-gray-600">{area.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">What our users say</h2>
            <p className="text-xl text-gray-600">
              Real feedback from educators, clinicians, and parents using The Lift
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {testimonials.map((testimonial, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-6">
                  <div className="flex items-center mb-4">
                    {[...Array(testimonial.rating)].map((_, i) => (
                      <Star key={i} className="h-4 w-4 text-gray-400 fill-current" />
                    ))}
                  </div>
                  <p className="text-gray-700 mb-6 italic">"{testimonial.quote}"</p>
                  <div className="border-t border-gray-200 pt-4">
                    <div className="font-bold text-gray-900">{testimonial.name}</div>
                    <div className="text-sm text-gray-600">{testimonial.role}</div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Social Impact Section */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-gray-900 mb-4">Patient, purpose-led social impact</h2>
            <p className="text-xl text-gray-600">
              Let's plant seeds of resilience early and help a generation thrive - together
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {impactStats.map((stat, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-8 text-center">
                  <div className="w-14 h-14 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-6">
                    <stat.icon className={`h-7 w-7 ${stat.color}`} />
                  </div>
                  
                  <h3 className="text-xl font-bold text-gray-900 mb-6">{stat.title}</h3>
                  
                  <div className="space-y-4 mb-6">
                    <p className="font-semibold text-gray-900">
                      {stat.stat}
                    </p>
                    {stat.detail && <p className="text-gray-700">{stat.detail}</p>}
                    <p className="text-gray-700">{stat.additional}</p>
                  </div>
                  
                  <p className="text-xs text-gray-500 italic">{stat.source}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Waitlist CTA Section */}
      <section className="py-20 bg-gray-900 text-white">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-4xl font-bold mb-6">Be first to access The Lift</h2>
          <p className="text-xl mb-8 text-gray-300">
            Join our waitlist and be among the first to transform your approach to child wellbeing when we launch.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/waitlist">
              <Button className="bg-white text-gray-900 hover:bg-gray-100 text-lg px-8 py-4 rounded-full">
                <Heart className="h-5 w-5 mr-2" />
                Join Waitlist
              </Button>
            </Link>
            <Link to="/how-it-works">
              <Button variant="outline" className="border-gray-300 bg-transparent text-white hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <BookOpen className="h-5 w-5 mr-2" />
                Learn More
              </Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-16">
        <div className="max-w-7xl mx-auto px-6">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
              <div className="flex items-center gap-3 mb-6">
                <div className="w-8 h-8 bg-gray-700 rounded-lg flex items-center justify-center">
                  <Heart className="h-5 w-5 text-white" />
                </div>
                <span className="text-xl font-bold">The Lift</span>
              </div>
              <p className="text-gray-400 mb-4">
                Supporting children's wellbeing through innovative, engaging, and safe digital tools.
              </p>
              <div className="flex gap-4">
                <Button variant="outline" size="sm" className="border-gray-700 text-gray-400 hover:bg-gray-800">
                  <Mail className="h-4 w-4" />
                </Button>
                <Button variant="outline" size="sm" className="border-gray-700 text-gray-400 hover:bg-gray-800">
                  <Phone className="h-4 w-4" />
                </Button>
              </div>
            </div>
            
            <div>
              <h4 className="font-bold mb-4">Platform</h4>
              <div className="space-y-2 text-gray-400">
                <Link to="/how-it-works" className="block hover:text-white transition-colors">How It Works</Link>
                <Link to="/pricing" className="block hover:text-white transition-colors">Pricing</Link>
                <Link to="/about" className="block hover:text-white transition-colors">About Us</Link>
              </div>
            </div>
            
            <div>
              <h4 className="font-bold mb-4">Support</h4>
              <div className="space-y-2 text-gray-400">
                <Link to="/waitlist" className="block hover:text-white transition-colors">Join Waitlist</Link>
                <Link to="/legal" className="block hover:text-white transition-colors">Help Center</Link>
                <Link to="/legal" className="block hover:text-white transition-colors">Training</Link>
              </div>
            </div>
            
            <div>
              <h4 className="font-bold mb-4">Legal</h4>
              <div className="space-y-2 text-gray-400">
                <Link to="/legal/privacy" className="block hover:text-white transition-colors">Privacy Policy</Link>
                <Link to="/legal/terms" className="block hover:text-white transition-colors">Terms of Service</Link>
                <Link to="/legal" className="block hover:text-white transition-colors">Security</Link>
                <Link to="/sitemap" className="block hover:text-white transition-colors">Sitemap</Link>
              </div>
            </div>
          </div>
          
          <div className="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2025 The Lift Up Ltd. All rights reserved.</p>
            {/* Temporary development links */}
            <div className="mt-4 space-x-4">
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