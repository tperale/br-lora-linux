#!/bin/bash
ADDR=192.168.0.100

SSH="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
SCP="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

$SSH root@$ADDR 'mount /dev/mmcblk0p1 /mnt'
$SCP output/beaglebone_lora/images/am335x-boneblack.dtb root@$ADDR:/mnt/am335x-boneblack.dtb
$SCP output/beaglebone_lora/images/zImage root@$ADDR:/mnt/zImage
$SSH root@$ADDR 'umount /mnt'
$SSH root@$ADDR 'reboot'
