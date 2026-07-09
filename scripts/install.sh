#!/bin/bash

#############################################
# Snort Custom IDS/IPS Rules Installer
# Author: Swastik Garg
#############################################

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

RULE_FILE="../rules/custom.rules"
RULE_DEST="/etc/snort/rules/custom.rules"
SNORT_CONF="/etc/snort/snort.conf"

echo -e "${BLUE}"
echo "=============================================="
echo "   Snort Custom IDS/IPS Rules Installer"
echo "=============================================="
echo -e "${NC}"

# Check if Snort is installed
if ! command -v snort >/dev/null 2>&1; then
    echo -e "${RED}[ERROR] Snort is not installed.${NC}"
    echo "Install Snort before running this script."
    exit 1
fi

echo -e "${GREEN}[OK] Snort installation detected.${NC}"

# Check configuration file
if [ ! -f "$SNORT_CONF" ]; then
    echo -e "${RED}[ERROR] snort.conf not found at:"
    echo "$SNORT_CONF"
    exit 1
fi

# Check rules directory
if [ ! -d "/etc/snort/rules" ]; then
    echo -e "${RED}[ERROR] Snort rules directory not found."
    exit 1
fi

# Check custom rule file
if [ ! -f "$RULE_FILE" ]; then
    echo -e "${RED}[ERROR] custom.rules not found."
    echo "Expected:"
    echo "$RULE_FILE"
    exit 1
fi

echo -e "${YELLOW}[INFO] Copying custom.rules...${NC}"
sudo cp "$RULE_FILE" "$RULE_DEST"

# Include rule if missing
if grep -q "custom.rules" "$SNORT_CONF"; then
    echo -e "${GREEN}[OK] custom.rules already included.${NC}"
else
    echo "" | sudo tee -a "$SNORT_CONF" >/dev/null
    echo "include \$RULE_PATH/custom.rules" | sudo tee -a "$SNORT_CONF" >/dev/null
    echo -e "${GREEN}[OK] Rule include added.${NC}"
fi

echo -e "${YELLOW}[INFO] Validating configuration...${NC}"

sudo snort -T -c "$SNORT_CONF"

echo
echo -e "${GREEN}Installation completed successfully.${NC}"