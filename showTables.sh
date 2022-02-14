#!/bin/bash

dir="$(pwd)/Databases/${current_DB}/Data/";


if [[ -d ${dir} ]] ; then

    echo 'Tables: '
    if [[ $(ls "${dir}") ]] ; then  #Checks if the directory containing the tables emapty or not
        ls "${dir}";
        echo "$LOGNAME viewed tables of \"${current_DB}\" in $(date)" >> dbms.log;
    else    #Directory containing tables is empty
        echo "Database \"${current_DB}\" has no tables yet";
    fi
else
    echo 'Error in this database, the tables folder has been deleted';
fi
