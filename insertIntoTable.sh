#!/bin/bash



dataFilePath="./Databases/${current_DB}/Data/${current_table}";
metadataFilePath="./Databases/${current_DB}/MetaData/${current_table}.metadata";

function retryOrCancel
{
    #options=("Retry" "Cancel");
    
    select option in "Retry" "Cancel"
    do
        case $option in
            "Retry")  return 0 ;;
            "Cancel") return 1 ;;
        esac
    done

}


function isNotNull
{
    typeset x=$1;
    if [[ $x =~ . ]] ; then
        return 0;
    else
        return 1;
    
    fi
}

function isNumber
{
    typeset x=$1;

    if [[ $x =~ ^[0-9]*$ ]] ; then
        return 0;
    else
        return 1;
    fi
}

function isUnique 
{
    typeset x=$1;
    typeset n=$2;
    ret=$( cut -d, -f${n} ${dataFilePath} | grep ${x}; );
    if [[ ${ret} == ${x} ]] ; then
        return 1;
    else
        return 0;
    fi
}

record="";

function readField
{
    typeset fieldNum=$1
    typeset fieldName=$2;
    typeset dataType=$3;
    typeset pk=$4;
    typeset nn=$5;
    typeset un=$6;
    typeset valid;
    #echo ${fieldNum}, ${fieldName}, ${dataType}, ${width}, ${pk}, ${nn}, ${un};
    (( valid = 0));
    (( aborted = 0 ))
    while [[ $valid -eq 0 ]]
    do
        echo "Input Field \"${fieldName}\":";
        read value;
        if [[ ${nn} == 1 ]] || [[ ${pk} == 1 ]] ; then  #Not null constrain
            if ! isNotNull $value ; then
                echo 'NULL';
                if retryOrCancel ; then
                    continue;
                else
                    ((aborted=1))
                    break;
                fi
            fi
        fi
        if [[ ${un} == 1 ]] || [[ ${pk} == 1 ]] ; then  #Unique constrain
            if ! isUnique $value $fieldNum  ; then
                echo 'Is not Unique';
                if retryOrCancel ; then
                    continue;
                else
                    ((aborted=1))
                    break;
                fi
            fi
        fi
        echo ${dataType};
        if [[ ${dataType} == "int" ]] ; then
            if  ! isNumber $value  ; then
                echo 'Is not a number';
                if retryOrCancel ; then
                    continue;
                else
                    ((aborted=1))
                    break;
                fi
            fi
        fi

        ((valid=1));
    done
    if [[ ${valid} == 1 ]] ; then
        record=${record}${value}',';
    fi
    return $valid;
}


echo "Inserting into: \"${current_table}\"";
((i=1))

for line in `cat ${metadataFilePath}`
do
  name=$( echo "$line" | cut -d\: -f1 );
  dataType=$( echo "$line" | cut -d\: -f2 );
  pk=$( echo "$line" | cut -d\: -f3 );
  un=$( echo "$line" | cut -d\: -f4 );
  nn=$( echo "$line" | cut -d\: -f5 );
  readField ${i} ${name} ${dataType} ${pk} ${nn} ${un};
  if [[ ${aborted} == 1 ]]  ; then
    break;
  fi
  ((i++));
done

if [[ ${aborted} == 0 ]] ; then
    record=${record::-1}    #Remove the last char (the last comma)
    echo $record >> $dataFilePath; #Admit to the datafile
    echo 'Record Saved Successfully!';
fi




