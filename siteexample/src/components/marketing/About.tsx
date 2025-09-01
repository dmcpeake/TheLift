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
  Globe,
  Zap
} from 'lucide-react'

export function About() {
  const values = [
    {
      title: 'Child-First Approach',
      description: 'Every design decision prioritizes the safety, privacy, and wellbeing of the children we serve.',
      icon: Heart
    },
    {
      title: 'Evidence-Based',
      description: 'Our platform is built on clinical research and validated therapeutic approaches.',
      icon: BookOpen
    },
    {
      title: 'Collaboration',
      description: 'We believe in bringing together educators, clinicians, families, and communities.',
      icon: Users
    },
    {
      title: 'Early Intervention',
      description: 'Prevention and early support are more effective than crisis intervention.',
      icon: Target
    }
  ]

  const team = [
    {
      name: 'Dr. Sarah Chen',
      role: 'Chief Executive Officer',
      background: 'Former NHS Clinical Director with 15+ years in child psychology',
      expertise: 'Child Development, Healthcare Innovation'
    },
    {
      name: 'Marcus Thompson',
      role: 'Chief Technology Officer', 
      background: 'EdTech veteran, former Head of Engineering at major learning platform',
      expertise: 'Platform Architecture, Data Security'
    },
    {
      name: 'Dr. Emily Rodriguez',
      role: 'Head of Clinical Research',
      background: 'Child psychologist specializing in school-based interventions',
      expertise: 'Clinical Validation, Therapeutic Design'
    },
    {
      name: 'James Wilson',
      role: 'Head of Education Partnerships',
      background: 'Former headteacher with 20+ years in primary education',
      expertise: 'School Integration, Teacher Training'
    }
  ]

  const milestones = [
    {
      year: '2023',
      title: 'Company Founded',
      description: 'Founded by clinical and education professionals to address the mental health crisis in schools.'
    },
    {
      year: '2024',
      title: 'Clinical Validation',
      description: 'Completed pilot studies with 12 schools and 3 NHS trusts, demonstrating measurable wellbeing improvements.'
    },
    {
      year: '2025',
      title: 'Platform Development',
      description: 'Built comprehensive platform with practitioner tools, child interfaces, and analytics dashboard.'
    },
    {
      year: '2026',
      title: 'Official Launch',
      description: 'Full commercial launch with enterprise-ready platform and comprehensive support services.'
    }
  ]

  const impact = [
    {
      stat: '10,000+',
      label: 'Children supported in pilots',
      description: 'Across schools, clinics, and hospital settings'
    },
    {
      stat: '85%',
      label: 'Improvement in wellbeing scores',
      description: 'Average increase in child self-reported wellbeing'
    },
    {
      stat: '92%',
      label: 'Practitioner satisfaction',
      description: 'Would recommend The Lift to colleagues'
    },
    {
      stat: '78%',
      label: 'Early intervention success',
      description: 'Issues identified before reaching crisis level'
    }
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />

      {/* Hero Section */}
      <section className="py-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <Badge className="mb-6 bg-gray-100 text-gray-800 border-gray-200">
            🌱 About The Lift
          </Badge>
          
          <h1 className="text-5xl md:text-6xl mb-6 text-gray-900">
            Building a future where every child can thrive
          </h1>
          
          <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
            We're on a mission to transform how we support children's mental health through innovative technology, 
            evidence-based approaches, and collaborative care.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/contact">
              <Button className="bg-gray-900 hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <Calendar className="h-5 w-5 mr-2" />
                Schedule Demo
              </Button>
            </Link>
            <Link to="/how-it-works">
              <Button variant="outline" className="text-lg px-8 py-4 rounded-full">
                <BookOpen className="h-5 w-5 mr-2" />
                How It Works
              </Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Mission Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div>
              <h2 className="text-4xl mb-6 text-gray-900">Our Mission</h2>
              <p className="text-lg text-gray-700 mb-6">
                Half of all mental health conditions start before age 14, yet most children don't receive support until 
                they reach crisis point. We're changing that by making wellbeing support accessible, engaging, and effective 
                for every child.
              </p>
              <p className="text-lg text-gray-700 mb-8">
                The Lift provides children with a safe digital space to reflect on their feelings, while giving practitioners 
                the tools they need to provide timely, targeted support.
              </p>
              <div className="flex gap-4">
                <div className="text-center">
                  <div className="text-2xl text-gray-900 mb-1">50%</div>
                  <div className="text-sm text-gray-600">of mental health conditions start before age 14</div>
                </div>
                <div className="text-center">
                  <div className="text-2xl text-gray-900 mb-1">75%</div>
                  <div className="text-sm text-gray-600">of children don't get support when they need it</div>
                </div>
                <div className="text-center">
                  <div className="text-2xl text-gray-900 mb-1">30%</div>
                  <div className="text-sm text-gray-600">reduction in crisis interventions with early support</div>
                </div>
              </div>
            </div>
            <div className="bg-white rounded-2xl p-8 shadow-lg">
              <div className="space-y-6">
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 bg-gray-700 rounded-full flex items-center justify-center">
                    <Heart className="h-6 w-6 text-white" />
                  </div>
                  <div>
                    <h3 className="text-lg text-gray-900">Child-Centered</h3>
                    <p className="text-gray-600">Every child's voice matters and is heard</p>
                  </div>
                </div>
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 bg-gray-700 rounded-full flex items-center justify-center">
                    <Shield className="h-6 w-6 text-white" />
                  </div>
                  <div>
                    <h3 className="text-lg text-gray-900">Safe & Secure</h3>
                    <p className="text-gray-600">GDPR compliant with enterprise-grade security</p>
                  </div>
                </div>
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 bg-gray-700 rounded-full flex items-center justify-center">
                    <TrendingUp className="h-6 w-6 text-white" />
                  </div>
                  <div>
                    <h3 className="text-lg text-gray-900">Evidence-Based</h3>
                    <p className="text-gray-600">Built on clinical research and validated outcomes</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Values Section */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Our Values</h2>
            <p className="text-xl text-gray-600">
              The principles that guide everything we do
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {values.map((value, index) => (
              <Card key={index} className="bg-white shadow-lg border-0 text-center">
                <CardContent className="p-6">
                  <div className="w-14 h-14 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-4">
                    <value.icon className="h-7 w-7 text-gray-700" />
                  </div>
                  <h3 className="text-lg mb-3 text-gray-900">{value.title}</h3>
                  <p className="text-gray-600 text-sm">{value.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Team Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Leadership Team</h2>
            <p className="text-xl text-gray-600">
              Experienced professionals from healthcare, education, and technology
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {team.map((member, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-6">
                  <div className="flex items-start gap-4">
                    <div className="w-16 h-16 bg-gray-300 rounded-full flex items-center justify-center">
                      <span className="text-xl text-gray-700">{member.name.split(' ').map(n => n[0]).join('')}</span>
                    </div>
                    <div className="flex-1">
                      <h3 className="text-lg mb-1 text-gray-900">{member.name}</h3>
                      <p className="text-gray-700 mb-2">{member.role}</p>
                      <p className="text-sm text-gray-600 mb-2">{member.background}</p>
                      <div className="text-xs text-gray-500">
                        <strong>Expertise:</strong> {member.expertise}
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Timeline Section */}
      <section className="py-20 px-6">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Our Journey</h2>
            <p className="text-xl text-gray-600">
              From concept to launch - building the future of child wellbeing
            </p>
          </div>
          
          <div className="space-y-8">
            {milestones.map((milestone, index) => (
              <div key={index} className="flex gap-6">
                <div className="flex flex-col items-center">
                  <div className="w-12 h-12 bg-gray-700 rounded-full flex items-center justify-center text-white">
                    {milestone.year}
                  </div>
                  {index < milestones.length - 1 && (
                    <div className="w-0.5 h-16 bg-gray-300 mt-4"></div>
                  )}
                </div>
                <div className="flex-1 pb-8">
                  <h3 className="text-xl mb-2 text-gray-900">{milestone.title}</h3>
                  <p className="text-gray-600">{milestone.description}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Impact Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Our Impact</h2>
            <p className="text-xl text-gray-600">
              Real results from our pilot programs and early adopters
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {impact.map((item, index) => (
              <Card key={index} className="bg-white shadow-lg border-0 text-center">
                <CardContent className="p-6">
                  <div className="text-3xl text-gray-900 mb-2">{item.stat}</div>
                  <h3 className="text-lg mb-2 text-gray-900">{item.label}</h3>
                  <p className="text-sm text-gray-600">{item.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gray-900 text-white">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-4xl mb-6">Ready to transform child wellbeing?</h2>
          <p className="text-xl mb-8 text-gray-300">
            Join leading schools, clinics, and healthcare providers using The Lift to support children's mental health.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/contact">
              <Button className="bg-white text-gray-900 hover:bg-gray-100 text-lg px-8 py-4 rounded-full">
                <Calendar className="h-5 w-5 mr-2" />
                Schedule Demo
              </Button>
            </Link>
            <Link to="/how-it-works">
              <Button variant="outline" className="border-gray-300 bg-transparent text-white hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <Lightbulb className="h-5 w-5 mr-2" />
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
                <Link to="/contact" className="block hover:text-white transition-colors">Contact Us</Link>
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
            <p>&copy; 2025 The Lift Up Ltd. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  )
}