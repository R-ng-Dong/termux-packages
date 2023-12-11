#!/system/bin/sh

su
tar -xzf /data/rd/rd.tar.gz -C /data/rd
mount -o rw,remount /system
mount -o rw,remount /vendor

chmod +x system/bin/*
chmod 644 etc/init/rd.rc

rm /system/bin/demo_s8
rm /system/bin/sshd
rm /system/priv-app/Launcher3/ -rf

cp system/* /system/ -r
cp vendor/* /vendor/ -r
cp etc/* /etc/ -r

ssh-keygen -A

rm /data/rd -rf

reboot
