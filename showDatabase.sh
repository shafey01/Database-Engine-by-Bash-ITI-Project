#!/bin/bash

dir="$(pwd)/Databases"

if [ -d "$dir"  ] && [ "$(ls -A $dir)"  ]; then

echo "$LOGNAME show databases in $(date)" >> dbms.log
echo " "
echo "List of Databases:";
echo " "
echo "......................................................................................"
echo " "
ls  $dir
echo " "
echo "......................................................................................"
echo " " 
else
echo " "
echo "NO Databases to show"
echo " " 


fi

