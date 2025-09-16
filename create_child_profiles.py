#!/usr/bin/env python3
"""
Create Child Profiles in Database
Creates all 30 children with their specific IDs that the session data expects
"""

import psycopg2
from datetime import datetime, date
import sys

# Database connection
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

# All 30 children with their details
CHILDREN = [
    # Hospital Children (org_id: 7eab219a-7c83-406c-a6b2-75ed44de715b)
    {
        "id": "ce864083-bdf5-4ead-b56a-3c36208d3b69",
        "first_name": "Emma",
        "last_name": "Thompson",
        "date_of_birth": date(2018, 3, 15),  # Age 7
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Asthma management",
        "avatar_url": "/avatars/girl-1.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-111111111111",
        "first_name": "Aisha",
        "last_name": "Patel",
        "date_of_birth": date(2017, 5, 22),  # Age 8
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Type 1 diabetes",
        "avatar_url": "/avatars/girl-2.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-111111111112",
        "first_name": "Kai",
        "last_name": "Chen",
        "date_of_birth": date(2018, 7, 8),  # Age 7
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Post-surgery recovery",
        "avatar_url": "/avatars/boy-1.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-111111111113",
        "first_name": "Mia",
        "last_name": "Rodriguez",
        "date_of_birth": date(2016, 2, 10),  # Age 9
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Chronic kidney disease",
        "avatar_url": "/avatars/girl-3.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-111111111114",
        "first_name": "Ethan",
        "last_name": "Williams",
        "date_of_birth": date(2015, 9, 3),  # Age 10
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Leukemia treatment",
        "avatar_url": "/avatars/boy-2.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-111111111115",
        "first_name": "Zara",
        "last_name": "Ahmed",
        "date_of_birth": date(2019, 4, 28),  # Age 6
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Accident trauma recovery",
        "avatar_url": "/avatars/girl-4.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-111111111116",
        "first_name": "Lucas",
        "last_name": "Brown",
        "date_of_birth": date(2014, 11, 17),  # Age 11
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Depression and anxiety",
        "avatar_url": "/avatars/boy-3.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-111111111117",
        "first_name": "Amara",
        "last_name": "Johnson",
        "date_of_birth": date(2017, 1, 5),  # Age 8
        "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b",
        "condition": "Heart condition",
        "avatar_url": "/avatars/girl-5.svg"
    },

    # School Children (org_id: 5f910546-8bdc-44ca-b776-fdd5eb5cccd9)
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222221",
        "first_name": "Oliver",
        "last_name": "Davies",
        "date_of_birth": date(2017, 6, 12),  # Age 8
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "Dyslexia support",
        "avatar_url": "/avatars/boy-4.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222222",
        "first_name": "Jayden",
        "last_name": "Smith",
        "date_of_birth": date(2018, 8, 19),  # Age 7
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "ADHD traits",
        "avatar_url": "/avatars/boy-5.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222223",
        "first_name": "Sophia",
        "last_name": "Wilson",
        "date_of_birth": date(2016, 10, 30),  # Age 9
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "High achiever anxiety",
        "avatar_url": "/avatars/girl-6.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222224",
        "first_name": "Tyler",
        "last_name": "Anderson",
        "date_of_birth": date(2015, 12, 7),  # Age 10
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "Social anxiety",
        "avatar_url": "/avatars/boy-6.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222225",
        "first_name": "Ava",
        "last_name": "Taylor",
        "date_of_birth": date(2017, 3, 25),  # Age 8
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "Family separation stress",
        "avatar_url": "/avatars/girl-7.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222226",
        "first_name": "Noah",
        "last_name": "Martin",
        "date_of_birth": date(2019, 7, 14),  # Age 6
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "Summer-born confidence",
        "avatar_url": "/avatars/boy-7.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222227",
        "first_name": "Isla",
        "last_name": "Roberts",
        "date_of_birth": date(2014, 5, 9),  # Age 11
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "Transition anxiety",
        "avatar_url": "/avatars/girl-8.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-222222222228",
        "first_name": "Ravi",
        "last_name": "Singh",
        "date_of_birth": date(2016, 9, 21),  # Age 9
        "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9",
        "condition": "Bilingual confidence",
        "avatar_url": "/avatars/boy-8.svg"
    },

    # Clinic Children (org_id: 0e233a3b-e007-4eae-a9a5-4586c59b2faf)
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333331",
        "first_name": "Sebastian",
        "last_name": "Clark",
        "date_of_birth": date(2016, 4, 16),  # Age 9
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Autism - social skills",
        "avatar_url": "/avatars/boy-9.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333332",
        "first_name": "Lily",
        "last_name": "Evans",
        "date_of_birth": date(2017, 11, 2),  # Age 8
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Autism - sensory",
        "avatar_url": "/avatars/girl-9.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333333",
        "first_name": "Charlie",
        "last_name": "White",
        "date_of_birth": date(2015, 6, 28),  # Age 10
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Selective mutism",
        "avatar_url": "/avatars/boy-10.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333334",
        "first_name": "Maya",
        "last_name": "Green",
        "date_of_birth": date(2018, 1, 18),  # Age 7
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Anxiety and perfectionism",
        "avatar_url": "/avatars/girl-10.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333335",
        "first_name": "Oscar",
        "last_name": "Harris",
        "date_of_birth": date(2016, 8, 4),  # Age 9
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Dyspraxia",
        "avatar_url": "/avatars/boy-11.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333336",
        "first_name": "Ruby",
        "last_name": "Lewis",
        "date_of_birth": date(2017, 10, 11),  # Age 8
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "High sensitivity",
        "avatar_url": "/avatars/girl-11.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333337",
        "first_name": "Finn",
        "last_name": "Walker",
        "date_of_birth": date(2018, 12, 20),  # Age 7
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Developmental delays",
        "avatar_url": "/avatars/boy-12.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333338",
        "first_name": "Zoe",
        "last_name": "Hall",
        "date_of_birth": date(2015, 2, 6),  # Age 10
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Gifted - social challenges",
        "avatar_url": "/avatars/girl-12.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333339",
        "first_name": "Ben",
        "last_name": "Young",
        "date_of_birth": date(2016, 5, 13),  # Age 9
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Chronic pain management",
        "avatar_url": "/avatars/boy-13.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333340",
        "first_name": "Chloe",
        "last_name": "King",
        "date_of_birth": date(2014, 7, 29),  # Age 11
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Eating disorder recovery",
        "avatar_url": "/avatars/girl-13.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333341",
        "first_name": "Dex",
        "last_name": "Wright",
        "date_of_birth": date(2017, 9, 8),  # Age 8
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Selective mutism - school",
        "avatar_url": "/avatars/boy-14.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333342",
        "first_name": "Evie",
        "last_name": "Scott",
        "date_of_birth": date(2016, 11, 24),  # Age 9
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Friendship difficulties",
        "avatar_url": "/avatars/girl-14.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333343",
        "first_name": "Felix",
        "last_name": "Baker",
        "date_of_birth": date(2018, 3, 31),  # Age 7
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "Speech delay",
        "avatar_url": "/avatars/boy-15.svg"
    },
    {
        "id": "aaaabbbb-cccc-dddd-eeee-333333333344",
        "first_name": "Grace",
        "last_name": "Turner",
        "date_of_birth": date(2015, 8, 15),  # Age 10
        "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf",
        "condition": "OCD tendencies",
        "avatar_url": "/avatars/girl-15.svg"
    }
]

