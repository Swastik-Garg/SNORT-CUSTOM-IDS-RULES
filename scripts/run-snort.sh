#!/bin/bash

INTERFACE=${1:-eth0}

echo "Starting Snort on interface $INTERFACE..."

sudo snort \
-c /etc/snort/snort.lua \
-i "$INTERFACE" \
-A alert_fast