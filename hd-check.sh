#!/bin/bash

clear
smartctl -t short /dev/$1
badblocks -b 4096 -wsv /dev/$1 | tee $1_results.txt
sleep 60
smartctl -l selftest /dev/$1 | tee -a $1_results.txt
smartctl -d ata -i /dev/$1 | tee -a $1_results.txt

