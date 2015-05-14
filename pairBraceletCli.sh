#!/bin/sh
i=0
KEY_WORD=""
hcitool scan | awk '{ print $1}' > ./BLE_MAC
#ps | awk '{ print $1}' > ./BLE_MAC

test-discovery & >>/dev/null
sleep 5

exec < ./BLE_MAC
while read MAC
do
	if [ "$i" = 0 ]; then
		i=1
	else
		echo $MAC
		filter = $(sdptool browse $MAC) | grep $KEY_WORD
		#echo $filter
		if [ -n $filter ]; then
		simple-agent hci0 $MAC
		echo $MAC connected
		#communicate by rfcomm
		rfcomm()
		fi
	fi
done

killall test-discovery

function rfcomm(){
	rfcomm connect 0 $MAC 22 &
	cat /dev/rfcomm0
	echo "Hello" > /dev/rfcomm0
}
