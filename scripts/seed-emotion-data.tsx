import { getSupabaseClient } from '../src/utils/supabase/client.tsx'

const supabase = getSupabaseClient()

const testEmotionData = [
  // Chloe King's recent check-ins
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-17T14:30:00',
    explanation_text: 'Feeling a bit anxious about my upcoming math test, but I studied hard so I think I\'ll do okay.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-16T09:15:00',
    explanation_text: 'Had a great time playing with my friends at recess today! We played tag and everyone was laughing.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-15T15:45:00',
    explanation_text: 'Feeling tired after PE class but proud that I ran the whole mile without stopping.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-14T11:20:00',
    explanation_text: 'My art project didn\'t turn out how I wanted and I feel frustrated. I might try again tomorrow.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-13T13:00:00',
    explanation_text: 'Excited about the school play next week! I have been practicing my lines every day.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-12T10:30:00',
    explanation_text: 'Feeling okay today. Nothing special happened but nothing bad either.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-11T14:00:00',
    explanation_text: 'Got picked for the soccer team! I\'m so happy and can\'t wait for practice to start.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-10T09:00:00',
    explanation_text: 'Had a disagreement with my best friend and we\'re not talking. I feel sad and hope we make up soon.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-09T16:00:00',
    explanation_text: 'Teacher said my story was really creative! I feel proud and want to write more.'
  },
  {
    child_id: '28e7a649-8677-4476-b88c-b5b923a9a4e2',
    created_at: '2025-01-08T11:45:00',
    explanation_text: 'Feeling nervous about the dentist appointment tomorrow. I don\'t like going there.'
  },

  // Liam Johnson's check-ins
  {
    child_id: '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b',
    created_at: '2025-01-17T10:00:00',
    explanation_text: 'Really enjoying my new book series. I stayed up late reading last night!'
  },
  {
    child_id: '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b',
    created_at: '2025-01-16T14:20:00',
    explanation_text: 'Struggled with homework today but my dad helped me understand it better.'
  },
  {
    child_id: '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b',
    created_at: '2025-01-15T09:30:00',
    explanation_text: 'Made a new friend in music class. We both play guitar!'
  },

  // Emma Davis's check-ins
  {
    child_id: '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c',
    created_at: '2025-01-17T13:45:00',
    explanation_text: 'Feeling calm after meditation session in wellness class. I like these quiet moments.'
  },
  {
    child_id: '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c',
    created_at: '2025-01-16T10:30:00',
    explanation_text: 'Worried about my grandma who is sick. I hope she feels better soon.'
  },
  {
    child_id: '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c',
    created_at: '2025-01-15T14:15:00',
    explanation_text: 'Had fun in science class today! We did an experiment with volcanoes.'
  }
]

async function seedEmotionData() {
  console.log('Starting to seed emotion grid data...')

  // First, let's see what the table structure looks like
  const { data: tableCheck, error: checkError } = await supabase
    .from('emotion_grid_usage')
    .select('*')
    .limit(1)

  console.log('Table structure check:', { tableCheck, checkError })

  // We need to add session_id to each record - let's generate UUIDs for them
  const dataWithSessionIds = testEmotionData.map(record => ({
    ...record,
    session_id: crypto.randomUUID(),
    user_id: record.child_id // Assuming user_id is same as child_id
  }))

  // Insert the test data
  const { data, error } = await supabase
    .from('emotion_grid_usage')
    .insert(dataWithSessionIds)
    .select()

  if (error) {
    console.error('Error inserting emotion data:', error)
    return
  }

  console.log(`Successfully inserted ${data?.length || 0} emotion grid records`)

  // Verify the data for Chloe
  const { data: chloeData, error: verifyError } = await supabase
    .from('emotion_grid_usage')
    .select('*')
    .eq('child_id', '28e7a649-8677-4476-b88c-b5b923a9a4e2')
    .order('created_at', { ascending: false })

  if (verifyError) {
    console.error('Error verifying data:', verifyError)
  } else {
    console.log(`\nVerified: Chloe King now has ${chloeData?.length || 0} emotion check-ins`)
    if (chloeData && chloeData.length > 0) {
      console.log('Latest check-in:', {
        date: chloeData[0].created_at,
        text: chloeData[0].explanation_text?.substring(0, 50) + '...'
      })
    }
  }
}

// Run the seeding function
seedEmotionData()
  .then(() => {
    console.log('Seeding complete!')
    process.exit(0)
  })
  .catch(err => {
    console.error('Fatal error:', err)
    process.exit(1)
  })