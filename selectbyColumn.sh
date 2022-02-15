#!/bin/bash


echo "Enter column name"

read col

#mt=$( gawk -v "mt=$col"  '{ if( $1==mt  ) { print NR } }' Databases/$current_DB/MetaData/$tableName.metadata )

#mt=$( gawk -F';' '{ print $1 }' Databases/$current_DB/MetaData/$tableName.metadata | paste -s -d, - );

mt=$( gawk -F';' -v c=$col ' {if( c==$1 ){ print NR }}  '  Databases/$current_DB/MetaData/$tableName.metadata );


echo "META $mt"



#column -t -o '|' -s, -N $mt  Databases/$current_DB/Data/$tableName;

 gawk -v x=$mt -F',' '{ print $x }'  Databases/$current_DB/Data/name ;


