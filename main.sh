#!/bin/bash

#echo $(date)
#options=("Show Databases" "Create DataBase"  "Use DataBase" "Drop DataBase" "Exit")

clear;

#PS3="MyDBMS>>  ";

#export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01';

export PS3=$'\e[01;33mMyDBMS: \e[0m'
let -i i=1
while [[ $i != 0 ]]
do
	select option in "Show Databases" "Create Database"  "Use Database" "Drop Database" "Exit"
	do
		case $option in 

			"Show Databases") echo "$LOGNAME show databases in $(date)" >> dbms.log;
			       	. ./showDatabase.sh; break  ;;
			"Create Database") echo "$LOGNAME create databases in $(date)" >> dbms.log;
			      	. ./createDatabase.sh; break  ;;
			"Use Database")   echo "$LOGNAME use  databases in $(date)" >> dbms.log;
			       	. ./useDB.sh;  break;;
			"Drop Database") echo "$LOGNAME drop databases in $(date)" >> dbms.log;
			       	. ./dropDB.sh;  break;;
		
			"Exit") (( i=0  ))  ; clear; break ;;

			*) echo -e "\033[44m ................................................. \033[m"
			  # echo "|Invaild Option Please choose one of the menu|";
			   echo -e "\033[31m | Invaild Option Please choose one of the menu |  \033[m";
echo -e "\033[44m ................................................. \033[m"			   

		   	   ;;
			

		esac 
	

	done
 
done
#echo "..........."
#echo "|thank you|"
#echo "..........."  
