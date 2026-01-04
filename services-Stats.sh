#!/bin/bash

echo "enter your service"
read service_name
STATUS=$(systemctl is-active $service_name)

if [[ $STATUS == "active" ]]
then
    echo "$service_name service is running"
else
    echo "Sorry..!! $service_name service is not running"
    #echo "Sorry..!! $service_name service is not running" | mail -s "Service Down $service_name | ALERT"  pinkoosagi@gmail.com
    exit 1
fi

: <<'COMMENT'
You can also send mail alert if service is down by uncommenting the mail line above and configuring inmailer on your server.
can crosscheck if the mail status by --> less /var/log/mail.log
COMMENT

