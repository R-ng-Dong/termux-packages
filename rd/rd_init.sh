#!/system/bin/sh

if [[ `ls /data/rd/home/.termux_authinfo 2> /dev/null` ]]; then
	echo "File exists";
else
	echo "File doesn't exist";
	cp /vendor/data/* /data/ -r
fi