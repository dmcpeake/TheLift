-- Add child authentication fields
ALTER TABLE public.children 
ADD COLUMN username text UNIQUE,
ADD COLUMN pin text,
ADD COLUMN age integer,
ADD COLUMN active boolean DEFAULT true;

-- Create index on username for fast lookups
CREATE INDEX idx_children_username ON public.children(username) WHERE username IS NOT NULL;

-- Create index on active status
CREATE INDEX idx_children_active ON public.children(active) WHERE active = true;