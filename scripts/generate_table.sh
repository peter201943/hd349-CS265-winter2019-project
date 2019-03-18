#!/bin/bash

path=$(dirname $0)

result=""
result+="<html><head><style>table, th, td { border: 1px solid black; }</style></head><body><table><tr>"

while read line; do
    result+="<th>$line</th>"
done < headers
table+="</tr>"

result+=$(cat $1 | $path/generate_table.awk)
result+="</table></table>"
echo $result > out.html
