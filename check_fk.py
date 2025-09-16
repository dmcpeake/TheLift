#!/usr/bin/env python3
"""Check foreign keys on profiles table"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    # Get foreign key constraints
    cursor.execute("""
        SELECT conname, pg_get_constraintdef(oid)
        FROM pg_constraint
        WHERE conrelid = 'public.profiles'::regclass
        AND contype = 'f'
    """)

    print("Foreign key constraints on profiles table:")
    for name, definition in cursor.fetchall():
        print(f"  {name}: {definition}")

    # Check what org_ids exist in profiles
    print("\nExisting org_ids in profiles:")
    cursor.execute("SELECT DISTINCT org_id FROM profiles WHERE org_id IS NOT NULL")
    for (org_id,) in cursor.fetchall():
        print(f"  {org_id}")

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")