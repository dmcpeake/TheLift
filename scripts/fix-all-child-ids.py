#!/usr/bin/env python3

import re
import glob
import os

# The actual child IDs from setup_profiles.sql
VALID_CHILD_IDS = [
    # Hospital children
    'ce864083-bdf5-4ead-b56a-3c36208d3b69',  # Emma Thompson
    '1d0d16ae-2aa0-4d72-9abc-fd641147291f',  # Aisha Patel
    'e5f7d3b6-9a2c-4e6d-8b1f-3c5a7d9e0f4a',  # Oliver Chen
    'aaaabbbb-cccc-dddd-eeee-111111111111',  # Sarah Williams
    'b4f8a2c6-7d3e-4a9b-8c1d-2e6f9a5b0c7d',  # Marcus Johnson
    'd8a3f2b6-4e7c-4a9d-9b1f-5c6a8d2e0f3b',  # Isabella Rodriguez
    'f2c7e5a9-8b3d-4e6f-9a1c-6d8b0f3e5a7c',  # Noah Kim
    'a7e3d5b9-2c4f-4a8e-8b1d-9f6a3c5e0d7b',  # Zara Ahmed
    'c9b5e7a3-6d2f-4b8a-9e1c-3a7f5d9b0e4c',  # Ethan Davis
    'e4a8c3b7-9d5f-4e2a-8b6c-1f9d7a3e5b0c',  # Maya Sharma

    # School children
    '28e7a649-8677-4476-b88c-b5b923a9a4e2',  # Chloe King
    '2e6f1c8a-b9d4-4f7e-a1b3-5c8d9e2f4a6b',  # Liam Johnson
    '3f7a2d9b-c0e5-5a8f-b2c4-6d9e0f3a5b7c',  # Emma Davis
    '4a8b3e0c-d1f6-6b9f-c3d5-7e0f1a4b6c8d',  # Noah Wilson
    '5b9c4f1d-e2a7-7c0a-d4e6-8f1a2b5c7d9e',  # Olivia Brown
    '6c0d5a2e-f3b8-8d1b-e5f7-9a2b3c6d8e0f',  # William Taylor
    '7d1e6b3f-a4c9-9e2c-f6a8-0b3c4d7e9f1a',  # Sophia Martinez
    '8e2f7c4a-b5d0-0f3d-a7b9-1c4d5e8f0a2b',  # James Anderson
    '9f3a8d5b-c6e1-1a4e-b8c0-2d5e6f9a1b3c',  # Isabella Thomas
    '0a4b9e6c-d7f2-2b5f-c9d1-3e6f7a0b2c4d',  # Benjamin Jackson
]

# Map test IDs to real IDs (cycling through the list)
TEST_ID_MAPPING = {
    'aaaabbbb-cccc-dddd-eeee-111111111111': 'aaaabbbb-cccc-dddd-eeee-111111111111',  # Keep Sarah Williams as-is
}

# Generate mappings for the test IDs
test_patterns = [
    ('aaaabbbb-cccc-dddd-eeee-22222222222', 10),  # 221-230
    ('aaaabbbb-cccc-dddd-eeee-33333333333', 10),  # 331-340
]

valid_idx = 0
for pattern_base, count in test_patterns:
    for i in range(1, count + 1):
        test_id = f"{pattern_base}{i}"
        # Skip Sarah Williams ID
        if valid_idx == 3:
            valid_idx += 1
        TEST_ID_MAPPING[test_id] = VALID_CHILD_IDS[valid_idx % len(VALID_CHILD_IDS)]
        valid_idx += 1

print("Child ID Mapping:")
print("-" * 80)
for test_id, real_id in TEST_ID_MAPPING.items():
    if test_id != real_id:
        print(f"{test_id} -> {real_id}")

# Process all combined SQL files
sql_dir = '/Users/tombrady/Documents/GitHub/TheLift/sql-combined'
files_processed = 0

for filepath in sorted(glob.glob(os.path.join(sql_dir, 'combined_*.sql'))):
    filename = os.path.basename(filepath)
    print(f"\nProcessing {filename}...")

    with open(filepath, 'r') as f:
        content = f.read()

    original_content = content
    replacements = 0

    # Replace all test IDs with real IDs
    for test_id, real_id in TEST_ID_MAPPING.items():
        if test_id != real_id and test_id in content:
            count = content.count(test_id)
            content = content.replace(test_id, real_id)
            replacements += count
            print(f"  Replaced {count} instances of {test_id}")

    if replacements > 0:
        with open(filepath, 'w') as f:
            f.write(content)
        print(f"  ✅ Total replacements: {replacements}")
        files_processed += 1
    else:
        print(f"  ✅ No changes needed")

print(f"\n{'='*80}")
print(f"✅ Processed {files_processed} files")
print("All child IDs have been fixed!")