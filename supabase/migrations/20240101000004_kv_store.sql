-- Create kv_store table for Edge Functions data storage
CREATE TABLE IF NOT EXISTS public.kv_store (
    key text PRIMARY KEY,
    value jsonb NOT NULL,
    created_at timestamptz DEFAULT now(),
    updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE public.kv_store ENABLE ROW LEVEL SECURITY;

-- Create policy to allow service role full access
CREATE POLICY "Service role can manage kv_store" ON public.kv_store
FOR ALL USING (auth.jwt() ->> 'role' = 'service_role');

-- Create update trigger for updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_kv_store_updated_at
    BEFORE UPDATE ON public.kv_store
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();