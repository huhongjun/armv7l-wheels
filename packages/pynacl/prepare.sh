#!/bin/bash

pwd
ls -al
uname -a
cat /proc/cpuinfo |grep "name" |cut -f2 -d: |uniq -c
free -m -h
