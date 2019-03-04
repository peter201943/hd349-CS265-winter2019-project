#!/bin/bash

rm -f clean_out_2

if [ -f $1 ]
then
    ./get_table_headers.sh $1 
else
    echo "Unable to find file " $1
fi

count=0
start_line=1
current_line=1

touch clean_out_2

# extract out all the stuff in-between. Once you get to an END:VEVENT, you need to work your magic
# with the table headers
while read line; do
    if [[ "$line" == "BEGIN:VEVENT" ]]
    then
        start_line=$((current_line+1))
    elif [[ "$line" == "END:VEVENT" ]]
    then
        # Okay, now you need to pad the empty fields with whatever you just chopped.
        echo "BEGIN:VEVENT" >> clean_out_2
        echo "sed -n $start_line, $((current_line-1)) p $1"

        echo "$(sed -n "$start_line,$((current_line-1)) p" $1)" > clean_out_temporary_2
        ./pad_empty_fields.sh clean_out_temporary_2 >> clean_out_2

        echo "END:VEVENT" >> clean_out_2
    fi
    current_line=$((current_line+1))
done < $1

#cat clean_out
