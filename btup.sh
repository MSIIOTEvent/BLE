#!/bin/sh
SERVICE=""
BNEP=""
rfkill unblock bluetooth
systemctl start connman
connmanctl enable bluetooth
while :
do
BNEP=$(ifconfig|grep bnep)
SERVICE=$(connmanctl services| awk '{print $2}' | grep bluetooth)
if [ -z $SERVICE ];then
SERVICE=$(connmanctl services| awk '{print $3}' | grep bluetooth)
fi

echo $BNEP
if [ -z $BNEP ] && [ ! -z $SERVICE ];then
echo $SERVICE
connmanctl connect $SERVICE
fi
sleep 5
done


