#!/bin/bash
ADDR=192.168.8.10

SSH="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

$SSH root@$ADDR 'reboot'
