#!/bin/bash
mdadm --create --verbose /dev/md0 -l10 -n5 /dev/sd{b,c,d,e,f}
mkdir /etc/mdadm
echo "DEVICE partitons" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
