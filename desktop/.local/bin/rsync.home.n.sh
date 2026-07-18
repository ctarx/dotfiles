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

rsync -avxPn --exclude-from="$EXCLUDE_FILE" --delete --delete-excluded "$SOURCE" "$DESTINATION"

# Options:
#
# -a, --archive (includes --links)
# 		-l, --links		copy symlinks as symlinks
#
# -v --verbose 	This  option increases the amount of information you
# 				are given during the transfer.
# -x, --one-file-system       don't cross filesystem boundaries
#
# -P    The  -P  option  is  equivalent to --partial --progress
# 		--partial Keeps the partial file
# 		--progress Shows the progress of the transfer.
#
# -n, 	--dry-run Perform a trial run with no changes made
#
# --delete                delete extraneous files from dest dirs
#
# --exclude=PATTERN       exclude files matching PATTERN
#	rsync -av --exclude={'*.txt','dir3','dir4'} sourcedir/ destinationdir/
#
# --exclude-from=FILE     read exclude patterns from FILE
