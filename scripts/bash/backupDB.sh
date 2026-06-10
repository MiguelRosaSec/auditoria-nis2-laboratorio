#!/bin/bash
set -euo pipefail

BACKUP_DIR="/opt/backups/mysql"
DB_NAME="almerialogitech"
DATE="$(date +%F_%H%M%S)"
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql"

mkdir -p "$BACKUP_DIR"

mysqldump "$DB_NAME" > "$BACKUP_FILE"

gzip "$BACKUP_FILE"

echo "Backup generado: ${BACKUP_FILE}.gz"