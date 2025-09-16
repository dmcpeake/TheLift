#!/usr/bin/env python3
"""
Fix UUID format in SQL file and run it in Supabase
"""

import re
import psycopg2
from uuid import uuid4
import sys

# Database connection parameters
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"
SQL_FILE = "all_children_complete_journeys_20250916_193517.sql"
FIXED_SQL_FILE = "all_children_journeys_fixed.sql"

def fix_uuids_in_sql():
    """Replace invalid UUIDs with valid ones"""
    print(f"🔧 Fixing UUIDs in SQL file...")

    with open(SQL_FILE, 'r') as f:
        content = f.read()

    # Pattern to match the invalid UUIDs like '12345678-1234-5678-abcd-emma0001'
    pattern = r"'12345678-1234-5678-abcd-\w+'"

    # Track replacements for consistency
    uuid_map = {}

    def replace_uuid(match):
        invalid_uuid = match.group(0)
        if invalid_uuid not in uuid_map:
            # Generate new valid UUID
            uuid_map[invalid_uuid] = f"'{str(uuid4())}'"
        return uuid_map[invalid_uuid]

    # Replace all invalid UUIDs
    fixed_content = re.sub(pattern, replace_uuid, content)

    # Save fixed SQL
    with open(FIXED_SQL_FILE, 'w') as f:
        f.write(fixed_content)

    print(f"✅ Fixed {len(uuid_map)} invalid UUIDs")
    print(f"📝 Saved to: {FIXED_SQL_FILE}")
    return FIXED_SQL_FILE

def run_fixed_sql(filename):
    """Execute the fixed SQL file"""
    try:
        print(f"\n🔗 Connecting to Supabase...")
        conn = psycopg2.connect(DB_URL)
        cursor = conn.cursor()

        # Read fixed SQL
        with open(filename, 'r') as f:
            sql_content = f.read()

        # Split into individual statements
        statements = [s.strip() for s in sql_content.split(';') if s.strip()]
        total = len(statements)

        print(f"📊 Executing {total} SQL statements...")
        print("🚀 This may take a few minutes...")

        successful = 0
        failed = 0
        errors = []

        for i, stmt in enumerate(statements, 1):
            try:
                cursor.execute(stmt + ';')
                conn.commit()
                successful += 1

                if i % 200 == 0:
                    print(f"   ✅ Progress: {i}/{total} ({successful} successful)")

            except psycopg2.Error as e:
                failed += 1
                conn.rollback()
                error_msg = str(e)[:100]
                if error_msg not in errors:
                    errors.append(error_msg)
                    if len(errors) <= 5:  # Show first 5 unique errors
                        print(f"   ⚠️  Error type: {error_msg}")

        print(f"\n✨ Execution complete!")
        print(f"   ✅ Successful: {successful} statements")
        print(f"   ❌ Failed: {failed} statements")

        # Verify insertion
        print("\n📊 Verifying data...")
        cursor.execute("""
            SELECT
                c.name as child_name,
                COUNT(DISTINCT cs.id) as sessions
            FROM children c
            LEFT JOIN checkin_sessions cs ON c.id = cs.child_id
            WHERE cs.created_at >= CURRENT_DATE - INTERVAL '1 day'
            GROUP BY c.id, c.name
            ORDER BY sessions DESC
            LIMIT 10
        """)

        results = cursor.fetchall()
        if results:
            print("   Top children by sessions added:")
            for name, count in results:
                print(f"      • {name}: {count} sessions")
        else:
            print("   No sessions found from today's insertion")

        cursor.close()
        conn.close()
        print("\n✅ Complete!")

    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # Fix UUIDs first
    fixed_file = fix_uuids_in_sql()

    # Run the fixed SQL
    run_fixed_sql(fixed_file)