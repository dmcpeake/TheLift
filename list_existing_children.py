#!/usr/bin/env python3
"""List existing child profiles"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    cursor.execute("""
        SELECT p.id, p.name, o.name as org_name,
               COUNT(cs.id) as existing_sessions
        FROM profiles p
        LEFT JOIN organisations o ON p.org_id = o.id
        LEFT JOIN checkin_sessions cs ON p.id = cs.child_id
        WHERE p.role = 'Child'
        GROUP BY p.id, p.name, o.name
        ORDER BY o.name, p.name
    """)

    print("Existing Child Profiles:")
    print("=" * 80)

    for child_id, name, org, sessions in cursor.fetchall():
        print(f"ID: {child_id}")
        print(f"   Name: {name}")
        print(f"   Organization: {org}")
        print(f"   Existing Sessions: {sessions}")
        print("-" * 40)

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")