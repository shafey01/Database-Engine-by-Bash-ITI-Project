#!/bin/bash

dataFilePath="./Databases/${current_DB}/Data/${current_table}";
metadataFilePath="./Databases/${current_DB}/MetaData/${current_table}.metadata";

echo "enter column name: ";
read col;

ret=$( cut -d: -f1 ${metadataFilePath} | grep ${col}; );
if [[ ${ret} == ${col} ]] ; then
    #column found
    colNum=$(awk -F: -v c=$col '{if(c == $1){print NR}}' $metadataFilePath);
    echo "Enter value to be deleted: ";
    read val;
    awk -i inplace -F, -v colNumber=$colNum -v value=$val '{if($colNumber != value){print $0}}' ${dataFilePath};
echo "$LOGNAME delete from $current_table table in $(date)" >> dbms.log
else
    echo 'No such column';
fi
