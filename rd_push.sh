#!/bin/sh

adb root
adb shell su -c mkdir /data/rd
adb push rd.tar.gz /data/rd
adb push rd/* /data/rd
# adb shell su -c /data/rd/rd_init_android.sh