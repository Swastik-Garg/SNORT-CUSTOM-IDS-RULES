#!/bin/bash

echo "====================================="
echo " Installing Snort Custom Rules"
echo "====================================="

sudo cp ../rules/custom.rules /etc/snort/rules/

echo "Rules copied successfully."

echo "Validating configuration..."

sudo snort -T -c /etc/snort/snort.lua

echo "Done."