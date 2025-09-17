-- Create AI analyses table to store Claude analysis results
CREATE TABLE IF NOT EXISTS public.ai_analyses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  org_id uuid REFERENCES public.organisations(id) ON DELETE CASCADE,
  child_id uuid REFERENCES public.profiles(id) ON DELETE CASCADE,
  analysis_type text NOT NULL CHECK (analysis_type IN ('trends', 'sentiment', 'concerns', 'comprehensive')),
  date_range text NOT NULL CHECK (date_range IN ('week', 'month', 'all')),
  analysis_result text NOT NULL,
  data_points_analyzed integer NOT NULL DEFAULT 0,
  created_by uuid NOT NULL REFERENCES public.profiles(id),
  created_at timestamptz NOT NULL DEFAULT now(),

  -- Add indexes for performance
  CONSTRAINT ai_analyses_org_or_child CHECK (
    (org_id IS NOT NULL AND child_id IS NULL) OR
    (org_id IS NULL AND child_id IS NOT NULL) OR
    (org_id IS NOT NULL AND child_id IS NOT NULL)
  )
);

-- Create indexes for better query performance
CREATE INDEX idx_ai_analyses_org_id ON public.ai_analyses(org_id);
CREATE INDEX idx_ai_analyses_child_id ON public.ai_analyses(child_id);
CREATE INDEX idx_ai_analyses_created_at ON public.ai_analyses(created_at DESC);
CREATE INDEX idx_ai_analyses_analysis_type ON public.ai_analyses(analysis_type);

-- Enable RLS
ALTER TABLE public.ai_analyses ENABLE ROW LEVEL SECURITY;

-- Create RLS policies
CREATE POLICY "Users can view analyses for their organization"
  ON public.ai_analyses FOR SELECT
  USING (
    org_id IN (
      SELECT org_id FROM public.profiles WHERE id = auth.uid()
    )
  );

CREATE POLICY "GroupContacts and Practitioners can create analyses"
  ON public.ai_analyses FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid()
      AND role IN ('GroupContact', 'Practitioner', 'Account')
      AND (
        org_id = ai_analyses.org_id
        OR org_id IN (
          SELECT org_id FROM public.profiles WHERE id = ai_analyses.child_id
        )
      )
    )
  );

-- Grant necessary permissions
GRANT ALL ON public.ai_analyses TO authenticated;
GRANT USAGE ON SCHEMA public TO anon;
GRANT SELECT ON public.ai_analyses TO anon;