#!/bin/bash

#useDatabaseMenu
useDatabaseMainMenu(){
    echo "Selected Database is: $current_DB";
    while [[ "$option" != "Return to main menu" ]] 
    do
    select option in "Show Tables" "Create New Table" "Drop existing Table" "Insert into Table" "Update Table" "Select from Table" "Use Table" "Return to main menu"
    do
        case $option in
            "Show Tables") . ./showTables.sh;break ;;
            "Create New Table") . ./createTable; break;;
            "Insert into Table") . ./insertIntoTable.sh; break;;
            "Drop existing Table") . ./dropTable.sh; break ;;
            "Update Table") . ./updateTable.sh; break ;;
            "Select from Table") . ./selectFromTable.sh; break;;
            "Use Table") . ./useTable.sh; break;;
            "Return to main menu")  break ;;
            *) echo "Invalid option $REPLY , choose again";;
        esac
    done
    done

}





echo 'Enter Database name: ';

read current_DB;

if [[ -d ./Databases/$current_DB/ ]]
then
    #Database exists
    echo "Database $current_DB is selected";
    export current_DB;
	useDatabaseMainMenu;
else
    #Database deosn't exist
    echo "Couldn't find database with name: $current_DB";
    . ./main.sh
fi
