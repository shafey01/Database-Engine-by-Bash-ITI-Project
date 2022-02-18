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
    recods="";
    rows=$(awk -F, -v colNumber=$colNum -v value=$val '{if($colNumber == value){print $0}}' ${dataFilePath});
    recods=$recods${rows};
    if [[ recods != "" ]] ; then 
        #not Empty
        column -t -o '|' -s, -N $tableHeader $dataFilePath;
    else
        #No recods found matching this condition
        echo 'No recods found matching this condition';
else
    echo 'No such column';
fi