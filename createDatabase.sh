#!/bin/bash 
clear;

echo -e "\033[35mEnter your Database name \033[m" 
read newdbname

if mkdir Databases/$newdbname > dbms.log 2>&1 ;
then
echo "$LOGNAME created new database $newdbname in $(date)" >> dbms.log;
mkdir Databases/$newdbname/Data;
mkdir Databases/$newdbname/MetaData;

echo -e "\033[32m  your $newdbname created succesfully.  \033[m" 
else

echo -e "\033[31msorry there is a problem in creation see logs. \033[m" 
echo " "
fi

