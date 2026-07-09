#!/bin/bash

#############################################
# Snort Runner
#############################################

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

CONFIG="/etc/snort/snort.conf"

echo -e "${BLUE}"
echo "=============================================="
echo "         Snort IDS Runner"
echo "=============================================="
echo -e "${NC}"

# Check Snort
if ! command -v snort >/dev/null 2>&1; then
    echo -e "${RED}[ERROR] Snort is not installed.${NC}"
    exit 1
fi

# Check config
if [ ! -f "$CONFIG" ]; then
    echo -e "${RED}[ERROR] snort.conf not found.${NC}"
    exit 1
fi

# Check interface
if [ -z "$1" ]; then
    echo -e "${YELLOW}Usage:${NC}"
    echo
    echo "bash scripts/run-snort.sh <network-interface>"
    echo
    echo "Example:"
    echo "bash scripts/run-snort.sh eth0"
    echo
    echo "Available interfaces:"
    ip -br addr
    exit 1
fi

INTERFACE="$1"

echo
echo -e "${GREEN}Monitoring interface:${NC} $INTERFACE"
echo

sudo snort \
-A console \
-q \
-c "$CONFIG" \
-i "$INTERFACE"