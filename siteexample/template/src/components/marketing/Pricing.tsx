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
  X,
  Star,
  Zap,
  Crown,
  Globe,
  BarChart3,
  Headphones,
  Clock,
  Database,
  Lock,
  UserCheck
} from 'lucide-react'

export function Pricing() {
  const plans = [
    {
      name: 'Essential',
      description: 'Perfect for small schools and practices starting their wellbeing journey',
      monthlyPrice: '£299',
      yearlyPrice: '£2,990',
      users: 'Up to 50 children',
      practitioners: 'Up to 5 practitioners',
      popular: false,
      features: [
        'Wellbeing wheel check-ins',
        'Basic garden activities',
        'Individual child profiles',
        'Basic analytics dashboard',
        'Email support',
        'Standard onboarding'
      ],
      limitations: [
        'Limited customization options',
        'Basic reporting only',
        'No API access',
        'Standard support response time'
      ]
    },
    {
      name: 'Professional', 
      description: 'Ideal for medium-sized clients with advanced support needs',
      monthlyPrice: '£599',
      yearlyPrice: '£5,990',
      users: 'Up to 200 children',
      practitioners: 'Up to 20 practitioners',
      popular: true,
      features: [
        'All Essential features',
        'Advanced analytics & insights',
        'Customizable wellbeing activities',
        'Multi-client support',
        'Priority email & phone support',
        'Dedicated onboarding specialist',
        'Training sessions included',
        'Custom reporting',
        'Data export capabilities'
      ],
      limitations: [
        'Limited API access',
        'Standard integrations only'
      ]
    },
    {
      name: 'Enterprise',
      description: 'Comprehensive solution for large clients and health systems',
      monthlyPrice: 'Custom',
      yearlyPrice: 'Custom',
      users: 'Unlimited children',
      practitioners: 'Unlimited practitioners',
      popular: false,
      features: [
        'All Professional features',
        'Full platform customization',
        'Advanced integrations (SIS, EMR)',
        'Dedicated customer success manager',
        '24/7 priority support',
        'Custom development available',
        'Advanced security options',
        'Multi-tenancy support',
        'White-label options',
        'SLA guarantees',
        'Compliance assistance'
      ],
      limitations: []
    }
  ]

  const addOns = [
    {
      name: 'Professional Training',
      description: 'Comprehensive training program for your team',
      price: '£1,500 per session',
      features: [
        'On-site or virtual delivery',
        'Up to 20 participants',
        'Certification included',
        'Training materials provided'
      ]
    },
    {
      name: 'Custom Integration',
      description: 'Connect The Lift to your existing systems',
      price: 'From £5,000',
      features: [
        'API development',
        'Data migration support',
        'Testing & validation',
        'Ongoing maintenance'
      ]
    },
    {
      name: 'Advanced Analytics',
      description: 'Enhanced reporting and data visualization',
      price: '£299/month',
      features: [
        'Custom dashboards',
        'Advanced reporting',
        'Data visualization tools',
        'Export capabilities'
      ]
    }
  ]

  const faqs = [
    {
      question: 'How is pricing calculated?',
      answer: 'Pricing is based on the number of children registered on the platform and the level of features required. We offer flexible payment options including monthly and annual billing.'
    },
    {
      question: 'Is there a setup fee?',
      answer: 'No setup fees for Essential and Professional plans. Enterprise customers receive custom pricing that may include implementation services.'
    },
    {
      question: 'Can we upgrade or downgrade our plan?',
      answer: 'Yes, you can change your plan at any time. Upgrades take effect immediately, while downgrades take effect at your next billing cycle.'
    },
    {
      question: 'What support is included?',
      answer: 'All plans include email support. Professional plans add phone support, and Enterprise customers receive dedicated account management and 24/7 priority support.'
    },
    {
      question: 'Do you offer discounts for charities or educational institutions?',
      answer: 'Yes, we offer special pricing for registered charities, educational institutions, and NHS clients. Contact us to discuss your specific needs.'
    },
    {
      question: 'What happens to our data if we cancel?',
      answer: 'You retain full ownership of your data. We provide data export options and will work with you to ensure a smooth transition if needed.'
    }
  ]

  const comparison = [
    { feature: 'Child wellbeing check-ins', essential: true, professional: true, enterprise: true },
    { feature: 'Practitioner dashboard', essential: true, professional: true, enterprise: true },
    { feature: 'Basic analytics', essential: true, professional: true, enterprise: true },
    { feature: 'Email support', essential: true, professional: true, enterprise: true },
    { feature: 'Advanced analytics', essential: false, professional: true, enterprise: true },
    { feature: 'Custom reporting', essential: false, professional: true, enterprise: true },
    { feature: 'Phone support', essential: false, professional: true, enterprise: true },
    { feature: 'API access', essential: false, professional: 'Limited', enterprise: 'Full' },
    { feature: 'Custom integrations', essential: false, professional: false, enterprise: true },
    { feature: 'Dedicated support manager', essential: false, professional: false, enterprise: true },
    { feature: '24/7 priority support', essential: false, professional: false, enterprise: true },
    { feature: 'White-label options', essential: false, professional: false, enterprise: true }
  ]

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />

      {/* Hero Section */}
      <section className="py-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <Badge className="mb-6 bg-gray-100 text-gray-800 border-gray-200">
            💰 Pricing Plans
          </Badge>
          
          <h1 className="text-5xl md:text-6xl mb-6 text-gray-900">
            Simple, transparent pricing
          </h1>
          
          <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
            Choose the plan that fits your client's size and needs. All plans include core wellbeing 
            features with no hidden fees or surprise charges.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/contact">
              <Button className="bg-gray-900 hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <Calendar className="h-5 w-5 mr-2" />
                Schedule Demo
              </Button>
            </Link>
            <Button variant="outline" className="text-lg px-8 py-4 rounded-full">
              <Phone className="h-5 w-5 mr-2" />
              Speak to Sales
            </Button>
          </div>
        </div>
      </section>

      {/* Pricing Cards */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {plans.map((plan, index) => (
              <Card key={index} className={`bg-white shadow-lg border-0 relative ${plan.popular ? 'ring-2 ring-gray-400' : ''}`}>
                {plan.popular && (
                  <div className="absolute -top-4 left-1/2 transform -translate-x-1/2">
                    <Badge className="bg-gray-900 text-white px-4 py-1">
                      Most Popular
                    </Badge>
                  </div>
                )}
                
                <CardHeader className="text-center pb-8">
                  <div className="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    {index === 0 && <School className="h-8 w-8 text-gray-700" />}
                    {index === 1 && <Building2 className="h-8 w-8 text-gray-700" />}
                    {index === 2 && <Crown className="h-8 w-8 text-gray-700" />}
                  </div>
                  
                  <CardTitle className="text-2xl mb-2">{plan.name}</CardTitle>
                  <CardDescription className="text-gray-600 mb-4">{plan.description}</CardDescription>
                  
                  <div className="mb-4">
                    <div className="text-4xl text-gray-900 mb-1">{plan.monthlyPrice}</div>
                    {plan.monthlyPrice !== 'Custom' && (
                      <div className="text-sm text-gray-600">per month, billed annually</div>
                    )}
                  </div>
                  
                  <div className="text-sm text-gray-600 space-y-1">
                    <div>{plan.users}</div>
                    <div>{plan.practitioners}</div>
                  </div>
                </CardHeader>
                
                <CardContent className="pt-0">
                  <div className="space-y-3 mb-8">
                    {plan.features.map((feature, featureIndex) => (
                      <div key={featureIndex} className="flex items-center gap-3">
                        <CheckCircle className="h-4 w-4 text-gray-600 flex-shrink-0" />
                        <span className="text-gray-700 text-sm">{feature}</span>
                      </div>
                    ))}
                    
                    {plan.limitations.map((limitation, limitIndex) => (
                      <div key={limitIndex} className="flex items-center gap-3">
                        <X className="h-4 w-4 text-gray-400 flex-shrink-0" />
                        <span className="text-gray-500 text-sm">{limitation}</span>
                      </div>
                    ))}
                  </div>
                  
                  <Link to="/contact">
                    <Button 
                      className={`w-full py-3 rounded-full ${
                        plan.popular 
                          ? 'bg-gray-900 hover:bg-gray-800 text-white' 
                          : 'bg-gray-100 hover:bg-gray-200 text-gray-900'
                      }`}
                    >
                      {plan.name === 'Enterprise' ? 'Contact Sales' : 'Schedule Demo'}
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Feature Comparison */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Feature Comparison</h2>
            <p className="text-xl text-gray-600">
              Compare what's included in each plan
            </p>
          </div>
          
          <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="text-left p-6 text-gray-900">Features</th>
                    <th className="text-center p-6 text-gray-900">Essential</th>
                    <th className="text-center p-6 text-gray-900">Professional</th>
                    <th className="text-center p-6 text-gray-900">Enterprise</th>
                  </tr>
                </thead>
                <tbody>
                  {comparison.map((item, index) => (
                    <tr key={index} className="border-t border-gray-200">
                      <td className="p-6 text-gray-700">{item.feature}</td>
                      <td className="p-6 text-center">
                        {item.essential === true ? (
                          <CheckCircle className="h-5 w-5 text-gray-600 mx-auto" />
                        ) : item.essential === false ? (
                          <X className="h-5 w-5 text-gray-400 mx-auto" />
                        ) : (
                          <span className="text-sm text-gray-600">{item.essential}</span>
                        )}
                      </td>
                      <td className="p-6 text-center">
                        {item.professional === true ? (
                          <CheckCircle className="h-5 w-5 text-gray-600 mx-auto" />
                        ) : item.professional === false ? (
                          <X className="h-5 w-5 text-gray-400 mx-auto" />
                        ) : (
                          <span className="text-sm text-gray-600">{item.professional}</span>
                        )}
                      </td>
                      <td className="p-6 text-center">
                        {item.enterprise === true ? (
                          <CheckCircle className="h-5 w-5 text-gray-600 mx-auto" />
                        ) : item.enterprise === false ? (
                          <X className="h-5 w-5 text-gray-400 mx-auto" />
                        ) : (
                          <span className="text-sm text-gray-600">{item.enterprise}</span>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </section>

      {/* Add-ons Section */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Add-on Services</h2>
            <p className="text-xl text-gray-600">
              Enhance your platform with additional services and support
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {addOns.map((addon, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-6">
                  <div className="text-center mb-6">
                    <div className="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-4">
                      {index === 0 && <Headphones className="h-6 w-6 text-gray-700" />}
                      {index === 1 && <Zap className="h-6 w-6 text-gray-700" />}
                      {index === 2 && <BarChart3 className="h-6 w-6 text-gray-700" />}
                    </div>
                    <h3 className="text-xl mb-2 text-gray-900">{addon.name}</h3>
                    <p className="text-gray-600 mb-4">{addon.description}</p>
                    <div className="text-2xl text-gray-900 mb-4">{addon.price}</div>
                  </div>
                  
                  <div className="space-y-2">
                    {addon.features.map((feature, featureIndex) => (
                      <div key={featureIndex} className="flex items-center gap-2">
                        <CheckCircle className="h-4 w-4 text-gray-600" />
                        <span className="text-sm text-gray-700">{feature}</span>
                      </div>
                    ))}
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
            <h2 className="text-4xl mb-4 text-gray-900">Frequently Asked Questions</h2>
            <p className="text-xl text-gray-600">
              Everything you need to know about our pricing and plans
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
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gray-900 text-white">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h2 className="text-4xl mb-6">Ready to transform child wellbeing?</h2>
          <p className="text-xl mb-8 text-gray-300">
            Schedule a personalized demo to see The Lift in action and find the perfect plan for your client.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/contact">
              <Button className="bg-white text-gray-900 hover:bg-gray-100 text-lg px-8 py-4 rounded-full">
                <Calendar className="h-5 w-5 mr-2" />
                Schedule Demo
              </Button>
            </Link>
            <Button variant="outline" className="border-gray-300 bg-transparent text-white hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
              <Phone className="h-5 w-5 mr-2" />
              Speak to Sales
            </Button>
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