// Temporary script to populate test waitlist data
// Run this with: node populate-waitlist-test-data.js

import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://jxdkwfhsicynyvhkutjm.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4ZGt3ZmhzaWN5bnl2aGt1dGptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY3MjAxNTAsImV4cCI6MjA3MjI5NjE1MH0.ZuG6MjKYX2FM-WCIhzLyVRXA0x87kFgUvy-LlVM2QwY'

const supabase = createClient(supabaseUrl, supabaseKey)

const testData = [
  {
    name: 'Sarah Johnson',
    email: 'sarah.johnson@primaryschool.edu',
    organization: 'Meadowbrook Primary School',
    role: 'teacher',
    created_at: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000).toISOString() // 5 days ago
  },
  {
    name: 'Dr. Michael Chen',
    email: 'michael.chen@childpsychology.uk',
    organization: 'London Child Psychology Centre',
    role: 'psychologist',
    created_at: new Date(Date.now() - 4 * 24 * 60 * 60 * 1000).toISOString() // 4 days ago
  },
  {
    name: 'Emma Thompson',
    email: 'emma.thompson@gmail.com',
    organization: null,
    role: 'parent',
    created_at: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000).toISOString() // 3 days ago
  },
  {
    name: 'James Wilson',
    email: 'j.wilson@stmarys-academy.org',
    organization: 'St. Mary\'s Academy',
    role: 'headteacher',
    created_at: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString() // 2 days ago
  },
  {
    name: 'Dr. Rachel Green',
    email: 'r.green@nhs.uk',
    organization: 'NHS Greater Manchester Mental Health Trust',
    role: 'therapist',
    created_at: new Date(Date.now() - 1 * 24 * 60 * 60 * 1000).toISOString() // 1 day ago
  },
  {
    name: 'Lisa Parker',
    email: 'lisa.parker@counselling.co.uk',
    organization: 'Parker Counselling Services',
    role: 'counselor',
    created_at: new Date(Date.now() - 12 * 60 * 60 * 1000).toISOString() // 12 hours ago
  },
  {
    name: 'David Mitchell',
    email: 'dmitchell@yahoo.com',
    organization: null,
    role: 'parent',
    created_at: new Date(Date.now() - 6 * 60 * 60 * 1000).toISOString() // 6 hours ago
  },
  {
    name: 'Anna Roberts',
    email: 'a.roberts@riverside-school.edu',
    organization: 'Riverside Community School',
    role: 'social-worker',
    created_at: new Date(Date.now() - 3 * 60 * 60 * 1000).toISOString() // 3 hours ago
  },
  {
    name: 'Mark Edwards',
    email: 'mark.edwards@gmail.com',
    organization: null,
    role: 'parent',
    created_at: new Date(Date.now() - 1 * 60 * 60 * 1000).toISOString() // 1 hour ago
  },
  {
    name: 'Sophie Williams',
    email: 's.williams@oakwood-primary.org',
    organization: 'Oakwood Primary School',
    role: 'teacher',
    created_at: new Date(Date.now() - 30 * 60 * 1000).toISOString() // 30 minutes ago
  },
  {
    name: 'Tom Anderson',
    email: 't.anderson@education-authority.gov.uk',
    organization: 'Birmingham Education Authority',
    role: 'administrator',
    created_at: new Date().toISOString() // Just now
  }
]

async function populateTestData() {
  try {
    // First, let's check if the waitlist table exists and create it if it doesn't
    console.log('Inserting test waitlist data...')
    
    const { data, error } = await supabase
      .from('waitlist')
      .insert(testData)
      .select()
    
    if (error) {
      console.error('Error inserting test data:', error)
      return
    }
    
    console.log(`Successfully inserted ${data.length} test waitlist entries:`)
    data.forEach((entry, index) => {
      console.log(`${index + 1}. ${entry.name} (${entry.email}) - ${entry.role || 'no role'}`)
    })
    
  } catch (err) {
    console.error('Error:', err)
  }
}

populateTestData()