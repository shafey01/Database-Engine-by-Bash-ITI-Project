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

echo -e "\033[36m Database \"${current_DB}\" has no tables yet \033[m" 
        echo "";
    fi
else
    echo '';
echo -e "\033[31m Error in this database, the tables folder has been deleted \033[m" 
fi
