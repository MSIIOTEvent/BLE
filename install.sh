#!/bin/sh

systemctl enable bluetooth
cp simple-agent /sbin
cp bluezutils.py /sbin
cp test-device /sbin
cp test-discovery /sbin
cp btup.service /lib/systemd/system/
systemctl enable /lib/systemd/system/btup.service

