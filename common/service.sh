#!/system/bin/sh -x
MODDIR=${0%/*}
if getprop ro.product.cpu.abilist | grep -q x86
then
abi=x86
else
abi=arm
fi
rm -f /cache/Brevent.log
su -c `pm path me.piebridge.brevent | cut -b 9-40`/lib/$abi/libbootstrap.so &> /cache/Brevent.log
#su shell -p -cn u:r:shell:s0 -c "`pm path me.piebridge.brevent | cut -b 9-40`/lib/$abi/libbootstrap.so"
