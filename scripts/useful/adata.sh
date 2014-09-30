#!/bin/bash
cat_file=""
table=$1
table_file="$1.sql"
curDir=`pwd`
echo "" > $curDir/$table_file
#exit
for dir in `find ./2014* -type d`;
	do
		cd $dir;
		cat_file="$dir-seizure-duration.txt"
		fileDir="$( cd "$( dirname "$cat_file" )" && pwd )"
		fullName="$fileDir${cat_file:1}"
		echo $fileDir
#		echo $fullName
		cat part*.txt > $cat_file
#		rm -rf part*.txt
#		echo "LOAD DATA LOCAL INPATH '$fullName' INTO TABLE $table;" | tee -a ../$table_file
		cd ..;
	done




