# Snort Installation Guide

This guide explains how to install Snort, configure the custom rule set, and verify that everything is working correctly.

---

# Prerequisites

Before installing Snort, ensure your system meets the following requirements:

- Linux (Ubuntu or Kali Linux recommended)
- Root or sudo privileges
- Internet connection
- Git
- GCC Compiler
- libpcap
- DAQ (Data Acquisition Library)

---

# Step 1: Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/snort-custom-ids-rules.git

cd snort-custom-ids-rules
```

Replace `YOUR_USERNAME` with your GitHub username.

---

# Step 2: Install Snort

## Ubuntu

```bash
sudo apt update
sudo apt install snort -y
```

## Kali Linux

```bash
sudo apt update
sudo apt install snort -y
```

Verify the installation:

```bash
snort -V
```

Expected output:

```
Version 2.9.x
```

---

# Step 3: Copy the Custom Rule File

Copy the custom rules into Snort's rule directory.

```bash
sudo cp rules/custom.rules /etc/snort/rules/
```

---

# Step 4: Configure Snort

Open the Snort configuration file.

```bash
sudo nano /etc/snort/snort.conf
```

Locate the rule include section and add:

```conf
include $RULE_PATH/custom.rules
```

Save the file.

---

# Step 5: Validate the Configuration

Run:

```bash
sudo snort -T -c /etc/snort/snort.conf
```

Expected output:

```
Snort successfully validated the configuration.
```

---

# Step 6: Run Snort

Start Snort in console mode.

```bash
sudo snort -A console \
-c /etc/snort/snort.conf \
-i eth0
```

Replace **eth0** with your network interface.

To list available interfaces:

```bash
ip addr
```

---

# Optional: Using the Helper Scripts

This repository includes helper scripts inside the `scripts/` directory to simplify installation and validation.

## Option 1 (Recommended)

Run the scripts directly using Bash:

```bash
bash scripts/install.sh
bash scripts/validate.sh
bash scripts/run-snort.sh eth0
```

This method works even if the scripts are not marked as executable.

---

## Option 2

Make the scripts executable and run them directly.

```bash
chmod +x scripts/install.sh
chmod +x scripts/validate.sh
chmod +x scripts/run-snort.sh
```

Now execute them:

```bash
./scripts/install.sh
./scripts/validate.sh
./scripts/run-snort.sh eth0
```

---

# Verify the Installation

Generate some test traffic, for example:

```bash
nmap -sS <Target-IP>
```

If everything is configured correctly, Snort should generate alerts according to the rules defined in `custom.rules`.

---

# Troubleshooting

### Snort command not found

Verify that Snort is installed:

```bash
snort -V
```

If not installed:

```bash
sudo apt install snort
```

---

### Rule file not found

Ensure that `custom.rules` exists in:

```
/etc/snort/rules/
```

---

### Permission denied

Run commands with:

```bash
sudo
```

or execute the helper scripts using:

```bash
bash scripts/install.sh
```

---

### Invalid configuration

Validate the configuration:

```bash
sudo snort -T -c /etc/snort/snort.conf
```

Correct any reported errors before starting Snort.

---

# Next Steps

After completing the installation:

- Review `docs/Configuration.md` to understand Snort configuration.
- Read `docs/Rule-Explanation.md` to learn how each rule works.
- Follow `docs/Testing.md` to test the rule set using common security tools.