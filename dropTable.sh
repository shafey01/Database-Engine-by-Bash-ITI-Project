#!/bin/bash

dir="$(pwd)/Databases/${current_DB}/";

echo 'Enter Table name: ';

read tableName;

if [[ -f ${dir}/Data/${tableName} ]] &&  [[ -f "${dir}/MetaData/${tableName}.metadata" ]] ; then
    #Both table files exist
    rm "${dir}/Data/${tableName}"
    rm "${dir}/MetaData/${tableName}.metadata"
    echo 'Table Droped Successfully';
    echo "$LOGNAME dropped table \"${tableName}\" from database \"${current_DB}\" in $(date)" >> dbms.log
elif [[ -f ${dir}/Data/${tableName} ]] ; then
    #only table data file exists
    rm "${dir}/Data/${tableName}"
    echo 'Found and removed table data only, table metadata does not exist';
    echo "$LOGNAME dropped table \"${tableName}\" data only from database \"${current_DB}\" in $(date)" >> dbms.log
elif [[ -f "${dir}/MetaData/${tableName}.metadata" ]] ; then
    #only table metadata file exists
    rm "${dir}/MetaData/${tableName}.metadata"
    echo 'Found and removed table metadata only, table actual data does not exist';
    echo "$LOGNAME dropped table \"${tableName}\" metadata only from database \"${current_DB}\" in $(date)" >> dbms.log
else
    #Both files does not exist (Table not found)
    echo 'No Such table'
fi
