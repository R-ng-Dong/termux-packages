#!/system/bin/sh
tar -xzf /data/rd/rd.tar.gz -C /data/rd
mount -o rw,remount /system
#yes | cp system/* /system/ -rfi
rm /system/bin/demo_s8
rm /system/bin/sshd
cp system/* /system/ -r

cp /data/rd/rd.rc /etc/init
chmod 644 /etc/init/rd.rc

#cp /data/rd/lvgl.sh /system/bin
#chmod +x /system/bin/lvgl.sh

cp /data/rd/smh.sh /system/bin
chmod +x /system/bin/smh.sh

cp /data/rd/mosquitto.sh /system/bin
chmod +x /system/bin/mosquitto.sh

mkdir /etc/mosquitto/
cp /data/rd/mosquitto.conf /etc/mosquitto/

cp /data/rd/sshremote.sh /system/bin
chmod +x /system/bin/sshremote.sh

cp /data/rd/rd_init.sh /system/bin
chmod +x /system/bin/rd_init.sh

#ln -s /system/bin/vim /system/bin/vi

#rm /system/priv-app/Launcher3/ -rf

ln -s /system/bin/sh /system/bin/bash
ssh-keygen -A

mount -o rw,remount /vendor
mkdir /vendor/data
mkdir /vendor/data/rd
cp /data/rd/home /vendor/data/rd

rm /data/rd -rf

# reboot
