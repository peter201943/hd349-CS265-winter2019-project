#!/usr/bin/awk -f

#Peter Mangelsdorf
#Henry Dang
#Prof. Will Mongan
#CS 265
#Final Project

#clean2.awk
#Finds and removes extraneous strings from ical file and returns an, "ical_clean.ics" file.

#Save the file and exit, then make the script executable by issuing the command below:
#$ chmod +x script.awk
#Thereafter, run it:
#$ ./script.awk

#Beware Meta character: ^M


#Begin prints a statement to something (piped or command line)
BEGIN { FS=":" }




