#!/bin/bash

echo "========== Environment Check =========="

echo
echo "Checking Snort..."

if command -v snort >/dev/null 2>&1; then
    snort -V | head -1
else
    echo "Snort is NOT installed."
fi

echo
echo "Checking configuration..."

if [ -f /etc/snort/snort.conf ]; then
    echo "snort.conf found."
else
    echo "snort.conf missing."
fi

echo
echo "Checking custom rules..."

if [ -f /etc/snort/rules/custom.rules ]; then
    echo "custom.rules installed."
else
    echo "custom.rules missing."
fi

echo
echo "Available interfaces"

ip -br addr