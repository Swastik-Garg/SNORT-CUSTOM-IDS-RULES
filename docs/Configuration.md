# Snort 3 Configuration Guide

This guide explains how to configure Snort 3 to use the custom detection rules provided in this repository.

---

# Directory Structure

The default Snort directories used in this project are:

```
/etc/snort/
├── snort.lua
├── rules/
│   └── custom.rules
├── builtin_rules/
└── so_rules/
```

---

# Copy the Rule File

Copy the repository rule file into the Snort rules directory.

```bash
sudo cp rules/custom.rules /etc/snort/rules/
```

---

# Edit snort.lua

Open the configuration file.

```bash
sudo nano /etc/snort/snort.lua
```

Locate the IPS configuration section and include the custom rule file.

```lua
ips =
{
    include = "/etc/snort/rules/custom.rules"
}
```

Save the file.

---

# Verify Network Variables

Ensure the HOME_NET variable matches your environment.

Example:

```lua
HOME_NET = '192.168.17.0/24'
```

If monitoring another network, update it accordingly.

---

# Select the Monitoring Interface

List available interfaces.

```bash
ip a
```

Example output:

```
eth0
eth1
lo
```

Choose the interface connected to the monitored network.

---

# Validate the Configuration

Always validate before starting Snort.

```bash
sudo snort -T -c /etc/snort/snort.lua
```

Expected output:

```
Snort successfully validated the configuration.
```

---

# Run Snort

Start Snort in IDS mode.

```bash
sudo snort \
-c /etc/snort/snort.lua \
-i eth0 \
-A alert_fast
```

Replace **eth0** with your network interface.

---

# Verify Alerts

Generate test traffic, such as:

- Nmap SYN Scan
- FTP Brute Force
- ICMP Flood

Snort should display alerts similar to:

```
[RECON] TCP SYN Port Scan Detected
[AUTH] Possible FTP Brute Force
```

---

# Common Problems

## Configuration Validation Failed

Run:

```bash
sudo snort -T -c /etc/snort/snort.lua
```

Correct any syntax errors before running Snort.

---

## No Alerts Generated

Check:

- Correct network interface
- HOME_NET configuration
- Rule file path
- Traffic reaches the monitored interface

---

## Rules Not Loading

Verify the rule file exists.

```bash
ls -l /etc/snort/rules/custom.rules
```

---

# Best Practices

- Validate the configuration after every rule change.
- Keep custom rules in a separate file.
- Test new signatures in a lab environment.
- Maintain unique SID values.
- Document every rule revision.

---

# Next Step

Continue with **Rule-Explanation.md** to understand each detection rule.