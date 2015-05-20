#!/bin/bash

clear
smartctl -t short /dev/$1
badblocks -b 4096 -wsv /dev/$1
sleep 60
smartctl -l selftest /dev/$1
smartctl -d ata -i /dev/$1

