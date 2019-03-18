#!/bin/bash

#clean_ics.sh
#Finds and removes all VAlarms from the ics file. Generates a file called temp_out that has all of the VAlarms removed.
#Step 2 of the ics cleaning process. Utilizes a while loop and sed to remove nasty valarms and vevents. These pests are common in ics files and do not translate well to html tables, so we find and eliminate any instances of them. This script differs from generate_html because it selects bad vevents which appear within valarms. The target ics file is loaded into a temporary ics file (clean_out_2.ics) and in place sed calls are made to remove offending lines. clean_ics.sh is called during the build procedure of the makefile.

file_name_out=$(basename $1)
file_name_out+=".temp"

rm -f temp_out

start_copy_line=1
start_line=1
current_line=1

touch temp_out

while read line; do
    if [[ "$line" == "BEGIN:VALARM" ]]
    then
        start_line=$((current_line))
    elif [[ "$line" == "END:VALARM" ]]
    then
	echo "$(sed -n "$start_copy_line, $((start_line-1)) p" $1)" >> temp_out
	start_copy_line=$((current_line+1))
    fi
    current_line=$((current_line+1))
done < $1

line_num=$(cat $1 | wc -l)
echo "$(sed -n "$start_copy_line, $line_num p" $1)" >> temp_out

current_line=1
while read line; do
    if [[ "$line" == "BEGIN:VEVENT" ]]
    then
        sed -i "1, $((current_line-1))d" temp_out
        head -n -1 temp_out > $file_name_out
        exit 0
    else
        current_line=$((current_line+1))
    fi
done < temp_out
