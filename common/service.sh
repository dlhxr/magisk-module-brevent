#!/system/bin/sh
MODDIR=${0%/*}
# idea from manhong2112
HOME=/sdcard
adb kill-server
setprop service.adb.tcp.port 5555
stop adbd && start adbd
setprop service.adb.tcp.port -1
## It is able to run in shell only.
adb shell "sh `pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-40`/lib/arm/libbootstrap.so" &
