#!/usr/bin/env python3
"""
Run SQL file directly in Supabase database
"""

import psycopg2
from psycopg2 import sql
import sys
from datetime import datetime

# Database connection parameters
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"
SQL_FILE = "all_children_complete_journeys_20250916_193517.sql"

def run_sql_file():
    """Execute SQL file in Supabase database"""

    try:
        # Connect to database
        print(f"🔗 Connecting to Supabase database...")
        conn = psycopg2.connect(DB_URL)
        conn.autocommit = True  # Auto-commit each statement
        cursor = conn.cursor()

        # Read SQL file
        print(f"📖 Reading SQL file: {SQL_FILE}")
        with open(SQL_FILE, 'r') as file:
            sql_content = file.read()

        # Split by INSERT statements to track progress
        statements = [s.strip() for s in sql_content.split(';') if s.strip()]
        total_statements = len(statements)

        print(f"📊 Found {total_statements} SQL statements to execute")
        print("🚀 Starting execution...")

        # Execute statements with progress tracking
        successful = 0
        failed = 0

        for i, statement in enumerate(statements, 1):
            if statement:
                try:
                    cursor.execute(statement + ';')
                    successful += 1

                    # Show progress every 100 statements
                    if i % 100 == 0:
                        print(f"   ✅ Progress: {i}/{total_statements} statements executed")

                except psycopg2.Error as e:
                    failed += 1
                    print(f"   ⚠️  Error at statement {i}: {str(e)[:100]}")
                    # Continue with next statement
                    continue

        # Final summary
        print(f"\n✨ Execution complete!")
        print(f"   ✅ Successful: {successful} statements")
        print(f"   ❌ Failed: {failed} statements")

        # Verify data
        print("\n📊 Verifying data insertion...")
        cursor.execute("""
            SELECT child_id, COUNT(*) as session_count
            FROM checkin_sessions
            WHERE created_at >= CURRENT_DATE
            GROUP BY child_id
            ORDER BY session_count DESC
            LIMIT 10
        """)

        results = cursor.fetchall()
        if results:
            print("   Top children by session count:")
            for child_id, count in results:
                print(f"      • Child {child_id[:8]}...: {count} sessions")

        # Close connection
        cursor.close()
        conn.close()
        print("\n✅ Database connection closed successfully!")

    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    run_sql_file()