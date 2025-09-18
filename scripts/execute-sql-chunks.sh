#!/bin/bash

# Supabase database connection URL
DATABASE_URL="postgresql://postgres.xssxgnqkqfkcxtcbddgn:qR7SakU9KPdCDcKo@aws-0-us-east-1.pooler.supabase.com:6543/postgres"

# Directory containing SQL chunks
CHUNKS_DIR="/Users/tombrady/Documents/GitHub/TheLift/sql-chunks"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🚀 Starting SQL chunk execution..."
echo "📂 Chunks directory: $CHUNKS_DIR"
echo ""

# Check if psql is installed
if ! command -v psql &> /dev/null; then
    echo -e "${RED}❌ psql is not installed. Please install PostgreSQL client tools.${NC}"
    echo "On Mac, run: brew install postgresql"
    exit 1
fi

# Count total chunks
TOTAL_CHUNKS=$(ls -1 "$CHUNKS_DIR"/chunk_*.sql 2>/dev/null | wc -l)

if [ "$TOTAL_CHUNKS" -eq 0 ]; then
    echo -e "${RED}❌ No SQL chunk files found in $CHUNKS_DIR${NC}"
    exit 1
fi

echo "📊 Found $TOTAL_CHUNKS SQL chunks to execute"
echo ""

# Ask for confirmation
read -p "Do you want to execute all chunks? (y/n): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Execution cancelled"
    exit 0
fi

echo ""
echo "Starting execution..."
echo ""

# Execute each chunk
SUCCESSFUL=0
FAILED=0

for chunk_file in "$CHUNKS_DIR"/chunk_*.sql; do
    if [ -f "$chunk_file" ]; then
        CHUNK_NAME=$(basename "$chunk_file")
        CHUNK_NUM=$(echo "$CHUNK_NAME" | sed 's/chunk_\([0-9]*\)\.sql/\1/')

        echo -ne "Executing $CHUNK_NAME ($CHUNK_NUM/$TOTAL_CHUNKS)... "

        # Execute the chunk
        if psql "$DATABASE_URL" -q -f "$chunk_file" 2>/dev/null; then
            echo -e "${GREEN}✓${NC}"
            ((SUCCESSFUL++))
        else
            echo -e "${RED}✗${NC}"
            ((FAILED++))
            echo -e "${YELLOW}  Warning: Failed to execute $CHUNK_NAME${NC}"
        fi

        # Small delay to avoid rate limits
        sleep 0.5
    fi
done

echo ""
echo "========================================="
echo "📊 Execution Summary:"
echo "  ✅ Successful: $SUCCESSFUL chunks"
echo "  ❌ Failed: $FAILED chunks"
echo "========================================="

if [ "$FAILED" -gt 0 ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Some chunks failed. This might be due to:${NC}"
    echo "  - Duplicate key violations (data already exists)"
    echo "  - Network timeout"
    echo "  - Rate limiting"
    echo ""
    echo "You can try re-running just the failed chunks."
fi

if [ "$SUCCESSFUL" -eq "$TOTAL_CHUNKS" ]; then
    echo ""
    echo -e "${GREEN}🎉 All chunks executed successfully!${NC}"
    echo "Your database now has the complete journeys data."
fi