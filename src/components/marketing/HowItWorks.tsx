import React from 'react'
import { Link } from 'react-router-dom'
import { Button } from '../ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Badge } from '../ui/badge'
import { MarketingNavigation } from './MarketingNavigation'
import { 
  Heart, 
  Users, 
  Target,
  Award,
  BookOpen,
  Calendar,
  School,
  Stethoscope,
  Building2,
  Brain,
  Shield,
  TrendingUp,
  Lightbulb,
  Phone,
  Mail,
  CheckCircle,
  ArrowRight,
  Play,
  PieChart,
  MessageCircle,
  Zap,
  Eye,
  UserCheck,
  Settings,
  BarChart3,
  Clock,
  Star
} from 'lucide-react'

export function HowItWorks() {
  const userJourneys = [
    {
      title: 'For Children',
      subtitle: '5-11 years old',
      description: 'A safe, engaging space for self-reflection and emotional expression',
      icon: Heart,
      color: 'bg-gray-100',
      steps: [
        {
          step: '1',
          title: 'Welcome & Setup',
          description: 'Child creates their profile with fun avatars and personalization options'
        },
        {
          step: '2', 
          title: 'Daily Check-ins',
          description: 'Complete the wellbeing wheel and garden activities in just 3-5 minutes'
        },
        {
          step: '3',
          title: 'Safe Expression',
          description: 'Share feelings through emojis, colors, and simple reflection questions'
        },
        {
          step: '4',
          title: 'Celebrate Progress',
          description: 'Earn stickers and see their emotional garden grow over time'
        }
      ]
    },
    {
      title: 'For Practitioners',
      subtitle: 'Teachers, counselors, psychologists',
      description: 'Powerful tools to identify needs and provide targeted support',
      icon: Stethoscope,
      color: 'bg-gray-200',
      steps: [
        {
          step: '1',
          title: 'Dashboard Overview',
          description: 'See real-time wellbeing data and alerts for children in their care'
        },
        {
          step: '2',
          title: 'Individual Insights',
          description: 'Review detailed profiles showing patterns, trends, and concerns'
        },
        {
          step: '3',
          title: 'Intervention Planning',
          description: 'Use data-driven insights to plan targeted support strategies'
        },
        {
          step: '4',
          title: 'Progress Tracking',
          description: 'Monitor outcomes and adjust interventions based on real data'
        }
      ]
    },
    {
      title: 'For Organizations',
      subtitle: 'Schools, clinics, hospitals',
      description: 'System-wide visibility and management capabilities',
      icon: Building2,
      color: 'bg-gray-300',
      steps: [
        {
          step: '1',
          title: 'Setup & Configuration',
          description: 'Configure organizational settings, user roles, and data policies'
        },
        {
          step: '2',
          title: 'User Management',
          description: 'Invite practitioners, manage permissions, and organize by teams/classes'
        },
        {
          step: '3',
          title: 'Population Insights',
          description: 'View aggregated wellbeing trends across the entire organization'
        },
        {
          step: '4',
          title: 'Resource Allocation',
          description: 'Use data to inform staffing, training, and support decisions'
        }
      ]
    }
  ]

  const features = [
    {
      title: 'Wellbeing Wheel',
      description: 'Interactive emotion tracking designed specifically for children aged 5-11',
      icon: Target,
      benefits: [
        'Age-appropriate emotion vocabulary',
        'Visual and intuitive interface',
        'Tracks patterns over time',
        'Culturally sensitive design'
      ]
    },
    {
      title: 'Digital Garden',
      description: 'Gamified reflection space where children tend their emotional garden',
      icon: Heart,
      benefits: [
        'Encourages daily engagement',
        'Visual progress representation',
        'Safe space for expression',
        'Builds emotional literacy'
      ]
    },
    {
      title: 'Analytics Dashboard',
      description: 'Comprehensive insights for practitioners to understand and support children',
      icon: BarChart3,
      benefits: [
        'Real-time wellbeing indicators',
        'Trend analysis and alerts',
        'Individual and group views',
        'Evidence-based recommendations'
      ]
    },
    {
      title: 'Secure Communication',
      description: 'GDPR-compliant platform enabling safe information sharing',
      icon: Shield,
      benefits: [
        'End-to-end encryption',
        'Role-based access control',
        'Audit trails and compliance',
        'Child protection protocols'
      ]
    }
  ]

  const process = [
    {
      phase: 'Discovery',
      title: 'Understanding Your Needs',
      description: 'We work with your team to understand your specific requirements, existing workflows, and organizational goals.',
      duration: '1-2 weeks',
      activities: [
        'Stakeholder interviews',
        'Current process mapping',
        'Requirements gathering',
        'Success metrics definition'
      ]
    },
    {
      phase: 'Setup',
      title: 'Platform Configuration',
      description: 'Our team configures The Lift to match your organizational structure, policies, and user roles.',
      duration: '1-2 weeks',
      activities: [
        'System configuration',
        'User role setup',
        'Data migration (if needed)',
        'Integration testing'
      ]
    },
    {
      phase: 'Training',
      title: 'User Onboarding',
      description: 'Comprehensive training for all user types to ensure successful adoption and effective use.',
      duration: '2-3 weeks',
      activities: [
        'Administrator training',
        'Practitioner workshops',
        'Child introduction sessions',
        'Support materials provision'
      ]
    },
    {
      phase: 'Launch',
      title: 'Go Live Support',
      description: 'Full launch with ongoing support to ensure smooth operations and immediate issue resolution.',
      duration: 'Ongoing',
      activities: [
        'Phased rollout',
        'Daily check-ins',
        'Performance monitoring',
        'Continuous optimization'
      ]
    }
  ]

  const security = [
    {
      title: 'Data Protection',
      description: 'GDPR compliant with enterprise-grade security',
      icon: Shield
    },
    {
      title: 'Child Safeguarding',
      description: 'Built-in child protection protocols and alert systems',
      icon: Heart
    },
    {
      title: 'Access Control',
      description: 'Role-based permissions ensuring appropriate data access',
      icon: UserCheck
    },
    {
      title: 'Audit Trails',
      description: 'Complete logging of all system activities and data access',
      icon: Eye
    }
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />

      {/* Hero Section */}
      <section className="py-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <Badge className="mb-6 bg-gray-100 text-gray-800 border-gray-200">
            🔍 How It Works
          </Badge>
          
          <h1 className="text-5xl md:text-6xl mb-6 text-gray-900">
            Simple, secure, and effective
          </h1>
          
          <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
            The Lift brings together children, practitioners, and organizations in a secure platform 
            designed to support emotional wellbeing through early intervention and data-driven insights.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/waitlist">
              <Button className="bg-gray-900 hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <Heart className="h-5 w-5 mr-2" />
                Join Waitlist
              </Button>
            </Link>
            <Button variant="outline" className="text-lg px-8 py-4 rounded-full">
              <Play className="h-5 w-5 mr-2" />
              Watch Video
            </Button>
          </div>
        </div>
      </section>

      {/* User Journeys Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Designed for Every User</h2>
            <p className="text-xl text-gray-600">
              Each role has a tailored experience optimized for their needs and responsibilities
            </p>
          </div>
          
          <div className="space-y-12">
            {userJourneys.map((journey, index) => (
              <div key={index} className="bg-white rounded-2xl p-8 shadow-lg">
                <div className="grid lg:grid-cols-2 gap-8 items-start">
                  <div>
                    <div className="flex items-center gap-4 mb-6">
                      <div className={`w-14 h-14 ${journey.color} rounded-lg flex items-center justify-center`}>
                        <journey.icon className="h-7 w-7 text-gray-700" />
                      </div>
                      <div>
                        <h3 className="text-2xl text-gray-900">{journey.title}</h3>
                        <p className="text-gray-600">{journey.subtitle}</p>
                      </div>
                    </div>
                    <p className="text-lg text-gray-700 mb-6">{journey.description}</p>
                  </div>
                  
                  <div className="space-y-4">
                    {journey.steps.map((step, stepIndex) => (
                      <div key={stepIndex} className="flex gap-4">
                        <div className="w-8 h-8 bg-gray-700 rounded-full flex items-center justify-center text-white text-sm">
                          {step.step}
                        </div>
                        <div className="flex-1">
                          <h4 className="text-lg mb-1 text-gray-900">{step.title}</h4>
                          <p className="text-gray-600">{step.description}</p>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Key Features Section */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Platform Features</h2>
            <p className="text-xl text-gray-600">
              Purpose-built tools for supporting children's emotional wellbeing
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {features.map((feature, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-8">
                  <div className="flex items-start gap-4 mb-6">
                    <div className="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center">
                      <feature.icon className="h-6 w-6 text-gray-700" />
                    </div>
                    <div>
                      <h3 className="text-xl mb-2 text-gray-900">{feature.title}</h3>
                      <p className="text-gray-600">{feature.description}</p>
                    </div>
                  </div>
                  <div className="space-y-2">
                    {feature.benefits.map((benefit, benefitIndex) => (
                      <div key={benefitIndex} className="flex items-center gap-2">
                        <CheckCircle className="h-4 w-4 text-gray-600" />
                        <span className="text-gray-700">{benefit}</span>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Implementation Process */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Implementation Process</h2>
            <p className="text-xl text-gray-600">
              From initial consultation to full deployment - we support you every step of the way
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {process.map((phase, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-6">
                  <div className="text-center mb-6">
                    <div className="w-12 h-12 bg-gray-700 rounded-full flex items-center justify-center mx-auto mb-4">
                      <span className="text-white">{index + 1}</span>
                    </div>
                    <Badge className="bg-gray-100 text-gray-800 border-gray-200">
                      {phase.phase}
                    </Badge>
                  </div>
                  
                  <h3 className="text-lg mb-3 text-gray-900 text-center">{phase.title}</h3>
                  <p className="text-gray-600 text-center mb-4">{phase.description}</p>
                  
                  <div className="text-center mb-4">
                    <span className="inline-flex items-center gap-1 text-sm text-gray-500">
                      <Clock className="h-4 w-4" />
                      {phase.duration}
                    </span>
                  </div>
                  
                  <div className="space-y-2">
                    {phase.activities.map((activity, actIndex) => (
                      <div key={actIndex} className="flex items-center gap-2">
                        <div className="w-1.5 h-1.5 bg-gray-400 rounded-full"></div>
                        <span className="text-sm text-gray-600">{activity}</span>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Security & Compliance */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Security & Compliance</h2>
            <p className="text-xl text-gray-600">
              Built with child protection and data security as top priorities
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {security.map((item, index) => (
              <Card key={index} className="bg-white shadow-lg border-0 text-center">
                <CardContent className="p-6">
                  <div className="w-14 h-14 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-4">
                    <item.icon className="h-7 w-7 text-gray-700" />
                  </div>
                  <h3 className="text-lg mb-3 text-gray-900">{item.title}</h3>
                  <p className="text-gray-600">{item.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
          
          <div className="bg-white rounded-2xl p-8 shadow-lg mt-12">
            <div className="grid lg:grid-cols-2 gap-8 items-center">
              <div>
                <h3 className="text-2xl mb-4 text-gray-900">Enterprise-Grade Security</h3>
                <div className="space-y-3">
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

      {/* CTA Section */}
      <section className="py-20 bg-gray-900 text-white">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-4xl mb-6">Ready to get started?</h2>
          <p className="text-xl mb-8 text-gray-300">
            Join our waitlist to be first to access The Lift when we launch and transform your approach to child wellbeing.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/waitlist">
              <Button className="bg-white text-gray-900 hover:bg-gray-100 text-lg px-8 py-4 rounded-full">
                <Heart className="h-5 w-5 mr-2" />
                Join Waitlist
              </Button>
            </Link>
            <Link to="/pricing">
              <Button variant="outline" className="border-gray-300 bg-transparent text-white hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <Star className="h-5 w-5 mr-2" />
                View Pricing
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
                <span className="text-xl">The Lift</span>
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
              <h4 className="mb-4">Platform</h4>
              <div className="space-y-2 text-gray-400">
                <Link to="/how-it-works" className="block hover:text-white transition-colors">How It Works</Link>
                <Link to="/pricing" className="block hover:text-white transition-colors">Pricing</Link>
                <Link to="/about" className="block hover:text-white transition-colors">About Us</Link>
              </div>
            </div>
            
            <div>
              <h4 className="mb-4">Support</h4>
              <div className="space-y-2 text-gray-400">
                <Link to="/waitlist" className="block hover:text-white transition-colors">Join Waitlist</Link>
                <Link to="/legal" className="block hover:text-white transition-colors">Help Center</Link>
                <Link to="/legal" className="block hover:text-white transition-colors">Training</Link>
              </div>
            </div>
            
            <div>
              <h4 className="mb-4">Legal</h4>
              <div className="space-y-2 text-gray-400">
                <Link to="/legal/privacy" className="block hover:text-white transition-colors">Privacy Policy</Link>
                <Link to="/legal/terms" className="block hover:text-white transition-colors">Terms of Service</Link>
                <Link to="/legal" className="block hover:text-white transition-colors">Security</Link>
              </div>
            </div>
          </div>
          
          <div className="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2025 The Liiift Up Ltd. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  )
}