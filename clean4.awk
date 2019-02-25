#!/usr/bin/awk -f

#Peter Mangelsdorf
#Henry Dang
#Prof. Will Mongan
#CS 265
#Final Project

#clean4.awk
#Finds and removes extraneous strings from ical file and prints it.

#Save the file and exit, then make the script executable by issuing the command below:
#$ chmod +x script.awk
#Thereafter, run it:
#$ ./scriptname.awk

#Beware Meta character: ^M

BEGIN
{
    FS = ":"
    RS = "
	"
	    
    #Find all Vevent Begin and End Line Numbers - Save to array
    #if($1=="/VEvent/"|cons )
    #match($1, /VAlarm/)
    #sub(/VAlarm/, "", )
    
    #if $1="VEVENT"; do
#			eventlines[i,j] = i*j

    #For each range of numbers, remove text (and newline)
#    for(line in eventlines)
	
	    file_lines[i,j] = i*j
	    if($1 != /VEvent/ && /VAlarm/)
		file_lines[i,j]
    
    
}
