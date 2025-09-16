#!/usr/bin/env python3
"""Check database structure"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    # List all tables
    cursor.execute("""
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public'
        ORDER BY tablename
    """)

    print("Tables in public schema:")
    for (table,) in cursor.fetchall():
        print(f"  • {table}")

    # Check for profiles table which might have user data
    cursor.execute("""
        SELECT COUNT(*) FROM profiles WHERE role = 'child'
    """)
    child_count = cursor.fetchone()[0]
    print(f"\nChild profiles: {child_count}")

    if child_count > 0:
        cursor.execute("""
            SELECT id, first_name, last_name
            FROM profiles
            WHERE role = 'child'
            LIMIT 5
        """)
        print("\nFirst 5 child profiles:")
        for id, first, last in cursor.fetchall():
            print(f"  {id}: {first} {last}")

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")