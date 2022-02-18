#!/bin/bash

#useDatabaseMenu
clear;
useDatabaseMainMenu(){
    clear;
echo "  "
echo -e "\033[36mDatabase $current_DB is selected   \033[m" 
    
echo "   "

while [[ "$option" != "Return to main menu" ]] 
    do
    select option in "Show Tables" "Create New Table" "Drop existing Table" "Use Table" "Return to main menu"
    do
        case $option in
            "Show Tables") . ./showTables.sh;break ;;
            "Create New Table") . ./createTable; break;;
            "Drop existing Table") . ./dropTable.sh; break ;;
            "Use Table") . ./useTable.sh; break;;
            "Return to main menu")  break ;;
            *) echo -e "\033[31m Invalid option $REPLY , choose again \033[m";;

        esac
    done
    done

}


. showDatabase.sh;

echo -e "\033[33mIf database dosen't Exist you will return to main menu \033[m" 
echo ' ';
echo -e "\033[32mEnter Database name: \033[m" 
read current_DB;

if [[ -z $current_DB  ]]; then
echo -e "\033[33mPlease Write Database Name \033[m" 
echo " "
sleep 2;
. ./main.sh
fi

if [[  -d ./Databases/$current_DB/  ]]
then
    #Database exists
   

    export current_DB;
	useDatabaseMainMenu;
else
    #Database deosn't exist
    

echo -e "\033[31m Couldn't find database with name: $current_DB \033[m";
sleep 2;
 . ./main.sh
   
fi

