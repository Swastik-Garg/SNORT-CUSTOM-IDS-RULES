# Rule Explanation

This document describes every custom Snort rule included in this repository.

| SID | Detection | Description |
|------|-----------|-------------|
|1000001|TCP SYN Scan|Detects TCP SYN port scanning activity|
|1000002|ICMP Flood|Detects excessive ICMP Echo Requests|
|1000003|Directory Traversal|Detects "../" traversal attempts|
|1000004|/etc/passwd|Detects attempts to access Linux password file|
|1000005|SQL Injection|Detects common SQL injection payloads|
|1000006|Cross Site Scripting|Detects XSS payloads|
|1000007|FTP Brute Force|Detects repeated FTP login attempts|
|1000008|SSH Brute Force|Detects repeated SSH login attempts|
|1000009|SMB Detection|Detects SMB connections|
|1000010|DNS Tunneling|Detects abnormal DNS packet sizes|
|1000011|DNS Amplification|Detects oversized DNS responses|
|1000012|SQLMap|Detects SQLMap User-Agent|
|1000013|Nikto|Detects Nikto User-Agent|
|1000014|Nmap XMAS|Detects XMAS scan packets|
|1000015|Reverse Shell|Detects "/bin/sh" payloads|
|1000016|Data Exfiltration|Detects unusually large HTTP POST requests|
|1000017|FTP Block|Rejects FTP connections|
|1000018|Telnet Block|Rejects Telnet connections|
|1000019|SSH Block|Rejects SSH connections|
|1000020|RDP Block|Rejects RDP connections|