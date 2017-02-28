#!/system/bin/sh
MODDIR=${0%/*}

sleep 20
`pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-40`/lib/arm/libbootstrap.so
