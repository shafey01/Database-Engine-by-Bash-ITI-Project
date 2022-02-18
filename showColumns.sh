#!/bin/bash

metadataFilePath="./Databases/${current_DB}/MetaData/${current_table}.metadata";

column -t -o '   |' -s: -N Column_Name,Data_Type,isPrimaryKey,isUnique,isNotNull   $metadataFilePath;