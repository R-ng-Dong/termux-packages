#!/system/bin/sh

if [[ `ls /data/rd/home/.termux_authinfo 2> /dev/null` ]]; then
	echo "RAL start";
else
	echo "RAL init config";
	cp /vendor/data/* /data/ -r
	wm overscan 0,0,-96,0
	service call alarm 3 s16 Asia/Ho_Chi_Minh
	# sleep 5
	pm grant net.sanapeli.adbchangelanguage android.permission.CHANGE_CONFIGURATION
	am start -n net.sanapeli.adbchangelanguage/.AdbChangeLanguage -e language vi
fi

service call bluetooth_manager 6
pm grant vn.com.rangdong.fastscan android.permission.ACCESS_FINE_LOCATION
am start-foreground-service vn.com.rangdong.fastscan/.Service.MyBleService
