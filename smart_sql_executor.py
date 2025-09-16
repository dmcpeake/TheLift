#!/usr/bin/env python3
"""
Smart SQL Executor - Handles parent-child relationships properly
Groups related statements and executes them together
"""

import psycopg2
import sys
import time
import re
from datetime import datetime

# Database connection
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

class SmartSQLExecutor:
    def __init__(self, db_url):
        self.db_url = db_url
        self.sessions_created = 0
        self.tools_created = 0
        self.errors = []

    def parse_sql_into_sessions(self, filename):
        """Parse SQL file into logical session groups"""
        print(f"📖 Parsing SQL file: {filename}")

        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()

        # Split into individual statements
        statements = []
        current = []

        for line in content.split('\n'):
            if line.strip().startswith('--'):
                continue

            current.append(line)

            if line.strip().endswith(';'):
                stmt = '\n'.join(current).strip()
                if stmt:
                    statements.append(stmt)
                current = []

        # Group statements into sessions
        sessions = []
        current_session = []

        for stmt in statements:
            # Start new session group on checkin_sessions insert
            if 'INSERT INTO public.checkin_sessions' in stmt:
                if current_session:
                    sessions.append(current_session)
                current_session = [stmt]
            else:
                current_session.append(stmt)

        # Add last session
        if current_session:
            sessions.append(current_session)

        return sessions

    def execute_session_group(self, cursor, session_statements):
        """Execute all statements for one session as a group"""
        successful = 0
        failed = 0

        for stmt in session_statements:
            try:
                cursor.execute(stmt)
                successful += 1

                # Track what we're creating
                if 'checkin_sessions' in stmt:
                    self.sessions_created += 1
                elif 'mood_meter_usage' in stmt or 'breathing_tool' in stmt or 'emotion_grid' in stmt or 'wellbeing_wheel' in stmt:
                    self.tools_created += 1

            except psycopg2.Error as e:
                failed += 1
                error_msg = str(e)[:100]
                if error_msg not in [err[0] for err in self.errors]:
                    self.errors.append((error_msg, stmt[:100]))
                return successful, failed  # Stop this session group on error

        return successful, failed

    def execute(self, filename):
        """Execute the SQL file with smart session grouping"""
        # Parse into session groups
        sessions = self.parse_sql_into_sessions(filename)
        print(f"📊 Found {len(sessions)} session groups")

        # Connect to database
        print("\n🔗 Connecting to Supabase...")
        try:
            conn = psycopg2.connect(self.db_url)
            cursor = conn.cursor()
            print("✅ Connected successfully\n")
        except Exception as e:
            print(f"❌ Connection failed: {e}")
            return

        # Process session groups
        total_successful = 0
        total_failed = 0
        successful_sessions = 0

        print("🚀 Executing session groups...")
        print("-" * 40)

        for i, session_statements in enumerate(sessions, 1):
            # Execute session group
            successful, failed = self.execute_session_group(cursor, session_statements)

            if successful > 0 and failed == 0:
                # Commit successful session
                conn.commit()
                successful_sessions += 1
                total_successful += successful
            else:
                # Rollback failed session
                conn.rollback()
                total_failed += failed

            # Progress update every 10 sessions
            if i % 10 == 0:
                progress = (i / len(sessions)) * 100
                print(f"   Progress: {i}/{len(sessions)} sessions ({progress:.1f}%)")
                print(f"   ✅ Sessions: {successful_sessions} | Statements: {total_successful}")
                print(f"   🎯 Created: {self.sessions_created} sessions, {self.tools_created} tool records")

            # Small delay every 50 sessions
            if i % 50 == 0:
                time.sleep(0.5)

        # Final summary
        print("\n" + "=" * 60)
        print("✨ EXECUTION COMPLETE")
        print("=" * 60)
        print(f"📊 Session Groups: {successful_sessions}/{len(sessions)} successful")
        print(f"✅ Statements executed: {total_successful}")
        print(f"❌ Statements failed: {total_failed}")
        print(f"🎯 Created: {self.sessions_created} sessions, {self.tools_created} tool usage records")

        if self.errors:
            print("\n⚠️  Unique errors encountered:")
            for error, stmt in self.errors[:5]:
                print(f"   • {error}")

        # Verify data
        print("\n📊 Verifying data insertion...")
        try:
            cursor.execute("""
                SELECT
                    o.name as org,
                    COUNT(DISTINCT cs.child_id) as children,
                    COUNT(cs.id) as sessions
                FROM checkin_sessions cs
                JOIN organizations o ON cs.org_id = o.id
                WHERE cs.created_at >= CURRENT_TIMESTAMP - INTERVAL '2 hours'
                GROUP BY o.name
                ORDER BY o.name
            """)

            results = cursor.fetchall()
            if results:
                print("   Sessions by organization:")
                for org, children, sessions in results:
                    print(f"      • {org}: {children} children, {sessions} sessions")

            # Check specific children
            cursor.execute("""
                SELECT
                    c.name,
                    COUNT(cs.id) as sessions,
                    COUNT(DISTINCT DATE(cs.started_at)) as days
                FROM children c
                LEFT JOIN checkin_sessions cs ON c.id = cs.child_id
                WHERE cs.created_at >= CURRENT_TIMESTAMP - INTERVAL '2 hours'
                GROUP BY c.name
                ORDER BY sessions DESC
                LIMIT 5
            """)

            results = cursor.fetchall()
            if results:
                print("\n   Top children by sessions:")
                for name, sessions, days in results:
                    print(f"      • {name}: {sessions} sessions across {days} days")

        except Exception as e:
            print(f"   ⚠️  Could not verify: {e}")

        cursor.close()
        conn.close()
        print("\n✅ Database connection closed")

def main():
    """Main function"""
    sql_file = "all_children_complete_journeys_20250916_195522.sql"

    if len(sys.argv) > 1:
        sql_file = sys.argv[1]

    print("🚀 Smart SQL Executor for Supabase")
    print("=" * 60)
    print(f"📁 SQL File: {sql_file}")
    print("=" * 60)

    executor = SmartSQLExecutor(DB_URL)

    try:
        executor.execute(sql_file)
    except FileNotFoundError:
        print(f"❌ File not found: {sql_file}")
    except KeyboardInterrupt:
        print("\n\n⚠️  Execution interrupted")
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    main()