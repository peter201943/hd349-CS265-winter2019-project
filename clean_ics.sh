#!/bin/bash

rm -f clean_out_2 

start_copy_line=1
start_line=1
current_line=1

touch clean_out_2

while read line; do
    if [[ "$line" == "BEGIN:VALARM" ]]
    then
        start_line=$((current_line))
    elif [[ "$line" == "END:VALARM" ]]
    then
	echo "$(sed -n "$start_copy_line, $((start_line-1)) p" $1)" >> clean_out_2
	start_copy_line=$((current_line+1))
    fi
    current_line=$((current_line+1))
done < $1

line_num=$(cat $1 | wc -l)
echo "$(sed -n "$start_copy_line, $line_num p" $1)" >> clean_out_2
