#!/usr/bin/env python3
"""
Batch SQL Executor for Supabase
Executes large SQL files in manageable batches with progress tracking
"""

import psycopg2
from psycopg2.extras import RealDictCursor
import sys
import time
from datetime import datetime
import re

# Database connection
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

class BatchSQLExecutor:
    def __init__(self, db_url, batch_size=50):
        self.db_url = db_url
        self.batch_size = batch_size
        self.successful = 0
        self.failed = 0
        self.errors = {}

    def parse_sql_file(self, filename):
        """Parse SQL file into individual statements"""
        print(f"📖 Reading SQL file: {filename}")

        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()

        # Split by semicolon but keep the semicolon
        # Remove comments and empty lines
        statements = []
        current_statement = []

        for line in content.split('\n'):
            # Skip comment-only lines
            if line.strip().startswith('--') or not line.strip():
                continue

            current_statement.append(line)

            # Check if this line ends a statement
            if line.rstrip().endswith(';'):
                stmt = '\n'.join(current_statement).strip()
                if stmt and not stmt.startswith('--'):
                    statements.append(stmt)
                current_statement = []

        return statements

    def execute_batch(self, conn, cursor, statements, batch_num):
        """Execute a batch of SQL statements"""
        batch_successful = 0
        batch_failed = 0

        for i, stmt in enumerate(statements, 1):
            try:
                cursor.execute(stmt)
                batch_successful += 1
                self.successful += 1
            except psycopg2.Error as e:
                batch_failed += 1
                self.failed += 1

                # Track error types
                error_msg = str(e)[:100]
                if error_msg not in self.errors:
                    self.errors[error_msg] = 0
                self.errors[error_msg] += 1

                # Rollback this statement only
                conn.rollback()
                continue

        # Commit successful statements
        if batch_successful > 0:
            conn.commit()

        return batch_successful, batch_failed

    def execute_file(self, filename):
        """Execute SQL file in batches"""
        # Parse statements
        statements = self.parse_sql_file(filename)
        total_statements = len(statements)

        if total_statements == 0:
            print("❌ No valid SQL statements found")
            return

        print(f"📊 Found {total_statements} SQL statements")
        print(f"🎯 Executing in batches of {self.batch_size}")
        print("=" * 60)

        # Connect to database
        try:
            print("🔗 Connecting to Supabase...")
            conn = psycopg2.connect(self.db_url)
            cursor = conn.cursor()
            print("✅ Connected successfully")
            print("=" * 60)
        except Exception as e:
            print(f"❌ Connection failed: {e}")
            return

        # Process in batches
        start_time = time.time()
        total_batches = (total_statements + self.batch_size - 1) // self.batch_size

        for batch_num in range(total_batches):
            batch_start = batch_num * self.batch_size
            batch_end = min(batch_start + self.batch_size, total_statements)
            batch_statements = statements[batch_start:batch_end]

            print(f"\n📦 Batch {batch_num + 1}/{total_batches}")
            print(f"   Statements: {batch_start + 1} to {batch_end}")

            batch_successful, batch_failed = self.execute_batch(
                conn, cursor, batch_statements, batch_num + 1
            )

            # Progress bar
            progress = (batch_end / total_statements) * 100
            bar_length = 40
            filled = int(bar_length * batch_end // total_statements)
            bar = '█' * filled + '░' * (bar_length - filled)

            print(f"   Progress: [{bar}] {progress:.1f}%")
            print(f"   ✅ Success: {batch_successful} | ❌ Failed: {batch_failed}")

            # Show running totals
            print(f"   Total so far - Success: {self.successful} | Failed: {self.failed}")

            # Small delay to avoid overwhelming the database
            if batch_num < total_batches - 1:
                time.sleep(0.1)

        # Final summary
        elapsed_time = time.time() - start_time
        print("\n" + "=" * 60)
        print("✨ EXECUTION COMPLETE")
        print("=" * 60)
        print(f"⏱️  Time elapsed: {elapsed_time:.2f} seconds")
        print(f"✅ Successful: {self.successful} statements")
        print(f"❌ Failed: {self.failed} statements")
        print(f"📊 Success rate: {(self.successful / total_statements * 100):.1f}%")

        if self.errors:
            print("\n🔍 Error Summary (top 5):")
            sorted_errors = sorted(self.errors.items(), key=lambda x: x[1], reverse=True)
            for error_msg, count in sorted_errors[:5]:
                print(f"   • {count}x: {error_msg}")

        # Verify data insertion
        print("\n📊 Verifying data insertion...")
        try:
            cursor.execute("""
                SELECT
                    o.name as organization,
                    COUNT(DISTINCT c.id) as children,
                    COUNT(cs.id) as total_sessions,
                    MIN(cs.started_at::date) as first_session,
                    MAX(cs.started_at::date) as last_session
                FROM checkin_sessions cs
                JOIN children c ON cs.child_id = c.id
                JOIN organizations o ON cs.org_id = o.id
                WHERE cs.created_at >= CURRENT_TIMESTAMP - INTERVAL '1 hour'
                GROUP BY o.name
                ORDER BY o.name
            """)

            results = cursor.fetchall()
            if results:
                print("\n📈 Sessions added by organization:")
                for row in results:
                    print(f"   • {row[0]}: {row[1]} children, {row[2]} sessions")
                    print(f"     Date range: {row[3]} to {row[4]}")
            else:
                print("   ⚠️  No recent sessions found (may need to check the query)")

            # Check total children with sessions
            cursor.execute("""
                SELECT COUNT(DISTINCT child_id) as total_children,
                       COUNT(*) as total_sessions
                FROM checkin_sessions
                WHERE created_at >= CURRENT_TIMESTAMP - INTERVAL '1 hour'
            """)

            total_children, total_sessions = cursor.fetchone()
            if total_sessions > 0:
                print(f"\n🎯 Total: {total_children} children, {total_sessions} sessions added")

        except Exception as e:
            print(f"   ⚠️  Could not verify: {e}")

        # Close connection
        cursor.close()
        conn.close()
        print("\n✅ Database connection closed")

def main():
    """Main function"""
    # Check for command line argument
    if len(sys.argv) > 1:
        sql_file = sys.argv[1]
    else:
        # Default to the all children file
        sql_file = "all_children_complete_journeys_20250916_195522.sql"

    print("🚀 Batch SQL Executor for Supabase")
    print("=" * 60)
    print(f"📁 SQL File: {sql_file}")
    print(f"🔢 Batch Size: 50 statements")
    print("=" * 60)

    # Create executor and run
    executor = BatchSQLExecutor(DB_URL, batch_size=50)

    try:
        executor.execute_file(sql_file)
    except FileNotFoundError:
        print(f"❌ File not found: {sql_file}")
        print("💡 Usage: python3 batch_sql_executor.py [sql_file]")
        sys.exit(1)
    except KeyboardInterrupt:
        print("\n\n⚠️  Execution interrupted by user")
        print(f"📊 Partial results: {executor.successful} successful, {executor.failed} failed")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()