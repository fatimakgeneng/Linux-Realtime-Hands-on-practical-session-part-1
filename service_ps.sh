#!/bin/bash

echo "ENTER THE SERVICE NAME"
read service_name

count=$(ps -ax  | grep $service_name  | grep -v grep | wc -l)

if [[ "$count" != "0" ]]
then
echo "$service_name service is running, Everything is fine...!!!"
else
echo "$service_name is not running due to some problem"
fi