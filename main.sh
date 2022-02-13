#!/bin/bash

#echo $(date)

#options=("Show Databases" "Create DataBase"  "Use DataBase" "Drop DataBase" "Exit")
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
			       	. ./dropDatabse.sh;  break;;
		
			"Exit") (( i=0  ))  ; break ;;

			*) echo "..............................................";
			   echo "|Invaild Option Please choose one of the menu|";
			   echo "..............................................";
		   	   ;;
			

		esac 
	

	done
 
done
#echo "..........."
#echo "|thank you|"
#echo "..........."  
