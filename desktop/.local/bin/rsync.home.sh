#!/bin/sh

set -eu

SOURCE="$HOME/"
EXCLUDE_FILE="$HOME/rsync_ignore"
BACKUP_MOUNT="/media/$(id -un)/Backup"
DESTINATION="$BACKUP_MOUNT/samsara/"

fail() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

command -v rsync >/dev/null 2>&1 || fail "rsync is not installed"
command -v mountpoint >/dev/null 2>&1 || fail "mountpoint is not installed"
[ -f "$EXCLUDE_FILE" ] || fail "exclude file not found: $EXCLUDE_FILE"
mountpoint -q "$BACKUP_MOUNT" || fail "backup drive is not mounted: $BACKUP_MOUNT"
[ -d "$DESTINATION" ] || fail "destination directory not found: $DESTINATION"

rsync -avxP --exclude-from="$EXCLUDE_FILE" --delete --delete-excluded "$SOURCE" "$DESTINATION"
