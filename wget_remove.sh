#!/bin/bash

rm -f clean_out_3

touch clean_out_3

while read line; do
	bad_lines=grep -nr "www\|http\|.com\|.org\|.edu\|.io\|.net\|.biz\|.ai\|.eu\|.kr\|.jp\|"
	for bad_line in $bad_lines;do
		sed -n $bad_line
	done
	
done < $1

line_num=$(cat $1 | wc -l)
echo "$(sed -n )" >> clean_out_3
