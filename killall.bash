#!/bin/bash

#This kills valarms, vevents, and blank lines.

#Copies input to a temporary folder
killall_work.tmp=$mktemp()
echo "$(</dev/stdin)" > /killall_work.tmp

#For tracking what line a problem occurs on
linenumber=0

while read line; do
    ((linenumber+=1))

    #First set of lines are deleted
    if ["$linenumber" > 5] && ["$linenumber" < 30];then
	sed -i '/$linenumber/d'
    
    #Empty lines are deleted
    if ["$line"=""] || ["$line"="\n"];then
	sed -i '/$linenumber/d'

    #Beginning of VEVENT's or VALARMS are marked
    elif ["$line"="BEGIN:VEVENT"];then
	starteventkill=$linenumber
    elif ["$line"="BEGIN:VALARM"];then
	startalarmkill=$linenumber

    #Endings of VEVENT's or VALARM's are marked and deleted
    elif ["$line"="END:VEVENT"];then
	endeventkill=$linenumber
	sed -i '/$starteventkill,$endeventkill/d'
    elif ["$line"="END:VALARM"];then
	endalarmkill=$linenumber
	sed -i '/$startalarmkill,$endalarmkill/d'
    fi

#Outputs the Edits
cat $killall_work.tmp    
    
#Deletes the temporary file
rm "$killall_work.tmp"
