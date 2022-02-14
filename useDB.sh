#!/bin/bash

#useDatabaseMenu
useDatabaseMainMenu(){
    echo "Selected Database is: $current_DB";
    options=("Show Tables" "Create New Table" "Delete existing Table" "Insert into Table" "Update Table" "Select from Table" "Return to main menu");
    while [[ "$option" != "Return to main menu" ]] 
    do
    select option in "${options[@]}"
    do
        case $option in
            "Show Tables") . ./showTables.sh;break ;;
            "Create New Table") . ./createTable.sh; break;;
            "Insert into Table") . ./insertIntoTable.sh; break;;
            "Drop existing Table") . ./deleteTable.sh; break ;;
            "Update Table") . ./updateTable.sh; break ;;
            "Select from Table") . ./selectFromTable.sh; break;;
            "Return to main menu") . ./main.sh; exit $? ;;
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
