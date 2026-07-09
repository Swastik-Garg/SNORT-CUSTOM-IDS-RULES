#!/bin/bash

echo "Validating Snort configuration..."

sudo snort -T -c /etc/snort/snort.lua

echo "Validation completed."