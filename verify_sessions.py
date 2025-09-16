#!/usr/bin/env python3
"""Verify session data insertion"""

import psycopg2

DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

try:
    conn = psycopg2.connect(DB_URL)
    cursor = conn.cursor()

    print("📊 Session Data Summary")
    print("=" * 60)

    # Total sessions
    cursor.execute("SELECT COUNT(*) FROM checkin_sessions")
    total = cursor.fetchone()[0]
    print(f"Total sessions in database: {total}")

    # Sessions by organization
    print("\n📈 Sessions by Organization:")
    cursor.execute("""
        SELECT o.name, COUNT(cs.id) as sessions
        FROM checkin_sessions cs
        JOIN organisations o ON cs.org_id = o.id
        GROUP BY o.name
        ORDER BY o.name
    """)
    for org, count in cursor.fetchall():
        print(f"  • {org}: {count} sessions")

    # Sessions per child
    print("\n👥 Sessions per Child:")
    cursor.execute("""
        SELECT p.name, COUNT(cs.id) as sessions
        FROM profiles p
        LEFT JOIN checkin_sessions cs ON p.id = cs.child_id
        WHERE p.role = 'Child'
        GROUP BY p.name
        ORDER BY sessions DESC
    """)

    for name, count in cursor.fetchall():
        print(f"  • {name}: {count} sessions")

    # Date range
    cursor.execute("""
        SELECT MIN(started_at)::date, MAX(started_at)::date
        FROM checkin_sessions
    """)
    min_date, max_date = cursor.fetchone()
    print(f"\n📅 Date Range: {min_date} to {max_date}")

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")