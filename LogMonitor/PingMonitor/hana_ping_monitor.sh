#!/bin/bash

LOGFILE=/data/Splunk/SplunkLogMonitor/PingMonitor/hana_ping_monitor_results.log
VIP=/data/Splunk/SplunkLogMonitor/PingMonitor/hana_ping_monitor_vips
HOST=/data/Splunk/SplunkLogMonitor/PingMonitor/hana_ping_monitor_hosts

IFS=$IFS,
cat $VIP |  while read name ip app
do
    ssh -nl root -q $name ping -c 1 $ip > /dev/null
    if [ $? -eq 0 ]; then
        echo "date=`date` hostname=$name Application=$app VIP=$ip status=OK"
    else
        echo "date=`date` hostname=$name Application=$app VIP=$ip status=FAILED"
    fi
done > $LOGFILE

cat $HOST |  while read name ip app
do
    ping -c 1 "$ip" > /dev/null
    if [ $? -eq 0 ]; then
        echo "date=`date` hostname=$name Application=$app IP=$ip status=OK"
    else
        echo "date=`date` hostname=$name Application=$app IP=$ip status=FAILED"
    fi
done >> $LOGFILE
