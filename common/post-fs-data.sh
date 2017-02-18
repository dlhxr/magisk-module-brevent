#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

log_print() {
  local LOGFILE=/cache/magisk.log
  echo "prevent: $1" >> $LOGFILE
  log -p i -t prevent "$1"
}

if [ -f "/data/media/prevent/services.jar" ]; then
    mkdir -p "${MODDIR}/system/framework" 2>/dev/null
    cp -f "/data/media/prevent/services.jar" "${MODDIR}/system/framework/services.jar" && log_print "Created system/framework/services.jar" || log_print "Copy Failed: /data/media/prevent/services.jar ${MODDIR}/system/framework/services.jar"
    chown 0:0 "${MODDIR}/system/framework"
    chmod 0755 "${MODDIR}/system/framework"
    chown 0:0 "${MODDIR}/system/framework/services.jar"
    chmod 0644 "${MODDIR}/system/framework/services.jar"
else
    rm -rf "${MODDIR}/system" && log_print "Restored original services.jar"
fi
