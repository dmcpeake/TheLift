#!/usr/bin/env python3
import re
import glob
import os

# Map of hardcoded IDs to child names
ID_TO_NAME_MAP = {
    'ce864083-bdf5-4ead-b56a-3c36208d3b69': 'Emma Thompson',
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f': 'Aisha Patel',
    'e5f7d3b6-9a2c-4e6d-8b1f-3c5a7d9e0f4a': 'Oliver Chen',
    'aaaabbbb-cccc-dddd-eeee-111111111111': 'Sarah Williams',
    'b4f8a2c6-7d3e-4a9b-8c1d-2e6f9a5b0c7d': 'Marcus Johnson',
    'd8a3f2b6-4e7c-4a9d-9b1f-5c6a8d2e0f3b': 'Isabella Rodriguez',
    'f2c7e5a9-8b3d-4e6f-9a1c-6d8b0f3e5a7c': 'Noah Kim',
    'a7e3d5b9-2c4f-4a8e-8b1d-9f6a3c5e0d7b': 'Zara Ahmed',
    'c9b5e7a3-6d2f-4b8a-9e1c-3a7f5d9b0e4c': 'Ethan Davis',
    'e4a8c3b7-9d5f-4e2a-8b6c-1f9d7a3e5b0c': 'Maya Sharma',
    '28e7a649-8677-4476-b88c-b5b923a9a4e2': 'Chloe King',
    '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b': 'Liam Johnson',
    '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c': 'Emma Davis',
    '4a8b3e0c-d1f6-6b9f-c3d5-7e0f1a4b6c8d': 'Noah Wilson',
    '5b9c4f1d-e2a7-7c0a-d4e6-8f1a2b5c7d9e': 'Olivia Brown',
    '6c0d5a2e-f3b8-8d1b-e5f7-9a2b3c6d8e0f': 'William Taylor',
    '7d1e6b3f-a4c9-9e2c-f6a8-0b3c4d7e9f1a': 'Sophia Martinez',
    '8e2f7c4a-b5d0-0f3d-a7b9-1c4d5e8f0a2b': 'James Anderson',
    '9f3a8d5b-c6e1-1a4e-b8c0-2d5e6f9a1b3c': 'Isabella Thomas',
    '0a4b9e6c-d7f2-2b5f-c9d1-3e6f7a0b2c4d': 'Benjamin Jackson',
}

# Map of hardcoded org IDs to org names
ORG_ID_TO_NAME_MAP = {
    '7eab219a-7c83-406c-a6b2-75ed44de715b': "St. Mary's Hospital",
    '5f910546-8bdc-44ca-b776-fdd5eb5cccd9': 'Westfield Primary School',
    'a8b234c5-6d78-4e91-b234-567890abcdef': 'Mindful Wellness Clinic',
}

print("=" * 80)
print("CONVERTING COMBINED FILES TO USE GENERIC IDS")
print("=" * 80)

for filepath in sorted(glob.glob('/Users/tombrady/Documents/GitHub/TheLift/sql-combined/combined_*.sql')):
    filename = os.path.basename(filepath)
    new_filepath = filepath.replace('combined_', 'generic_combined_')

    print(f"\nProcessing {filename}...")

    with open(filepath, 'r') as f:
        content = f.read()

    # Replace child_id references
    for old_id, name in ID_TO_NAME_MAP.items():
        # Replace in child_id fields
        pattern = f"child_id[\\s]*,[\\s\\n]*'{old_id}'"
        replacement = f"child_id,\n    (SELECT id FROM public.profiles WHERE name = '{name}' AND role = 'Child')"
        content = re.sub(pattern, replacement, content)

        # Replace in WHERE clauses
        pattern = f"WHERE child_id = '{old_id}'"
        replacement = f"WHERE child_id = (SELECT id FROM public.profiles WHERE name = '{name}' AND role = 'Child')"
        content = content.replace(pattern, replacement)

        # Replace standalone references (in VALUES)
        pattern = f"'\\s*{old_id}\\s*',"
        replacement = f"(SELECT id FROM public.profiles WHERE name = '{name}' AND role = 'Child'),"
        content = re.sub(pattern, replacement, content)

    # Replace org_id references
    for old_id, name in ORG_ID_TO_NAME_MAP.items():
        # Replace in org_id fields
        pattern = f"org_id[\\s]*,[\\s\\n]*'{old_id}'"
        replacement = f"org_id,\n    (SELECT id FROM public.organisations WHERE name = '{name}')"
        content = re.sub(pattern, replacement, content)

        # Replace standalone org references
        pattern = f"'\\s*{old_id}\\s*',"
        replacement = f"(SELECT id FROM public.organisations WHERE name = '{name}'),"
        content = re.sub(pattern, replacement, content)

    # Write to new file
    with open(new_filepath, 'w') as f:
        f.write(content)

    print(f"  ✅ Created {os.path.basename(new_filepath)}")

print("\n" + "=" * 80)
print("✅ Conversion complete!")
print("\nNEW EXECUTION ORDER:")
print("1. Run setup_all_profiles_generic.sql")
print("2. Run generic_combined_01.sql through generic_combined_14.sql in order")
print("\nThe new files use subqueries to look up IDs by name, so they'll work")
print("with any database where the profiles have been created with gen_random_uuid()")