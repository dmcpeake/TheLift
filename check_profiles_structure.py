#!/usr/bin/env python3
"""Check the structure of the profiles table"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    # Get column names and types for profiles table
    cursor.execute("""
        SELECT column_name, data_type, is_nullable, column_default
        FROM information_schema.columns
        WHERE table_schema = 'public' AND table_name = 'profiles'
        ORDER BY ordinal_position
    """)

    print("Profiles table structure:")
    print("-" * 60)
    for col_name, data_type, nullable, default in cursor.fetchall():
        nullable_str = "NULL" if nullable == "YES" else "NOT NULL"
        default_str = f" DEFAULT {default}" if default else ""
        print(f"  {col_name}: {data_type} {nullable_str}{default_str}")

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")