# Snort Configuration Guide

This document explains the basic configuration options required for running the custom Snort rules.

---

# HOME_NET

Defines the protected network.

Example:

```conf
ipvar HOME_NET 192.168.1.0/24
```

Example:

```
192.168.1.0 - 192.168.1.255
```

---

# EXTERNAL_NET

Defines traffic originating outside the protected network.

```conf
ipvar EXTERNAL_NET any
```

---

# RULE_PATH

Specifies where Snort loads rule files.

```conf
var RULE_PATH /etc/snort/rules
```

---

# Include Custom Rules

```conf
include $RULE_PATH/custom.rules
```

---

# Output Plugins

Console Output

```conf
output alert_fast: stdout
```

Log Output

```conf
output log_tcpdump: snort.log
```

---

# Network Interface

View interfaces:

```bash
ip addr
```

Example:

```
eth0
ens33
enp0s3
```

---

# Validate Configuration

```bash
sudo snort -T -c /etc/snort/snort.conf
```

---

# Common Issues

## Rule Not Found

Check:

```
RULE_PATH
```

---

## Permission Denied

Run Snort using:

```bash
sudo
```

---

## Invalid Rule

Validate:

```bash
sudo snort -T -c /etc/snort/snort.conf
```