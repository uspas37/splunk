#!/bin/sh
# Start CC3 SAP App Instance
# AID 163074

now=$(date +"%m_%d_%Y_%H%M%S")
log=/opt/BESClient/CC3_STARTALL_$now.log

echo "*** Starting CC3 SAP App Instance ***" > $log 2>&1
su - cc3adm -c 'startsap r3' >> $log 2>&1

# Success Criteria 3 ways to check:
# 1. su - cc3adm -c 'stopsap check CC3' | grep "is running" > /dev/null
# 2. ps -ef | grep [d]w.sapCC3 > /dev/null
# 3. grep "started" $log > /dev/null
if [ $? -eq 0 ]
then
  echo "Success"
else
    echo "Failure" >&2
fi
