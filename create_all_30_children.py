#!/usr/bin/env python3
"""
Create All 30 Children with Auth Users
Creates auth users first, then profiles for all 30 children from pen portraits
"""

import psycopg2
import psycopg2.extras
from datetime import datetime, date
import uuid
import sys

# Database connection
DB_URL = "postgresql://postgres:Q5O3tRnvw3A6mDc7@db.lwxrsufqnxlwiotkolfc.supabase.co:5432/postgres"

# All 30 children with their details
CHILDREN = [
    # Hospital Children (org_id: 7eab219a-7c83-406c-a6b2-75ed44de715b)
    {"name": "Emma Thompson", "first": "Emma", "last": "Thompson", "age": 7, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Asthma"},
    {"name": "Aisha Patel", "first": "Aisha", "last": "Patel", "age": 8, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Diabetes"},
    {"name": "Kai Chen", "first": "Kai", "last": "Chen", "age": 7, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Surgery recovery"},
    {"name": "Mia Rodriguez", "first": "Mia", "last": "Rodriguez", "age": 9, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Kidney disease"},
    {"name": "Ethan Williams", "first": "Ethan", "last": "Williams", "age": 10, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Leukemia"},
    {"name": "Zara Ahmed", "first": "Zara", "last": "Ahmed", "age": 6, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Trauma recovery"},
    {"name": "Lucas Brown", "first": "Lucas", "last": "Brown", "age": 11, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Depression"},
    {"name": "Amara Johnson", "first": "Amara", "last": "Johnson", "age": 8, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Heart condition"},
    {"name": "Ben Young", "first": "Ben", "last": "Young", "age": 9, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Chronic pain"},
    {"name": "Chloe King", "first": "Chloe", "last": "King", "age": 11, "org_id": "7eab219a-7c83-406c-a6b2-75ed44de715b", "org_name": "Hospital", "condition": "Eating disorder"},

    # School Children (org_id: 5f910546-8bdc-44ca-b776-fdd5eb5cccd9)
    {"name": "Oliver Davies", "first": "Oliver", "last": "Davies", "age": 8, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Dyslexia"},
    {"name": "Jayden Smith", "first": "Jayden", "last": "Smith", "age": 7, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "ADHD"},
    {"name": "Sophia Wilson", "first": "Sophia", "last": "Wilson", "age": 9, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Anxiety"},
    {"name": "Tyler Anderson", "first": "Tyler", "last": "Anderson", "age": 10, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Social anxiety"},
    {"name": "Ava Taylor", "first": "Ava", "last": "Taylor", "age": 8, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Family stress"},
    {"name": "Noah Martin", "first": "Noah", "last": "Martin", "age": 6, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Confidence"},
    {"name": "Isla Roberts", "first": "Isla", "last": "Roberts", "age": 11, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Transition anxiety"},
    {"name": "Ravi Singh", "first": "Ravi", "last": "Singh", "age": 9, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Bilingual confidence"},
    {"name": "Evie Scott", "first": "Evie", "last": "Scott", "age": 9, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Friendship issues"},
    {"name": "Felix Baker", "first": "Felix", "last": "Baker", "age": 7, "org_id": "5f910546-8bdc-44ca-b776-fdd5eb5cccd9", "org_name": "School", "condition": "Speech delay"},

    # Clinic Children (org_id: 0e233a3b-e007-4eae-a9a5-4586c59b2faf)
    {"name": "Sebastian Clark", "first": "Sebastian", "last": "Clark", "age": 9, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Autism"},
    {"name": "Lily Evans", "first": "Lily", "last": "Evans", "age": 8, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Sensory processing"},
    {"name": "Charlie White", "first": "Charlie", "last": "White", "age": 10, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Selective mutism"},
    {"name": "Maya Green", "first": "Maya", "last": "Green", "age": 7, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Perfectionism"},
    {"name": "Oscar Harris", "first": "Oscar", "last": "Harris", "age": 9, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Dyspraxia"},
    {"name": "Ruby Lewis", "first": "Ruby", "last": "Lewis", "age": 8, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "High sensitivity"},
    {"name": "Finn Walker", "first": "Finn", "last": "Walker", "age": 7, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Developmental delays"},
    {"name": "Zoe Hall", "first": "Zoe", "last": "Hall", "age": 10, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Gifted"},
    {"name": "Dex Wright", "first": "Dex", "last": "Wright", "age": 8, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "Selective mutism"},
    {"name": "Grace Turner", "first": "Grace", "last": "Turner", "age": 10, "org_id": "0e233a3b-e007-4eae-a9a5-4586c59b2faf", "org_name": "Clinic", "condition": "OCD tendencies"}
]

def create_all_children():
    """Create all 30 children with auth users and profiles"""
    print("🚀 Creating All 30 Children")
    print("=" * 60)

    try:
        # Connect to database
        print("🔗 Connecting to Supabase...")
        conn = psycopg2.connect(DB_URL)
        cursor = conn.cursor()
        print("✅ Connected successfully\n")

        # Get existing children to avoid duplicates
        cursor.execute("""
            SELECT name, id FROM profiles
            WHERE role = 'Child'
        """)
        existing_children = {row[0]: row[1] for row in cursor.fetchall()}
        print(f"📊 Found {len(existing_children)} existing children\n")

        created = 0
        skipped = 0
        failed = 0
        child_ids = {}

        for child in CHILDREN:
            # Check if child already exists (by name)
            existing_names = [name.lower() for name in existing_children.keys()]

            # Try different name formats
            name_variants = [
                child['name'],  # Full name
                child['first'],  # First name only
                f"{child['first']} {child['last']}",  # First Last
            ]

            child_id = None
            for variant in name_variants:
                if variant.lower() in existing_names:
                    # Find the actual key with case-insensitive match
                    for key, value in existing_children.items():
                        if key.lower() == variant.lower():
                            child_id = value
                            break
                    if child_id:
                        break

            if child_id:
                print(f"✓ Exists: {child['name']} (ID: {child_id})")
                child_ids[child['name']] = child_id
                skipped += 1
            else:
                # Create new child with auth user
                try:
                    # Generate new UUID for this child
                    new_id = str(uuid.uuid4())
                    email = f"{child['first'].lower()}.{child['last'].lower()}@thelift.test"

                    # First create auth user
                    cursor.execute("""
                        INSERT INTO auth.users (
                            id,
                            email,
                            encrypted_password,
                            email_confirmed_at,
                            created_at,
                            updated_at,
                            raw_app_meta_data,
                            raw_user_meta_data,
                            aud,
                            role
                        ) VALUES (
                            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
                        )
                    """, (
                        new_id,
                        email,
                        '$2a$10$PExNgw5YLqii4wpgJNLbqOqS6LhJPnxLPBWf1CpgV4Lf8FEVgdXGS',  # Dummy encrypted password
                        datetime.now(),
                        datetime.now(),
                        datetime.now(),
                        '{"provider": "email", "providers": ["email"]}',
                        f'{{"name": "{child["name"]}"}}',
                        'authenticated',
                        'authenticated'
                    ))

                    # Then create profile
                    cursor.execute("""
                        INSERT INTO profiles (
                            id, name, email, role, org_id,
                            avatar_url, created_at, updated_at
                        ) VALUES (
                            %s, %s, %s, %s, %s, %s, %s, %s
                        )
                    """, (
                        new_id,
                        child['name'],
                        email,
                        'Child',
                        child['org_id'],
                        f"/avatars/{child['first'].lower()}.svg",
                        datetime.now(),
                        datetime.now()
                    ))

                    conn.commit()
                    print(f"✅ Created: {child['name']} (ID: {new_id})")
                    child_ids[child['name']] = new_id
                    created += 1

                except psycopg2.Error as e:
                    conn.rollback()
                    print(f"❌ Failed: {child['name']} - {str(e)[:50]}")
                    failed += 1

        # Summary
        print("\n" + "=" * 60)
        print("✨ CHILD CREATION COMPLETE")
        print("=" * 60)
        print(f"✅ Created: {created} new children")
        print(f"✓  Existing: {skipped} children")
        print(f"❌ Failed: {failed} children")
        print(f"📊 Total available: {len(child_ids)} children")

        # Save child IDs to file for session generation
        with open('child_ids_mapping.txt', 'w') as f:
            f.write("# Child ID Mapping for Session Generation\n")
            f.write(f"# Generated: {datetime.now()}\n\n")

            for org_name in ['Hospital', 'School', 'Clinic']:
                f.write(f"\n# {org_name} Children\n")
                for child in CHILDREN:
                    if child['org_name'] == org_name and child['name'] in child_ids:
                        f.write(f"{child['name']}: {child_ids[child['name']]}\n")

        print(f"\n📝 Child IDs saved to: child_ids_mapping.txt")

        # Verify by organization
        print("\n📊 Children by organization:")
        cursor.execute("""
            SELECT o.name, COUNT(p.id) as child_count
            FROM profiles p
            JOIN organisations o ON p.org_id = o.id
            WHERE p.role = 'Child'
            GROUP BY o.name
            ORDER BY o.name
        """)

        for org, count in cursor.fetchall():
            print(f"   • {org}: {count} children")

        cursor.close()
        conn.close()
        print("\n✅ Database connection closed")

        return child_ids

    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    child_ids = create_all_children()

    if child_ids:
        print("\n" + "=" * 60)
        print("🎯 Next Steps:")
        print("1. Use child_ids_mapping.txt to generate session SQL")
        print("2. Update generation scripts with actual child IDs")
        print("3. Run session data generation for all children")
        print("=" * 60)