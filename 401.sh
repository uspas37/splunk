#!/bin/sh
# Start CC3 DB2 DB
# AID 163074

now=$(date +"%m_%d_%Y_%H%M%S")
log=/opt/BESClient/CC3_STARTALL_$now.log

echo "*** Starting NC6 DB2 ***" >> $log 2>&1
su - db2cc3 -c 'db2start' >> $log 2>&1

# Success Criteria 2 ways to check:
# 1. ps -ef | grep [d]b2cc3 > /dev/null
# 2. grep "DB2START processing was successful" $log > /dev/null
if [ $? -eq 0 ]
then
  echo "Success"
else
    echo "Failure" >&2
fi
