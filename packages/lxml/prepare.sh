#!/bin/bash

pwd
ls -al
uname -a
cat /proc/cpuinfo |grep "name" |cut -f2 -d: |uniq -c
free -m -h

yum install -y libxslt-devel
yum install -y libxml2-devel
