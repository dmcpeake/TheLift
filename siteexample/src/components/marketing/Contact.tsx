import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import { Button } from '../ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Badge } from '../ui/badge'
import { Input } from '../ui/input'
import { Label } from '../ui/label'
import { Textarea } from '../ui/textarea'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select'
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
  MapPin,
  Clock,
  MessageCircle,
  Headphones,
  FileText,
  Video,
  User,
  Building,
  Globe
} from 'lucide-react'

export function Contact() {
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    organization: '',
    organizationType: '',
    role: '',
    numberOfChildren: '',
    message: '',
    requestType: 'demo'
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    // Handle form submission
    console.log('Form submitted:', formData)
  }

  const handleInputChange = (field: string, value: string) => {
    setFormData(prev => ({ ...prev, [field]: value }))
  }

  const contactMethods = [
    {
      title: 'Schedule a Demo',
      description: 'See The Lift in action with a personalized demonstration',
      icon: Video,
      action: 'Book 30-minute demo',
      details: 'Available Monday-Friday, 9 AM - 5 PM GMT',
      primary: true
    },
    {
      title: 'Speak to Sales',
      description: 'Discuss pricing, plans, and custom requirements',
      icon: Phone,
      action: 'Call +44 (0) 20 1234 5678',
      details: 'Sales team available 9 AM - 6 PM GMT',
      primary: false
    },
    {
      title: 'General Inquiries',
      description: 'Questions about The Lift platform or partnership opportunities',
      icon: Mail,
      action: 'hello@thelift.co.uk',
      details: 'Response within 24 hours',
      primary: false
    },
    {
      title: 'Support',
      description: 'Technical support for existing customers',
      icon: Headphones,
      action: 'support@thelift.co.uk',
      details: 'Priority support for paid plans',
      primary: false
    }
  ]

  const offices = [
    {
      city: 'London',
      address: '123 Innovation Street\nLondon EC2V 8AB\nUnited Kingdom',
      primary: true
    },
    {
      city: 'Manchester',
      address: '456 Digital Way\nManchester M1 2AB\nUnited Kingdom',
      primary: false
    }
  ]

  const faqs = [
    {
      question: 'How long does implementation take?',
      answer: 'Implementation typically takes 2-6 weeks depending on the size of your organization and customization requirements. We provide dedicated support throughout the process.'
    },
    {
      question: 'Do you provide training?',
      answer: 'Yes, we include comprehensive training for all user types - practitioners, administrators, and children. Training can be delivered on-site or virtually.'
    },
    {
      question: 'Is The Lift GDPR compliant?',
      answer: 'Absolutely. The Lift is built with privacy by design and meets all GDPR requirements. We also comply with additional child protection regulations.'
    },
    {
      question: 'Can The Lift integrate with our existing systems?',
      answer: 'Yes, we offer integrations with most Student Information Systems (SIS), Electronic Medical Records (EMR), and other educational/clinical platforms.'
    },
    {
      question: 'What ongoing support do you provide?',
      answer: 'We provide email support for all plans, phone support for Professional plans, and dedicated account management for Enterprise customers.'
    }
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />

      {/* Hero Section */}
      <section className="py-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <Badge className="mb-6 bg-gray-100 text-gray-800 border-gray-200">
            📞 Contact Us
          </Badge>
          
          <h1 className="text-5xl md:text-6xl mb-6 text-gray-900">
            Let's transform child wellbeing together
          </h1>
          
          <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
            Ready to see how The Lift can support children in your organization? Our team is here to 
            answer your questions and provide a personalized demonstration.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button className="bg-gray-900 hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
              <Calendar className="h-5 w-5 mr-2" />
              Schedule Demo Now
            </Button>
            <Button variant="outline" className="text-lg px-8 py-4 rounded-full">
              <Phone className="h-5 w-5 mr-2" />
              Call Sales Team
            </Button>
          </div>
        </div>
      </section>

      {/* Contact Methods */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Get in Touch</h2>
            <p className="text-xl text-gray-600">
              Choose the best way to connect with our team
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {contactMethods.map((method, index) => (
              <Card key={index} className={`bg-white shadow-lg border-0 ${method.primary ? 'ring-2 ring-gray-400' : ''}`}>
                <CardContent className="p-6 text-center">
                  <div className={`w-14 h-14 rounded-lg flex items-center justify-center mx-auto mb-4 ${
                    method.primary ? 'bg-gray-900' : 'bg-gray-100'
                  }`}>
                    <method.icon className={`h-7 w-7 ${method.primary ? 'text-white' : 'text-gray-700'}`} />
                  </div>
                  
                  <h3 className="text-lg mb-2 text-gray-900">{method.title}</h3>
                  <p className="text-gray-600 text-sm mb-4">{method.description}</p>
                  
                  <div className="mb-4">
                    <div className="text-gray-900 mb-1">{method.action}</div>
                    <div className="text-xs text-gray-500">{method.details}</div>
                  </div>
                  
                  <Button 
                    variant={method.primary ? "default" : "outline"}
                    className={`w-full ${method.primary ? 'bg-gray-900 hover:bg-gray-800' : ''}`}
                  >
                    {method.title.includes('Demo') ? 'Book Demo' : 'Contact'}
                  </Button>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Contact Form */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-4xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Request Information</h2>
            <p className="text-xl text-gray-600">
              Fill out the form below and we'll get back to you within 24 hours
            </p>
          </div>
          
          <Card className="bg-white shadow-lg border-0">
            <CardContent className="p-8">
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="firstName">First Name *</Label>
                    <Input
                      id="firstName"
                      value={formData.firstName}
                      onChange={(e) => handleInputChange('firstName', e.target.value)}
                      required
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="lastName">Last Name *</Label>
                    <Input
                      id="lastName"
                      value={formData.lastName}
                      onChange={(e) => handleInputChange('lastName', e.target.value)}
                      required
                      className="mt-1"
                    />
                  </div>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="email">Email Address *</Label>
                    <Input
                      id="email"
                      type="email"
                      value={formData.email}
                      onChange={(e) => handleInputChange('email', e.target.value)}
                      required
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="phone">Phone Number</Label>
                    <Input
                      id="phone"
                      type="tel"
                      value={formData.phone}
                      onChange={(e) => handleInputChange('phone', e.target.value)}
                      className="mt-1"
                    />
                  </div>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="organization">Organization Name *</Label>
                    <Input
                      id="organization"
                      value={formData.organization}
                      onChange={(e) => handleInputChange('organization', e.target.value)}
                      required
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="organizationType">Organization Type *</Label>
                    <Select onValueChange={(value) => handleInputChange('organizationType', value)}>
                      <SelectTrigger className="mt-1">
                        <SelectValue placeholder="Select type" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="school-primary">Primary School</SelectItem>
                        <SelectItem value="school-secondary">Secondary School</SelectItem>
                        <SelectItem value="academy-trust">Academy Trust</SelectItem>
                        <SelectItem value="clinic-private">Private Clinic</SelectItem>
                        <SelectItem value="nhs-trust">NHS Trust</SelectItem>
                        <SelectItem value="hospital">Hospital</SelectItem>
                        <SelectItem value="charity">Charity</SelectItem>
                        <SelectItem value="other">Other</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="role">Your Role *</Label>
                    <Select onValueChange={(value) => handleInputChange('role', value)}>
                      <SelectTrigger className="mt-1">
                        <SelectValue placeholder="Select role" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="headteacher">Headteacher</SelectItem>
                        <SelectItem value="deputy-head">Deputy Headteacher</SelectItem>
                        <SelectItem value="senco">SENCO</SelectItem>
                        <SelectItem value="teacher">Teacher</SelectItem>
                        <SelectItem value="psychologist">Psychologist</SelectItem>
                        <SelectItem value="counselor">Counselor</SelectItem>
                        <SelectItem value="manager">Manager/Director</SelectItem>
                        <SelectItem value="admin">Administrator</SelectItem>
                        <SelectItem value="other">Other</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="numberOfChildren">Number of Children</Label>
                    <Select onValueChange={(value) => handleInputChange('numberOfChildren', value)}>
                      <SelectTrigger className="mt-1">
                        <SelectValue placeholder="Select range" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="1-50">1-50</SelectItem>
                        <SelectItem value="51-200">51-200</SelectItem>
                        <SelectItem value="201-500">201-500</SelectItem>
                        <SelectItem value="501-1000">501-1000</SelectItem>
                        <SelectItem value="1000+">1000+</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                </div>
                
                <div>
                  <Label htmlFor="requestType">Request Type *</Label>
                  <Select onValueChange={(value) => handleInputChange('requestType', value)} defaultValue="demo">
                    <SelectTrigger className="mt-1">
                      <SelectValue />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="demo">Schedule Demo</SelectItem>
                      <SelectItem value="pricing">Pricing Information</SelectItem>
                      <SelectItem value="partnership">Partnership Inquiry</SelectItem>
                      <SelectItem value="support">Technical Support</SelectItem>
                      <SelectItem value="other">Other</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
                
                <div>
                  <Label htmlFor="message">Message</Label>
                  <Textarea
                    id="message"
                    rows={4}
                    value={formData.message}
                    onChange={(e) => handleInputChange('message', e.target.value)}
                    placeholder="Tell us more about your needs and how we can help..."
                    className="mt-1"
                  />
                </div>
                
                <div className="flex gap-4">
                  <Button type="submit" className="bg-gray-900 hover:bg-gray-800 px-8 py-3">
                    <Calendar className="h-4 w-4 mr-2" />
                    Submit Request
                  </Button>
                  <Button type="button" variant="outline" className="px-8 py-3">
                    <Phone className="h-4 w-4 mr-2" />
                    Call Instead
                  </Button>
                </div>
              </form>
            </CardContent>
          </Card>
        </div>
      </section>

      {/* Office Locations */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Our Offices</h2>
            <p className="text-xl text-gray-600">
              Visit us at one of our UK locations
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {offices.map((office, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-8">
                  <div className="flex items-center gap-4 mb-6">
                    <div className="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center">
                      <MapPin className="h-6 w-6 text-gray-700" />
                    </div>
                    <div>
                      <h3 className="text-xl text-gray-900">{office.city}</h3>
                      {office.primary && (
                        <Badge className="bg-gray-100 text-gray-800 border-gray-200">
                          Headquarters
                        </Badge>
                      )}
                    </div>
                  </div>
                  
                  <div className="whitespace-pre-line text-gray-600 mb-6">
                    {office.address}
                  </div>
                  
                  <div className="space-y-2 text-sm text-gray-600">
                    <div className="flex items-center gap-2">
                      <Clock className="h-4 w-4" />
                      <span>Monday - Friday: 9:00 AM - 6:00 PM</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <Phone className="h-4 w-4" />
                      <span>+44 (0) 20 1234 5678</span>
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* FAQ Section */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-4xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Common Questions</h2>
            <p className="text-xl text-gray-600">
              Quick answers to frequently asked questions
            </p>
          </div>
          
          <div className="space-y-6">
            {faqs.map((faq, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-6">
                  <h3 className="text-lg mb-3 text-gray-900">{faq.question}</h3>
                  <p className="text-gray-600">{faq.answer}</p>
                </CardContent>
              </Card>
            ))}
          </div>
          
          <div className="text-center mt-12">
            <p className="text-gray-600 mb-4">Still have questions?</p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button variant="outline" className="px-6 py-3">
                <Mail className="h-4 w-4 mr-2" />
                Email Support
              </Button>
              <Button variant="outline" className="px-6 py-3">
                <FileText className="h-4 w-4 mr-2" />
                View Documentation
              </Button>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gray-900 text-white">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-4xl mb-6">Ready to get started?</h2>
          <p className="text-xl mb-8 text-gray-300">
            Join hundreds of organizations already using The Lift to support children's wellbeing.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button className="bg-white text-gray-900 hover:bg-gray-100 text-lg px-8 py-4 rounded-full">
              <Calendar className="h-5 w-5 mr-2" />
              Schedule Demo
            </Button>
            <Link to="/pricing">
              <Button variant="outline" className="border-gray-300 bg-transparent text-white hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <Award className="h-5 w-5 mr-2" />
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
            <p>&copy; 2025 The Liiift Up Ltd. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  )
}