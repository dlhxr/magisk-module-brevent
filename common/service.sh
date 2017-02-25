#!/system/bin/sh
MODDIR=${0%/*}
if getprop ro.product.cpu.abilist | grep -q x86
then
abi=x86
else
abi=arm
fi
exec `pm path me.piebridge.brevent | cut -b 9-40`/lib/$abi/libbootstrap.so

#su shell -p -cn u:r:shell:s0 -c "/system/bin/app_process32 /system/bin --nice-name=brevent_server me.piebridge.brevent.loader.Brevent \"$@\" &"
