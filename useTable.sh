#!/bin/bash

clear;

function useTableMainMenu
{
    echo "Selected Table is: $current_table";
    while [[ "$option" != "Go back" ]] 
    do
    select option in "Insert" "Delete Record" "Select All Table" "Select Column" "Select Record" "Go back"
    do
        case $option in
            "Insert") . ./insertIntoTable.sh;break ;;
            "Delete Record") . ./deleteRecord.sh; break;;
            "Select All Table") . ./select.sh; break;;
            "Select Column") . ./dropTable.sh; break ;;
            "Select Record") . ./SelectSpicificRecords.sh; break ;;
            "Go back") break ;;
            *) echo -e "\033[44m Invalid option $REPLY , choose again \033[m";;
        esac
    done
    done
}


. ./showTables.sh;

echo '';
echo -e "\033[32mEnter table Name  \033[m" 
read current_table;

if [[ -f ./Databases/$current_DB/Data/$current_table ]] && [[ -f ./Databases/$current_DB/MetaData/${current_table}.metadata  ]] ; then
    echo "";
echo -e "\033[32mTable \"${current_table}\" is selected successfully  \033[m" 
    export current_table;
    useTableMainMenu;
else
  
echo -e "\033[44m Error, no such table! \033[m"
fi
