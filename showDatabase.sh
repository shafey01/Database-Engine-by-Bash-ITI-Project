#!/bin/bash

clear;

dir="$(pwd)/Databases"

if [ -d "$dir"  ] && [ "$(ls -A $dir)"  ]; then

echo "$LOGNAME show databases in $(date)" >> dbms.log
echo " "
echo -e "\033[32m List of Databases:  \033[m" 
#echo "List of Databases:";
echo " "
echo -e "\033[44m ........................................................................... \033[m"
echo " "
ls -l "$dir" | grep '^d' | cut -d' '  -f9
echo " "
echo -e "\033[44m ........................................................................... \033[m"
echo " " 
else
echo " "
echo "$LOGNAME show databases in $(date)" >> dbms.log
#echo "NO Databases to show"
echo -e "\033[4m NO Databases to show  \033[m" 
echo " " 


fi

