#!/usr/bin/env python3
"""Check which children exist in the database"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    # Check if children table exists and has data
    cursor.execute("""
        SELECT COUNT(*) FROM children
    """)
    count = cursor.fetchone()[0]
    print(f"Total children in database: {count}")

    if count > 0:
        cursor.execute("""
            SELECT id, name FROM children ORDER BY name LIMIT 10
        """)
        print("\nFirst 10 children:")
        for child_id, name in cursor.fetchall():
            print(f"  {child_id}: {name}")

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")