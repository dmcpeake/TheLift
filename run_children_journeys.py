#!/usr/bin/env python3
"""
Run Children Journeys - Execute SQL for each child separately
This ensures proper session ID references
"""

import psycopg2
import sys
import time
from datetime import datetime

# Database connection
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

def parse_sql_by_child(filename):
    """Parse SQL file and group statements by child"""
    print(f"📖 Parsing SQL file: {filename}")

    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    children_sql = {}
    current_child = None
    current_statements = []

    for line in lines:
        # Check for child session marker
        if "Session 1:" in line and "--" in line:
            # Save previous child's statements
            if current_child and current_statements:
                children_sql[current_child] = current_statements
                current_statements = []

            # Extract child name
            parts = line.split()
            for i, part in enumerate(parts):
                if part == "Session":
                    current_child = parts[i-1].replace("'s", "")
                    break

        # Add non-empty, non-comment lines to current child's statements
        if current_child and line.strip() and not line.strip().startswith('--'):
            current_statements.append(line)

    # Save last child
    if current_child and current_statements:
        children_sql[current_child] = current_statements

    return children_sql

def execute_child_journey(conn, cursor, child_name, sql_lines):
    """Execute all SQL for one child's journey"""
    # Join lines and split by semicolon
    sql_text = ''.join(sql_lines)
    statements = [s.strip() for s in sql_text.split(';') if s.strip()]

    successful = 0
    failed = 0

    for stmt in statements:
        try:
            cursor.execute(stmt + ';')
            successful += 1
        except psycopg2.Error as e:
            failed += 1
            conn.rollback()
            if failed <= 3:  # Show first few errors
                print(f"      ⚠️  Error: {str(e)[:80]}")
            continue

    # Commit after each child
    if successful > 0:
        conn.commit()

    return successful, failed

def main():
    """Main function"""
    sql_file = "all_children_complete_journeys_20250916_195522.sql"

    print("🚀 Children Journey Executor")
    print("=" * 60)

    try:
        # Parse SQL by child
        children_sql = parse_sql_by_child(sql_file)
        print(f"📊 Found journeys for {len(children_sql)} children")

        # Connect to database
        print("\n🔗 Connecting to Supabase...")
        conn = psycopg2.connect(DB_URL)
        cursor = conn.cursor()
        print("✅ Connected successfully\n")

        # Process each child
        total_successful = 0
        total_failed = 0

        for i, (child_name, sql_lines) in enumerate(children_sql.items(), 1):
            print(f"👤 [{i}/{len(children_sql)}] Processing {child_name}...")

            successful, failed = execute_child_journey(conn, cursor, child_name, sql_lines)
            total_successful += successful
            total_failed += failed

            if successful > 0:
                print(f"   ✅ Success: {successful} statements")
            if failed > 0:
                print(f"   ❌ Failed: {failed} statements")

            # Small delay between children
            time.sleep(0.5)

        # Final summary
        print("\n" + "=" * 60)
        print("✨ EXECUTION COMPLETE")
        print("=" * 60)
        print(f"✅ Total Successful: {total_successful} statements")
        print(f"❌ Total Failed: {total_failed} statements")

        # Verify data
        print("\n📊 Verifying data insertion...")
        cursor.execute("""
            SELECT
                c.name,
                COUNT(cs.id) as sessions
            FROM children c
            LEFT JOIN checkin_sessions cs ON c.id = cs.child_id
            WHERE cs.created_at >= CURRENT_TIMESTAMP - INTERVAL '1 hour'
            GROUP BY c.name
            ORDER BY sessions DESC
            LIMIT 10
        """)

        results = cursor.fetchall()
        if results:
            print("   Top children by sessions:")
            for name, count in results:
                print(f"      • {name}: {count} sessions")

        cursor.close()
        conn.close()
        print("\n✅ Database connection closed")

    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()