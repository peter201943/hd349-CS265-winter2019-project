#!/bin/bash

if [ -f $1 ]
then
    ./get_table_headers.sh $1 
else
    echo "Unable to find file " $1
fi

count=0
start_line=0
current_line=0

touch clean_out 

# extract out all the stuff in-between. Once you get to an END:VEVENT, you need to work your magic
# with the table headers
while read line; do
    if [[ "$line" == "BEGIN:VEVENT" ]]
    then
        start_line=$current_line
    elif [[ "$line" == "END:VEVENT" ]]
    then
        # currently nonfunctional. There's a bug where you literally just get
        # a bunch of BEGIN:VEVENT 
        # END:VEVENT in succession with a blank line in-between. Will need to check to see where bug is
        echo $line
        echo "BEGIN:VEVENT" >> clean_out
        echo "$(sed -n "$start_line,$current_line p" $1)" >> clean_out
        echo "END:VEVENT" >> clean_out
    else
        arr[$count]="$line"
        count=$((count + 1))
    fi
    current_line=$((current_line+1))
done < $1


