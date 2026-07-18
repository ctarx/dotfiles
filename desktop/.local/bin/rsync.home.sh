#!/bin/sh

rsync -avxP --exclude-from=/home/ctarx/rsync_ignore --delete --delete-excluded /home/ctarx/ /media/ctarx/Backup/hell/
