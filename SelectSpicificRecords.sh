#!/bin/bash

function getTableHeader
{
    metaData_file_path=$1;
    tableHeader="";
    for rowHeader in `cut -f1 -d: $metaData_file_path | cat`
    do
        tableHeader=${tableHeader}${rowHeader}',';
    done
    tableHeader=${tableHeader::-1};
    echo $tableHeader;
}



dataFilePath="./Databases/${current_DB}/Data/${current_table}";
metadataFilePath="./Databases/${current_DB}/MetaData/${current_table}.metadata";

echo "enter column name to set a conidition on: ";
read col;

ret=$( cut -d: -f1 ${metadataFilePath} | grep ${col}; );
if [[ ${ret} == ${col} ]] ; then
    #column found

    colNum=$(awk -F: -v c=$col '{if(c == $1){print NR}}' $metadataFilePath);
    echo "Enter value to be compared with: ";
    read val;
    tableHeader=$(getTableHeader $metadataFilePath);
    recods=`awk -F, -v colNumber=$colNum -v value=$val '{if($colNumber == value){printf "%s\n",$0}}' ${dataFilePath} | cat`;
    if [[ $recods != "" ]] ; then 
        #not Empty
        #column -t -o '|' -s, -N $tableHeader < $recods;
        echo "$recods" | column -t -o '|' -s, -N $tableHeader;
    else
        #No recods found matching this condition
        echo 'No recods found matching this condition';
    fi
else
    echo 'No such column';
fi