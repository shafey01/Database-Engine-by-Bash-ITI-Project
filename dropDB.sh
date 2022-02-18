#!/bin/bash

. ./showDatabase.sh;

echo 'Enter Database name to be deleted: ';

read databaseName;

if [[ -z $databaseName  ]]; then
    echo -e "\033[33mPlease Write Database Name \033[m" 
elif [[  -d ./Databases/$databaseName/  ]] ; then
    #Database exists
    rm -r "./Databases/$databaseName/"
    echo "Database \"${databaseName}\" is deleted successfuly";
else
    #Database deosn't exist
echo -e "\033[31m Couldn't find database with name: \"$databaseName\" \033[m";
fi

