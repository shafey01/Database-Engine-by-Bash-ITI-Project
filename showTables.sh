#!/bin/bash

clear;

dir="$(pwd)/Databases/${current_DB}/Data/";


if [[ -d ${dir} ]] ; then

    echo -e "\033[32m Tables: \033[m"
    if [[ $(ls "${dir}") ]] ; then  #Checks if the directory containing the tables emapty or not
       		echo " ";
	    ls "${dir}";
	    echo " "
        echo "$LOGNAME viewed tables of \"${current_DB}\" in $(date)" >> dbms.log;
    else    #Directory containing tables is empty
        echo "Database \"${current_DB}\" has no tables yet";
    fi
else
    echo 'Error in this database, the tables folder has been deleted';
fi
