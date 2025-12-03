#!/bin/bash
BACKUP_DIR=$HOME/Devops/backup
SOURCE_DIR=$HOME/Devops/source
LOG_FILE="$BACKUP_DIR/logfile.log"
log(){
    echo "[$(date '+%Y-%m-%d %H:%M:S')] $1" | tee -a "$LOG_FILE"
}
if [ ! -d "$SOURCE_DIR" ]; then
 log "ERROR: Directory $SOURCE_DIR doesn’t exist!"
 exit 1
fi
log "The start of process"
tar -czvf  $BACKUP_DIR/backup-$(date +%Y%m%d-%H%M%S).tar.gz -C "$SOURCE_DIR/*" .
find $BACKUP_DIR -type f -name "*.tar.gz" | sort | head -n -5 | xargs -r rm