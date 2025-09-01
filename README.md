# The Lift - Wellbeing Platform for Children

A comprehensive wellbeing platform designed for children aged 5-11, with role-based access for practitioners, group contacts, children, and admin staff.

## Quick Start

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   ```
   Update `.env` with your Supabase credentials:
   - `REACT_APP_SUPABASE_URL`: Your Supabase project URL
   - `REACT_APP_SUPABASE_ANON_KEY`: Your Supabase anonymous key
   - `REACT_APP_SUPABASE_PROJECT_ID`: Your Supabase project ID

3. **Deploy Supabase Functions**
   ```bash
   # Install Supabase CLI if you haven't already
   npm install -g @supabase/cli
   
   # Deploy the server function
   supabase functions deploy server
   ```

4. **Start the development server**
   ```bash
   npm run dev
   ```

## User Roles & Access

### Admin (Account Role)
- **Login**: `/admin/login`
- **Access**: Full platform oversight and client management
- **Test Account**: admin@example.com

### Practitioner/Group Manager
- **Login**: `/login` (Adult tab)
- **Access**: Child management and wellbeing data
- **Test Account**: practitioner@example.com

### Children
- **Login**: `/login` (Child tab)
- **Access**: Wellbeing activities and personal dashboard
- **Test Accounts**: 
  - Username: `alice123`, PIN: `1234`
  - Username: `bobby456`, PIN: `5678`

## Key Features

- **Dual Authentication System**: Standard Supabase auth for adults, custom username/PIN for children
- **Role-based Routing**: Automatic redirection based on user role
- **Wireframe Design**: Grayscale colour scheme throughout
- **Child Safety**: Age-appropriate interfaces with simplified interactions
- **Wellbeing Tracking**: Interactive activities and progress monitoring

## Architecture

- **Frontend**: React + TypeScript + Tailwind CSS v4
- **Backend**: Supabase Edge Functions with Hono web framework
- **Authentication**: Supabase Auth + Custom child authentication
- **UI Components**: shadcn/ui with custom wireframe styling
- **Routing**: React Router v6 with role-based protection

## Development Guidelines

- Use UK English spelling throughout (organisation, colour, etc.)
- Maintain 14px base font size with consistent typography
- Follow wireframe aesthetic - no colours except grays and error states
- Implement minimal features initially
- Keep child interfaces simple and friendly

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint
- `npm run typecheck` - Run TypeScript checks

## File Structure

```
/components
  /admin          # Admin-specific components
  /auth           # Authentication pages
  /child          # Child-friendly interfaces  
  /practitioner   # Practitioner dashboards
  /ui             # shadcn/ui base components
/routes           # React Router configuration
/utils            # Authentication helpers
/supabase         # Edge Functions
  /functions
    /server       # Hono web server
/styles           # Global CSS with wireframe overrides
```

## Deployment

The application is designed to deploy to Vercel with Supabase backend:

1. **Vercel Setup**
   - Connect your GitHub repository
   - Add environment variables in Vercel dashboard
   - Deploy automatically on push

2. **Supabase Setup**
   - Create new Supabase project
   - Deploy Edge Functions: `supabase functions deploy server`
   - Configure authentication providers if needed

## Support

For development questions, refer to:
- `architecture.md` - Detailed technical architecture
- `Guidelines.md` - Complete wireframe design guidelines
- Component files for implementation examples