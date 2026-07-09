# Snort 3 Installation Guide

This guide explains how to install Snort 3 on Kali Linux and prepare the environment for using the custom IDS/IPS rule set included in this repository.

---

# System Requirements

- Kali Linux (Recommended)
- Ubuntu 22.04+
- Root or sudo privileges
- Internet connection
- libpcap support

---

# Update the System

```bash
sudo apt update
sudo apt upgrade -y
```

---

# Install Required Packages

```bash
sudo apt install -y \
build-essential \
cmake \
libpcap-dev \
libpcre3-dev \
libdumbnet-dev \
bison \
flex \
zlib1g-dev \
liblzma-dev \
openssl \
libssl-dev \
pkg-config \
git
```

---

# Install Snort 3

Verify the installation:

```bash
snort -V
```

Example output:

```
Snort++ 3.x.x.x
```

---

# Verify Configuration

```bash
sudo snort -T -c /etc/snort/snort.lua
```

Expected output:

```
Snort successfully validated the configuration.
```

---

# Install Custom Rules

Clone the repository:

```bash
git clone https://github.com/Swastik-Garg/SNORT-CUSTOM-IDS-RULES.git
```

Copy the rules:

```bash
sudo cp rules/custom.rules /etc/snort/rules/
```

---

# Update snort.lua

Include the custom rules:

```lua
ips =
{
    include = "/etc/snort/rules/custom.rules"
}
```

---

# Validate Again

```bash
sudo snort -T -c /etc/snort/snort.lua
```

The configuration should validate successfully before running Snort.

---

# Run Snort

```bash
sudo snort -c /etc/snort/snort.lua \
-i eth0 \
-A alert_fast
```

Replace **eth0** with your monitoring interface.

---

# Troubleshooting

## Configuration Errors

Run:

```bash
sudo snort -T -c /etc/snort/snort.lua
```

Fix any reported syntax errors before continuing.

## Interface Check

```bash
ip a
```

Verify the correct interface is selected.

## Rule Validation

Ensure the custom rule file is located at:

```
/etc/snort/rules/custom.rules
```

---

# Next Step

Continue with the Configuration Guide.
