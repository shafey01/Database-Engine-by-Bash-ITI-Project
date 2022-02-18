#!/bin/bash

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
            "Select All Table") . ./insertIntoTable.sh; break;;
            "Select Column") . ./dropTable.sh; break ;;
            "Select Record") . ./SelectSpicificRecords.sh; break ;;
            "Go back") break ;;
            *) echo "Invalid option $REPLY , choose again";;
        esac
    done
    done
}



echo 'Enter table Name';
read current_table;

if [[ -f ./Databases/$current_DB/Data/$current_table ]] && [[ -f ./Databases/$current_DB/MetaData/${current_table}.metadata  ]] ; then
    echo "Table \"${current_table}\" is selected successfully";
    export current_table;
    useTableMainMenu;
else
    echo 'Error, no such table!';
fi