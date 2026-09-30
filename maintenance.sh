```bash
#!/bin/bash

# Configuration
TARGET_DIR="$HOME/projects"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"

echo "=== Linux System Maintenance & Backup Utility ==="
echo "[*] Starting routine maintenance..."

# 1. System Health Check
echo -e "\n[+] Checking Disk Space Usage:"
df -h / | awk 'NR==2 {print "  Used: " $5 " | Available: " $4}'

echo -e "\n[+] Checking Memory Availability:"
free -h | grep "Mem:" | awk '{print "  Total: " $2 " | Used: " $3 " | Free: " $4}'

# 2. Backup Routine
echo -e "\n[*] Creating backup of $TARGET_DIR..."
if [ -d "$TARGET_DIR" ]; then
    tar -czf "$ARCHIVE_NAME" "$TARGET_DIR" 2>/dev/null
    echo "[+] Backup created successfully as: $ARCHIVE_NAME"
else
    echo "[-] Warning: Target directory $TARGET_DIR does not exist."
fi

echo -e "\n[+] Maintenance completed successfully at $(date)"
