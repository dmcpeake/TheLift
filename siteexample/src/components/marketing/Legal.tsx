import React from 'react'
import { Link } from 'react-router-dom'
import { Button } from '../ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card'
import { Badge } from '../ui/badge'
import { MarketingNavigation } from './MarketingNavigation'
import { 
  Heart, 
  Shield, 
  FileText,
  Lock,
  Eye,
  UserCheck,
  Database,
  Globe,
  Phone,
  Mail,
  Calendar,
  CheckCircle,
  AlertTriangle,
  Info,
  BookOpen,
  Gavel,
  Key,
  Server,
  CloudIcon as Cloud,
  Building2
} from 'lucide-react'

interface LegalProps {
  section?: 'terms' | 'privacy' | 'security'
}

export function Legal({ section }: LegalProps) {
  const renderContent = () => {
    switch (section) {
      case 'terms':
        return <TermsOfService />
      case 'privacy':
        return <PrivacyPolicy />
      case 'security':
        return <SecurityInfo />
      default:
        return <LegalOverview />
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <MarketingNavigation />
      {renderContent()}
      <Footer />
    </div>
  )
}

function LegalOverview() {
  const legalSections = [
    {
      title: 'Terms of Service',
      description: 'Our terms and conditions for using The Lift platform',
      icon: Gavel,
      link: '/legal/terms',
      lastUpdated: 'January 2025'
    },
    {
      title: 'Privacy Policy',
      description: 'How we collect, use, and protect your personal information',
      icon: Shield,
      link: '/legal/privacy',
      lastUpdated: 'January 2025'
    },
    {
      title: 'Security Information',
      description: 'Details about our security measures and compliance standards',
      icon: Lock,
      link: '/legal/security',
      lastUpdated: 'January 2025'
    }
  ]

  const compliance = [
    {
      title: 'GDPR Compliance',
      description: 'Full compliance with EU General Data Protection Regulation',
      icon: Globe
    },
    {
      title: 'Child Protection',
      description: 'Built-in safeguarding protocols for children aged 5-11',
      icon: Heart
    },
    {
      title: 'ISO 27001',
      description: 'Information security management system certification',
      icon: Lock
    },
    {
      title: 'NHS IG Toolkit',
      description: 'Compliance with NHS Information Governance requirements',
      icon: Building2
    }
  ]

  return (
    <>
      {/* Hero Section */}
      <section className="py-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <Badge className="mb-6 bg-gray-100 text-gray-800 border-gray-200">
            ⚖️ Legal Information
          </Badge>
          
          <h1 className="text-5xl md:text-6xl mb-6 text-gray-900">
            Transparency & Trust
          </h1>
          
          <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
            Our commitment to protecting your data, respecting your privacy, and maintaining the highest 
            standards of security and compliance.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/contact">
              <Button className="bg-gray-900 hover:bg-gray-800 text-lg px-8 py-4 rounded-full">
                <Calendar className="h-5 w-5 mr-2" />
                Contact Legal Team
              </Button>
            </Link>
            <Button variant="outline" className="text-lg px-8 py-4 rounded-full">
              <FileText className="h-5 w-5 mr-2" />
              Download Policies
            </Button>
          </div>
        </div>
      </section>

      {/* Legal Sections */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Legal Documentation</h2>
            <p className="text-xl text-gray-600">
              Access our complete legal framework and policies
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {legalSections.map((section, index) => (
              <Card key={index} className="bg-white shadow-lg border-0">
                <CardContent className="p-8 text-center">
                  <div className="w-16 h-16 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-6">
                    <section.icon className="h-8 w-8 text-gray-700" />
                  </div>
                  
                  <h3 className="text-xl mb-3 text-gray-900">{section.title}</h3>
                  <p className="text-gray-600 mb-6">{section.description}</p>
                  
                  <div className="text-sm text-gray-500 mb-6">
                    Last updated: {section.lastUpdated}
                  </div>
                  
                  <Link to={section.link}>
                    <Button variant="outline" className="w-full">
                      <FileText className="h-4 w-4 mr-2" />
                      Read Full Document
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Compliance Standards */}
      <section className="py-20 bg-gray-100">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-4xl mb-4 text-gray-900">Compliance Standards</h2>
            <p className="text-xl text-gray-600">
              We meet and exceed industry standards for security and privacy
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {compliance.map((item, index) => (
              <Card key={index} className="bg-white shadow-lg border-0 text-center">
                <CardContent className="p-6">
                  <div className="w-14 h-14 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-4">
                    <item.icon className="h-7 w-7 text-gray-700" />
                  </div>
                  <h3 className="text-lg mb-3 text-gray-900">{item.title}</h3>
                  <p className="text-gray-600 text-sm">{item.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>
    </>
  )
}

function TermsOfService() {
  return (
    <>
      {/* Header */}
      <section className="py-12 px-6 bg-gray-100">
        <div className="max-w-4xl mx-auto">
          <Link to="/legal" className="text-gray-600 hover:text-gray-900 mb-6 inline-block">
            ← Back to Legal
          </Link>
          
          <div className="flex items-center gap-4 mb-6">
            <div className="w-12 h-12 bg-gray-900 rounded-lg flex items-center justify-center">
              <Gavel className="h-6 w-6 text-white" />
            </div>
            <div>
              <h1 className="text-3xl text-gray-900">Terms of Service</h1>
              <p className="text-gray-600">Last updated: January 15, 2025</p>
            </div>
          </div>
        </div>
      </section>

      {/* Content */}
      <section className="py-12 px-6">
        <div className="max-w-4xl mx-auto prose prose-gray max-w-none">
          <div className="bg-white rounded-lg shadow-lg p-8">
            <h2>1. Acceptance of Terms</h2>
            <p>
              By accessing or using The Lift platform ("Service"), you agree to be bound by these Terms of Service ("Terms"). 
              If you disagree with any part of these terms, you may not access the Service.
            </p>

            <h2>2. Description of Service</h2>
            <p>
              The Lift is a digital wellbeing platform designed to support children's emotional health through:
            </p>
            <ul>
              <li>Interactive wellbeing check-ins and activities</li>
              <li>Analytics and insights for practitioners</li>
              <li>Secure communication and data management</li>
              <li>Compliance with child protection regulations</li>
            </ul>

            <h2>3. User Accounts and Responsibilities</h2>
            <h3>3.1 Account Types</h3>
            <p>The Service supports different user types:</p>
            <ul>
              <li><strong>Children:</strong> Ages 5-11, supervised by practitioners</li>
              <li><strong>Practitioners:</strong> Teachers, counselors, psychologists</li>
              <li><strong>Group Contacts:</strong> Organizational administrators</li>
              <li><strong>Lift Staff:</strong> Platform administrators</li>
            </ul>

            <h3>3.2 Account Security</h3>
            <p>
              You are responsible for safeguarding your account credentials and for all activities 
              that occur under your account.
            </p>

            <h2>4. Child Protection and Safeguarding</h2>
            <p>
              The Lift is designed with child protection as a primary consideration:
            </p>
            <ul>
              <li>All child accounts require practitioner supervision</li>
              <li>Data collection is limited to wellbeing-related information</li>
              <li>Built-in safeguarding alerts and protocols</li>
              <li>Compliance with relevant child protection legislation</li>
            </ul>

            <h2>5. Data Protection and Privacy</h2>
            <p>
              Your privacy is important to us. Our collection and use of personal information 
              is governed by our Privacy Policy, which is incorporated into these Terms by reference.
            </p>

            <h2>6. Acceptable Use</h2>
            <p>You agree not to:</p>
            <ul>
              <li>Use the Service for any unlawful purpose</li>
              <li>Compromise the security or integrity of the Service</li>
              <li>Interfere with other users' use of the Service</li>
              <li>Attempt to gain unauthorized access to any part of the Service</li>
            </ul>

            <h2>7. Intellectual Property</h2>
            <p>
              The Service and its original content, features, and functionality are owned by 
              The Liiift Up Ltd and are protected by international copyright, trademark, 
              patent, trade secret, and other intellectual property laws.
            </p>

            <h2>8. Limitation of Liability</h2>
            <p>
              In no event shall The Liiift Up Ltd be liable for any indirect, incidental, 
              special, consequential, or punitive damages arising out of your use of the Service.
            </p>

            <h2>9. Changes to Terms</h2>
            <p>
              We reserve the right to modify these Terms at any time. We will provide notice 
              of material changes via email or through the Service.
            </p>

            <h2>10. Contact Information</h2>
            <p>
              If you have questions about these Terms, please contact us at:
            </p>
            <p>
              Email: legal@thelift.co.uk<br />
              Address: 123 Innovation Street, London EC2V 8AB, United Kingdom
            </p>
          </div>
        </div>
      </section>
    </>
  )
}

function PrivacyPolicy() {
  return (
    <>
      {/* Header */}
      <section className="py-12 px-6 bg-gray-100">
        <div className="max-w-4xl mx-auto">
          <Link to="/legal" className="text-gray-600 hover:text-gray-900 mb-6 inline-block">
            ← Back to Legal
          </Link>
          
          <div className="flex items-center gap-4 mb-6">
            <div className="w-12 h-12 bg-gray-900 rounded-lg flex items-center justify-center">
              <Shield className="h-6 w-6 text-white" />
            </div>
            <div>
              <h1 className="text-3xl text-gray-900">Privacy Policy</h1>
              <p className="text-gray-600">Last updated: January 15, 2025</p>
            </div>
          </div>
        </div>
      </section>

      {/* Content */}
      <section className="py-12 px-6">
        <div className="max-w-4xl mx-auto prose prose-gray max-w-none">
          <div className="bg-white rounded-lg shadow-lg p-8">
            <h2>1. Introduction</h2>
            <p>
              The Liiift Up Ltd ("we," "our," or "us") is committed to protecting your privacy. 
              This Privacy Policy explains how we collect, use, disclose, and safeguard your 
              information when you use The Lift platform.
            </p>

            <h2>2. Information We Collect</h2>
            <h3>2.1 Personal Information</h3>
            <p>We collect personal information that you provide directly to us:</p>
            <ul>
              <li><strong>Account Information:</strong> Name, email address, role, organization</li>
              <li><strong>Child Information:</strong> First name, age, class/group (with parental consent)</li>
              <li><strong>Wellbeing Data:</strong> Responses to wellbeing activities and check-ins</li>
              <li><strong>Communication Data:</strong> Messages and interactions within the platform</li>
            </ul>

            <h3>2.2 Automatically Collected Information</h3>
            <ul>
              <li>Device information and browser type</li>
              <li>IP address and location data</li>
              <li>Usage patterns and interaction data</li>
              <li>Performance and error logs</li>
            </ul>

            <h2>3. How We Use Your Information</h2>
            <p>We use collected information for:</p>
            <ul>
              <li>Providing and improving the Service</li>
              <li>Supporting children's wellbeing through analytics and insights</li>
              <li>Communicating with users about the Service</li>
              <li>Ensuring safety and security</li>
              <li>Complying with legal obligations</li>
            </ul>

            <h2>4. Special Protections for Children</h2>
            <p>
              We implement enhanced protections for children's data:
            </p>
            <ul>
              <li>Minimal data collection - only what's necessary for wellbeing support</li>
              <li>Parental consent obtained for all child accounts</li>
              <li>No direct marketing to children</li>
              <li>Regular data review and deletion processes</li>
              <li>Safeguarding protocols for concerning responses</li>
            </ul>

            <h2>5. Data Sharing and Disclosure</h2>
            <p>We do not sell personal information. We may share information:</p>
            <ul>
              <li>With practitioners supporting a child's wellbeing (with consent)</li>
              <li>With parents/guardians as required by law</li>
              <li>With authorities if child safety concerns arise</li>
              <li>With service providers under strict confidentiality agreements</li>
              <li>As required by law or legal process</li>
            </ul>

            <h2>6. Data Security</h2>
            <p>We implement appropriate technical and organizational measures:</p>
            <ul>
              <li>End-to-end encryption for sensitive data</li>
              <li>Regular security audits and penetration testing</li>
              <li>Staff training on data protection</li>
              <li>Incident response procedures</li>
              <li>Secure data centers with physical protections</li>
            </ul>

            <h2>7. Your Rights</h2>
            <p>Under GDPR and UK data protection law, you have the right to:</p>
            <ul>
              <li>Access your personal information</li>
              <li>Correct inaccurate information</li>
              <li>Delete your information (subject to legal requirements)</li>
              <li>Restrict processing of your information</li>
              <li>Data portability</li>
              <li>Object to processing</li>
              <li>Withdraw consent</li>
            </ul>

            <h2>8. Data Retention</h2>
            <p>
              We retain personal information only for as long as necessary to fulfill 
              the purposes outlined in this policy, comply with legal obligations, 
              and protect child welfare.
            </p>

            <h2>9. International Transfers</h2>
            <p>
              Data is processed within the UK and EU. Any international transfers 
              are protected by appropriate safeguards.
            </p>

            <h2>10. Contact Us</h2>
            <p>
              For privacy questions or to exercise your rights:
            </p>
            <p>
              Data Protection Officer: dpo@thelift.co.uk<br />
              Privacy Team: privacy@thelift.co.uk<br />
              Address: 123 Innovation Street, London EC2V 8AB, United Kingdom
            </p>
          </div>
        </div>
      </section>
    </>
  )
}

function SecurityInfo() {
  const securityMeasures = [
    {
      title: 'Data Encryption',
      description: 'End-to-end encryption for all sensitive data in transit and at rest',
      icon: Lock
    },
    {
      title: 'Access Controls',
      description: 'Role-based access with multi-factor authentication',
      icon: UserCheck
    },
    {
      title: 'Infrastructure Security',
      description: 'ISO 27001 certified data centers with physical security',
      icon: Server
    },
    {
      title: 'Regular Audits',
      description: 'Third-party security assessments and penetration testing',
      icon: Eye
    }
  ]

  return (
    <>
      {/* Header */}
      <section className="py-12 px-6 bg-gray-100">
        <div className="max-w-4xl mx-auto">
          <Link to="/legal" className="text-gray-600 hover:text-gray-900 mb-6 inline-block">
            ← Back to Legal
          </Link>
          
          <div className="flex items-center gap-4 mb-6">
            <div className="w-12 h-12 bg-gray-900 rounded-lg flex items-center justify-center">
              <Lock className="h-6 w-6 text-white" />
            </div>
            <div>
              <h1 className="text-3xl text-gray-900">Security Information</h1>
              <p className="text-gray-600">Last updated: January 15, 2025</p>
            </div>
          </div>
        </div>
      </section>

      {/* Security Measures */}
      <section className="py-12 px-6">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-3xl mb-4 text-gray-900">Security Framework</h2>
            <p className="text-xl text-gray-600">
              Enterprise-grade security protecting your most sensitive data
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {securityMeasures.map((measure, index) => (
              <Card key={index} className="bg-white shadow-lg border-0 text-center">
                <CardContent className="p-6">
                  <div className="w-14 h-14 bg-gray-100 rounded-lg flex items-center justify-center mx-auto mb-4">
                    <measure.icon className="h-7 w-7 text-gray-700" />
                  </div>
                  <h3 className="text-lg mb-3 text-gray-900">{measure.title}</h3>
                  <p className="text-gray-600 text-sm">{measure.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Detailed Security Information */}
      <section className="py-12 px-6">
        <div className="max-w-4xl mx-auto">
          <div className="bg-white rounded-lg shadow-lg p-8">
            <h2 className="text-2xl mb-6 text-gray-900">Technical Security Details</h2>
            
            <div className="space-y-8">
              <div>
                <h3 className="text-xl mb-4 text-gray-900">Data Protection</h3>
                <ul className="space-y-2 text-gray-700">
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>AES-256 encryption for data at rest</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>TLS 1.3 encryption for data in transit</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Database encryption with key rotation</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Secure key management using HSMs</span>
                  </li>
                </ul>
              </div>

              <div>
                <h3 className="text-xl mb-4 text-gray-900">Access Control</h3>
                <ul className="space-y-2 text-gray-700">
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Multi-factor authentication for all users</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Role-based access control (RBAC)</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Session management and timeout controls</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Principle of least privilege enforcement</span>
                  </li>
                </ul>
              </div>

              <div>
                <h3 className="text-xl mb-4 text-gray-900">Infrastructure Security</h3>
                <ul className="space-y-2 text-gray-700">
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>ISO 27001 certified cloud infrastructure</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Network segmentation and firewalls</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>DDoS protection and monitoring</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Regular security patching and updates</span>
                  </li>
                </ul>
              </div>

              <div>
                <h3 className="text-xl mb-4 text-gray-900">Monitoring & Response</h3>
                <ul className="space-y-2 text-gray-700">
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>24/7 security monitoring and alerting</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Incident response procedures</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Comprehensive audit logging</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Regular vulnerability assessments</span>
                  </li>
                </ul>
              </div>

              <div>
                <h3 className="text-xl mb-4 text-gray-900">Compliance & Certifications</h3>
                <ul className="space-y-2 text-gray-700">
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>GDPR compliance with privacy by design</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>UK Data Protection Act 2018 compliance</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>NHS IG Toolkit requirements</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <CheckCircle className="h-5 w-5 text-gray-600 mt-0.5" />
                    <span>Child protection safeguarding standards</span>
                  </li>
                </ul>
              </div>
            </div>

            <div className="mt-12 p-6 bg-gray-50 rounded-lg">
              <h3 className="text-lg mb-3 text-gray-900">Security Contact</h3>
              <p className="text-gray-700 mb-4">
                For security concerns, vulnerability reports, or compliance questions:
              </p>
              <div className="space-y-2 text-gray-700">
                <div>Email: security@thelift.co.uk</div>
                <div>PGP Key: Available upon request</div>
                <div>Response time: Within 24 hours for critical issues</div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  )
}

function Footer() {
  return (
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
  )
}