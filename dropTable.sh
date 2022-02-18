#!/bin/bash

. ./showTables.sh

dir="$(pwd)/Databases/${current_DB}/";

echo '';
echo -e "\033[32m  Enter Table name:   \033[m" 
read tableName;

if [[ -f ${dir}/Data/${tableName} ]] &&  [[ -f "${dir}/MetaData/${tableName}.metadata" ]] ; then
    #Both table files exist
    rm "${dir}/Data/${tableName}"
    rm "${dir}/MetaData/${tableName}.metadata"
echo -e "\033[33m  Table Droped Successfully  \033[m" 
    echo '';
    echo "$LOGNAME dropped table \"${tableName}\" from database \"${current_DB}\" in $(date)" >> dbms.log
elif [[ -f ${dir}/Data/${tableName} ]] ; then
    #only table data file exists
    rm "${dir}/Data/${tableName}"
    echo 'Found and removed table data only, table metadata does not exist';
    echo "$LOGNAME dropped table \"${tableName}\" data only from database \"${current_DB}\" in $(date)" >> dbms.log
elif [[ -f "${dir}/MetaData/${tableName}.metadata" ]] ; then
    #only table metadata file exists
    rm "${dir}/MetaData/${tableName}.metadata"
echo -e "\033[31m  Found and removed table metadata only, table actual data does not exist  \033[m" 
    echo '';
    echo "$LOGNAME dropped table \"${tableName}\" metadata only from database \"${current_DB}\" in $(date)" >> dbms.log
else
    #Both files does not exist (Table not found)
echo -e "\033[31m  No Such table!!  \033[m" 
    echo ''
fi
