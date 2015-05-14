#!/bin/sh
SERVICE=""
BNEP=""
rfkill unblock bluetooth
systemctl start connman
connmanctl enable bluetooth
while :
do
BNEP=$(ifconfig|grep bnep)
SERVICE=$(connmanctl services| awk '{print $3}')
echo $BNEP
if [ -z $BNEP ] && [ ! -z $SERVICE ];then
echo $SERVICE
connmanctl connect $SERVICE
fi
sleep 5
done


