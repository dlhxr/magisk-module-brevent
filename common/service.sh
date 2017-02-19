#!/system/bin/sh
MODDIR=${0%/*}
# idea from manhong2112
export HOME=/sdcard
export CLASSPATH=`pm path me.piebridge.brevent | cut -b 9-40`/lib/arm/libloader.so
adb kill-server
setprop service.adb.tcp.port 5555
stop adbd && start adbd
setprop service.adb.tcp.port -1
adb shell "sh `pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-40`/lib/arm/libbootstrap.so" &

#context error
#su shell -p -cn u:r:shell:s0 -c "/system/bin/app_process32 /system/bin --nice-name=brevent_server me.piebridge.brevent.loader.Brevent \"$@\" &"

