#!/bin/sh

rsync -avxPn --exclude-from=/home/ctarx/rsync_ignore --delete --delete-excluded /home/ctarx/ /media/ctarx/Backup/hell/

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
