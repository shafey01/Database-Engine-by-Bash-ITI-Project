#!/bin/bash 

echo "Enter your Database name"

read newdbname

if mkdir Databases/$newdbname > dbms.log 2>&1 ;
then
echo "$LOGNAME created new database $newdbname in $(date)" >> dbms.log;
mkdir Databases/$newdbname/Data;
mkdir Databases/$newdbname/MetaData;
echo "your $newdbname created succesfully.";
else
	echo "sorry there is a problem in creation call admin to see logs."
fi

