#!/usr/bin/env python3
"""
Upsert Child Profiles - Insert or update child profiles
Handles existing profiles gracefully
"""

import psycopg2
from datetime import datetime, date
import sys

# Database connection
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

# All 30 children with their details (same as before)
CHILDREN = [
    # Hospital Children (org_id: 7eab219a-7c83-406c-a6b2-75ed44de715b)
    {"id": "ce864083-bdf5-4ead-b56a-3c36208d3b69", "first_name": "Emma", "last_name": "Thompson", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Asthma management"},
    {"id": "aaaabbbb-cccc-dddd-eeee-111111111111", "first_name": "Aisha", "last_name": "Patel", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Type 1 diabetes"},
    {"id": "aaaabbbb-cccc-dddd-eeee-111111111112", "first_name": "Kai", "last_name": "Chen", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Post-surgery recovery"},
    {"id": "aaaabbbb-cccc-dddd-eeee-111111111113", "first_name": "Mia", "last_name": "Rodriguez", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Chronic kidney disease"},
    {"id": "aaaabbbb-cccc-dddd-eeee-111111111114", "first_name": "Ethan", "last_name": "Williams", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Leukemia treatment"},
    {"id": "aaaabbbb-cccc-dddd-eeee-111111111115", "first_name": "Zara", "last_name": "Ahmed", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Accident trauma recovery"},
    {"id": "aaaabbbb-cccc-dddd-eeee-111111111116", "first_name": "Lucas", "last_name": "Brown", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Depression and anxiety"},
    {"id": "aaaabbbb-cccc-dddd-eeee-111111111117", "first_name": "Amara", "last_name": "Johnson", "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "condition": "Heart condition"},

    # School Children (org_id: 5f910546-8bdc-44ca-b776-fdd5eb5cccd9)
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222221", "first_name": "Oliver", "last_name": "Davies", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "Dyslexia support"},
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222222", "first_name": "Jayden", "last_name": "Smith", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "ADHD traits"},
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222223", "first_name": "Sophia", "last_name": "Wilson", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "High achiever anxiety"},
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222224", "first_name": "Tyler", "last_name": "Anderson", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "Social anxiety"},
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222225", "first_name": "Ava", "last_name": "Taylor", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "Family separation stress"},
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222226", "first_name": "Noah", "last_name": "Martin", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "Summer-born confidence"},
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222227", "first_name": "Isla", "last_name": "Roberts", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "Transition anxiety"},
    {"id": "aaaabbbb-cccc-dddd-eeee-222222222228", "first_name": "Ravi", "last_name": "Singh", "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "condition": "Bilingual confidence"},

    # Clinic Children (org_id: 0e233a3b-e007-4eae-a9a5-4586c59b2faf)
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333331", "first_name": "Sebastian", "last_name": "Clark", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Autism - social skills"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333332", "first_name": "Lily", "last_name": "Evans", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Autism - sensory"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333333", "first_name": "Charlie", "last_name": "White", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Selective mutism"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333334", "first_name": "Maya", "last_name": "Green", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Anxiety and perfectionism"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333335", "first_name": "Oscar", "last_name": "Harris", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Dyspraxia"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333336", "first_name": "Ruby", "last_name": "Lewis", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "High sensitivity"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333337", "first_name": "Finn", "last_name": "Walker", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Developmental delays"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333338", "first_name": "Zoe", "last_name": "Hall", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Gifted - social challenges"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333339", "first_name": "Ben", "last_name": "Young", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Chronic pain management"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333340", "first_name": "Chloe", "last_name": "King", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Eating disorder recovery"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333341", "first_name": "Dex", "last_name": "Wright", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Selective mutism - school"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333342", "first_name": "Evie", "last_name": "Scott", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Friendship difficulties"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333343", "first_name": "Felix", "last_name": "Baker", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "Speech delay"},
    {"id": "aaaabbbb-cccc-dddd-eeee-333333333344", "first_name": "Grace", "last_name": "Turner", "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "condition": "OCD tendencies"}
]

def upsert_child_profiles():
    """Upsert all child profiles in the database"""
    print("🚀 Upserting Child Profiles")
    print("=" * 60)

    try:
        # Connect to database
        print("🔗 Connecting to Supabase...")
        conn = psycopg2.connect(DB_URL)
        cursor = conn.cursor()
        print("✅ Connected successfully\n")

        # Check existing profiles
        cursor.execute("SELECT id, name FROM profiles WHERE role = 'Child'")
        existing_profiles = {row[0]: row[1] for row in cursor.fetchall()}
        print(f"📊 Found {len(existing_profiles)} existing child profiles\n")

        # Process each child
        inserted = 0
        updated = 0
        failed = 0

        for child in CHILDREN:
            child_name = f"{child['first_name']} {child['last_name']}"
            child_email = f"{child['first_name'].lower()}.{child['last_name'].lower()}@example.com"

            try:
                if child['id'] in existing_profiles:
                    # Update existing profile
                    cursor.execute("""
                        UPDATE profiles
                        SET name = %s,
                            email = %s,
                            org_id = %s,
                            updated_at = %s
                        WHERE id = %s
                    """, (
                        child_name,
                        child_email,
                        child['org_id'],
                        datetime.now(),
                        child['id']
                    ))
                    updated += 1
                    print(f"📝 Updated: {child_name}")
                else:
                    # Insert new profile
                    cursor.execute("""
                        INSERT INTO profiles (
                            id, name, email, role, org_id,
                            avatar_url, created_at, updated_at
                        ) VALUES (
                            %s, %s, %s, %s, %s, %s, %s, %s
                        )
                    """, (
                        child['id'],
                        child_name,
                        child_email,
                        'Child',
                        child['org_id'],
                        f"/avatars/{child['first_name'].lower()}.svg",
                        datetime.now(),
                        datetime.now()
                    ))
                    inserted += 1
                    print(f"✅ Created: {child_name}")

            except psycopg2.Error as e:
                failed += 1
                print(f"❌ Failed: {child_name} - {str(e)[:50]}")
                conn.rollback()
                continue

        # Commit all changes
        conn.commit()

        # Summary
        print("\n" + "=" * 60)
        print("✨ PROFILE UPSERT COMPLETE")
        print("=" * 60)
        print(f"✅ Inserted: {inserted} new profiles")
        print(f"📝 Updated: {updated} existing profiles")
        print(f"❌ Failed: {failed} profiles")

        # Verify final count
        cursor.execute("SELECT COUNT(*) FROM profiles WHERE role = 'Child'")
        total = cursor.fetchone()[0]
        print(f"📊 Total child profiles: {total}")

        cursor.close()
        conn.close()
        print("\n✅ Database connection closed")

    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    upsert_child_profiles()