#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

#{
#uid=`id -u`
#if [ x"$uid" != x"2000" ]; then
#    echo "cannot be run as non-shell" >&2
#    exit 1
#fi

#context=`id -Z`
#if [ x"$context" != x"context=u:r:shell:s0" ];then
#    echo "cannot be run as non-shell" >&2
#    exit 1
#fi

#apk=`pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-`
#if [ x"$apk" == x"" ]; then
#    echo "cannot find brevent" >&2
#    exit 1
#else

#kill exist server pid
    export IFS=" /";
    netstat -tlnp 2>/dev/null | grep 59526 | while read pr rq sq la fa st pid pn; do
        if [ ! -d /proc/$pid ]; then
            echo "cannot find pid $pid" >&2
            exit 2
        fi
        echo "kill $pid"
        kill $pid
        if [ ! -d /proc/$pid ]; then
            echo "cannot kill $pid" >&2
            exit 2
        fi
    done

###help needed
#export succeed
export CLASSPATH=`pm path me.piebridge.brevent | tr -d '\r\n' | cut -b 9-`
#exec fail
exec app_process /system/bin me.piebridge.brevent.server.Brevent "$@" &
###

#checking part
#    echo -n "checking..."
#    for x in 1 2 3 4 5 6 7 8 9 10; do
#        sleep 1
#        if netstat -tlnp 2>/dev/null | grep -q 59526; then
#            echo "successfully" >&2
#            exit 0
#        fi
#        echo -n "."
#    done
#    echo ""
#    echo "cannot listen port, please report bug" >&2
#    exit 3
#fi

#} > $MODDIR/log.txt &
