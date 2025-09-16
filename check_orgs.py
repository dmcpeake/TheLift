#!/usr/bin/env python3
"""Check organizations in the database"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    # Check organisations table (note the British spelling)
    cursor.execute("""
        SELECT id, name, type
        FROM organisations
        ORDER BY name
    """)

    print("Organizations in database:")
    print("-" * 60)
    for org_id, name, org_type in cursor.fetchall():
        print(f"{org_id}: {name} ({org_type})")

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")