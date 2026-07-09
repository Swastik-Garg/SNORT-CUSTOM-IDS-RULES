# Custom Rule Explanation

This document explains the purpose, detection logic, and expected behavior of the custom Snort 3 rules included in this repository.

---

# Rule Categories

The rule set is organized into multiple categories based on attack type.

- Reconnaissance
- Web Application Attacks
- Authentication Attacks
- Malware & Command-and-Control
- DNS Attacks
- SMB Attacks
- Data Exfiltration
- IPS Blocking Rules

---

# Reconnaissance Rules

## TCP SYN Port Scan

**Purpose**

Detects TCP SYN scans performed by reconnaissance tools such as Nmap.

**Attack Technique**

- MITRE ATT&CK: T1595 (Active Scanning)

**Detection Logic**

- Matches TCP SYN packets.
- Tracks the number of SYN packets sent by a single source.
- Generates an alert when the configured threshold is exceeded.

**Example**

```bash
nmap -sS <Target-IP>
```

---

## TCP XMAS Scan

**Purpose**

Detects TCP packets with FIN, PSH, and URG flags set.

**Example**

```bash
nmap -sX <Target-IP>
```

---

## ICMP Flood

**Purpose**

Detects excessive ICMP Echo Requests that may indicate network flooding or reconnaissance.

**Example**

```bash
ping -f <Target-IP>
```

---

# Web Application Rules

## SQL Injection

Detects common SQL injection payloads such as:

- UNION SELECT
- OR 1=1
- SQLMap traffic

Example:

```
?id=' OR 1=1--
```

---

## Cross Site Scripting (XSS)

Detects JavaScript injection attempts within HTTP requests.

Example:

```html
<script>alert(1)</script>
```

---

## Directory Traversal

Detects attempts to access restricted files using path traversal.

Example:

```
../../../../etc/passwd
```

---

## Command Injection

Detects operating system command execution attempts.

Example:

```
; cat /etc/passwd
```

---

# Authentication Rules

## FTP Brute Force

Detects repeated FTP login attempts originating from the same source.

Typical tool:

```bash
hydra
```

---

## SSH Brute Force

Detects repeated SSH authentication attempts.

Typical tool:

```bash
hydra
```

---

# SMB Rules

## SMB Access Detection

Detects SMB communication targeting TCP port 445.

Useful for monitoring:

- Lateral movement
- File sharing
- Enumeration

---

# DNS Rules

## DNS Tunneling

Detects suspicious DNS queries that may indicate covert channels.

---

## DNS Amplification

Detects DNS requests commonly associated with amplification attacks.

---

# Malware Rules

## Reverse Shell Detection

Detects common reverse shell traffic patterns.

Examples include:

- Netcat
- Bash reverse shell
- Python reverse shell

---

# Data Exfiltration

## Large HTTP POST

Detects unusually large HTTP POST requests that may indicate data theft.

---

# IPS Rules

Several rules are written to support Snort IPS mode, allowing malicious traffic to be dropped instead of only generating alerts.

---

# Rule Validation

After modifying any rule, validate the configuration:

```bash
sudo snort -T -c /etc/snort/snort.lua
```

---

# Best Practices

- Use unique SID values.
- Increment the revision number after every rule update.
- Test rules in a controlled lab.
- Document every modification.
- Keep signatures focused to reduce false positives.

---

# MITRE ATT&CK Coverage

| Category | Example Technique |
|-----------|-------------------|
| Reconnaissance | Active Scanning |
| Credential Access | Brute Force |
| Initial Access | Exploitation |
| Discovery | Network Service Scanning |
| Exfiltration | Data Transfer |

---

# Summary

The rule set is designed to provide practical detection coverage for common network attacks while remaining easy to understand, extend, and test in a laboratory environment.