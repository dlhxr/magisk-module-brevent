#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

LOGFILE=/cache/magisk.log

for x in 1 2 3; do
  file=/data/app/me.piebridge.brevent-$x/lib/*/libbootstrap.so
  echo "$file" >> $LOGFILE
  if [ -f $file ]; then
    $file
    echo "done" >> $LOGFILE
    break
  fi
done
