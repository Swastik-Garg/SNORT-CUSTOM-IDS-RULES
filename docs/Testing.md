# Testing Guide

This guide explains how to verify that each Snort rule works correctly.

---

# Port Scan

```bash
nmap -sS <Target-IP>
```

Expected Alert

```
[SCAN] TCP SYN Port Scan Detected
```

---

# SQL Injection

Open

```
http://target/login.php?id=' OR 1=1--
```

Expected

```
[WEB] SQL Injection
```

---

# Cross Site Scripting

```
<script>alert(1)</script>
```

Expected

```
[WEB] Cross Site Scripting
```

---

# FTP Brute Force

```bash
hydra -l admin -P rockyou.txt ftp://<Target-IP>
```

Expected

```
FTP Brute Force
```

---

# SSH Brute Force

```bash
hydra -l root -P rockyou.txt ssh://<Target-IP>
```

Expected

```
SSH Brute Force
```

---

# DNS Testing

```bash
dig google.com
```

Observe DNS traffic.

---

# Validate Rules

```bash
sudo snort -T -c /etc/snort/snort.conf
```

---

# Monitor Live Traffic

```bash
sudo snort \
-A console \
-q \
-c /etc/snort/snort.conf \
-i eth0
```

---

# View Logs

```
/var/log/snort/
```