def create_child_profiles():
    """Create all child profiles in the database"""
    print("🚀 Creating Child Profiles")
    print("=" * 60)

    try:
        # Connect to database
        print("🔗 Connecting to Supabase...")
        conn = psycopg2.connect(DB_URL)
        cursor = conn.cursor()
        print("✅ Connected successfully\n")

        # Check if profiles already exist
        cursor.execute("SELECT COUNT(*) FROM profiles WHERE role = 'Child'")
        existing_count = cursor.fetchone()[0]

        if existing_count > 0:
            print(f"⚠️  Found {existing_count} existing child profiles")
            print("   Deleting existing profiles...")
            cursor.execute("DELETE FROM profiles WHERE role = 'Child'")
            conn.commit()
            print(f"   ✅ Deleted {cursor.rowcount} existing child profiles\n")

        # Insert each child
        successful = 0
        failed = 0

        for child in CHILDREN:
            try:
                cursor.execute("""
                    INSERT INTO profiles (
                        id,
                        name,
                        email,
                        role,
                        org_id,
                        avatar_url,
                        created_at,
                        updated_at
                    ) VALUES (
                        %s, %s, %s, %s, %s, %s, %s, %s
                    )
                """, (
                    child['id'],
                    f"{child['first_name']} {child['last_name']}",
                    f"{child['first_name'].lower()}.{child['last_name'].lower()}@example.com",
                    'Child',
                    child['org_id'],
                    child['avatar_url'],
                    datetime.now(),
                    datetime.now()
                ))

                successful += 1
                print(f"✅ Created: {child['first_name']} {child['last_name']} ({child['condition']})")

            except psycopg2.Error as e:
                failed += 1
                print(f"❌ Failed: {child['first_name']} {child['last_name']} - {str(e)[:50]}")
                conn.rollback()
                continue

        # Commit all successful inserts
        if successful > 0:
            conn.commit()

        # Summary
        print("\n" + "=" * 60)
        print("✨ PROFILE CREATION COMPLETE")
        print("=" * 60)
        print(f"✅ Created: {successful} child profiles")
        print(f"❌ Failed: {failed} profiles")

        # Verify by organization
        print("\n📊 Verifying child profiles by organization:")
        cursor.execute("""
            SELECT
                CASE
                    WHEN org_id = '7eab219a-7c83-406c-a6b2-75ed44de715b' THEN 'Hospital'
                    WHEN org_id = '5f910546-8bdc-44ca-b776-fdd5eb5cccd9' THEN 'School'
                    WHEN org_id = '0e233a3b-e007-4eae-a9a5-4586c59b2faf' THEN 'Clinic'
                    ELSE 'Unknown'
                END as org_name,
                COUNT(*) as child_count
            FROM profiles
            WHERE role = 'Child'
            GROUP BY org_id
            ORDER BY org_name
        """)

        for org, count in cursor.fetchall():
            print(f"   • {org}: {count} children")

        cursor.close()
        conn.close()
        print("\n✅ Database connection closed")

    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    create_child_profiles()