#!/bin/bash

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
