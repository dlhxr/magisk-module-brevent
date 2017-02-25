#!/system/bin/sh
MODDIR=${0%/*}

if getprop ro.product.cpu.abilist | grep -q x86; then
    abi=x86
else
    abi=arm
fi

sleep 20

`pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-40`/lib/$abi/libbootstrap.so
