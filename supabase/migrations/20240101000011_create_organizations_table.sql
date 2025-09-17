-- Create organizations table
CREATE TABLE IF NOT EXISTS public.organizations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Enable RLS
ALTER TABLE public.organizations ENABLE ROW LEVEL SECURITY;

-- Create RLS policies for organizations
CREATE POLICY "Anyone can read organizations" ON public.organizations
  FOR SELECT USING (true);

-- Insert some test organizations
INSERT INTO public.organizations (name) VALUES
  ('Riverside Primary School'),
  ('Oakwood Elementary'),
  ('Sunshine Daycare Center')
ON CONFLICT DO NOTHING;

-- Add org_id to profiles table if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'profiles'
    AND column_name = 'org_id'
  ) THEN
    ALTER TABLE public.profiles
    ADD COLUMN org_id UUID REFERENCES public.organizations(id);
  END IF;
END $$;

-- Update existing profiles with a default organization
UPDATE public.profiles
SET org_id = (SELECT id FROM public.organizations WHERE name = 'Riverside Primary School' LIMIT 1)
WHERE org_id IS NULL AND role = 'Child';

-- Create index for performance
CREATE INDEX IF NOT EXISTS idx_profiles_org_id ON public.profiles(org_id);