#!/bin/sh

set -eu

SOURCE="$HOME/"
EXCLUDE_FILE="$HOME/rsync_ignore"
BACKUP_MOUNT="/run/media/$(id -un)/Backup"
DESTINATION="$BACKUP_MOUNT/samsara/"

fail() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

command -v rsync >/dev/null 2>&1 || fail "rsync is not installed"
command -v mountpoint >/dev/null 2>&1 || fail "mountpoint is not installed"
[ -f "$EXCLUDE_FILE" ] || fail "exclude file not found: $EXCLUDE_FILE"

if ! mountpoint -q "$BACKUP_MOUNT"; then
  message="backup drive is not mounted: $BACKUP_MOUNT"
  if [ "${RSYNC_NOTIFY:-0}" = "1" ]; then
    if command -v notify-send >/dev/null 2>&1; then
      notify-send --urgency=normal "Home backup skipped" "$message" || \
        printf 'Warning: could not display backup notification\n' >&2
    fi
    printf 'Warning: %s; skipping backup\n' "$message"
    exit 0
  fi
  fail "$message"
fi

[ -d "$DESTINATION" ] || fail "destination directory not found: $DESTINATION"

if [ -t 1 ]; then
  set -- --partial --human-readable --info=progress2
else
  set -- --partial --info=stats2
fi

rsync -ax "$@" --exclude-from="$EXCLUDE_FILE" --delete --delete-excluded "$SOURCE" "$DESTINATION"
