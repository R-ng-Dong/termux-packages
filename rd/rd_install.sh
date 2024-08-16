#!/system/bin/sh

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

# openssl req -x509 -newkey rsa:4096 -keyout /etc/mosquitto/mosquitto.key -out /etc/mosquitto/mosquitto.crt -days 365 -nodes
openssl req -x509 -newkey rsa:4096 -keyout /etc/mosquitto/mosquitto.key -out /etc/mosquitto/mosquitto.crt -days 365 -nodes \
-subj "/C=VN/ST=HN/L=HN/O=Unknown/OU=Unknown/CN=rangdong"


KEY="RANGDONGRALSMART"
KEY_HEX=$(echo -n "$KEY" | xxd -p | tr -d '\n')
MAC=$(ip link show eth0 | grep ether | cut -d' ' -f6 | tr -d ':' | tr 'A-F' 'a-f')
INPUT_DATA="2804$MAC"
OUTPUT_FILE="/etc/mosquitto/password.txt"

ENCRYPTED_DATA=$(echo -n "$INPUT_DATA" | openssl enc -aes-128-ecb -K $KEY_HEX -nosalt | xxd -p | tr 'a-f' 'A-F' | tr -d '\n ')
echo -n "RD:$ENCRYPTED_DATA" > $OUTPUT_FILE
mosquitto_passwd -U $OUTPUT_FILE

reboot
