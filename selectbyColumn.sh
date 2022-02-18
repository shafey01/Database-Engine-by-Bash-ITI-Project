#!/bin/bash

clear;

#echo "Enter column name"
 echo -e "\033[3m Enter column name \033[m" 

read col





mt=$( gawk -F';' -v c=$col ' {if( c==$1 ){ print NR }}  '  Databases/$current_DB/MetaData/$tableName.metadata );


echo "META $mt"





 gawk -v x=$mt -F',' '{ print $x }'  Databases/$current_DB/Data/name ;


