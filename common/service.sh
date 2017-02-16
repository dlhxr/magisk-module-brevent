#!/system/bin/sh
MODDIR=${0%/*}
# idea from manhong2112
HOME=/sdcard
adb kill-server
setprop service.adb.tcp.port 5555
stop adbd && start adbd
setprop service.adb.tcp.port -1
# Both run well under shell.
## Original code running experience.
adb shell "sh `pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-40`/lib/arm/libbootstrap.so" &
## From the core part of the libbootstrap.so
adb shell "export CLASSPATH=`pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-` ;exec app_process /system/bin me.piebridge.brevent.server.Brevent $@" &
# None of them working in magisk.