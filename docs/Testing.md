# Snort 3 Testing Guide

This document provides step-by-step instructions for testing the custom Snort 3 rules included in this repository.

---

# Test Environment

## Attacker Machine

- Kali Linux
- Snort 3
- Nmap
- Hydra
- Netcat

## Target Machine

- Metasploitable 2
- DVWA
- FTP Service
- SSH Service
- Apache Web Server

---

# Verify Snort

Before testing, validate the configuration.

```bash
sudo snort -T -c /etc/snort/snort.lua
```

Expected output:

```
Snort successfully validated the configuration.
```

---

# Start Snort

```bash
sudo snort \
-c /etc/snort/snort.lua \
-i eth0 \
-A alert_fast
```

Replace **eth0** with your monitoring interface.

---

# Test 1 — TCP SYN Port Scan

Command

```bash
sudo nmap -sS <Target-IP>
```

Expected Alert

```
[RECON] TCP SYN Port Scan Detected
```

---

# Test 2 — TCP XMAS Scan

Command

```bash
sudo nmap -sX <Target-IP>
```

Expected Alert

```
[RECON] TCP XMAS Scan Detected
```

---

# Test 3 — ICMP Flood

Command

```bash
ping -f <Target-IP>
```

Expected Alert

```
[DOS] ICMP Flood Detected
```

---

# Test 4 — FTP Brute Force

Example password list

```text
admin
password
123456
test
root
```

Command

```bash
hydra -l admin -P ftp-pass.txt ftp://<Target-IP>
```

Expected Alert

```
[AUTH] Possible FTP Brute Force
```

---

# Test 5 — SSH Brute Force

Command

```bash
hydra -l root -P ssh-pass.txt ssh://<Target-IP>
```

Expected Alert

```
[AUTH] Possible SSH Brute Force
```

> **Note:** Older SSH servers (such as those on Metasploitable 2) may require legacy cryptographic algorithms, and modern Hydra versions may not connect successfully.

---

# Test 6 — SQL Injection

Open DVWA.

Example payload

```
' OR 1=1 #
```

Expected Alert

```
[WEB] SQL Injection
```

---

# Test 7 — Cross Site Scripting (XSS)

Open DVWA Reflected XSS.

Payload

```html
<script>alert(1)</script>
```

Expected Alert

```
[WEB] Cross Site Scripting
```

---

# Test 8 — Directory Traversal

Payload

```
../../../../etc/passwd
```

Expected Alert

```
[WEB] Directory Traversal
```

---

# Test 9 — Reverse Shell

Example Netcat listener

```bash
nc -lvnp 4444
```

Expected Alert

```
[MALWARE] Reverse Shell Detected
```

---

# Test 10 — DNS Detection

Generate DNS requests.

Expected Alert

```
[DNS] Suspicious DNS Activity
```

---

# Troubleshooting

## Validate Configuration

```bash
sudo snort -T -c /etc/snort/snort.lua
```

---

## Check Interfaces

```bash
ip a
```

---

## Confirm Rules

```bash
grep sid /etc/snort/rules/custom.rules
```

---

## Verify Traffic

Use tcpdump if alerts are not generated.

```bash
sudo tcpdump -i eth0
```

---

# Tips

- Test one rule at a time.
- Validate after every rule modification.
- Capture screenshots for successful detections.
- Store PCAP files for future testing.
- Use isolated lab environments.

---

# Conclusion

Following this guide allows users to reproduce the detection scenarios included in this repository and verify that the custom Snort 3 rules operate as expected.