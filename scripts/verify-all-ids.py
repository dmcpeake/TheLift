#!/usr/bin/env python3
import re
import glob
import os

# Read all valid IDs from setup_all_profiles.sql
valid_ids = set()
with open('/Users/tombrady/Documents/GitHub/TheLift/sql-combined/setup_all_profiles.sql', 'r') as f:
    content = f.read()
    # Extract all UUIDs from the setup file
    uuid_pattern = r"'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'"
    matches = re.findall(uuid_pattern, content)
    valid_ids.update(matches)

print("=" * 80)
print("VERIFYING ALL COMBINED SQL FILES")
print("=" * 80)
print(f"\nFound {len(valid_ids)} valid IDs in setup_all_profiles.sql\n")

all_good = True
files_with_issues = []

# Check each combined file
for filepath in sorted(glob.glob('/Users/tombrady/Documents/GitHub/TheLift/sql-combined/combined_*.sql')):
    filename = os.path.basename(filepath)

    with open(filepath, 'r') as f:
        content = f.read()

    # Extract all UUIDs from the file
    uuid_pattern = r"'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'"
    file_ids = set(re.findall(uuid_pattern, content))

    # Check for unknown IDs
    unknown_ids = file_ids - valid_ids

    if unknown_ids:
        all_good = False
        files_with_issues.append(filename)
        print(f"❌ {filename}:")
        for uid in sorted(unknown_ids)[:5]:  # Show first 5 unknown IDs
            print(f"   Unknown ID: {uid}")
        if len(unknown_ids) > 5:
            print(f"   ... and {len(unknown_ids) - 5} more unknown IDs")
    else:
        print(f"✅ {filename}: All IDs valid")

print("\n" + "=" * 80)

if all_good:
    print("✅ SUCCESS: All combined files are ready to run!")
    print("\nExecution order:")
    print("1. Run setup_all_profiles.sql")
    print("2. Run combined_01.sql through combined_14.sql in order")
else:
    print("❌ ISSUES FOUND in these files:")
    for f in files_with_issues:
        print(f"   - {f}")
    print("\nThese files need to be fixed before running.")