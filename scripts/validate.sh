#!/bin/bash

#############################################
# Snort Configuration Validator
#############################################

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

CONFIG="/etc/snort/snort.conf"

echo -e "${BLUE}"
echo "=============================================="
echo "      Snort Configuration Validator"
echo "=============================================="
echo -e "${NC}"

# Check installation
if ! command -v snort >/dev/null 2>&1; then
    echo -e "${RED}[ERROR] Snort is not installed.${NC}"
    exit 1
fi

# Check config
if [ ! -f "$CONFIG" ]; then
    echo -e "${RED}[ERROR] snort.conf not found.${NC}"
    exit 1
fi

echo "Running validation..."
echo

if sudo snort -T -c "$CONFIG"; then
    echo
    echo -e "${GREEN}Configuration validation successful.${NC}"
else
    echo
    echo -e "${RED}Configuration validation failed.${NC}"
    exit 1
fi