#!/usr/bin/env python3
"""Check constraints on profiles table"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    # Get check constraints
    cursor.execute("""
        SELECT conname, pg_get_constraintdef(oid)
        FROM pg_constraint
        WHERE conrelid = 'public.profiles'::regclass
        AND contype = 'c'
    """)

    print("Check constraints on profiles table:")
    for name, definition in cursor.fetchall():
        print(f"  {name}: {definition}")

    # Also check what values are allowed for role
    print("\nExisting role values:")
    cursor.execute("SELECT DISTINCT role FROM profiles")
    for (role,) in cursor.fetchall():
        print(f"  • {role}")

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")