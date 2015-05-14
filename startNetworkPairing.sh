#!/bin/sh

systemctl start connman
connmanctl enable Bluetooth
hciconfig hci0 piscan
simple-agent
hcivonfig hci0 pscan
