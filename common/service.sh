#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
restartadb(){
/system/bin/setprop service.adb.tcp.port 5555
/system/bin/stop adbd
/system/bin/start adbd
}
restartadb 5555
export HOME=/sdcard
$MODDIR/system/bin/adb shell <<< 'export CLASSPATH=`pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-`  && exec app_process /system/bin me.piebridge.brevent.server.Brevent "$@" &  ' &
$MODDIR/system/bin/adb kill-server
restartadb 0