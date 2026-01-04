#/bin/bash

time=$(date +%d-%m-%y-%H)

disk_status=$(df -h  | grep /dev/mapper/ubuntu--vg-ubuntu--lv | awk '{print $5}' | tr -d %)


if [ "$disk_status" -le 50 ]
then
    echo "$disk_status is Good"
else
    cd # /root/lect28/log    first create log dir then copy auth.log file to that dir
    tar cvf - auth.log | gzip -c > /root/lect28/log/auth.log-$time.tgz
    echo "" > auth.log
    echo "Var log alert has been archived"
fi

#See 7. in README.md to copy auth.log to log dir/folder using cp command

: <<'COMMENT'
This script is a custom Log Rotation and Monitoring tool.
It acts like a "pressure relief valve" for your server: when disk usage gets too high,
it shrinks your logs to prevent a system crash.

            Summary of the Workflow
Step        Action              Logic  
Check	    Measure Disk %	    Is it > 50?
Backup	    Tar & Gzip          Save the old data in a small, timestamped file.
Clear	    Nullify File	    Empty the original file to free up disk space.
Report      Echo message        Inform the user that the archive is complete.

COMMENT