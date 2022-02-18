#!/bin/bash
clear;

tableName=$current_table;


mt=$( gawk -F';' '{ print $1 }' Databases/$current_DB/MetaData/$tableName.metadata | paste -s -d, - );

#awk '{print $2}' file.txt | paste -s -d, -

#echo "METADATA $mt"

echo "  "
echo "  "
column -t -o '   |' -s, -N $mt  Databases/$current_DB/Data/$tableName;

echo "$LOGNAME select All from $current_table table in $(date)" >> dbms.log
