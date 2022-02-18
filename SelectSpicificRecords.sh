#!/bin/bash

function getTableHeader
{
    metaData_file_path=$1;
    tableHeader="";
    for rowHeader in `cut -f1 -d: $metaData_file_path`
    do
        tableHeader=${tableHeader}${rowHeader}',';
    done
    tableHeader=${tableHeader::-1};
    echo $tableHeader;
}

echo "$LOGNAME select from $current_table in $(date)" >> dbms.log

dataFilePath="./Databases/${current_DB}/Data/${current_table}";
metadataFilePath="./Databases/${current_DB}/MetaData/${current_table}.metadata";

echo " ";
echo -e "\033[32mEnter column name to set a conidition on: \033[m" 
read col;

ret=$( cut -d: -f1 ${metadataFilePath} | grep ${col}; );
if [[ ${ret} == ${col} ]] ; then
    #column found

    colNum=$(gawk -F: -v c=$col '{if(c == $1){print NR}}' $metadataFilePath);
echo -e "\033[32mEnter value to be compared with: \033[m" 
    echo " ";
    read val;
    tableHeader=$(getTableHeader $metadataFilePath);
    recods=`gawk -F, -v colNumber=$colNum -v value=$val '{if($colNumber == value){printf "%s\n",$0}}' ${dataFilePath}`;
    if [[ $recods != "" ]] ; then 
        #not Empty
        #column -t -o '|' -s, -N $tableHeader < $recods;
        echo "$recods" | column -t -o '|' -s, -N $tableHeader;
    else
        #No recods found matching this condition
        echo '';
echo -e "\033[31m No recods found matching this condition \033[m" 
    fi
else
    echo '';
echo -e "\033[31m No such column \033[m" 
fi
